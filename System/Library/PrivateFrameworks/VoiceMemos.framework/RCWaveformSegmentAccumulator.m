@interface RCWaveformSegmentAccumulator
- (BOOL)finishedSuccessfully;
- (BOOL)waitUntilFinished;
- (NSMutableArray)segments;
- (RCWaveformGenerator)generator;
- (RCWaveformSegmentAccumulator)initWithWaveformGenerator:(id)a3;
- (void)dealloc;
- (void)setGenerator:(id)a3;
- (void)setSegments:(id)a3;
- (void)waveformGenerator:(id)a3 didLoadWaveformSegment:(id)a4;
@end

@implementation RCWaveformSegmentAccumulator

- (RCWaveformSegmentAccumulator)initWithWaveformGenerator:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RCWaveformSegmentAccumulator;
  v6 = [(RCWaveformSegmentAccumulator *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    segments = v6->_segments;
    v6->_segments = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_generator, a3);
    [(RCWaveformGenerator *)v6->_generator addSegmentOutputObserver:v6];
    [(RCWaveformGenerator *)v6->_generator beginLoading];
  }

  return v6;
}

- (void)dealloc
{
  [(RCWaveformGenerator *)self->_generator removeSegmentOutputObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)RCWaveformSegmentAccumulator;
  [(RCWaveformSegmentAccumulator *)&v3 dealloc];
}

- (void)waveformGenerator:(id)a3 didLoadWaveformSegment:(id)a4
{
}

- (BOOL)waitUntilFinished
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  generator = self->_generator;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__RCWaveformSegmentAccumulator_waitUntilFinished__block_invoke;
  v7[3] = &unk_1E6496298;
  id v5 = v3;
  v8 = v5;
  [(RCWaveformGenerator *)generator finishLoadingWithCompletionTimeout:-1 completionBlock:v7];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  self->_finishedSuccessfully = ![(RCWaveformGenerator *)self->_generator canceled];
  LODWORD(self) = ![(RCWaveformGenerator *)self->_generator canceled];

  return (char)self;
}

intptr_t __49__RCWaveformSegmentAccumulator_waitUntilFinished__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (RCWaveformGenerator)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (BOOL)finishedSuccessfully
{
  return self->_finishedSuccessfully;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_generator, 0);
}

@end