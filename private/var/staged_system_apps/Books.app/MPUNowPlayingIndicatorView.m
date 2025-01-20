@interface MPUNowPlayingIndicatorView
- (double)bk_width;
@end

@implementation MPUNowPlayingIndicatorView

- (double)bk_width
{
  [(MPUNowPlayingIndicatorView *)self levelWidth];
  double v4 = v3;
  double v5 = (double)(uint64_t)[(MPUNowPlayingIndicatorView *)self numberOfLevels];
  [(MPUNowPlayingIndicatorView *)self interLevelSpacing];
  return v6 * (double)((unint64_t)[(MPUNowPlayingIndicatorView *)self numberOfLevels] - 1)
       + v4 * v5;
}

@end