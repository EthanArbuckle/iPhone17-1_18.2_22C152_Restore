@interface _UIPickerViewStyle_tvOS
- (BOOL)highlightViewIsOverlay;
- (CGSize)defaultSizeForTraitCollection:(id)a3;
- (double)horizontalPaddingForCenterHighlightView;
- (double)horizontalPaddingForContents;
- (double)labelSideOffset;
- (double)paddingAroundWheels;
- (double)paddingBetweenWheels;
- (double)verticalPaddingForCenterHighlightView;
- (id)createCenterHighlightView;
- (void)configureMaskGradientLayer:(id)a3;
@end

@implementation _UIPickerViewStyle_tvOS

- (CGSize)defaultSizeForTraitCollection:(id)a3
{
  double v3 = 480.0;
  double v4 = 420.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)paddingBetweenWheels
{
  return 12.0;
}

- (double)paddingAroundWheels
{
  return 0.0;
}

- (double)labelSideOffset
{
  return 9.0;
}

- (void)configureMaskGradientLayer:(id)a3
{
  v11[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[UIColor colorWithWhite:0.0 alpha:0.0];
  v5 = [v4 CGColor];

  id v6 = +[UIColor colorWithWhite:0.0 alpha:0.71];
  v7 = [v6 CGColor];

  id v8 = +[UIColor colorWithWhite:0.0 alpha:0.8];
  v9 = [v8 CGColor];

  v11[0] = v5;
  v11[1] = v7;
  v11[2] = v9;
  v11[3] = v9;
  v11[4] = v7;
  v11[5] = v5;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];
  [v3 setColors:v10];

  [v3 setLocations:&unk_1ED3EFA28];
}

- (id)createCenterHighlightView
{
  v2 = objc_opt_new();
  id v3 = +[UIColor colorWithDynamicProvider:&__block_literal_global_204];
  [v2 setBackgroundColor:v3];

  [v2 _setContinuousCornerRadius:26.0];
  return v2;
}

- (double)horizontalPaddingForCenterHighlightView
{
  return 9.0;
}

- (double)verticalPaddingForCenterHighlightView
{
  return 16.0;
}

- (double)horizontalPaddingForContents
{
  return 9.0;
}

- (BOOL)highlightViewIsOverlay
{
  return 0;
}

@end