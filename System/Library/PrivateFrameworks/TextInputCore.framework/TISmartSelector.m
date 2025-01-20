@interface TISmartSelector
- (NLTagger)namedEntityTagger;
- (NSLocale)locale;
- (NSString)language;
- (OS_dispatch_queue)dispatchQueue;
- (TISmartSelector)initWithOptions:(unint64_t)a3 language:(id)a4 dataChangedHandler:(id)a5;
- (TITransientLexiconManager)transientLexiconManager;
- (_NSRange)longestRangeEncapsulatingSubstringInDocument:(id)a3 containingRange:(_NSRange)a4 tokenizedRanges:(id)a5 meetingCondition:(id)a6;
- (_NSRange)selectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 options:(unint64_t)a6;
- (_NSRange)selectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7;
- (id).cxx_construct;
- (id)dataChangedHandler;
- (unint64_t)options;
- (void)dealloc;
- (void)loadStaticPhraseDictionary;
- (void)setDataChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLocale:(id)a3;
- (void)setNamedEntityTagger:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setTransientLexiconManager:(id)a3;
@end

@implementation TISmartSelector

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_namedEntityTagger, 0);
  objc_storeStrong((id *)&self->_transientLexiconManager, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong(&self->_contactObserver, 0);

  std::unique_ptr<KB::StaticDictionary>::reset[abi:nn180100]((const void ****)&self->_staticDictionary, 0);
}

- (void)setDataChangedHandler:(id)a3
{
}

- (id)dataChangedHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNamedEntityTagger:(id)a3
{
}

- (NLTagger)namedEntityTagger
{
  return (NLTagger *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTransientLexiconManager:(id)a3
{
}

- (TITransientLexiconManager)transientLexiconManager
{
  return (TITransientLexiconManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (_NSRange)selectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 options:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v11 = (__CFString *)a3;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F1CA48] array];
  CFIndex v14 = [(__CFString *)v11 length];
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFLocaleRef v16 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v12];
  v27.NSUInteger location = 0;
  v27.NSUInteger length = v14;
  CFStringTokenizerRef v17 = CFStringTokenizerCreate(v15, v11, v27, 0, v16);
  if (v17)
  {
    v18 = v17;
    while (CFStringTokenizerAdvanceToNextToken(v18))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v18);
      v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      [v13 addObject:v20];
    }
    CFRelease(v18);
    uint64_t v21 = -[TISmartSelector selectionRangeForTextInDocument:inRange:language:tokenizedRanges:options:](self, "selectionRangeForTextInDocument:inRange:language:tokenizedRanges:options:", v11, location, length, v12, v13, a6);
    NSUInteger v23 = v22;
  }
  else
  {
    NSUInteger v23 = 0;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v24 = v21;
  NSUInteger v25 = v23;
  result.NSUInteger length = v25;
  result.NSUInteger location = v24;
  return result;
}

- (void)loadStaticPhraseDictionary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(NSLocale *)self->_locale localeIdentifier];
  KB::utf8_string(v3, (uint64_t)v8);
  v4 = [(NSLocale *)self->_locale localeIdentifier];
  v5 = +[TIInputMode inputModeWithIdentifier:v4];
  UIKeyboardPhraseLexiconPathForInputMode(v5);
  v6 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v6, (uint64_t)&v9);
  int v10 = 0x100000;
  __int16 v11 = 0;
  char v12 = 0;
  v13 = 0;
  char v14 = 0;
  int v15 = 0x100000;
  __int16 v16 = 0;
  char v17 = 0;
  v18 = 0;
  char v19 = 0;
  int v20 = 0x100000;
  __int16 v21 = 0;
  char v22 = 0;
  NSUInteger v23 = 0;
  char v24 = 0;
  int v25 = 1;
  char v26 = 0;
  int v27 = 1065353216;

  KB::StaticDictionary::create(v7);
}

uint64_t __45__TISmartSelector_loadStaticPhraseDictionary__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
}

- (_NSRange)longestRangeEncapsulatingSubstringInDocument:(id)a3 containingRange:(_NSRange)a4 tokenizedRanges:(id)a5 meetingCondition:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v30 = a3;
  id v10 = a5;
  __int16 v11 = (char *)a6;
  uint64_t v28 = (uint64_t (**)(void, void))v11;
  NSUInteger v12 = 0;
  if ([v10 count])
  {
    unint64_t v13 = 0;
    int v27 = v11 + 16;
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      char v14 = objc_msgSend(v10, "objectAtIndexedSubscript:", v13, v27);
      NSUInteger v15 = [v14 rangeValue];

      if (v13 < [v10 count])
      {
        unint64_t v16 = v13;
        do
        {
          char v17 = [v10 objectAtIndexedSubscript:v16];
          uint64_t v18 = [v17 rangeValue];
          uint64_t v20 = v19;

          NSUInteger v21 = v20 - v15 + v18;
          v31.NSUInteger location = v15;
          v31.NSUInteger length = v21;
          v33.NSUInteger location = location;
          v33.NSUInteger length = length;
          if (v21 >= NSUnionRange(v31, v33).length)
          {
            char v22 = objc_msgSend(v30, "substringWithRange:", v15, v20 - v15 + v18);
            if (v12 < v21)
            {
              int v23 = ((uint64_t (**)(void, void *))v28)[2](v28, v22);
              if (v23) {
                NSUInteger v12 = v21;
              }
              uint64_t v24 = v29;
              if (v23) {
                uint64_t v24 = v15;
              }
              uint64_t v29 = v24;
            }
          }
          ++v16;
        }
        while (v16 < [v10 count]);
      }
      ++v13;
    }
    while (v13 < [v10 count]);
  }
  else
  {
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v25 = v29;
  NSUInteger v26 = v12;
  result.NSUInteger length = v26;
  result.NSUInteger location = v25;
  return result;
}

- (_NSRange)selectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v104[5] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  unint64_t v16 = [v13 length];
  v105.NSUInteger location = 0;
  v105.NSUInteger length = v16;
  v107.NSUInteger location = location;
  v107.NSUInteger length = length;
  if (v16 >= NSUnionRange(v105, v107).length)
  {
    v60 = v14;
    uint64_t v95 = 0;
    v96 = &v95;
    uint64_t v97 = 0x4012000000;
    v98 = __Block_byref_object_copy__3193;
    v99 = __Block_byref_object_dispose__3194;
    v100 = "";
    long long v101 = xmmword_1E4154B50;
    char v17 = dispatch_semaphore_create(0);
    id v59 = v15;
    dsema = v17;
    if ((a7 & self->_options & 0x1FLL) != 0)
    {
      uint64_t v18 = v17;
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F5F160]) initWithScannerType:0 passiveIntent:1];
      [v19 setResultsOptions:1601];
      uint64_t v20 = (void *)MEMORY[0x1E4F5F158];
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke;
      v89[3] = &unk_1E6E2A3B8;
      NSUInteger v92 = location;
      NSUInteger v93 = length;
      unint64_t v94 = a7;
      v89[4] = self;
      v91 = &v95;
      v90 = v18;
      objc_msgSend(v20, "scanString:range:configuration:completionBlock:", v13, 0, v16, v19, v89);

      id v15 = v59;
    }
    else
    {
      dispatch_semaphore_signal(v17);
    }
    unint64_t options = self->_options;
    if ((a7 & options & 0x20) != 0)
    {
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_2;
      v88[3] = &unk_1E6E2BBC0;
      v88[4] = self;
      uint64_t v54 = -[TISmartSelector longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:](self, "longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:", v13, location, length, v15, v88);
      uint64_t v55 = v22;
      unint64_t options = self->_options;
    }
    else
    {
      uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v55 = 0;
    }
    if ((a7 & options & 0x40) != 0)
    {
      int v23 = [(NSLocale *)self->_locale localeIdentifier];
      char v24 = [v60 isEqualToString:v23];

      if ((v24 & 1) == 0) {
        [(TISmartSelector *)self setLanguage:v60];
      }
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_3;
      v87[3] = &unk_1E6E2BBC0;
      v87[4] = self;
      id v15 = v59;
      uint64_t v56 = -[TISmartSelector longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:](self, "longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:", v13, location, length, v59, v87);
      uint64_t v57 = v25;
      unint64_t options = self->_options;
    }
    else
    {
      uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v57 = 0;
    }
    if ((a7 & options & 0x80) != 0)
    {
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_4;
      v86[3] = &unk_1E6E2BBC0;
      v86[4] = self;
      uint64_t v53 = -[TISmartSelector longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:](self, "longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:", v13, location, length, v15, v86);
      uint64_t v27 = v26;
    }
    else
    {
      uint64_t v27 = 0;
      uint64_t v53 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x4012000000;
    v82 = __Block_byref_object_copy__3193;
    v83 = __Block_byref_object_dispose__3194;
    v84 = "";
    long long v85 = xmmword_1E4154B50;
    uint64_t v28 = dispatch_semaphore_create(0);
    uint64_t v29 = v28;
    if ((a7 & self->_options & 0x100) != 0)
    {
      id v30 = [(NSLocale *)self->_locale localeIdentifier];
      char v31 = [v60 isEqualToString:v30];

      if ((v31 & 1) == 0) {
        [(TISmartSelector *)self setLanguage:v60];
      }
      id v32 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      NSRange v33 = objc_msgSend(v32, "initWithObjects:", *MEMORY[0x1E4F38820], *MEMORY[0x1E4F38828], *MEMORY[0x1E4F38800], 0);
      uint64_t v66 = MEMORY[0x1E4F143A8];
      uint64_t v67 = 3221225472;
      v68 = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_5;
      v69 = &unk_1E6E2A408;
      v70 = self;
      unint64_t v76 = v16;
      NSUInteger v77 = location;
      NSUInteger v78 = length;
      id v71 = v13;
      id v72 = v33;
      v74 = &v79;
      uint64_t v75 = 0;
      v73 = v29;
      id v34 = v33;
      TIDispatchAsync();
    }
    else
    {
      dispatch_semaphore_signal(v28);
    }
    dispatch_time_t v35 = dispatch_time(0, 3000000000);
    intptr_t v36 = dispatch_semaphore_wait(dsema, v35);
    intptr_t v37 = dispatch_semaphore_wait(v29, v35);
    if (v36) {
      *((_OWORD *)v96 + 3) = xmmword_1E4154B50;
    }
    if (v37) {
      *((_OWORD *)v80 + 3) = xmmword_1E4154B50;
    }
    *(void *)&long long v102 = location;
    *((void *)&v102 + 1) = length;
    v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v96[6], v96[7]);
    v104[0] = v38;
    v39 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v54, v55);
    v104[1] = v39;
    v40 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v56, v57);
    v104[2] = v40;
    v41 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v53, v27);
    v104[3] = v41;
    v42 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v80[6], v80[7]);
    v104[4] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:5];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v44 = v43;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v62 objects:v103 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v63 != v47) {
            objc_enumerationMutation(v44);
          }
          v61[0] = [*(id *)(*((void *)&v62 + 1) + 8 * i) rangeValue];
          v61[1] = v49;
          if (*((void *)&v102 + 1) >= v49) {
            v50 = &v102;
          }
          else {
            v50 = (long long *)v61;
          }
          long long v102 = *v50;
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v62 objects:v103 count:16];
      }
      while (v46);
      NSUInteger length = *((void *)&v102 + 1);
      NSUInteger location = v102;
    }

    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(&v95, 8);
    id v15 = v59;
    id v14 = v60;
  }

  NSUInteger v51 = location;
  NSUInteger v52 = length;
  result.NSUInteger length = v52;
  result.NSUInteger location = v51;
  return result;
}

void __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "coreResult", (void)v13);
        v19.NSUInteger location = DDResultGetRangeForURLification();
        NSUInteger location = v19.location;
        NSUInteger length = v19.length;
        if (v19.length >= NSUnionRange(v19, *(NSRange *)(a1 + 56)).length)
        {
          if ((char Category = DDResultGetCategory(),
                uint64_t v11 = *(void *)(a1 + 72) & *(void *)(*(void *)(a1 + 32) + 32),
                (v11 & 8) != 0)
            && (Category & 1) != 0
            || (v11 & 4) != 0 && (Category & 2) != 0
            || (v11 & 2) != 0 && (Category & 3) != 0
            || (v11 & 1) != 0 && (Category & 4) != 0
            || (v11 & 0x10) != 0 && (Category & 6) != 0)
          {
            uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
            *(void *)(v12 + 48) = location;
            *(void *)(v12 + 56) = length;
            goto LABEL_21;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = a2;
  [v2 namedEntityPhraseLexicon];
  LODWORD(v2) = LXLexiconGetFirstTokenIDForString();

  return v2 != 0;
}

BOOL __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_3(uint64_t a1, KB *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *(KB::StaticDictionary **)(*(void *)(a1 + 32) + 8);
  KB::utf8_string(a2, (uint64_t)v6);
  BOOL v3 = KB::StaticDictionary::contains(v2, (const KB::String *)v6, 0, 0.0);
  if (v7) {
    BOOL v4 = v6[6] == 1;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    free(v7);
  }
  return v3;
}

BOOL __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_4()
{
  return LXLexiconGetFirstTokenIDForString() != 0;
}

void __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setString:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 56);
  BOOL v4 = [*(id *)(v2 + 40) languageCode];
  objc_msgSend(v3, "setLanguage:range:", v4, *(void *)(a1 + 72), *(void *)(a1 + 80));

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *MEMORY[0x1E4F38868];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_6;
  v11[3] = &unk_1E6E2A3E0;
  long long v14 = *(_OWORD *)(a1 + 88);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 64);
  id v12 = v9;
  uint64_t v13 = v10;
  objc_msgSend(v5, "enumerateTagsInRange:unit:scheme:options:usingBlock:", v6, v7, 0, v8, 30, v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_6(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, unsigned char *a5)
{
  id v10 = a2;
  v12.NSUInteger location = a3;
  v12.NSUInteger length = a4;
  if (a4 == NSUnionRange(v12, *(NSRange *)(a1 + 48)).length
    && [*(id *)(a1 + 32) containsObject:v10])
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v9 + 48) = a3;
    *(void *)(v9 + 56) = a4;
    *a5 = 1;
  }
}

- (NSString)language
{
  return [(NSLocale *)self->_locale localeIdentifier];
}

- (void)setLanguage:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  locale = self->_locale;
  self->_locale = v4;

  [(TISmartSelector *)self loadStaticPhraseDictionary];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TIPersonalizationContactOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s TISmartSelector:dealloc - removing observer", "-[TISmartSelector dealloc]");
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  [(TITransientLexiconManager *)self->_transientLexiconManager removeContactObserver:self->_contactObserver];
  contactDictionary = self->_contactDictionary;
  if (contactDictionary) {
    CFRelease(contactDictionary);
  }
  v6.receiver = self;
  v6.super_class = (Class)TISmartSelector;
  [(TISmartSelector *)&v6 dealloc];
}

- (TISmartSelector)initWithOptions:(unint64_t)a3 language:(id)a4 dataChangedHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v35.receiver = self;
  v35.super_class = (Class)TISmartSelector;
  id v10 = [(TISmartSelector *)&v35 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_unint64_t options = a3;
    uint64_t v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v8];
    locale = v11->_locale;
    v11->_locale = (NSLocale *)v12;

    long long v14 = _Block_copy(v9);
    id dataChangedHandler = v11->_dataChangedHandler;
    v11->_id dataChangedHandler = v14;

    long long v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.TextInput.smart_selection", v16);
    dispatchQueue = v11->_dispatchQueue;
    v11->_dispatchQueue = (OS_dispatch_queue *)v17;

    unint64_t options = v11->_options;
    if ((options & 0x40) != 0)
    {
      [(TISmartSelector *)v11 loadStaticPhraseDictionary];
      unint64_t options = v11->_options;
    }
    if ((options & 0xA0) != 0)
    {
      uint64_t v20 = +[TITransientLexiconManager sharedInstance];
      transientLexiconManager = v11->_transientLexiconManager;
      v11->_transientLexiconManager = (TITransientLexiconManager *)v20;

      unint64_t options = v11->_options;
    }
    if ((options & 0x80) != 0)
    {
      objc_initWeak(&location, v11);
      uint64_t v22 = TIPersonalizationContactOSLogFacility();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s TISmartSelector:initWithOptions - adding observer", "-[TISmartSelector initWithOptions:language:dataChangedHandler:]");
        *(_DWORD *)buf = 138412290;
        v38 = v23;
        _os_log_impl(&dword_1E3F0E000, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
      char v24 = v11->_transientLexiconManager;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __63__TISmartSelector_initWithOptions_language_dataChangedHandler___block_invoke;
      v32[3] = &unk_1E6E2CD10;
      objc_copyWeak(&v33, &location);
      uint64_t v25 = [(TITransientLexiconManager *)v24 addContactObserver:v32];
      id contactObserver = v11->_contactObserver;
      v11->_id contactObserver = (id)v25;

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      unint64_t options = v11->_options;
    }
    if ((options & 0x100) != 0)
    {
      id v27 = objc_alloc(MEMORY[0x1E4F388F0]);
      uint64_t v36 = *MEMORY[0x1E4F38868];
      uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      uint64_t v29 = [v27 initWithTagSchemes:v28];
      namedEntityTagger = v11->_namedEntityTagger;
      v11->_namedEntityTagger = (NLTagger *)v29;
    }
  }

  return v11;
}

void __63__TISmartSelector_initWithOptions_language_dataChangedHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = TIPersonalizationContactOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s TISmartSelector:initWithOptions - processing %lu contacts", "-[TISmartSelector initWithOptions:language:dataChangedHandler:]_block_invoke", objc_msgSend(v3, "count"));
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  objc_super v6 = (void *)nameVariationsForContactCollection(v3);
  objc_copyWeak(v7, (id *)(a1 + 32));
  v7[1] = v6;
  TIDispatchAsync();
  objc_destroyWeak(v7);
}

uint64_t __63__TISmartSelector_initWithOptions_language_dataChangedHandler___block_invoke_38(uint64_t a1)
{
  WeakRetained = (const void **)objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void (**)(void))_Block_copy(WeakRetained[9]);
    BOOL v4 = v9;
    uint64_t v5 = v3;
    objc_super v6 = v9[2];
    if (v6)
    {
      CFRelease(v6);
      BOOL v4 = v9;
    }
    v4[2] = *(const void **)(a1 + 40);
    if (v5) {
      v5[2](v5);
    }
  }
  else
  {
    uint64_t v7 = *(const void **)(a1 + 40);
    if (v7) {
      CFRelease(v7);
    }
  }

  return MEMORY[0x1F41817F8]();
}

@end