@interface DBTStringTransformPrintPreprocessor
- (DBTStringTransformPrintPreprocessor)init;
- (NSString)characterLevelStringTransform;
- (__CFString)stringTransform;
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6;
- (void)dealloc;
- (void)setCharacterLevelStringTransform:(id)a3;
- (void)setStringTransform:(__CFString *)a3;
@end

@implementation DBTStringTransformPrintPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  v9 = (__CFString *)a3;
  id v10 = a6;
  if (!v9)
  {
    v12 = 0;
    goto LABEL_42;
  }
  id v37 = v10;
  v54.unint64_t length = (CFIndex)[(__CFString *)v9 length];
  v54.location = 0;
  unint64_t length = v54.length;
  v11 = CFStringTokenizerCreate(0, v9, v54, 0x10000uLL, self->_locale);
  v41 = +[NSMutableString string];
  v36 = a4;
  if (a4)
  {
    v40 = +[NSMutableData dataWithLength:0];
  }
  else
  {
    v40 = 0;
  }
  v42 = v9;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  tokenizer = v11;
  while (CFStringTokenizerAdvanceToNextToken(v11))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v11);
    unint64_t v14 = v50[3];
    if (CurrentTokenRange.location > v14)
    {
      unint64_t v15 = CurrentTokenRange.location - v14;
      id v16 = v41;
      id v17 = v40;
      v18 = -[__CFString substringWithRange:](v42, "substringWithRange:", v14, CurrentTokenRange.location - v14);
      [v16 appendString:v18];

      while (CurrentTokenRange.location != v14)
      {
        *(void *)&long long v44 = v14;
        [v17 appendBytes:&v44 length:8];
        ++v14;
      }

      v50[3] += v15;
    }
    -[__CFString substringWithRange:](v42, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length, v36);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = (char *)[v19 length];
    if (!v20)
    {

LABEL_20:
      if (CFEqual([(DBTStringTransformPrintPreprocessor *)self stringTransform], kCFStringTransformLatinHiragana))
      {
        goto LABEL_31;
      }
      goto LABEL_21;
    }
    v21 = 0;
    BOOL v22 = 1;
    do
    {
      if ((unsigned __int16)((unsigned __int16)((unsigned __int16)[v19 characterAtIndex:v21] + 24624) >> 4) >= 0xAE3u) {
        break;
      }
      BOOL v22 = ++v21 < v20;
    }
    while (v20 != v21);

    if (!v22) {
      goto LABEL_20;
    }
LABEL_21:
    v23 = (void *)CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, 0x10000uLL);
    if ([v23 length])
    {
      v24 = +[NSMutableString stringWithString:v23];
      CFStringTransform(v24, 0, [(DBTStringTransformPrintPreprocessor *)self stringTransform], 0);
      v39 = v24;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = __109__DBTStringTransformPrintPreprocessor_preprocessPrintString_withLocationMap_isEightDot_textFormattingRanges___block_invoke;
      v45[3] = &unk_34650;
      id v46 = v41;
      v48 = &v49;
      id v47 = v40;
      v25 = objc_retainBlock(v45);
      v26 = [(DBTStringTransformPrintPreprocessor *)self characterLevelStringTransform];

      if (v26)
      {
        for (unint64_t i = 0; (unint64_t)[v19 length] > i; ++i)
        {
          id v28 = [v19 mutableCopy];
          long long v44 = xmmword_2F880;
          v29 = [(DBTStringTransformPrintPreprocessor *)self characterLevelStringTransform];
          objc_msgSend(v28, "applyTransform:reverse:range:updatedRange:", v29, 0, i, 1, &v44);

          if ((void)v44 == 0x7FFFFFFFFFFFFFFFLL)
          {

            break;
          }
          v30 = [v28 substringWithRange:v44];
          ((void (*)(void *, void *, unint64_t, uint64_t))v25[2])(v25, v30, CurrentTokenRange.location + i, 1);
        }
      }
      else
      {
        ((void (*)(void *, __CFString *, CFIndex, CFIndex))v25[2])(v25, v39, CurrentTokenRange.location, CurrentTokenRange.length);
      }
    }
LABEL_31:

    v11 = tokenizer;
  }
  if (v11) {
    CFRelease(v11);
  }
  unint64_t v31 = v50[3];
  if (length > v31)
  {
    id v32 = v41;
    id v33 = v40;
    v34 = -[__CFString substringWithRange:](v42, "substringWithRange:", v31, length - v31);
    [v32 appendString:v34];

    while (length != v31)
    {
      *(void *)&long long v44 = v31;
      [v33 appendBytes:&v44 length:8];
      ++v31;
    }
  }
  v12 = v41;
  if (v36) {
    id *v36 = v40;
  }
  _Block_object_dispose(&v49, 8);

  v9 = v42;
  id v10 = v37;
LABEL_42:

  return v12;
}

void __109__DBTStringTransformPrintPreprocessor_preprocessPrintString_withLocationMap_isEightDot_textFormattingRanges___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  v7 = (char *)[v6 length];
  if (v7)
  {
    v8 = v7;
    [*(id *)(a1 + 32) appendString:v6];
    do
    {
      v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      [v9 appendBytes:&v10 length:8];
      --v8;
    }
    while (v8);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a4;
  }
}

- (DBTStringTransformPrintPreprocessor)init
{
  v4.receiver = self;
  v4.super_class = (Class)DBTStringTransformPrintPreprocessor;
  v2 = [(DBTStringTransformPrintPreprocessor *)&v4 init];
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
  v4.super_class = (Class)DBTStringTransformPrintPreprocessor;
  [(DBTStringTransformPrintPreprocessor *)&v4 dealloc];
}

- (__CFString)stringTransform
{
  return self->_stringTransform;
}

- (void)setStringTransform:(__CFString *)a3
{
  self->_stringTransform = a3;
}

- (NSString)characterLevelStringTransform
{
  return self->_characterLevelStringTransform;
}

- (void)setCharacterLevelStringTransform:(id)a3
{
}

- (void).cxx_destruct
{
}

@end