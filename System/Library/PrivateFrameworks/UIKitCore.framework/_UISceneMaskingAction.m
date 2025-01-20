@interface _UISceneMaskingAction
+ (id)actionForBeginMaskingWithReason:(int64_t)a3 continuation:(id)a4;
+ (id)invalidationAction;
@end

@implementation _UISceneMaskingAction

+ (id)actionForBeginMaskingWithReason:(int64_t)a3 continuation:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v7 setObject:&unk_1ED3F6E10 forSetting:0];
  v8 = [NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forSetting:1];

  v9 = (void *)MEMORY[0x1E4F4F670];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70___UISceneMaskingAction_actionForBeginMaskingWithReason_continuation___block_invoke;
  v14[3] = &unk_1E52EE548;
  id v15 = v6;
  id v10 = v6;
  v11 = [v9 responderWithHandler:v14];
  [v11 setQueue:MEMORY[0x1E4F14428]];
  v12 = (void *)[objc_alloc((Class)a1) initWithInfo:v7 responder:v11];

  return v12;
}

+ (id)invalidationAction
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v3 setObject:&unk_1ED3F6E28 forSetting:0];
  v4 = (void *)[objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

@end