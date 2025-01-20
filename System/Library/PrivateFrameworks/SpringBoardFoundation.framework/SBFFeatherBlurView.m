@interface SBFFeatherBlurView
+ (BOOL)_requiresLowQualityFeatherBlur:(unint64_t)a3;
+ (UIEdgeInsets)gradientMaskLayerInsetsForFeatherBlurRecipe:(unint64_t)a3;
+ (id)configureGradientMaskForFeatherBlurRecipe:(unint64_t)a3 onContentView:(id)a4;
+ (id)matchMoveAnimationForFrame:(CGRect)a3 relativeToView:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (MTMaterialView)backgroundBlurView;
- (SBFFeatherBlurView)initWithRecipe:(unint64_t)a3;
- (double)intrinsicHeight;
- (void)layoutSubviews;
- (void)setIntrinsicHeight:(double)a3;
@end

@implementation SBFFeatherBlurView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBFFeatherBlurView;
  [(SBFFeatherBlurView *)&v3 layoutSubviews];
  [(SBFFeatherBlurView *)self bounds];
  -[MTMaterialView setFrame:](self->_backgroundBlurView, "setFrame:");
}

+ (BOOL)_requiresLowQualityFeatherBlur:(unint64_t)a3
{
  v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = objc_msgSend(v4, "sbf_featherBlurGraphicsQuality");

  return (a3 == 2 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) && v5 < 100;
}

- (SBFFeatherBlurView)initWithRecipe:(unint64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SBFFeatherBlurView;
  v4 = -[SBFFeatherBlurView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v5 = v4;
  if (v4)
  {
    if (a3 > 7)
    {
      v6 = 0;
    }
    else
    {
      v6 = off_1E548CF80[a3];
      *(void *)&v4->_intrinsicHeight = qword_18B5E4150[a3];
    }
    v7 = (void *)MEMORY[0x1E4F743C8];
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v7 materialViewWithRecipeNamed:v6 inBundle:v8 options:0 initialWeighting:0 scaleAdjustment:0.99];
    backgroundBlurView = v5->_backgroundBlurView;
    v5->_backgroundBlurView = (MTMaterialView *)v9;

    char v11 = [(id)objc_opt_class() _requiresLowQualityFeatherBlur:a3];
    v12 = v5->_backgroundBlurView;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __37__SBFFeatherBlurView_initWithRecipe___block_invoke;
    v15[3] = &__block_descriptor_33_e8_d16__0d8l;
    char v16 = v11;
    [(MTMaterialView *)v12 setBackdropScaleAdjustment:v15];
    v13 = v5->_backgroundBlurView;
    [(SBFFeatherBlurView *)v5 bounds];
    -[MTMaterialView setFrame:](v13, "setFrame:");
    [(SBFFeatherBlurView *)v5 addSubview:v5->_backgroundBlurView];
    [(MTMaterialView *)v5->_backgroundBlurView setWeighting:1.0];
  }
  return v5;
}

double __37__SBFFeatherBlurView_initWithRecipe___block_invoke(uint64_t a1, double a2)
{
  return dbl_18B5E4140[*(unsigned char *)(a1 + 32) == 0] / a2;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4F43ED8];
  double intrinsicHeight = self->_intrinsicHeight;
  result.height = intrinsicHeight;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double intrinsicHeight = self->_intrinsicHeight;
  result.height = intrinsicHeight;
  return result;
}

+ (id)configureGradientMaskForFeatherBlurRecipe:(unint64_t)a3 onContentView:(id)a4
{
  v52[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [v7 superview];
  if (!v8)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:a1 file:@"SBFFeatherBlurView.m" lineNumber:121 description:@"contentView must have a superview."];
  }
  if ([(id)objc_opt_class() _requiresLowQualityFeatherBlur:a3])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v10 = NSString;
    char v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = [v10 stringWithFormat:@"<%@:%p>:destOut", v12, v7];

    v14 = [MEMORY[0x1E4F39B40] layer];
    [v14 setCaptureOnly:1];
    [v14 setGroupName:v13];
    v15 = [v8 layer];
    char v16 = [v7 layer];
    [v15 insertSublayer:v14 below:v16];

    objc_super v17 = [MEMORY[0x1E4F428B8] whiteColor];
    v18 = v17;
    v19 = 0;
    v44 = v14;
    uint64_t v20 = 0;
    switch(a3)
    {
      case 0uLL:
        id v21 = [v17 colorWithAlphaComponent:0.84];
        v52[0] = [v21 CGColor];
        id v22 = [v18 colorWithAlphaComponent:0.66];
        v52[1] = [v22 CGColor];
        id v24 = [v18 colorWithAlphaComponent:0.0];
        v52[2] = [v24 CGColor];
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];

        v19 = &unk_1ED89EA28;
        goto LABEL_11;
      case 1uLL:
      case 3uLL:
        id v21 = [v17 colorWithAlphaComponent:0.84];
        v50[0] = [v21 CGColor];
        id v22 = [v18 colorWithAlphaComponent:0.66];
        v50[1] = [v22 CGColor];
        id v23 = [v18 colorWithAlphaComponent:0.0];
        v50[2] = [v23 CGColor];
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:3];

        v19 = &unk_1ED89EA58;
        goto LABEL_11;
      case 2uLL:
        id v21 = [v17 colorWithAlphaComponent:0.84];
        v51[0] = [v21 CGColor];
        id v22 = [v18 colorWithAlphaComponent:0.0];
        v51[1] = [v22 CGColor];
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
        v19 = &unk_1ED89EA40;
        goto LABEL_11;
      case 4uLL:
        id v21 = [v17 colorWithAlphaComponent:0.77];
        v49[0] = [v21 CGColor];
        id v22 = [v18 colorWithAlphaComponent:0.81];
        v49[1] = [v22 CGColor];
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
        v19 = &unk_1ED89EA70;
        goto LABEL_11;
      case 7uLL:
        id v21 = [v17 colorWithAlphaComponent:0.84];
        v48[0] = [v21 CGColor];
        id v22 = [v18 colorWithAlphaComponent:0.42];
        v48[1] = [v22 CGColor];
        id v25 = [v18 colorWithAlphaComponent:0.0];
        v48[2] = [v25 CGColor];
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];

        v19 = &unk_1ED89EA88;
LABEL_11:

        break;
      default:
        break;
    }
    v43 = (void *)v20;
    v26 = [MEMORY[0x1E4F39BD0] layer];
    [v26 setType:*MEMORY[0x1E4F3A390]];
    [v26 setColors:v20];
    [v26 setLocations:v19];
    objc_msgSend(v26, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v26, "setEndPoint:", 0.5, 1.0);
    [v26 setCompositingFilter:*MEMORY[0x1E4F3A098]];
    v27 = [v8 layer];
    v28 = [v7 layer];
    [v27 insertSublayer:v26 above:v28];

    v29 = [MEMORY[0x1E4F39B40] layer];
    [v29 setGroupName:v13];
    [v29 setCompositingFilter:*MEMORY[0x1E4F3A0A0]];
    v30 = [v8 layer];
    [v30 insertSublayer:v29 above:v26];

    v31 = [v8 layer];
    [v31 setAllowsGroupBlending:0];

    v46[0] = @"position";
    v32 = [MEMORY[0x1E4F1CA98] null];
    v47[0] = v32;
    v46[1] = @"bounds";
    [MEMORY[0x1E4F1CA98] null];
    v33 = v42 = (void *)v13;
    v47[1] = v33;
    v46[2] = @"opacity";
    v34 = [MEMORY[0x1E4F1CA98] null];
    v47[2] = v34;
    v46[3] = @"hidden";
    [MEMORY[0x1E4F1CA98] null];
    v35 = v8;
    id v36 = v7;
    v38 = v37 = v18;
    v47[3] = v38;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:4];

    [v44 setActions:v39];
    [v26 setActions:v39];
    [v29 setActions:v39];
    v45[0] = v44;
    v45[1] = v26;
    v45[2] = v29;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];

    id v7 = v36;
    v8 = v35;
  }
  return v9;
}

+ (UIEdgeInsets)gradientMaskLayerInsetsForFeatherBlurRecipe:(unint64_t)a3
{
  if (a3 - 4 >= 4)
  {
    double v3 = 0.0;
    double v5 = 30.0;
    if (a3 != 3) {
      double v5 = -10.0;
    }
    double v4 = 0.0;
    double v6 = 0.0;
  }
  else
  {
    double v3 = *MEMORY[0x1E4F437F8];
    double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (id)matchMoveAnimationForFrame:(CGRect)a3 relativeToView:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v26[4] = *MEMORY[0x1E4F143B8];
  v8 = (objc_class *)MEMORY[0x1E4F39C00];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  char v11 = [v9 layer];

  [v10 setSourceLayer:v11];
  v12 = (void *)MEMORY[0x1E4F29238];
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  v14 = objc_msgSend(v12, "valueWithCGPoint:", MinX, CGRectGetMinY(v29));
  v26[0] = v14;
  v15 = (void *)MEMORY[0x1E4F29238];
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  objc_super v17 = objc_msgSend(v15, "valueWithCGPoint:", MaxX, CGRectGetMinY(v31));
  v26[1] = v17;
  v18 = (void *)MEMORY[0x1E4F29238];
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v19 = CGRectGetMaxX(v32);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  uint64_t v20 = objc_msgSend(v18, "valueWithCGPoint:", v19, CGRectGetMaxY(v33));
  v26[2] = v20;
  id v21 = (void *)MEMORY[0x1E4F29238];
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v22 = CGRectGetMinX(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  id v23 = objc_msgSend(v21, "valueWithCGPoint:", v22, CGRectGetMaxY(v35));
  v26[3] = v23;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  [v10 setSourcePoints:v24];

  [v10 setAppliesX:0];
  [v10 setAppliesY:1];
  [v10 setAppliesScale:1];
  [v10 setAppliesRotation:0];
  [v10 setDuration:INFINITY];
  [v10 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v10 setRemovedOnCompletion:0];
  return v10;
}

- (MTMaterialView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (double)intrinsicHeight
{
  return self->_intrinsicHeight;
}

- (void)setIntrinsicHeight:(double)a3
{
  self->_double intrinsicHeight = a3;
}

- (void).cxx_destruct
{
}

@end