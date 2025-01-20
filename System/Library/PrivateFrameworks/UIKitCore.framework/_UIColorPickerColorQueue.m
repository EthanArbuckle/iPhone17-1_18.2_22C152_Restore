@interface _UIColorPickerColorQueue
- (CADisplayLink)displayLink;
- (_UIColorPickerColorQueue)init;
- (_UIColorPickerColorQueueContainer)latestObject;
- (_UIColorPickerColorQueueDelegate)delegate;
- (void)_displayLinkFired;
- (void)_forwardToDelegate:(id)a3;
- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setLatestObject:(id)a3;
@end

@implementation _UIColorPickerColorQueue

- (_UIColorPickerColorQueue)init
{
  v11.receiver = self;
  v11.super_class = (Class)_UIColorPickerColorQueue;
  v2 = [(_UIColorPickerColorQueue *)&v11 init];
  if (v2)
  {
    v3 = +[UIScreen mainScreen];
    uint64_t v4 = [v3 displayLinkWithTarget:v2 selector:sel__displayLinkFired];
    displayLink = v2->_displayLink;
    v2->_displayLink = (CADisplayLink *)v4;

    v6 = v2->_displayLink;
    v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

    v8 = v2->_displayLink;
    v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v8 addToRunLoop:v9 forMode:@"UITrackingRunLoopMode"];

    [(CADisplayLink *)v2->_displayLink setPaused:1];
  }
  return v2;
}

- (void)_displayLinkFired
{
  if (self->_latestObject)
  {
    -[_UIColorPickerColorQueue _forwardToDelegate:](self, "_forwardToDelegate:");
    latestObject = self->_latestObject;
    self->_latestObject = 0;
  }
  displayLink = self->_displayLink;
  [(CADisplayLink *)displayLink setPaused:1];
}

- (void)_forwardToDelegate:(id)a3
{
  id v4 = a3;
  id v8 = [(_UIColorPickerColorQueue *)self delegate];
  v5 = [v4 color];
  v6 = [v4 colorSpace];
  uint64_t v7 = [v4 isVolatile];

  objc_msgSend(v8, "_dequeue_pickerDidSelectColor:colorSpace:isVolatile:", v5, v6, v7);
}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(_UIColorPickerColorQueueContainer);
  [(_UIColorPickerColorQueueContainer *)v10 setColor:v9];

  [(_UIColorPickerColorQueueContainer *)v10 setColorSpace:v8];
  [(_UIColorPickerColorQueueContainer *)v10 setIsVolatile:v5];
  latestObject = self->_latestObject;
  self->_latestObject = v10;
  v12 = v10;

  [(CADisplayLink *)self->_displayLink setPaused:0];
}

- (_UIColorPickerColorQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIColorPickerColorQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (_UIColorPickerColorQueueContainer)latestObject
{
  return self->_latestObject;
}

- (void)setLatestObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestObject, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end