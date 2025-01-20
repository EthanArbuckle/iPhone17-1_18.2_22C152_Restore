@interface SBSSystemNotesConnectAction
- (SBSSystemNotesConnectAction)initWithSource:(unint64_t)a3 responder:(id)a4;
- (unint64_t)connectionSource;
@end

@implementation SBSSystemNotesConnectAction

- (SBSSystemNotesConnectAction)initWithSource:(unint64_t)a3 responder:(id)a4
{
  id v7 = a4;
  if (a3 >= 3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSSystemNotesConnectAction.m", 30, @"Invalid parameter not satisfying: %@", @"connectionSource < SBSSystemNotesSceneConnectionSourceCount" object file lineNumber description];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [v8 setObject:v9 forSetting:0];

  v10 = objc_alloc_init(_SBSSystemNotesConnectActionSettingsDescriptionProvider);
  [v8 setDescriptionProvider:v10];

  v14.receiver = self;
  v14.super_class = (Class)SBSSystemNotesConnectAction;
  v11 = [(SBSSystemNotesConnectAction *)&v14 initWithInfo:v8 responder:v7];

  return v11;
}

- (unint64_t)connectionSource
{
  v4 = [(SBSSystemNotesConnectAction *)self info];
  v5 = [v4 objectForSetting:0];
  unint64_t v6 = [v5 unsignedIntegerValue];

  if (v6 >= 3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSSystemNotesConnectAction.m", 40, @"Invalid parameter not satisfying: %@", @"sourceNum < SBSSystemNotesSceneConnectionSourceCount" object file lineNumber description];
  }
  return v6;
}

@end