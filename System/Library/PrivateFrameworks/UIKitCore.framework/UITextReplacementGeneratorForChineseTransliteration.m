@interface UITextReplacementGeneratorForChineseTransliteration
- (id)replacements;
@end

@implementation UITextReplacementGeneratorForChineseTransliteration

- (id)replacements
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(UITextReplacementGenerator *)self stringToReplace];
  if ((unint64_t)[(__CFString *)v4 length] >> 2 <= 0x800)
  {
    v5 = [(UITextReplacementGenerator *)self stringToReplace];
    int v6 = [v5 _containsIdeographicCharacters];

    if (!v6) {
      goto LABEL_9;
    }
    v7 = (void *)MEMORY[0x1E4F28E78];
    v8 = [(UITextReplacementGenerator *)self stringToReplace];
    v4 = [v7 stringWithString:v8];

    if (CFStringTransform(v4, 0, @"Simplified-Traditional", 0))
    {
      v9 = [(UITextReplacementGenerator *)self stringToReplace];
      int v10 = [(__CFString *)v4 isEqualToString:v9];

      if (!v10
        || CFStringTransform(v4, 0, @"Traditional-Simplified", 0)
        && ([(UITextReplacementGenerator *)self stringToReplace],
            v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = [(__CFString *)v4 isEqualToString:v11],
            v11,
            (v12 & 1) == 0))
      {
        v13 = [(UITextReplacementGenerator *)self replacementWithText:v4];
        [v3 addObject:v13];
      }
    }
  }

LABEL_9:
  return v3;
}

@end