@interface UIApplication(PhotosUI)
+ (void)pu_prepareCPAnalytics;
- (id)ppt_testDefinitions;
- (void)pu_finishedAnimationSubTest:()PhotosUI forTest:;
- (void)pu_startedAnimationSubTest:()PhotosUI forTest:;
@end

@implementation UIApplication(PhotosUI)

+ (void)pu_prepareCPAnalytics
{
  if (pu_prepareCPAnalytics_onceToken != -1) {
    dispatch_once(&pu_prepareCPAnalytics_onceToken, &__block_literal_global_103326);
  }
}

- (void)pu_finishedAnimationSubTest:()PhotosUI forTest:
{
  id v6 = a4;
  id v7 = a3;
  [a1 finishedSubTest:@"Animation" forTest:v6];
  id v8 = [v7 stringByAppendingString:@"-Animation"];

  [a1 finishedSubTest:v8 forTest:v6];
}

- (void)pu_startedAnimationSubTest:()PhotosUI forTest:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 stringByAppendingString:@"-Latency"];
  [a1 startedSubTest:v8 forTest:v7 withMetrics:&unk_1F078B8E8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__UIApplication_PhotosUI__pu_startedAnimationSubTest_forTest___block_invoke;
  v11[3] = &unk_1E5F2E908;
  v11[4] = a1;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [a1 installCACommitCompletionBlock:v11];
}

- (id)ppt_testDefinitions
{
  if (ppt_testDefinitions_onceToken != -1) {
    dispatch_once(&ppt_testDefinitions_onceToken, &__block_literal_global_196);
  }
  v0 = (void *)ppt_testDefinitions_testDefinitions;
  return v0;
}

@end