@interface MSTrackListCellContext
- (BOOL)shouldHideContentRating;
- (BOOL)showSubtitle;
- (void)setShouldHideContentRating:(BOOL)a3;
- (void)setShowSubtitle:(BOOL)a3;
@end

@implementation MSTrackListCellContext

- (BOOL)shouldHideContentRating
{
  return *(&self->super._itemsHaveArtwork + 1);
}

- (void)setShouldHideContentRating:(BOOL)a3
{
  *(&self->super._itemsHaveArtwork + 1) = a3;
}

- (BOOL)showSubtitle
{
  return *(&self->super._itemsHaveArtwork + 2);
}

- (void)setShowSubtitle:(BOOL)a3
{
  *(&self->super._itemsHaveArtwork + 2) = a3;
}

@end