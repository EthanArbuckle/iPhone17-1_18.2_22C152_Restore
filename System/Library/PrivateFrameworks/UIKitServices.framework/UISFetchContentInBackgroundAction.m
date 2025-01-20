@interface UISFetchContentInBackgroundAction
- (UISFetchContentInBackgroundAction)initWithHandler:(id)a3;
- (UISFetchContentInBackgroundAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (int64_t)UIActionType;
- (void)sendResponse:(id)a3;
@end

@implementation UISFetchContentInBackgroundAction

- (UISFetchContentInBackgroundAction)initWithHandler:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F627D0], "responderWithHandler:");
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)UISFetchContentInBackgroundAction;
  v5 = [(UISFetchContentInBackgroundAction *)&v7 initWithInfo:0 responder:v4];

  return v5;
}

- (UISFetchContentInBackgroundAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return -[UISFetchContentInBackgroundAction initWithHandler:](self, "initWithHandler:", a6, a5, a4);
}

- (int64_t)UIActionType
{
  return 2;
}

- (void)sendResponse:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"UISFetchContentInBackgroundAction.m", 52, @"You sent back the wrong response class -> %@", v5 object file lineNumber description];
  }
  v7.receiver = self;
  v7.super_class = (Class)UISFetchContentInBackgroundAction;
  [(UISFetchContentInBackgroundAction *)&v7 sendResponse:v5];
}

@end