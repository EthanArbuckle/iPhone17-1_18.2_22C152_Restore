@interface PUPhotoEditToolControllerSpec
+ (UIColor)toolPickerSelectionColor;
- (BOOL)isiPadLayout;
- (double)standardBottomBarHeight;
- (double)standardSideBarWidth;
- (int64_t)layoutOrientation;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUPhotoEditToolControllerSpec

+ (UIColor)toolPickerSelectionColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] colorWithRed:0.97 green:0.8 blue:0.0 alpha:1.0];
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (BOOL)isiPadLayout
{
  return [(PUViewControllerSpec *)self currentLayoutStyle] == 4;
}

- (double)standardSideBarWidth
{
  if (![(PUViewControllerSpec *)self currentLayoutStyle])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUPhotoEditToolControllerSpec.m" lineNumber:45 description:@"Invalid layout style"];
  }
  unint64_t v4 = [(PUViewControllerSpec *)self currentLayoutStyle];
  double result = 0.0;
  if (v4 <= 4) {
    return dbl_1AEFF8130[v4];
  }
  return result;
}

- (double)standardBottomBarHeight
{
  if (![(PUViewControllerSpec *)self currentLayoutStyle])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUPhotoEditToolControllerSpec.m" lineNumber:27 description:@"Invalid layout style"];
  }
  unint64_t v4 = [(PUViewControllerSpec *)self currentLayoutStyle];
  double result = 141.0;
  if (v4 >= 5) {
    return 0.0;
  }
  return result;
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  self->_layoutOrientation = a3;
}

- (void)setLayoutOrientation:(int64_t)a3
{
}

@end