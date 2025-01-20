@interface SFCard(Feedback)
- (void)copyForFeedback;
@end

@implementation SFCard(Feedback)

- (void)copyForFeedback
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v1 = (void *)[a1 copy];
  v2 = [v1 cardSections];
  v3 = (void *)[v2 mutableCopy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = objc_msgSend(v1, "cardSections", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v9) copyForFeedback];
        [v3 setObject:v10 atIndexedSubscript:v7 + v9];

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      v7 += v9;
    }
    while (v6);
  }

  v11 = (void *)[v3 copy];
  [v1 setCardSections:v11];

  return v1;
}

@end