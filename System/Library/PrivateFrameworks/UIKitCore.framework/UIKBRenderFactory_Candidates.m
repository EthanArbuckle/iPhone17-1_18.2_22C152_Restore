@interface UIKBRenderFactory_Candidates
- (UIKBRenderFactory_Candidates)initWithRenderingContext:(id)a3;
- (id)traitsForHWRCellSize:(CGSize)a3 highlighted:(BOOL)a4;
- (int64_t)lightHighQualityEnabledBlendForm;
@end

@implementation UIKBRenderFactory_Candidates

- (int64_t)lightHighQualityEnabledBlendForm
{
  return 2;
}

- (UIKBRenderFactory_Candidates)initWithRenderingContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactory_Candidates;
  return [(UIKBRenderFactory *)&v4 initWithRenderingContext:a3 skipLayoutSegments:1];
}

- (id)traitsForHWRCellSize:(CGSize)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v47[3] = *MEMORY[0x1E4F143B8];
  v8 = +[UIKBRenderTraits emptyTraits];
  v9 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
  [v8 setGeometry:v9];

  [(UIKBRenderFactory *)self translucentGapWidth];
  double v11 = v10;
  v12 = [v8 geometry];
  [v12 paddedFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19 - v11;
  v21 = [v8 geometry];
  objc_msgSend(v21, "setPaddedFrame:", v14, v16, v20, v18);

  if ([(UIKBRenderFactory *)self assetIdiom] != 1
    && [(UIKBRenderFactory *)self assetIdiom] != 24
    && [(UIKBRenderFactory *)self assetIdiom] != 25
    && [(UIKBRenderFactory *)self assetIdiom] != 26
    && [(UIKBRenderFactory *)self assetIdiom] != 23)
  {
    v22 = [(UIKBRenderFactory *)self renderConfig];
    int v23 = [v22 whiteText];
    v24 = UIKBColorWhite_Alpha10;
    if (!v23) {
      v24 = UIKBColorBlack_Alpha10;
    }
    v25 = *v24;

    v26 = [(UIKBRenderFactory *)self renderConfig];
    int v27 = [v26 whiteText];
    v28 = UIKBColorWhite_Alpha0;
    if (!v27) {
      v28 = UIKBColorClear;
    }
    v29 = *v28;

    v47[0] = v25;
    v47[1] = v25;
    v47[2] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
    v31 = +[UIKBGradient gradientWith3Colors:v30 middleLocation:0.5];
    v32 = +[UIKBEdgeEffect effectWithColor:0 edges:8 inset:-v11 weight:v11];

    [v32 setGradient:v31];
    [v8 addRenderEffect:v32];
  }
  if (v4)
  {
    int64_t v33 = +[UIKBRenderFactory _graphicsQuality];
    v34 = [(UIKBRenderFactory *)self renderConfig];
    int v35 = [v34 lightKeyboard];
    v36 = (id *)UIKBColorHWRCellLightBackground;
    v37 = UIKBDarkLowQualityHWRCandidateCellHighlightedBackgroundGradientStart;
    if (v33 == 10)
    {
      v38 = UIKBDarkLowQualityHWRCandidateCellHighlightedBackgroundGradientEnd;
    }
    else
    {
      v37 = UIKBColorHWRCellDarkBackground;
      v38 = UIKBColorHWRCellDarkBackgroundClear;
    }
    if (!v35) {
      v36 = (id *)v37;
    }
    id v39 = *v36;

    v40 = [(UIKBRenderFactory *)self renderConfig];
    if ([v40 lightKeyboard]) {
      v41 = (id *)UIKBColorHWRCellLightBackgroundClear;
    }
    else {
      v41 = (id *)v38;
    }
    id v42 = *v41;

    v46[0] = v39;
    v46[1] = v39;
    v46[2] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
    v44 = +[UIKBGradient gradientWith3Colors:v43 middleLocation:0.5];
    [v8 setBackgroundGradient:v44];
  }
  return v8;
}

@end