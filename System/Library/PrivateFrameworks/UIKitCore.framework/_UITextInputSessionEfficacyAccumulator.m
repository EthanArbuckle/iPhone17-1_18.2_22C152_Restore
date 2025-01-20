@interface _UITextInputSessionEfficacyAccumulator
+ (id)accumulatorWithName:(id)a3;
+ (id)getOrInitializeArrayFromArray:(id)a3 forKey:(unint64_t)a4 initCapacity:(unint64_t)a5;
+ (id)getOrInitializeArrayFromDictionary:(id)a3 forKey:(id)a4 initCapacity:(unint64_t)a5;
+ (id)getOrInitializeDictionaryFrom:(id)a3 forKey:(unint64_t)a4 initCapacity:(int64_t)a5;
- (BOOL)isPrimaryInput:(int64_t)a3;
- (NSDictionary)keyboardTrialParameters;
- (NSString)name;
- (_UITextInputSessionEfficacyAccumulator)init;
- (id)cleanIdForPublishing:(id)a3;
- (id)computeSessionActionsStringOnSession:(id)a3;
- (id)generateSessionErrorStringFromSet:(id)a3;
- (void)enumerateTextInputActionsAnalytics:(id)a3;
- (void)increaseCountForAppBundleId:(id)a3 forSource:(int64_t)a4 forActionType:(int64_t)a5 forFlagOptions:(int64_t)a6 forInputModeKey:(id)a7 byAccumulatorEntry:(id)a8;
- (void)increaseWithAction:(id)a3;
- (void)logErrorCodeIfNotNil:(id)a3;
- (void)reset;
- (void)setKeyboardTrialParameters:(id)a3;
@end

@implementation _UITextInputSessionEfficacyAccumulator

- (_UITextInputSessionEfficacyAccumulator)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UITextInputSessionEfficacyAccumulator;
  v2 = [(_UITextInputSessionEfficacyAccumulator *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    entries = v2->_entries;
    v2->_entries = (NSMutableDictionary *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    sessionErrors = v2->_sessionErrors;
    v2->_sessionErrors = v5;

    v7 = UITextInputSessionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_debug_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] Initialized accumulator", v9, 2u);
    }
  }
  return v2;
}

+ (id)accumulatorWithName:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v3 copy];

  v6 = (void *)v4[15];
  v4[15] = v5;

  [v4 reset];
  return v4;
}

- (void)logErrorCodeIfNotNil:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    if ([v4 length] == 1)
    {
      id v5 = v7;
    }
    else
    {
      uint64_t v6 = [@"E" stringByAppendingString:v7];

      id v5 = (id)v6;
    }
    id v8 = v5;
    -[NSMutableSet addObject:](self->_sessionErrors, "addObject:");
  }
}

+ (id)getOrInitializeArrayFromDictionary:(id)a3 forKey:(id)a4 initCapacity:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 valueForKey:v8];
  if (!v9)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5];
    if (a5)
    {
      unint64_t v10 = a5;
      do
      {
        v11 = [MEMORY[0x1E4F1CA98] null];
        [v9 addObject:v11];

        --v10;
      }
      while (v10);
    }
    [v7 setObject:v9 forKey:v8];
    v12 = UITextInputSessionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134218240;
      id v15 = v8;
      __int16 v16 = 2048;
      unint64_t v17 = a5;
      _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] New key found - initializing new array for key \"%lu\" with capacity %lu", (uint8_t *)&v14, 0x16u);
    }
  }
  return v9;
}

+ (id)getOrInitializeArrayFromArray:(id)a3 forKey:(unint64_t)a4 initCapacity:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ([v9 count] <= a4)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"UITextInputSessionEfficacyAccumulator.m", 243, @"Attempt to access index %lu, which is out of bounds for array with capacity %lu", a4, objc_msgSend(v9, "count") object file lineNumber description];
  }
  unint64_t v10 = [v9 objectAtIndexedSubscript:a4];
  v11 = [MEMORY[0x1E4F1CA98] null];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5];
    if (a5)
    {
      unint64_t v14 = a5;
      do
      {
        id v15 = [MEMORY[0x1E4F1CA98] null];
        [v13 addObject:v15];

        --v14;
      }
      while (v14);
    }
    [v9 setObject:v13 atIndexedSubscript:a4];
    __int16 v16 = UITextInputSessionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v20 = a4;
      __int16 v21 = 2048;
      unint64_t v22 = a5;
      _os_log_debug_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] New key found - initializing new array for key \"%lu\" with capacity %lu", buf, 0x16u);
    }
  }
  else
  {
    v13 = [v9 objectAtIndexedSubscript:a4];
  }

  return v13;
}

+ (id)getOrInitializeDictionaryFrom:(id)a3 forKey:(unint64_t)a4 initCapacity:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 objectAtIndexedSubscript:a4];
  id v9 = [MEMORY[0x1E4F1CA98] null];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a5];

    [v7 setObject:v11 atIndexedSubscript:a4];
    int v12 = UITextInputSessionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134218240;
      unint64_t v15 = a4;
      __int16 v16 = 2048;
      int64_t v17 = a5;
      _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] New key found - initializing new dictionary for key \"%lu\" with capacity %lu", (uint8_t *)&v14, 0x16u);
    }

    id v8 = (void *)v11;
  }

  return v8;
}

- (void)increaseCountForAppBundleId:(id)a3 forSource:(int64_t)a4 forActionType:(int64_t)a5 forFlagOptions:(int64_t)a6 forInputModeKey:(id)a7 byAccumulatorEntry:(id)a8
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v14 = (__CFString *)a3;
  id v15 = a7;
  id v16 = a8;
  if (([v16 isAllZeroes] & 1) == 0)
  {
    if (v15)
    {
      if (!v14) {
        int v14 = &stru_1ED0E84C0;
      }
      int64_t v17 = +[_UITextInputSessionEfficacyAccumulator getOrInitializeArrayFromDictionary:self->_entries forKey:v14 initCapacity:13];
      v28 = +[_UITextInputSessionEfficacyAccumulator getOrInitializeArrayFromArray:v17 forKey:a4 initCapacity:17];
      v27 = +[_UITextInputSessionEfficacyAccumulator getOrInitializeArrayFromArray:forKey:initCapacity:](_UITextInputSessionEfficacyAccumulator, "getOrInitializeArrayFromArray:forKey:initCapacity:");
      uint64_t v18 = +[_UITextInputSessionEfficacyAccumulator getOrInitializeDictionaryFrom:forKey:initCapacity:](_UITextInputSessionEfficacyAccumulator, "getOrInitializeDictionaryFrom:forKey:initCapacity:");
      v19 = [v18 objectForKeyedSubscript:v15];
      if (!v19)
      {
        v19 = objc_alloc_init(_UITextInputSessionEfficacyAccumulatorEntry);
        [v18 setObject:v19 forKeyedSubscript:v15];
        unint64_t v20 = UITextInputSessionLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218754;
          int64_t v30 = a4;
          __int16 v31 = 2048;
          int64_t v32 = a5;
          __int16 v33 = 2048;
          int64_t v34 = a6;
          __int16 v35 = 2112;
          id v36 = v15;
          _os_log_debug_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] New input mode key found - initializing new entry for source:%lu actionType:%lu flagOptions%lu inputMode:\"%@\"", buf, 0x2Au);
        }
      }
      [(_UITextInputSessionEfficacyAccumulatorEntry *)v19 increaseWithEntry:v16];
      __int16 v21 = UITextInputSessionLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = [v16 netCharacters];
        uint64_t v25 = [v16 userRemovedCharacters];
        uint64_t v24 = [v16 netEmojiCharacters];
        uint64_t v23 = [v16 userRemovedEmojiCharacters];
        uint64_t v22 = [v16 inputActions];
        *(_DWORD *)buf = 134220034;
        int64_t v30 = a4;
        __int16 v31 = 2048;
        int64_t v32 = a5;
        __int16 v33 = 2048;
        int64_t v34 = a6;
        __int16 v35 = 2112;
        id v36 = v15;
        __int16 v37 = 2048;
        uint64_t v38 = v26;
        __int16 v39 = 2048;
        uint64_t v40 = v25;
        __int16 v41 = 2048;
        uint64_t v42 = v24;
        __int16 v43 = 2048;
        uint64_t v44 = v23;
        __int16 v45 = 2048;
        uint64_t v46 = v22;
        _os_log_debug_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] Updated entry for source:%lu actionType:%lu flagOptions%lu inputMode:\"%@\" by netChars:%ld userRemovedChars:%ld netEmojiChars:%ld userRemovedEmojiChars:%ld actions:%ld", buf, 0x5Cu);
      }
    }
    else
    {
      int64_t v17 = UITextInputSessionLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "[UITextInputSessionEfficacyAccumulator] Received nil input mode unique key", buf, 2u);
      }
    }
  }
}

- (void)increaseWithAction:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[_UITextInputSessionEfficacyAccumulatorEntry generateAccumulatorEntryFromAction:v4];
  uint64_t v6 = [v4 inputModeUniqueString];
  id v7 = UITextInputSessionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414338;
    unint64_t v43 = (unint64_t)v4;
    __int16 v44 = 2048;
    uint64_t v45 = [v5 netCharacters];
    __int16 v46 = 2048;
    uint64_t v47 = [v5 userRemovedCharacters];
    __int16 v48 = 2048;
    uint64_t v49 = [v5 netEmojiCharacters];
    __int16 v50 = 2048;
    uint64_t v51 = [v5 userRemovedEmojiCharacters];
    __int16 v52 = 2048;
    uint64_t v53 = [v5 inputActions];
    __int16 v54 = 2048;
    uint64_t v55 = [v4 textInputActionsSource];
    __int16 v56 = 2048;
    uint64_t v57 = [v4 textInputActionsType];
    __int16 v58 = 2112;
    v59 = v6;
    _os_log_debug_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] increaseWithAction(): %@ netCharactersDelta:%ld userRemovedCharactersDelta:%ld netEmojiCharactersDelta:%ld sysRemovedObjectsDelta:%ld inputActionsDelta:%ld for source:%lu type:%lu inputMode:%@", buf, 0x5Cu);
  }

  [v4 source];
  id v8 = [v4 appBundleId];
  -[_UITextInputSessionEfficacyAccumulator increaseCountForAppBundleId:forSource:forActionType:forFlagOptions:forInputModeKey:byAccumulatorEntry:](self, "increaseCountForAppBundleId:forSource:forActionType:forFlagOptions:forInputModeKey:byAccumulatorEntry:", v8, [v4 textInputActionsSource], objc_msgSend(v4, "textInputActionsType"), objc_msgSend(v4, "flagOptions"), v6, v5);

  id v9 = [v4 language];
  if (v9)
  {
  }
  else
  {
    int v10 = [v4 region];

    if (!v10) {
      goto LABEL_8;
    }
  }
  uint64_t v11 = [v4 language];
  int v12 = (NSString *)[v11 copy];
  language = self->_language;
  self->_language = v12;

  int v14 = [v4 region];
  id v15 = (NSString *)[v14 copy];
  region = self->_region;
  self->_region = v15;

  int64_t v17 = [v4 keyboardVariant];
  uint64_t v18 = (NSString *)[v17 copy];
  keyboardVariant = self->_keyboardVariant;
  self->_keyboardVariant = v18;

  unint64_t v20 = [v4 keyboardLayout];
  __int16 v21 = (NSString *)[v20 copy];
  keyboardLayout = self->_keyboardLayout;
  self->_keyboardLayout = v21;

  uint64_t v23 = [v4 keyboardType];
  uint64_t v24 = (NSString *)[v23 copy];
  keyboardType = self->_keyboardType;
  self->_keyboardType = v24;

  if ([v4 textInputActionsSource] == 4)
  {
    uint64_t v26 = _UITextInputActionsValidateLanguage(self->_language);
    [(_UITextInputSessionEfficacyAccumulator *)self logErrorCodeIfNotNil:v26];

    v27 = _UITextInputActionsValidateRegion(self->_region);
    [(_UITextInputSessionEfficacyAccumulator *)self logErrorCodeIfNotNil:v27];
  }
LABEL_8:
  v28 = [v4 asDictationBegan];
  v29 = v28;
  if (v28 && [v28 modelessUsedAtLeastOnceCount]) {
    self->_sessionIsModeless = 1;
  }
  unint64_t v30 = [v4 largestSingleInsertionLength];
  unint64_t v31 = [v4 largestSingleDeletionLength];
  uint64_t v32 = [v4 netCharacterCount];
  if ([v4 flagOptions])
  {
    unint64_t v30 = [v4 insertedEmojiCount];
    unint64_t v31 = [v4 removedEmojiCount];
    uint64_t v33 = [v4 insertedEmojiCount];
    uint64_t v32 = v33 - [v4 removedEmojiCount];
    int64_t v34 = UITextInputSessionLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v43 = v30;
      __int16 v44 = 2048;
      uint64_t v45 = v31;
      __int16 v46 = 2048;
      uint64_t v47 = v32;
      _os_log_debug_impl(&dword_1853B0000, v34, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] emoji search - override insertion %lu, deletion %lu, net %ld", buf, 0x20u);
    }
  }
  if (v30 > self->_largestSessionInsertionLength)
  {
    __int16 v35 = UITextInputSessionLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      unint64_t largestSessionInsertionLength = self->_largestSessionInsertionLength;
      uint64_t v39 = [v4 largestSingleInsertionLength];
      *(_DWORD *)buf = 134218240;
      unint64_t v43 = largestSessionInsertionLength;
      __int16 v44 = 2048;
      uint64_t v45 = v39;
      _os_log_debug_impl(&dword_1853B0000, v35, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] largestSessionInsertionLength %lu -> %lu", buf, 0x16u);
    }

    self->_unint64_t largestSessionInsertionLength = v30;
  }
  if (v31 > self->_largestSessionDeletionLength)
  {
    id v36 = UITextInputSessionLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      unint64_t largestSessionDeletionLength = self->_largestSessionDeletionLength;
      uint64_t v41 = [v4 largestSingleDeletionLength];
      *(_DWORD *)buf = 134218240;
      unint64_t v43 = largestSessionDeletionLength;
      __int16 v44 = 2048;
      uint64_t v45 = v41;
      _os_log_debug_impl(&dword_1853B0000, v36, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] largestSessionDeletionLength %lu -> %lu", buf, 0x16u);
    }

    self->_unint64_t largestSessionDeletionLength = v31;
  }
  self->_sessionNetCharacters += v32;
  if ([v4 isCapableOfTextInsertion]
    && (([v4 flagOptions] & 1) == 0
     || ([v4 flagOptions] & 1) != 0 && objc_msgSend(v4, "insertedEmojiCount")))
  {
    self->_insertionObservedInSession = 1;
  }
  else if (!self->_insertionObservedInSession && ([v4 flagOptions] & 1) == 0)
  {
    uint64_t v37 = [v4 removedTextLength];
    self->_charsRemovedBeforeFirstInsertionCount += v37 - [v4 removedEmojiCount];
    self->_emojisRemovedBeforeFirstInsertionCount += [v4 removedEmojiCount];
  }
}

- (void)reset
{
  [(NSMutableDictionary *)self->_entries removeAllObjects];
  [(NSMutableSet *)self->_sessionErrors removeAllObjects];
  self->_sessionIsModeless = 0;
  self->_unint64_t largestSessionDeletionLength = 0;
  self->_sessionNetCharacters = 0;
  self->_unint64_t largestSessionInsertionLength = 0;
  self->_insertionObservedInSession = 0;
  id v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] Reset accumulator", v4, 2u);
  }
}

- (BOOL)isPrimaryInput:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 4 && (a3 & 0xFFFFFFFFFFFFFFFELL) != 8;
}

- (id)computeSessionActionsStringOnSession:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(_UITextInputSessionActionInformation);
  [(_UITextInputSessionActionInformation *)v6 setSessionHasOnlyPrimaryInput:1];
  [(_UITextInputSessionActionInformation *)v6 setSessionHasDictation:0];
  uint64_t v7 = 12;
  id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:12];
  do
  {
    id v9 = [NSNumber numberWithBool:0];
    [v8 addObject:v9];

    --v7;
  }
  while (v7);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke;
  v23[3] = &unk_1E530C640;
  SEL v26 = a2;
  v23[4] = self;
  id v10 = v8;
  id v24 = v10;
  uint64_t v11 = v6;
  uint64_t v25 = v11;
  [v5 enumerateObjectsUsingBlock:v23];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  unint64_t v20 = __Block_byref_object_copy__217;
  __int16 v21 = __Block_byref_object_dispose__217;
  id v22 = (id)[&stru_1ED0E84C0 mutableCopy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke_78;
  v16[3] = &unk_1E530C668;
  v16[4] = &v17;
  [v10 enumerateObjectsUsingBlock:v16];
  int v12 = (void *)v18[5];
  v13 = _UITextInputActionsSessionActionsStringFromEnumValue(2);
  LODWORD(v12) = [v12 isEqualToString:v13];

  if (v12) {
    [(_UITextInputSessionActionInformation *)v11 setSessionHasOnlyPrimaryInput:0];
  }
  [(_UITextInputSessionActionInformation *)v11 setSessionActionString:v18[5]];
  int v14 = v11;
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (id)generateSessionErrorStringFromSet:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"self" ascending:1];
    v9[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v6 = [v3 sortedArrayUsingDescriptors:v5];

    uint64_t v7 = [v6 componentsJoinedByString:&stru_1ED0E84C0];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)cleanIdForPublishing:(id)a3
{
  id v3 = (__CFString *)a3;
  if (objc_opt_respondsToSelector()) {
    int v4 = [MEMORY[0x1E4FAE268] performSelector:sel_isReportableClientId_ withObject:v3] != 0;
  }
  else {
    int v4 = [(__CFString *)v3 hasPrefix:@"com.apple."];
  }
  if (v4) {
    id v5 = v3;
  }
  else {
    id v5 = @"other";
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)enumerateTextInputActionsAnalytics:(id)a3
{
  id v4 = a3;
  id v5 = UITextInputSessionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionEfficacyAccumulator] Enumerating TextInputActions...", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v17 = buf;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__217;
  unint64_t v20 = __Block_byref_object_dispose__217;
  _UIMainBundleIdentifier();
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(_UITextInputSessionEfficacyAccumulator *)self cleanIdForPublishing:*((void *)v17 + 5)];
  uint64_t v7 = (void *)*((void *)v17 + 5);
  *((void *)v17 + 5) = v6;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__217;
  v14[4] = __Block_byref_object_dispose__217;
  id v15 = [(_UITextInputSessionEfficacyAccumulator *)self generateSessionErrorStringFromSet:self->_sessionErrors];
  entries = self->_entries;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke;
  v10[3] = &unk_1E530C730;
  v10[4] = self;
  int v12 = buf;
  v13 = v14;
  id v9 = v4;
  id v11 = v9;
  [(NSMutableDictionary *)entries enumerateKeysAndObjectsUsingBlock:v10];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(buf, 8);
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)keyboardTrialParameters
{
  return self->_keyboardTrialParameters;
}

- (void)setKeyboardTrialParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardTrialParameters, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sessionErrors, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_keyboardVariant, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end