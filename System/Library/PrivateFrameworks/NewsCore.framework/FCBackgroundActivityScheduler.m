@interface FCBackgroundActivityScheduler
- (id)_makeFullIdentifierFromIdentifier:(id)a3;
- (int64_t)_makeFromFCResult:(int64_t)a3;
- (void)cancelRepeatingTaskWithIdentifier:(id)a3;
- (void)requestBackgroundAppRefreshStartingAfter:(id)a3 before:(id)a4;
- (void)scheduleBackgroundTaskRepeatingAtInterval:(double)a3 identifier:(id)a4 task:(id)a5;
@end

@implementation FCBackgroundActivityScheduler

- (void)scheduleBackgroundTaskRepeatingAtInterval:(double)a3 identifier:(id)a4 task:(id)a5
{
  id v8 = a5;
  v9 = [(FCBackgroundActivityScheduler *)self _makeFullIdentifierFromIdentifier:a4];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:v9];
  [v10 setRepeats:1];
  [v10 setInterval:a3];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke;
  v13[3] = &unk_1E5B56E40;
  id v14 = v10;
  v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v10;
  [v12 scheduleWithBlock:v13];
}

void __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke_2;
  aBlock[3] = &unk_1E5B4C090;
  id v10 = *(id *)(a1 + 32);
  v4 = _Block_copy(aBlock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke_3;
  v7[3] = &unk_1E5B56E18;
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  v6 = _Block_copy(v7);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldDefer];
}

uint64_t __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _makeFromFCResult:a2];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)cancelRepeatingTaskWithIdentifier:(id)a3
{
  id v4 = [(FCBackgroundActivityScheduler *)self _makeFullIdentifierFromIdentifier:a3];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:v4];
  [v3 invalidate];
}

- (void)requestBackgroundAppRefreshStartingAfter:(id)a3 before:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F5FA50];
  id v6 = a4;
  id v7 = a3;
  id v15 = [v5 scheduler];
  id v8 = (void *)MEMORY[0x1E4F5FA28];
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  id v10 = [v9 bundleIdentifier];
  uint64_t v11 = *MEMORY[0x1E4F5FAF0];
  id v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = [v12 bundleIdentifier];
  id v14 = [v8 applicationLaunchActivityWithName:v10 priority:v11 forApplication:v13 withReason:*MEMORY[0x1E4F5FAD8] duration:*MEMORY[0x1E4F5FA98] startingAfter:v7 startingBefore:v6];

  [v14 setRequiresNetwork:1];
  [v15 submitActivity:v14];
}

- (int64_t)_makeFromFCResult:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)_makeFullIdentifierFromIdentifier:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  id v5 = [v3 mainBundle];
  id v6 = [v5 bundleIdentifier];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v6];
  [v7 appendString:@"."];
  [v7 appendString:v4];

  return v7;
}

@end