@interface SBSSystemNotesCreateAction
- (SBSSystemNotesCreateAction)initWithReason:(int64_t)a3 responder:(id)a4;
- (int64_t)reason;
@end

@implementation SBSSystemNotesCreateAction

- (SBSSystemNotesCreateAction)initWithReason:(int64_t)a3 responder:(id)a4
{
  id v7 = a4;
  if (a3 != 1)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSSystemNotesCreateAction.m", 31, @"Invalid parameter not satisfying: %@", @"reason > SBSSystemNotesCreateReasonInvalid && reason < SBSSystemNotesCreateReasonCount" object file lineNumber description];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v8 setObject:v9 forSetting:0];

  v10 = objc_alloc_init(_SBSSystemNotesCreateActionSettingsDescriptionProvider);
  [v8 setDescriptionProvider:v10];

  v14.receiver = self;
  v14.super_class = (Class)SBSSystemNotesCreateAction;
  v11 = [(SBSSystemNotesCreateAction *)&v14 initWithInfo:v8 responder:v7];

  return v11;
}

- (int64_t)reason
{
  v4 = [(SBSSystemNotesCreateAction *)self info];
  v5 = [v4 objectForSetting:0];
  unint64_t v6 = [v5 unsignedIntegerValue];

  if (v6 >= 3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSSystemNotesCreateAction.m", 41, @"Invalid parameter not satisfying: %@", @"reasonNum >= SBSSystemNotesCreateReasonInvalid && reasonNum <= SBSSystemNotesCreateReasonCount" object file lineNumber description];
  }
  return v6;
}

@end