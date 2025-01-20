@interface SBSwitcherModelRemovalRequestAction
+ (id)defaultRemovalPolicyAction;
+ (id)replacementActionWithAppLayout:(id)a3;
- (SBAppLayout)replacementAppLayout;
- (id)_initWithActionType:(int64_t)a3;
- (int64_t)actionType;
@end

@implementation SBSwitcherModelRemovalRequestAction

- (id)_initWithActionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherModelRemovalRequestAction;
  id result = [(SBSwitcherModelRemovalRequestAction *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

+ (id)defaultRemovalPolicyAction
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithActionType:1];
  return v2;
}

+ (id)replacementActionWithAppLayout:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [objc_alloc((Class)a1) _initWithActionType:2];
  v7 = (void *)v6;
  if (v6) {
    objc_storeStrong((id *)(v6 + 16), a3);
  }

  return v7;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (SBAppLayout)replacementAppLayout
{
  return self->_replacementAppLayout;
}

- (void).cxx_destruct
{
}

@end