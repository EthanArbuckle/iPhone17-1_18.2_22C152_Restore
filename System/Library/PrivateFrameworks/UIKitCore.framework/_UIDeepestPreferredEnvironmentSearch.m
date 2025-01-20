@interface _UIDeepestPreferredEnvironmentSearch
- (BOOL)allowsOverridingPreferedFocusEnvironments;
- (_UIDebugLogNode)debugLog;
- (id)_overridingPreferredFocusEnvironmentForPreferredEnvironment:(id)a3 visitedFocusEnvironments:(id)a4;
- (id)deepestPreferredFocusEnvironmentForEnvironment:(id)a3;
- (id)deepestPreferredFocusableItemForEnvironment:(id)a3 withRequest:(id)a4;
- (void)_reportDidFindLockedFocusEnvironment:(id)a3;
- (void)_reportDidFindOverridingPreferredFocusEnvironment:(id)a3 source:(id)a4;
- (void)_reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:(id)a3;
- (void)_reportFinishedEvaluatingAllPreferencesForEnvironmentInContext:(id)a3 result:(int64_t)a4;
- (void)_reportFoundFocusableItem:(id)a3 inContext:(id)a4;
- (void)_reportStartingSearch;
- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3;
- (void)setDebugLog:(id)a3;
@end

@implementation _UIDeepestPreferredEnvironmentSearch

- (id)deepestPreferredFocusableItemForEnvironment:(id)a3 withRequest:(id)a4
{
  id v7 = a3;
  id v26 = a4;
  if (!v7)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_UIFocusEnvironmentPreferenceEnumerator.m", 574, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  [(_UIDeepestPreferredEnvironmentSearch *)self _reportStartingSearch];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__87;
  v57 = __Block_byref_object_dispose__87;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__87;
  v51 = __Block_byref_object_dispose__87;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__87;
  v45 = __Block_byref_object_dispose__87;
  id v46 = 0;
  v25 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  v8 = [v26 focusSystem];
  v9 = [v8 _deepestPreferredFocusableItemCacheForCurrentUpdate];

  if (dyld_program_sdk_at_least()) {
    uint64_t v10 = [v26 isMovementRequest] ^ 1;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = [[_UIFocusEnvironmentPreferenceEnumerator alloc] initWithEnumerationMode:v10];
  [(_UIFocusEnvironmentPreferenceEnumerator *)v11 setDebugLog:self->_debugLog];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke;
  v36[3] = &unk_1E52EDED0;
  v39 = &v47;
  v40 = &v53;
  id v12 = v9;
  id v37 = v12;
  v38 = self;
  [(_UIFocusEnvironmentPreferenceEnumerator *)v11 setDidVisitAllPreferencesForEnvironmentHandler:v36];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_2;
  v35[3] = &unk_1E52EDEF8;
  v35[4] = &v53;
  [(_UIFocusEnvironmentPreferenceEnumerator *)v11 setShouldInferPreferenceForEnvironmentHandler:v35];
  BOOL v13 = [(_UIDeepestPreferredEnvironmentSearch *)self allowsOverridingPreferedFocusEnvironments];
  id v24 = v7;
  if (v7)
  {
    v14 = v24;
    do
    {
      v15 = (void *)v54[5];
      v54[5] = 0;

      v16 = (void *)v48[5];
      v48[5] = 0;

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_3;
      v27[3] = &unk_1E52EDF20;
      id v28 = v12;
      v32 = &v47;
      id v17 = v14;
      id v29 = v17;
      v33 = &v53;
      id v18 = v26;
      v34 = &v41;
      id v30 = v18;
      v31 = self;
      [(_UIFocusEnvironmentPreferenceEnumerator *)v11 enumeratePreferencesForEnvironment:v17 usingBlock:v27];
      if (v42[5]) {
        -[_UIDeepestPreferredEnvironmentSearch _reportDidFindLockedFocusEnvironment:](self, "_reportDidFindLockedFocusEnvironment:");
      }
      [(_UIDeepestPreferredEnvironmentSearch *)self _reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:v54[5]];
      if (v42[5]) {
        BOOL v19 = 0;
      }
      else {
        BOOL v19 = v13;
      }
      if (v19 && (uint64_t v20 = v48[5]) != 0)
      {
        v14 = [(_UIDeepestPreferredEnvironmentSearch *)self _overridingPreferredFocusEnvironmentForPreferredEnvironment:v20 visitedFocusEnvironments:v25];
      }
      else
      {
        v14 = 0;
      }
    }
    while (v14);
  }
  id v21 = (id)v54[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v21;
}

- (id)deepestPreferredFocusEnvironmentForEnvironment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIFocusEnvironmentPreferenceEnumerator.m", 701, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  v6 = +[UIFocusSystem focusSystemForEnvironment:v5];
  id v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  id v16 = v5;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__87;
  v31 = __Block_byref_object_dispose__87;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__87;
  v25 = __Block_byref_object_dispose__87;
  id v26 = 0;
  v8 = [[_UIFocusEnvironmentPreferenceEnumerator alloc] initWithEnumerationMode:1];
  [(_UIFocusEnvironmentPreferenceEnumerator *)v8 setAllowsInferringPreferences:0];
  if (v5)
  {
    v9 = v16;
    while (1)
    {
      uint64_t v10 = (void *)v28[5];
      v28[5] = 0;

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __87___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusEnvironmentForEnvironment___block_invoke;
      v17[3] = &unk_1E52EDF48;
      BOOL v19 = &v21;
      id v18 = v6;
      uint64_t v20 = &v27;
      [(_UIFocusEnvironmentPreferenceEnumerator *)v8 enumeratePreferencesForEnvironment:v9 usingBlock:v17];
      if (v22[5])
      {
        -[_UIDeepestPreferredEnvironmentSearch _reportDidFindLockedFocusEnvironment:](self, "_reportDidFindLockedFocusEnvironment:");
        if (v22[5]) {
          break;
        }
      }
      uint64_t v11 = v28[5];
      if (!v11) {
        break;
      }
      uint64_t v12 = [(_UIDeepestPreferredEnvironmentSearch *)self _overridingPreferredFocusEnvironmentForPreferredEnvironment:v11 visitedFocusEnvironments:v7];

      v9 = (void *)v12;
      if (!v12) {
        goto LABEL_11;
      }
    }
  }
LABEL_11:
  id v13 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (id)_overridingPreferredFocusEnvironmentForPreferredEnvironment:(id)a3 visitedFocusEnvironments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIFocusEnvironmentPreferenceEnumerator.m", 747, @"Invalid parameter not satisfying: %@", @"preferredDestinationEnvironment" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_UIFocusEnvironmentPreferenceEnumerator.m", 748, @"Invalid parameter not satisfying: %@", @"visitedFocusEnvironments" object file lineNumber description];

LABEL_3:
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__87;
  v31 = __Block_byref_object_dispose__87;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__87;
  v25 = __Block_byref_object_dispose__87;
  id v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __125___UIDeepestPreferredEnvironmentSearch__overridingPreferredFocusEnvironmentForPreferredEnvironment_visitedFocusEnvironments___block_invoke;
  v17[3] = &unk_1E52EDF70;
  id v10 = v9;
  id v18 = v10;
  BOOL v19 = &v27;
  uint64_t v20 = &v21;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(v7, v17);
  uint64_t v11 = v28[5];
  if (v11)
  {
    [(_UIDeepestPreferredEnvironmentSearch *)self _reportDidFindOverridingPreferredFocusEnvironment:v11 source:v22[5]];
    uint64_t v12 = (void *)v28[5];
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (void)_reportStartingSearch
{
  id v3 = [(_UIDeepestPreferredEnvironmentSearch *)self debugLog];
  v2 = +[_UIDebugLogMessage messageWithString:@"Starting preferred focus search."];
  [v3 addMessage:v2];
}

- (void)_reportFoundFocusableItem:(id)a3 inContext:(id)a4
{
  objc_msgSend(a4, "debugStack", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = +[_UIDebugLogMessage messageWithStyle:2 string:@"It's focusable!"];
  [v5 addMessage:v4];
}

- (void)_reportFinishedEvaluatingAllPreferencesForEnvironmentInContext:(id)a3 result:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 debugStack];
  if (v6)
  {
    id v7 = (void *)v6;
    char v8 = [v5 isPreferredByItself];

    if (a4 != 3 && (v8 & 1) == 0)
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      v9 = [v5 preferredEnvironments];
      id v10 = [v5 environment];
      uint64_t v11 = [v9 indexOfObject:v10];

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = [v5 preferredEnvironments];
        uint64_t v13 = [v12 count];

        v14 = [v5 preferredEnvironments];
        v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11 + 1, v13 - (v11 + 1));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __110___UIDeepestPreferredEnvironmentSearch__reportFinishedEvaluatingAllPreferencesForEnvironmentInContext_result___block_invoke;
        v18[3] = &unk_1E52EDF98;
        id v19 = v5;
        uint64_t v20 = &v21;
        [v14 enumerateObjectsAtIndexes:v15 options:0 usingBlock:v18];
      }
      if (*((unsigned char *)v22 + 24))
      {
        id v16 = [v5 debugStack];
        id v17 = +[_UIDebugLogMessage messageWithStyle:3 string:@"Found nothing."];
        [v16 addMessage:v17];
      }
      _Block_object_dispose(&v21, 8);
    }
  }
}

- (void)_reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:(id)a3
{
  id v14 = a3;
  v4 = [(_UIDeepestPreferredEnvironmentSearch *)self debugLog];

  if (v4)
  {
    id v5 = [(_UIDeepestPreferredEnvironmentSearch *)self debugLog];
    uint64_t v6 = NSString;
    id v7 = v14;
    if (v7)
    {
      char v8 = NSString;
      v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      uint64_t v11 = [v8 stringWithFormat:@"<%@: %p>", v10, v7];
    }
    else
    {
      uint64_t v11 = @"(nil)";
    }

    uint64_t v12 = [v6 stringWithFormat:@"Finished enumerating preferred environments. Preferring %@", v11];
    uint64_t v13 = +[_UIDebugLogMessage messageWithStyle:2 string:v12];
    [v5 addMessage:v13];
  }
}

- (void)_reportDidFindOverridingPreferredFocusEnvironment:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(_UIDeepestPreferredEnvironmentSearch *)self debugLog];
  v9 = NSString;
  id v10 = v6;
  id v22 = v10;
  if (v10)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    id v14 = [v11 stringWithFormat:@"<%@: %p>", v13, v22];

    id v10 = v22;
  }
  else
  {
    id v14 = @"(nil)";
  }

  id v15 = v7;
  if (v15)
  {
    id v16 = NSString;
    id v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    id v19 = [v16 stringWithFormat:@"<%@: %p>", v18, v15];
  }
  else
  {
    id v19 = @"(nil)";
  }

  uint64_t v20 = [v9 stringWithFormat:@"Found overide to environment %@. (source: %@)", v14, v19];
  uint64_t v21 = +[_UIDebugLogMessage messageWithStyle:2 string:v20];
  [v8 addMessage:v21];
}

- (void)_reportDidFindLockedFocusEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDeepestPreferredEnvironmentSearch *)self debugLog];
  id v6 = NSString;
  id v13 = v4;
  if (v13)
  {
    id v7 = NSString;
    char v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = [v7 stringWithFormat:@"<%@: %p>", v9, v13];
  }
  else
  {
    id v10 = @"(nil)";
  }

  uint64_t v11 = [v6 stringWithFormat:@"Found locked focus environment %@.", v10];
  uint64_t v12 = +[_UIDebugLogMessage messageWithStyle:3 string:v11];
  [v5 addMessage:v12];
}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return self->_allowsOverridingPreferedFocusEnvironments;
}

- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3
{
  self->_allowsOverridingPreferedFocusEnvironments = a3;
}

- (_UIDebugLogNode)debugLog
{
  return self->_debugLog;
}

- (void)setDebugLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end