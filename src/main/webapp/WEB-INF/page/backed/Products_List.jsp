<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${sod}/staticfile/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${sod}/staticfile/back/css/style.css"/>
    <link href="${sod}/staticfile/back/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${sod}/staticfile/back/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${sod}/staticfile/back/assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="${sod}/staticfile/back/assets/js/jquery.min.js"></script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <![endif]-->

    <!--[if !IE]> -->

    <script type="text/javascript">
        window.jQuery || document.write("<script src='${sod}/staticfile/back/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
    </script>
    <![endif]-->

    <script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='${sod}/staticfile/back/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <script src="${sod}/staticfile/back/assets/js/bootstrap.min.js"></script>
    <script src="${sod}/staticfile/back/assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="${sod}/staticfile/back/assets/js/jquery.dataTables.min.js"></script>
    <script src="${sod}/staticfile/back/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${sod}/staticfile/back/js/H-ui.js"></script>
    <script type="text/javascript" src="${sod}/staticfile/back/js/H-ui.admin.js"></script>
    <script src="${sod}/staticfile/back/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="${sod}/staticfile/back/assets/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
           var arr=[]
           $("input[name='delete']").click(function () {
               $("input[name='pId']:checked").each (function () {
                   arr.push($(this).val());
               });
               $("input[name='prodId']").val(arr);
           });
        });
    </script>
    <title>商品列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">

     <form action="/prodMge/delete" method="post">
        <div class="border clearfix">
       <span class="l_f">
        <a href="/prodMge/addProd" title="添加商品" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</a>
           <input type="submit" name="delete" class="btn btn-danger" value="批量删除" /><i class="icon-trash"></i></span>
       </span>
          <!--  <span class="r_f">共：<b>2334</b>件商品</span>-->
        </div>
        <div class="d_Confirm_Order_style">
            <!---->
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" onclick="checkAll('prodId',this)" class="ace"><span class="lbl"></span></label></th>
                        <th width="80">序号</th>
                        <th width="100">商品名称</th>
                        <th width="80">商品类型</th>
                        <th width="120">商品价格</th>
                        <th width="120">商品库存</th>
                        <th width="150">商品介绍</th>
                        <th width="180">状态</th>
                        <th width="100">操作</th>


                    </tr>
                    <tr hidden="hidden">
                         <td><input name="prodId" type="text"/></td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="UI" value=""></c:set>
                    <c:forEach items="${productList}" var="p" varStatus="status">
                        <tr>
                            <td><label><input type="checkbox" name="pId" value="${p.prodId}" class="ace"><span class="lbl"></span></label></td>
                            <td>${status.index+1}</td>
                            <td><u style="cursor:pointer" class="text-primary">${p.prodName}</u></td>
                            <td>${p.prodType}</td>
                            <td>${p.prodPrice}</td>
                            <td>${p.prodNum}</td>
                            <td>${p.prodDes}</td>
                            <td class="td-status" >
                                <c:if test="${p.prodState ==1}"><span class="label label-success radius"><a href="/prodMge/toStop?prodId=${p.prodId}"><font color="white">已启用</font></a></span></c:if>
                                <c:if test="${p.prodState ==0}"><span class="label label-defaunt radius"><a href="/prodMge/toStart?prodId=${p.prodId}"><font color="white">已停用</font></a></span></c:if>
                            </td>
                            <td class="td-manage">
                                <a title="编辑" href="/prodMge/toUpdate?prodId=${p.prodId}"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a>
                                <a title="删除" href="/prodMge/delete?prodId=${p.prodId}"  class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
     </form>
    </div>
</div>
<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
    <ul class=" page-content">
        <li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input name="username" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
        <li><label class="label_name">真实姓名：</label><span class="add_name"><input name="realName" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
        <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
     <label><input name="gender" value="男" type="radio" /><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="gender" value="女" type="radio" /><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
     </span>
            <div class="prompt r_f"></div>
        </li>
        <li><label class="label_name">手机号码：</label><span class="add_name"><input name="telephone" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
        <%--<li class="adderss"><label class="label_name">收货地址：</label><span class="add_name"><input name="家庭住址" type="text"  class="text_add" style=" width:350px"/></span><div class="prompt r_f"></div></li>--%>
        <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
     <label><input name="state" type="radio" value="1"/><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="state"type="radio" value="0"/><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>
    </ul>
</div>
</body>
</html>
<script>

    jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable( {
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
            ] } );


        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    })

    /*用户-查看*/
    function member_show(title,url,id,w,h){
        layer_show(title,url+'#?='+id,w,h);
    }


    /*用户-编辑*/
    function member_edit(id){
        layer.open({
            type: 1,
            title: '修改商品信息',
            maxmin: true,
            shadeClose:false, //点击遮罩关闭层
            area : ['800px' , ''],
            content:$('#add_menber_style'),
            btn:['提交','取消'],
            yes:function(index,layero){
                var num=0;
                var str="";
                $(".add_menber input[type$='text']").each(function(n){
                    if($(this).val()=="")
                    {

                        layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                            title: '提示框',
                            icon:0,
                        });
                        num++;
                        return false;
                    }
                });
                if(num>0){  return false;}
                else{
                    var userInfo="action" ;
                    $(".text_add").each(function () {
                        userInfo = userInfo + ","+ $(this).val();
                    });
                    var gender = $("input[name='gender']:checked").val();
                    var state = $("input[name='state']:checked").val();

                    $.post("{sod}/prodMge/updateUser",{"userInfo":userInfo,"gender":gender,"state":state,"userId":id});
                    layer.alert('添加成功！',{
                        title: '提示框',
                        icon:1,
                    });

                    /*layer.alert('添加成功！',{
                        title: '提示框',
                        icon:1,
                    });*/
                    layer.close(index);
                }
            }
        });
    }

</script>