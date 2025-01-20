@interface TIDPRecorder
- (BOOL)isWordEntryReallyOOV:(id)a3 caseSensitive:(BOOL)a4;
- (BOOL)report;
- (HCHuffmanCoder)characterCoder;
- (HCHuffmanCoder)wordCoder;
- (NSArray)characterExplodedRecords;
- (NSArray)records;
- (NSString)primaryInputModeLocaleIndentifier;
- (NSString)recordingKey;
- (NSString)recordingKeyLocaleSubstring;
- (NSString)secondaryInputModeLocaleIdentifier;
- (TIDPRecorder)initWithTypingSession:(id)a3 aligned:(id)a4;
- (TIDPReportingDelegate)delegate;
- (TITypingSession)typingSession;
- (TITypingSessionAligned)typingSessionAligned;
- (_LXLexicon)lexiconPrimaryInputMode;
- (_LXLexicon)lexiconSecondaryInputMode;
- (void)_prepareCharacterCoderMatchingSession;
- (void)_prepareWordCoderMatchingSession;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation TIDPRecorder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingSessionAligned, 0);
  objc_storeStrong((id *)&self->_typingSession, 0);
  objc_storeStrong((id *)&self->_wordCoder, 0);
  objc_storeStrong((id *)&self->_characterCoder, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_secondaryLexiconLock, 0);
  objc_storeStrong((id *)&self->_primaryLexiconLock, 0);

  objc_storeStrong((id *)&self->_delegateLock, 0);
}

- (TITypingSessionAligned)typingSessionAligned
{
  return self->_typingSessionAligned;
}

- (TITypingSession)typingSession
{
  return self->_typingSession;
}

- (void)_prepareWordCoderMatchingSession
{
  v3 = [(TITypingSession *)self->_typingSession sessionParams];
  v4 = [v3 activeInputModes];
  id v9 = [v4 firstObject];

  v5 = [v9 normalizedIdentifier];
  v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v5];
  v7 = +[HCHuffmanCoder wordCoderForLocale:v6];
  wordCoder = self->_wordCoder;
  self->_wordCoder = v7;
}

- (void)_prepareCharacterCoderMatchingSession
{
  v3 = [(TITypingSession *)self->_typingSession sessionParams];
  v4 = [v3 activeInputModes];
  id v9 = [v4 firstObject];

  v5 = [v9 normalizedIdentifier];
  v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v5];
  v7 = +[HCHuffmanCoder characterCoderForLocale:v6];
  characterCoder = self->_characterCoder;
  self->_characterCoder = v7;
}

- (BOOL)report
{
  return 0;
}

- (HCHuffmanCoder)wordCoder
{
  wordCoder = self->_wordCoder;
  if (!wordCoder)
  {
    [(TIDPRecorder *)self _prepareWordCoderMatchingSession];
    wordCoder = self->_wordCoder;
  }

  return wordCoder;
}

- (HCHuffmanCoder)characterCoder
{
  characterCoder = self->_characterCoder;
  if (!characterCoder)
  {
    [(TIDPRecorder *)self _prepareCharacterCoderMatchingSession];
    characterCoder = self->_characterCoder;
  }

  return characterCoder;
}

- (NSString)recordingKey
{
  return (NSString *)&stru_1F3F7A998;
}

- (NSArray)characterExplodedRecords
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(TIDPRecorder *)self records];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      id v9 = v6;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v6 = [v10 word];

        uint64_t v12 = [v6 length];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __40__TIDPRecorder_characterExplodedRecords__block_invoke;
        v18[3] = &unk_1E6E2BF00;
        id v19 = v11;
        v20 = &v25;
        v18[4] = self;
        id v13 = v11;
        objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v12, 2, v18);
        v14 = (void *)[v13 copy];
        [v3 addObject:v14];

        v26[3] = 0;
        ++v8;
        id v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v5);
  }
  v15 = (void *)[v3 copy];
  _Block_object_dispose(&v25, 8);

  return (NSArray *)v15;
}

void __40__TIDPRecorder_characterExplodedRecords__block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void *)(v4 + 24) + 1;
  *(void *)(v4 + 24) = v5;
  id v6 = a2;
  uint64_t v7 = [v3 numberWithUnsignedInteger:v5];
  uint64_t v8 = [*(id *)(a1 + 32) characterCoder];
  id v9 = +[TIDPWordRecord word:v6 atPosition:v7 coder:v8];

  [*(id *)(a1 + 40) addObject:v9];
}

- (NSArray)records
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSString)recordingKeyLocaleSubstring
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(TIDPRecorder *)self typingSession];
  id v3 = [v2 sessionParams];
  uint64_t v4 = [v3 activeInputModes];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "normalizedIdentifier", (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [v5 sortUsingSelector:sel_compare_];
  uint64_t v12 = [v5 componentsJoinedByString:@"+"];

  return (NSString *)v12;
}

- (BOOL)isWordEntryReallyOOV:(id)a3 caseSensitive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(TIDPRecorder *)self lexiconPrimaryInputMode])
  {
    uint64_t v7 = [v6 acceptedString];
    uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v9 = [v7 stringByTrimmingCharactersInSet:v8];

    v10 = v9;
    id v11 = v10;
    if (v10 && [(__CFString *)v10 length])
    {
      if (![(__CFString *)v11 length])
      {

        goto LABEL_29;
      }
      BOOL v26 = v4;
      uint64_t v27 = v7;
      unint64_t v12 = 0;
      LODWORD(v13) = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      do
      {
        uint64_t CharacterAtIndex = CFStringGetCharacterAtIndex(v11, v12);
        if ((CharacterAtIndex & 0xFC00) == 0xD800 && v12 + 1 < [(__CFString *)v11 length])
        {
          int v17 = CFStringGetCharacterAtIndex(v11, v12 + 1);
          if ((v17 & 0xFC00) == 0xDC00) {
            uint64_t v13 = (v17 + (CharacterAtIndex << 10) - 56613888);
          }
          else {
            uint64_t v13 = v13;
          }
          if ((v17 & 0xFC00) == 0xDC00) {
            ++v12;
          }
        }
        else
        {
          uint64_t v13 = CharacterAtIndex;
        }
        v18 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
        unsigned int v19 = [v18 longCharacterIsMember:v13];

        v14 += v19;
        ++v15;
        ++v12;
      }
      while (v12 < [(__CFString *)v11 length]);

      BOOL v20 = v15 == v14;
      uint64_t v7 = v27;
      BOOL v4 = v26;
      if (v20) {
        goto LABEL_29;
      }
    }
    else
    {
    }
    [(TIDPRecorder *)self lexiconPrimaryInputMode];
    if (v4)
    {
      long long v21 = v11;
      [(__CFString *)v21 UTF8String];
      [(__CFString *)v21 length];
      if (!LXLexiconGetTokenIDForUTF8String())
      {
LABEL_25:
        if ([(TIDPRecorder *)self lexiconSecondaryInputMode])
        {
          [(TIDPRecorder *)self lexiconSecondaryInputMode];
          if (v4)
          {
            id v23 = v7;
            [v23 UTF8String];
            [v23 length];
            int TokenIDForUTF8String = LXLexiconGetTokenIDForUTF8String();
          }
          else
          {
            int TokenIDForUTF8String = LXLexiconGetFirstTokenIDForString();
          }
          BOOL v22 = TokenIDForUTF8String == 0;
        }
        else
        {
          BOOL v22 = 1;
        }
        goto LABEL_30;
      }
    }
    else if (!LXLexiconGetFirstTokenIDForString())
    {
      goto LABEL_25;
    }
LABEL_29:
    BOOL v22 = 0;
LABEL_30:

    goto LABEL_31;
  }
  BOOL v22 = 1;
LABEL_31:

  return v22;
}

- (_LXLexicon)lexiconSecondaryInputMode
{
  id v3 = [(TIDPRecorder *)self secondaryInputModeLocaleIdentifier];

  if (!v3) {
    return 0;
  }
  [(NSLock *)self->_secondaryLexiconLock lock];
  if (!self->_lexiconSecondaryInputMode)
  {
    BOOL v4 = [(TIDPRecorder *)self secondaryInputModeLocaleIdentifier];
    self->_lexiconSecondaryInputMode = (_LXLexicon *)_createStaticLexiconForLocaleIdentifier(v4);
  }
  [(NSLock *)self->_secondaryLexiconLock unlock];
  return self->_lexiconSecondaryInputMode;
}

- (_LXLexicon)lexiconPrimaryInputMode
{
  [(NSLock *)self->_primaryLexiconLock lock];
  if (!self->_lexiconPrimaryInputMode)
  {
    id v3 = [(TIDPRecorder *)self primaryInputModeLocaleIndentifier];
    self->_lexiconPrimaryInputMode = (_LXLexicon *)_createStaticLexiconForLocaleIdentifier(v3);
  }
  [(NSLock *)self->_primaryLexiconLock unlock];
  return self->_lexiconPrimaryInputMode;
}

- (NSString)secondaryInputModeLocaleIdentifier
{
  v2 = [(TIDPRecorder *)self typingSession];
  id v3 = [v2 sessionParams];
  BOOL v4 = [v3 activeInputModes];

  if ((unint64_t)[v4 count] < 2)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:1];
    id v6 = [v5 normalizedIdentifier];
  }

  return (NSString *)v6;
}

- (NSString)primaryInputModeLocaleIndentifier
{
  v2 = [(TIDPRecorder *)self typingSession];
  id v3 = [v2 sessionParams];
  BOOL v4 = [v3 activeInputModes];

  uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = [v5 normalizedIdentifier];

  return (NSString *)v6;
}

- (void)setDelegate:(id)a3
{
  BOOL v4 = (TIDPReportingDelegate *)a3;
  [(NSLock *)self->_delegateLock lock];
  delegate = self->_delegate;
  self->_delegate = v4;
  id v6 = v4;

  [(NSLock *)self->_delegateLock unlock];
}

- (TIDPReportingDelegate)delegate
{
  [(NSLock *)self->_delegateLock lock];
  id v3 = self->_delegate;
  [(NSLock *)self->_delegateLock unlock];

  return v3;
}

- (TIDPRecorder)initWithTypingSession:(id)a3 aligned:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TIDPRecorder;
  uint64_t v9 = [(TIDPRecorder *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_typingSession, a3);
    objc_storeStrong((id *)&v10->_typingSessionAligned, a4);
    id v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    delegateLock = v10->_delegateLock;
    v10->_delegateLock = v11;

    uint64_t v13 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    primaryLexiconLock = v10->_primaryLexiconLock;
    v10->_primaryLexiconLock = v13;

    uint64_t v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    secondaryLexiconLock = v10->_secondaryLexiconLock;
    v10->_secondaryLexiconLock = v15;
  }
  return v10;
}

- (void)dealloc
{
  [(NSLock *)self->_primaryLexiconLock lock];
  lexiconPrimaryInputMode = self->_lexiconPrimaryInputMode;
  if (lexiconPrimaryInputMode)
  {
    CFRelease(lexiconPrimaryInputMode);
    self->_lexiconPrimaryInputMode = 0;
  }
  [(NSLock *)self->_primaryLexiconLock unlock];
  [(NSLock *)self->_secondaryLexiconLock lock];
  lexiconSecondaryInputMode = self->_lexiconSecondaryInputMode;
  if (lexiconSecondaryInputMode)
  {
    CFRelease(lexiconSecondaryInputMode);
    self->_lexiconSecondaryInputMode = 0;
  }
  [(NSLock *)self->_secondaryLexiconLock unlock];
  v5.receiver = self;
  v5.super_class = (Class)TIDPRecorder;
  [(TIDPRecorder *)&v5 dealloc];
}

@end