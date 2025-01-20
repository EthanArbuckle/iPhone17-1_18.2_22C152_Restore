@interface NUChannelAllMatching
- (BOOL)match:(id)a3;
- (id)description;
@end

@implementation NUChannelAllMatching

- (id)description
{
  v2 = NSString;
  v3 = [(NUChannelAnyMatching *)self predicates];
  v4 = [v3 componentsJoinedByString:@", "];
  v5 = [v2 stringWithFormat:@"ALL(%@)", v4];

  return v5;
}

- (BOOL)match:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(NUChannelAnyMatching *)self predicates];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) match:v4])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

@end