@interface GQHCanvasContext
- (GQHPathEndPointInfo)endPointInfoForPath:(SEL)a3;
- (float)strokeWidthWithGraphicStyle:(id)a3;
- (id)strokeColorWithGraphicStyle:(id)a3;
- (void)addPathForLineEndStyle:(int)a3 graphicStyle:(id)a4 atPoint:(CGPoint)a5 neighboringCP:(CGPoint)a6 filledPath:(CGPath *)a7 strokedPath:(CGPath *)a8;
- (void)addScriptTagToHtml:(id)a3 state:(id)a4;
- (void)createMaskedImageWithId:(__CFString *)a3 geometry:(id)a4 imageBinary:(id)a5 cropGeometry:(id)a6 maskingShapePath:(id)a7 alphaMaskBezier:(CGPath *)a8 graphicStyle:(id)a9 isFloating:(BOOL)a10 state:(id)a11;
- (void)createShapeWithId:(__CFString *)a3 path:(id)a4 geometry:(id)a5 graphicStyle:(id)a6 isFloating:(BOOL)a7 state:(id)a8;
- (void)dealloc;
- (void)mapFill:(id)a3 state:(id)a4;
- (void)mapLineEndFillStyle:(id)a3 state:(id)a4;
- (void)mapLineEndStrokeStyle:(id)a3 state:(id)a4;
- (void)mapStroke:(id)a3 state:(id)a4;
- (void)mapStyle:(id)a3 state:(id)a4;
- (void)setBezierPath:(char *)a3 state:(id)a4;
- (void)setCGPath:(CGPath *)a3 state:(id)a4;
- (void)setContextOpacity:(float)a3 state:(id)a4;
- (void)setFillColor:(id)a3 state:(id)a4;
- (void)setGradient:(id)a3 state:(id)a4;
- (void)setImageFill:(__CFURL *)a3 srcSize:(CGSize)a4 mode:(int)a5 state:(id)a6;
- (void)setStrokeColor:(id)a3 width:(float)a4 state:(id)a5;
- (void)teardownContext:(id)a3;
- (void)translate:(CGSize)a3 state:(id)a4;
@end

@implementation GQHCanvasContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQHCanvasContext;
  [(GQHCanvasContext *)&v3 dealloc];
}

- (void)addScriptTagToHtml:(id)a3 state:(id)a4
{
  [a3 startElement:"script"];
  [a3 setAttribute:"type" value:"text/javascript"];
  objc_msgSend(a3, "setAttribute:cfStringValue:", "src", objc_msgSend(a4, "uriForBundleResource:ofType:", @"GQCanvas", @"js"));
  [a3 endElement];
}

- (void)teardownContext:(id)a3
{
  self->mFunctionName = 0;
  *(_WORD *)&self->mHasFill = 0;
  mBezierStr = self->mBezierStr;
  if (mBezierStr)
  {
    CFRelease(mBezierStr);
    self->mBezierStr = 0;
  }
}

- (void)createShapeWithId:(__CFString *)a3 path:(id)a4 geometry:(id)a5 graphicStyle:(id)a6 isFloating:(BOOL)a7 state:(id)a8
{
  BOOL v44 = a7;
  [(GQHCanvasContext *)self strokeWidthWithGraphicStyle:a6];
  float v15 = v14;
  v16 = (const CGPath *)[a4 createBezierPath];
  CGPathRef path = 0;
  CGPathRef v48 = 0;
  if (v15 != 0.0 && self) {
    [(GQHCanvasContext *)self endPointInfoForPath:v16];
  }
  long long v46 = 0u;
  long long v45 = 0u;
  id v17 = [a4 hasVerticalFlip];
  id v18 = [a4 hasVerticalFlip];
  id v19 = [a4 hasHorizontalFlip];
  id v20 = [a4 horizontalFlip];
  if (a5)
  {
    [a5 transformHasVFlip:v17 vFlip:v18 hasHFlip:v19 hFlip:v20];
  }
  else
  {
    long long v46 = 0u;
    long long v45 = 0u;
  }
  BoundingBoCGFloat x = CGPathGetBoundingBox(v16);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  CGPathRelease(v16);
  double v25 = (float)-v15;
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  CGRect v51 = CGRectInset(v50, v25, v25);
  double v26 = v51.origin.x;
  double v27 = v51.origin.y;
  double v28 = v51.size.width;
  double v29 = v51.size.height;
  if (path)
  {
    CGRect v52 = CGPathGetBoundingBox(path);
    CGRect v57 = CGRectInset(v52, v25, v25);
    v53.origin.CGFloat x = v26;
    v53.origin.CGFloat y = v27;
    v53.size.CGFloat width = v28;
    v53.size.CGFloat height = v29;
    CGRect v54 = CGRectUnion(v53, v57);
    double v26 = v54.origin.x;
    double v27 = v54.origin.y;
    double v28 = v54.size.width;
    double v29 = v54.size.height;
  }
  if (v48)
  {
    CGRect v58 = CGPathGetBoundingBox(v48);
    v55.origin.CGFloat x = v26;
    v55.origin.CGFloat y = v27;
    v55.size.CGFloat width = v28;
    v55.size.CGFloat height = v29;
    CGRect v56 = CGRectUnion(v55, v58);
    double v26 = v56.origin.x;
    double v27 = v56.origin.y;
    double v28 = v56.size.width;
    double v29 = v56.size.height;
  }
  [a5 nonrotatedPosition];
  double v31 = v30;
  double v33 = v32;
  [(GQHCanvasContext *)self prepareContext:a8];
  self->mGeometrCGFloat y = (GQDAffineGeometry *)a5;
  id v34 = a5;
  id v35 = [a8 htmlDoc];
  [v35 startElement:"canvas"];
  *(float *)&double v36 = v28;
  [v35 setAttribute:"width" floatValue:v36];
  *(float *)&double v37 = v29;
  [v35 setAttribute:"height" floatValue:v37];
  [v35 setAttribute:"id" cfStringValue:a3];
  v38 = objc_alloc_init(GQHStyle);
  v39 = v38;
  if (v44)
  {
    [(GQHStyle *)v38 addAttribute:off_9CF18 value:off_9CFA0];
    [(GQHStyle *)v39 addAttribute:off_9CEA0 intValue:(int)(v26 + v31)];
    [(GQHStyle *)v39 addAttribute:off_9CF50 intValue:(int)(v27 + v33)];
  }
  CFStringRef v40 = CFStringCreateWithFormat(0, 0, @"matrix(%f, %f, %f, %f, 0, 0)", v45, v46);
  [(GQHStyle *)v39 addAttribute:off_9CF90 value:v40];
  CFRelease(v40);
  [(GQHStyle *)v39 setStyleOnCurrentNode:a8];

  [v35 startElement:"script"];
  [v35 setAttribute:"type" value:"text/javascript"];
  v41 = (NSMutableString *)[objc_alloc((Class)NSMutableString) initWithString:a3];
  self->mFunctionName = v41;
  [(NSMutableString *)v41 replaceOccurrencesOfString:@"-", @"_", 2, 0, [(NSMutableString *)v41 length] withString options range];
  CFStringRef v42 = CFStringCreateWithFormat(0, 0, @"\nfunction %@() {\nvar canvas = document.getElementById('%@'); \nvar context = canvas.getContext('2d'); \ncontext.translate(%f, %f);\n",
          self->mFunctionName,
          a3,
          -v26,
          -v27);
  [v35 addContent:v42];
  CFRelease(v42);
  -[GQHCanvasContext setBezierPath:state:](self, "setBezierPath:state:", [a4 pathStr], a8);
  [(GQHCanvasContext *)self mapStyle:a6 state:a8];
  if (self->mHasFill) {
    [v35 addContent:@"context.fill();\n"];
  }
  if (self->mHasStroke) {
    [v35 addContent:@"context.stroke();\n"];
  }
  if (v48)
  {
    [v35 addContent:@"context.beginPath();\n"];
    [(GQHCanvasContext *)self setCGPath:v48 state:a8];
    [(GQHCanvasContext *)self mapLineEndFillStyle:a6 state:a8];
    [v35 addContent:@"context.fill();\n"];
    CGPathRelease(v48);
    CGPathRef v48 = 0;
  }
  if (path)
  {
    [v35 addContent:@"context.beginPath();\n"];
    [(GQHCanvasContext *)self setCGPath:path state:a8];
    [(GQHCanvasContext *)self mapLineEndStrokeStyle:a6 state:a8];
    [v35 addContent:@"context.stroke();\n"];
    CGPathRelease(path);
    CGPathRef path = 0;
  }
  CFStringRef v43 = CFStringCreateWithFormat(0, 0, @"}\n%@();\n", self->mFunctionName);
  [v35 addContent:v43];
  CFRelease(v43);
  [v35 endElement];

  self->mGeometrCGFloat y = 0;
  [v35 endElement];
  [(GQHCanvasContext *)self teardownContext:a8];
}

- (void)createMaskedImageWithId:(__CFString *)a3 geometry:(id)a4 imageBinary:(id)a5 cropGeometry:(id)a6 maskingShapePath:(id)a7 alphaMaskBezier:(CGPath *)a8 graphicStyle:(id)a9 isFloating:(BOOL)a10 state:(id)a11
{
  memset(&v73, 0, sizeof(v73));
  if (a4) {
    [a4 transform];
  }
  if (a6)
  {
    id v17 = a6;
  }
  else
  {
    a6 = objc_alloc_init(GQDAffineGeometry);
    [a4 size];
    objc_msgSend(a6, "setNaturalSize:");
    [a4 size];
    objc_msgSend(a6, "setSize:");
    [a4 position];
    objc_msgSend(a6, "setPosition:");
    [a4 angle];
    objc_msgSend(a6, "setAngle:");
    objc_msgSend(a6, "setHorizontalFlip:", objc_msgSend(a4, "horizontalFlip"));
    objc_msgSend(a6, "setVerticalFlip:", objc_msgSend(a4, "verticalFlip"));
    [a4 shearXAngle];
    objc_msgSend(a6, "setShearXAngle:");
    [a4 shearYAngle];
    objc_msgSend(a6, "setShearYAngle:");
  }
  memset(&transform, 0, sizeof(transform));
  id v18 = [a7 hasVerticalFlip];
  id v19 = [a7 verticalFlip];
  id v20 = [a7 hasHorizontalFlip];
  id v21 = [a7 horizontalFlip];
  if (a6) {
    [a6 transformHasVFlip:v18 vFlip:v19 hasHFlip:v20 hFlip:v21];
  }
  else {
    memset(&transform, 0, sizeof(transform));
  }
  CGPathRef v22 = (CGPathRef)[a7 createBezierPath];
  if (!a7)
  {
    CGFloat y = CGPointZero.y;
    [a6 naturalSize];
    v75.size.double width = v24;
    v75.size.double height = v25;
    v75.origin.double x = CGPointZero.x;
    v75.origin.CGFloat y = y;
    CGPathRef v22 = CGPathCreateWithRect(v75, 0);
  }
  double v26 = v22;
  if (a8)
  {
    CFRetain(a8);
  }
  else
  {
    CGFloat v27 = CGPointZero.y;
    [a4 naturalSize];
    v76.size.double width = v28;
    v76.size.double height = v29;
    v76.origin.double x = CGPointZero.x;
    v76.origin.CGFloat y = v27;
    a8 = CGPathCreateWithRect(v76, 0);
  }
  CGPathRef v30 = CGPathCreateCopyByTransformingPath(v26, &transform);
  CGPathRef v31 = CGPathCreateCopyByTransformingPath(a8, &v73);
  values[0] = v30;
  values[1] = v31;
  CFArrayRef v32 = CFArrayCreate(0, (const void **)values, 2, &kCFTypeArrayCallBacks);
  CGMutablePathRef v33 = sub_51890(v32);
  CFRelease(v32);
  CFRelease(v30);
  CFRelease(v31);
  CFRelease(v26);
  CFRelease(a8);
  if (CGPathIsEmpty(v33))
  {
    CFRelease(v33);
  }
  else
  {
    id v34 = [a9 valueForObjectProperty:68];
    id v71 = v34;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v35 = (float)((float)+[GQHGraphicStyle strokeWidth:v34] * -0.5);
    }
    else {
      double v35 = -0.0;
    }
    PathBoundingBodouble x = CGPathGetPathBoundingBox(v33);
    CGRect v78 = CGRectInset(PathBoundingBox, v35, v35);
    double x = v78.origin.x;
    double v37 = v78.origin.y;
    double width = v78.size.width;
    double height = v78.size.height;
    memset(&v70, 0, sizeof(v70));
    CGAffineTransformMakeTranslation(&v70, -v78.origin.x, -v78.origin.y);
    CFStringRef v40 = CGPathCreateCopyByTransformingPath(v33, &v70);
    CFRelease(v33);
    id v41 = [a11 htmlDoc];
    CFStringRef v42 = v41;
    if (a10)
    {
      [v41 startElement:"div"];
      CFStringRef v43 = objc_alloc_init(GQHStyle);
      [(GQHStyle *)v43 addAttribute:off_9CF18 value:off_9CFA0];
      BOOL v44 = off_9CEA0;
      float v45 = x;
      double v46 = (double)(uint64_t)llroundf(v45);
      [a11 scale];
      [(GQHStyle *)v43 addAttribute:v44 intValue:(int)(v47 * v46)];
      CGPathRef v48 = off_9CF50;
      float v49 = v37;
      double v50 = (double)(uint64_t)llroundf(v49);
      [a11 scale];
      [(GQHStyle *)v43 addAttribute:v48 intValue:(int)(v51 * v50)];
      [(GQHStyle *)v43 setStyleOnCurrentNode:a11];
    }
    [(GQHCanvasContext *)self prepareContext:a11];
    self->mGeometrCGFloat y = (GQDAffineGeometry *)a4;
    id v52 = a4;
    [v42 startElement:"canvas"];
    *(float *)&double v53 = width;
    [v42 setAttribute:"width" floatValue:v53];
    *(float *)&double v54 = height;
    [v42 setAttribute:"height" floatValue:v54];
    [v42 setAttribute:"id" cfStringValue:a3];
    CGRect v55 = objc_alloc_init(GQHStyle);
    id v71 = 0;
    if ([a9 hasValueForObjectProperty:72 value:&v71]) {
      +[GQHGraphicStyle mapExternalWrap:v71 style:v55 state:a11];
    }
    [(GQHStyle *)v55 setStyleOnCurrentNode:a11];

    [v42 startElement:"script"];
    [v42 setAttribute:"type" value:"text/javascript"];
    CGRect v56 = (NSMutableString *)[objc_alloc((Class)NSMutableString) initWithString:a3];
    self->mFunctionName = v56;
    [(NSMutableString *)v56 replaceOccurrencesOfString:@"-", @"_", 2, 0, [(NSMutableString *)v56 length] withString options range];
    CFStringRef v57 = CFStringCreateWithFormat(0, 0, @"\n                                                                         function %@() {\n                                                                         var canvas = document.getElementById('%@'); \n                                                                         var context = canvas.getContext('2d'); \n                                                                         ",
            self->mFunctionName,
            a3);
    [v42 addContent:v57];
    CFRelease(v57);
    CGRect v58 = sub_437B4(v40);
    [(GQHCanvasContext *)self setBezierPath:v58 state:a11];
    CFRelease(v40);
    xmlFree(v58);
    [(GQHCanvasContext *)self mapStyle:a9 state:a11];
    if (a5)
    {
      CFURLRef v59 = (const __CFURL *)objc_msgSend(a5, "createAbsoluteUrlForState:", objc_msgSend(a11, "processorState"));
      if (v59)
      {
        CFURLRef v60 = v59;
        CFStringRef v61 = CFURLGetString(v59);
        CFMutableStringRef v62 = sub_425E4(v61);
        CFStringRef v63 = CFStringCreateWithFormat(0, 0, @"                                                                              var img = new Image();\n                                                                              img.src = '%@';\n                                                                              img.onload = function () {\n",
                v62);
        [v42 addContent:v63];
        CFRelease(v63);
        CFRelease(v62);
        [v42 addContent:@"                                  context.clip();\n"];
        CGAffineTransform t1 = v73;
        memset(&v69, 0, sizeof(v69));
        CGAffineTransform t2 = v70;
        CGAffineTransformConcat(&v69, &t1, &t2);
        CFStringRef v64 = CFStringCreateWithFormat(0, 0, @"context.transform(%f, %f, %f, %f, %f, %f);\n",
                *(void *)&v69.a,
                *(void *)&v69.b,
                *(void *)&v69.c,
                *(void *)&v69.d,
                *(void *)&v69.tx,
                *(void *)&v69.ty);
        [v42 addContent:v64];
        CFRelease(v64);
        [v42 addContent:@"                                  context.drawImage(img, 0, 0);\n                                  }\n"];
        CFRelease(v60);
      }
    }
    if (self->mHasFill) {
      [v42 addContent:@"context.fill();\n"];
    }
    if (self->mHasStroke) {
      [v42 addContent:@"context.stroke();\n"];
    }
    CFStringRef v65 = CFStringCreateWithFormat(0, 0, @"}\n%@();\n", self->mFunctionName);
    [v42 addContent:v65];
    CFRelease(v65);
    [v42 endElement];

    self->mGeometrCGFloat y = 0;
    [v42 endElementWithExpectedName:"canvas"];
    if (a10) {
      [v42 endElementWithExpectedName:"div"];
    }
    [(GQHCanvasContext *)self teardownContext:a11];
  }
}

- (void)setContextOpacity:(float)a3 state:(id)a4
{
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"context.globalAlpha = %f;\n", a3);
  objc_msgSend(objc_msgSend(a4, "htmlDoc"), "addContent:", v5);
  CFRelease(v5);
}

- (void)setStrokeColor:(id)a3 width:(float)a4 state:(id)a5
{
  id v9 = [a3 htmlRed];
  id v10 = [a3 htmlGreen];
  id v11 = [a3 htmlBlue];
  [a3 alphaComponent];
  CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"setColorStrokeStyle(context, %d, %d, %d, %f, %ld);\n",
          v9,
          v10,
          v11,
          v12,
          llroundf(a4));
  objc_msgSend(objc_msgSend(a5, "htmlDoc"), "addContent:", v13);
  CFRelease(v13);
  self->mHasStroke = 1;
}

- (void)setFillColor:(id)a3 state:(id)a4
{
  id v7 = [a3 htmlRed];
  id v8 = [a3 htmlGreen];
  id v9 = [a3 htmlBlue];
  [a3 alphaComponent];
  CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"setColorFillStyle(context, %d, %d, %d, %f);\n", v7, v8, v9, v10);
  objc_msgSend(objc_msgSend(a4, "htmlDoc"), "addContent:", v11);
  CFRelease(v11);
  self->mHasFill = 1;
}

- (void)setGradient:(id)a3 state:(id)a4
{
  if ([a3 type])
  {
    if ([a3 type] != 1) {
      return;
    }
    [a3 start];
    *(float *)&double v7 = v7;
    unint64_t v8 = llroundf(*(float *)&v7);
    [a3 start];
    float v10 = v9;
    unint64_t v11 = llroundf(v10);
    [a3 start];
    *(float *)&double v12 = v12;
    unint64_t v13 = llroundf(*(float *)&v12);
    [a3 start];
    float v15 = v14;
    unint64_t v16 = llroundf(v15);
    [a3 start];
    double v18 = v17;
    [a3 end];
    *(float *)&double v18 = v18 - v19;
    [a3 start];
    double v21 = v20;
    [a3 end];
    *(float *)&double v22 = v21 - v22;
    unint64_t v44 = llroundf(hypotf(*(float *)&v18, *(float *)&v22));
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"context.fillStyle = context.createRadialGradient(%ld, %ld, %d, %ld, %ld, %ld);\n",
            v8,
            v11,
            0,
            v13,
            v16,
            v44);
  }
  else
  {
    [a3 angle];
    double v25 = 3.14159265 - v24;
    [(GQDAffineGeometry *)self->mGeometry size];
    *(float *)&double v26 = v26;
    unint64_t v27 = llroundf(*(float *)&v26);
    [(GQDAffineGeometry *)self->mGeometry size];
    float v29 = v28;
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"createLinearGradientFillStyle(context, %f, %ld, %ld);\n",
            *(void *)&v25,
            v27,
            llroundf(v29));
  }
  CFStringRef v30 = v23;
  if (v23)
  {
    id v31 = objc_alloc_init((Class)NSMutableString);
    CFArrayRef v32 = (const __CFArray *)[a3 stops];
    int Count = CFArrayGetCount(v32);
    if (Count >= 1)
    {
      CFStringRef v45 = v30;
      double v46 = self;
      CFIndex v34 = 0;
      uint64_t v35 = Count;
      do
      {
        ValueAtIndedouble x = (void *)CFArrayGetValueAtIndex(v32, v34);
        id v37 = [ValueAtIndex color];
        id v38 = [v37 htmlRed];
        id v39 = [v37 htmlGreen];
        id v40 = [v37 htmlBlue];
        [v37 alphaComponent];
        uint64_t v42 = v41;
        [ValueAtIndex fraction];
        objc_msgSend(v31, "appendFormat:", @"setGradientColorStop(context.fillStyle, %d, %d, %d, %f, %f);\n",
          v38,
          v39,
          v40,
          v42,
          v43);
        ++v34;
      }
      while (v35 != v34);
      CFStringRef v30 = v45;
      objc_msgSend(objc_msgSend(a4, "htmlDoc"), "addContent:", v45);
      objc_msgSend(objc_msgSend(a4, "htmlDoc"), "addContent:", v31);
      v46->mHasFill = 1;
    }

    CFRelease(v30);
  }
}

- (void)setImageFill:(__CFURL *)a3 srcSize:(CGSize)a4 mode:(int)a5 state:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  CFStringRef v11 = CFURLGetString(a3);
  CFMutableStringRef v12 = sub_425E4(v11);
  CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"var img = new Image();\nimg.src = '%@';\nimg.onload = function () {\n",
          v12);
  objc_msgSend(objc_msgSend(a6, "htmlDoc"), "addContent:", v13);
  CFRelease(v13);
  CFRelease(v12);
  if (a5 == 2) {
    goto LABEL_5;
  }
  if (!a5)
  {
    if (self->mBezierStr)
    {
      [(GQDAffineGeometry *)self->mGeometry size];
      float v15 = (v14 - width) * 0.5;
      float v17 = (v16 - height) * 0.5;
      float v18 = 1.0;
      double v19 = 1.0;
      float v20 = 1.0;
      double v21 = 1.0;
LABEL_37:
      double v38 = v15;
      double v39 = v17;
      if (v18 == 1.0 && v20 == 1.0) {
        CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"    context.clip();\n    context.translate(%f, %f);\n    context.drawImage(img, 0, 0);\n   }\n",
      }
                *(void *)&v38,
                *(void *)&v39);
      else {
        CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"    context.clip();\n    context.translate(%f, %f);\n    context.scale(%f,%f);\n    context.drawImage(img, 0, 0);\n   }\n",
      }
                *(void *)&v38,
                *(void *)&v39,
                *(void *)&v21,
                *(void *)&v19);
LABEL_42:
      CFStringRef v40 = v23;
      objc_msgSend(objc_msgSend(a6, "htmlDoc"), "addContent:", v23);
      CFRelease(v40);
      return;
    }
LABEL_5:
    double v22 = @"repeat";
    if (!a5) {
      double v22 = @"no-repeat";
    }
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"    context.fillStyle = context.createPattern(img, '%@');\n    context.fill();\n }\n",
            v22);
    goto LABEL_42;
  }
  if (self->mBezierStr)
  {
    [(GQDAffineGeometry *)self->mGeometry size];
    float v18 = v24 / width;
    float v20 = v25 / height;
    float v26 = fmaxf(v18, v20);
    float v27 = (v24 - v26 * width) * 0.5;
    float v28 = 0.0;
    if (width * v26 >= v24) {
      float v27 = 0.0;
    }
    float v29 = (v25 + -v26 * height) * 0.5;
    if (height * v26 >= v25) {
      float v29 = 0.0;
    }
    float v30 = fminf(v18, v20);
    if (width * v30 >= v24)
    {
      float v32 = 0.0;
    }
    else
    {
      float v31 = (v24 - v30 * width) * 0.5;
      float v32 = v31;
    }
    BOOL v33 = height * v30 < v25;
    float v34 = (v25 + -v30 * height) * 0.5;
    if (!v33) {
      float v34 = 0.0;
    }
    double v35 = v18;
    double v36 = v20;
    if (a5 == 4)
    {
      double v36 = v30;
      double v35 = v30;
      float v18 = v30;
      float v20 = v30;
      float v37 = v32;
    }
    else
    {
      float v37 = 0.0;
    }
    if (a5 == 4) {
      float v28 = v34;
    }
    double v19 = a5 == 3 ? v26 : v36;
    double v21 = a5 == 3 ? v26 : v35;
    if (a5 == 3)
    {
      float v18 = v26;
      float v20 = v26;
      float v15 = v27;
    }
    else
    {
      float v15 = v37;
    }
    float v17 = a5 == 3 ? v29 : v28;
    if (v18 != 0.0 && v20 != 0.0) {
      goto LABEL_37;
    }
  }
}

- (void)setBezierPath:(char *)a3 state:(id)a4
{
  mBezierStr = self->mBezierStr;
  if (mBezierStr)
  {
    CFRelease(mBezierStr);
    self->mBezierStr = 0;
  }
  CFStringRef v8 = CFStringCreateWithCString(0, a3, 0x8000100u);
  CFMutableStringRef v9 = sub_425E4(v8);
  CFRelease(v8);
  self->mBezierStr = (__CFString *)CFStringCreateWithFormat(0, 0, @"bezierPath(context, '%@');\n", v9);
  CFRelease(v9);
  id v10 = [a4 htmlDoc];
  CFStringRef v11 = self->mBezierStr;
  [v10 addContent:v11];
}

- (void)translate:(CGSize)a3 state:(id)a4
{
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"context.translate(%f, %f);\n",
         *(void *)&a3.width,
         *(void *)&a3.height);
  objc_msgSend(objc_msgSend(a4, "htmlDoc"), "addContent:", v5);
  CFRelease(v5);
}

- (void)mapStyle:(id)a3 state:(id)a4
{
  [a3 valueForFloatProperty:69];
  -[GQHCanvasContext setContextOpacity:state:](self, "setContextOpacity:state:", a4);
  -[GQHCanvasContext mapFill:state:](self, "mapFill:state:", [a3 valueForObjectProperty:67], a4);
  id v7 = [a3 valueForObjectProperty:68];
  [(GQHCanvasContext *)self mapStroke:v7 state:a4];
}

- (void)mapFill:(id)a3 state:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = self;
    id v8 = a3;
LABEL_3:
    [(GQHCanvasContext *)v7 setFillColor:v8 state:a4];
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(GQHCanvasContext *)self setGradient:a3 state:a4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    id v9 = [a3 imageBinary];
    if (!v9)
    {
      if (![a3 color]) {
        return;
      }
      id v8 = [a3 color];
      id v7 = self;
      goto LABEL_3;
    }
    id v10 = v9;
    id v11 = objc_msgSend(v9, "createAbsoluteUrlForState:", objc_msgSend(a4, "processorState"));
    if (v11)
    {
      CFMutableStringRef v12 = v11;
      id v13 = [a3 technique];
      [v10 size];
      -[GQHCanvasContext setImageFill:srcSize:mode:state:](self, "setImageFill:srcSize:mode:state:", v12, v13, a4);
      CFRelease(v12);
    }
  }
}

- (void)mapStroke:(id)a3 state:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [a3 pattern];
    if (!v7 || [v7 type] != 2)
    {
      id v8 = [a3 color];
      [a3 width];
      -[GQHCanvasContext setStrokeColor:width:state:](self, "setStrokeColor:width:state:", v8, a4);
    }
  }
}

- (void)mapLineEndFillStyle:(id)a3 state:(id)a4
{
  id v6 = [(GQHCanvasContext *)self strokeColorWithGraphicStyle:a3];
  [(GQHCanvasContext *)self setFillColor:v6 state:a4];
}

- (void)mapLineEndStrokeStyle:(id)a3 state:(id)a4
{
  id v7 = -[GQHCanvasContext strokeColorWithGraphicStyle:](self, "strokeColorWithGraphicStyle:");
  [(GQHCanvasContext *)self strokeWidthWithGraphicStyle:a3];
  -[GQHCanvasContext setStrokeColor:width:state:](self, "setStrokeColor:width:state:", v7, a4);
}

- (GQHPathEndPointInfo)endPointInfoForPath:(SEL)a3
{
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.CGFloat y = 0u;
  *(_OWORD *)&retstr->var2.CGFloat y = 0u;
  *(_OWORD *)&retstr->var3.CGFloat y = 0u;
  retstr->var0 = 1;
  *(_OWORD *)&retstr->var4.CGFloat y = 0u;
  CGPoint v5 = CGPointZero;
  retstr->var1 = CGPointZero;
  retstr->var2 = v5;
  retstr->var3 = v5;
  retstr->var4 = v5;
  CGPathApply(a4, retstr, (CGPathApplierFunction)sub_4BBA0);
  if (retstr->var5 <= 1) {
    retstr->var0 = 0;
  }
  return result;
}

- (float)strokeWidthWithGraphicStyle:(id)a3
{
  id v3 = [a3 valueForObjectProperty:68];
  float v4 = 0.0;
  if (v3)
  {
    id v5 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return (float)+[GQHGraphicStyle strokeWidth:v5];
    }
  }
  return v4;
}

- (id)strokeColorWithGraphicStyle:(id)a3
{
  id v3 = [a3 valueForObjectProperty:68];
  if (!v3) {
    return 0;
  }
  float v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v4 color];
}

- (void)addPathForLineEndStyle:(int)a3 graphicStyle:(id)a4 atPoint:(CGPoint)a5 neighboringCP:(CGPoint)a6 filledPath:(CGPath *)a7 strokedPath:(CGPath *)a8
{
  double y = a6.y;
  double x = a6.x;
  double v12 = a5.y;
  double v13 = a5.x;
  id v30 = 0;
  [a4 hasValueForObjectProperty:*(void *)&a3 value:&v30];
  if (v30)
  {
    [(GQHCanvasContext *)self strokeWidthWithGraphicStyle:a4];
    float v17 = v16;
    float v18 = atan2(v12 - y, v13 - x) + -1.57079633;
    memset(&m.c, 0, 32);
    if (v17 <= 1.0)
    {
      float v20 = v17;
    }
    else
    {
      float v19 = (v17 + -1.0) * 0.6 + 1.0;
      float v20 = v19;
    }
    *(_OWORD *)&m.a = 0uLL;
    CGAffineTransformMakeTranslation(&m, v13, v12);
    CGAffineTransform v27 = m;
    CGAffineTransformScale(&v28, &v27, v20, v20);
    CGAffineTransform m = v28;
    CGAffineTransform v26 = v28;
    CGAffineTransformRotate(&v28, &v26, v18);
    CGAffineTransform m = v28;
    objc_msgSend(v30, "endPoint", *(void *)&v28.a, *(void *)&v28.b, *(void *)&v28.c, *(void *)&v28.d, *(void *)&v28.tx, *(void *)&v28.ty);
    CGFloat v22 = -v21;
    [v30 endPoint];
    CGAffineTransformTranslate(&v28, &v25, v22, -v23);
    CGAffineTransform m = v28;
    if ([v30 isFilled])
    {
      Mutable = *a7;
      if (!*a7)
      {
        Mutable = CGPathCreateMutable();
        *a7 = Mutable;
      }
    }
    else
    {
      Mutable = *a8;
      if (!*a8)
      {
        Mutable = CGPathCreateMutable();
        *a8 = Mutable;
      }
    }
    CGPathAddPath(Mutable, &m, (CGPathRef)[v30 path]);
  }
}

- (void)setCGPath:(CGPath *)a3 state:(id)a4
{
  objc_msgSend(objc_msgSend(a4, "htmlDoc"), "addContent:", @"bezierPath(context, '");
  id v6 = +[GQDBezierPath createCFStringFromPath:a3];
  objc_msgSend(objc_msgSend(a4, "htmlDoc"), "addContent:", v6);
  CFRelease(v6);
  id v7 = [a4 htmlDoc];
  [v7 addContent:@"';\n"]);
}

@end