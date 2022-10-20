# DaliyPicture
bing的每日例图

### 接口 

https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN

1. format（非必需）返回数据格式，不存在返回xml格式
    js (返回json格式，一般使用这个)
    xml（返回xml格式
   
2. idx（非必需） 请求图片截止天数
   0 今天
   -1 截止至明天（预准备的）
   1 截止至昨天，类推（目前最多获取到16天前的图片）
   
3. n（必需）1-8 返回请求数量，目前最多一次获取8张

4. mkt（非必需） 地区 zh-CN

Response Sample

```json
{
  "images": [
    {
      "startdate": "20221019",
      "fullstartdate": "202210191600",
      "enddate": "20221020",
      "url": "/th?id=OHR.SlothDay_ZH-CN4945330735_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp",
      "urlbase": "/th?id=OHR.SlothDay_ZH-CN4945330735",
      "copyright": "塔拉曼卡旧港的霍氏树懒母子，哥斯达黎加 (© Suzi Eszterhas/Minden Pictures)",
      "copyrightlink": "https://www.bing.com/search?q=%E9%9C%8D%E6%B0%8F%E6%A0%91%E6%87%92&FORM=hpcapt&mkt=zh-cn",
      "title": "到哪都挂着",
      "quiz": "/search?q=Bing+homepage+quiz&filters=WQOskey:%22HPQuiz_20221019_SlothDay%22&FORM=HPQUIZ",
      "wp": true,
      "hsh": "5bed68102e2330222aeaed3b7ed089e1",
      "drk": 1,
      "top": 1,
      "bot": 1,
      "hs": []
    }
  ],
  "tooltips": {
    "loading": "正在加载...",
    "previous": "上一个图像",
    "next": "下一个图像",
    "walle": "此图片不能下载用作壁纸。",
    "walls": "下载今日美图。仅限用作桌面壁纸。"
  }
}
```
