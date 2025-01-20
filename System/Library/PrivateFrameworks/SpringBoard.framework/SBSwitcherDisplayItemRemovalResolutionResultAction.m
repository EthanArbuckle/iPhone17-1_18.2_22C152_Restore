@interface SBSwitcherDisplayItemRemovalResolutionResultAction
+ (id)defaultRemovalPolicyActionWithAppLayout:(id)a3;
+ (id)replacementActionWithAppLayout:(id)a3 replacementAppLayout:(id)a4;
- (SBAppLayout)appLayout;
- (SBAppLayout)replacementAppLayout;
- (id)_initWithAppLayout:(id)a3 actionType:(int64_t)a4;
- (int64_t)actionType;
@end

@implementation SBSwitcherDisplayItemRemovalResolutionResultAction

- (id)_initWithAppLayout:(id)a3 actionType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherDisplayItemRemovalResolutionResultAction;
  v8 = [(SBSwitcherDisplayItemRemovalResolutionResultAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appLayout, a3);
    v9->_actionType = a4;
  }

  return v9;
}

+ (id)defaultRemovalPolicyActionWithAppLayout:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithAppLayout:v4 actionType:1];

  return v5;
}

+ (id)replacementActionWithAppLayout:(id)a3 replacementAppLayout:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = (id *)[objc_alloc((Class)a1) _initWithAppLayout:v8 actionType:2];

  if (v9) {
    objc_storeStrong(v9 + 3, a4);
  }

  return v9;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (SBAppLayout)replacementAppLayout
{
  return self->_replacementAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementAppLayout, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end