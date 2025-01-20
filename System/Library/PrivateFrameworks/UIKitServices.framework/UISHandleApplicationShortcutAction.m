@interface UISHandleApplicationShortcutAction
- (BOOL)isKindOfClass:(Class)a3;
- (SBSApplicationShortcutItem)sbsShortcutItem;
- (UIApplicationShortcutItem)uiShortcutItem;
- (UISHandleApplicationShortcutAction)initWithSBSShortcutItem:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
@end

@implementation UISHandleApplicationShortcutAction

- (UISHandleApplicationShortcutAction)initWithSBSShortcutItem:(id)a3
{
  id v5 = a3;
  getSBSApplicationShortcutItemClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UISHandleApplicationShortcutAction.m", 33, @"Invalid parameter not satisfying: %@", @"[shortcutItem isKindOfClass:getSBSApplicationShortcutItemClass()]" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F62860]);
  v7 = (void *)[v5 copy];
  [v6 setObject:v7 forSetting:1];

  v11.receiver = self;
  v11.super_class = (Class)UISHandleApplicationShortcutAction;
  v8 = [(UISHandleApplicationShortcutAction *)&v11 initWithInfo:v6 responder:0];

  return v8;
}

- (SBSApplicationShortcutItem)sbsShortcutItem
{
  v2 = [(UISHandleApplicationShortcutAction *)self info];
  v3 = [v2 objectForSetting:1];

  getSBSApplicationShortcutItemClass();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return (SBSApplicationShortcutItem *)v5;
}

- (int64_t)UIActionType
{
  return 17;
}

- (UIApplicationShortcutItem)uiShortcutItem
{
  v2 = [(UISHandleApplicationShortcutAction *)self sbsShortcutItem];
  if (v2)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2050000000;
    v3 = (void *)qword_1EB2888D8;
    uint64_t v11 = qword_1EB2888D8;
    if (!qword_1EB2888D8)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getUIApplicationShortcutItemClass_block_invoke;
      v7[3] = &unk_1E5735260;
      v7[4] = &v8;
      __getUIApplicationShortcutItemClass_block_invoke((uint64_t)v7);
      v3 = (void *)v9[3];
    }
    v4 = v3;
    _Block_object_dispose(&v8, 8);
    id v5 = (void *)[[v4 alloc] initWithSBSApplicationShortcutItem:v2];
  }
  else
  {
    id v5 = 0;
  }

  return (UIApplicationShortcutItem *)v5;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"shortcutItem";
  }
  else {
    return 0;
  }
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISHandleApplicationShortcutAction;
  if (-[UISHandleApplicationShortcutAction isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
}

@end