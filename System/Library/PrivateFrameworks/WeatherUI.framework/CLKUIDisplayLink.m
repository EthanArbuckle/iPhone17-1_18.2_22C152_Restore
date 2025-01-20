@interface CLKUIDisplayLink
- (CLKUIDisplayLink)initWithTarget:(id)a3 selector:(SEL)a4;
- (void)invalidate;
- (void)updateCoordinator;
@end

@implementation CLKUIDisplayLink

- (CLKUIDisplayLink)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKUIDisplayLink;
  v7 = [(CLKUIRenderFrequencyLink *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v6 selector:a4];
    displayLink = v7->_displayLink;
    v7->_displayLink = (CADisplayLink *)v8;

    [(CADisplayLink *)v7->_displayLink setPaused:1];
    v10 = v7->_displayLink;
    v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v10 addToRunLoop:v11 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  return v7;
}

- (void)updateCoordinator
{
  v3.receiver = self;
  v3.super_class = (Class)CLKUIDisplayLink;
  [(CLKUIRenderFrequencyLink *)&v3 updateCoordinator];
  [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:[(CLKUIRenderFrequencyLink *)self preferredFramesPerSecond]];
  [(CADisplayLink *)self->_displayLink setPaused:[(CLKUIRenderFrequencyLink *)self isPaused]];
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)CLKUIDisplayLink;
  [(CLKUIRenderFrequencyLink *)&v4 invalidate];
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void).cxx_destruct
{
}

@end