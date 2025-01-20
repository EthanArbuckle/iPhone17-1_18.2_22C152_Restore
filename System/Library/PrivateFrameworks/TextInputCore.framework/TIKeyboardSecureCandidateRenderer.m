@interface TIKeyboardSecureCandidateRenderer
+ (id)allRenderers;
- (CAContext)context;
- (CGImage)imageForSendCurrentLocationWithRenderTraits:(id)a3;
- (NSMutableDictionary)secureCandidateCache;
- (NSString)localeIdentifier;
- (TIKeyboardSecureCandidateRenderer)init;
- (TIKeyboardSecureCandidateRenderer)initWithLocaleIdentifier:(id)a3;
- (__CFArray)arrayOfContexts:(unint64_t)a3 withRenderTraits:(id)a4;
- (__CFArray)imagesFromContexts:(__CFArray *)a3;
- (__CFArray)imagesFromSecureCandidates:(id)a3 withRenderTraits:(id)a4 outAccessibilityLabels:(id *)a5 outWidths:(id)a6;
- (id)_truncationSentinel;
- (id)accessibilityLabelForSlotID:(unsigned int)a3;
- (id)accessibilityLabelsForSecureHeaders:(id)a3 secureContents:(id)a4 truncationSentinel:(id)a5;
- (id)cachedCandidateForSecureCandidate:(id)a3;
- (id)cachedPayloadForSecureCandidateSlotID:(unsigned int)a3;
- (id)initForLocalizedStrings;
- (id)localizedApplicationNameWithBundleIdentifier:(id)a3;
- (id)localizedStringForKey:(id)a3;
- (id)slotIDsFromSecureCandidates:(id)a3 withRenderTraits:(id)a4 outWidths:(id)a5;
- (id)updateCachedCandidate:(id)a3 withCandidateString:(id)a4;
- (id)updateCachedCandidate:(id)a3 withStickerIdentifier:(id)a4;
- (unsigned)slotIDForSendCurrentLocationWithRenderTraits:(id)a3;
- (void)cacheAccessibilityLabel:(id)a3 forSlotID:(unsigned int)a4;
- (void)clearSecureCandidateCache;
- (void)createContext;
- (void)dealloc;
- (void)recreateContext;
- (void)setLocaleIdentifier:(id)a3;
- (void)setSecureCandidateCache:(id)a3;
@end

@implementation TIKeyboardSecureCandidateRenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityLabelCache, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_secureCandidateCache, 0);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setSecureCandidateCache:(id)a3
{
}

- (NSMutableDictionary)secureCandidateCache
{
  return self->_secureCandidateCache;
}

- (CAContext)context
{
  return self->_context;
}

- (id)cachedPayloadForSecureCandidateSlotID:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    v4 = [(TIKeyboardSecureCandidateRenderer *)self secureCandidateCache];
    v5 = [NSNumber numberWithUnsignedInt:v3];
    v6 = [v4 objectForKey:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)updateCachedCandidate:(id)a3 withStickerIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[v7 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setStickerIdentifier:v6];
  }
  objc_msgSend(v8, "setSlotID:", objc_msgSend(v7, "slotID"));
  v9 = [(TIKeyboardSecureCandidateRenderer *)self secureCandidateCache];
  v10 = NSNumber;
  uint64_t v11 = [v7 slotID];

  v12 = [v10 numberWithUnsignedInt:v11];
  [v9 setObject:v8 forKey:v12];

  return v8;
}

- (id)updateCachedCandidate:(id)a3 withCandidateString:(id)a4
{
  id v6 = a4;
  id v7 = [(TIKeyboardSecureCandidateRenderer *)self cachedCandidateForSecureCandidate:a3];
  v8 = [v7 candidateByReplacingWithCandidate:v6];

  objc_msgSend(v8, "setSlotID:", objc_msgSend(v7, "slotID"));
  v9 = [(TIKeyboardSecureCandidateRenderer *)self secureCandidateCache];
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "slotID"));
  [v9 setObject:v8 forKey:v10];

  return v8;
}

- (id)cachedCandidateForSecureCandidate:(id)a3
{
  id v4 = a3;
  if ([v4 slotID])
  {
    v5 = [(TIKeyboardSecureCandidateRenderer *)self secureCandidateCache];
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "slotID"));
    id v7 = [v5 objectForKey:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v9 = [(TIKeyboardSecureCandidateRenderer *)self secureCandidateCache];
      v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "slotID"));
      uint64_t v11 = [v9 objectForKey:v10];

      objc_msgSend(v11, "setSlotID:", objc_msgSend(v4, "slotID"));
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4FAE318];
      v14 = [v4 input];
      uint64_t v11 = objc_msgSend(v13, "secureCandidateForInput:slotID:customInfoType:", v14, objc_msgSend(v4, "slotID"), objc_msgSend(v4, "customInfoType"));
    }
    if (v11) {
      v15 = v11;
    }
    else {
      v15 = v4;
    }
    id v12 = v15;
  }
  else
  {
    id v12 = v4;
  }

  return v12;
}

- (void)clearSecureCandidateCache
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TIKeyboardSecureCandidateRenderer *)self secureCandidateCache];

  if (v3)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = [(TIKeyboardSecureCandidateRenderer *)self secureCandidateCache];
    v5 = [v4 allKeys];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v19;
      v10 = MEMORY[0x1E4F14500];
      *(void *)&long long v7 = 136315394;
      long long v17 = v7;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v5);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = [v12 unsignedIntValue];
            *(_DWORD *)buf = v17;
            v23 = "-[TIKeyboardSecureCandidateRenderer clearSecureCandidateCache]";
            __int16 v24 = 1024;
            int v25 = v13;
            _os_log_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEFAULT, "%s  Deleted slotID %X", buf, 0x12u);
          }
          v14 = [(TIKeyboardSecureCandidateRenderer *)self context];
          objc_msgSend(v14, "deleteSlot:", objc_msgSend(v12, "unsignedIntValue"));

          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v8);
    }

    [(NSMutableDictionary *)self->_accessibilityLabelCache removeAllObjects];
    v15 = [(TIKeyboardSecureCandidateRenderer *)self secureCandidateCache];
    [v15 removeAllObjects];

    v16 = +[TIKeyboardSecureTouchManager sharedInstance];
    [v16 clearRegistrations];
  }
}

- (void)recreateContext
{
  [(TIKeyboardSecureCandidateRenderer *)self clearSecureCandidateCache];

  [(TIKeyboardSecureCandidateRenderer *)self createContext];
}

- (unsigned)slotIDForSendCurrentLocationWithRenderTraits:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TIKeyboardSecureCandidateRenderer *)self context];
  uint64_t v6 = [v5 createSlot];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[TIKeyboardSecureCandidateRenderer slotIDForSendCurrentLocationWithRenderTraits:]";
    __int16 v15 = 1024;
    int v16 = v6;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Created slotID %X", buf, 0x12u);
  }
  long long v7 = [(TIKeyboardSecureCandidateRenderer *)self imageForSendCurrentLocationWithRenderTraits:v4];

  uint64_t v8 = [(TIKeyboardSecureCandidateRenderer *)self localizedStringForKey:@"SEND_CURRENT_LOCATION_BUTTON_ACCESSIBILITY_LABEL"];
  [(TIKeyboardSecureCandidateRenderer *)self cacheAccessibilityLabel:v8 forSlotID:v6];
  uint64_t v9 = [(TIKeyboardSecureCandidateRenderer *)self context];
  [v9 setObject:v7 forSlot:v6];

  CFRelease(v7);
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    v10 = TIOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s TISecureCandidateLogging: send current location slotID = %ud", "-[TIKeyboardSecureCandidateRenderer slotIDForSendCurrentLocationWithRenderTraits:]", v6);
      id v12 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }

  return v6;
}

- (CGImage)imageForSendCurrentLocationWithRenderTraits:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TIKeyboardSecureCandidateRenderer *)self arrayOfContexts:1 withRenderTraits:v4];
  uint64_t v6 = NSString;
  long long v7 = [(TIKeyboardSecureCandidateRenderer *)self localizedStringForKey:@"SEND_CURRENT_LOCATION_BUTTON_CAPTION"];
  id v19 = 0;
  uint64_t v8 = [v6 stringWithValidatedFormat:v7, @"%@", &v19, @"" validFormatSpecifiers error];
  id v9 = v19;
  v10 = &stru_1F3F7A998;
  if (v8) {
    v10 = v8;
  }
  uint64_t v11 = v10;

  if (v9)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    id v12 = TIOSLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      long long v18 = [NSString stringWithFormat:@"%s TISecureCandidateLogging: ERROR: invalid localized format for key SEND_CURRENT_LOCATION_BUTTON_CAPTION: %@", "-[TIKeyboardSecureCandidateRenderer imageForSendCurrentLocationWithRenderTraits:]", v9];
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_debug_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  long long v20 = v11;
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  +[TIKeyboardSecureCandidateTextRendering drawSecureHeaders:&unk_1F3FA7688 secureContents:v13 inContexts:v5 traits:v4 truncationSentinel:0 outWidths:0];

  v14 = [(TIKeyboardSecureCandidateRenderer *)self imagesFromContexts:v5];
  CFRelease(v5);
  ValueAtIndex = CFArrayGetValueAtIndex(v14, 0);
  int v16 = (CGImage *)CFRetain(ValueAtIndex);
  CFRelease(v14);

  return v16;
}

- (id)slotIDsFromSecureCandidates:(id)a3 withRenderTraits:(id)a4 outWidths:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v29 = 0;
  id v26 = a5;
  uint64_t v27 = v9;
  v10 = -[TIKeyboardSecureCandidateRenderer imagesFromSecureCandidates:withRenderTraits:outAccessibilityLabels:outWidths:](self, "imagesFromSecureCandidates:withRenderTraits:outAccessibilityLabels:outWidths:", v8, v9, &v29);
  id v11 = v29;
  unint64_t v12 = [v11 count];
  v28 = v8;
  int v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  unint64_t v14 = 0;
  __int16 v15 = MEMORY[0x1E4F14500];
  while (v14 < CFArrayGetCount(v10))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v10, v14);
    uint64_t v17 = [(TIKeyboardSecureCandidateRenderer *)self context];
    uint64_t v18 = [v17 createSlot];

    if (!v18)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[TIKeyboardSecureCandidateRenderer slotIDsFromSecureCandidates:withRenderTraits:outWidths:]";
        _os_log_impl(&dword_1E3F0E000, v15, OS_LOG_TYPE_DEFAULT, "%s  slotID is 0, recreating remote context", buf, 0xCu);
      }
      [(TIKeyboardSecureCandidateRenderer *)self recreateContext];
      id v19 = [(TIKeyboardSecureCandidateRenderer *)self context];
      uint64_t v18 = [v19 createSlot];

      if (!v18)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v31 = "-[TIKeyboardSecureCandidateRenderer slotIDsFromSecureCandidates:withRenderTraits:outWidths:]";
          _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  slotID is still 0 after recreating remote context", buf, 0xCu);
        }
        break;
      }
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[TIKeyboardSecureCandidateRenderer slotIDsFromSecureCandidates:withRenderTraits:outWidths:]";
      __int16 v32 = 1024;
      int v33 = v18;
      _os_log_impl(&dword_1E3F0E000, v15, OS_LOG_TYPE_DEFAULT, "%s  Created slotID %X", buf, 0x12u);
    }
    if (!v14)
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        long long v20 = TIOSLogFacility();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%s TISecureCandidateLogging: proactive candidate first slotID = %ud", "-[TIKeyboardSecureCandidateRenderer slotIDsFromSecureCandidates:withRenderTraits:outWidths:]", v18);
          int v25 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v25;
          _os_log_debug_impl(&dword_1E3F0E000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    long long v21 = [(TIKeyboardSecureCandidateRenderer *)self context];
    [v21 setObject:ValueAtIndex forSlot:v18];

    v22 = [NSNumber numberWithUnsignedInt:v18];
    [v13 addObject:v22];

    if (v11)
    {
      if (v14 < v12)
      {
        uint64_t v23 = [v11 objectAtIndex:v14];
        [(TIKeyboardSecureCandidateRenderer *)self cacheAccessibilityLabel:v23 forSlotID:v18];
      }
    }
    ++v14;
  }
  CFRelease(v10);

  return v13;
}

- (id)localizedApplicationNameWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getLSApplicationProxyClass_softClass;
    uint64_t v13 = getLSApplicationProxyClass_softClass;
    if (!getLSApplicationProxyClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getLSApplicationProxyClass_block_invoke;
      v9[3] = &unk_1E6E2E248;
      v9[4] = &v10;
      __getLSApplicationProxyClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    uint64_t v6 = [v5 applicationProxyForIdentifier:v3];
    long long v7 = [v6 localizedName];
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

- (id)accessibilityLabelForSlotID:(unsigned int)a3
{
  accessibilityLabelCache = self->_accessibilityLabelCache;
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v5 = [(NSMutableDictionary *)accessibilityLabelCache objectForKey:v4];

  return v5;
}

- (void)cacheAccessibilityLabel:(id)a3 forSlotID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  accessibilityLabelCache = self->_accessibilityLabelCache;
  if (!accessibilityLabelCache)
  {
    long long v7 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    id v8 = self->_accessibilityLabelCache;
    self->_accessibilityLabelCache = v7;

    accessibilityLabelCache = self->_accessibilityLabelCache;
  }
  id v9 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)accessibilityLabelCache setObject:v10 forKey:v9];
}

- (id)accessibilityLabelsForSecureHeaders:(id)a3 secureContents:(id)a4 truncationSentinel:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  if ([v7 count])
  {
    unint64_t v11 = 0;
    id v27 = v9;
    do
    {
      uint64_t v12 = [v7 objectAtIndex:v11];
      uint64_t v13 = v12;
      if (v9)
      {
        uint64_t v14 = [v12 stringByReplacingOccurrencesOfString:v9 withString:&stru_1F3F7A998];

        uint64_t v13 = (void *)v14;
      }
      __int16 v15 = [v8 objectAtIndex:v11];
      if ([v13 length] && objc_msgSend(v15, "length"))
      {
        int v16 = v10;
        id v17 = v8;
        uint64_t v18 = [(TIKeyboardSecureCandidateRenderer *)self localizedStringForKey:@"PROACTIVE_CANDIDATE_ACCESSIBILITY_LABEL"];
        id v29 = 0;
        id v19 = [NSString stringWithValidatedFormat:v18, @"%@%@", &v29, v13, v15 validFormatSpecifiers error];
        id v20 = v29;
        long long v21 = &stru_1F3F7A998;
        if (v19) {
          long long v21 = v19;
        }
        v22 = v21;

        if (v20)
        {
          if (TICanLogMessageAtLevel_onceToken != -1) {
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
          }
          uint64_t v23 = TIOSLogFacility();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            id v26 = [NSString stringWithFormat:@"%s TISecureCandidateLogging: ERROR: invalid localized format for key PROACTIVE_CANDIDATE_ACCESSIBILITY_LABEL: %@", "-[TIKeyboardSecureCandidateRenderer accessibilityLabelsForSecureHeaders:secureContents:truncationSentinel:]", v20];
            *(_DWORD *)buf = 138412290;
            v31 = v26;
            _os_log_debug_impl(&dword_1E3F0E000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }

        id v8 = v17;
        id v10 = v16;
        id v9 = v27;
        goto LABEL_21;
      }
      if ([v13 length])
      {
        __int16 v24 = v13;
      }
      else
      {
        if (![v15 length])
        {
          v22 = &stru_1F3F7A998;
          goto LABEL_21;
        }
        __int16 v24 = v15;
      }
      v22 = v24;
LABEL_21:
      [v10 addObject:v22];

      ++v11;
    }
    while (v11 < [v7 count]);
  }

  return v10;
}

- (__CFArray)imagesFromSecureCandidates:(id)a3 withRenderTraits:(id)a4 outAccessibilityLabels:(id *)a5 outWidths:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    uint64_t v12 = self;
    uint64_t v13 = TIOSLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v31 = NSString;
      uint64_t v32 = [v9 count];
      [v10 singleCellWidth];
      uint64_t v34 = v33;
      [v10 singleCellHeight];
      v36 = [v31 stringWithFormat:@"%s DEBUG:ProactiveQuickType:TI: Secure rendering %lu items (width: %f, height: %f)", "-[TIKeyboardSecureCandidateRenderer imagesFromSecureCandidates:withRenderTraits:outAccessibilityLabels:outWidths:]", v32, v34, v35];
      *(_DWORD *)buf = 138412290;
      v48 = v36;
      _os_log_debug_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    self = v12;
  }
  v39 = v11;
  if ([v9 count])
  {
    uint64_t v14 = [v9 objectAtIndex:0];
    v37 = [v14 truncationSentinel];
  }
  else
  {
    v37 = 0;
  }
  v38 = self;
  v41 = v10;
  __int16 v15 = -[TIKeyboardSecureCandidateRenderer arrayOfContexts:withRenderTraits:](self, "arrayOfContexts:withRenderTraits:", [v9 count], v10);
  int v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  id v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v43 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v24 = [v23 secureHeader];
        if (v24)
        {
          int v25 = (void *)v24;
          id v26 = [v23 secureContent];

          if (v26)
          {
            id v27 = [v23 secureHeader];
            [v16 addObject:v27];

            v28 = [v23 secureContent];
            [v17 addObject:v28];
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v20);
  }

  +[TIKeyboardSecureCandidateTextRendering drawSecureHeaders:v16 secureContents:v17 inContexts:v15 traits:v41 truncationSentinel:v37 outWidths:v39];
  id v29 = [(TIKeyboardSecureCandidateRenderer *)v38 imagesFromContexts:v15];
  CFRelease(v15);
  if (a5)
  {
    *a5 = [(TIKeyboardSecureCandidateRenderer *)v38 accessibilityLabelsForSecureHeaders:v16 secureContents:v17 truncationSentinel:v37];
  }

  return v29;
}

- (id)_truncationSentinel
{
  __buf[2] = *MEMORY[0x1E4F143B8];
  __buf[0] = 0;
  __buf[1] = 0;
  arc4random_buf(__buf, 0x10uLL);
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:__buf];
  id v3 = NSString;
  uint64_t v4 = [v2 UUIDString];
  id v5 = [v3 stringWithFormat:@"*%@*", v4];

  return v5;
}

- (__CFArray)imagesFromContexts:(__CFArray *)a3
{
  CFIndex Count = CFArrayGetCount(a3);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E4F1D510]);
  for (unint64_t i = 0; i < CFArrayGetCount(a3); ++i)
  {
    ValueAtIndex = (CGContext *)CFArrayGetValueAtIndex(a3, i);
    CGImageRef Image = CGBitmapContextCreateImage(ValueAtIndex);
    CFArrayAppendValue(Mutable, Image);
    CGImageRelease(Image);
  }
  return Mutable;
}

- (__CFArray)arrayOfContexts:(unint64_t)a3 withRenderTraits:(id)a4
{
  id v5 = a4;
  if (arrayOfContexts_withRenderTraits__onceToken != -1) {
    dispatch_once(&arrayOfContexts_withRenderTraits__onceToken, &__block_literal_global_425);
  }
  Mutable = CFArrayCreateMutable(0, a3, MEMORY[0x1E4F1D510]);
  if (a3)
  {
    if ([v5 maxCellCount] >= 1)
    {
      unint64_t v7 = [v5 maxCellCount];
      if (v7 < a3) {
        a3 = v7;
      }
    }
    unint64_t v8 = a3;
    if ([v5 sharedCellCount]) {
      unint64_t v8 = [v5 sharedCellCount] + a3;
    }
    id v9 = [v5 resultCountToSingleCellWidth];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      id v11 = [v5 resultCountToSingleCellWidth];
      unint64_t v12 = [v11 count];

      uint64_t v13 = [v5 resultCountToSingleCellWidth];
      uint64_t v14 = v13;
      if (v12 <= a3) {
        [v13 lastObject];
      }
      else {
      __int16 v15 = [v13 objectAtIndexedSubscript:a3];
      }
    }
    else
    {
      if ([v5 cellRenderingStyle])
      {
        if (v8 == 1)
        {
          int v16 = [v5 cellWidthOptions];
          uint64_t v14 = v16;
          id v17 = (void *)MEMORY[0x1E4FAE958];
        }
        else if (v8 == 2)
        {
          int v16 = [v5 cellWidthOptions];
          uint64_t v14 = v16;
          id v17 = (void *)MEMORY[0x1E4FAE980];
        }
        else
        {
          int v16 = [v5 cellWidthOptions];
          uint64_t v14 = v16;
          if (v8 == 3) {
            id v17 = (void *)MEMORY[0x1E4FAE970];
          }
          else {
            id v17 = (void *)MEMORY[0x1E4FAE990];
          }
        }
      }
      else if (v8 == 1)
      {
        int v16 = [v5 cellWidthOptions];
        uint64_t v14 = v16;
        id v17 = (void *)MEMORY[0x1E4FAE960];
      }
      else
      {
        int v16 = [v5 cellWidthOptions];
        uint64_t v14 = v16;
        if (v8 == 2) {
          id v17 = (void *)MEMORY[0x1E4FAE988];
        }
        else {
          id v17 = (void *)MEMORY[0x1E4FAE978];
        }
      }
      __int16 v15 = [v16 objectForKey:*v17];
    }
    id v18 = v15;
    [v15 doubleValue];
    double v20 = v19;

    for (; a3; --a3)
    {
      [v5 screenScale];
      size_t v22 = (unint64_t)fmax(ceil(v20 * v21), 1.0);
      [v5 singleCellHeight];
      double v24 = v23;
      [v5 screenScale];
      id v26 = CGBitmapContextCreate(0, v22, (unint64_t)fmax(ceil(v24 * v25), 1.0), 8uLL, 0, (CGColorSpaceRef)arrayOfContexts_withRenderTraits__colorSpace, 2u);
      [v5 screenScale];
      CGFloat v28 = v27;
      [v5 screenScale];
      CGContextScaleCTM(v26, v28, v29);
      CFArrayAppendValue(Mutable, v26);
      CGContextRelease(v26);
    }
  }

  return Mutable;
}

CGColorSpaceRef __70__TIKeyboardSecureCandidateRenderer_arrayOfContexts_withRenderTraits___block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  arrayOfContexts_withRenderTraits__colorSpace = (uint64_t)result;
  return result;
}

- (id)localizedStringForKey:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  uint64_t v6 = [v4 preferredLocalizations];
  unint64_t v7 = (void *)MEMORY[0x1E4F28B50];
  v15[0] = v5;
  unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v9 = [v7 preferredLocalizationsFromArray:v6 forPreferences:v8];

  uint64_t v10 = [v9 firstObject];
  id v11 = [v4 localizedStringForKey:v3 value:0 table:@"SecureCandidate" localization:v10];
  if ([v11 isEqual:v3])
  {
    id v12 = [v4 localizedStringForKey:v3 value:&stru_1F3F7A998 table:@"SecureCandidate"];
  }
  else
  {
    id v12 = v11;
  }
  uint64_t v13 = v12;

  return v13;
}

- (void)setLocaleIdentifier:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_localeIdentifier] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_localeIdentifier, a3);
    [(TIKeyboardSecureCandidateRenderer *)self clearSecureCandidateCache];
  }
}

- (void)createContext
{
  v11[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  uint64_t v4 = *MEMORY[0x1E4F39E68];
  v10[0] = *MEMORY[0x1E4F39E80];
  v10[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1CFC8];
  v11[0] = v3;
  v11[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F39E78];
  v10[2] = *MEMORY[0x1E4F39E70];
  v10[3] = v6;
  v11[2] = v3;
  v11[3] = v3;
  v10[4] = *MEMORY[0x1E4F39E50];
  v11[4] = v3;
  unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  unint64_t v8 = [MEMORY[0x1E4F39B58] remoteContextWithOptions:v7];
  context = self->_context;
  self->_context = v8;
}

- (void)dealloc
{
  id v3 = (id)__allSecureRenderers;
  objc_sync_enter(v3);
  [(id)__allSecureRenderers removeObject:self];
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardSecureCandidateRenderer;
  [(TIKeyboardSecureCandidateRenderer *)&v4 dealloc];
}

- (TIKeyboardSecureCandidateRenderer)initWithLocaleIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardSecureCandidateRenderer;
  uint64_t v6 = [(TIKeyboardSecureCandidateRenderer *)&v14 init];
  unint64_t v7 = v6;
  if (v6)
  {
    [(TIKeyboardSecureCandidateRenderer *)v6 createContext];
    unint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    secureCandidateCache = v7->_secureCandidateCache;
    v7->_secureCandidateCache = v8;

    objc_storeStrong((id *)&v7->_localeIdentifier, a3);
    id v10 = (id)__allSecureRenderers;
    objc_sync_enter(v10);
    if (__allSecureRenderers)
    {
      [(id)__allSecureRenderers addObject:v7];
    }
    else
    {
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v7, 0);
      id v12 = (void *)__allSecureRenderers;
      __allSecureRenderers = v11;
    }
    objc_sync_exit(v10);
  }
  return v7;
}

- (id)initForLocalizedStrings
{
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardSecureCandidateRenderer;
  v2 = [(TIKeyboardSecureCandidateRenderer *)&v7 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v4 = [v3 localeIdentifier];
    localeIdentifier = v2->_localeIdentifier;
    v2->_localeIdentifier = (NSString *)v4;
  }
  return v2;
}

- (TIKeyboardSecureCandidateRenderer)init
{
  id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v4 = [v3 localeIdentifier];
  id v5 = [(TIKeyboardSecureCandidateRenderer *)self initWithLocaleIdentifier:v4];

  return v5;
}

+ (id)allRenderers
{
  id v2 = (id)__allSecureRenderers;
  objc_sync_enter(v2);
  id v3 = (void *)[(id)__allSecureRenderers copy];
  objc_sync_exit(v2);

  return v3;
}

@end