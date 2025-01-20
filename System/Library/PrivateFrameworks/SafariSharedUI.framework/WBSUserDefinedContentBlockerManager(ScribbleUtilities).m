@interface WBSUserDefinedContentBlockerManager(ScribbleUtilities)
- (void)deleteAllContentBlockersWithCompletionHandler:()ScribbleUtilities;
- (void)getAllPaintingAvoidanceSelectorsThatApplyToHost:()ScribbleUtilities completionHandler:;
@end

@implementation WBSUserDefinedContentBlockerManager(ScribbleUtilities)

- (void)deleteAllContentBlockersWithCompletionHandler:()ScribbleUtilities
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __104__WBSUserDefinedContentBlockerManager_ScribbleUtilities__deleteAllContentBlockersWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5E412A0;
  id v7 = v4;
  id v5 = v4;
  [a1 resetDatabaseWithCompletionHandler:v6];
}

- (void)getAllPaintingAvoidanceSelectorsThatApplyToHost:()ScribbleUtilities completionHandler:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __124__WBSUserDefinedContentBlockerManager_ScribbleUtilities__getAllPaintingAvoidanceSelectorsThatApplyToHost_completionHandler___block_invoke;
  v8[3] = &unk_1E5E43AF8;
  v8[4] = a1;
  id v9 = v6;
  id v7 = v6;
  [a1 contentBlockerForHost:a3 createIfNeeded:0 completionHandler:v8];
}

@end