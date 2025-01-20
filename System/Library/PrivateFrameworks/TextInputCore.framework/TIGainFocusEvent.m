@interface TIGainFocusEvent
- (NSArray)originalWordEntries;
- (TIGainFocusEvent)initWithTIKeyboardState:(id)a3 andLocale:(id)a4;
- (id)originalDocumentText;
- (id)originalWords;
@end

@implementation TIGainFocusEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalWordEntries, 0);
  objc_storeStrong((id *)&self->_originalWords, 0);
  objc_storeStrong((id *)&self->_originalDocumentText, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

- (NSArray)originalWordEntries
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  originalWordEntries = self->_originalWordEntries;
  if (!originalWordEntries)
  {
    v29 = [MEMORY[0x1E4F1CA48] array];
    v4 = [(TIGainFocusEvent *)self originalDocumentText];
    uint64_t v5 = [v4 length];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v30 = self;
    id obj = [(TIGainFocusEvent *)self originalWords];
    uint64_t v28 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v28)
    {
      uint64_t v6 = 0;
      uint64_t v27 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(v4, "rangeOfString:options:range:", v8, 2, v6, v5);
          if (v9 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (IXACanLogMessageAtLevel())
            {
              v22 = IXASessionDetailsLogFacility();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                v25 = [NSString stringWithFormat:@"%s An error occurred when trying to locate '%@' within the original document text '%@'", "-[TIGainFocusEvent originalWordEntries]", v8, v4];
                *(_DWORD *)buf = 138412290;
                v36 = v25;
                _os_log_debug_impl(&dword_1E3F0E000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
            goto LABEL_15;
          }
          uint64_t v11 = v9;
          uint64_t v12 = v10;
          v13 = objc_msgSend(v4, "substringWithRange:", 0, v9);
          v14 = [MEMORY[0x1E4FAE2A8] documentStateWithContextBefore:v13 selectedText:0 contextAfter:0];
          uint64_t v6 = v11 + v12;
          v15 = objc_msgSend(v4, "substringWithRange:", 0, v11 + v12);
          v16 = [(TIUserAction *)v30 keyboardState];
          v17 = (void *)[v16 copy];

          v18 = [MEMORY[0x1E4FAE2A8] documentStateWithContextBefore:v15 selectedText:0 contextAfter:0];
          [v17 setDocumentState:v18];

          v19 = [MEMORY[0x1E4FAE318] candidateWithCandidate:v8 forInput:v8];
          v20 = objc_alloc_init(TIWordEntry);
          [(TIUserAction *)v20 setDocumentState:v14];
          [(TIUserAction *)v20 setKeyboardState:v17];
          [(TIWordEntry *)v20 setAcceptedCandidate:v19];
          v21 = [v19 candidate];
          [(TIWordEntry *)v20 setAcceptedString:v21];

          [(TIWordEntry *)v20 setOrigin:1];
          [(NSArray *)v29 addObject:v20];
          uint64_t v5 = [v4 length] - v6;
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    v23 = v30->_originalWordEntries;
    v30->_originalWordEntries = v29;

    originalWordEntries = v30->_originalWordEntries;
  }

  return originalWordEntries;
}

- (id)originalWords
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  originalWords = self->_originalWords;
  if (!originalWords)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = [(TIGainFocusEvent *)self originalDocumentText];
    if (![v5 length])
    {
LABEL_15:
      uint64_t v10 = (NSArray *)[v4 copy];
      uint64_t v11 = self->_originalWords;
      self->_originalWords = v10;

      originalWords = self->_originalWords;
      goto LABEL_16;
    }
    size_t v6 = 4 * [v5 length];
    v7 = malloc_type_malloc(v6, 0x93A6B256uLL);
    uint64_t v17 = 0;
    long long v16 = xmmword_1E4154B50;
    if (objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v7, v6, &v17, 4, 0, 0, objc_msgSend(v5, "length"), &v16))
    {
      if (v16 != 0x7FFFFFFFFFFFFFFFLL && IXACanLogMessageAtLevel())
      {
        uint64_t v8 = IXASessionDetailsLogFacility();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v14 = [NSString stringWithFormat:@"%s The range (%lu, %lu) was left over when getting the bytes from the original document text '%@'", "-[TIGainFocusEvent originalWords]", v16, v5];
          *(_DWORD *)buf = 138412290;
          v19 = v14;
          _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
      LMStreamTokenizerCreate();
      v15 = v4;
      LMStreamTokenizerPushBytes();
      LMStreamTokenizerRelease();
      uint64_t v9 = v15;
    }
    else
    {
      if (!IXACanLogMessageAtLevel())
      {
LABEL_14:
        free(v7);
        goto LABEL_15;
      }
      uint64_t v9 = IXASessionDetailsLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v13 = [NSString stringWithFormat:@"%s Unable to get the bytes from the original document text '%@'", "-[TIGainFocusEvent originalWords]", v5];
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }

    goto LABEL_14;
  }
LABEL_16:

  return originalWords;
}

void __33__TIGainFocusEvent_originalWords__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a4 - 500) <= 0xFFFFFE0C)
  {
    id v6 = (id)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (id)originalDocumentText
{
  originalDocumentText = self->_originalDocumentText;
  if (!originalDocumentText)
  {
    uint64_t v4 = [(TIUserAction *)self keyboardState];
    uint64_t v5 = [v4 documentState];

    if (v5)
    {
      id v6 = NSString;
      uint64_t v7 = [v5 contextBeforeInput];
      uint64_t v8 = (NSString *)v7;
      if (v7) {
        uint64_t v9 = (__CFString *)v7;
      }
      else {
        uint64_t v9 = &stru_1F3F7A998;
      }
      uint64_t v10 = [v5 selectedText];
      uint64_t v11 = (void *)v10;
      if (v10) {
        uint64_t v12 = (__CFString *)v10;
      }
      else {
        uint64_t v12 = &stru_1F3F7A998;
      }
      uint64_t v13 = [v5 contextAfterInput];
      v14 = (void *)v13;
      if (v13) {
        v15 = (__CFString *)v13;
      }
      else {
        v15 = &stru_1F3F7A998;
      }
      long long v16 = [v6 stringWithFormat:@"%@%@%@ ", v9, v12, v15];
      uint64_t v17 = self->_originalDocumentText;
      self->_originalDocumentText = v16;
    }
    else
    {
      uint64_t v8 = self->_originalDocumentText;
      self->_originalDocumentText = (NSString *)&stru_1F3F7A998;
    }

    originalDocumentText = self->_originalDocumentText;
  }

  return originalDocumentText;
}

- (TIGainFocusEvent)initWithTIKeyboardState:(id)a3 andLocale:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TIGainFocusEvent;
  uint64_t v8 = [(TIContextChangeEvent *)&v12 initWithTIKeyboardState:a3 andActionType:10];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a4);
    id v10 = [(TIGainFocusEvent *)v9 originalWords];
  }

  return v9;
}

@end