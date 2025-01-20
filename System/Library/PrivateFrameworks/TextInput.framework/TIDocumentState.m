@interface TIDocumentState
+ (BOOL)supportsSecureCoding;
+ (TIDocumentState)documentStateWithContextBefore:(id)a3 markedText:(id)a4 selectedRange:(_NSRange)a5 contextAfter:(id)a6;
+ (TIDocumentState)documentStateWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5;
+ (id)_selectedTextByDeletingInteriorSentences:(id)a3 outTruncatedRange:(_NSRange *)a4;
+ (id)_string:(id)a3 byTrimmingWordsAfterIndex:(unint64_t)a4;
+ (id)_string:(id)a3 byTrimmingWordsBeforeIndex:(unint64_t)a4;
+ (id)documentStateForTestingWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5;
+ (id)documentStateForTestingWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5 markedText:(id)a6 selectedRangeInMarkedText:(_NSRange)a7;
+ (id)documentStateForTestingWithText:(id)a3 selectedRange:(_NSRange)a4;
+ (id)unboundedDocumentStateForTestingWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5;
- (BOOL)deletingBackwardsWillRemoveText;
- (BOOL)documentIsEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringMarkedText:(id)a3;
- (NSString)contextAfterInput;
- (NSString)contextBeforeInput;
- (NSString)markedText;
- (NSString)selectedText;
- (NSString)string;
- (TIDocumentState)initWithCoder:(id)a3;
- (TIDocumentState)initWithContextBefore:(id)a3 markedText:(id)a4 selectedText:(id)a5 contextAfter:(id)a6 selectedRangeInMarkedText:(_NSRange)a7;
- (TIDocumentState)initWithText:(id)a3 selectedRange:(_NSRange)a4;
- (TIDocumentState)initWithUnboundedContextBefore:(id)a3 markedText:(id)a4 selectedText:(id)a5 unboundedContextAfter:(id)a6 selectedRangeInMarkedText:(_NSRange)a7;
- (TIDocumentState)initWithUnboundedContextBefore:(id)a3 markedText:(id)a4 selectedText:(id)a5 unboundedContextAfter:(id)a6 selectedRangeInMarkedText:(_NSRange)a7 truncatedRangeInSelectedText:(_NSRange)a8;
- (_NSRange)selectedRangeInMarkedText;
- (_NSRange)truncatedRangeInSelectedText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)documentStateAfterCollapsingSelection;
- (id)documentStateAfterCursorAdjustment:(int64_t)a3;
- (id)documentStateAfterDeletingBackward;
- (id)documentStateAfterDeletingForward;
- (id)documentStateAfterInsertingText:(id)a3;
- (id)documentStateAfterInsertingTextAfterSelection:(id)a3;
- (id)documentStateAfterReplacingText:(id)a3 withText:(id)a4;
- (id)documentStateAfterSettingMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (id)documentStateAfterUnmarkingText;
- (id)inputStemWithTerminatorPredicate:(id)a3;
- (id)inputStringWithTerminatorPredicate:(id)a3;
- (id)wordPrefixOfString:(id)a3 withTerminatorPredicate:(id)a4 reverse:(BOOL)a5;
- (unint64_t)hash;
- (unint64_t)hashString:(id)a3 intoHashValue:(unint64_t)a4;
- (unint64_t)inputIndexWithTerminatorPredicate:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIDocumentState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextAfterInput, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_markedText, 0);

  objc_storeStrong((id *)&self->_contextBeforeInput, 0);
}

- (_NSRange)truncatedRangeInSelectedText
{
  NSUInteger length = self->_truncatedRangeInSelectedText.length;
  NSUInteger location = self->_truncatedRangeInSelectedText.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)selectedRangeInMarkedText
{
  NSUInteger length = self->_selectedRangeInMarkedText.length;
  NSUInteger location = self->_selectedRangeInMarkedText.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)contextAfterInput
{
  return self->_contextAfterInput;
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (NSString)markedText
{
  return self->_markedText;
}

- (NSString)contextBeforeInput
{
  return self->_contextBeforeInput;
}

- (NSString)string
{
  uint64_t v3 = [(TIDocumentState *)self contextBeforeInput];
  v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = &stru_1EDBDCE38;
  }
  v6 = v5;

  uint64_t v7 = [(TIDocumentState *)self selectedText];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = &stru_1EDBDCE38;
  }
  v10 = v9;

  uint64_t v11 = [(TIDocumentState *)self contextAfterInput];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = &stru_1EDBDCE38;
  }
  v14 = v13;

  v15 = [NSString stringWithFormat:@"%@%@%@", v6, v10, v14];

  return (NSString *)v15;
}

- (BOOL)documentIsEmpty
{
  uint64_t v3 = [(TIDocumentState *)self contextBeforeInput];
  if ([v3 length])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(TIDocumentState *)self selectedText];
    if ([v5 length])
    {
      BOOL v4 = 0;
    }
    else
    {
      v6 = [(TIDocumentState *)self markedText];
      if ([v6 length])
      {
        BOOL v4 = 0;
      }
      else
      {
        uint64_t v7 = [(TIDocumentState *)self contextAfterInput];
        BOOL v4 = [v7 length] == 0;
      }
    }
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  BOOL v4 = [(TIDocumentState *)self contextBeforeInput];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = &stru_1EDBDCE38;
  }
  [v3 appendFormat:@"; text = \"%@", v7];

  v8 = [(TIDocumentState *)self markedText];

  if (v8)
  {
    v9 = [(TIDocumentState *)self markedText];
    v10 = objc_msgSend(v9, "substringToIndex:", -[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText"));
    uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    [v3 appendFormat:@"{%@", v11];
  }
  v12 = [(TIDocumentState *)self selectedText];

  if (v12)
  {
    if ([(TIDocumentState *)self truncatedRangeInSelectedText] == 0x7FFFFFFFFFFFFFFFLL
      || ([(TIDocumentState *)self truncatedRangeInSelectedText], !v13))
    {
      v14 = [(TIDocumentState *)self selectedText];
      v15 = [v14 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
      [v3 appendFormat:@"[%@]", v15];
    }
    else
    {
      v14 = [(TIDocumentState *)self selectedText];
      v15 = objc_msgSend(v14, "substringToIndex:", -[TIDocumentState truncatedRangeInSelectedText](self, "truncatedRangeInSelectedText"));
      v16 = [v15 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
      [(TIDocumentState *)self truncatedRangeInSelectedText];
      uint64_t v18 = v17;
      v19 = [(TIDocumentState *)self selectedText];
      v20 = objc_msgSend(v19, "substringFromIndex:", -[TIDocumentState truncatedRangeInSelectedText](self, "truncatedRangeInSelectedText"));
      v21 = [v20 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
      [v3 appendFormat:@"[%@{...%lu...}%@]", v16, v18, v21];
    }
  }
  else
  {
    [v3 appendString:@"|"];
  }
  v22 = [(TIDocumentState *)self markedText];

  if (v22)
  {
    v23 = [(TIDocumentState *)self markedText];
    uint64_t v24 = [(TIDocumentState *)self selectedRangeInMarkedText];
    v26 = [v23 substringFromIndex:v24 + v25];
    v27 = [v26 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    [v3 appendFormat:@"%@}", v27];
  }
  v28 = [(TIDocumentState *)self contextAfterInput];
  uint64_t v29 = [v28 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  v30 = (void *)v29;
  if (v29) {
    v31 = (__CFString *)v29;
  }
  else {
    v31 = &stru_1EDBDCE38;
  }
  [v3 appendFormat:@"%@\"", v31];

  [v3 appendString:@">"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TIDocumentState *)self contextBeforeInput];
  unint64_t v4 = [(TIDocumentState *)self hashString:v3 intoHashValue:0];

  uint64_t v5 = [(TIDocumentState *)self markedText];
  unint64_t v6 = [(TIDocumentState *)self hashString:v5 intoHashValue:v4];

  uint64_t v7 = [(TIDocumentState *)self selectedText];
  unint64_t v8 = [(TIDocumentState *)self hashString:v7 intoHashValue:v6];

  v9 = [(TIDocumentState *)self contextAfterInput];
  unint64_t v10 = [(TIDocumentState *)self hashString:v9 intoHashValue:v8];

  uint64_t v11 = 257 * ([(TIDocumentState *)self selectedRangeInMarkedText] + 257 * v10);
  uint64_t v12 = 257 * (v11 + [(TIDocumentState *)self truncatedRangeInSelectedText]);
  [(TIDocumentState *)self truncatedRangeInSelectedText];
  return v12 + v13;
}

- (unint64_t)hashString:(id)a3 intoHashValue:(unint64_t)a4
{
  return [a3 hash] + 257 * a4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (TIDocumentState *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = NSString;
      uint64_t v7 = [(TIDocumentState *)self contextBeforeInput];
      unint64_t v8 = [(TIDocumentState *)v5 contextBeforeInput];
      int v9 = objc_msgSend(v6, "_ti_string:matchesStringIgnoringNullity:", v7, v8);

      if (v9)
      {
        unint64_t v10 = NSString;
        uint64_t v11 = [(TIDocumentState *)self selectedText];
        uint64_t v12 = [(TIDocumentState *)v5 selectedText];
        int v9 = objc_msgSend(v10, "_ti_string:matchesStringIgnoringNullity:", v11, v12);

        if (v9)
        {
          uint64_t v13 = NSString;
          v14 = [(TIDocumentState *)self contextAfterInput];
          v15 = [(TIDocumentState *)v5 contextAfterInput];
          int v9 = objc_msgSend(v13, "_ti_string:matchesStringIgnoringNullity:", v14, v15);

          if (v9)
          {
            v16 = NSString;
            uint64_t v17 = [(TIDocumentState *)self markedText];
            uint64_t v18 = [(TIDocumentState *)v5 markedText];
            int v9 = objc_msgSend(v16, "_ti_string:matchesStringIgnoringNullity:", v17, v18);

            if (v9)
            {
              uint64_t v19 = [(TIDocumentState *)self selectedRangeInMarkedText];
              uint64_t v21 = v20;
              LOBYTE(v9) = 0;
              if (v19 == [(TIDocumentState *)v5 selectedRangeInMarkedText] && v21 == v22)
              {
                uint64_t v23 = [(TIDocumentState *)self truncatedRangeInSelectedText];
                uint64_t v25 = v24;
                LOBYTE(v9) = v23 == [(TIDocumentState *)v5 truncatedRangeInSelectedText]
                          && v25 == v26;
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (BOOL)isEqualIgnoringMarkedText:(id)a3
{
  unint64_t v4 = (TIDocumentState *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    uint64_t v5 = NSString;
    unint64_t v6 = [(TIDocumentState *)self contextBeforeInput];
    uint64_t v7 = [(TIDocumentState *)v4 contextBeforeInput];
    LODWORD(v5) = objc_msgSend(v5, "_ti_string:matchesStringIgnoringNullity:", v6, v7);

    if (!v5) {
      goto LABEL_5;
    }
    unint64_t v8 = NSString;
    int v9 = [(TIDocumentState *)self selectedText];
    unint64_t v10 = [(TIDocumentState *)v4 selectedText];
    LODWORD(v8) = objc_msgSend(v8, "_ti_string:matchesStringIgnoringNullity:", v9, v10);

    if (v8)
    {
      uint64_t v11 = NSString;
      uint64_t v12 = [(TIDocumentState *)self contextAfterInput];
      uint64_t v13 = [(TIDocumentState *)v4 contextAfterInput];
      char v14 = objc_msgSend(v11, "_ti_string:matchesStringIgnoringNullity:", v12, v13);
    }
    else
    {
LABEL_5:
      char v14 = 0;
    }
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  contextBeforeInput = self->_contextBeforeInput;
  id v12 = v4;
  if (contextBeforeInput)
  {
    [v4 encodeObject:contextBeforeInput forKey:@"contextBeforeInput"];
    id v4 = v12;
  }
  markedText = self->_markedText;
  if (markedText)
  {
    [v12 encodeObject:markedText forKey:@"markedText"];
    id v4 = v12;
  }
  selectedText = self->_selectedText;
  if (selectedText)
  {
    [v12 encodeObject:selectedText forKey:@"selectedText"];
    id v4 = v12;
  }
  contextAfterInput = self->_contextAfterInput;
  if (contextAfterInput)
  {
    [v12 encodeObject:contextAfterInput forKey:@"contextAfterInput"];
    id v4 = v12;
  }
  if (self->_markedText)
  {
    NSUInteger location = self->_selectedRangeInMarkedText.location;
    if (location)
    {
      [v12 encodeInteger:location forKey:@"locationOfSelectionInMarkedText"];
      id v4 = v12;
    }
  }
  if (self->_selectedText)
  {
    NSUInteger v10 = self->_truncatedRangeInSelectedText.location;
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v10, self->_truncatedRangeInSelectedText.length);
      [v12 encodeObject:v11 forKey:@"truncatedRangeInSelectedText"];

      id v4 = v12;
    }
  }
}

- (TIDocumentState)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TIDocumentState;
  uint64_t v5 = [(TIDocumentState *)&v25 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextBeforeInput"];
    uint64_t v7 = [v6 copy];
    contextBeforeInput = v5->_contextBeforeInput;
    v5->_contextBeforeInput = (NSString *)v7;

    int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"markedText"];
    uint64_t v10 = [v9 copy];
    markedText = v5->_markedText;
    v5->_markedText = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedText"];
    uint64_t v13 = [v12 copy];
    selectedText = v5->_selectedText;
    v5->_selectedText = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextAfterInput"];
    uint64_t v16 = [v15 copy];
    contextAfterInput = v5->_contextAfterInput;
    v5->_contextAfterInput = (NSString *)v16;

    if (v5->_markedText)
    {
      uint64_t v18 = [v4 decodeIntegerForKey:@"locationOfSelectionInMarkedText"];
      uint64_t v19 = [(NSString *)v5->_selectedText length];
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_selectedRangeInMarkedText.NSUInteger location = v18;
    v5->_selectedRangeInMarkedText.NSUInteger length = v19;
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"truncatedRangeInSelectedText"];
    uint64_t v21 = v20;
    if (v20)
    {
      uint64_t v22 = [v20 rangeValue];
    }
    else
    {
      NSUInteger v23 = 0;
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_truncatedRangeInSelectedText.NSUInteger location = v22;
    v5->_truncatedRangeInSelectedText.NSUInteger length = v23;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TIDocumentState initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:truncatedRangeInSelectedText:]([TIDocumentState alloc], "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:truncatedRangeInSelectedText:", self->_contextBeforeInput, self->_markedText, self->_selectedText, self->_contextAfterInput, self->_selectedRangeInMarkedText.location, self->_selectedRangeInMarkedText.length, self->_truncatedRangeInSelectedText.location, self->_truncatedRangeInSelectedText.length);
}

- (TIDocumentState)initWithUnboundedContextBefore:(id)a3 markedText:(id)a4 selectedText:(id)a5 unboundedContextAfter:(id)a6 selectedRangeInMarkedText:(_NSRange)a7 truncatedRangeInSelectedText:(_NSRange)a8
{
  _NSRange result = -[TIDocumentState initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:](self, "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:", a3, a4, a5, a6, a7.location, a7.length);
  result->_truncatedRangeInSelectedText = a8;
  return result;
}

- (TIDocumentState)initWithUnboundedContextBefore:(id)a3 markedText:(id)a4 selectedText:(id)a5 unboundedContextAfter:(id)a6 selectedRangeInMarkedText:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  long long v29 = xmmword_18D2C3CE0;
  if ((unint64_t)[v15 length] >= 0x41)
  {
    uint64_t v17 = +[TIDocumentState _selectedTextByDeletingInteriorSentences:v15 outTruncatedRange:&v29];

    id v15 = (id)v17;
  }
  v28.receiver = self;
  v28.super_class = (Class)TIDocumentState;
  uint64_t v18 = [(TIDocumentState *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v13 copy];
    uint64_t v20 = (void *)*((void *)v18 + 1);
    *((void *)v18 + 1) = v19;

    uint64_t v21 = [v14 copy];
    uint64_t v22 = (void *)*((void *)v18 + 2);
    *((void *)v18 + 2) = v21;

    uint64_t v23 = [v15 copy];
    uint64_t v24 = (void *)*((void *)v18 + 3);
    *((void *)v18 + 3) = v23;

    uint64_t v25 = [v16 copy];
    uint64_t v26 = (void *)*((void *)v18 + 4);
    *((void *)v18 + 4) = v25;

    *((void *)v18 + 5) = location;
    *((void *)v18 + 6) = length;
    *(_OWORD *)(v18 + 56) = v29;
  }

  return (TIDocumentState *)v18;
}

- (TIDocumentState)initWithContextBefore:(id)a3 markedText:(id)a4 selectedText:(id)a5 contextAfter:(id)a6 selectedRangeInMarkedText:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void *)[a3 copy];
  if ((unint64_t)[v16 length] >= 0x3E9)
  {
    uint64_t v17 = +[TIDocumentState _string:byTrimmingWordsBeforeIndex:](TIDocumentState, "_string:byTrimmingWordsBeforeIndex:", v16, [v16 length] - 500);

    id v16 = (void *)v17;
  }
  id v18 = v15;
  unint64_t v19 = [v18 length];
  *(void *)&long long v36 = v19;
  if (v19)
  {
    objc_msgSend(v18, "getLineStart:end:contentsEnd:forRange:", 0, 0, &v36, 0, 0);
    unint64_t v20 = v36;
  }
  else
  {
    unint64_t v20 = 0;
  }
  if (v20 >= v19)
  {
    uint64_t v21 = [v18 copy];
  }
  else
  {
    uint64_t v21 = objc_msgSend(v18, "substringToIndex:");
  }
  uint64_t v22 = (void *)v21;

  if ((unint64_t)[v22 length] >= 0x3E9)
  {
    uint64_t v23 = +[TIDocumentState _string:v22 byTrimmingWordsAfterIndex:500];

    uint64_t v22 = (void *)v23;
  }
  long long v36 = xmmword_18D2C3CE0;
  if ((unint64_t)[v14 length] >= 0x41)
  {
    uint64_t v24 = +[TIDocumentState _selectedTextByDeletingInteriorSentences:v14 outTruncatedRange:&v36];

    id v14 = (id)v24;
  }
  v35.receiver = self;
  v35.super_class = (Class)TIDocumentState;
  uint64_t v25 = [(TIDocumentState *)&v35 init];
  if (v25)
  {
    uint64_t v26 = [v16 copy];
    v27 = (void *)*((void *)v25 + 1);
    *((void *)v25 + 1) = v26;

    uint64_t v28 = [v13 copy];
    long long v29 = (void *)*((void *)v25 + 2);
    *((void *)v25 + 2) = v28;

    uint64_t v30 = [v14 copy];
    v31 = (void *)*((void *)v25 + 3);
    *((void *)v25 + 3) = v30;

    uint64_t v32 = [v22 copy];
    v33 = (void *)*((void *)v25 + 4);
    *((void *)v25 + 4) = v32;

    *((void *)v25 + 5) = location;
    *((void *)v25 + 6) = length;
    *(_OWORD *)(v25 + 56) = v36;
  }

  return (TIDocumentState *)v25;
}

+ (id)_selectedTextByDeletingInteriorSentences:(id)a3 outTruncatedRange:(_NSRange *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 length];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3010000000;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  v33 = &unk_18D2DEA03;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3010000000;
  v27 = &unk_18D2DEA03;
  uint64_t v28 = v7;
  uint64_t v29 = 0;
  if (v7)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __78__TIDocumentState__selectedTextByDeletingInteriorSentences_outTruncatedRange___block_invoke;
    v23[3] = &unk_1E5558950;
    v23[4] = &v30;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 516, v23);
    unint64_t v8 = v31[5] + v31[4];
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (v8 >= [v6 length])
  {
    uint64_t v10 = v25;
    int v9 = v31;
    *((_OWORD *)v25 + 2) = *((_OWORD *)v31 + 2);
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__TIDocumentState__selectedTextByDeletingInteriorSentences_outTruncatedRange___block_invoke_2;
    v22[3] = &unk_1E5558950;
    v22[4] = &v24;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 772, v22);
    int v9 = v31;
    uint64_t v10 = v25;
  }
  if (v9[5] + v9[4] <= (unint64_t)v10[4])
  {
    id v12 = objc_msgSend(v6, "substringWithRange:");
    id v14 = objc_msgSend(v6, "substringWithRange:", v25[4], v25[5]);
    uint64_t v16 = [v12 length];
    if ((unint64_t)([v14 length] + v16) < 0x3E9) {
      goto LABEL_19;
    }
    if ((unint64_t)[v12 length] < 0x1F5)
    {
      if ((unint64_t)[v14 length] < 0x1F5) {
        goto LABEL_19;
      }
      uint64_t v19 = [a1 _string:v14 byTrimmingWordsAfterIndex:250];
    }
    else
    {
      uint64_t v17 = [a1 _string:v12 byTrimmingWordsAfterIndex:249];

      if ((unint64_t)[v14 length] < 0x3E9)
      {
        id v12 = (void *)v17;
LABEL_19:
        uint64_t v11 = [v12 stringByAppendingString:v14];
        if (!a4) {
          goto LABEL_21;
        }
LABEL_20:
        a4->NSUInteger location = [v12 length];
        uint64_t v20 = [v6 length];
        a4->NSUInteger length = v20 - [v11 length];
        goto LABEL_21;
      }
      uint64_t v18 = objc_msgSend(a1, "_string:byTrimmingWordsBeforeIndex:", v14, objc_msgSend(v14, "length") - 249);
      uint64_t v19 = [@"  " stringByAppendingString:v18];

      id v14 = (void *)v18;
      id v12 = (void *)v17;
    }

    id v14 = (void *)v19;
    goto LABEL_19;
  }
  uint64_t v11 = (void *)[v6 copy];
  if ((unint64_t)[v6 length] < 0x3E9) {
    goto LABEL_22;
  }
  id v12 = [a1 _string:v11 byTrimmingWordsAfterIndex:249];
  id v13 = objc_msgSend(a1, "_string:byTrimmingWordsBeforeIndex:", v11, objc_msgSend(v11, "length") - 249);
  id v14 = [@"  " stringByAppendingString:v13];

  uint64_t v15 = [v12 stringByAppendingString:v14];

  uint64_t v11 = (void *)v15;
  if (a4) {
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v11;
}

uint64_t __78__TIDocumentState__selectedTextByDeletingInteriorSentences_outTruncatedRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v7 + 32) = a5;
  *(void *)(v7 + 40) = a6;
  *a7 = 1;
  return result;
}

uint64_t __78__TIDocumentState__selectedTextByDeletingInteriorSentences_outTruncatedRange___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v7 + 32) = a5;
  *(void *)(v7 + 40) = a6;
  *a7 = 1;
  return result;
}

+ (id)_string:(id)a3 byTrimmingWordsAfterIndex:(unint64_t)a4
{
  uint64_t v5 = (void *)[a3 copy];
  if ([v5 length] <= a4)
  {
    id v9 = v5;
  }
  else
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    uint64_t v16 = [v5 length];
    uint64_t v6 = [v5 length];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__TIDocumentState__string_byTrimmingWordsAfterIndex___block_invoke;
    v12[3] = &unk_1E5558928;
    v12[4] = &v13;
    v12[5] = a4;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v12);
    unint64_t v7 = v14[3];
    if (v7 >= [v5 length]) {
      uint64_t v8 = [v5 rangeOfComposedCharacterSequenceAtIndex:a4];
    }
    else {
      uint64_t v8 = v14[3];
    }
    uint64_t v10 = [v5 substringToIndex:v8];

    id v9 = v10;
    _Block_object_dispose(&v13, 8);
  }

  return v9;
}

uint64_t __53__TIDocumentState__string_byTrimmingWordsAfterIndex___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ((unint64_t)(a3 + a4) <= *(void *)(result + 40)) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3 + a4;
  }
  else {
    *a7 = 1;
  }
  return result;
}

+ (id)_string:(id)a3 byTrimmingWordsBeforeIndex:(unint64_t)a4
{
  uint64_t v5 = (void *)[a3 copy];
  uint64_t v6 = v5;
  if (a4)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    uint64_t v7 = [v5 length];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__TIDocumentState__string_byTrimmingWordsBeforeIndex___block_invoke;
    v14[3] = &unk_1E5558928;
    v14[4] = &v15;
    v14[5] = a4;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 259, v14);
    uint64_t v8 = v16[3];
    if (!v8)
    {
      uint64_t v9 = [v6 rangeOfComposedCharacterSequenceAtIndex:a4 - 1];
      uint64_t v8 = v9 + v10;
    }
    uint64_t v11 = [v6 substringFromIndex:v8];

    id v12 = v11;
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v12 = v5;
  }

  return v12;
}

uint64_t __54__TIDocumentState__string_byTrimmingWordsBeforeIndex___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (a3 >= *(void *)(result + 40)) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  }
  else {
    *a7 = 1;
  }
  return result;
}

+ (TIDocumentState)documentStateWithContextBefore:(id)a3 markedText:(id)a4 selectedRange:(_NSRange)a5 contextAfter:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  if ([v10 length])
  {
    if (length)
    {
      uint64_t v13 = objc_msgSend(v10, "substringWithRange:", location, length);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {

    id v10 = 0;
    uint64_t v13 = 0;
    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v14 = -[TIDocumentState initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:]([TIDocumentState alloc], "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v12, v10, v13, v11, location, length);

  return v14;
}

+ (TIDocumentState)documentStateWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[TIDocumentState initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:]([TIDocumentState alloc], "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v9, 0, v8, v7, 0x7FFFFFFFFFFFFFFFLL, 0);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TIDocumentState)initWithText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = v7;
  if (location)
  {
    id v9 = [v7 substringToIndex:location];
    if (length)
    {
LABEL_3:
      id v10 = objc_msgSend(v8, "substringWithRange:", location, length);
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = 0;
    if (length) {
      goto LABEL_3;
    }
  }
  id v10 = 0;
LABEL_6:
  unint64_t v11 = location + length;
  if (v11 >= [v8 length])
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [v8 substringFromIndex:v11];
  }
  uint64_t v13 = -[TIDocumentState initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:](self, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v9, 0, v10, v12, 0x7FFFFFFFFFFFFFFFLL, 0);

  return v13;
}

- (BOOL)deletingBackwardsWillRemoveText
{
  uint64_t v3 = [(TIDocumentState *)self contextBeforeInput];
  if ([v3 length])
  {

    return 1;
  }
  id v4 = [(TIDocumentState *)self selectedText];
  uint64_t v5 = [v4 length];

  if (v5) {
    return 1;
  }
  id v7 = [(TIDocumentState *)self markedText];
  if ([v7 length])
  {
    uint64_t v8 = [(TIDocumentState *)self selectedRangeInMarkedText];

    if (v8) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (id)documentStateAfterCursorAdjustment:(int64_t)a3
{
  if (a3)
  {
    id v4 = [(TIDocumentState *)self documentStateAfterCollapsingSelection];
    uint64_t v5 = [v4 contextBeforeInput];
    uint64_t v6 = (void *)v5;
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    else {
      id v7 = &stru_1EDBDCE38;
    }
    uint64_t v8 = v7;

    uint64_t v9 = [v4 contextAfterInput];
    id v10 = (void *)v9;
    if (v9) {
      unint64_t v11 = (__CFString *)v9;
    }
    else {
      unint64_t v11 = &stru_1EDBDCE38;
    }
    id v12 = v11;

    if (a3 < 1)
    {
      uint64_t v22 = [(__CFString *)v8 _rangeOfCharacterClusterAtIndex:[(__CFString *)v8 length] withClusterOffset:a3];
      uint64_t v24 = -[__CFString substringWithRange:](v8, "substringWithRange:", v22, v23);
      uint64_t v17 = [v24 stringByAppendingString:v12];

      uint64_t v18 = [(__CFString *)v8 substringToIndex:v22];

      uint64_t v19 = v18;
      uint64_t v20 = v17;
    }
    else
    {
      uint64_t v13 = [(__CFString *)v12 _rangeOfCharacterClusterAtIndex:0 withClusterOffset:a3];
      uint64_t v15 = v14;
      uint64_t v16 = -[__CFString substringWithRange:](v12, "substringWithRange:", v13, v14);
      uint64_t v17 = [(__CFString *)v8 stringByAppendingString:v16];

      uint64_t v18 = [(__CFString *)v12 substringFromIndex:v15];

      uint64_t v19 = v17;
      uint64_t v20 = v18;
    }
    uint64_t v21 = +[TIDocumentState documentStateWithContextBefore:v19 selectedText:0 contextAfter:v20];
  }
  else
  {
    uint64_t v21 = self;
  }

  return v21;
}

- (id)documentStateAfterReplacingText:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  uint64_t v8 = [(TIDocumentState *)self contextBeforeInput];
  if (v8) {
    uint64_t v9 = (__CFString *)v8;
  }
  else {
    uint64_t v9 = &stru_1EDBDCE38;
  }
  id v10 = [(TIDocumentState *)self selectedText];

  if (v10)
  {
    unint64_t v11 = [(TIDocumentState *)self selectedText];
    id v12 = [(__CFString *)v9 stringByAppendingString:v11];
    uint64_t v13 = v12;
    if (v12)
    {
      uint64_t v14 = v12;
    }
    else
    {
      uint64_t v14 = [(TIDocumentState *)self selectedText];
    }
    uint64_t v15 = v14;

    uint64_t v9 = v15;
  }
  uint64_t v16 = [v6 length];
  if (v16)
  {
    uint64_t v17 = v16;
    if ([(__CFString *)v9 hasSuffix:v6])
    {
      uint64_t v18 = [(__CFString *)v9 length] - v17;
      if (v7) {
        uint64_t v19 = v7;
      }
      else {
        uint64_t v19 = &stru_1EDBDCE38;
      }
      uint64_t v20 = -[__CFString stringByReplacingCharactersInRange:withString:](v9, "stringByReplacingCharactersInRange:withString:", v18, v17, v19);
      goto LABEL_17;
    }
  }
  else if (v7)
  {
    uint64_t v20 = [(__CFString *)v9 stringByAppendingString:v7];
LABEL_17:
    uint64_t v21 = (__CFString *)v20;

    uint64_t v22 = [(TIDocumentState *)self contextAfterInput];
    uint64_t v23 = +[TIDocumentState documentStateWithContextBefore:v21 selectedText:0 contextAfter:v22];

    uint64_t v9 = v21;
    goto LABEL_19;
  }
  uint64_t v23 = 0;
LABEL_19:

  return v23;
}

- (id)documentStateAfterCollapsingSelection
{
  uint64_t v3 = [(TIDocumentState *)self selectedText];

  if (v3)
  {
    id v4 = [(TIDocumentState *)self contextBeforeInput];
    uint64_t v5 = [(TIDocumentState *)self selectedText];
    id v6 = [v4 stringByAppendingString:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(TIDocumentState *)self selectedText];
    }
    id v10 = v8;

    unint64_t v11 = [(TIDocumentState *)self contextAfterInput];
    uint64_t v9 = +[TIDocumentState documentStateWithContextBefore:v10 selectedText:0 contextAfter:v11];
  }
  else
  {
    uint64_t v9 = self;
  }

  return v9;
}

- (id)documentStateAfterUnmarkingText
{
  uint64_t v3 = [(TIDocumentState *)self markedText];

  if (!v3)
  {
    uint64_t v14 = self;
    goto LABEL_20;
  }
  id v4 = [(TIDocumentState *)self contextBeforeInput];
  unint64_t v5 = [(TIDocumentState *)self selectedRangeInMarkedText];
  id v6 = [(TIDocumentState *)self markedText];
  unint64_t v7 = [v6 length];

  if (v5 >= v7)
  {
    uint64_t v9 = [(TIDocumentState *)self markedText];
    uint64_t v15 = [v4 stringByAppendingString:v9];
    if (!v15)
    {
      uint64_t v16 = [(TIDocumentState *)self markedText];
      unint64_t v11 = 0;
      goto LABEL_13;
    }
    id v13 = v15;
    unint64_t v11 = v13;
LABEL_11:
    uint64_t v16 = (uint64_t)v13;
LABEL_13:

    id v4 = (void *)v16;
    goto LABEL_14;
  }
  if ([(TIDocumentState *)self selectedRangeInMarkedText])
  {
    id v8 = [(TIDocumentState *)self markedText];
    uint64_t v9 = objc_msgSend(v8, "substringToIndex:", -[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText"));

    uint64_t v10 = [v4 stringByAppendingString:v9];
    unint64_t v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = v9;
    }
    id v13 = v12;
    goto LABEL_11;
  }
LABEL_14:
  id v17 = [(TIDocumentState *)self contextAfterInput];
  uint64_t v18 = [(TIDocumentState *)self selectedRangeInMarkedText];
  unint64_t v20 = v18 + v19;
  uint64_t v21 = [(TIDocumentState *)self markedText];
  unint64_t v22 = [v21 length];

  if (v20 < v22)
  {
    uint64_t v23 = [(TIDocumentState *)self markedText];
    uint64_t v24 = [v23 substringFromIndex:v20];

    if (v17)
    {
      uint64_t v25 = [v24 stringByAppendingString:v17];

      id v17 = (id)v25;
    }
    else
    {
      id v17 = v24;
    }
  }
  uint64_t v26 = [(TIDocumentState *)self selectedText];
  uint64_t v14 = +[TIDocumentState documentStateWithContextBefore:v4 selectedText:v26 contextAfter:v17];

LABEL_20:

  return v14;
}

- (id)documentStateAfterSettingMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = [(TIDocumentState *)self markedText];
  if (v8)
  {
  }
  else if (![v7 length])
  {
LABEL_8:
    uint64_t v14 = self;
    goto LABEL_12;
  }
  uint64_t v9 = [(TIDocumentState *)self markedText];
  if (![v9 length]) {
    goto LABEL_10;
  }
  uint64_t v10 = [(TIDocumentState *)self markedText];
  if (([v7 isEqualToString:v10] & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v11 = [(TIDocumentState *)self selectedRangeInMarkedText];
  uint64_t v13 = v12;

  if (location == v11 && length == v13) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v15 = [(TIDocumentState *)self contextBeforeInput];
  uint64_t v16 = [(TIDocumentState *)self contextAfterInput];
  +[TIDocumentState documentStateWithContextBefore:markedText:selectedRange:contextAfter:](TIDocumentState, "documentStateWithContextBefore:markedText:selectedRange:contextAfter:", v15, v7, location, length, v16);
  uint64_t v14 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();

LABEL_12:

  return v14;
}

- (id)documentStateAfterDeletingForward
{
  uint64_t v3 = [(TIDocumentState *)self markedText];

  if (v3)
  {
    id v4 = [(TIDocumentState *)self documentStateAfterUnmarkingText];
    unint64_t v5 = [v4 documentStateAfterDeletingForward];
LABEL_3:

    goto LABEL_4;
  }
  uint64_t v7 = [(TIDocumentState *)self selectedText];
  if (v7
    && (id v8 = (void *)v7,
        [(TIDocumentState *)self selectedText],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        v8,
        v10))
  {
    uint64_t v11 = [(TIDocumentState *)self contextBeforeInput];
    uint64_t v12 = [(TIDocumentState *)self contextAfterInput];
    unint64_t v5 = +[TIDocumentState documentStateWithContextBefore:v11 selectedText:0 contextAfter:v12];
  }
  else
  {
    uint64_t v13 = [(TIDocumentState *)self contextAfterInput];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      uint64_t v15 = [(TIDocumentState *)self contextAfterInput];
      unint64_t v16 = [v15 length];

      id v17 = [(TIDocumentState *)self contextAfterInput];
      uint64_t v18 = [v17 rangeOfComposedCharacterSequenceAtIndex:0];
      unint64_t v20 = v19;

      id v4 = 0;
      if (v18 != 0x7FFFFFFFFFFFFFFFLL && v20 < v16)
      {
        uint64_t v21 = [(TIDocumentState *)self contextAfterInput];
        id v4 = [v21 substringFromIndex:v20];
      }
      unint64_t v22 = [(TIDocumentState *)self contextBeforeInput];
      unint64_t v5 = +[TIDocumentState documentStateWithContextBefore:v22 selectedText:0 contextAfter:v4];

      goto LABEL_3;
    }
    unint64_t v5 = self;
  }
LABEL_4:

  return v5;
}

- (id)documentStateAfterDeletingBackward
{
  uint64_t v3 = [(TIDocumentState *)self markedText];

  if (v3)
  {
    id v4 = [(TIDocumentState *)self documentStateAfterUnmarkingText];
    unint64_t v5 = [v4 documentStateAfterDeletingBackward];
LABEL_3:

    goto LABEL_4;
  }
  uint64_t v7 = [(TIDocumentState *)self selectedText];
  if (v7
    && (id v8 = (void *)v7,
        [(TIDocumentState *)self selectedText],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        v8,
        v10))
  {
    uint64_t v11 = [(TIDocumentState *)self contextBeforeInput];
    uint64_t v12 = [(TIDocumentState *)self contextAfterInput];
    unint64_t v5 = +[TIDocumentState documentStateWithContextBefore:v11 selectedText:0 contextAfter:v12];
  }
  else
  {
    uint64_t v13 = [(TIDocumentState *)self contextBeforeInput];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      uint64_t v15 = [(TIDocumentState *)self contextBeforeInput];
      unint64_t v16 = [v15 length];

      id v17 = [(TIDocumentState *)self contextBeforeInput];
      uint64_t v18 = [v17 _rangeOfBackwardDeletionClusterAtIndex:v16 - 1];
      unint64_t v20 = v19;

      if (v20 >= v16)
      {
        id v4 = 0;
      }
      else
      {
        uint64_t v21 = [(TIDocumentState *)self contextBeforeInput];
        id v4 = [v21 substringToIndex:v18];
      }
      unint64_t v22 = [(TIDocumentState *)self contextAfterInput];
      unint64_t v5 = +[TIDocumentState documentStateWithContextBefore:v4 selectedText:0 contextAfter:v22];

      goto LABEL_3;
    }
    unint64_t v5 = self;
  }
LABEL_4:

  return v5;
}

- (id)documentStateAfterInsertingTextAfterSelection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TIDocumentState *)self contextAfterInput];
  if (v5)
  {
    id v6 = [(TIDocumentState *)self contextAfterInput];
    id v7 = [v4 stringByAppendingString:v6];
  }
  else
  {
    id v7 = v4;
  }

  id v8 = [(TIDocumentState *)self contextBeforeInput];
  uint64_t v9 = +[TIDocumentState documentStateWithContextBefore:v8 selectedText:0 contextAfter:v7];

  return v9;
}

- (id)documentStateAfterInsertingText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    unint64_t v5 = [(TIDocumentState *)self contextBeforeInput];
    uint64_t v6 = [v5 stringByAppendingString:v4];
    id v7 = (void *)v6;
    if (v6) {
      id v8 = (void *)v6;
    }
    else {
      id v8 = v4;
    }
    id v9 = v8;

    uint64_t v10 = [(TIDocumentState *)self contextAfterInput];
    uint64_t v11 = +[TIDocumentState documentStateWithContextBefore:v9 selectedText:0 contextAfter:v10];
  }
  else
  {
    uint64_t v11 = self;
  }

  return v11;
}

- (unint64_t)inputIndexWithTerminatorPredicate:(id)a3
{
  uint64_t v3 = [(TIDocumentState *)self inputStemWithTerminatorPredicate:a3];
  unint64_t v4 = [v3 length];

  return v4;
}

- (id)inputStringWithTerminatorPredicate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TIDocumentState *)self selectedText];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [(TIDocumentState *)self contextBeforeInput];
    id v8 = [(TIDocumentState *)self wordPrefixOfString:v7 withTerminatorPredicate:v4 reverse:1];

    id v9 = [(TIDocumentState *)self contextAfterInput];
    uint64_t v10 = [(TIDocumentState *)self wordPrefixOfString:v9 withTerminatorPredicate:v4 reverse:0];

    uint64_t v6 = [v8 stringByAppendingString:v10];
  }

  return v6;
}

- (id)inputStemWithTerminatorPredicate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TIDocumentState *)self selectedText];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [(TIDocumentState *)self contextBeforeInput];
    uint64_t v6 = [(TIDocumentState *)self wordPrefixOfString:v7 withTerminatorPredicate:v4 reverse:1];
  }

  return v6;
}

- (id)wordPrefixOfString:(id)a3 withTerminatorPredicate:(id)a4 reverse:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3010000000;
  uint64_t v28 = &unk_18D2DEA03;
  long long v29 = xmmword_18D2C3CE0;
  if (v5) {
    uint64_t v9 = 258;
  }
  else {
    uint64_t v9 = 2;
  }
  uint64_t v10 = [v7 length];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __90__TIDocumentState_InputStringSupport__wordPrefixOfString_withTerminatorPredicate_reverse___block_invoke;
  unint64_t v22 = &unk_1E5558978;
  id v11 = v8;
  id v23 = v11;
  uint64_t v24 = &v25;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, v9, &v19);
  uint64_t v12 = (__CFString *)v7;
  uint64_t v13 = v12;
  uint64_t v14 = v26[4];
  uint64_t v15 = v12;
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5) {
      -[__CFString substringFromIndex:](v12, "substringFromIndex:", v26[5] + v14, v19, v20, v21, v22);
    }
    else {
      -[__CFString substringToIndex:](v12, "substringToIndex:", v19, v20, v21, v22);
    }
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v16 = &stru_1EDBDCE38;
  if (v15) {
    unint64_t v16 = v15;
  }
  id v17 = v16;

  _Block_object_dispose(&v25, 8);

  return v17;
}

uint64_t __90__TIDocumentState_InputStringSupport__wordPrefixOfString_withTerminatorPredicate_reverse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v12 + 32) = a3;
    *(void *)(v12 + 40) = a4;
    *a7 = 1;
  }
  return result;
}

+ (id)unboundedDocumentStateForTestingWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_msgSend(objc_alloc((Class)a1), "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:", v10, 0, v9, v8, 0x7FFFFFFFFFFFFFFFLL, 0);

  return v11;
}

+ (id)documentStateForTestingWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5 markedText:(id)a6 selectedRangeInMarkedText:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_msgSend(objc_alloc((Class)a1), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v16, v13, v15, v14, location, length);

  return v17;
}

+ (id)documentStateForTestingWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_msgSend(objc_alloc((Class)a1), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v10, 0, v9, v8, 0x7FFFFFFFFFFFFFFFLL, 0);

  return v11;
}

+ (id)documentStateForTestingWithText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc((Class)a1), "initWithText:selectedRange:", v7, location, length);

  return v8;
}

@end