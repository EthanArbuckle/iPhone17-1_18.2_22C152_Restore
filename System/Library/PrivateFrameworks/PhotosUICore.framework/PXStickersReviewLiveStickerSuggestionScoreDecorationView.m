@interface PXStickersReviewLiveStickerSuggestionScoreDecorationView
- (float)_scoreForAssetReference:(id)a3;
@end

@implementation PXStickersReviewLiveStickerSuggestionScoreDecorationView

- (float)_scoreForAssetReference:(id)a3
{
  return PXStickersReviewScoreForAssetReference(a3, 1);
}

@end