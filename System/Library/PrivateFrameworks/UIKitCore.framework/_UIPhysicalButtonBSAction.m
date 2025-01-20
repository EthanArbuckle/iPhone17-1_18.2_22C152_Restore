@interface _UIPhysicalButtonBSAction
- (BOOL)settings:(id)a3 appendDescriptionToBuilder:(id)a4 forFlag:(int64_t)a5 object:(id)a6 ofSetting:(unint64_t)a7;
- (_UIPhysicalButtonBSAction)initWithPhysicalButton:(unint64_t)a3 behavior:(unint64_t)a4 generation:(unint64_t)a5 completion:(id)a6;
- (_UIPhysicalButtonBSAction)initWithPhysicalButton:(unint64_t)a3 behavior:(unint64_t)a4 state:(unint64_t)a5 generation:(unint64_t)a6 completion:(id)a7;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)UIActionType;
- (unint64_t)behavior;
- (unint64_t)button;
- (unint64_t)generation;
- (unint64_t)state;
@end

@implementation _UIPhysicalButtonBSAction

- (_UIPhysicalButtonBSAction)initWithPhysicalButton:(unint64_t)a3 behavior:(unint64_t)a4 generation:(unint64_t)a5 completion:(id)a6
{
  return [(_UIPhysicalButtonBSAction *)self initWithPhysicalButton:a3 behavior:a4 state:2 generation:a5 completion:a6];
}

- (_UIPhysicalButtonBSAction)initWithPhysicalButton:(unint64_t)a3 behavior:(unint64_t)a4 state:(unint64_t)a5 generation:(unint64_t)a6 completion:(id)a7
{
  if ((_UIPhysicalButtonBehaviorIsValidForButton(a4, a3) & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPhysicalButtonBSAction.m", 50, @"Invalid behavior: %lu; for button: %lu",
      a4,
      a3);
  }
  v14 = _UIPhysicalButtonBSActionSettings(a3, a4, a5, a6);
  if (a7)
  {
    a7 = [MEMORY[0x1E4F4F670] responderWithHandler:a7];
    [a7 setQueue:MEMORY[0x1E4F14428]];
  }
  v18.receiver = self;
  v18.super_class = (Class)_UIPhysicalButtonBSAction;
  v15 = [(_UIPhysicalButtonBSAction *)&v18 initWithInfo:v14 responder:a7];

  return v15;
}

- (int64_t)UIActionType
{
  return 51;
}

- (unint64_t)button
{
  v2 = [(_UIPhysicalButtonBSAction *)self info];
  v3 = [v2 objectForSetting:0];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)behavior
{
  v2 = [(_UIPhysicalButtonBSAction *)self info];
  v3 = [v2 objectForSetting:1];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)state
{
  v2 = [(_UIPhysicalButtonBSAction *)self info];
  v3 = [v2 objectForSetting:3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)generation
{
  v2 = [(_UIPhysicalButtonBSAction *)self info];
  v3 = [v2 objectForSetting:2];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(_UIPhysicalButtonBSAction *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t v4 = _NSStringFromUIPhysicalButtonActionSetting(0);
  v5 = _NSStringFromUIPhysicalButton([(_UIPhysicalButtonBSAction *)self button]);
  [v3 appendString:v5 withName:v4];
  v6 = _NSStringFromUIPhysicalButtonActionSetting(1uLL);
  v7 = _NSStringFromUIPhysicalButtonBehavior([(_UIPhysicalButtonBSAction *)self behavior]);
  [v3 appendString:v7 withName:v6];
  v8 = _NSStringFromUIPhysicalButtonActionSetting(3uLL);
  v9 = _NSStringFromUIPhysicalButtonState([(_UIPhysicalButtonBSAction *)self state]);
  [v3 appendString:v9 withName:v8];
  unint64_t v10 = [(_UIPhysicalButtonBSAction *)self generation];
  v11 = _NSStringFromUIPhysicalButtonActionSetting(2uLL);
  id v12 = (id)[v3 appendUInt64:v10 withName:v11];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIPhysicalButtonBSAction *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIPhysicalButtonBSAction *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67___UIPhysicalButtonBSAction_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

- (BOOL)settings:(id)a3 appendDescriptionToBuilder:(id)a4 forFlag:(int64_t)a5 object:(id)a6 ofSetting:(unint64_t)a7
{
  unint64_t v10 = _NSStringFromUIPhysicalButtonActionSetting(a7);
  switch(a7)
  {
    case 0uLL:
      uint64_t v11 = _NSStringFromUIPhysicalButton([a6 unsignedIntegerValue]);
      goto LABEL_7;
    case 1uLL:
      uint64_t v11 = _NSStringFromUIPhysicalButtonBehavior([a6 unsignedIntegerValue]);
      goto LABEL_7;
    case 2uLL:
      id v13 = (id)objc_msgSend(a4, "appendUInt64:withName:", objc_msgSend(a6, "longLongValue"), v10);
      goto LABEL_8;
    case 3uLL:
      uint64_t v11 = _NSStringFromUIPhysicalButtonState([a6 unsignedIntegerValue]);
LABEL_7:
      v14 = (void *)v11;
      [a4 appendString:v11 withName:v10];

LABEL_8:
      BOOL v12 = 1;
      break;
    default:
      BOOL v12 = 0;
      break;
  }

  return v12;
}

@end