@interface ISDisplayLink
- (CADisplayLink)displayLink;
- (ISDisplayLink)initWithUpdateHandler:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (id)updateHandler;
- (int64_t)preferredFramesPerSecond;
- (void)_callUpdateHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setUpdateHandler:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ISDisplayLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong(&self->_updateHandler, 0);
}

- (void)setDisplayLink:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)_callUpdateHandler
{
  uint64_t v3 = [(ISDisplayLink *)self updateHandler];
  v4 = (void *)v3;
  if (v3)
  {
    char v5 = 0;
    (*(void (**)(uint64_t, char *))(v3 + 16))(v3, &v5);
    if (v5) {
      [(ISDisplayLink *)self stop];
    }
  }
}

- (void)stop
{
  v4 = [(ISDisplayLink *)self completionHandler];
  if (v4) {
    v4[2]();
  }
  uint64_t v3 = [(ISDisplayLink *)self displayLink];
  [v3 invalidate];

  [(ISDisplayLink *)self setDisplayLink:0];
  [(ISDisplayLink *)self setUpdateHandler:0];
  [(ISDisplayLink *)self setCompletionHandler:0];
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
  id v4 = [(ISDisplayLink *)self displayLink];
  CAFrameRateRange v6 = CAFrameRateRangeMake((float)a3, (float)a3, (float)a3);
  objc_msgSend(v4, "setPreferredFrameRateRange:", *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

- (void)start
{
  id v3 = [(ISDisplayLink *)self displayLink];
  v2 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v3 addToRunLoop:v2 forMode:*MEMORY[0x1E4F1C4B0]];
}

- (ISDisplayLink)initWithUpdateHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISDisplayLink;
  v8 = [(ISDisplayLink *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(ISDisplayLink *)v8 setUpdateHandler:v6];
    [(ISDisplayLink *)v9 setCompletionHandler:v7];
    v10 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v9 selector:sel__update_];
    [(ISDisplayLink *)v9 setDisplayLink:v10];
  }
  return v9;
}

@end