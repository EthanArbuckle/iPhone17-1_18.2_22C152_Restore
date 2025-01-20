@interface NURAWDemosaicNode
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NURAWDemosaicNode

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 scale];
  if (NUScaleCompare(v13, v14, 1, 2) <= 0)
  {
    v15 = (void *)[v11 mutableCopy];
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"inputDraftMode"];

    id v11 = v15;
  }
  v18.receiver = self;
  v18.super_class = (Class)NURAWDemosaicNode;
  v16 = [(NURawFilterNode *)&v18 resolvedNodeWithCachedInputs:v10 settings:v11 pipelineState:v12 error:a6];

  return v16;
}

@end