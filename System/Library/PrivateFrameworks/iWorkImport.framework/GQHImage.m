@interface GQHImage
+ (int)handleFloatingImageBinary:(id)a3 geometry:(id)a4 style:(id)a5 cropGeometry:(id)a6 maskingShapePath:(id)a7 alphaMaskBezier:(CGPath *)a8 state:(id)a9;
+ (int)handleFloatingMedia:(id)a3 state:(id)a4;
+ (int)handleFloatingWebView:(id)a3 state:(id)a4;
+ (int)handleInlineImageBinary:(id)a3 geometry:(id)a4 cropGeometry:(id)a5 maskingShapePath:(id)a6 alphaMaskBezier:(CGPath *)a7 style:(id)a8 state:(id)a9;
+ (int)handleInlineMedia:(id)a3 state:(id)a4;
+ (int)handleInlineWebView:(id)a3 state:(id)a4;
+ (void)handleSimpleImageBinary:(id)a3 geometry:(id)a4 style:(id)a5 state:(id)a6;
+ (void)mapCropGeometry:(id)a3 bounds:(id)a4 style:(id)a5;
+ (void)mapMaskedImage:(id)a3 geometry:(id)a4 cropGeometry:(id)a5 maskingShapePath:(id)a6 alphaMaskBezier:(CGPath *)a7 graphicStyle:(id)a8 isFloating:(BOOL)a9 state:(id)a10;
@end

@implementation GQHImage

+ (int)handleFloatingMedia:(id)a3 state:(id)a4
{
  return objc_msgSend(a1, "handleFloatingImageBinary:geometry:style:cropGeometry:maskingShapePath:alphaMaskBezier:state:", objc_msgSend(a3, "imageBinary"), objc_msgSend(a3, "geometry"), objc_msgSend(a3, "graphicStyle"), objc_msgSend(a3, "cropGeometry"), objc_msgSend(a3, "maskingShapePath"), objc_msgSend(a3, "alphaMaskBezier"), a4);
}

+ (int)handleInlineMedia:(id)a3 state:(id)a4
{
  return objc_msgSend(a1, "handleInlineImageBinary:geometry:cropGeometry:maskingShapePath:alphaMaskBezier:style:state:", objc_msgSend(a3, "imageBinary"), objc_msgSend(a3, "geometry"), objc_msgSend(a3, "cropGeometry"), objc_msgSend(a3, "maskingShapePath"), objc_msgSend(a3, "alphaMaskBezier"), objc_msgSend(a3, "graphicStyle"), a4);
}

+ (int)handleFloatingWebView:(id)a3 state:(id)a4
{
  return objc_msgSend(a1, "handleFloatingImageBinary:geometry:style:cropGeometry:maskingShapePath:alphaMaskBezier:state:", objc_msgSend(a3, "imageBinary"), objc_msgSend(a3, "geometry"), objc_msgSend(a3, "graphicStyle"), 0, 0, 0, a4);
}

+ (int)handleInlineWebView:(id)a3 state:(id)a4
{
  return objc_msgSend(a1, "handleInlineImageBinary:geometry:cropGeometry:maskingShapePath:alphaMaskBezier:style:state:", objc_msgSend(a3, "imageBinary"), objc_msgSend(a3, "geometry"), 0, 0, 0, objc_msgSend(a3, "graphicStyle"), a4);
}

+ (void)mapCropGeometry:(id)a3 bounds:(id)a4 style:(id)a5
{
  if (a3)
  {
    [a3 position];
    double v9 = v8;
    [a4 position];
    float v11 = v9 - v10;
    [a3 position];
    double v13 = v12;
    [a4 position];
    *(float *)&double v13 = v13 - v14;
    [a3 size];
    float v16 = v15 + v11;
    [a3 size];
    *(float *)&double v17 = v17 + *(float *)&v13;
    CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"rect(%ldpx %ldpx %ldpx %ldpx)", llroundf(v11), llroundf(*(float *)&v17), llroundf(v16), llroundf(*(float *)&v13));
    [a5 addAttribute:@"clip" value:v18];
    CFRelease(v18);
  }
}

+ (void)mapMaskedImage:(id)a3 geometry:(id)a4 cropGeometry:(id)a5 maskingShapePath:(id)a6 alphaMaskBezier:(CGPath *)a7 graphicStyle:(id)a8 isFloating:(BOOL)a9 state:(id)a10
{
  if ((unint64_t)a5 | (unint64_t)a7)
  {
    id v16 = [a10 createUniqueShapeId:0];
    LOBYTE(v17) = a9;
    objc_msgSend(objc_msgSend(a10, "shapeContext"), "createMaskedImageWithId:geometry:imageBinary:cropGeometry:maskingShapePath:alphaMaskBezier:graphicStyle:isFloating:state:", v16, a4, a3, a5, a6, a7, a8, v17, a10);
    CFRelease(v16);
  }
}

+ (void)handleSimpleImageBinary:(id)a3 geometry:(id)a4 style:(id)a5 state:(id)a6
{
  id v10 = [a6 htmlDoc];
  [v10 startElement:"img"];
  float v11 = objc_alloc_init(GQHStyle);
  [a4 size];
  double v13 = v12;
  double v15 = v14;
  [a4 angle];
  int v17 = v16;
  id v18 = [a4 horizontalFlip];
  id v19 = [a4 verticalFlip];
  LODWORD(v20) = v17;
  +[GQHBounds mapSize:angle:flipX:flipY:srcGraphicStyle:style:state:](GQHBounds, "mapSize:angle:flipX:flipY:srcGraphicStyle:style:state:", v18, v19, a5, v11, a6, v13, v15, v20);
  +[GQHGraphicStyle mapStyle:a5 style:v11 state:a6];
  [(GQHStyle *)v11 setStyleOnCurrentNode:a6 mappingBaseStyleClass:a5 baseClassType:objc_opt_class()];

  CFURLRef v21 = (const __CFURL *)objc_msgSend(a3, "createAbsoluteUrlForState:", objc_msgSend(a6, "processorState"));
  [v10 setAttribute:"src" cfStringValue:CFURLGetString(v21)];
  if (v21) {
    CFRelease(v21);
  }
  [v10 endElement];
}

+ (int)handleFloatingImageBinary:(id)a3 geometry:(id)a4 style:(id)a5 cropGeometry:(id)a6 maskingShapePath:(id)a7 alphaMaskBezier:(CGPath *)a8 state:(id)a9
{
  id v16 = [a9 processorState];
  if (a3)
  {
    id v17 = [a3 createAbsoluteUrlForState:v16];
    if (v17)
    {
      id v18 = v17;
      if ((unint64_t)a6 | (unint64_t)a8)
      {
        [a9 enterGraphicObject];
        LOBYTE(v22) = 1;
        [a1 mapMaskedImage:a3 geometry:a4 cropGeometry:a6 maskingShapePath:a7 alphaMaskBezier:a8 graphicStyle:a5 isFloating:v22 state:a9];
        [a9 leaveGraphicObject];
      }
      else
      {
        id v19 = [a9 htmlDoc];
        [v19 startElement:"div"];
        double v20 = objc_alloc_init(GQHStyle);
        [(GQHStyle *)v20 addAttribute:off_9CF18 value:off_9CFA0];
        [a4 nonrotatedPosition];
        +[GQHBounds mapPosition:srcGraphicStyle:style:state:](GQHBounds, "mapPosition:srcGraphicStyle:style:state:", a5, v20, a9);
        [(GQHStyle *)v20 setStyleOnCurrentNode:a9];

        [a9 enterGraphicObject];
        [a1 handleSimpleImageBinary:a3 geometry:a4 style:a5 state:a9];
        [a9 leaveGraphicObject];
        [v19 endElement];
      }
      CFRelease(v18);
    }
  }
  return 1;
}

+ (int)handleInlineImageBinary:(id)a3 geometry:(id)a4 cropGeometry:(id)a5 maskingShapePath:(id)a6 alphaMaskBezier:(CGPath *)a7 style:(id)a8 state:(id)a9
{
  id v16 = [a9 processorState];
  if (a3)
  {
    id v17 = [a3 createAbsoluteUrlForState:v16];
    if (v17)
    {
      id v18 = v17;
      [a9 enterGraphicObject];
      if ((unint64_t)a5 | (unint64_t)a7)
      {
        LOBYTE(v20) = 0;
        [a1 mapMaskedImage:a3 geometry:a4 cropGeometry:a5 maskingShapePath:a6 alphaMaskBezier:a7 graphicStyle:a8 isFloating:v20 state:a9];
      }
      else
      {
        [a1 handleSimpleImageBinary:a3 geometry:a4 style:a8 state:a9];
      }
      [a9 leaveGraphicObject];
      CFRelease(v18);
    }
  }
  return 1;
}

@end