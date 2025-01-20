@interface GQHShape
+ (int)handleShape:(id)a3 isFloating:(BOOL)a4 state:(id)a5;
+ (void)mapPath:(id)a3 shapeContext:(id)a4 state:(id)a5;
@end

@implementation GQHShape

+ (int)handleShape:(id)a3 isFloating:(BOOL)a4 state:(id)a5
{
  v8 = (const CGPath *)objc_msgSend(objc_msgSend(a3, "path"), "createBezierPath");
  if (v8)
  {
    v9 = v8;
    [a5 enterGraphicObject];
    id v10 = [a5 shapeContext];
    id v11 = [a3 geometry];
    id v12 = [a3 graphicStyle];
    [v11 angle];
    float v14 = (float)(360.0 - v13) * 3.14159265 / 180.0;
    Mutable = CGPathCreateMutable();
    memset(&m, 0, sizeof(m));
    CGAffineTransformMakeRotation(&m, v14);
    CGPathAddPath(Mutable, &m, v9);
    BoundingBodouble x = CGPathGetBoundingBox(Mutable);
    double x = BoundingBox.origin.x;
    double y = BoundingBox.origin.y;
    double width = BoundingBox.size.width;
    double height = BoundingBox.size.height;
    CFRelease(Mutable);
    CFRelease(v9);
    float v20 = width;
    uint64_t v21 = llroundf(v20);
    float v22 = height;
    uint64_t v23 = llroundf(v22);
    id v24 = [a5 htmlDoc];
    v25 = v24;
    if (a4)
    {
      id v26 = [a5 createUniqueShapeId:0];
      objc_msgSend(v10, "createShapeWithId:path:geometry:graphicStyle:isFloating:state:", v26, objc_msgSend(a3, "path"), v11, v12, 1, a5);
      CFRelease(v26);
    }
    else
    {
      v43 = v10;
      [v24 startElement:"span"];
      uint64_t v44 = 0;
      if ([v12 hasValueForObjectProperty:72 value:&v44] && v44)
      {
        v27 = objc_alloc_init(GQHStyle);
        +[GQHGraphicStyle mapExternalWrap:v44 style:v27 state:a5];
        [(GQHStyle *)v27 setStyleOnCurrentNode:a5];
      }
      [v25 startElement:"div"];
      v28 = objc_alloc_init(GQHStyle);
      [(GQHStyle *)v28 addAttribute:off_9CE60 value:off_9D000];
      [(GQHStyle *)v28 addAttribute:off_9CEE8 value:off_9CFE8];
      +[GQHBounds mapSize:angle:srcGraphicStyle:style:state:](GQHBounds, "mapSize:angle:srcGraphicStyle:style:state:", 0, v28, a5, width, height, 0.0);
      [(GQHStyle *)v28 setStyleOnCurrentNode:a5];

      [v25 startElement:"div"];
      v29 = objc_alloc_init(GQHStyle);
      [(GQHStyle *)v29 addAttribute:off_9CF18 value:off_9CFA0];
      +[GQHBounds mapSize:angle:srcGraphicStyle:style:state:](GQHBounds, "mapSize:angle:srcGraphicStyle:style:state:", 0, v29, a5, width, height, 0.0);
      [(GQHStyle *)v29 setStyleOnCurrentNode:a5];

      id v30 = [a5 createUniqueShapeId:0];
      objc_msgSend(v43, "createShapeWithId:path:geometry:graphicStyle:isFloating:state:", v30, objc_msgSend(a3, "path"), v11, v12, 0, a5);
      CFRelease(v30);
      [v25 endElement];
    }
    [v11 position];
    CGFloat v32 = v31;
    [v11 position];
    CGFloat v34 = v33;
    [v11 size];
    CGFloat v36 = v35;
    [v11 size];
    CGFloat v38 = v37;
    v39 = CGPathCreateMutable();
    v47.origin.double x = v32;
    v47.origin.double y = v34;
    v47.size.double width = v36;
    v47.size.double height = v38;
    CGPathAddRect(v39, &m, v47);
    CGRect v48 = CGPathGetBoundingBox(v39);
    double v40 = v48.size.width;
    double v41 = v48.size.height;
    CGPathRelease(v39);
    if (a4)
    {
      +[GQHTextBox handleShapeText:boundsRect:floating:state:](GQHTextBox, "handleShapeText:boundsRect:floating:state:", a3, 1, a5, -x, -y, (double)v21, (double)v23);
    }
    else
    {
      +[GQHTextBox handleShapeText:boundsRect:floating:state:](GQHTextBox, "handleShapeText:boundsRect:floating:state:", a3, 0, a5, (v40 - (double)v21) * 0.5 - x, (v41 - (double)v23) * 0.5 - y, (double)v21, (double)v23);
      [v25 endElement];
      [v25 endElement];
    }
    [a5 leaveGraphicObject];
  }
  return 1;
}

+ (void)mapPath:(id)a3 shapeContext:(id)a4 state:(id)a5
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [a3 pathStr];
    [a4 setBezierPath:v8 state:a5];
  }
}

@end