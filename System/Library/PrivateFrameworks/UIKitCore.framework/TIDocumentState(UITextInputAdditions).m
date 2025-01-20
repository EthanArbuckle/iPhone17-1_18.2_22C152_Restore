@interface TIDocumentState(UITextInputAdditions)
+ (id)documentStateOfDocument:()UITextInputAdditions;
+ (id)documentStateOfDocumentWithParagraph:()UITextInputAdditions;
+ (id)documentStateOfDocumentWithRecentInputIdentifier:()UITextInputAdditions;
+ (id)documentStateOfSecureTextDocument:()UITextInputAdditions;
- (id)_contextAfterPosition:()UITextInputAdditions inDocument:toBoundary:;
- (id)_contextBeforePosition:()UITextInputAdditions inDocument:toBoundary:;
- (id)_positionFromPosition:()UITextInputAdditions toPreviousWordBoundaryInDocument:tokenAccumulator:;
- (id)_positionFromPosition:()UITextInputAdditions toPreviousWordStartInDocument:tokenAccumulator:;
- (id)fullString;
- (id)initWithDocument:()UITextInputAdditions contextBoundary:;
- (id)initWithSecureTextDocument:()UITextInputAdditions;
- (id)textRangeFromPosition:()UITextInputAdditions toPosition:inDocument:;
- (uint64_t)_selectedTextRange;
- (uint64_t)copyTextInRange:()UITextInputAdditions fromDocument:;
- (uint64_t)initWithDocument:()UITextInputAdditions;
- (uint64_t)initWithDocumentWithParagraph:()UITextInputAdditions;
- (uint64_t)initWithDocumentWithRecentInputIdentifier:()UITextInputAdditions;
@end

@implementation TIDocumentState(UITextInputAdditions)

+ (id)documentStateOfDocument:()UITextInputAdditions
{
  v3 = (objc_class *)MEMORY[0x1E4FAE2A8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithDocument:v4];

  return v5;
}

+ (id)documentStateOfDocumentWithParagraph:()UITextInputAdditions
{
  v3 = (objc_class *)MEMORY[0x1E4FAE2A8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithDocumentWithParagraph:v4];

  return v5;
}

+ (id)documentStateOfDocumentWithRecentInputIdentifier:()UITextInputAdditions
{
  v3 = (objc_class *)MEMORY[0x1E4FAE2A8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithDocumentWithRecentInputIdentifier:v4];

  return v5;
}

+ (id)documentStateOfSecureTextDocument:()UITextInputAdditions
{
  v3 = (objc_class *)MEMORY[0x1E4FAE2A8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithSecureTextDocument:v4];

  return v5;
}

- (id)textRangeFromPosition:()UITextInputAdditions toPosition:inDocument:
{
  v6 = 0;
  if (a3 && a4)
  {
    v6 = objc_msgSend(a5, "textRangeFromPosition:toPosition:");
    uint64_t v5 = vars8;
  }
  return v6;
}

- (uint64_t)copyTextInRange:()UITextInputAdditions fromDocument:
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && ([v5 isEmpty] & 1) == 0)
  {
    v8 = [v6 textInRange:v5];
    uint64_t v7 = [v8 copy];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_positionFromPosition:()UITextInputAdditions toPreviousWordBoundaryInDocument:tokenAccumulator:
{
  id v7 = a3;
  id v8 = a4;
  v9 = a5;
  uint64_t v10 = 3;
  while (1)
  {
    v11 = [v8 tokenizer];
    v12 = [v11 positionFromPosition:v7 toBoundary:1 inDirection:1];

    if (v12) {
      break;
    }
    v13 = [v8 tokenizer];
    v14 = [v13 positionFromPosition:v7 toBoundary:3 inDirection:1];

    if (!v14 || [v8 comparePosition:v14 toPosition:v7] != -1)
    {
      v18 = 0;
      goto LABEL_16;
    }
    v15 = [v8 textRangeFromPosition:v14 toPosition:v7];
    v12 = [v8 textInRange:v15];

    v9[2](v9, v12);
    v16 = [v8 tokenizer];
    int v17 = [v16 isPosition:v7 atBoundary:1 inDirection:0];

    if (v17)
    {
      id v20 = v14;
      v14 = v20;
      goto LABEL_13;
    }

    id v7 = v14;
    if (!--v10)
    {
      v18 = 0;
      id v7 = v14;
      goto LABEL_17;
    }
  }
  v19 = [v8 textRangeFromPosition:v12 toPosition:v7];
  v14 = [v8 textInRange:v19];

  if ([v14 length] && objc_msgSend(v14, "rangeOfString:", @"\uFFFC") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9[2](v9, v14);
    id v20 = v12;
LABEL_13:
    v18 = v20;
    goto LABEL_15;
  }
  v18 = 0;
LABEL_15:

LABEL_16:
LABEL_17:

  return v18;
}

- (id)_positionFromPosition:()UITextInputAdditions toPreviousWordStartInDocument:tokenAccumulator:
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a1 _positionFromPosition:a3 toPreviousWordBoundaryInDocument:v8 tokenAccumulator:v9];
  if (v10)
  {
    v11 = [v8 tokenizer];
    char v12 = [v11 isPosition:v10 atBoundary:1 inDirection:1];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [a1 _positionFromPosition:v10 toPreviousWordBoundaryInDocument:v8 tokenAccumulator:v9];

      uint64_t v10 = (void *)v13;
    }
  }

  return v10;
}

- (id)_contextBeforePosition:()UITextInputAdditions inDocument:toBoundary:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v8 tokenizer];
    v11 = [v10 positionFromPosition:v7 toBoundary:a5 inDirection:1];

    if (a5 == 3 && v11)
    {
      char v12 = [v9 positionFromPosition:v11 offset:-2];
      if (!v12)
      {
        char v12 = [v9 positionFromPosition:v11 offset:-1];
      }
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v11;
      }
      id v14 = v13;

      v11 = v14;
    }
    if (v11)
    {
      if ((unint64_t)[v9 offsetFromPosition:v11 toPosition:v7] <= 0x63)
      {
        uint64_t v15 = [v9 _positionAtStartOfWords:10 beforePosition:v7];
        if (v15)
        {
          v16 = (void *)v15;
          id v17 = [v9 _positionFromPosition:v15 pastTextUnit:2 inDirection:1];

          if (v17 && [v9 comparePosition:v17 toPosition:v11] == -1)
          {
            id v17 = v17;

            v11 = v17;
          }
        }
        else
        {
          id v17 = 0;
        }
      }
      v19 = [v9 textRangeFromPosition:v11 toPosition:v7];
      if (v19)
      {
        v18 = [v9 textInRange:v19];
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v11 = 0;
  }

  return v18;
}

- (id)_contextAfterPosition:()UITextInputAdditions inDocument:toBoundary:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v8 tokenizer];
    v11 = [v10 positionFromPosition:v7 toBoundary:a5 inDirection:0];

    if (a5 == 3 && v11)
    {
      char v12 = [v9 positionFromPosition:v11 offset:2];
      if (!v12)
      {
        char v12 = [v9 positionFromPosition:v11 offset:1];
      }
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v11;
      }
      id v14 = v13;

      v11 = v14;
    }
    if (v11)
    {
      uint64_t v15 = [v9 textRangeFromPosition:v7 toPosition:v11];
      if (v15)
      {
        v16 = [v9 textInRange:v15];
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
      uint64_t v15 = 0;
    }
  }
  else
  {
    v16 = 0;
    uint64_t v15 = 0;
    v11 = 0;
  }

  return v16;
}

- (id)initWithDocument:()UITextInputAdditions contextBoundary:
{
  id v6 = a3;
  id v7 = [v6 selectedTextRange];
  uint64_t v8 = [v6 markedTextRange];
  id v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  else {
    uint64_t v10 = v7;
  }
  id v11 = v10;
  char v12 = v11;
  uint64_t v47 = a4;
  if (v11)
  {
    uint64_t v13 = [v11 start];
    v48 = [a1 _contextBeforePosition:v13 inDocument:v6 toBoundary:a4];

    id v14 = [v12 end];
    uint64_t v43 = [a1 _contextAfterPosition:v14 inDocument:v6 toBoundary:a4];
  }
  else
  {
    uint64_t v43 = 0;
    v48 = 0;
  }
  uint64_t v15 = [v9 start];
  v16 = [v7 start];
  uint64_t v17 = [a1 textRangeFromPosition:v15 toPosition:v16 inDocument:v6];

  v18 = [v7 end];
  v19 = [v9 end];
  uint64_t v20 = [a1 textRangeFromPosition:v18 toPosition:v19 inDocument:v6];

  v21 = (void *)[a1 copyTextInRange:v17 fromDocument:v6];
  v22 = (void *)[a1 copyTextInRange:v7 fromDocument:v6];
  v45 = (void *)v20;
  v23 = (void *)[a1 copyTextInRange:v20 fromDocument:v6];
  v46 = (void *)v17;
  v44 = v21;
  if (v9)
  {
    id v24 = v21;
    v25 = v24;
    id v26 = v24;
    if (v22)
    {
      uint64_t v27 = [v24 stringByAppendingString:v22];
      v28 = (void *)v27;
      if (v27) {
        v29 = (void *)v27;
      }
      else {
        v29 = v22;
      }
      id v26 = v29;
    }
    v42 = v23;
    if (v23)
    {
      uint64_t v30 = [v26 stringByAppendingString:v23];
      v31 = (void *)v30;
      if (v30) {
        v32 = (void *)v30;
      }
      else {
        v32 = v23;
      }
      v41 = v9;
      v33 = v7;
      v34 = v12;
      id v35 = v32;

      id v26 = v35;
      char v12 = v34;
      id v7 = v33;
    }
    if (v26)
    {
      [v25 length];
      [v22 length];
    }
    v23 = v42;
  }
  else
  {
    id v26 = 0;
  }
  if (v47 == 3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v36 = a1;
    v37 = (void *)v43;
    id v38 = (id)objc_msgSend(v36, "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:", v48, v26, v22);
  }
  else
  {
    v37 = (void *)v43;
    id v38 = (id)objc_msgSend(a1, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v48, v26, v22, v41);
    id v36 = v38;
  }
  id v39 = v38;

  return v39;
}

- (uint64_t)initWithDocument:()UITextInputAdditions
{
  return [a1 initWithDocument:a3 contextBoundary:2];
}

- (uint64_t)initWithDocumentWithParagraph:()UITextInputAdditions
{
  return [a1 initWithDocument:a3 contextBoundary:3];
}

- (uint64_t)initWithDocumentWithRecentInputIdentifier:()UITextInputAdditions
{
  return [a1 initWithDocument:a3 contextBoundary:5];
}

- (id)initWithSecureTextDocument:()UITextInputAdditions
{
  id v4 = a3;
  id v5 = [v4 selectedTextRange];
  if (v5)
  {
    id v6 = [v4 beginningOfDocument];
    id v7 = [v5 start];
    uint64_t v8 = [v4 textRangeFromPosition:v6 toPosition:v7];

    if ([v8 isEmpty])
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [v4 textInRange:v8];
    }
    if ([v5 isEmpty])
    {
      id v11 = 0;
    }
    else
    {
      id v11 = [v4 textInRange:v5];
    }
    char v12 = [v5 end];
    uint64_t v13 = [v4 endOfDocument];
    id v14 = [v4 textRangeFromPosition:v12 toPosition:v13];

    if ([v14 isEmpty])
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = [v4 textInRange:v14];
    }
    id v10 = (id)objc_msgSend(a1, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v9, 0, v11, v15, 0x7FFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    id v10 = (id)objc_msgSend(a1, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", 0, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  }

  return v10;
}

- (id)fullString
{
  uint64_t v2 = [a1 contextBeforeInput];
  v3 = (void *)v2;
  if (v2) {
    id v4 = (__CFString *)v2;
  }
  else {
    id v4 = &stru_1ED0E84C0;
  }
  id v5 = v4;

  uint64_t v6 = [a1 selectedText];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  else {
    uint64_t v8 = &stru_1ED0E84C0;
  }
  id v9 = v8;

  uint64_t v10 = [a1 contextAfterInput];
  id v11 = (void *)v10;
  if (v10) {
    char v12 = (__CFString *)v10;
  }
  else {
    char v12 = &stru_1ED0E84C0;
  }
  uint64_t v13 = v12;

  id v14 = [NSString stringWithFormat:@"%@%@%@", v5, v9, v13];

  return v14;
}

- (uint64_t)_selectedTextRange
{
  uint64_t v2 = [a1 contextBeforeInput];
  uint64_t v3 = [v2 length];
  id v4 = [a1 selectedText];
  [v4 length];

  return v3;
}

@end