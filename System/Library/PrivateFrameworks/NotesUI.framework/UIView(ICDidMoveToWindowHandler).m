@interface UIView(ICDidMoveToWindowHandler)
- (void)ic_addDidMoveToWindowHandler:()ICDidMoveToWindowHandler;
@end

@implementation UIView(ICDidMoveToWindowHandler)

- (void)ic_addDidMoveToWindowHandler:()ICDidMoveToWindowHandler
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(a1, (const void *)ICDidMoveToWindowSpyKey);

  if (v5)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[UIView(ICDidMoveToWindowHandler) ic_addDidMoveToWindowHandler:]" simulateCrash:1 showAlert:0 format:@"ICDidMoveToWindowSpyKey is already set"];
  }
  else
  {
    v6 = [ICDidMoveToWindowSpy alloc];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__UIView_ICDidMoveToWindowHandler__ic_addDidMoveToWindowHandler___block_invoke;
    v8[3] = &unk_1E5FDAAB0;
    id v9 = v4;
    v7 = [(ICDidMoveToWindowSpy *)v6 initWithOwner:a1 handler:v8];
    [(ICDidMoveToWindowSpy *)v7 setHidden:1];
    [a1 addSubview:v7];
    objc_setAssociatedObject(a1, (const void *)ICDidMoveToWindowSpyKey, v7, (void *)1);
  }
}

@end