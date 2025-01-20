@interface PXStickersReviewStickerConfidenceScoreDecorationView
- (float)_scoreForAssetReference:(id)a3;
@end

@implementation PXStickersReviewStickerConfidenceScoreDecorationView

- (float)_scoreForAssetReference:(id)a3
{
  return PXStickersReviewScoreForAssetReference(a3, 0);
}

@end