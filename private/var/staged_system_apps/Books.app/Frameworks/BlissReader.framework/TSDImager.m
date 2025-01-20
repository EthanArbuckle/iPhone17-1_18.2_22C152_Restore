@interface TSDImager
+ (CGImage)CGImageForInfo:(id)a3 documentRoot:(id)a4;
+ (CGImage)CGImageOfSize:(CGSize)a3 forInfo:(id)a4 documentRoot:(id)a5;
+ (id)imageForInfo:(id)a3 layoutRect:(CGRect *)a4 contentsScale:(double)a5 documentRoot:(id)a6;
+ (id)imageForShapeInfo:(id)a3 viewScale:(double)a4 screenScale:(double)a5 lines:(id *)a6 documentRoot:(id)a7;
+ (id)imageForShapeInfo:(id)a3 viewScale:(double)a4 screenScale:(double)a5 lines:(id *)a6 layoutRect:(CGRect *)a7 useCullingRect:(BOOL)a8 documentRoot:(id)a9;
+ (id)imageForStorage:(id)a3 maxWidth:(double)a4 lines:(id *)a5 contentsScale:(double)a6 documentRoot:(id)a7;
+ (id)imageForStorage:(id)a3 maxWidth:(double)a4 lines:(id *)a5 layoutRect:(CGRect *)a6 useCullingRect:(BOOL)a7 maxLines:(unint64_t)a8 allowsLastLineTruncation:(BOOL)a9 contentsScale:(double)a10 documentRoot:(id)a11;
+ (id)imageSizedForShapeWithSinglePixelStroke:(id)a3 contentsScale:(double)a4 documentRoot:(id)a5;
- (CGImage)CGImageForInfo:(id)a3;
- (CGImage)CGImageOfSize:(CGSize)a3 forInfo:(id)a4;
- (id)imageSizedForShapeWithSinglePixelStroke:(id)a3 contentsScale:(double)a4;
- (id)p_layoutForInfo:(id)a3;
- (id)p_repForInfo:(id)a3;
@end

@implementation TSDImager

+ (CGImage)CGImageForInfo:(id)a3 documentRoot:(id)a4
{
  id v5 = [objc_alloc((Class)TSDImager) initWithDocumentRoot:a4];
  v6 = (CGImage *)[v5 CGImageForInfo:a3];

  return v6;
}

+ (id)imageForInfo:(id)a3 layoutRect:(CGRect *)a4 contentsScale:(double)a5 documentRoot:(id)a6
{
  id v9 = [objc_alloc((Class)TSDImager) initWithDocumentRoot:a6];
  [v9 setInfos:[NSArray arrayWithObject:a3]];
  [v9 setViewScale:a5];
  v10 = (CGImage *)[v9 newImage];
  if (v10)
  {
    v11 = v10;
    id v12 = [v9 p_layoutForInfo:a3];
    if (v12)
    {
      if (a4)
      {
        v13 = v12;
        [v12 frameForCulling];
        CGFloat v15 = v14;
        CGFloat rect = v14;
        CGFloat rect_8 = v16;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        [v13 frame];
        CGFloat x = v33.origin.x;
        CGFloat y = v33.origin.y;
        CGFloat width = v33.size.width;
        CGFloat height = v33.size.height;
        CGRectGetMinX(v33);
        v34.origin.CGFloat x = v15;
        v34.origin.CGFloat y = v18;
        v34.size.CGFloat width = v20;
        v34.size.CGFloat height = rect_8;
        CGRectGetMinX(v34);
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = height;
        CGRectGetMinY(v35);
        v36.origin.CGFloat x = rect;
        v36.origin.CGFloat y = v18;
        v36.size.CGFloat width = v20;
        v36.size.CGFloat height = rect_8;
        CGRectGetMinY(v36);
        v37.origin.CGFloat x = x;
        v37.origin.CGFloat y = y;
        v37.size.CGFloat width = width;
        v37.size.CGFloat height = height;
        CGRectGetWidth(v37);
        v38.origin.CGFloat x = x;
        v38.origin.CGFloat y = y;
        v38.size.CGFloat width = width;
        v38.size.CGFloat height = height;
        CGRectGetHeight(v38);
        TSDRoundedRect();
        a4->origin.CGFloat x = v25;
        a4->origin.CGFloat y = v26;
        a4->size.CGFloat width = v27;
        a4->size.CGFloat height = v28;
      }
    }
    else
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m") lineNumber:64 description:@"invalid nil value for '%s'", "layout"];
    }
    [v9 viewScale];
    v29 = +[TSUImage imageWithCGImage:scale:orientation:](TSUImage, "imageWithCGImage:scale:orientation:", v11, 0);
    CGImageRelease(v11);
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m") lineNumber:80 description:@"failed to generate image of shape info"];
    v29 = 0;
  }

  return v29;
}

+ (CGImage)CGImageOfSize:(CGSize)a3 forInfo:(id)a4 documentRoot:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = [objc_alloc((Class)TSDImager) initWithDocumentRoot:a5];
  id v9 = [v8 CGImageOfSize:a4 forInfo:width, height];

  return v9;
}

+ (id)imageSizedForShapeWithSinglePixelStroke:(id)a3 contentsScale:(double)a4 documentRoot:(id)a5
{
  id v7 = [objc_alloc((Class)TSDImager) initWithDocumentRoot:a5];
  id v8 = [v7 imageSizedForShapeWithSinglePixelStroke:a3 contentsScale:a4];

  return v8;
}

- (CGImage)CGImageForInfo:(id)a3
{
  id v5 = [(TSDImager *)self infos];
  id v6 = [objc_alloc((Class)NSArray) initWithObjects:a3, 0];
  [(TSDImager *)self setInfos:v6];
  id v7 = [(TSDImager *)self newImage];
  [(TSDImager *)self setInfos:v5];

  id v8 = v7;
  return (CGImage *)v7;
}

- (CGImage)CGImageOfSize:(CGSize)a3 forInfo:(id)a4
{
  -[TSDImager setScaledImageSize:](self, "setScaledImageSize:", a3.width, a3.height);

  return [(TSDImager *)self CGImageForInfo:a4];
}

- (id)imageSizedForShapeWithSinglePixelStroke:(id)a3 contentsScale:(double)a4
{
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "pathSource"), "bezierPath"), "bounds");
  TSDRectWithSize();
  -[TSDImager setUnscaledClipRect:](self, "setUnscaledClipRect:");
  [(TSDImager *)self setViewScale:a4];
  id v7 = [a3 geometry];
  id v8 = [v7 mutableCopy];
  [v8 setPosition:0.5, 0.5];
  [v7 size];
  double v10 = v9 + -1.0;
  [v7 size];
  [v8 setSize:v10, v11 - 1.0];
  [a3 setGeometry:v8];

  id v12 = [(TSDImager *)self CGImageForInfo:a3];
  [a3 setGeometry:v7];

  [(TSDImager *)self viewScale];

  return +[TSUImage imageWithCGImage:scale:orientation:](TSUImage, "imageWithCGImage:scale:orientation:", v12, 0);
}

+ (id)imageForStorage:(id)a3 maxWidth:(double)a4 lines:(id *)a5 contentsScale:(double)a6 documentRoot:(id)a7
{
  return [a1 imageForStorage:a3 maxWidth:a5 lines:0 layoutRect:0 useCullingRect:0 maxLines:0 allowsLastLineTruncation:a4 contentsScale:a6 documentRoot:a7];
}

+ (id)imageForStorage:(id)a3 maxWidth:(double)a4 lines:(id *)a5 layoutRect:(CGRect *)a6 useCullingRect:(BOOL)a7 maxLines:(unint64_t)a8 allowsLastLineTruncation:(BOOL)a9 contentsScale:(double)a10 documentRoot:(id)a11
{
  BOOL v12 = a9;
  BOOL v14 = a7;
  id v19 = [objc_alloc((Class)TSSStylesheet) initWithContext:[a3 context]];
  id v20 = +[TSWPShapeStyle defaultStyleWithContext:](TSWPShapeStyle, "defaultStyleWithContext:", [a3 context]);
  [v20 setValue:[TSDStroke emptyStroke] forProperty:517];
  [v20 setIntValue:a8 forProperty:155];
  [v19 addStyle:v20];
  id v21 = [objc_alloc((Class)TSDInfoGeometry) initWithWidth:a4];
  id v22 = [objc_alloc((Class)objc_opt_class()) initWithContext:[a3 context] geometry:v21 style:v20 wpStorage:a3];
  [v22 setAllowsLastLineTruncation:v12];
  id v23 = [a1 imageForShapeInfo:v22 viewScale:a5 screenScale:a6 lines:v14 layoutRect:a11 useCullingRect:1.0 documentRoot:a10];

  return v23;
}

+ (id)imageForShapeInfo:(id)a3 viewScale:(double)a4 screenScale:(double)a5 lines:(id *)a6 documentRoot:(id)a7
{
  return [a1 imageForShapeInfo:a3 viewScale:a6 screenScale:0 lines:0 layoutRect:a7 useCullingRect:a4 documentRoot:a5];
}

+ (id)imageForShapeInfo:(id)a3 viewScale:(double)a4 screenScale:(double)a5 lines:(id *)a6 layoutRect:(CGRect *)a7 useCullingRect:(BOOL)a8 documentRoot:(id)a9
{
  BOOL v9 = a8;
  id v15 = [objc_alloc((Class)TSDImager) initWithDocumentRoot:a9];
  [v15 setInfos:[NSArray arrayWithObject:a3]];
  [v15 setViewScale:a4 * a5];
  double v16 = (CGImage *)[v15 newImage];
  if (v16)
  {
    double v17 = v16;
    objc_opt_class();
    [v15 p_repForInfo:a3];
    CGFloat v18 = (void *)TSUDynamicCast();
    if (!v18) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m") lineNumber:211 description:@"invalid nil value for '%s'", "shapeRep"];
    }
    objc_opt_class();
    [v18 containedRep];
    id v19 = (void *)TSUDynamicCast();
    if (!v19) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m") lineNumber:214 description:@"invalid nil value for '%s'", "wpRep"];
    }
    if (a6) {
      *a6 = [v19 allLines];
    }
    if (a7)
    {
      if (v9) {
        objc_msgSend(objc_msgSend(v18, "layout"), "frameForCulling");
      }
      objc_msgSend(objc_msgSend(v18, "layout"), "frame");
      TSDRoundedRect();
      a7->origin.CGFloat x = v21;
      a7->origin.CGFloat y = v22;
      a7->size.double width = v23;
      a7->size.double height = v24;
    }
    id v20 = +[TSUImage imageWithCGImage:v17 scale:0 orientation:a5];
    CGImageRelease(v17);
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m") lineNumber:234 description:@"failed to generate image of shape info"];
    id v20 = 0;
  }

  return v20;
}

- (id)p_layoutForInfo:(id)a3
{
  id v4 = [self canvas].layoutController;
  if (!v4) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[TSDImager(THPrivateAdditions) p_layoutForInfo:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m"] lineNumber:250 description:@"invalid nil value for '%s'", "layoutController"];
  }

  return [v4 layoutForInfo:a3];
}

- (id)p_repForInfo:(id)a3
{
  id v4 = [(TSDImager *)self p_layoutForInfo:a3];
  if (!v4) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSDImager(THPrivateAdditions) p_repForInfo:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m") lineNumber:258 description:@"invalid nil value for '%s'", "layout"];
  }
  id v5 = [(TSDImager *)self canvas];

  return [v5 repForLayout:v4];
}

@end