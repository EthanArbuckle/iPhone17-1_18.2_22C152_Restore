@interface SUTouchCaptureView
- (NSArray)passThroughViews;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)setPassThroughViews:(id)a3;
@end

@implementation SUTouchCaptureView

- (void)dealloc
{
  self->_passThroughViews = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTouchCaptureView;
  [(SUTouchCaptureView *)&v3 dealloc];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)SUTouchCaptureView;
  v8 = -[SUTouchCaptureView hitTest:withEvent:](&v21, sel_hitTest_withEvent_);
  if (v8 == self)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    passThroughViews = self->_passThroughViews;
    uint64_t v11 = [(NSArray *)passThroughViews countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(passThroughViews);
          }
          v8 = *(SUTouchCaptureView **)(*((void *)&v17 + 1) + 8 * i);
          v15 = (void *)[(SUTouchCaptureView *)v8 superview];
          if (v15)
          {
            v16 = v15;
            objc_msgSend(v15, "convertPoint:fromView:", self, x, y);
            if (v8 == (SUTouchCaptureView *)objc_msgSend(v16, "hitTest:withEvent:", a4) && v8) {
              return v8;
            }
          }
          else
          {
            -[SUTouchCaptureView convertPoint:fromView:](v8, "convertPoint:fromView:", self, x, y);
            v8 = -[SUTouchCaptureView hitTest:withEvent:](v8, "hitTest:withEvent:", a4);
            if (v8) {
              return v8;
            }
          }
        }
        uint64_t v12 = [(NSArray *)passThroughViews countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }
    return self;
  }
  return v8;
}

- (NSArray)passThroughViews
{
  return self->_passThroughViews;
}

- (void)setPassThroughViews:(id)a3
{
}

@end