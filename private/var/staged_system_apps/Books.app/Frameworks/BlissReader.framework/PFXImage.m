@interface PFXImage
+ (id)errorImageInfoForGeometry:(id)a3 readerState:(id)a4;
+ (void)mapPropertySet:(id)a3 to:(id)a4 readerState:(id)a5;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3 forceBoundsComputation:(BOOL)a4;
@end

@implementation PFXImage

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXImage;
  [(PFXDrawable *)&v3 dealloc];
}

+ (id)errorImageInfoForGeometry:(id)a3 readerState:(id)a4
{
  [a3 transformedBounds];
  double v7 = v6;
  [a3 transformedBounds];
  double v9 = v8;
  id v10 = objc_alloc_init((Class)NSAutoreleasePool);
  v11 = (CGContext *)TSDBitmapContextCreate();
  CGContextSetInterpolationQuality(v11, kCGInterpolationNone);
  CGContextSaveGState(v11);
  -[TSDErrorImageProvider drawImageInContext:rect:](+[TSDErrorImageProvider sharedInstance](TSDErrorImageProvider, "sharedInstance"), "drawImageInContext:rect:", v11, 0.0, 0.0, v7, v9);
  CGContextRestoreGState(v11);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  v13 = (__CFData *)objc_alloc_init((Class)NSMutableData);
  v14 = CGImageDestinationCreateWithData(v13, (CFStringRef)[UTTypePNG identifier], 1uLL, 0);
  CGImageDestinationAddImage(v14, Image, 0);
  BOOL v15 = CGImageDestinationFinalize(v14);
  CFRelease(v14);
  CGImageRelease(Image);
  if (v15)
  {
    v16 = (THImageInfo *)+[TSPData dataFromNSData:filename:context:](TSPData, "dataFromNSData:filename:context:", v13, @"error.png", +[THTemporaryObjectContext context]);

    if (!v16) {
      goto LABEL_6;
    }
    v13 = [objc_alloc((Class)TSDMediaStyle) initWithContext:[a4 tspContext] name:0 overridePropertyMap:0 isVariation:0];
    v16 = -[THImageInfo initWithContext:geometry:style:imageData:originalImageData:]([THImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", [a4 tspContext], a3, v13, v16, 0);
  }
  else
  {
    v16 = 0;
  }

LABEL_6:

  return v16;
}

+ (void)mapPropertySet:(id)a3 to:(id)a4 readerState:(id)a5
{
  id v8 = +[PFXGraphicStyle mapStrokeFromStyleProperties:a3 contentState:a5];
  if (v8) {
    [a4 setObject:v8 forProperty:517];
  }
  id v9 = +[PFXGraphicStyle mapShadowFromStyleProperties:a3 contentState:a5];
  if (v9) {
    [a4 setObject:v9 forProperty:520];
  }
  id v10 = +[PFXGraphicStyle mapReflectionFromStyleProperties:a3];
  if (v10) {
    [a4 setObject:v10 forProperty:519];
  }
  id v11 = +[PFXGraphicStyle mapOpacityFromStyleProperties:a3];
  if (v11)
  {
    [v11 doubleValue];
    *(float *)&double v12 = v12;
    [a4 setFloatValue:518 forProperty:v12];
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  int v6 = xmlStrEqual((const xmlChar *)[v5 xmlElementName], (const xmlChar *)"img");
  self->mIsHtmlImage = v6 != 0;
  double v7 = PFXTagSource;
  if (!v6) {
    double v7 = PFXTagHref;
  }
  self->mImageRelHref = (NSString *)[v5 valueForAttribute:*v7];
  v9.receiver = self;
  v9.super_class = (Class)PFXImage;
  return [(PFXDrawable *)&v9 mapStartElementWithState:a3];
}

- (void)mapEndElementWithState:(id)a3
{
}

- (void)mapEndElementWithState:(id)a3 forceBoundsComputation:(BOOL)a4
{
  BOOL v4 = a4;
  id v53 = objc_alloc_init((Class)NSAutoreleasePool);
  id v7 = [a3 currentHtmlDocMediaState];
  id v8 = [a3 currentHtmlStackEntry];
  id v52 = [v8 currentEntryMediaState];
  id v9 = [v52 propertySet];
  id v10 = [+[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", self->mImageRelHref, [a3 entryURI]) stringByRemovingPercentEncoding];
  unsigned int v11 = [a3 isInsideWidget];
  id v12 = [a3 imageDataForUri:v10 isSharable:v11 ^ 1];
  if (!self->mIsHtmlImage && !v4) {
    goto LABEL_17;
  }
  [(PFXDrawablePlacement *)self->super.mPlacement bounds];
  if (v14 != 0.0)
  {
    [(PFXDrawablePlacement *)self->super.mPlacement bounds];
    if (v15 != 0.0) {
      goto LABEL_17;
    }
  }
  if (!v11)
  {
    [+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool") temporaryProviderForData:v12 shouldValidate:0].naturalSize;
    double v17 = v22;
    double v19 = v23;
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    goto LABEL_12;
  }
  -[PFXDrawablePlacement setBounds:](self->super.mPlacement, "setBounds:", 0.0, 0.0, 100.0, 100.0);
  objc_msgSend(objc_msgSend(v8, "valueForAttribute:", "width"), "doubleValue");
  double v17 = v16;
  objc_msgSend(objc_msgSend(v8, "valueForAttribute:", "height"), "doubleValue");
  if (v17 != 0.0)
  {
    double v19 = v18;
    if (v18 != 0.0)
    {
      [(PFXDrawablePlacement *)self->super.mPlacement bounds];
LABEL_12:
      -[PFXDrawablePlacement setBounds:](self->super.mPlacement, "setBounds:", x, y, v17, v19);
    }
  }
  mPlacement = self->super.mPlacement;
  if (mPlacement)
  {
    [(PFXDrawablePlacement *)mPlacement affineTransform];
    mPlacement = self->super.mPlacement;
  }
  else
  {
    memset(v59, 0, 48);
  }
  [(PFXDrawablePlacement *)mPlacement bounds];
  [(PFXDrawablePlacement *)self->super.mPlacement setInfoGeometry:+[PFXDrawablePlacement affineGeometryWithAffineTransform:appliedToBounds:](PFXDrawablePlacement, "affineGeometryWithAffineTransform:appliedToBounds:", v59)];
LABEL_17:
  id v25 = objc_alloc_init((Class)TSSPropertyMap);
  +[PFXImage mapPropertySet:v9 to:v25 readerState:a3];
  id v26 = [objc_alloc((Class)TSDMediaStyle) initWithContext:[a3 tspContext] name:0 overridePropertyMap:v25 isVariation:0];
  objc_msgSend(objc_msgSend(v7, "stylesheet"), "addStyle:", v26);

  v27 = -[THImageInfo initWithContext:geometry:style:imageData:originalImageData:]([THImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"), v26, v12, 0);
  id v28 = [v8 valueForAttribute:"clip-path"];
  if (v28)
  {
    id v29 = objc_msgSend(objc_msgSend(a3, "svgDefinitionCache"), "objectForKey:", objc_msgSend(v28, "substringWithRange:", 5, (char *)objc_msgSend(v28, "length") - 6));
    if (v29)
    {
      id v30 = [v29 copy];
      [(TSDInfoGeometry *)[(PFXDrawablePlacement *)self->super.mPlacement infoGeometry] size];
      double v32 = v31;
      double v34 = v33;
      memset(&v58, 0, sizeof(v58));
      [(PFXDrawablePlacement *)self->super.mPlacement bounds];
      CGFloat v36 = v32 / v35;
      [(PFXDrawablePlacement *)self->super.mPlacement bounds];
      CGAffineTransformMakeScale(&v58, v36, v34 / v37);
      CGAffineTransform v57 = v58;
      [v30 transformUsingAffineTransform:&v57];
      [v30 bounds];
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      memset(&v56, 0, sizeof(v56));
      CGAffineTransformMakeTranslation(&v56, -v38, -v40);
      CGAffineTransform v55 = v56;
      [v30 transformUsingAffineTransform:&v55];
      id v46 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:v39 size:v41];
      id v47 = [objc_alloc((Class)TSDBezierPathSource) initWithBezierPath:v30];

      id v48 = [objc_alloc((Class)TSDMaskInfo) initWithContext:[a3 tspContext] geometry:v46 pathSource:v47];
      [(THImageInfo *)v27 setMaskInfo:v48];
    }
  }
  if (self->mIsHtmlImage) {
    id v49 = [v8 valueForAttribute:"alt"];
  }
  else {
    id v49 = 0;
  }
  id v50 = objc_msgSend(objc_msgSend(a3, "ancestorEntryWithElementName:", "object"), "valueForAttribute:", "title");
  if ([v49 length] || objc_msgSend(v50, "length"))
  {
    id v51 = [(THImageInfo *)v27 accessibilityDescriptions];
    if (!v51)
    {
      id v51 = (id)objc_opt_new();
      [(THImageInfo *)v27 setAccessibilityDescriptions:v51];
    }
    if (v49) {
      [v51 setObject:v49 forKey:@"alternateText"];
    }
    if (v50) {
      [v51 setObject:v50 forKey:@"container"];
    }
  }
  [v52 setResult:v27];

  v54.receiver = self;
  v54.super_class = (Class)PFXImage;
  [(PFXDrawable *)&v54 mapEndElementWithState:a3];
  if (v11) {
    [v8 addChildAttributesToParentForResult:v27];
  }
}

@end