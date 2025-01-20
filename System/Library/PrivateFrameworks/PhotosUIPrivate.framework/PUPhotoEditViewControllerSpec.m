@interface PUPhotoEditViewControllerSpec
- (BOOL)shouldAllowApertureButtonExpansion;
- (BOOL)shouldAnchorLightingAgainstToolbar;
- (BOOL)shouldDisplayCompactToolbar;
- (BOOL)shouldDisplayExtensionButtonInMainToolbar;
- (BOOL)shouldUseCompactToolbarSpacing;
- (BOOL)toolbarShadows_shouldShowToolbarUnderline;
- (UIEdgeInsets)previewViewInsetsLandscape;
- (UIEdgeInsets)previewViewInsetsPortrait;
- (UIEdgeInsets)scrubberViewMargin;
- (double)toolbarLongSideMargin;
- (double)toolbarLongSideWideMargin;
@end

@implementation PUPhotoEditViewControllerSpec

- (BOOL)shouldAllowApertureButtonExpansion
{
  return 1;
}

- (BOOL)toolbarShadows_shouldShowToolbarUnderline
{
  return [(PUViewControllerSpec *)self currentLayoutStyle] != 4;
}

- (BOOL)shouldUseCompactToolbarSpacing
{
  return [(PUViewControllerSpec *)self currentLayoutStyle] == 1;
}

- (BOOL)shouldAnchorLightingAgainstToolbar
{
  return [(PUViewControllerSpec *)self currentLayoutStyle] != 4;
}

- (BOOL)shouldDisplayCompactToolbar
{
  return [(PUViewControllerSpec *)self currentLayoutStyle] != 4;
}

- (BOOL)shouldDisplayExtensionButtonInMainToolbar
{
  return (unint64_t)([(PUViewControllerSpec *)self currentLayoutStyle] - 3) < 2;
}

- (UIEdgeInsets)scrubberViewMargin
{
  double v2 = 32.0;
  double v3 = 12.0;
  double v4 = 16.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)toolbarLongSideWideMargin
{
  unint64_t v2 = [(PUViewControllerSpec *)self currentLayoutStyle];
  double result = 0.0;
  if (v2 <= 4) {
    return dbl_1AEFF8260[v2];
  }
  return result;
}

- (double)toolbarLongSideMargin
{
  unint64_t v2 = [(PUViewControllerSpec *)self currentLayoutStyle];
  double result = 0.0;
  if (v2 <= 4) {
    return dbl_1AEFF8238[v2];
  }
  return result;
}

- (UIEdgeInsets)previewViewInsetsLandscape
{
  unint64_t v2 = [(PUViewControllerSpec *)self currentLayoutStyle] - 1;
  if (v2 > 3)
  {
    double v5 = *MEMORY[0x1E4FB2848];
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v3 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    double v3 = dbl_1AEFF8218[v2];
    double v4 = dbl_1AEFF81F8[v2];
    double v5 = 50.0;
    double v6 = v3;
  }
  result.right = v3;
  result.bottom = v4;
  result.left = v6;
  result.top = v5;
  return result;
}

- (UIEdgeInsets)previewViewInsetsPortrait
{
  unint64_t v2 = [(PUViewControllerSpec *)self currentLayoutStyle] - 1;
  if (v2 > 3)
  {
    double v4 = *MEMORY[0x1E4FB2848];
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v3 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    double v3 = dbl_1AEFF8218[v2];
    double v4 = dbl_1AEFF81D8[v2];
    double v5 = 0.0;
    double v6 = 0.0;
  }
  result.right = v5;
  result.bottom = v3;
  result.left = v6;
  result.top = v4;
  return result;
}

@end