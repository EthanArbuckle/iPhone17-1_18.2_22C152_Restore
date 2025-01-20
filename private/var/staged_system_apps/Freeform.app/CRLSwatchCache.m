@interface CRLSwatchCache
+ (BOOL)applyFakeStrokeIfNeededForShape:(id)a3 backgroundAppearance:(unint64_t)a4;
+ (CGImage)newImageForDarkBackground:(CGImage *)a3 atScale:(double)a4 ofSize:(CGSize)a5 inset:(CGSize)a6;
+ (CRLSwatchCache)swatchCache;
- (BOOL)p_shouldAddHighContrastBackgroundForShapeType:(int64_t)a3 withStrokeColor:(id)a4 context:(id)a5;
- (CGImage)p_newImageWithConnectionLineKnobsForShape:(id)a3 atScale:(double)a4 ofSize:(CGSize)a5 overImage:(CGImage *)a6;
- (CGSize)shapeSwatchInset;
- (CGSize)swatchInsetForShapeType:(int64_t)a3;
- (id)imageForImageWithSize:(CGSize)a3 imageScale:(double)a4 imageInfo:(id)a5 editingCoordinator:(id)a6 renderForWideGamut:(BOOL)a7;
- (id)imageForMovieWithSize:(CGSize)a3 imageScale:(double)a4 movieInfo:(id)a5 editingCoordinator:(id)a6 renderForWideGamut:(BOOL)a7;
- (id)imageForShapeWithSize:(CGSize)a3 imageScale:(double)a4 shapeType:(int64_t)a5 shapePathSource:(id)a6 angle:(double)a7 editingCoordinator:(id)a8 renderingContext:(id)a9;
- (id)imageForStyledItemWithSize:(CGSize)a3 imageScale:(double)a4 editingCoordinator:(id)a5 renderForWideGamut:(BOOL)a6 styledInfoAspectRatio:(CGSize)a7 usingSwatchInfoFromBlock:(id)a8;
- (id)p_darkBackgroundColorForBackgroundAppearance:(unint64_t)a3;
- (id)shapeItemWithPresetsForSize:(CGSize)a3 shapeType:(int64_t)a4 shapePathSource:(id)a5 angle:(double)a6 editingCoordinator:(id)a7 renderingContext:(id)a8;
@end

@implementation CRLSwatchCache

+ (CRLSwatchCache)swatchCache
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002819C8;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A9568 != -1) {
    dispatch_once(&qword_1016A9568, block);
  }
  v2 = (void *)qword_1016A9560;

  return (CRLSwatchCache *)v2;
}

- (CGSize)shapeSwatchInset
{
  double v2 = 8.0;
  double v3 = 8.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)applyFakeStrokeIfNeededForShape:(id)a3 backgroundAppearance:(unint64_t)a4
{
  id v5 = a3;
  v6 = [v5 stroke];
  if (v6)
  {
    v7 = [v5 stroke];
    if ([v7 isNullStroke])
    {
      unsigned int v8 = 0;
    }
    else
    {
      v9 = [v5 stroke];
      unsigned int v8 = [v9 requiresOutlineOnBackgroundWithAppearance:a4] ^ 1;
    }
  }
  else
  {
    unsigned int v8 = 0;
  }

  v10 = [v5 fill];
  if (v10)
  {
    v11 = [v5 fill];
    unsigned int v12 = [v11 requiresOutlineOnBackgroundWithAppearance:a4] ^ 1;
  }
  else
  {
    unsigned int v12 = 0;
  }

  if (((v8 | v12) & 1) == 0)
  {
    double v13 = 0.0;
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      double v13 = 1.0;
    }
    v14 = +[CRLColor colorWithWhite:v13 alpha:0.200000003];
    v15 = +[CRLStroke strokeWithColor:v14 width:1.0];
    [v5 setStroke:v15];
  }
  return (v8 | v12) ^ 1;
}

- (id)shapeItemWithPresetsForSize:(CGSize)a3 shapeType:(int64_t)a4 shapePathSource:(id)a5 angle:(double)a6 editingCoordinator:(id)a7 renderingContext:(id)a8
{
  double height = a3.height;
  double width = a3.width;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  [(CRLSwatchCache *)self shapeSwatchInset];
  double v19 = v18;
  double v21 = v20;
  [(CRLSwatchCache *)self swatchInsetForShapeType:a4];
  double v23 = sub_100064698(v19, v21, v22);
  double v25 = v24;
  double v26 = width - v23 * 2.0;
  double v27 = height - v24 * 2.0;
  unsigned __int8 v28 = [v17 wantsRoundedCornersIfAppropriate];
  if (a4 == 3 && (v28 & 1) != 0)
  {
    uint64_t v29 = +[CRLScalarPathSource roundedRectangleWithScalar:naturalSize:continuousCurve:](CRLScalarPathSource, "roundedRectangleWithScalar:naturalSize:continuousCurve:", 1, 5.0, width - v23 * 2.0, v27);

    id v15 = (id)v29;
LABEL_4:
    [v15 naturalSize];
    [v15 scaleToNaturalSize:sub_10006729C(0, v30, v31, v26 + 0.0, v27 + 0.0)];
    [v15 naturalSize];
    double v23 = v23 + (v26 - v32) * 0.5;
    [v15 naturalSize];
    double v25 = v25 + (v27 - v33) * 0.5;
    a4 = 21;
    v34 = v15;
    goto LABEL_15;
  }
  if ((unint64_t)a4 <= 0x14)
  {
    if (((1 << a4) & 0x1D8006) != 0)
    {
      if (v26 >= v27) {
        double v35 = v27;
      }
      else {
        double v35 = width - v23 * 2.0;
      }
      __double2 v36 = __sincos_stret(a6 * 0.0174532925);
      double v37 = fabs(v36.__sinval);
      double v38 = fabs(v36.__cosval);
      if (v37 < v38) {
        double v37 = v38;
      }
      double v23 = width * 0.5 - v35 / v37 * 0.5;
      double v25 = height * 0.5;
      goto LABEL_13;
    }
    if (a4 == 9)
    {
      double v59 = -4.0;
LABEL_46:
      double v23 = v23 + v59;
      goto LABEL_13;
    }
  }
  if ((unint64_t)(a4 - 13) <= 1)
  {
    double v59 = -2.0;
    goto LABEL_46;
  }
  if (a4 == 21) {
    goto LABEL_4;
  }
  if (a4 == 12) {
    double v23 = v23 + 7.0;
  }
LABEL_13:
  v34 = +[CRLPathSource pathSourceForShapeType:naturalSize:](CRLPathSource, "pathSourceForShapeType:naturalSize:", a4);

  if (a4 == 4)
  {
    uint64_t v39 = objc_opt_class();
    v40 = sub_1002469D0(v39, v34);
    [v40 setIsCurveContinuous:1];

    a4 = 4;
  }
LABEL_15:
  v41 = [v16 boardItemFactory];
  v42 = [v41 makeShapeItemForShapeLibrarySwatchWithShapeType:a4 pathSource:v34 position:v23 angleInDegrees:v25];

  BOOL v44 = (unint64_t)(a4 - 1) < 0x14 && ((0xEC003u >> (a4 - 1)) & 1) != 0
     || a4 == 19
     || (a4 & 0xFFFFFFFFFFFFFFEFLL) == 2;
  BOOL v45 = [v17 backgroundAppearance] != (id)3 && [v17 backgroundAppearance] != (id)2;
  v46 = [v42 stroke];
  v47 = [v46 color];
  unsigned int v48 = [(CRLSwatchCache *)self p_shouldAddHighContrastBackgroundForShapeType:a4 withStrokeColor:v47 context:v17];

  if (v44 && !v45)
  {
    if (v48) {
      +[CRLColor canvas_darkInsertSwatchBackgroundColor];
    }
    else {
    v49 = -[CRLSwatchCache p_darkBackgroundColorForBackgroundAppearance:](self, "p_darkBackgroundColorForBackgroundAppearance:", [v17 backgroundAppearance]);
    }
    id v50 = [v42 stroke];
    [v50 width];
    if (v51 < 2.0)
    {
      v52 = [v42 stroke];
      v53 = [v52 color];
      [v53 contrastRatioWithColor:v49];
      double v55 = v54;

      if (v55 >= 6.0)
      {
LABEL_36:

        goto LABEL_37;
      }
      v56 = [v42 stroke];
      id v50 = [v56 mutableCopy];

      [v50 setWidth:2.0];
      id v57 = [v50 copy];
      [v42 setStroke:v57];
    }
    goto LABEL_36;
  }
LABEL_37:
  if (((v44 | [v17 wantsToRenderHighContrastBackground] ^ 1 | v48) & 1) == 0) {
    +[CRLSwatchCache applyFakeStrokeIfNeededForShape:backgroundAppearance:](CRLSwatchCache, "applyFakeStrokeIfNeededForShape:backgroundAppearance:", v42, [v17 backgroundAppearance]);
  }

  return v42;
}

- (id)imageForShapeWithSize:(CGSize)a3 imageScale:(double)a4 shapeType:(int64_t)a5 shapePathSource:(id)a6 angle:(double)a7 editingCoordinator:(id)a8 renderingContext:(id)a9
{
  double height = a3.height;
  double width = a3.width;
  id v17 = a9;
  id v18 = a8;
  double v19 = -[CRLSwatchCache shapeItemWithPresetsForSize:shapeType:shapePathSource:angle:editingCoordinator:renderingContext:](self, "shapeItemWithPresetsForSize:shapeType:shapePathSource:angle:editingCoordinator:renderingContext:", a5, a6, v18, v17, width, height, a7);
  double v20 = [CRLCanvasImager alloc];
  double v21 = [v18 mainBoard];

  double v22 = -[CRLCanvasImager initWithBoard:renderForWideGamut:](v20, "initWithBoard:renderForWideGamut:", v21, [v17 rendersForWideGamut]);
  [(CRLCanvasImager *)v22 setScaledImageSize:sub_1000646A4(width, height, a4)];
  sub_1000646A4(width, height, 1.0);
  [(CRLCanvasImager *)v22 setUnscaledClipRect:sub_100064070()];
  v34 = v19;
  double v23 = +[NSArray arrayWithObjects:&v34 count:1];
  [(CRLCanvasImager *)v22 setInfos:v23];

  double v24 = [(CRLCanvasImager *)v22 newImage];
  if ((unint64_t)a5 <= 0x13 && ((1 << a5) & 0xC0004) != 0)
  {
    uint64_t v25 = objc_opt_class();
    double v26 = sub_1002469D0(v25, v19);
    double v27 = -[CRLSwatchCache p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:](self, "p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:", v26, v24, a4, width, height);

    CGImageRelease(v24);
    double v24 = v27;
  }
  unsigned __int8 v28 = [v19 stroke];
  uint64_t v29 = [v28 color];
  unsigned int v30 = [(CRLSwatchCache *)self p_shouldAddHighContrastBackgroundForShapeType:a5 withStrokeColor:v29 context:v17];

  if (v30)
  {
    double v31 = +[CRLSwatchCache newImageForDarkBackground:atScale:ofSize:inset:](CRLSwatchCache, "newImageForDarkBackground:atScale:ofSize:inset:", v24, a4, width, height, CGSizeZero.width, CGSizeZero.height);
    CGImageRelease(v24);
    double v24 = v31;
  }
  double v32 = +[CRLImage imageWithCGImage:v24 scale:0 orientation:a4];
  CGImageRelease(v24);

  return v32;
}

- (BOOL)p_shouldAddHighContrastBackgroundForShapeType:(int64_t)a3 withStrokeColor:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v9 wantsToRenderHighContrastBackground]
    && ((unint64_t)(a3 - 1) < 0x14 && ((0xEC003u >> (a3 - 1)) & 1) != 0
      ? (int v11 = 0)
      : (a3 != 19 ? (BOOL v10 = (a3 & 0xFFFFFFFFFFFFFFEFLL) == 2) : (BOOL v10 = 1), v10 ? (v11 = 0) : (v11 = 1)),
        [v9 backgroundAppearance] != (id)3
      ? (BOOL v12 = [v9 backgroundAppearance] != (id)2)
      : (BOOL v12 = 0),
        ((v11 | v12) & 1) == 0))
  {
    v14 = -[CRLSwatchCache p_darkBackgroundColorForBackgroundAppearance:](self, "p_darkBackgroundColorForBackgroundAppearance:", [v9 backgroundAppearance]);
    id v15 = +[CRLColor canvas_darkInsertSwatchBackgroundColor];
    unsigned int v13 = [v8 improvesContrastWhenDisplayedOverAlternateBackgroundColor:v15 ratherThanStandardBackgroundColor:v14 inScenario:1] ^ 1;
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)p_darkBackgroundColorForBackgroundAppearance:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    double v3 = +[CRLColor canvas_darkTranslucentSwatchBackground];
  }
  else
  {
    v4 = +[UIColor crl_insertPaneBackgroundColor];
    double v3 = +[CRLColor colorWithUIColor:v4];
  }

  return v3;
}

- (id)imageForImageWithSize:(CGSize)a3 imageScale:(double)a4 imageInfo:(id)a5 editingCoordinator:(id)a6 renderForWideGamut:(BOOL)a7
{
  BOOL v83 = a7;
  double height = a3.height;
  double width = a3.width;
  id v10 = a5;
  double v85 = height;
  double v12 = height + -20.0;
  id v13 = a6;
  v14 = [v10 geometry];
  [v14 size];
  double v81 = v16;
  double v82 = v15;

  id v17 = [v10 geometryWithMask];
  [v17 size];
  double v19 = v18;
  double v21 = v20;

  double v22 = [v10 maskInfo];
  if (!v22)
  {
    double v22 = [v10 defaultMaskInfo];
  }
  double v11 = width + -20.0;
  double v23 = v11 + v11;
  double v24 = v12 + v12;
  uint64_t v25 = [v22 geometry];
  [v25 size];
  double v28 = v26;
  double v29 = v27;
  if (v21 <= v19)
  {

    double v42 = v28 / v29;
    if (v28 / v29 <= width / v85)
    {
      double v44 = v24 * v42;
      double v41 = 20.0;
      double v40 = (v23 - v44) * 0.5 + 20.0;
      double v23 = v44;
    }
    else
    {
      double v43 = v23 / v42;
      double v40 = 20.0;
      double v41 = (v24 - v43) * 0.5 + 20.0;
      double v24 = v43;
    }
  }
  else
  {
    double v30 = sub_100067200(v11 + v11, v24, v26, v27);
    double v32 = v31;
    [v25 center];
    double v34 = v33;
    double v36 = v35;
    double v37 = +[CRLScalarPathSource rectangleWithNaturalSize:](CRLScalarPathSource, "rectangleWithNaturalSize:", v30, v32);
    double v38 = -[CRLCanvasInfoGeometry initWithCenter:size:]([CRLCanvasInfoGeometry alloc], "initWithCenter:size:", v34, v36, v30, v32);

    uint64_t v39 = [[CRLMaskInfo alloc] initWithImageItem:v10 geometry:v38 pathSource:v37];
    double v40 = 20.0;
    double v41 = 20.0;
    double v22 = v39;
  }
  BOOL v45 = [v22 geometry];
  [v45 size];
  double v48 = v23 / v47;
  BOOL v49 = v47 <= 0.0;
  double v50 = 1.0;
  if (v49) {
    double v48 = 1.0;
  }
  if (v46 > 0.0) {
    double v50 = v24 / v46;
  }
  if (v48 >= v50) {
    double v51 = v48;
  }
  else {
    double v51 = v50;
  }
  [v45 position];
  double v54 = sub_1000646A4(v52, v53, v51);
  double v56 = v55;
  uint64_t v57 = +[CRLScalarPathSource rectangleWithNaturalSize:](CRLScalarPathSource, "rectangleWithNaturalSize:", v23, v24);
  v79 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v54, v56, v23, v24);
  v80 = (void *)v57;
  v58 = [[CRLMaskInfo alloc] initWithImageItem:v10 geometry:v79 pathSource:v57];
  double v59 = sub_1000646A4(v82, v81, v51);
  double v60 = v40 - v54;
  double v61 = v41 - v56;
  double v63 = sub_1000674F0(v59, v62);
  double v65 = v64;
  double v66 = sub_1000674F0(v60, v61);
  v68 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v66, v67, v63, v65);
  v69 = [v10 thumbnailAssetPayload];
  if (!v69)
  {
    v69 = [v10 imageAssetPayload];
  }
  v70 = [v13 boardItemFactory];
  v71 = [v70 makeImageItemWithGeometry:v68 imageData:v69 thumbnailData:0];

  [v71 setMaskInfo:v58];
  v72 = [CRLCanvasImager alloc];
  v73 = [v13 mainBoard];

  v74 = [(CRLCanvasImager *)v72 initWithBoard:v73 renderForWideGamut:v83];
  [(CRLCanvasImager *)v74 setScaledImageSize:sub_1000646A4(width, v85, a4)];
  sub_1000646A4(width, v85, 2.0);
  [(CRLCanvasImager *)v74 setUnscaledClipRect:sub_100064070()];
  v86 = v71;
  v75 = +[NSArray arrayWithObjects:&v86 count:1];
  [(CRLCanvasImager *)v74 setInfos:v75];

  v76 = [(CRLCanvasImager *)v74 newImage];
  v77 = +[CRLImage imageWithCGImage:v76 scale:0 orientation:a4];
  CGImageRelease(v76);

  return v77;
}

+ (CGImage)newImageForDarkBackground:(CGImage *)a3 atScale:(double)a4 ofSize:(CGSize)a5 inset:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  double v9 = sub_1000646A4(a5.width, a5.height, a4);
  double v11 = sub_100455AA8(3, v9, v10);
  v19.origin.CGFloat x = sub_100064070();
  CGRect v20 = CGRectInset(v19, width, height);
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat v14 = v20.size.width;
  CGFloat v15 = v20.size.height;
  double v16 = +[CRLColor canvas_darkInsertSwatchBackgroundColor];
  CGContextSetFillColorWithColor(v11, (CGColorRef)[v16 CGColor]);

  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = v14;
  v21.size.CGFloat height = v15;
  CGContextFillRect(v11, v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = v14;
  v22.size.CGFloat height = v15;
  CGContextDrawImage(v11, v22, a3);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  return Image;
}

- (CGImage)p_newImageWithConnectionLineKnobsForShape:(id)a3 atScale:(double)a4 ofSize:(CGSize)a5 overImage:(CGImage *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  double v11 = sub_1000646A4(width, height, a4);
  double v13 = v12;
  CGFloat v14 = sub_100455AA8(3, v11, v12);
  CGFloat v15 = +[CRLCanvasKnob defaultSelectionKnobImage];
  double v16 = +[CRLCanvasKnob greenKnobImage];
  [v15 size];
  double v18 = v17;
  double v20 = v19;
  uint64_t v76 = 0;
  v77 = (double *)&v76;
  uint64_t v78 = 0x3010000000;
  v79 = "";
  CGPoint v80 = CGPointZero;
  uint64_t v71 = 0;
  v72 = (double *)&v71;
  uint64_t v73 = 0x3010000000;
  v74 = "";
  CGPoint v75 = v80;
  uint64_t v66 = 0;
  double v67 = (double *)&v66;
  uint64_t v68 = 0x3010000000;
  v69 = "";
  CGPoint v70 = v80;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_100282D78;
  v65[3] = &unk_1014E7238;
  v65[4] = &v76;
  v65[5] = &v71;
  v65[6] = &v66;
  *(double *)&v65[7] = a4;
  *(double *)&v65[8] = v11;
  *(double *)&v65[9] = v13;
  [v10 withTemporaryLayoutPerform:v65];
  double v21 = sub_100064070();
  CGFloat v63 = v22;
  CGFloat v64 = v21;
  CGFloat v61 = v24;
  CGFloat v62 = v23;
  double v25 = sub_1000646A4(v18, v20, a4);
  double v26 = sub_10006402C(v72[4], v72[5], v25);
  double v28 = v27;
  CGFloat v58 = v30;
  CGFloat v59 = v29;
  double v31 = sub_10006402C(v77[4], v77[5], v25);
  double v33 = v32;
  CGFloat v55 = v35;
  CGFloat v56 = v34;
  double v36 = sub_10006402C(v67[4], v67[5], v25);
  double v38 = v37;
  CGFloat v40 = v39;
  CGFloat rect = v41;
  double v42 = sub_1000674F0(v26, v28);
  CGFloat v57 = v43;
  double v44 = sub_1000674F0(v31, v33);
  CGFloat v46 = v45;
  double v47 = sub_1000674F0(v36, v38);
  CGFloat v49 = v48;
  v81.origin.CGFloat y = v63;
  v81.origin.CGFloat x = v64;
  v81.size.double height = v61;
  v81.size.double width = v62;
  CGContextDrawImage(v14, v81, a6);
  double v50 = (CGImage *)[v15 CGImageForContentsScale:a4];
  v82.origin.CGFloat x = v47;
  v82.origin.CGFloat y = v49;
  v82.size.double width = v40;
  v82.size.double height = rect;
  CGContextDrawImage(v14, v82, v50);
  double v51 = (CGImage *)[v16 CGImageForContentsScale:a4];
  v83.origin.CGFloat x = v42;
  v83.origin.CGFloat y = v57;
  v83.size.double height = v58;
  v83.size.double width = v59;
  CGContextDrawImage(v14, v83, v51);
  double v52 = (CGImage *)[v15 CGImageForContentsScale:a4];
  v84.origin.CGFloat x = v44;
  v84.origin.CGFloat y = v46;
  v84.size.double height = v55;
  v84.size.double width = v56;
  CGContextDrawImage(v14, v84, v52);
  Image = CGBitmapContextCreateImage(v14);
  CGContextRelease(v14);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v76, 8);

  return Image;
}

- (CGSize)swatchInsetForShapeType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x14 || (double v3 = 3.0, ((1 << a3) & 0x1D8006) == 0)) {
    double v3 = 0.0;
  }
  double v4 = v3;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)imageForMovieWithSize:(CGSize)a3 imageScale:(double)a4 movieInfo:(id)a5 editingCoordinator:(id)a6 renderForWideGamut:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a3.height;
  double width = a3.width;
  id v13 = a5;
  id v14 = a6;
  CGFloat v15 = [v13 geometry];
  [v15 size];
  double v17 = v16;
  double v19 = v18;

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100283130;
  v24[3] = &unk_1014E7260;
  id v25 = v13;
  id v26 = v14;
  id v20 = v14;
  id v21 = v13;
  double v22 = -[CRLSwatchCache imageForStyledItemWithSize:imageScale:editingCoordinator:renderForWideGamut:styledInfoAspectRatio:usingSwatchInfoFromBlock:](self, "imageForStyledItemWithSize:imageScale:editingCoordinator:renderForWideGamut:styledInfoAspectRatio:usingSwatchInfoFromBlock:", v20, v7, v24, width, height, a4, v17, v19);

  return v22;
}

- (id)imageForStyledItemWithSize:(CGSize)a3 imageScale:(double)a4 editingCoordinator:(id)a5 renderForWideGamut:(BOOL)a6 styledInfoAspectRatio:(CGSize)a7 usingSwatchInfoFromBlock:(id)a8
{
  BOOL v9 = a6;
  double height = a3.height;
  double width = a3.width;
  double v14 = a3.width + -20.0 + a3.width + -20.0;
  double v15 = a3.height + -20.0 + a3.height + -20.0;
  double v16 = a7.width / a7.height;
  if (a7.width / a7.height <= width / height)
  {
    double v20 = v15 * v16;
    double v19 = 20.0;
    double v18 = (v14 - v20) * 0.5 + 20.0;
    double v14 = v20;
  }
  else
  {
    double v17 = v14 / v16;
    double v18 = 20.0;
    double v19 = (v15 - v17) * 0.5 + 20.0;
    double v15 = v17;
  }
  double v21 = sub_1000674F0(v14, v15);
  double v23 = v22;
  double v24 = sub_1000674F0(v18, v19);
  double v26 = v25;
  double v27 = (void (**)(id, CRLCanvasInfoGeometry *))a8;
  id v28 = a5;
  double v29 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v24, v26, v21, v23);
  double v30 = v27[2](v27, v29);

  double v31 = [CRLCanvasImager alloc];
  double v32 = [v28 mainBoard];

  double v33 = [(CRLCanvasImager *)v31 initWithBoard:v32 renderForWideGamut:v9];
  [(CRLCanvasImager *)v33 setScaledImageSize:sub_1000646A4(width, height, a4)];
  sub_1000646A4(width, height, 2.0);
  [(CRLCanvasImager *)v33 setUnscaledClipRect:sub_100064070()];
  if (v30)
  {
    double v38 = v30;
    double v34 = +[NSArray arrayWithObjects:&v38 count:1];
    [(CRLCanvasImager *)v33 setInfos:v34];
  }
  double v35 = [(CRLCanvasImager *)v33 newImage];
  double v36 = +[CRLImage imageWithCGImage:v35 scale:0 orientation:a4];
  CGImageRelease(v35);

  return v36;
}

@end