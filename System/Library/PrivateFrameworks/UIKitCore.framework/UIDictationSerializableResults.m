@interface UIDictationSerializableResults
+ (BOOL)supportsSecureCoding;
- (BOOL)addTrailingSpace;
- (BOOL)allowsAlternatives;
- (BOOL)fromKeyboard;
- (BOOL)isFinalResult;
- (BOOL)lowConfidenceAboutLanguageDetection;
- (BOOL)showMultilingualAlternatives;
- (BOOL)useServerCapitalization;
- (NSArray)multilingualAlternatives;
- (NSArray)phrases;
- (NSIndexPath)indexPathOfInterpretations;
- (UIDictationSerializableResults)init;
- (UIDictationSerializableResults)initWithArrayOfArrayOfStrings:(id)a3;
- (UIDictationSerializableResults)initWithCoder:(id)a3;
- (UIDictationSerializableResults)initWithDetectedPhrases:(id)a3 multilingualAlternatives:(id)a4;
- (UIDictationSerializableResults)initWithPhrases:(id)a3;
- (__CFString)transform;
- (id)bestResults;
- (id)bestText;
- (id)bestTextArray;
- (id)bestTextArrayForAlternatives:(id)a3;
- (id)bestTextForMultilingualAlternatives;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictationPhraseArray;
- (id)multilingualResultsByLanguageCode;
- (id)secondBestText;
- (id)secondBestTextArray;
- (id)singleLineResult;
- (id)text;
- (id)textArray;
- (id)textArrayForAlternatives:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAddTrailingSpace:(BOOL)a3;
- (void)setFromKeyboard:(BOOL)a3;
- (void)setIndexPathOfInterpretations:(id)a3;
- (void)setIsFinalResult:(BOOL)a3;
- (void)setLowConfidenceAboutLanguageDetection:(BOOL)a3;
- (void)setMultilingualAlternatives:(id)a3;
- (void)setPhrases:(id)a3;
- (void)setShowMultilingualAlternatives:(BOOL)a3;
- (void)setTransform:(__CFString *)a3;
- (void)setUseServerCapitalization:(BOOL)a3;
@end

@implementation UIDictationSerializableResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationSerializableResults)init
{
  v9.receiver = self;
  v9.super_class = (Class)UIDictationSerializableResults;
  v2 = [(UIDictationSerializableResults *)&v9 init];
  v3 = v2;
  if (v2)
  {
    phrases = v2->_phrases;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_phrases = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_fromKeyboard = 0;
    v3->_useServerCapitalization = 0;
    v3->_allowsAlternatives = 1;
    multilingualAlternatives = v3->_multilingualAlternatives;
    v3->_multilingualAlternatives = v5;
    v3->_transform = 0;

    v3->_showMultilingualAlternatives = 0;
    v7 = v3;
  }

  return v3;
}

- (UIDictationSerializableResults)initWithPhrases:(id)a3
{
  id v4 = a3;
  v5 = [(UIDictationSerializableResults *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    phrases = v5->_phrases;
    v5->_phrases = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (UIDictationSerializableResults)initWithDetectedPhrases:(id)a3 multilingualAlternatives:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UIDictationSerializableResults *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    phrases = v8->_phrases;
    v8->_phrases = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    multilingualAlternatives = v8->_multilingualAlternatives;
    v8->_multilingualAlternatives = (NSArray *)v11;

    v8->_showMultilingualAlternatives = 1;
    v13 = v8;
  }

  return v8;
}

- (UIDictationSerializableResults)initWithArrayOfArrayOfStrings:(id)a3
{
  id v4 = a3;
  v5 = [(UIDictationSerializableResults *)self init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __64__UIDictationSerializableResults_initWithArrayOfArrayOfStrings___block_invoke;
    v15 = &unk_1E52FB640;
    id v16 = v4;
    id v17 = v6;
    id v7 = v6;
    [v16 enumerateObjectsUsingBlock:&v12];
    uint64_t v8 = objc_msgSend(v7, "copy", v12, v13, v14, v15);
    phrases = v5->_phrases;
    v5->_phrases = (NSArray *)v8;

    v10 = v5;
  }

  return v5;
}

void __64__UIDictationSerializableResults_initWithArrayOfArrayOfStrings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __64__UIDictationSerializableResults_initWithArrayOfArrayOfStrings___block_invoke_2;
  v18 = &unk_1E52FB618;
  id v19 = v6;
  uint64_t v22 = a3;
  id v20 = *(id *)(a1 + 32);
  id v21 = v5;
  id v7 = v5;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:&v15];
  uint64_t v9 = [UIDictationInterpretation alloc];
  v10 = -[UIDictationInterpretation initWithTokens:score:](v9, "initWithTokens:score:", v8, 1.0, v15, v16, v17, v18);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = [UIDictationInterpretationGroup alloc];
  v23[0] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v14 = [(UIDictationInterpretationGroup *)v12 initWithInterpretations:v13];
  [v11 addObject:v14];
}

void __64__UIDictationSerializableResults_initWithArrayOfArrayOfStrings___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = [UIDictationScoredToken alloc];
  uint64_t v7 = *(void *)(a1 + 56);
  BOOL v8 = v7 + 1 == [*(id *)(a1 + 40) count] && a3 + 1 == objc_msgSend(*(id *)(a1 + 48), "count");
  uint64_t v9 = [(UIDictationScoredToken *)v6 initWithText:v10 removeSpaceBefore:(v7 | a3) == 0 removeSpaceAfter:v8 confidenceScore:1.0];
  [v5 addObject:v9];
}

- (UIDictationSerializableResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIDictationSerializableResults;
  id v5 = [(UIDictationSerializableResults *)&v20 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    BOOL v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"phrases"];
    phrases = v5->_phrases;
    v5->_phrases = (NSArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"multilingualAlternatives"];
    multilingualAlternatives = v5->_multilingualAlternatives;
    v5->_multilingualAlternatives = (NSArray *)v14;

    v5->_showMultilingualAlternatives = [v4 decodeBoolForKey:@"showMultilingualAlternatives"];
    v5->_lowConfidenceAboutLanguageDetection = [v4 decodeBoolForKey:@"lowConfidenceAboutLanguageDetection"];
    v5->_fromKeyboard = [v4 decodeBoolForKey:@"fromKeyboard"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transform"];
    id v17 = (__CFString *)[v16 copy];
    v5->_transform = v17;

    v5->_useServerCapitalization = [v4 decodeBoolForKey:@"useServerCapitalization"];
    v5->_allowsAlternatives = [v4 decodeBoolForKey:@"allowsAlternatives"];
    v5->_isFinalResult = [v4 decodeBoolForKey:@"isFinalResult"];
    v5->_addTrailingSpace = [v4 decodeBoolForKey:@"addTrailingSpace"];
    v18 = v5;
  }
  return v5;
}

- (void)dealloc
{
  transform = self->_transform;
  if (transform)
  {
    CFRelease(transform);
    self->_transform = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIDictationSerializableResults;
  [(UIDictationSerializableResults *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_phrases forKey:@"phrases"];
  [v5 encodeObject:self->_multilingualAlternatives forKey:@"multilingualAlternatives"];
  [v5 encodeBool:self->_showMultilingualAlternatives forKey:@"showMultilingualAlternatives"];
  [v5 encodeBool:self->_lowConfidenceAboutLanguageDetection forKey:@"lowConfidenceAboutLanguageDetection"];
  [v5 encodeBool:self->_fromKeyboard forKey:@"fromKeyboard"];
  if (self->_transform)
  {
    objc_super v4 = (void *)[[NSString alloc] initWithString:self->_transform];
    [v5 encodeObject:v4 forKey:@"transform"];
  }
  [v5 encodeBool:self->_useServerCapitalization forKey:@"useServerCapitalization"];
  [v5 encodeBool:self->_allowsAlternatives forKey:@"allowsAlternatives"];
  [v5 encodeBool:self->_isFinalResult forKey:@"isFinalResult"];
  [v5 encodeBool:self->_addTrailingSpace forKey:@"addTrailingSpace"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init(UIDictationSerializableResults);
  id v5 = (void *)[(NSArray *)self->_phrases copy];
  [(UIDictationSerializableResults *)v4 setPhrases:v5];

  id v6 = (void *)[(NSArray *)self->_multilingualAlternatives copy];
  [(UIDictationSerializableResults *)v4 setMultilingualAlternatives:v6];

  [(UIDictationSerializableResults *)v4 setShowMultilingualAlternatives:self->_showMultilingualAlternatives];
  [(UIDictationSerializableResults *)v4 setLowConfidenceAboutLanguageDetection:self->_lowConfidenceAboutLanguageDetection];
  [(UIDictationSerializableResults *)v4 setFromKeyboard:self->_fromKeyboard];
  transform = self->_transform;
  if (transform) {
    CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], transform);
  }
  else {
    CFStringRef Copy = 0;
  }
  [(UIDictationSerializableResults *)v4 setTransform:Copy];
  [(UIDictationSerializableResults *)v4 setUseServerCapitalization:self->_useServerCapitalization];
  [(UIDictationSerializableResults *)v4 setAddTrailingSpace:self->_addTrailingSpace];
  uint64_t v9 = (void *)[(NSIndexPath *)self->_indexPathOfInterpretations copy];
  [(UIDictationSerializableResults *)v4 setIndexPathOfInterpretations:v9];

  [(UIDictationSerializableResults *)v4 setIsFinalResult:self->_isFinalResult];
  return v4;
}

- (void)setTransform:(__CFString *)a3
{
  transform = self->_transform;
  if (transform != a3)
  {
    if (transform) {
      CFRelease(transform);
    }
    self->_transform = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (void)setIndexPathOfInterpretations:(id)a3
{
  id v5 = (NSIndexPath *)a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(NSIndexPath *)v5 length];
    if (v7 != [(NSArray *)self->_phrases count])
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"UIDictationUtilities.m" lineNumber:1649 description:@"Incorrect number of interpretation indexes"];
    }
  }
  indexPathOfInterpretations = self->_indexPathOfInterpretations;
  self->_indexPathOfInterpretations = v6;
}

- (id)text
{
  v2 = [(UIDictationSerializableResults *)self textArray];
  v3 = [v2 componentsJoinedByString:&stru_1ED0E84C0];

  return v3;
}

- (id)bestText
{
  v2 = [(UIDictationSerializableResults *)self bestTextArray];
  v3 = [v2 componentsJoinedByString:&stru_1ED0E84C0];

  return v3;
}

- (id)secondBestText
{
  v2 = [(UIDictationSerializableResults *)self secondBestTextArray];
  v3 = [v2 componentsJoinedByString:&stru_1ED0E84C0];

  return v3;
}

- (id)multilingualResultsByLanguageCode
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v4 = self->_multilingualAlternatives;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "dominantLanguage", (void)v12);
        [v3 setObject:v9 forKey:v10];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)bestTextForMultilingualAlternatives
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_multilingualAlternatives;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        BOOL v8 = [v7 phrases];
        uint64_t v9 = [(UIDictationSerializableResults *)self bestTextArrayForAlternatives:v8];

        if ([v9 count])
        {
          uint64_t v10 = [v9 componentsJoinedByString:&stru_1ED0E84C0];
          uint64_t v11 = (void *)v10;
          if (v10) {
            long long v12 = (__CFString *)v10;
          }
          else {
            long long v12 = &stru_1ED0E84C0;
          }
          v24[1] = @"language";
          v25[0] = v12;
          v24[0] = @"text";
          uint64_t v13 = [v7 dominantLanguage];
          long long v14 = (void *)v13;
          if (v13) {
            long long v15 = (__CFString *)v13;
          }
          else {
            long long v15 = &stru_1ED0E84C0;
          }
          v25[1] = v15;
          uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
          [v19 addObject:v16];
        }
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v4);
  }

  return v19;
}

- (id)textArray
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL fromKeyboard = self->_fromKeyboard;
  BOOL useServerCapitalization = self->_useServerCapitalization;
  NSUInteger v6 = [(NSArray *)self->_phrases count];
  if (v6)
  {
    NSUInteger v7 = v6;
    int v8 = 0;
    uint64_t v9 = 0;
    uint64_t v20 = useServerCapitalization || 2 * fromKeyboard;
    uint64_t v19 = v20 | 4;
    do
    {
      indexPathOfInterpretations = self->_indexPathOfInterpretations;
      if (indexPathOfInterpretations) {
        uint64_t v11 = [(NSIndexPath *)indexPathOfInterpretations indexAtPosition:v9];
      }
      else {
        uint64_t v11 = 0;
      }
      long long v12 = -[NSArray objectAtIndex:](self->_phrases, "objectAtIndex:", v9, v19);
      uint64_t v13 = [v12 interpretations];
      long long v14 = [v13 objectAtIndex:v11];

      if (v9) {
        uint64_t v15 = v20;
      }
      else {
        uint64_t v15 = v19;
      }
      uint64_t v16 = [v14 tokens];
      uint64_t v17 = +[UIDictationController serializedInterpretationFromTokens:v16 transform:[(UIDictationSerializableResults *)self transform] capitalization:v15];

      if (v9 && (([v14 removeSpaceBefore] | v8) & 1) == 0) {
        [v3 addObject:@" "];
      }
      [v3 addObject:v17];
      int v8 = [v14 removeSpaceAfter];

      ++v9;
    }
    while (v7 != v9);
  }
  if (self->_addTrailingSpace) {
    [v3 addObject:@" "];
  }
  return v3;
}

- (id)textArrayForAlternatives:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL fromKeyboard = self->_fromKeyboard;
  BOOL useServerCapitalization = self->_useServerCapitalization;
  long long v22 = v4;
  uint64_t v8 = [v4 count];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = 0;
    uint64_t v21 = useServerCapitalization || 2 * fromKeyboard;
    do
    {
      indexPathOfInterpretations = self->_indexPathOfInterpretations;
      if (indexPathOfInterpretations) {
        uint64_t v13 = [(NSIndexPath *)indexPathOfInterpretations indexAtPosition:v11];
      }
      else {
        uint64_t v13 = 0;
      }
      long long v14 = [v22 objectAtIndex:v11];
      uint64_t v15 = [v14 interpretations];
      uint64_t v16 = [v15 objectAtIndex:v13];

      if (v11) {
        uint64_t v17 = v21;
      }
      else {
        uint64_t v17 = v21 | 4;
      }
      v18 = [v16 tokens];
      uint64_t v19 = +[UIDictationController serializedInterpretationFromTokens:v18 transform:[(UIDictationSerializableResults *)self transform] capitalization:v17];

      if (v11 && (([v16 removeSpaceBefore] | v10) & 1) == 0) {
        [v5 addObject:@" "];
      }
      [v5 addObject:v19];
      int v10 = [v16 removeSpaceAfter];

      ++v11;
    }
    while (v9 != v11);
  }
  if (self->_addTrailingSpace) {
    [v5 addObject:@" "];
  }

  return v5;
}

- (id)bestTextArray
{
  id v3 = self->_indexPathOfInterpretations;
  indexPathOfInterpretations = self->_indexPathOfInterpretations;
  self->_indexPathOfInterpretations = 0;

  id v5 = [(UIDictationSerializableResults *)self textArray];
  NSUInteger v6 = self->_indexPathOfInterpretations;
  self->_indexPathOfInterpretations = v3;

  return v5;
}

- (id)secondBestTextArray
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL fromKeyboard = self->_fromKeyboard;
  BOOL useServerCapitalization = self->_useServerCapitalization;
  NSUInteger v34 = [(NSArray *)self->_phrases count];
  if (v34)
  {
    uint64_t v6 = 0;
    char v32 = 0;
    int v7 = 0;
    uint64_t v33 = useServerCapitalization || 2 * fromKeyboard;
    do
    {
      indexPathOfInterpretations = self->_indexPathOfInterpretations;
      if (indexPathOfInterpretations) {
        uint64_t v9 = [(NSIndexPath *)indexPathOfInterpretations indexAtPosition:v6];
      }
      else {
        uint64_t v9 = 0;
      }
      int v10 = [(NSArray *)self->_phrases objectAtIndex:v6];
      uint64_t v11 = [v10 interpretations];
      unint64_t v12 = [v11 count];

      if (v12 < 2) {
        goto LABEL_12;
      }
      uint64_t v13 = 0;
      double v14 = 0.0;
      unint64_t v15 = 1;
      do
      {
        uint64_t v16 = [v10 interpretations];
        uint64_t v17 = [v16 objectAtIndex:v15];
        [v17 averageConfidenceScore];
        double v19 = v18;

        if (v19 > v14)
        {
          uint64_t v20 = [v10 interpretations];
          uint64_t v21 = [v20 objectAtIndex:v15];
          [v21 averageConfidenceScore];
          double v14 = v22;

          long long v23 = [v10 interpretations];
          uint64_t v24 = [v23 objectAtIndex:v15];

          uint64_t v13 = (void *)v24;
        }
        ++v15;
        v25 = [v10 interpretations];
        unint64_t v26 = [v25 count];
      }
      while (v15 < v26);
      char v32 = 1;
      if (!v13)
      {
LABEL_12:
        uint64_t v27 = [v10 interpretations];
        uint64_t v13 = [v27 objectAtIndex:v9];
      }
      if (v6) {
        uint64_t v28 = v33;
      }
      else {
        uint64_t v28 = v33 | 4;
      }
      v29 = [v13 tokens];
      v30 = +[UIDictationController serializedInterpretationFromTokens:v29 transform:[(UIDictationSerializableResults *)self transform] capitalization:v28];

      if (v6 && (([v13 removeSpaceBefore] | v7) & 1) == 0) {
        [v3 addObject:@" "];
      }
      [v3 addObject:v30];
      int v7 = [v13 removeSpaceAfter];

      ++v6;
    }
    while (v6 != v34);
  }
  else
  {
    char v32 = 0;
  }
  if (self->_addTrailingSpace) {
    [v3 addObject:@" "];
  }
  if ((v32 & 1) == 0)
  {

    id v3 = 0;
  }
  return v3;
}

- (id)bestTextArrayForAlternatives:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = self->_indexPathOfInterpretations;
    indexPathOfInterpretations = self->_indexPathOfInterpretations;
    self->_indexPathOfInterpretations = 0;

    int v7 = [(UIDictationSerializableResults *)self textArrayForAlternatives:v4];
    uint64_t v8 = self->_indexPathOfInterpretations;
    self->_indexPathOfInterpretations = v5;
  }
  else
  {
    int v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)dictationPhraseArray
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = self->_useServerCapitalization | (2 * self->_fromKeyboard);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  phrases = self->_phrases;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke;
  v10[3] = &unk_1E52FB6B8;
  uint64_t v14 = v4;
  v10[4] = self;
  unint64_t v12 = v17;
  id v6 = v3;
  id v11 = v6;
  uint64_t v13 = v15;
  [(NSArray *)phrases enumerateObjectsUsingBlock:v10];
  int v7 = v11;
  id v8 = v6;

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  return v8;
}

void __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v6) {
    uint64_t v7 = [v6 indexAtPosition:a3];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [v5 interpretations];
  uint64_t v9 = [v8 objectAtIndex:v7];

  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  char v58 = [v9 removeSpaceBefore];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  char v54 = [v9 removeSpaceBefore];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  char v50 = [v9 removeSpaceAfter];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  char v46 = [v9 removeSpaceAfter];
  if (a3) {
    uint64_t v10 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v10 = *(void *)(a1 + 64) | 4;
  }
  id v11 = [v9 tokens];
  unint64_t v12 = +[UIDictationController serializedInterpretationFromTokens:transform:capitalization:](UIDictationController, "serializedInterpretationFromTokens:transform:capitalization:", v11, [*(id *)(a1 + 32) transform], v10);

  uint64_t v13 = [v5 interpretations];
  if ((unint64_t)[v13 count] < 2)
  {

    goto LABEL_11;
  }
  int v14 = [*(id *)(a1 + 32) allowsAlternatives];

  if (!v14)
  {
LABEL_11:
    id v18 = 0;
    goto LABEL_12;
  }
  unint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  char v16 = [v5 interpretations];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke_2;
  v35[3] = &unk_1E52FB668;
  v38 = &v51;
  v39 = &v47;
  v40 = &v43;
  uint64_t v41 = v7;
  uint64_t v17 = *(void *)(a1 + 32);
  v37 = &v55;
  v35[4] = v17;
  uint64_t v42 = v10;
  id v18 = v15;
  id v36 = v18;
  [v16 enumerateObjectsUsingBlock:v35];

LABEL_12:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) || *((unsigned char *)v56 + 24))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) && *((unsigned char *)v56 + 24) && !*((unsigned char *)v52 + 24))
    {
      if (([v9 removeSpaceBefore] & 1) == 0)
      {
        uint64_t v23 = [@" " stringByAppendingString:v12];

        unint64_t v12 = (void *)v23;
      }
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      v34[3] = 0;
      uint64_t v24 = [v5 interpretations];
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke_3;
      v30 = &unk_1E52FB690;
      uint64_t v33 = v7;
      id v31 = v18;
      char v32 = v34;
      [v24 enumerateObjectsUsingBlock:&v27];

      _Block_object_dispose(v34, 8);
    }
  }
  else if (a3)
  {
    v25 = *(void **)(a1 + 40);
    unint64_t v26 = +[UIDictationPhrase phraseWithText:@" " alternativeInterpretations:0 style:0];
    [v25 addObject:v26];
  }
  double v19 = +[UIDictationController sharedInstance];
  uint64_t v20 = [v19 inputModeOptions];
  int v21 = [v20 shouldSupressShowingAlternativesAutomatically];

  double v22 = +[UIDictationPhrase phraseWithText:alternativeInterpretations:style:](UIDictationPhrase, "phraseWithText:alternativeInterpretations:style:", v12, v18, [v5 isLowConfidence] & (v21 ^ 1));
  [*(id *)(a1 + 40) addObject:v22];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *((unsigned char *)v48 + 24);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *((unsigned char *)v44 + 24);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
}

void __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 80) != a3)
  {
    id v4 = a2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= [v4 removeSpaceBefore];
    char v5 = [v4 removeSpaceBefore];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v6 + 24)) {
      char v7 = v5;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)(v6 + 24) = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [v4 removeSpaceAfter];
    char v8 = [v4 removeSpaceAfter];
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    if (*(unsigned char *)(v9 + 24)) {
      char v10 = v8;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)(v9 + 24) = v10;
    id v11 = [v4 tokens];

    +[UIDictationController serializedInterpretationFromTokens:transform:capitalization:](UIDictationController, "serializedInterpretationFromTokens:transform:capitalization:", v11, [*(id *)(a1 + 32) transform], *(void *)(a1 + 88));
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 40) addObject:v12];
  }
}

void __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 48) != a3)
  {
    if (([a2 removeSpaceBefore] & 1) == 0)
    {
      id v4 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      char v5 = *(void **)(a1 + 32);
      uint64_t v6 = [@" " stringByAppendingString:v4];
      [v5 setObject:v6 atIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (id)bestResults
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  phrases = self->_phrases;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__UIDictationSerializableResults_bestResults__block_invoke;
  v8[3] = &unk_1E52FB6E0;
  id v9 = v3;
  id v5 = v3;
  [(NSArray *)phrases enumerateObjectsUsingBlock:v8];
  uint64_t v6 = [[UIDictationSerializableResults alloc] initWithPhrases:v5];
  [(UIDictationSerializableResults *)v6 setFromKeyboard:self->_fromKeyboard];
  [(UIDictationSerializableResults *)v6 setTransform:self->_transform];
  [(UIDictationSerializableResults *)v6 setUseServerCapitalization:self->_useServerCapitalization];

  return v6;
}

void __45__UIDictationSerializableResults_bestResults__block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [UIDictationInterpretationGroup alloc];
  id v5 = [v3 bestInterpretation];

  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  char v7 = [(UIDictationInterpretationGroup *)v4 initWithInterpretations:v6];
  [v2 addObject:v7];
}

- (id)singleLineResult
{
  v2 = self;
  v60[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSArray *)self->_phrases count];
  if (v3)
  {
    NSUInteger v4 = v3;
    id v5 = 0;
    uint64_t v6 = 0;
    NSUInteger v54 = v3;
    uint64_t v55 = v2;
    while (1)
    {
      indexPathOfInterpretations = v2->_indexPathOfInterpretations;
      uint64_t v8 = indexPathOfInterpretations
         ? [(NSIndexPath *)indexPathOfInterpretations indexAtPosition:v6]
         : 0;
      id v9 = [(NSArray *)v2->_phrases objectAtIndex:v6];
      char v10 = [(UIDictationInterpretationGroup *)v9 interpretations];
      id v11 = [v10 objectAtIndex:v8];
      id v12 = [v11 tokens];
      uint64_t v13 = [v12 count];

      if (v13) {
        break;
      }
      uint64_t v20 = 0;
      if (v5)
      {
LABEL_13:
        if (v20) {
          int v21 = v20;
        }
        else {
          int v21 = v9;
        }
        [v5 addObject:v21];

        if (++v6 == v4)
        {
          uint64_t v51 = [[UIDictationSerializableResults alloc] initWithPhrases:v5];
          [(UIDictationSerializableResults *)v51 setFromKeyboard:v2->_fromKeyboard];
          [(UIDictationSerializableResults *)v51 setTransform:v2->_transform];
          [(UIDictationSerializableResults *)v51 setUseServerCapitalization:v2->_useServerCapitalization];

          goto LABEL_36;
        }
      }
      else
      {
LABEL_33:

        if (++v6 == v4) {
          goto LABEL_34;
        }
      }
    }
    v56 = v5;
    uint64_t v14 = 0;
    while (1)
    {
      unint64_t v15 = [(UIDictationInterpretationGroup *)v9 bestInterpretation];
      char v16 = [v15 tokens];
      uint64_t v17 = [v16 objectAtIndex:v14];

      id v18 = [v17 text];
      uint64_t v19 = [v18 rangeOfString:@"\n"];

      if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }

      if (v13 == ++v14)
      {
        uint64_t v20 = 0;
        id v5 = v56;
        if (v56) {
          goto LABEL_13;
        }
        goto LABEL_33;
      }
    }
    if (v14)
    {
      if (!v56)
      {
        v56 = [MEMORY[0x1E4F1CA48] array];
        if (v6)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            uint64_t v23 = [(NSArray *)v55->_phrases objectAtIndex:i];
            [v56 addObject:v23];
          }
        }
      }
      uint64_t v24 = [(UIDictationInterpretationGroup *)v9 bestInterpretation];
      v25 = [v24 tokens];
      unint64_t v26 = objc_msgSend(v25, "subarrayWithRange:", 0, v14 - 1);
      uint64_t v27 = (void *)[v26 mutableCopy];

      uint64_t v28 = [UIDictationScoredToken alloc];
      v29 = [v17 text];
      v30 = [v29 substringToIndex:v19];
      uint64_t v31 = [v17 removeSpaceBefore];
      [v17 confidenceScore];
      char v32 = -[UIDictationScoredToken initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:](v28, "initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:", v30, v31, 1);

      [v27 addObject:v32];
      uint64_t v33 = [UIDictationInterpretation alloc];
      char v58 = v32;
      NSUInteger v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
      [v17 confidenceScore];
      v35 = -[UIDictationInterpretation initWithTokens:score:](v33, "initWithTokens:score:", v34);

      id v36 = [UIDictationInterpretationGroup alloc];
      uint64_t v57 = v35;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
      uint64_t v20 = [(UIDictationInterpretationGroup *)v36 initWithInterpretations:v37];

      id v5 = v56;
    }
    else
    {
      if (!v56)
      {
        v56 = [MEMORY[0x1E4F1CA48] array];
        if (v6)
        {
          for (uint64_t j = 0; j != v6; ++j)
          {
            v39 = [(NSArray *)v55->_phrases objectAtIndex:j];
            [v56 addObject:v39];
          }
        }
      }
      if (v19)
      {
        v40 = [UIDictationScoredToken alloc];
        uint64_t v41 = [v17 text];
        uint64_t v42 = [v41 substringToIndex:v19];
        uint64_t v43 = [v17 removeSpaceBefore];
        [v17 confidenceScore];
        v44 = -[UIDictationScoredToken initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:](v40, "initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:", v42, v43, 1);

        uint64_t v45 = [UIDictationInterpretation alloc];
        v60[0] = v44;
        char v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
        [v17 confidenceScore];
        uint64_t v47 = -[UIDictationInterpretation initWithTokens:score:](v45, "initWithTokens:score:", v46);

        v48 = [UIDictationInterpretationGroup alloc];
        v59 = v47;
        uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        char v50 = [(UIDictationInterpretationGroup *)v48 initWithInterpretations:v49];

        [v56 addObject:v50];
      }
      uint64_t v53 = [[UIDictationSerializableResults alloc] initWithPhrases:v56];
      uint64_t v20 = 0;
      id v5 = v56;
    }

    if (!v14)
    {

      uint64_t v51 = v53;
      goto LABEL_36;
    }
    NSUInteger v4 = v54;
    v2 = v55;
    if (v5) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_34:
  uint64_t v51 = v2;
LABEL_36:
  return v51;
}

- (id)description
{
  NSUInteger v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(UIDictationSerializableResults *)self bestText];
  char v7 = [v3 stringWithFormat:@"<%@ best=\"%@\">", v5, v6];

  return v7;
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
}

- (NSArray)multilingualAlternatives
{
  return self->_multilingualAlternatives;
}

- (void)setMultilingualAlternatives:(id)a3
{
}

- (BOOL)fromKeyboard
{
  return self->_fromKeyboard;
}

- (void)setFromKeyboard:(BOOL)a3
{
  self->_BOOL fromKeyboard = a3;
}

- (BOOL)showMultilingualAlternatives
{
  return self->_showMultilingualAlternatives;
}

- (void)setShowMultilingualAlternatives:(BOOL)a3
{
  self->_showMultilingualAlternatives = a3;
}

- (BOOL)lowConfidenceAboutLanguageDetection
{
  return self->_lowConfidenceAboutLanguageDetection;
}

- (void)setLowConfidenceAboutLanguageDetection:(BOOL)a3
{
  self->_lowConfidenceAboutLanguageDetection = a3;
}

- (__CFString)transform
{
  return self->_transform;
}

- (BOOL)useServerCapitalization
{
  return self->_useServerCapitalization;
}

- (void)setUseServerCapitalization:(BOOL)a3
{
  self->_BOOL useServerCapitalization = a3;
}

- (BOOL)addTrailingSpace
{
  return self->_addTrailingSpace;
}

- (void)setAddTrailingSpace:(BOOL)a3
{
  self->_addTrailingSpace = a3;
}

- (NSIndexPath)indexPathOfInterpretations
{
  return self->_indexPathOfInterpretations;
}

- (BOOL)allowsAlternatives
{
  return self->_allowsAlternatives;
}

- (BOOL)isFinalResult
{
  return self->_isFinalResult;
}

- (void)setIsFinalResult:(BOOL)a3
{
  self->_isFinalResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathOfInterpretations, 0);
  objc_storeStrong((id *)&self->_multilingualAlternatives, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

@end