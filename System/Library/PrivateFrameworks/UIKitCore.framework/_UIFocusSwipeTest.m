@interface _UIFocusSwipeTest
- (UIWindow)window;
- (_UIFocusSwipeTest)initWithIdentifier:(id)a3;
- (unint64_t)swipeAxis;
- (void)main;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)setSwipeAxis:(unint64_t)a3;
- (void)setWindow:(id)a3;
@end

@implementation _UIFocusSwipeTest

- (_UIFocusSwipeTest)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIFocusSwipeTest;
  result = [(_UIFocusTest *)&v4 initWithIdentifier:a3];
  if (result) {
    result->_swipeAxis = 1;
  }
  return result;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  v9 = (void (**)(void))a3;
  v5 = [(_UIFocusSwipeTest *)self window];

  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UIFocusSwipeTest.m" lineNumber:63 description:@"Focus swipe test must have a window in order to start."];
  }
  if (![(_UIFocusSwipeTest *)self swipeAxis])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UIFocusSwipeTest.m" lineNumber:64 description:@"Focus swipe test must have a swipe axis in order to start."];
  }
  if ([(_UIFocusSwipeTest *)self swipeAxis] == 1)
  {
    self->_eventCount = 57;
    v6 = (const $B42DDA7905377C1B85A751F444708923 *)&horizontalSwipingEvents;
  }
  else if ([(_UIFocusSwipeTest *)self swipeAxis] == 2)
  {
    self->_eventCount = 46;
    v6 = (const $B42DDA7905377C1B85A751F444708923 *)&verticalSwipingEvents;
  }
  else
  {
    v6 = 0;
    self->_eventCount = 0;
  }
  self->_events = v6;
  v9[2]();
}

- (void)main
{
  v3 = objc_alloc_init(_UIFocusEngineFakePanGestureRecognizer);
  objc_super v4 = [(_UIFocusSwipeTest *)self window];
  v5 = [v4 _focusEventRecognizer];

  v6 = objc_msgSend(v5, "_uiktest_panGestureRecognizer");
  objc_msgSend(v5, "_uiktest_setPanGestureRecognizer:", v3);
  v7 = dispatch_queue_create("_UIFocusSwipeTest", 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __25___UIFocusSwipeTest_main__block_invoke;
  v11[3] = &unk_1E52DD450;
  v11[4] = self;
  v12 = v3;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  v10 = v3;
  dispatch_async(v7, v11);
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (unint64_t)swipeAxis
{
  return self->_swipeAxis;
}

- (void)setSwipeAxis:(unint64_t)a3
{
  self->_swipeAxis = a3;
}

- (void).cxx_destruct
{
}

@end