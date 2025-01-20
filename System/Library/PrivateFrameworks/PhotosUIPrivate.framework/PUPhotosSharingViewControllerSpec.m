@interface PUPhotosSharingViewControllerSpec
- (BOOL)embedsActivityViewForBounds:(CGRect)a3 horizontalSizeClass:(int64_t)a4 verticalSizeClass:(int64_t)a5;
- (BOOL)maximizeImageHeightForBounds:(CGRect)a3;
- (CGSize)optionBadgeSize;
- (CGSize)selectionBadgeSize;
- (UIOffset)selectionBadgeOffset;
- (double)interItemSpacing;
- (double)interItemSpacingForWidth:(double)a3;
- (unint64_t)optionBadgeCorner;
- (unint64_t)selectionBadgeCorner;
@end

@implementation PUPhotosSharingViewControllerSpec

- (BOOL)embedsActivityViewForBounds:(CGRect)a3 horizontalSizeClass:(int64_t)a4 verticalSizeClass:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  if (!_isPhone()) {
    return 1;
  }
  if (height <= width) {
    return 0;
  }
  return PLIsTallScreen();
}

- (CGSize)optionBadgeSize
{
  if (optionBadgeSize_onceToken != -1) {
    dispatch_once(&optionBadgeSize_onceToken, &__block_literal_global_3);
  }
  double v3 = *((double *)&optionBadgeSize__s_maxSize + 1);
  double v2 = *(double *)&optionBadgeSize__s_maxSize;
  result.double height = v3;
  result.double width = v2;
  return result;
}

void __52__PUPhotosSharingViewControllerSpec_optionBadgeSize__block_invoke()
{
  optionBadgeSize__s_maxSize = *MEMORY[0x1E4F1DB30];
  id v0 = objc_alloc(MEMORY[0x1E4F90840]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v1 setStyle:4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PUPhotosSharingViewControllerSpec_optionBadgeSize__block_invoke_2;
  aBlock[3] = &unk_1E5F2AE10;
  id v5 = v1;
  id v2 = v1;
  double v3 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v3[2](v3, 64);
  v3[2](v3, 8388672);
  v3[2](v3, 16777280);
  v3[2](v3, 10485824);
  v3[2](v3, 18874432);
}

uint64_t __52__PUPhotosSharingViewControllerSpec_optionBadgeSize__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  PXAssetBadgeInfoCreateWithBadges();
  [v2 setBadgeInfo:&v6];
  objc_msgSend(*(id *)(a1 + 32), "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  uint64_t result = PXSizeMax();
  *(void *)&optionBadgeSize__s_maxSize = v4;
  *((void *)&optionBadgeSize__s_maxSize + 1) = v5;
  return result;
}

- (unint64_t)optionBadgeCorner
{
  return 1;
}

- (unint64_t)selectionBadgeCorner
{
  return 8;
}

- (UIOffset)selectionBadgeOffset
{
  double v2 = 10.0;
  double v3 = 10.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (CGSize)selectionBadgeSize
{
  if (selectionBadgeSize_onceToken != -1) {
    dispatch_once(&selectionBadgeSize_onceToken, &__block_literal_global_71467);
  }
  double v2 = *(double *)&selectionBadgeSize_selectionBadgeSize_0;
  double v3 = *(double *)&selectionBadgeSize_selectionBadgeSize_1;
  result.double height = v3;
  result.double width = v2;
  return result;
}

void __55__PUPhotosSharingViewControllerSpec_selectionBadgeSize__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4FB1EB0], "px_circularGlyphViewWithName:backgroundColor:", @"circle", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 frame];
  selectionBadgeSize_selectionBadgeSize_0 = v0;
  selectionBadgeSize_selectionBadgeSize_1 = v1;
}

- (double)interItemSpacingForWidth:(double)a3
{
  BOOL v3 = a3 > 375.0;
  double result = 12.0;
  if (!v3) {
    return 10.0;
  }
  return result;
}

- (double)interItemSpacing
{
  double v2 = 30.0;
  if (_isPhone())
  {
    if (PLIsTallScreen()) {
      return 10.0;
    }
    else {
      return 15.0;
    }
  }
  return v2;
}

- (BOOL)maximizeImageHeightForBounds:(CGRect)a3
{
  return _isPhone() && (PLIsTallScreen() & 1) != 0;
}

@end