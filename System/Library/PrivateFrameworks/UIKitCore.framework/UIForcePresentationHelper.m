@interface UIForcePresentationHelper
+ (CGRect)sourceRectForView:(id)a3 proposedSourceRect:(CGRect)a4;
+ (id)snapshotViewForSourceView:(id)a3 sourceRect:(CGRect)a4;
+ (id)visualEffectForPresentationPhase:(unint64_t)a3 traitCollection:(id)a4 variant:(int64_t)a5;
+ (void)applyPhase:(unint64_t)a3 toSnapshotView:(id)a4;
@end

@implementation UIForcePresentationHelper

+ (id)visualEffectForPresentationPhase:(unint64_t)a3 traitCollection:(id)a4 variant:(int64_t)a5
{
  v51[4] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a3 <= 5 && ((1 << a3) & 0x31) != 0)
  {
    v8 = 0;
    goto LABEL_20;
  }
  v9 = __UIStatusBarManagerForWindow(0);
  uint64_t v10 = [v9 statusBarStyle];

  if (!v10)
  {
    uint64_t v22 = [v7 userInterfaceStyle];
    BOOL v23 = v22 != 2;
    if (a3 == 1)
    {
      uint64_t v24 = v22;
      double v25 = _UIColorEffectPremultiplyGray(0.0, 0.1);
      double v18 = 4.0;
      double v19 = 0.015;
      double v49 = v27;
      double v50 = v28;
      if (v24 == 2)
      {
        double v17 = v28;
        double v15 = v27;
        double v20 = v26;
        double v13 = v26;
        double v21 = v25;
        double v11 = v25;
      }
      else
      {
        double v21 = v25;
        double v20 = v26;
        double v11 = _UIColorEffectPremultiplyGray(1.0, 0.35);
        double v13 = v29;
        double v15 = v30;
        double v17 = v31;
      }
      goto LABEL_17;
    }
LABEL_11:
    double v19 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
    double v13 = 0.0;
    double v11 = 0.0;
    double v49 = 0.0;
    double v50 = 0.0;
    double v20 = 0.0;
    double v21 = 0.0;
    double v18 = 0.0;
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      double v21 = _UIColorEffectPremultiplyGray(0.0, dbl_186B92790[a5 == 1]);
      double v20 = v32;
      double v49 = v33;
      double v50 = v34;
      if (v23)
      {
        double v35 = 0.35;
        double v36 = 1.0;
      }
      else
      {
        double v35 = 0.1;
        double v36 = 0.0;
      }
      double v11 = _UIColorEffectPremultiplyGray(v36, v35);
      double v13 = v37;
      double v15 = v38;
      double v17 = v39;
      double v18 = 8.0;
      double v19 = 0.025;
    }
    goto LABEL_17;
  }
  if (a3 != 1)
  {
    BOOL v23 = 0;
    goto LABEL_11;
  }
  double v11 = _UIColorEffectPremultiplyGray(0.0, 0.1);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = 4.0;
  double v19 = 0.015;
  double v49 = v14;
  double v50 = v16;
  double v20 = v12;
  double v21 = v11;
LABEL_17:
  if (_AXSEnhanceBackgroundContrastEnabled())
  {
    double v19 = 0.0;
    double v11 = _UIColorEffectPremultiplyGray(0.0, 0.4);
    double v13 = v40;
    double v15 = v41;
    double v17 = v42;
    double v18 = 0.0;
  }
  v43 = +[UIBlurEffect _effectWithBlurRadius:v18 scale:0.5];
  v51[0] = v43;
  v44 = +[UIColorEffect _colorEffectSourceOver:](UIColorEffect, "_colorEffectSourceOver:", v11, v13, v15, v17);
  v51[1] = v44;
  v45 = +[UIColorEffect _colorEffectSourceOver:](UIColorEffect, "_colorEffectSourceOver:", v21, v20, v49, v50);
  v51[2] = v45;
  v46 = +[_UIZoomEffect zoomEffectWithMagnitude:v19];
  v51[3] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
  v8 = +[UIVisualEffect effectCombiningEffects:v47];

LABEL_20:
  return v8;
}

+ (CGRect)sourceRectForView:(id)a3 proposedSourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  if (CGRectIsEmpty(v27))
  {
    double height = v16;
    double width = v14;
    double y = v12;
    double x = v10;
  }
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  v33.origin.double x = v10;
  v33.origin.double y = v12;
  v33.size.double width = v14;
  v33.size.double height = v16;
  if (CGRectEqualToRect(v28, v33))
  {
    double v17 = [v8 window];
    double v18 = v17;
    if (v17)
    {
      [v17 bounds];
      objc_msgSend(v8, "convertRect:fromCoordinateSpace:", v18);
      CGFloat v19 = v29.origin.x;
      CGFloat v20 = v29.origin.y;
      CGFloat v21 = v29.size.width;
      CGFloat v22 = v29.size.height;
      v34.origin.double x = x;
      v34.origin.double y = y;
      v34.size.double width = width;
      v34.size.double height = height;
      if (CGRectIntersectsRect(v29, v34))
      {
        v30.origin.double x = v19;
        v30.origin.double y = v20;
        v30.size.double width = v21;
        v30.size.double height = v22;
        v35.origin.double x = x;
        v35.origin.double y = y;
        v35.size.double width = width;
        v35.size.double height = height;
        CGRect v31 = CGRectIntersection(v30, v35);
        double x = v31.origin.x;
        double y = v31.origin.y;
        double width = v31.size.width;
        double height = v31.size.height;
      }
    }
  }
  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

+ (id)snapshotViewForSourceView:(id)a3 sourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = objc_msgSend(a3, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0.0, 0.0, 0.0, 0.0);
  [v8 setAutoresizingMask:18];
  double v9 = -[_UIPreviewPresentationEffectView initWithFrame:]([_UIPreviewPresentationEffectView alloc], "initWithFrame:", x, y, width, height);
  [(UIView *)v9 addSubview:v8];

  return v9;
}

+ (void)applyPhase:(unint64_t)a3 toSnapshotView:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 == 2)
  {
    [v5 setBlurRadius:60.0];
    [v6 setAlpha:0.0];
  }
  else if (a3 == 1)
  {
    [v5 frame];
    if (v7 >= v8) {
      double v9 = v7;
    }
    else {
      double v9 = v8;
    }
    double v10 = fmax(60.0 / v9, 1.0175);
    if (v10 > 4.0) {
      double v10 = 4.0;
    }
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v14.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v14.c = v11;
    *(_OWORD *)&v14.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v13.a = *(_OWORD *)&v14.a;
    *(_OWORD *)&v13.c = v11;
    *(_OWORD *)&v13.tdouble x = *(_OWORD *)&v14.tx;
    CGAffineTransformScale(&v14, &v13, v10, v10);
    CGAffineTransform v12 = v14;
    [v6 setTransform:&v12];
  }
}

@end