@interface _UIORequestKeyShortcutHUDPresentationAction
- (BOOL)isPermitted;
- (_UIKeyShortcutHUDConfiguration)configuration;
- (_UIORequestKeyShortcutHUDPresentationAction)initWithConfiguration:(id)a3 responseHandler:(id)a4;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIORequestKeyShortcutHUDPresentationAction

- (_UIORequestKeyShortcutHUDPresentationAction)initWithConfiguration:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];

  [v9 setObject:v10 forSetting:0];
  v11 = (void *)MEMORY[0x1E4F4F670];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85___UIORequestKeyShortcutHUDPresentationAction_initWithConfiguration_responseHandler___block_invoke;
  v17[3] = &unk_1E52EE548;
  id v18 = v6;
  id v12 = v6;
  v13 = [v11 responderWithHandler:v17];
  objc_msgSend(v13, "setTimeout:", dispatch_time(0, 2000000000));
  [v13 setQueue:MEMORY[0x1E4F14428]];
  v16.receiver = self;
  v16.super_class = (Class)_UIORequestKeyShortcutHUDPresentationAction;
  v14 = [(_UIOServerAction *)&v16 initWithOriginContext:0 info:v9 responder:v13];

  return v14;
}

- (_UIKeyShortcutHUDConfiguration)configuration
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  v4 = self;
  v5 = [(_UIORequestKeyShortcutHUDPresentationAction *)self info];
  id v6 = [v5 objectForSetting:0];
  v7 = [v3 unarchivedObjectOfClass:v4 fromData:v6 error:0];

  return (_UIKeyShortcutHUDConfiguration *)v7;
}

- (BOOL)isPermitted
{
  return +[UIKeyShortcutHUDService _isOOPFeatureEnabled];
}

- (void)performActionFromConnection:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke;
  aBlock[3] = &unk_1E5309758;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  id v6 = [v4 server];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke_2;
  v9[3] = &unk_1E53097A8;
  id v10 = v4;
  id v11 = v5;
  v9[4] = self;
  id v7 = v4;
  id v8 = v5;
  [v6 awaitDisplayDelegateForAction:self sceneType:1 timeout:v9 completion:1.0];
}

@end