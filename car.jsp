<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
</head>
<style type="text/css">
    table{
        margin: 0 auto;
    }
    body{
        font-size: larger;color: crimson;
        background-image: url(img/2.jpg);
        background-repeat: no-repeat;
        background-size: 100%;
    }
    table th,table td{
    }
</style>
<body >
<table border="1" >
    <tr>
        <th>商品</th>
        <th  >单价</th>
        <th>颜色</th>
        <th>库存</th>
        <th>操作</th>
    </tr>
    <tr>
        <td>面膜</td>
        <td  >150</td>
        <td>白色</td>
        <td>100</td>
        <td align="center">
            <input type="button" value="加入购物车" onclick="add_shoppingcar(this)"/>
        </td>
    </tr>
    <tr>
        <td>口红</td>
        <td  >350</td>
        <td>白色</td>
        <td>166</td>
        <td align="center">
            <input type="button" value="加入购物车" onclick="add_shoppingcar(this)"/>
        </td>
    </tr>
    <tr>
        <td>鼠标</td>
        <td >150</td>
        <td>黑色</td>
        <td>99</td>
        <td align="center">
            <input type="button" value="加入购物车" onclick="add_shoppingcar(this)"/>
        </td>
    </tr>
    <tr>
        <td>键盘</td>
        <td  >120</td>
        <td>黑色</td>
        <td>50</td>
        <td align="center">
            <input type="button" value="加入购物车" onclick="add_shoppingcar(this)"/>
        </td>
    </tr>
</table>
<table border="1">
    <thead>
    <tr>
        <th>商品</th>
        <th >单价</th>
        <th>数量</th>
        <th>金额</th>
        <th>删除</th>
    </tr>
    </thead>
    <tbody id="goods">
    </tbody>
    <tfoot>
    <tr>
        <td colspan="3" align="center" >总计</td>
        <td id="total"></td>
        <td>元</td>
    </tr>
    </tfoot>
</table>
</body>
<script type="text/javascript">
    function add_shoppingcar(btn){
        var tr=btn.parentNode.parentNode;
        var tds=tr.getElementsByTagName("td");
        var name=tds[0].innerHTML;
        var price=tds[1].innerHTML;
        var tbody=document.getElementById("goods");
        var row=tbody.insertRow();
        row.innerHTML="<td>"+name+"</td>"+
            "<td>"+price+"</td>"+
            "<td align='center'>"+
            "<input type='button' value='-' id='jian'  onclick='change(this,-1)'  />"+
            "<input id='text' type='text' size='1' value='1' readonly='readonly' />"+
            "<input type='button' value='+' id='add'  onclick='change(this,1)'  />"+
            "</td>"+
            "<td>"+price+"</td>"+
            "<td align='center'>"+
            "<input type='button' value='X' onclick='del(this)'/>"+
            "</td>"+
            "</tr>"
        total();
    }
    function change(btn,n){
        var inputs = btn.parentNode.getElementsByTagName("input");
        var amount = parseInt(inputs[1].value);
        if(amount<=1 && n<0){
            return;
        }
        inputs[1].value = amount + n;
        amount = inputs[1].value;
        var tr = btn.parentNode.parentNode;
        var tds = tr.getElementsByTagName("td");
        var price = parseFloat(tds[1].innerHTML);
        var m = price * amount;
        tds[3].innerHTML = m;
        total();
    }
    function total(){
        var tbody=document.getElementById("goods");
        var trs=tbody.getElementsByTagName("tr");
        var sum=0;
        for(var i=0;i<trs.length;i++){
            var tds=trs[i].getElementsByTagName("td");
            var m=tds[3].innerHTML;
            sum += parseFloat(m);
        }
        var total=document.getElementById("total");
        total.innerHTML = sum;
    }
    function del(i){
        var tr=i.parentNode.parentNode;
        tr.parentNode.removeChild(tr);
        total();
    }
</script>
<html>