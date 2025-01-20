@interface _UIOMenuLeafPerformAction
- (BKSHIDEventAuthenticationMessage)pasteAuthenticationMessage;
- (NSString)identifier;
- (_UIOMenuLeafPerformAction)initWithMenuElement:(id)a3 pasteAuthenticationMesage:(id)a4 responseHandler:(id)a5;
- (void)handleClientActionToOverlayService:(id)a3;
@end

@implementation _UIOMenuLeafPerformAction

- (_UIOMenuLeafPerformAction)initWithMenuElement:(id)a3 pasteAuthenticationMesage:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 _internalIdentifier];
  v11 = objc_opt_new();
  [v11 setObject:v10 forSetting:0];
  if (v8) {
    [v11 setObject:v8 forSetting:1];
  }
  v12 = (void *)MEMORY[0x1E4F4F670];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91___UIOMenuLeafPerformAction_initWithMenuElement_pasteAuthenticationMesage_responseHandler___block_invoke;
  v18[3] = &unk_1E52EE548;
  id v19 = v9;
  id v13 = v9;
  v14 = [v12 responderWithHandler:v18];
  v17.receiver = self;
  v17.super_class = (Class)_UIOMenuLeafPerformAction;
  v15 = [(_UIOMenuLeafPerformAction *)&v17 initWithInfo:v11 responder:v14];

  return v15;
}

- (BKSHIDEventAuthenticationMessage)pasteAuthenticationMessage
{
  v2 = [(_UIOMenuLeafPerformAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (BKSHIDEventAuthenticationMessage *)v3;
}

- (NSString)identifier
{
  v2 = [(_UIOMenuLeafPerformAction *)self info];
  v3 = [v2 objectForSetting:0];

  return (NSString *)v3;
}

- (void)handleClientActionToOverlayService:(id)a3
{
  v4 = [a3 delegate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64___UIOMenuLeafPerformAction_handleClientActionToOverlayService___block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  [v4 performMenuLeafAction:self completionHandler:v5];
}

@end