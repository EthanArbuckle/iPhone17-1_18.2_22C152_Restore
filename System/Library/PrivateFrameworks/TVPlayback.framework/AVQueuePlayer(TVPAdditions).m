@interface AVQueuePlayer(TVPAdditions)
- (id)tvp_cachedAudioSelectionCriteria;
- (void)setTvp_cachedAudioSelectionCriteria:()TVPAdditions;
@end

@implementation AVQueuePlayer(TVPAdditions)

- (void)setTvp_cachedAudioSelectionCriteria:()TVPAdditions
{
}

- (id)tvp_cachedAudioSelectionCriteria
{
  return objc_getAssociatedObject(a1, sel_tvp_cachedAudioSelectionCriteria);
}

@end