@interface UIKBRenderFactory_CarLinear
- (double)activeLetterFontSize;
- (double)carKeyRadius;
- (double)defaultKeyFontSize;
- (double)letterLineFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)lightTextFontName;
- (void)setupLayoutSegments;
@end

@implementation UIKBRenderFactory_CarLinear

- (double)carKeyRadius
{
  [(UIKBRenderFactory_Car *)self carScale];
  return 8.0 / v2;
}

- (double)defaultKeyFontSize
{
  [(UIKBRenderFactory_Car *)self carScale];
  return 32.0 / v2;
}

- (double)letterLineFontSize
{
  [(UIKBRenderFactory_Car *)self carScale];
  return 18.0 / v2;
}

- (double)activeLetterFontSize
{
  [(UIKBRenderFactory_Car *)self carScale];
  return 40.0 / v2;
}

- (id)lightTextFontName
{
  return @"UIKBRenderFactorySystemFontName";
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v77.receiver = self;
  v77.super_class = (Class)UIKBRenderFactory_CarLinear;
  v8 = [(UIKBRenderFactory_Car *)&v77 _traitsForKey:v6 onKeyplane:v7];
  v9 = [v8 geometry];
  [v9 setRoundRectCorners:-1];

  [(UIKBRenderFactory_CarLinear *)self carKeyRadius];
  double v11 = v10;
  v12 = [v8 geometry];
  [v12 setRoundRectRadius:v11];

  if (([v6 state] & 0xC) != 0) {
    [(UIKBRenderFactory_Car *)self highlightedKeyColor];
  }
  else {
  v13 = [(UIKBRenderFactory_Car *)self activeKeyColor];
  }
  v14 = [v8 symbolStyle];
  [v14 setTextColor:v13];

  if ([v6 interactionType] == 9)
  {
    v15 = [v8 geometry];
    v16 = v15;
    uint64_t v17 = 5;
LABEL_9:
    [v15 setRoundRectCorners:v17];

    goto LABEL_10;
  }
  if ([v6 interactionType] == 15)
  {
    v18 = [v7 firstCachedKeyWithName:@"International-Key"];
    int v19 = [v18 visible];

    if (v19)
    {
      v15 = [v8 geometry];
      v16 = v15;
      uint64_t v17 = 10;
      goto LABEL_9;
    }
  }
LABEL_10:
  if ([v6 displayType] == 38)
  {
    v20 = [(UIKBRenderFactory_Car *)self enabledKeyColor];
    v21 = +[UIKBGradient gradientWithFlatColor:v20];
    [v8 setBackgroundGradient:v21];

    v22 = [v8 geometry];
    [v22 paddedFrame];
    double v74 = v23;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    [(UIKBRenderFactory_CarLinear *)self carKeyRadius];
    double v31 = v27 - v30;
    double v32 = floor(v31 * 0.095);
    v33 = [v8 geometry];
    [v33 paddedFrame];
    double MidX = CGRectGetMidX(v79);
    [v7 frame];
    double v35 = CGRectGetMidX(v80);

    double v36 = 0.0;
    if (MidX < v35)
    {
      [(UIKBRenderFactory_CarLinear *)self carKeyRadius];
      double v36 = v37;
    }
    id v76 = v7;
    double v38 = v32 * 0.2;
    v39 = [v6 subtrees];
    uint64_t v40 = [v39 count];

    v75 = self;
    BOOL v41 = ([v6 selectedVariantIndex] & 0x8000000000000000) == 0
       && [v6 selectedVariantIndex] < v40;
    uint64_t v42 = [v6 selectedVariantIndex];
    v81.origin.x = v74;
    v81.origin.y = v25;
    v81.size.width = v31;
    v81.size.height = v29;
    double MaxX = CGRectGetMaxX(v81);
    double v44 = v32;
    if (v41) {
      double v45 = v38 + v38 - v32 + -2.0;
    }
    else {
      double v45 = -0.0;
    }
    v46 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v40];
    if (v40 >= 1)
    {
      uint64_t v47 = 0;
      double v48 = v74 + v36;
      double v49 = (v45 + MaxX - (v74 + v36) - v38) / (double)v40;
      double v50 = -0.0;
      if (v42) {
        double v50 = v38;
      }
      double v51 = v48 + v50;
      do
      {
        if (v47 == [v6 selectedVariantIndex]) {
          double v52 = v44;
        }
        else {
          double v52 = v49;
        }
        v53 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v51, v25, v52, v29, v51, v25, v52, v29);
        [v53 symbolFrame];
        objc_msgSend(v53, "setSymbolFrame:", v54 + -2.0, v56 + 0.0, v55 + 4.0);
        [v46 addObject:v53];
        double v57 = -0.0;
        if (!(v47 | v42)) {
          double v57 = v38;
        }
        double v51 = v52 + v51 + v57;

        ++v47;
      }
      while (v40 != v47);
    }
    [v8 setVariantGeometries:v46];
    if (v40)
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        v59 = [v6 subtrees];
        v60 = [v59 objectAtIndex:i];
        v61 = [v8 variantGeometries];
        v62 = [v61 objectAtIndex:i];
        v63 = [v62 similarShape];
        [v60 setShape:v63];
      }
    }
    v64 = [(UIKBRenderFactory_CarLinear *)v75 lightTextFontName];
    [(UIKBRenderFactory_CarLinear *)v75 letterLineFontSize];
    v65 = +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v64);

    v66 = [(UIKBRenderFactory_Car *)v75 activeKeyColor];
    [v65 setTextColor:v66];

    v67 = +[UIKBRenderTraits traitsWithSymbolStyle:v65];
    [v8 setVariantTraits:v67];

    [(UIKBRenderFactory_CarLinear *)v75 activeLetterFontSize];
    v68 = +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", 0);
    v69 = [(UIKBRenderFactory_Car *)v75 highlightedKeyColor];
    [v68 setTextColor:v69];

    objc_msgSend(v68, "setTextOffset:", 0.0, 2.0);
    v70 = +[UIKBRenderTraits traitsWithSymbolStyle:v68];
    v71 = [(UIKBRenderFactory_Car *)v75 activeKeyColor];
    v72 = +[UIKBGradient gradientWithFlatColor:v71];
    [v70 setLayeredForegroundGradient:v72];

    [v8 setHighlightedVariantTraits:v70];
    id v7 = v76;
  }

  return v8;
}

- (void)setupLayoutSegments
{
  id v8 = +[UIKBRenderGeometry geometryWithShape:0];
  [v8 setRoundRectCorners:5];
  v3 = +[UIKBRenderTraits traitsWithGeometry:v8];
  v4 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v3];
  objc_msgSend(v4, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, 0.5, 0.5);
  [(UIKBRenderFactory *)self addLayoutSegment:v4];
  v5 = +[UIKBRenderGeometry geometryWithShape:0];
  [v5 setRoundRectCorners:10];
  id v6 = +[UIKBRenderTraits traitsWithGeometry:v5];
  id v7 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v6];
  objc_msgSend(v7, "addLayoutRect:asTriangle:", 0, 0.5, 0.0, 0.5, 0.5);
  [(UIKBRenderFactory *)self addLayoutSegment:v7];
}

@end