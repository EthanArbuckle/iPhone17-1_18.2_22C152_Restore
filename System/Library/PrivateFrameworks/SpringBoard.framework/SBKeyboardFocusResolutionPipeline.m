@interface SBKeyboardFocusResolutionPipeline
- (SBKeyboardFocusResolutionPipeline)initWithResolutionStages:(id)a3;
- (void)generateKeyboardFocusPolicy:(id)a3 resolutionContext:(id)a4;
@end

@implementation SBKeyboardFocusResolutionPipeline

- (void)generateKeyboardFocusPolicy:(id)a3 resolutionContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = self->_stages;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12), "resolveKeyboardFocusPolicy:context:stop:", v6, v7, &v17, (void)v13);
      if (v17) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (SBKeyboardFocusResolutionPipeline)initWithResolutionStages:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardFocusResolutionPipeline;
  v5 = [(SBKeyboardFocusResolutionPipeline *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stages = v5->_stages;
    v5->_stages = (NSArray *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end