@interface PUDisplayLink
- (CADisplayLink)displayLink;
- (PUDisplayLink)initWithUpdateHandler:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (id)updateHandler;
- (void)_update:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation PUDisplayLink

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

- (void)_update:(id)a3
{
  char v6 = 0;
  v4 = [(PUDisplayLink *)self updateHandler];

  if (v4)
  {
    v5 = [(PUDisplayLink *)self updateHandler];
    ((void (**)(void, char *))v5)[2](v5, &v6);

    if (v6) {
      [(PUDisplayLink *)self stop];
    }
  }
}

- (void)stop
{
  v3 = [(PUDisplayLink *)self completionHandler];

  if (v3)
  {
    v4 = [(PUDisplayLink *)self completionHandler];
    v4[2]();
  }
  v5 = [(PUDisplayLink *)self displayLink];
  [v5 invalidate];

  [(PUDisplayLink *)self setDisplayLink:0];
  [(PUDisplayLink *)self setUpdateHandler:0];
  [(PUDisplayLink *)self setCompletionHandler:0];
}

- (void)start
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"PUDisplayLinkStartedNotification" object:self];

  id v5 = [(PUDisplayLink *)self displayLink];
  v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v5 addToRunLoop:v4 forMode:*MEMORY[0x1E4F1C4B0]];
}

- (PUDisplayLink)initWithUpdateHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUDisplayLink;
  v8 = [(PUDisplayLink *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(PUDisplayLink *)v8 setUpdateHandler:v6];
    [(PUDisplayLink *)v9 setCompletionHandler:v7];
    v10 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v9 selector:sel__update_];
    if ([MEMORY[0x1E4F91238] highFramerateRequiresReasonAndRange])
    {
      [v10 setHighFrameRateReason:2228228];
      PXFrameRateRangeTypeGetCAFrameRateRange();
      objc_msgSend(v10, "setPreferredFrameRateRange:");
    }
    [(PUDisplayLink *)v9 setDisplayLink:v10];
  }
  return v9;
}

@end