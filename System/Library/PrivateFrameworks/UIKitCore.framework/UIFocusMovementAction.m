@interface UIFocusMovementAction
- (BOOL)shouldPerformHapticFeedback;
- (CGRect)focusedFrame;
- (UIFocusMovementAction)initWithFocusMovementInfo:(id)a3;
- (UIFocusMovementAction)initWithFocusMovementInfo:(id)a3 inputDeviceInfo:(id)a4 shouldPerformHapticFeedback:(BOOL)a5;
- (UIFocusMovementAction)initWithFocusMovementInfo:(id)a3 inputDeviceInfo:(id)a4 shouldPerformHapticFeedback:(BOOL)a5 focusedFrameInSceneCoordinateSpace:(CGRect)a6;
- (_UIFocusInputDeviceInfo)inputDeviceInfo;
- (_UIFocusMovementInfo)focusMovementInfo;
- (int64_t)UIActionType;
@end

@implementation UIFocusMovementAction

- (UIFocusMovementAction)initWithFocusMovementInfo:(id)a3
{
  id v4 = a3;
  v5 = +[_UIFocusInputDeviceInfo infoWithSenderID:0];
  v6 = [(UIFocusMovementAction *)self initWithFocusMovementInfo:v4 inputDeviceInfo:v5 shouldPerformHapticFeedback:0];

  return v6;
}

- (UIFocusMovementAction)initWithFocusMovementInfo:(id)a3 inputDeviceInfo:(id)a4 shouldPerformHapticFeedback:(BOOL)a5
{
  return -[UIFocusMovementAction initWithFocusMovementInfo:inputDeviceInfo:shouldPerformHapticFeedback:focusedFrameInSceneCoordinateSpace:](self, "initWithFocusMovementInfo:inputDeviceInfo:shouldPerformHapticFeedback:focusedFrameInSceneCoordinateSpace:", a3, a4, a5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (UIFocusMovementAction)initWithFocusMovementInfo:(id)a3 inputDeviceInfo:(id)a4 shouldPerformHapticFeedback:(BOOL)a5 focusedFrameInSceneCoordinateSpace:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v10 = a5;
  v13 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(v13);
  [v16 setObject:v15 forSetting:1];

  [v16 setObject:v14 forSetting:2];
  v17 = [NSNumber numberWithBool:v10];
  [v16 setObject:v17 forSetting:3];

  v18 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", x, y, width, height);
  [v16 setObject:v18 forSetting:4];

  v21.receiver = self;
  v21.super_class = (Class)UIFocusMovementAction;
  v19 = [(UIFocusMovementAction *)&v21 initWithInfo:v16 timeout:0 forResponseOnQueue:0 withHandler:0.0];

  return v19;
}

- (_UIFocusMovementInfo)focusMovementInfo
{
  v2 = [(UIFocusMovementAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (_UIFocusMovementInfo *)v3;
}

- (_UIFocusInputDeviceInfo)inputDeviceInfo
{
  v2 = [(UIFocusMovementAction *)self info];
  v3 = [v2 objectForSetting:2];

  return (_UIFocusInputDeviceInfo *)v3;
}

- (BOOL)shouldPerformHapticFeedback
{
  v2 = [(UIFocusMovementAction *)self info];
  v3 = [v2 objectForSetting:3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (CGRect)focusedFrame
{
  v2 = [(UIFocusMovementAction *)self info];
  v3 = [v2 objectForSetting:4];
  objc_msgSend(v3, "bs_CGRectValue");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (int64_t)UIActionType
{
  return 24;
}

@end