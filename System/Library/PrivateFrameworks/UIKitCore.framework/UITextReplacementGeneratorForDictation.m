@interface UITextReplacementGeneratorForDictation
- (NSTextAlternatives)alternatives;
- (UITextReplacementGeneratorForDictation)initWithAlternatives:(id)a3 stringToReplace:(id)a4 replacementRange:(id)a5;
- (id)replacements;
@end

@implementation UITextReplacementGeneratorForDictation

- (UITextReplacementGeneratorForDictation)initWithAlternatives:(id)a3 stringToReplace:(id)a4 replacementRange:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UITextReplacementGeneratorForDictation;
  v12 = [(UITextReplacementGeneratorForDictation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(UITextReplacementGenerator *)v12 setStringToReplace:v10];
    [(UITextReplacementGenerator *)v13 setReplacementRange:v11];
    objc_storeStrong((id *)&v13->_alternatives, a3);
  }

  return v13;
}

- (id)replacements
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(UITextReplacementGeneratorForDictation *)self alternatives];
  v5 = [v4 alternativeStrings];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([(UITextReplacementGenerator *)self shouldAllowString:v10 intoReplacements:v3])
        {
          id v11 = [(UITextReplacementGenerator *)self replacementWithText:v10];
          [v3 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v3;
}

- (NSTextAlternatives)alternatives
{
  return self->_alternatives;
}

- (void).cxx_destruct
{
}

@end