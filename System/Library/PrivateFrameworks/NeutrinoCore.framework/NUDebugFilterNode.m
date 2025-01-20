@interface NUDebugFilterNode
- (BOOL)requiresVideoComposition;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUDebugFilterNode

- (BOOL)requiresVideoComposition
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NURenderNode *)self inputs];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = objc_msgSend(v2, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
        char v7 = [v6 requiresVideoComposition];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NUDebugFilterNode;
  v6 = [(NUFilterNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];

  return v6;
}

@end