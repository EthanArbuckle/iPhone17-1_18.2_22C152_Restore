@interface UIAccessibilityLabelOnlyHUDLayoutManager
- (BOOL)labelContainsSingleCharacter:(id)a3;
- (CGRect)labelFrameForHUD:(id)a3 preferredSize:(CGSize)a4;
- (CGSize)minimumUnscaledSizeForHUD:(id)a3 preferredLabelSize:(CGSize)a4;
- (CGSize)unscaledSizeForHUD:(id)a3 containingSize:(CGSize)a4;
- (id)labelFontForHUD:(id)a3;
@end

@implementation UIAccessibilityLabelOnlyHUDLayoutManager

- (CGSize)unscaledSizeForHUD:(id)a3 containingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = [v7 titleLabel];
  *(double *)&uint64_t v9 = 155.0;
  *(double *)&uint64_t v10 = 155.0;
  if (![(UIAccessibilityLabelOnlyHUDLayoutManager *)self labelContainsSingleCharacter:v8])
  {
    v15.receiver = self;
    v15.super_class = (Class)UIAccessibilityLabelOnlyHUDLayoutManager;
    -[UIAccessibilityHUDLayoutManager unscaledSizeForHUD:containingSize:](&v15, sel_unscaledSizeForHUD_containingSize_, v7, width, height);
    uint64_t v9 = v11;
    uint64_t v10 = v12;
  }

  double v13 = *(double *)&v9;
  double v14 = *(double *)&v10;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)minimumUnscaledSizeForHUD:(id)a3 preferredLabelSize:(CGSize)a4
{
  double v4 = a4.width + 32.0;
  double v5 = a4.height + 48.0;
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGRect)labelFrameForHUD:(id)a3 preferredSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  id v9 = a3;
  [(UIAccessibilityHUDLayoutManager *)self layoutBoundsForHUD:v9];
  double v12 = v11 + v10 * 0.5;
  double v15 = v14 + v13 * 0.5;
  v16 = [v9 window];

  v17 = [v16 screen];
  [v17 scale];
  UIRectCenteredAboutPointScale(v7, v8, width, height, v12, v15, v18);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (id)labelFontForHUD:(id)a3
{
  id v4 = a3;
  double v5 = [v4 titleLabel];
  if ([(UIAccessibilityLabelOnlyHUDLayoutManager *)self labelContainsSingleCharacter:v5])
  {
    uint64_t v6 = [off_1E52D39B8 systemFontOfSize:84.0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIAccessibilityLabelOnlyHUDLayoutManager;
    uint64_t v6 = [(UIAccessibilityHUDLayoutManager *)&v9 labelFontForHUD:v4];
  }
  double v7 = (void *)v6;

  return v7;
}

- (BOOL)labelContainsSingleCharacter:(id)a3
{
  id v3 = a3;
  id v4 = [v3 text];
  if ([v4 length])
  {
    double v5 = [v3 text];
    [v5 rangeOfComposedCharacterSequenceAtIndex:0];
    uint64_t v7 = v6;
    double v8 = [v3 text];
    BOOL v9 = v7 == [v8 length];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end