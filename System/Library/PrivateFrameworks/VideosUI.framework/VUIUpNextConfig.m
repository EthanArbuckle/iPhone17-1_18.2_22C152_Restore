@interface VUIUpNextConfig
- (BOOL)shouldUpdateOutboundAfterRemoveFromUpNext;
- (VUIUpNextConfig)init;
- (unint64_t)upNextCallDelayAfterMarkAsWatched;
- (unint64_t)upNextRefreshCallDelayAfterRemoveFromUpNext;
- (void)setShouldUpdateOutboundAfterRemoveFromUpNext:(BOOL)a3;
- (void)setUpNextCallDelayAfterMarkAsWatched:(unint64_t)a3;
- (void)setUpNextRefreshCallDelayAfterRemoveFromUpNext:(unint64_t)a3;
@end

@implementation VUIUpNextConfig

- (void)setUpNextRefreshCallDelayAfterRemoveFromUpNext:(unint64_t)a3
{
  self->_upNextRefreshCallDelayAfterRemoveFromUpNext = a3;
}

- (void)setUpNextCallDelayAfterMarkAsWatched:(unint64_t)a3
{
  self->_upNextCallDelayAfterMarkAsWatched = a3;
}

- (void)setShouldUpdateOutboundAfterRemoveFromUpNext:(BOOL)a3
{
  self->_shouldUpdateOutboundAfterRemoveFromUpNext = a3;
}

- (VUIUpNextConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIUpNextConfig;
  result = [(VUIUpNextConfig *)&v3 init];
  if (result)
  {
    *(int64x2_t *)&result->_upNextCallDelayAfterMarkAsWatched = vdupq_n_s64(0x1F4uLL);
    result->_shouldUpdateOutboundAfterRemoveFromUpNext = 0;
  }
  return result;
}

- (unint64_t)upNextCallDelayAfterMarkAsWatched
{
  return self->_upNextCallDelayAfterMarkAsWatched;
}

- (unint64_t)upNextRefreshCallDelayAfterRemoveFromUpNext
{
  return self->_upNextRefreshCallDelayAfterRemoveFromUpNext;
}

- (BOOL)shouldUpdateOutboundAfterRemoveFromUpNext
{
  return self->_shouldUpdateOutboundAfterRemoveFromUpNext;
}

@end