@interface _UIHomeAffordanceDoubleTapGestureActionToClient
+ (id)actionForDoubleTapGestureDidSucceed:(BOOL)a3;
- (BOOL)didSucceed;
- (id)debugDescription;
- (id)description;
- (id)succinctDescription;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation _UIHomeAffordanceDoubleTapGestureActionToClient

+ (id)actionForDoubleTapGestureDidSucceed:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v5 setObject:&unk_1ED3F3E70 forSetting:0];
  v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forSetting:1];

  v7 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];
  return v7;
}

- (BOOL)didSucceed
{
  v2 = [(_UIHomeAffordanceDoubleTapGestureActionToClient *)self info];
  BOOL v3 = [v2 objectForSetting:1];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIHomeAffordanceDoubleTapGestureActionToClient;
  [(_UIHomeAffordanceBSActionToClient *)&v6 appendDescriptionToStream:v4];
  id v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[_UIHomeAffordanceDoubleTapGestureActionToClient didSucceed](self, "didSucceed"), @"didSucceed");
}

- (id)succinctDescription
{
  BOOL v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (id)description
{
  return (id)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)debugDescription
{
  BOOL v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] debugStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

@end