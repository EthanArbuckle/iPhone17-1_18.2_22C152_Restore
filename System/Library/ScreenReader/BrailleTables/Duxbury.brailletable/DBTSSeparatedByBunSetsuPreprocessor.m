@interface DBTSSeparatedByBunSetsuPreprocessor
- (DBTSSeparatedByBunSetsuPreprocessor)init;
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6;
- (void)dealloc;
@end

@implementation DBTSSeparatedByBunSetsuPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  v9 = (__CFString *)a3;
  id v10 = a6;
  if (!v9)
  {
    v13 = 0;
    goto LABEL_49;
  }
  id v57 = v10;
  range = (char *)[(__CFString *)v9 length];
  uint64_t v11 = +[NSMutableString string];
  if (a4)
  {
    uint64_t v12 = +[NSMutableData dataWithLength:0];
  }
  else
  {
    uint64_t v12 = 0;
  }
  v59 = (void *)v12;
  v60 = (void *)v11;
  v63 = v9;
  v69.location = 0;
  v69.length = (CFIndex)range;
  tokenizer = CFStringTokenizerCreate(0, v9, v69, 4uLL, self->_locale);
  CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
  v56 = a4;
  if (!Token)
  {
    unint64_t v16 = 0;
    v17 = &stru_34AF0;
    v18 = &stru_34AF0;
    goto LABEL_42;
  }
  CFStringTokenizerTokenType v15 = Token;
  unint64_t v16 = 0;
  char v66 = 0;
  char v61 = 0;
  v17 = &stru_34AF0;
  v18 = &stru_34AF0;
  while (1)
  {
    CFStringTokenizerTokenType v62 = v15;
    v19 = v18;
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer);
    uint64_t v65 = -[__CFString substringFromIndex:](v63, "substringFromIndex:");
    uint64_t CurrentTokenPartOfSpeech = _CFStringTokenizerGetCurrentTokenPartOfSpeech();
    v22 = +[NSNumber numberWithInt:CurrentTokenPartOfSpeech];
    unsigned int v23 = [&off_353E8 containsObject:v22];

    v24 = +[NSNumber numberWithInt:CurrentTokenPartOfSpeech];
    unsigned int v25 = [&off_35400 containsObject:v24];

    v26 = +[NSNumber numberWithInt:CurrentTokenPartOfSpeech];
    unsigned int v27 = [&off_35418 containsObject:v26];

    v28 = -[__CFString substringWithRange:](v63, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    unsigned int v29 = [v28 isEqualToString:@"。"];
    int v30 = v23 | v25;
    if (v66) {
      int v30 = v29 | v27;
    }
    if (v30 == 1)
    {
      uint64_t v31 = [(__CFString *)v19 stringByAppendingString:v28];

      v66 |= v25;
      v18 = (__CFString *)v31;
      v32 = (void *)v65;
    }
    else
    {
      v33 = v19;
      if ([(__CFString *)v19 hasSuffix:@"。"])
      {
        uint64_t v34 = [(__CFString *)v19 stringByAppendingString:@" "];

        v33 = (void *)v34;
      }
      v32 = (void *)v65;
      v35 = v17;
      if ([(__CFString *)v17 length])
      {
        uint64_t v36 = [(__CFString *)v17 stringByAppendingString:@" "];

        v35 = (void *)v36;
      }
      if ([v33 length])
      {
        char v61 = 1;
      }
      else
      {
        uint64_t v37 = -[__CFString substringWithRange:](v63, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);

        v33 = (void *)v37;
      }
      v17 = [v35 stringByAppendingString:v33];

      char v66 = 0;
      v18 = &stru_34AF0;
    }
    if ([(__CFString *)v17 length])
    {
      v38 = (char *)[(__CFString *)v17 length];
      id v39 = v60;
      id v40 = v59;
      v41 = -[__CFString substringWithRange:](v17, "substringWithRange:", 0, v38);
      [v39 appendString:v41];

      if (v38)
      {
        v42 = (char *)v16;
        do
        {
          v67 = v42;
          [v40 appendBytes:&v67 length:8];
          ++v42;
          --v38;
        }
        while (v38);
      }

      if ([v32 length])
      {
        v43 = [v32 substringToIndex:1];
        unsigned __int8 v44 = [v43 isEqualToString:@" "];

        if ((v44 & 1) == 0)
        {
          [v39 appendString:@" "];
          v67 = 0;
          v67 = (char *)[(__CFString *)v17 length] + v16;
          [v40 appendBytes:&v67 length:8];
        }
      }
      v16 += (unint64_t)[(__CFString *)v17 length];

      if (v61)
      {
        char v61 = 0;
        v17 = &stru_34AF0;
        CFStringTokenizerTokenType v15 = v62;
        goto LABEL_32;
      }
      v17 = &stru_34AF0;
    }
    CFStringTokenizerTokenType v45 = CFStringTokenizerAdvanceToNextToken(tokenizer);
    if (!v45) {
      break;
    }
    CFStringTokenizerTokenType v15 = v45;
LABEL_32:
  }
  if ([(__CFString *)v18 length])
  {
    v46 = (char *)[(__CFString *)v18 length];
    id v47 = v60;
    id v48 = v59;
    v49 = -[__CFString substringWithRange:](v18, "substringWithRange:", 0, v46);
    [v47 appendString:v49];

    for (; v46; --v46)
    {
      v67 = (char *)v16;
      [v48 appendBytes:&v67 length:8];
      ++v16;
    }

    if ([v32 length])
    {
      v50 = [v32 substringToIndex:1];
      unsigned __int8 v51 = [v50 isEqualToString:@" "];

      unint64_t v16 = CurrentTokenRange.location + CurrentTokenRange.length;
      if ((v51 & 1) == 0)
      {
        [v47 appendString:@" "];
        v67 = (char *)(CurrentTokenRange.location + CurrentTokenRange.length);
        [v48 appendBytes:&v67 length:8];
      }
    }
    else
    {
      unint64_t v16 = CurrentTokenRange.location + CurrentTokenRange.length;
    }
  }

LABEL_42:
  v9 = v63;
  if ((unint64_t)range > v16)
  {
    id v52 = v60;
    id v53 = v59;
    v54 = -[__CFString substringWithRange:](v63, "substringWithRange:", v16, &range[-v16]);
    [v52 appendString:v54];

    do
    {
      v67 = (char *)v16;
      objc_msgSend(v53, "appendBytes:length:", &v67, 8, v56);
      ++v16;
    }
    while (range != (char *)v16);
  }
  CFRelease(tokenizer);
  v13 = v60;
  if (v56) {
    id *v56 = v59;
  }

  id v10 = v57;
LABEL_49:

  return v13;
}

- (DBTSSeparatedByBunSetsuPreprocessor)init
{
  v4.receiver = self;
  v4.super_class = (Class)DBTSSeparatedByBunSetsuPreprocessor;
  v2 = [(DBTSSeparatedByBunSetsuPreprocessor *)&v4 init];
  if (v2) {
    v2->_locale = CFLocaleCopyCurrent();
  }
  return v2;
}

- (void)dealloc
{
  locale = self->_locale;
  if (locale) {
    CFRelease(locale);
  }
  v4.receiver = self;
  v4.super_class = (Class)DBTSSeparatedByBunSetsuPreprocessor;
  [(DBTSSeparatedByBunSetsuPreprocessor *)&v4 dealloc];
}

@end