@interface TSDDisplayLink
- (double)lastTime;
- (double)startTime;
- (id)completionBlock;
- (id)tickBlock;
- (void)dealloc;
- (void)p_handleDisplayLink:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setLastTime:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setTickBlock:(id)a3;
- (void)start;
- (void)teardown;
@end

@implementation TSDDisplayLink

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDDisplayLink;
  [(TSDDisplayLink *)&v3 dealloc];
}

- (void)start
{
  if (self->_displayLink)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDDisplayLink start]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDisplayLink.m"), 43, @"expected nil value for '%s'", "_displayLink");
  }
  v5 = (CADisplayLink *)[MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_p_handleDisplayLink_];
  self->_displayLink = v5;
  uint64_t v6 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x263EFF478]];
  double v7 = CACurrentMediaTime();
  self->_startTime = v7;
  self->_lastTime = v7;
}

- (void)teardown
{
  self->_displayLink = 0;
}

- (void)p_handleDisplayLink:(id)a3
{
  [a3 timestamp];
  double v6 = v5;
  if ((*((unsigned int (**)(double, double))self->_tickBlock + 2))(v5 - self->_startTime, v5 - self->_lastTime))
  {
    completionBlock = (void (**)(void))self->_completionBlock;
    if (completionBlock) {
      completionBlock[2]();
    }
    [a3 invalidate];
    self->_displayLink = 0;
  }
  self->_lastTime = v6;
}

- (id)tickBlock
{
  return self->_tickBlock;
}

- (void)setTickBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)lastTime
{
  return self->_lastTime;
}

- (void)setLastTime:(double)a3
{
  self->_lastTime = a3;
}

@end