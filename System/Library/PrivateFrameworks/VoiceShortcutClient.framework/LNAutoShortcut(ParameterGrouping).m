@interface LNAutoShortcut(ParameterGrouping)
- (id)allGroupedPhrases;
- (id)parameterGroups;
- (id)parameterlessPhrases;
- (id)primaryPhrases;
@end

@implementation LNAutoShortcut(ParameterGrouping)

- (id)allGroupedPhrases
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  uint64_t v1 = WFLocalizedPhrasesGroupedByParameterIdentifier(a1, &v16, 0);
  unint64_t v2 = (unint64_t)v16;
  v3 = 0;
  if (v1 | v2)
  {
    v4 = objc_opt_new();
    v3 = v4;
    if (v2) {
      [v4 addObject:v2];
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = (id)v1;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "phrases", (void)v12);
          [v3 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v3;
}

- (id)primaryPhrases
{
  id v4 = 0;
  id v1 = WFLocalizedPhrasesGroupedByParameterIdentifier(a1, 0, &v4);
  id v2 = v4;
  return v2;
}

- (id)parameterGroups
{
  return WFLocalizedPhrasesGroupedByParameterIdentifier(a1, 0, 0);
}

- (id)parameterlessPhrases
{
  id v4 = 0;
  id v1 = WFLocalizedPhrasesGroupedByParameterIdentifier(a1, &v4, 0);
  id v2 = v4;
  return v2;
}

@end