<!DOCTYPE html>
<html lang="en">
<head>
<#assign title="修改商品信息">
<#include "../common/head.ftl"/>
    <style>
        #accordion-styled-group3 img{
            max-width: 200px;
            border-radius: 50%;
            margin-right: 5px;
        }
        .p-unit-id,.s-unit-id,.p-unit-value,.s-unit-value{
            display: inline-block;
            width: 73px;
            height: 30px;
        }
    </style>
</head>
<body>
<#include "../common/top.ftl"/>
<div class="page-container">

    <div class="page-content">
    <#assign menuType="goodsInfo">
    <#include "../common/menu.ftl"/>
        <div class="content-wrapper">
            <div class="content">
                <form action="${basePath}/admin/goodsInfo/updateIng" method="post" enctype="multipart/form-data">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="panel">
                            <div class="panel-heading bg-primary">
                                <h6 class="panel-title">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion-styled" href="#accordion-styled-group3">修改商品信息</a>
                                </h6>
                            </div>
                            <div id="accordion-styled-group3" class="panel-collapse">
                                <div class="panel-body">
                                    <div class="row col-xs-12" style="margin-top: 10px;">
                                        <input name="id" value="${goodsInfo.id!}" style="display: none">
                                        <input id="type" name="type" value="1" style="display: none">
                                        <input name="imgUrl" value="${goodsInfo.imgUrl!}" style="display: none">
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">中文名称</label>
                                            <label class="col-xs-10">
                                                <input type="text" name="chName" value="${goodsInfo.chName!}" class="form-control" placeholder="中文名称">
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">英文名称</label>
                                            <label class="col-xs-10">
                                                <input type="text" name="enName" value="${goodsInfo.enName!}" class="form-control" placeholder="英文名称">
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">单位换算</label>
                                            <label class="col-xs-10" style="font-size: 13px">
                                                <#if unitInfoList??>
                                                    主单位
                                                    <input type="number" id="unitPrVal" name="unitPrVal" value="${goodsInfo.unitPrVal!}" class="form-control p-unit-value" >
                                                    <select class="p-unit-id form-control" id="uiidPr" name="uiidPr" to="#pUnitValue">
                                                        <#list unitInfoList as uil>
                                                            <#if uil.type==1>
                                                                <option value="${uil.id!}" <#if goodsInfo.uiidPr??&&uil.id==goodsInfo.uiidPr>selected="selected"</#if>>${uil.name!}</option>
                                                            </#if>
                                                        </#list>
                                                    </select>
                                                    =
                                                    辅单位
                                                    <input type="number" id="unitPeVal" name="unitPeVal" value="${goodsInfo.unitPeVal!}" class="form-control s-unit-value" >
                                                    <select class="s-unit-id form-control" id="uiidPe" name="uiidPe" to="#sUnitValue">
                                                        <#list unitInfoList as uil>
                                                            <#if uil.type==2>
                                                                <option value="${uil.id!}" <#if goodsInfo.uiidPe??&&uil.id==goodsInfo.uiidPe>selected="selected"</#if>>${uil.name!}</option>
                                                            </#if>
                                                        </#list>
                                                    </select>
                                                    <a class="btn btn-primary" id="confirm-unit">确定</a>
                                                </#if>
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">采购成本</label>
                                            <label class="col-xs-10">
                                                <input style="width: 141px;display: inline-block;" type="number" id="price" name="price" value="${goodsInfo.price!}" class="form-control" placeholder="参考价格(主)">
                                                peso<span class="unit-1"></span>
                                                &nbsp;
                                                <input style="width: 141px;display: inline-block;" type="number" id="priceSe" name="priceSe" value="${goodsInfo.priceSe!}" class="form-control" placeholder="参考价格(辅)">
                                                peso<span class="unit-2"></span>
                                                <a class="btn btn-primary" id="conversion">换算</a>
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">批发价格</label>
                                            <label class="col-xs-10">
                                                <input style="width: 141px;display: inline-block;" type="number" id="tradePrice" name="tradePrice" value="${goodsInfo.tradePrice!}" class="form-control" placeholder="批发价格(主)">
                                                peso<span class="unit-1"></span>
                                                &nbsp;
                                                <input style="width: 141px;display: inline-block;" type="number" id="tradePriceSe" name="tradePriceSe" value="${goodsInfo.tradePriceSe!}" class="form-control" placeholder="批发价格(辅)">
                                                peso<span class="unit-2"></span>
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">零售价格</label>
                                            <label class="col-xs-10">
                                                <input style="width: 141px;display: inline-block;" type="number" id="retailPrice" name="retailPrice" value="${goodsInfo.retailPrice!}" class="form-control" placeholder="零售价格(主)">
                                                peso<span class="unit-1"></span>
                                                &nbsp;
                                                <input style="width: 141px;display: inline-block;" type="number" id="retailPriceSe" name="retailPriceSe" value="${goodsInfo.retailPriceSe!}" class="form-control" placeholder="零售价格(辅)">
                                                peso<span class="unit-2"></span>
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">应用单位</label>
                                            <label class="col-xs-10">
                                                <select name="unitType" class="form-control">
                                                    <option value="1" <#if goodsInfo.unitType??&&goodsInfo.unitType==1>selected="selected"</#if>>主</option>
                                                    <option value="2" <#if goodsInfo.unitType??&&goodsInfo.unitType==2>selected="selected"</#if>>辅</option>
                                                </select>
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">利润率</label>
                                            <label class="col-xs-10">
                                                <input type="text" name="percentage" value="${goodsInfo.percentage!}" class="form-control" placeholder="利润率">
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">额外费用</label>
                                            <label class="col-xs-10">
                                                <input type="text" name="extraCosts" value="${goodsInfo.extraCosts!}" class="form-control" placeholder="额外费用">
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">一级分类</label>
                                            <label class="col-xs-10">
                                                <select name="goid" class="form-control">
                                                    <#if goodsOneTypeList??>
                                                        <#list goodsOneTypeList as myn>
                                                            <option value="${myn.id!}" <#if myn.id==goodsInfo.goid>selected</#if>>${myn.name!}</option>
                                                        </#list>
                                                    </#if>
                                                </select>
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">二级分类</label>
                                            <label class="col-xs-10">
                                                <select name="gtid" class="form-control">
                                                    <#if goodsTowTypeList??>
                                                        <option value="-1">无</option>
                                                        <#list goodsTowTypeList as myn>
                                                            <option value="${myn.id!}" <#if myn.id==goodsInfo.gtid>selected</#if>>${myn.name!}</option>
                                                        </#list>
                                                    </#if>
                                                </select>
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">供应商</label>
                                            <label class="col-xs-10">
                                                <select name="siid" class="form-control">
                                                    <#if supplierInfoList??>
                                                        <#list supplierInfoList as myn>
                                                            <option value="${myn.id!}" <#if goodsInfo.siid??&&myn.id==goodsInfo.siid>selected</#if>>${myn.name!}</option>
                                                        </#list>
                                                    </#if>
                                                </select>
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">图片</label>
                                            <label class="col-xs-10">
                                                <img src="${aliyunOos!}${goodsInfo.imgUrl!}" />
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-2">修改图片文件</label>
                                            <label class="col-xs-10">
                                                <input type="file" name="file" class="form-control" placeholder="图片文件">
                                            </label>
                                        </div>
                                        <div class="col-xs-12" style="margin-top: 20px;">
                                            <label class="col-xs-6"><button type="submit" class="btn btn-primary" style="width: 100%;">修改</button></label>
                                            <label class="col-xs-6"><button onclick="addInfo()" class="btn btn-primary" style="width: 100%;">新增</button></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </form>
            <#include "../common/foot.ftl"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>
    var unitCf = false;
    $("#conversion").unbind("click").click(function(){
        var price = $("#price").val();
        var priceSe = $("#priceSe").val();
        var tradePrice = $("#tradePrice").val();
        var tradePriceSe = $("#tradePriceSe").val();
        var retailPrice = $("#retailPrice").val();
        var retailPriceSe = $("#retailPriceSe").val();

        var unitPrVal = $("#unitPrVal").val();
        var unitPeVal = $("#unitPeVal").val();

        var cvPrice = 0;
        var cvTradePrice = 0;
        var cvRetailPrice = 0;

        if(price&&price>0){
            if(unitPrVal>=unitPeVal){
                cvPrice = price*unitPrVal;
                $("#priceSe").val(cvPrice);
            }else{
                cvPrice = price/unitPeVal;
                $("#priceSe").val(cvPrice);
            }
        }else if(priceSe&&priceSe>0){
            if(unitPrVal>=unitPeVal){
                cvPrice = priceSe/unitPrVal;
                $("#price").val(cvPrice);
            }else{
                cvPrice = priceSe*unitPeVal;
                $("#price").val(cvPrice);
            }
        }

        if(tradePrice&&tradePrice>0){
            if(unitPrVal>=unitPeVal){
                cvTradePrice = tradePrice*unitPrVal;
                $("#tradePriceSe").val(cvTradePrice);
            }else{
                cvTradePrice = tradePrice/unitPeVal;
                $("#tradePriceSe").val(cvTradePrice);
            }
        }else if(tradePriceSe&&tradePriceSe>0){
            if(unitPrVal>=unitPeVal){
                cvTradePrice = tradePriceSe/unitPrVal;
                $("#tradePrice").val(cvTradePrice);
            }else{
                cvTradePrice = tradePriceSe*unitPeVal;
                $("#tradePrice").val(cvTradePrice);
            }
        }

        if(retailPrice&&retailPrice>0){
            if(unitPrVal>=unitPeVal){
                cvRetailPrice = retailPrice*unitPrVal;
                $("#retailPriceSe").val(cvRetailPrice);
            }else{
                cvRetailPrice = retailPrice/unitPeVal;
                $("#retailPriceSe").val(cvRetailPrice);
            }
        }else if(retailPriceSe&&retailPriceSe>0){
            if(unitPrVal>=unitPeVal){
                cvRetailPrice = retailPriceSe/unitPrVal;
                $("#retailPrice").val(cvRetailPrice);
            }else{
                cvRetailPrice = retailPriceSe*unitPeVal;
                $("#retailPrice").val(cvRetailPrice);
            }
        }
    });
    $("#confirm-unit").unbind("click").click(function(){
        layer.msg('单位已确定');
        unitCf = true;
    });
    $("#price,#priceSe,#tradePrice,#tradePriceSe,#retailPrice,#retailPriceSe").bind('input propertychange', function() {
        if(!unitCf){
            return;
        }
        var thisDom = $(this);
        var name = thisDom.attr("name");
        var price = $("#price").val();
        var priceSe = $("#priceSe").val();
        var tradePrice = $("#tradePrice").val();
        var tradePriceSe = $("#tradePriceSe").val();
        var retailPrice = $("#retailPrice").val();
        var retailPriceSe = $("#retailPriceSe").val();

        var unitPrVal = $("#unitPrVal").val();
        var unitPeVal = $("#unitPeVal").val();

        var cvPrice = 0;
        var cvTradePrice = 0;
        var cvRetailPrice = 0;

        if(name=="price"){
            if(unitPrVal>=unitPeVal){
                cvPrice = price*unitPrVal;
                $("#priceSe").val(cvPrice);
            }else{
                cvPrice = price/unitPeVal;
                $("#priceSe").val(cvPrice);
            }
        }

        if(name=="priceSe"){
            if(unitPrVal>=unitPeVal){
                cvPrice = priceSe/unitPrVal;
                $("#price").val(cvPrice);
            }else{
                cvPrice = priceSe*unitPeVal;
                $("#price").val(cvPrice);
            }
        }

        if(name=="tradePrice"){
            if(unitPrVal>=unitPeVal){
                cvTradePrice = tradePrice*unitPrVal;
                $("#tradePriceSe").val(cvTradePrice);
            }else{
                cvTradePrice = tradePrice/unitPeVal;
                $("#tradePriceSe").val(cvTradePrice);
            }
        }

        if(name=="tradePriceSe"){
            if(unitPrVal>=unitPeVal){
                cvTradePrice = tradePriceSe/unitPrVal;
                $("#tradePrice").val(cvTradePrice);
            }else{
                cvTradePrice = tradePriceSe*unitPeVal;
                $("#tradePrice").val(cvTradePrice);
            }
        }

        if(name=="retailPrice"){
            if(unitPrVal>=unitPeVal){
                cvRetailPrice = retailPrice*unitPrVal;
                $("#retailPriceSe").val(cvRetailPrice);
            }else{
                cvRetailPrice = retailPrice/unitPeVal;
                $("#retailPriceSe").val(cvRetailPrice);
            }
        }

        if(name=="retailPriceSe"){
            if(unitPrVal>=unitPeVal){
                cvRetailPrice = retailPriceSe/unitPrVal;
                $("#retailPrice").val(cvRetailPrice);
            }else{
                cvRetailPrice = retailPriceSe*unitPeVal;
                $("#retailPrice").val(cvRetailPrice);
            }
        }
    });
    function showUnitText(){
        // var unitPrVal = $("input[name='unitPrVal']").val();
        var uiidPr = $("#uiidPr option:selected").text();
        // var unitPeVal = $("input[name='unitPeVal']").val();
        var uiidPe = $("#uiidPe option:selected").text();
        $(".unit-1").text("/"+uiidPr);
        $(".unit-2").text("/"+uiidPe);
    }
    showUnitText();
    function unitChange(){
        $("#unitPrVal,#unitPeVal").bind('input propertychange', function() {
            showUnitText();
        });
        $("#uiidPr,#uiidPe").change(function(){
            showUnitText();
        });
    }
    unitChange();
    function addInfo(){
        $("#type").val(2);
        $("form").submit();
    }
    <#if msgInfo??>
    layer.msg("${msgInfo}");
    </#if>
</script>


