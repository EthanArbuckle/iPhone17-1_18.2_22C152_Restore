@interface UIDictationWordsSeeker
+ (BOOL)_isSubstringArray:(id)a3 equalToSubstringArray:(id)a4;
+ (id)_prepareAllWordsWithString:(id)a3 reverse:(BOOL)a4;
- (BOOL)reverse;
- (BOOL)validateWordBoundariesInRange:(_NSRange)a3;
- (NSArray)targetStringWords;
- (NSArray)targetSubstringWords;
- (NSString)targetString;
- (NSString)targetSubstring;
- (UIDictationWordsSeeker)initWithString:(id)a3 substring:(id)a4 reverse:(BOOL)a5;
- (_NSRange)_search;
- (_NSRange)rangeOfSubstring:(id)a3 fullString:(id)a4 reverse:(BOOL)a5;
- (void)setReverse:(BOOL)a3;
- (void)setTargetString:(id)a3;
- (void)setTargetStringWords:(id)a3;
- (void)setTargetSubstring:(id)a3;
- (void)setTargetSubstringWords:(id)a3;
@end

@implementation UIDictationWordsSeeker

- (UIDictationWordsSeeker)initWithString:(id)a3 substring:(id)a4 reverse:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIDictationWordsSeeker;
  v10 = [(UIDictationWordsSeeker *)&v15 init];
  v11 = v10;
  if (v10)
  {
    [(UIDictationWordsSeeker *)v10 setReverse:v5];
    v12 = [(id)objc_opt_class() _prepareAllWordsWithString:v8 reverse:v5];
    [(UIDictationWordsSeeker *)v11 setTargetStringWords:v12];

    [(UIDictationWordsSeeker *)v11 setTargetString:v8];
    v13 = [(id)objc_opt_class() _prepareAllWordsWithString:v9 reverse:v5];
    [(UIDictationWordsSeeker *)v11 setTargetSubstringWords:v13];

    [(UIDictationWordsSeeker *)v11 setTargetSubstring:v9];
  }

  return v11;
}

+ (id)_prepareAllWordsWithString:(id)a3 reverse:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  v7 = [v5 array];
  uint64_t v8 = [v6 length];
  if (v4) {
    uint64_t v9 = 259;
  }
  else {
    uint64_t v9 = 3;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__UIDictationWordsSeeker__prepareAllWordsWithString_reverse___block_invoke;
  v13[3] = &unk_1E52FB708;
  id v14 = v7;
  id v10 = v7;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, v9, v13);

  v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];

  return v11;
}

void __61__UIDictationWordsSeeker__prepareAllWordsWithString_reverse___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v16 = a2;
  v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v12 = [v16 stringByTrimmingCharactersInSet:v11];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    id v14 = *(void **)(a1 + 32);
    objc_super v15 = -[UIDictationSubstring initWithString:range:enclosingRange:]([UIDictationSubstring alloc], "initWithString:range:enclosingRange:", v16, a3, a4, a5, a6);
    [v14 insertObject:v15 atIndex:0];
  }
}

+ (BOOL)_isSubstringArray:(id)a3 equalToSubstringArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    uint64_t v8 = [v5 count];
    uint64_t v9 = v8 - 1;
    if (v8 < 1)
    {
      BOOL v16 = 1;
    }
    else
    {
      uint64_t v10 = 0;
      do
      {
        v11 = [v5 objectAtIndex:v10];
        v12 = [v11 string];
        uint64_t v13 = [v6 objectAtIndex:v10];
        id v14 = [v13 string];
        uint64_t v15 = [v12 compare:v14 options:129];
        BOOL v16 = v15 == 0;

        if (v15) {
          break;
        }
      }
      while (v9 != v10++);
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)validateWordBoundariesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [(UIDictationWordsSeeker *)self targetString];
  uint64_t v8 = [v7 length];
  BOOL v9 = [(UIDictationWordsSeeker *)self reverse];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__UIDictationWordsSeeker_validateWordBoundariesInRange___block_invoke;
  v15[3] = &unk_1E52FB730;
  NSUInteger v17 = location;
  NSUInteger v18 = length;
  if (v9) {
    uint64_t v10 = 259;
  }
  else {
    uint64_t v10 = 3;
  }
  id v16 = v6;
  id v11 = v6;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, v10, v15);
  v12 = objc_opt_class();
  uint64_t v13 = [(UIDictationWordsSeeker *)self targetSubstringWords];
  LOBYTE(v12) = [v12 _isSubstringArray:v11 equalToSubstringArray:v13];

  return (char)v12;
}

void __56__UIDictationWordsSeeker_validateWordBoundariesInRange___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5, uint64_t a6)
{
  id v16 = a2;
  id v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v12 = [v16 stringByTrimmingCharactersInSet:v11];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    v18.NSUInteger location = a3;
    v18.NSUInteger length = a4;
    if (NSIntersectionRange(*(NSRange *)(a1 + 40), v18).length)
    {
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = -[UIDictationSubstring initWithString:range:enclosingRange:]([UIDictationSubstring alloc], "initWithString:range:enclosingRange:", v16, a3, a4, a5, a6);
      [v14 insertObject:v15 atIndex:0];
    }
  }
}

- (_NSRange)_search
{
  v3 = [(UIDictationWordsSeeker *)self targetStringWords];
  uint64_t v4 = [v3 count];

  uint64_t v32 = v4 - 1;
  if (v4 - 1 < 0)
  {
LABEL_12:
    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    while (1)
    {
      id v5 = [(UIDictationWordsSeeker *)self targetSubstringWords];
      uint64_t v6 = [v5 count];

      uint64_t v31 = v6 - 1;
      if (v6 - 1 < 0) {
        break;
      }
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      BOOL v9 = 0;
      while (1)
      {
        uint64_t v10 = v31 + v7;
        uint64_t v11 = v32 + v7;
        v12 = [(UIDictationWordsSeeker *)self targetStringWords];
        uint64_t v13 = [v12 objectAtIndex:v32 + v7];
        id v14 = [v13 string];

        uint64_t v15 = [(UIDictationWordsSeeker *)self targetSubstringWords];
        id v16 = [v15 objectAtIndex:v10];
        NSUInteger v17 = [v16 string];

        if ([v14 compare:v17 options:129]) {
          break;
        }
        if (!v8)
        {
          NSRange v18 = [(UIDictationWordsSeeker *)self targetStringWords];
          uint64_t v8 = [v18 objectAtIndex:v11];
        }
        v19 = [(UIDictationWordsSeeker *)self targetStringWords];
        v20 = [v19 objectAtIndex:v11];

        if (v11 >= 1)
        {
          --v7;
          BOOL v9 = v20;
          if (v10 > 0) {
            continue;
          }
        }
        goto LABEL_14;
      }

      if (v32-- <= 0) {
        goto LABEL_12;
      }
    }
    v20 = 0;
    uint64_t v8 = 0;
LABEL_14:
    NSUInteger v24 = objc_msgSend(v8, "range", v31);
    NSUInteger v26 = v25;
    v35.NSUInteger location = [v20 range];
    v35.NSUInteger length = v27;
    v33.NSUInteger location = v24;
    v33.NSUInteger length = v26;
    NSRange v28 = NSUnionRange(v33, v35);
    NSUInteger location = v28.location;
    NSUInteger length = v28.length;
  }
  NSUInteger v29 = location;
  NSUInteger v30 = length;
  result.NSUInteger length = v30;
  result.NSUInteger location = v29;
  return result;
}

- (_NSRange)rangeOfSubstring:(id)a3 fullString:(id)a4 reverse:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() _prepareAllWordsWithString:v8 reverse:v5];
  [(UIDictationWordsSeeker *)self setTargetStringWords:v10];

  [(UIDictationWordsSeeker *)self setTargetString:v8];
  uint64_t v11 = [(id)objc_opt_class() _prepareAllWordsWithString:v9 reverse:v5];
  [(UIDictationWordsSeeker *)self setTargetSubstringWords:v11];

  [(UIDictationWordsSeeker *)self setTargetSubstring:v9];
  NSUInteger v12 = [(UIDictationWordsSeeker *)self _search];
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (NSArray)targetStringWords
{
  return self->_targetStringWords;
}

- (void)setTargetStringWords:(id)a3
{
}

- (NSArray)targetSubstringWords
{
  return self->_targetSubstringWords;
}

- (void)setTargetSubstringWords:(id)a3
{
}

- (NSString)targetString
{
  return self->_targetString;
}

- (void)setTargetString:(id)a3
{
}

- (NSString)targetSubstring
{
  return self->_targetSubstring;
}

- (void)setTargetSubstring:(id)a3
{
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSubstring, 0);
  objc_storeStrong((id *)&self->_targetString, 0);
  objc_storeStrong((id *)&self->_targetSubstringWords, 0);
  objc_storeStrong((id *)&self->_targetStringWords, 0);
}

@end