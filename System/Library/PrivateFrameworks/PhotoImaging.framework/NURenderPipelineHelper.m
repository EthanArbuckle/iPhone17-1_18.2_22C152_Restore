@interface NURenderPipelineHelper
@end

@implementation NURenderPipelineHelper

id __112__NURenderPipelineHelper_PI__portraitVideo_disparityInput_disparityKeyframes_apertureKeyframes_debugMode_error___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 count])
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          v9 = [PIScalarKeyframe alloc];
          v10 = -[PIScalarKeyframe initWithDictionaryRepresentation:](v9, "initWithDictionaryRepresentation:", v8, (void)v12);
          [v2 addObject:v10];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end