@interface SCDAGoodnessScoreContext
- (BOOL)recentlyWonBySmallAmount;
- (NSSet)reasons;
- (SCDAGoodnessScoreContext)init;
- (double)mediaPlaybackInterruptedTime;
- (id)description;
- (id)getOverridingContext;
- (void)setMediaPlaybackInterruptedTime:(double)a3;
- (void)setOverridingContext:(id)a3;
- (void)setReasons:(id)a3;
- (void)setRecentlyWonBySmallAmount:(BOOL)a3;
@end

@implementation SCDAGoodnessScoreContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_overriddenContext, 0);
}

- (void)setRecentlyWonBySmallAmount:(BOOL)a3
{
  self->_recentlyWonBySmallAmount = a3;
}

- (BOOL)recentlyWonBySmallAmount
{
  return self->_recentlyWonBySmallAmount;
}

- (void)setMediaPlaybackInterruptedTime:(double)a3
{
  self->_mediaPlaybackInterruptedTime = a3;
}

- (double)mediaPlaybackInterruptedTime
{
  return self->_mediaPlaybackInterruptedTime;
}

- (void)setReasons:(id)a3
{
}

- (NSSet)reasons
{
  return self->_reasons;
}

- (id)getOverridingContext
{
  return self->_overriddenContext;
}

- (void)setOverridingContext:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"reasons: %@, playback interrupted time: %f", self->_reasons, *(void *)&self->_mediaPlaybackInterruptedTime];
}

- (SCDAGoodnessScoreContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCDAGoodnessScoreContext;
  v2 = [(SCDAGoodnessScoreContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFFA08] setWithObject:&unk_2709D7938];
    reasons = v2->_reasons;
    v2->_reasons = (NSSet *)v3;

    v2->_mediaPlaybackInterruptedTime = 0.0;
    [(SCDAGoodnessScoreContext *)v2 setOverridingContext:0];
    v2->_recentlyWonBySmallAmount = 0;
  }
  return v2;
}

@end