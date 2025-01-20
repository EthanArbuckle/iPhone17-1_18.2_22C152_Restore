@interface SESecureCaptureOpenApplicationAfterTransitionCompletionAction
- (NSSet)launchActions;
- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)init;
- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithCoder:(id)a3;
- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithInfo:(id)a3 responder:(id)a4;
- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithUserActivity:(id)a3 responder:(id)a4;
- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithXPCDictionary:(id)a3;
@end

@implementation SESecureCaptureOpenApplicationAfterTransitionCompletionAction

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
  return [(SESecureCaptureOpenApplicationAfterTransitionCompletionAction *)&v3 initWithInfo:0 responder:0];
}

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithUserActivity:(id)a3 responder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (SESecureCaptureOpenApplicationAfterTransitionCompletionAction *)SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(userActivity:responder:)(v5, a4);
}

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
  return [(SESecureCaptureOpenApplicationAfterTransitionCompletionAction *)&v4 initWithCoder:a3];
}

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithXPCDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
  return [(SESecureCaptureOpenApplicationAfterTransitionCompletionAction *)&v4 initWithXPCDictionary:a3];
}

- (NSSet)launchActions
{
  v2 = self;
  SESecureCaptureOpenApplicationAfterTransitionCompletionAction.launchActions.getter();

  sub_25BEED774(0, &qword_26A5824C8);
  sub_25BEED5A0();
  objc_super v3 = (void *)sub_25BF05668();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithInfo:(id)a3 responder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (SESecureCaptureOpenApplicationAfterTransitionCompletionAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  _Block_copy(a6);
  id v8 = a3;
  id v9 = a5;
  result = (SESecureCaptureOpenApplicationAfterTransitionCompletionAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end