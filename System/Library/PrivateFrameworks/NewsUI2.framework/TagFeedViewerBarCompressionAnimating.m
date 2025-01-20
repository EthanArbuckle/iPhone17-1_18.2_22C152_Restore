@interface TagFeedViewerBarCompressionAnimating
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)shouldAlwaysScrollToTopOnTap;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)minimumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
- (void)prepareForUpdates;
- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4;
- (void)updateWithPercentage:(double)a3;
@end

@implementation TagFeedViewerBarCompressionAnimating

- (double)topOffset
{
  swift_retain();
  sub_1DF253A28();
  double v3 = v2;
  swift_release();
  return v3;
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 0;
}

- (BOOL)shouldAlwaysScrollToTopOnTap
{
  return 1;
}

- (void)prepareForUpdates
{
  *(void *)self->percentage = 0;
}

- (void)updateWithPercentage:(double)a3
{
  *(double *)self->percentage = a3;
}

- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4
{
  swift_retain();
  sub_1DF253EA8(a3, a4);
  swift_release();
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v3 = a3;
  swift_retain();
  double v4 = sub_1DF254424();

  swift_release();
  return v4;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

@end