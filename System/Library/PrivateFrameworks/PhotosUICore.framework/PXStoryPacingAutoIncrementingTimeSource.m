@interface PXStoryPacingAutoIncrementingTimeSource
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (BOOL)isActive;
- (BOOL)isRealTime;
- (OS_dispatch_queue)layoutQueue;
- (PXDisplayLinkProtocol)playLink;
- (PXStoryPacingAutoIncrementingTimeSource)init;
- (PXStoryPacingAutoIncrementingTimeSource)initWithLayoutQueue:(id)a3;
- (PXStoryPacingClock)pacingClock;
- (PXStoryPacingTimeSourceDelegate)delegate;
- (void)_handlePlayLink:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPacingClock:(id)a3;
- (void)setPlayLink:(id)a3;
@end

@implementation PXStoryPacingAutoIncrementingTimeSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playLink, 0);
  objc_destroyWeak((id *)&self->_pacingClock);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (PXDisplayLinkProtocol)playLink
{
  return self->_playLink;
}

- (void)setPacingClock:(id)a3
{
}

- (PXStoryPacingClock)pacingClock
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pacingClock);
  return (PXStoryPacingClock *)WeakRetained;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)setDelegate:(id)a3
{
}

- (PXStoryPacingTimeSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXStoryPacingTimeSourceDelegate *)WeakRetained;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)_handlePlayLink:(id)a3
{
  id v4 = a3;
  if ([(PXStoryPacingAutoIncrementingTimeSource *)self isActive])
  {
    memset(&v8, 0, sizeof(v8));
    [v4 resolvedDuration];
    CMTimeMakeWithSeconds(&v8, v5, 600);
    v6 = [(PXStoryPacingAutoIncrementingTimeSource *)self delegate];
    CMTime v7 = v8;
    [v6 timeSource:self didIncrementByTime:&v7];
  }
}

- (void)setPlayLink:(id)a3
{
  Float64 v5 = (PXDisplayLinkProtocol *)a3;
  playLink = self->_playLink;
  p_playLink = &self->_playLink;
  v6 = playLink;
  if (playLink != v5)
  {
    v9 = v5;
    [(PXDisplayLinkProtocol *)v6 invalidate];
    objc_storeStrong((id *)p_playLink, a3);
    Float64 v5 = v9;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  Float64 v5 = [(PXStoryPacingAutoIncrementingTimeSource *)self pacingClock];

  if (v5)
  {
    CMTime v7 = [(PXStoryPacingAutoIncrementingTimeSource *)self pacingClock];
    if (v7)
    {
      CMTime v8 = v7;
      [v7 currentTime];
      CMTime v7 = v8;
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return result;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
    {
      id v4 = [(PXStoryPacingAutoIncrementingTimeSource *)self layoutQueue];
      Float64 v5 = (void *)MEMORY[0x1E4F14428];

      if (v4 == v5)
      {
        id v8 = (id)[objc_alloc((Class)off_1E5DA6208) initWithWeakTarget:self selector:sel__handlePlayLink_];
      }
      else
      {
        id v6 = objc_alloc((Class)off_1E5DA56D8);
        CMTime v7 = [(PXStoryPacingAutoIncrementingTimeSource *)self layoutQueue];
        id v8 = (id)[v6 initWithWeakTarget:self selector:sel__handlePlayLink_ queue:v7];
      }
      [(PXStoryPacingAutoIncrementingTimeSource *)self setPlayLink:v8];
    }
    else
    {
      [(PXStoryPacingAutoIncrementingTimeSource *)self setPlayLink:0];
    }
  }
}

- (BOOL)isRealTime
{
  return 1;
}

- (PXStoryPacingAutoIncrementingTimeSource)init
{
  return [(PXStoryPacingAutoIncrementingTimeSource *)self initWithLayoutQueue:MEMORY[0x1E4F14428]];
}

- (PXStoryPacingAutoIncrementingTimeSource)initWithLayoutQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPacingAutoIncrementingTimeSource;
  id v6 = [(PXStoryPacingAutoIncrementingTimeSource *)&v9 init];
  CMTime v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_layoutQueue, a3);
  }

  return v7;
}

@end