@interface TGTextGenerationOutputStream
- (NSMutableArray)textFragments;
- (NSString)mostRecentTextUpdate;
- (NSString)text;
- (TGTextGenerationOutputStream)init;
- (double)score;
- (void)addOutput:(id)a3;
- (void)setScore:(double)a3;
@end

@implementation TGTextGenerationOutputStream

- (TGTextGenerationOutputStream)init
{
  v6.receiver = self;
  v6.super_class = (Class)TGTextGenerationOutputStream;
  v2 = [(TGTextGenerationOutputStream *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    textFragments = v2->_textFragments;
    v2->_textFragments = (NSMutableArray *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)addOutput:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 score];
  -[TGTextGenerationOutputStream setScore:](self, "setScore:");
  objc_super v6 = [(TGTextGenerationOutputStream *)self textFragments];
  v7 = [v5 text];

  [v6 addObject:v7];
  os_unfair_lock_unlock(p_lock);
}

- (NSString)mostRecentTextUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(TGTextGenerationOutputStream *)self textFragments];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    objc_super v6 = [(TGTextGenerationOutputStream *)self textFragments];
    v7 = [v6 lastObject];
  }
  else
  {
    v7 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v7;
}

- (NSString)text
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F089D8] string];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [(TGTextGenerationOutputStream *)self textFragments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 appendString:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSMutableArray)textFragments
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

@end