@interface SearchUISportsLiveActivitiesEnabledCache
- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4;
@end

@implementation SearchUISportsLiveActivitiesEnabledCache

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__SearchUISportsLiveActivitiesEnabledCache_computeObjectForKey_completionHandler___block_invoke;
  v6[3] = &unk_1E6E72E90;
  id v7 = v4;
  id v5 = v4;
  +[SearchUISportsKitUtilities liveActivitiesEnabledWithCompletionBlock:v6];
}

void __82__SearchUISportsLiveActivitiesEnabledCache_computeObjectForKey_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

@end