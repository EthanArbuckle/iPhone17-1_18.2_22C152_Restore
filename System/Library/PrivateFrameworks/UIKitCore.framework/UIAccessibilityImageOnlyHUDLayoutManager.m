@interface UIAccessibilityImageOnlyHUDLayoutManager
- (CGRect)imageViewFrameForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4;
- (CGSize)minimumUnscaledSizeForHUD:(id)a3 preferredLabelSize:(CGSize)a4;
- (CGSize)preferredSizeForLabelInHUD:(id)a3 maximumWidth:(double)a4;
@end

@implementation UIAccessibilityImageOnlyHUDLayoutManager

- (CGSize)minimumUnscaledSizeForHUD:(id)a3 preferredLabelSize:(CGSize)a4
{
  double v4 = 107.0;
  double v5 = 139.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)imageViewFrameForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  id v9 = a3;
  -[UIAccessibilityHUDLayoutManager imageViewSizeForHUD:preferredSizeForLabel:](self, "imageViewSizeForHUD:preferredSizeForLabel:", v9, width, height);
  double v11 = v10;
  double v13 = v12;
  [(UIAccessibilityHUDLayoutManager *)self layoutBoundsForHUD:v9];
  double v16 = v15 + v14 * 0.5;
  double v19 = v18 + v17 * 0.5;
  v20 = [v9 window];
  v21 = [v20 screen];
  [v21 scale];
  UIRectCenteredAboutPointScale(v7, v8, v11, v13, v16, v19, v22);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  [(UIAccessibilityHUDLayoutManager *)self imageInsetsForHUD:v9];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  double v39 = v24 + v34;
  double v40 = v26 + v32;
  double v41 = v28 - (v34 + v38);
  double v42 = v30 - (v32 + v36);
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (CGSize)preferredSizeForLabelInHUD:(id)a3 maximumWidth:(double)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v5;
  result.double width = v4;
  return result;
}

@end