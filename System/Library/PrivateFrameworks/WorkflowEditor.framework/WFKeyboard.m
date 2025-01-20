@interface WFKeyboard
+ (id)sharedKeyboard;
+ (void)beginObservingKeyboardNotifications;
- (BOOL)isVisible;
- (CGRect)keyboardFrame;
- (CGRect)keyboardFrameInView:(id)a3;
- (WFKeyboard)init;
- (double)animationDuration;
- (int64_t)animationCurve;
- (void)dealloc;
- (void)keyboardWillChangeFrame:(id)a3;
- (void)keyboardWillChangeVisible:(id)a3;
@end

@implementation WFKeyboard

void __28__WFKeyboard_sharedKeyboard__block_invoke()
{
  v0 = objc_alloc_init(WFKeyboard);
  v1 = (void *)sharedKeyboard_sharedKeyboard;
  sharedKeyboard_sharedKeyboard = (uint64_t)v0;
}

- (WFKeyboard)init
{
  v5.receiver = self;
  v5.super_class = (Class)WFKeyboard;
  v2 = [(WFKeyboard *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_keyboardWillChangeVisible_ name:*MEMORY[0x263F83808] object:0];
    [v3 addObserver:v2 selector:sel_keyboardWillChangeVisible_ name:*MEMORY[0x263F83800] object:0];
    [v3 addObserver:v2 selector:sel_keyboardWillChangeFrame_ name:*MEMORY[0x263F837F8] object:0];
    [v3 addObserver:v2 selector:sel_keyboardWillChangeFrame_ name:*MEMORY[0x263F837A8] object:0];
  }
  return v2;
}

+ (void)beginObservingKeyboardNotifications
{
  id v2 = +[WFKeyboard sharedKeyboard];
}

+ (id)sharedKeyboard
{
  if (sharedKeyboard_onceToken != -1) {
    dispatch_once(&sharedKeyboard_onceToken, &__block_literal_global_80);
  }
  id v2 = (void *)sharedKeyboard_sharedKeyboard;

  return v2;
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (int64_t)animationCurve
{
  return self->_animationCurve;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (CGRect)keyboardFrameInView:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 window];
  v6 = [v5 windowScene];

  v7 = [MEMORY[0x263F82B60] mainScreen];
  v8 = [v7 coordinateSpace];
  [v4 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [v4 coordinateSpace];
  objc_msgSend(v8, "convertRect:fromCoordinateSpace:", v17, v10, v12, v14, v16);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v26 = [v7 coordinateSpace];
  v27 = [v6 coordinateSpace];
  objc_msgSend(v26, "convertRect:fromCoordinateSpace:", v27, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;

  v54.origin.double x = v19;
  v54.origin.double y = v21;
  v54.size.double width = v23;
  v54.size.double height = v25;
  v59.origin.double x = v29;
  v59.origin.double y = v31;
  v59.size.double width = v33;
  v59.size.double height = v35;
  CGRect v55 = CGRectIntersection(v54, v59);
  double x = v55.origin.x;
  double y = v55.origin.y;
  double width = v55.size.width;
  double height = v55.size.height;
  v40 = [v4 coordinateSpace];

  v41 = [v7 coordinateSpace];
  objc_msgSend(v40, "convertRect:toCoordinateSpace:", v41, x, y, width, height);
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;

  v56.origin.double x = v43;
  v56.origin.double y = v45;
  v56.size.double width = v47;
  v56.size.double height = v49;
  if (CGRectIsInfinite(v56)
    || (v57.origin.double x = v43, v57.origin.y = v45, v57.size.width = v47, v57.size.height = v49, CGRectIsEmpty(v57)))
  {
    CGFloat v43 = *MEMORY[0x263F001A8];
    CGFloat v45 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v47 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v49 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v50 = v43;
  double v51 = v45;
  double v52 = v47;
  double v53 = v49;
  result.size.double height = v53;
  result.size.double width = v52;
  result.origin.double y = v51;
  result.origin.double x = v50;
  return result;
}

- (void)keyboardWillChangeFrame:(id)a3
{
  id v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKey:*MEMORY[0x263F837B8]];
  [v5 CGRectValue];
  self->_keyboardFrame.origin.double x = v6;
  self->_keyboardFrame.origin.double y = v7;
  self->_keyboardFrame.size.double width = v8;
  self->_keyboardFrame.size.double height = v9;

  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"WFKeyboardWillChangeNotification" object:self];
}

- (void)keyboardWillChangeVisible:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 name];
  self->_visible = [v5 isEqualToString:*MEMORY[0x263F83808]];

  CGFloat v6 = [v4 userInfo];
  CGFloat v7 = [v6 objectForKey:*MEMORY[0x263F837B8]];
  [v7 CGRectValue];
  self->_keyboardFrame.origin.double x = v8;
  self->_keyboardFrame.origin.double y = v9;
  self->_keyboardFrame.size.double width = v10;
  self->_keyboardFrame.size.double height = v11;

  double v12 = [v4 userInfo];
  double v13 = [v12 objectForKey:*MEMORY[0x263F83778]];
  self->_animationCurve = [v13 unsignedIntegerValue];

  double v14 = [v4 userInfo];

  double v15 = [v14 objectForKey:*MEMORY[0x263F83780]];
  [v15 doubleValue];
  self->_animationDuration = v16;

  id v17 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 postNotificationName:@"WFKeyboardWillChangeNotification" object:self];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83808] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83800] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F837F8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F837A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFKeyboard;
  [(WFKeyboard *)&v4 dealloc];
}

@end