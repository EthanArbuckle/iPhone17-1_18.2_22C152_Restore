@interface PIPortraitNode
+ (BOOL)isPortraitMonoEffect:(id)a3;
+ (BOOL)isPortraitStageEffect:(id)a3;
+ (id)vectorWithFloats:(id)a3;
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)shouldDisableGainMap;
- (NURenderNode)blurMap;
- (NURenderNode)input;
- (id)_evaluateImageProperties:(id *)a3;
@end

@implementation PIPortraitNode

+ (BOOL)isPortraitMonoEffect:(id)a3
{
  return [&unk_1F000AAC0 containsObject:a3];
}

+ (BOOL)isPortraitStageEffect:(id)a3
{
  return [&unk_1F000AAA8 containsObject:a3];
}

+ (id)vectorWithFloats:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4 >= 0x20) {
    uint64_t v5 = 32;
  }
  else {
    uint64_t v5 = v4;
  }
  v6 = objc_msgSend(v3, "subarrayWithRange:", 0, v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    v11 = v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "doubleValue", (void)v16);
        *v11++ = v13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v14 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithValues:count:", v21, objc_msgSend(v7, "count"));

  return v14;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  uint64_t v5 = [(PIPortraitNode *)self input];
  int v6 = [v5 canPropagateOriginalAuxiliaryData:a3];

  if (a3 == 7 && v6) {
    return ![(PIPortraitNode *)self shouldDisableGainMap];
  }
  return v6;
}

- (id)_evaluateImageProperties:(id *)a3
{
  uint64_t v5 = [(PIPortraitNode *)self input];
  int v6 = [v5 imageProperties:a3];

  if (v6 && [(PIPortraitNode *)self shouldDisableGainMap])
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A738]) initWithProperties:v6];
    [v7 setAuxiliaryImageProperties:0 forType:7];

    int v6 = v7;
  }
  return v6;
}

- (BOOL)shouldDisableGainMap
{
  return 0;
}

- (NURenderNode)blurMap
{
  v2 = [(NURenderNode *)self inputs];
  id v3 = [v2 objectForKeyedSubscript:@"inputBlurMap"];

  return (NURenderNode *)v3;
}

- (NURenderNode)input
{
  v2 = [(NURenderNode *)self inputs];
  id v3 = [v2 objectForKeyedSubscript:@"inputImage"];

  return (NURenderNode *)v3;
}

@end