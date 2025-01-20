@interface PUCropToolControllerSpec
- (CGSize)cropActionButtonSize;
- (CGSize)minimumCropSize;
- (PXLabelSpec)cropHeaderLabelSpec;
- (UIColor)cropAspectButtonColor;
- (UIColor)cropAspectButtonSelectedColor;
- (UIEdgeInsets)cropAspectRatioButtonTitleInset;
- (UIEdgeInsets)cropAspectRatioScrollContentInset;
- (double)cropAspectFlipperWidth;
- (double)cropAspectRatioScrollHeight;
- (double)cropHandleViewLineMargin;
- (double)cropHandleViewLineThickness;
- (double)cropRectMargin;
- (double)leftInsetForiPad;
- (double)minimumCropInset;
- (double)standardBottomBarHeight;
- (double)standardBottomBarWidth;
- (double)standardSideBarHeight;
- (double)standardSideBarWidth;
@end

@implementation PUCropToolControllerSpec

- (UIColor)cropAspectButtonSelectedColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] labelColor];
}

- (UIColor)cropAspectButtonColor
{
  v2 = [MEMORY[0x1E4FB1618] labelColor];
  v3 = [v2 colorWithAlphaComponent:0.6];

  return (UIColor *)v3;
}

- (UIEdgeInsets)cropAspectRatioButtonTitleInset
{
  double v2 = 0.0;
  double v3 = -20.0;
  double v4 = 0.0;
  double v5 = -20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)cropAspectRatioScrollContentInset
{
  double v2 = 90.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 90.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (double)cropAspectFlipperWidth
{
  return 180.0;
}

- (double)cropAspectRatioScrollHeight
{
  BOOL v2 = [(PUPhotoEditToolControllerSpec *)self isiPadLayout];
  double result = 105.0;
  if (!v2) {
    return 21.0;
  }
  return result;
}

- (PXLabelSpec)cropHeaderLabelSpec
{
  BOOL v2 = objc_opt_new();
  double v3 = PXFontWithTextStyle();
  [v2 setFont:v3];

  double v4 = [MEMORY[0x1E4FB1618] labelColor];
  [v2 setTextColor:v4];

  return (PXLabelSpec *)v2;
}

- (double)standardSideBarHeight
{
  return 240.0;
}

- (double)standardBottomBarWidth
{
  return 240.0;
}

- (double)leftInsetForiPad
{
  return 80.0;
}

- (double)standardSideBarWidth
{
  return 141.0;
}

- (double)standardBottomBarHeight
{
  return 141.0;
}

- (double)cropHandleViewLineThickness
{
  return 2.0;
}

- (double)cropHandleViewLineMargin
{
  return 10.0;
}

- (CGSize)minimumCropSize
{
  [(PUCropToolControllerSpec *)self cropHandleViewLineThickness];
  double v4 = v3;
  [(PUCropToolControllerSpec *)self cropHandleViewLineMargin];
  double v6 = v4 + v5;
  [(PUCropToolControllerSpec *)self minimumCropHandleViewSize];
  double v9 = v7 - v6 + v7 - v6;
  double v10 = v8 - v6 + v8 - v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)minimumCropInset
{
  BOOL v2 = +[PUPhotoEditProtoSettings sharedInstance];
  [v2 cropSideMargins];
  double v4 = v3;

  return v4;
}

- (CGSize)cropActionButtonSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)cropRectMargin
{
  return 16.0;
}

@end