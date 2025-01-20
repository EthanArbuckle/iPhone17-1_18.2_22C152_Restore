@interface PXStoryPacingManualTimeSource
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (BOOL)isActive;
- (BOOL)isRealTime;
- (PXStoryPacingManualTimeSource)init;
- (PXStoryPacingTimeSourceDelegate)delegate;
- (void)incrementByTime:(id *)a3;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PXStoryPacingManualTimeSource

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (PXStoryPacingTimeSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXStoryPacingTimeSourceDelegate *)WeakRetained;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (BOOL)isRealTime
{
  return 0;
}

- (void)incrementByTime:(id *)a3
{
  if ([(PXStoryPacingManualTimeSource *)self isActive])
  {
    CMTime lhs = (CMTime)self->_currentTime;
    CMTime rhs = (CMTime)*a3;
    CMTimeAdd(&v6, &lhs, &rhs);
    self->_currentTime = ($95D729B680665BEAEFA1D6FCA8238556)v6;
    v5 = [(PXStoryPacingManualTimeSource *)self delegate];
    CMTime lhs = (CMTime)*a3;
    [v5 timeSource:self didIncrementByTime:&lhs];
  }
}

- (PXStoryPacingManualTimeSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryPacingManualTimeSource;
  v2 = [(PXStoryPacingManualTimeSource *)&v5 init];
  if (v2)
  {
    CMTimeMakeWithSeconds(&v4, 0.0, 600);
    v2->_currentTime = ($95D729B680665BEAEFA1D6FCA8238556)v4;
  }
  return v2;
}

@end