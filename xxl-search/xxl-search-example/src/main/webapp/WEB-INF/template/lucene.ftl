<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lucene</title>
</head>

<body>
<input type="button" id="init" value="生成索引库文件"/>
<hr>
<input type="input" id="content" value="文章内容666" />
<input type="button" id="search" value="查询"/>
<hr>
<div id="result"><div>
</body>

<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
    $(function(){

        $("#init").click(function(){
            $.ajax({
                url:"/lucene/init",
                success:function(data){
                    if (data == 'S') {
                        alert('生成索引库文件成功');
                    } else if (data == 'E') {
                        alert('生成索引库文件失败');
                    }
                }
            });
        });

        $("#search").click(function(){
            $.ajax({
                type:'post',
                url:"lucene/search",
                data:{
                    'content':$("#content").val()
                },
                success:function(data){
                    if (data) {
                        $("#result").html(data);
                    } else {
                        $("#result").html("空");
                    }
                }
            });

        });

    });
</script>
</html>