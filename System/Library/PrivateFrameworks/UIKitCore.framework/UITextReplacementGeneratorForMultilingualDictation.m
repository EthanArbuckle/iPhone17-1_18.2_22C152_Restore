@interface UITextReplacementGeneratorForMultilingualDictation
- (NSArray)multilingualAlternatives;
- (UITextReplacementGeneratorForMultilingualDictation)initWithMultilingualAlternatives:(id)a3 stringToReplace:(id)a4 replacementRange:(id)a5;
- (id)replacements;
@end

@implementation UITextReplacementGeneratorForMultilingualDictation

- (UITextReplacementGeneratorForMultilingualDictation)initWithMultilingualAlternatives:(id)a3 stringToReplace:(id)a4 replacementRange:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UITextReplacementGeneratorForMultilingualDictation;
  v12 = [(UITextReplacementGeneratorForMultilingualDictation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(UITextReplacementGenerator *)v12 setStringToReplace:v10];
    [(UITextReplacementGenerator *)v13 setReplacementRange:v11];
    objc_storeStrong((id *)&v13->_multilingualAlternatives, a3);
  }

  return v13;
}

- (id)replacements
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(UITextReplacementGeneratorForMultilingualDictation *)self multilingualAlternatives];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v9 text];
        BOOL v11 = [(UITextReplacementGenerator *)self shouldAllowString:v10 intoReplacements:v3];

        if (v11)
        {
          v12 = [(UITextReplacementGenerator *)self replacementRange];
          v13 = [(UITextReplacementGenerator *)self stringToReplace];
          v14 = +[UIDictationMultilingualUtilities textReplacementFromMultilingualString:v9 replacementRange:v12 stringToReplace:v13];
          [v3 addObject:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  objc_super v15 = (void *)[v3 copy];
  return v15;
}

- (NSArray)multilingualAlternatives
{
  return self->_multilingualAlternatives;
}

- (void).cxx_destruct
{
}

@end