@interface UISceneHitTestAction
- (CGPoint)touchLocation;
- (UISceneHitTestAction)initWithTouchLocation:(CGPoint)a3 responseHandler:(id)a4;
- (int64_t)UIActionType;
- (void)sendResponse:(id)a3;
@end

@implementation UISceneHitTestAction

- (UISceneHitTestAction)initWithTouchLocation:(CGPoint)a3 responseHandler:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
  [v8 setObject:v9 forSetting:1];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__UISceneHitTestAction_initWithTouchLocation_responseHandler___block_invoke;
  v14[3] = &unk_1E52EE548;
  id v15 = v7;
  v13.receiver = self;
  v13.super_class = (Class)UISceneHitTestAction;
  id v10 = v7;
  v11 = [(UISceneHitTestAction *)&v13 initWithInfo:v8 timeout:0 forResponseOnQueue:v14 withHandler:0.0];

  return v11;
}

uint64_t __62__UISceneHitTestAction_initWithTouchLocation_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGPoint)touchLocation
{
  v2 = [(UISceneHitTestAction *)self info];
  v3 = [v2 objectForSetting:1];
  [v3 CGPointValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (void)sendResponse:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"UISceneHitTestAction.m", 42, @"you sent back the wrong response class -> %@", v5 object file lineNumber description];
  }
  v7.receiver = self;
  v7.super_class = (Class)UISceneHitTestAction;
  [(UISceneHitTestAction *)&v7 sendResponse:v5];
}

- (int64_t)UIActionType
{
  return 22;
}

@end