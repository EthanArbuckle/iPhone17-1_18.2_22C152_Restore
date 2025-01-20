@interface TSDPreventScrollGestureRecognizer
- (TSDPreventScrollGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TSDPreventScrollGestureRecognizer

- (TSDPreventScrollGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSDPreventScrollGestureRecognizer;
  v4 = [(TSDPreventScrollGestureRecognizer *)&v8 initWithTarget:0 action:0];
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDPreventScrollGestureRecognizer initWithInteractiveCanvasController:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPreventScrollGestureRecognizer.m"), 24, @"invalid nil value for '%s'", "icc");
    }
    v4->mICC = (TSDInteractiveCanvasController *)a3;
  }
  return v4;
}

- (void)reset
{
  self->mTouch = 0;
  self->mSecondTouch = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDPreventScrollGestureRecognizer;
  [(TSDPreventScrollGestureRecognizer *)&v3 reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)TSDPreventScrollGestureRecognizer;
  [(TSDPreventScrollGestureRecognizer *)&v18 touchesBegan:a3 withEvent:a4];
  if (![(TSDPreventScrollGestureRecognizer *)self state]
    && [(TSDInteractiveCanvasController *)self->mICC currentlyScrolling])
  {
    [(TSDPreventScrollGestureRecognizer *)self setState:5];
    return;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (![(TSDPreventScrollGestureRecognizer *)self state])
        {
          mTouch = self->mTouch;
          v12 = v10;
          if (mTouch)
          {
            self->mSecondTouch = v12;
            uint64_t v13 = 1;
LABEL_15:
            [(TSDPreventScrollGestureRecognizer *)self setState:v13];
            continue;
          }
          self->mTouch = v12;
          if ([(UITouch *)v12 tapCount] != 1
            || !objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->mICC, "layerHost"), "asiOSCVC"), "hitRepWithTouch:", self->mTouch), "repForDragging"))
          {
            uint64_t v13 = 5;
            goto LABEL_15;
          }
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSDPreventScrollGestureRecognizer;
  [(TSDPreventScrollGestureRecognizer *)&v6 touchesEnded:a3 withEvent:a4];
  if (self->mTouch && objc_msgSend(a3, "containsObject:"))
  {

    self->mTouch = 0;
  }
  if (self->mSecondTouch && objc_msgSend(a3, "containsObject:"))
  {

    self->mSecondTouch = 0;
  }
  if (!self->mTouch && !self->mSecondTouch) {
    [(TSDPreventScrollGestureRecognizer *)self setState:3];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSDPreventScrollGestureRecognizer;
  [(TSDPreventScrollGestureRecognizer *)&v6 touchesCancelled:a3 withEvent:a4];
  if (self->mTouch && objc_msgSend(a3, "containsObject:"))
  {

    self->mTouch = 0;
  }
  if (self->mSecondTouch && objc_msgSend(a3, "containsObject:"))
  {

    self->mSecondTouch = 0;
  }
  if (!self->mTouch && !self->mSecondTouch) {
    [(TSDPreventScrollGestureRecognizer *)self setState:3];
  }
}

@end