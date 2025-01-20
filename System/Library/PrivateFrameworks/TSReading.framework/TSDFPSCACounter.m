@interface TSDFPSCACounter
- (void)p_updateFrameCount;
- (void)reset;
- (void)startLoggingFPS;
- (void)stopLoggingFPS;
@end

@implementation TSDFPSCACounter

- (void)reset
{
  [(TSDFPSCACounter *)self stopLoggingFPS];
  self->mCAFrameCount = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDFPSCACounter;
  [(TSDFPSCounter *)&v3 reset];
}

- (void)p_updateFrameCount
{
  if (p_updateFrameCount_onceToken != -1) {
    dispatch_once(&p_updateFrameCount_onceToken, &__block_literal_global_48);
  }
  if (self->mCAFrameCount) {
    [(TSDFPSCounter *)self addFrame];
  }
  self->mCAFrameCount = 0;
}

uint64_t __37__TSDFPSCACounter_p_updateFrameCount__block_invoke()
{
  v0 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"-[TSDFPSCACounter p_updateFrameCount]_block_invoke"];
  uint64_t v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFPSCounter.m"];

  return [v0 handleFailureInFunction:v1, v2, 310, @"To log CA framerates, you need to set \"CARENDERSERVERGETFRAMECOUNTER_SPI_ALLOWED\" to 1! (This message will only be shown once.)" file lineNumber description];
}

- (void)startLoggingFPS
{
  self->mTimer = (NSTimer *)[MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_p_updateFrameCount selector:0 userInfo:1 repeats:0.00555555556];
}

- (void)stopLoggingFPS
{
  self->mTimer = 0;
}

@end