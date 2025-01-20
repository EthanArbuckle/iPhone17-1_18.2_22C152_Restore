@interface SBCaptureButtonBehaviorResolver
+ (id)resolveInteractionForBehaviors:(id)a3 inContext:(id)a4;
@end

@implementation SBCaptureButtonBehaviorResolver

+ (id)resolveInteractionForBehaviors:(id)a3 inContext:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[SBCaptureButtonBehaviorsResponse emptyResponse];
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      v13 = v7;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        v15 = [[SBCaptureButtonBehaviorsResponse alloc] initWithBehavior:v14 context:v6];
        v7 = [v13 responseByMergingResponse:v15];

        v16 = [[SBCaptureButtonBehaviorsResponseLog alloc] initWithBehavior:v14 response:v15];
        [v8 addObject:v16];

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  v17 = [[SBCaptureButtonInteraction alloc] initWithContext:v6 response:v7 responseLogs:v8];
  return v17;
}

@end