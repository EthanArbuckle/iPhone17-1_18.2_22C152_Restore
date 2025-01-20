@interface PDMediaNode
- (BOOL)isMuted;
- (BOOL)isShowWhenStopped;
- (PDMediaNode)init;
- (id)target;
- (int64_t)numberOfSlides;
- (int64_t)volume;
- (void)setIsMuted:(BOOL)a3;
- (void)setIsShowWhenStopped:(BOOL)a3;
- (void)setNumberOfSlides:(int64_t)a3;
- (void)setTarget:(id)a3;
- (void)setVolume:(int64_t)a3;
@end

@implementation PDMediaNode

- (PDMediaNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDMediaNode;
  result = [(PDTimeNode *)&v3 init];
  if (result)
  {
    result->mIsShowWhenStopped = 1;
    result->mNumberOfSlides = 1;
    result->mVolume = 50000;
  }
  return result;
}

- (void)setTarget:(id)a3
{
}

- (void)setIsMuted:(BOOL)a3
{
  self->mIsMuted = a3;
}

- (void)setIsShowWhenStopped:(BOOL)a3
{
  self->mIsShowWhenStopped = a3;
}

- (void)setNumberOfSlides:(int64_t)a3
{
  self->mNumberOfSlides = a3;
}

- (void)setVolume:(int64_t)a3
{
  self->mVolume = a3;
}

- (id)target
{
  return self->mTarget;
}

- (BOOL)isMuted
{
  return self->mIsMuted;
}

- (BOOL)isShowWhenStopped
{
  return self->mIsShowWhenStopped;
}

- (int64_t)numberOfSlides
{
  return self->mNumberOfSlides;
}

- (int64_t)volume
{
  return self->mVolume;
}

- (void).cxx_destruct
{
}

@end