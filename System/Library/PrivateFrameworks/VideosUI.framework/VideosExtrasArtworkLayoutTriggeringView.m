@interface VideosExtrasArtworkLayoutTriggeringView
- (void)_imageDidChange;
@end

@implementation VideosExtrasArtworkLayoutTriggeringView

- (void)_imageDidChange
{
  id v2 = [(VideosExtrasArtworkLayoutTriggeringView *)self superview];
  [v2 setNeedsLayout];
}

@end