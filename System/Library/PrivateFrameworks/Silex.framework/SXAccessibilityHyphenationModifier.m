@interface SXAccessibilityHyphenationModifier
- (void)enableHyphenationForComponentTextStyleWithIdentifier:(id)a3 DOM:(id)a4 context:(id)a5;
- (void)modifyDOM:(id)a3 context:(id)a4;
@end

@implementation SXAccessibilityHyphenationModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 layoutOptions];
  v9 = [v8 contentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = objc_msgSend(v6, "componentTextStyles", 0);
    v12 = [v11 allKeys];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [(SXAccessibilityHyphenationModifier *)self enableHyphenationForComponentTextStyleWithIdentifier:*(void *)(*((void *)&v17 + 1) + 8 * v16++) DOM:v6 context:v7];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

- (void)enableHyphenationForComponentTextStyleWithIdentifier:(id)a3 DOM:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 componentTextStyles];
  v11 = [v10 objectForKey:v9];

  v12 = [v11 JSONRepresentation];
  uint64_t v13 = v12;
  if (!v12) {
    v12 = (void *)MEMORY[0x263EFFA78];
  }
  uint64_t v14 = (void *)[v12 mutableCopy];

  [v14 setObject:MEMORY[0x263EFFA88] forKey:@"hyphenation"];
  [v14 setObject:&unk_26D593A88 forKey:@"hyphenationMinimumWordLength"];
  [v14 setObject:&unk_26D593A88 forKey:@"hyphenationMinimumCharactersBefore"];
  [v14 setObject:&unk_26D593A88 forKey:@"hyphenationMinimumCharactersAfter"];
  [v14 setObject:&unk_26D593AA0 forKey:@"hyphenationZone"];
  uint64_t v15 = [SXComponentTextStyle alloc];
  uint64_t v16 = [v7 specVersion];

  long long v18 = [(SXJSONObject *)v15 initWithJSONObject:v14 andVersion:v16];
  long long v17 = [v8 componentTextStyles];

  [v17 setObject:v18 forKey:v9];
}

@end