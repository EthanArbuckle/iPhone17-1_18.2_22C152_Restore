@interface _UIORequestEditMenuPresentationAction
- (BOOL)isPermitted;
- (_UIOEditMenuPresentationConfiguration)configuration;
- (_UIORequestEditMenuPresentationAction)initWithConfiguration:(id)a3 view:(id)a4;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIORequestEditMenuPresentationAction

- (_UIORequestEditMenuPresentationAction)initWithConfiguration:(id)a3 view:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28DB0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
  id v10 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v10 setObject:v9 forSetting:0];
  [v8 sourceRect];
  double v12 = v11;
  double v14 = v13;

  v15 = +[_UIOServerActionOriginContext originContextForView:referencePoint:](_UIOServerActionOriginContext, "originContextForView:referencePoint:", v7, v12, v14);

  v18.receiver = self;
  v18.super_class = (Class)_UIORequestEditMenuPresentationAction;
  v16 = [(_UIOServerAction *)&v18 initWithOriginContext:v15 info:v10 responder:0];

  return v16;
}

- (_UIOEditMenuPresentationConfiguration)configuration
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  v4 = self;
  v5 = [(_UIORequestEditMenuPresentationAction *)self info];
  v6 = [v5 objectForSetting:0];
  id v7 = [v3 unarchivedObjectOfClass:v4 fromData:v6 error:0];

  return (_UIOEditMenuPresentationConfiguration *)v7;
}

- (BOOL)isPermitted
{
  return +[UIEditMenuInteraction _isOutOfProcessEditMenusEnabled];
}

- (void)performActionFromConnection:(id)a3
{
  id v4 = a3;
  v5 = [v4 server];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69___UIORequestEditMenuPresentationAction_performActionFromConnection___block_invoke;
  v7[3] = &unk_1E5308B88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 awaitDisplayDelegateForAction:self sceneType:1 timeout:v7 completion:1.0];
}

@end