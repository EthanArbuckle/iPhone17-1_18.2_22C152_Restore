@interface UIApplicationSceneSessionSet
@end

@implementation UIApplicationSceneSessionSet

void ___UIApplicationSceneSessionSet_block_invoke_2(uint64_t a1)
{
  id v1 = [(id)UIApp _discardedSceneSessionIdentifiersSinceLastRunWithContext:*(void *)(a1 + 32) knownSessions:*(void *)(a1 + 40)];
  [(id)UIApp _discardSceneSessionsWithPersistentIdentifiers:v1 skippingPersistenceDeletion:0];
}

void ___UIApplicationSceneSessionSet_block_invoke()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v0 = +[_UICanvasUserActivityManager _knownSceneSessionMap];
  uint64_t v1 = [MEMORY[0x1E4F1CA80] set];
  v2 = (void *)qword_1EB25B9F8;
  qword_1EB25B9F8 = v1;

  v3 = +[_UIApplicationConfigurationLoader sharedLoader];
  v4 = [v3 applicationInitializationContext];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [v4 persistedSceneIdentifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [v0 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * v9)];
        if (v10) {
          [(id)qword_1EB25B9F8 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___UIApplicationSceneSessionSet_block_invoke_2;
  v14[3] = &unk_1E52D9F98;
  id v15 = v4;
  id v16 = v0;
  id v12 = v0;
  id v13 = v4;
  [v11 performBlock:v14];
}

@end