@interface GQHChart
+ (__CFData)renderChart:(id)a3;
+ (__CFString)createChartImageUrlString:(id)a3 state:(id)a4;
+ (char)pdfId:(id)a3;
+ (id)geometry:(id)a3;
+ (int)handleFloatingChart:(id)a3 state:(id)a4;
+ (int)handleInlineChart:(id)a3 state:(id)a4;
+ (int)handleInlineChart:(id)a3 state:(id)a4 imageUrl:(__CFString *)a5;
@end

@implementation GQHChart

+ (char)pdfId:(id)a3
{
  return (char *)[a3 uid];
}

+ (id)geometry:(id)a3
{
  return [a3 geometry];
}

+ (int)handleFloatingChart:(id)a3 state:(id)a4
{
  id v7 = objc_msgSend(a1, "createChartImageUrlString:state:");
  if (!v7) {
    return 1;
  }
  v8 = v7;
  id v9 = [a4 htmlDoc];
  [v9 startElement:"div"];
  v10 = objc_alloc_init(GQHStyle);
  [(GQHStyle *)v10 addAttribute:off_9CF18 value:off_9CFA0];
  objc_msgSend(objc_msgSend(a1, "geometry:", a3), "position");
  +[GQHBounds mapPosition:srcGraphicStyle:style:state:](GQHBounds, "mapPosition:srcGraphicStyle:style:state:", 0, v10, a4);
  [(GQHStyle *)v10 setStyleOnCurrentNode:a4];

  int v11 = [a1 handleInlineChart:a3 state:a4 imageUrl:v8];
  [v9 endElement];
  CFRelease(v8);
  return v11;
}

+ (int)handleInlineChart:(id)a3 state:(id)a4
{
  return [a1 handleInlineChart:a3 state:a4 imageUrl:0];
}

+ (__CFData)renderChart:(id)a3
{
  return (__CFData *)sub_46E3C(a3);
}

+ (__CFString)createChartImageUrlString:(id)a3 state:(id)a4
{
  id v7 = objc_msgSend(a1, "renderChart:");
  if (!v7) {
    return 0;
  }
  v8 = v7;
  id v9 = (const char *)[a1 pdfId:a3];
  if (v9 && *v9)
  {
    v10 = strdup(v9);
    size_t v11 = strlen(v10);
    if (v11)
    {
      v12 = v10;
      do
      {
        if (*v12 == 58) {
          char *v12 = 45;
        }
        ++v12;
        --v11;
      }
      while (v11);
    }
    v13 = (__CFString *)sub_47048((uint64_t)v8, objc_msgSend(objc_msgSend(a4, "processorState"), "outputBundle"), (uint64_t)v10);
    free(v10);
  }
  else
  {
    v13 = 0;
  }
  CFRelease(v8);
  return v13;
}

+ (int)handleInlineChart:(id)a3 state:(id)a4 imageUrl:(__CFString *)a5
{
  id v9 = a5;
  if (a5 || (id v9 = (__CFString *)[a1 createChartImageUrlString:a3 state:a4]) != 0)
  {
    id v10 = [a4 htmlDoc];
    [a4 enterGraphicObject];
    [v10 startElement:"img"];
    size_t v11 = objc_alloc_init(GQHStyle);
    objc_msgSend(objc_msgSend(a1, "geometry:", a3), "size");
    +[GQHBounds mapSize:angle:srcGraphicStyle:style:state:](GQHBounds, "mapSize:angle:srcGraphicStyle:style:state:", 0, v11, a4);
    [(GQHStyle *)v11 setStyleOnCurrentNode:a4];

    [v10 setAttribute:"src" cfStringValue:v9];
    [v10 endElement];
    [a4 leaveGraphicObject];
    if (!a5) {
      CFRelease(v9);
    }
  }
  return 1;
}

@end