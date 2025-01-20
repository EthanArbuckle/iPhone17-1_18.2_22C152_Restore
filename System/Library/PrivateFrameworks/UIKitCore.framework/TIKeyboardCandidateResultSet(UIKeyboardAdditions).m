@interface TIKeyboardCandidateResultSet(UIKeyboardAdditions)
- (id)ui_uniqueSupplementalCandidates;
- (uint64_t)hasAutofillCandidates;
- (uint64_t)hasOnlyCompletionCandidates;
- (uint64_t)hasOnlySlottedCandidates;
- (uint64_t)hasOnlyTextSuggestions;
- (uint64_t)slottedCandidatesCount;
@end

@implementation TIKeyboardCandidateResultSet(UIKeyboardAdditions)

- (uint64_t)hasOnlyTextSuggestions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a1 isDummySet]) {
    return 0;
  }
  v2 = [a1 candidates];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(a1, "candidates", 0, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = 0;
          goto LABEL_14;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_14:

  return v9;
}

- (uint64_t)hasOnlySlottedCandidates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a1 isDummySet]) {
    return 0;
  }
  v2 = [a1 candidates];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(a1, "candidates", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 isSlottedCandidate] & 1) == 0 && !objc_msgSend(v9, "isAutofillCandidate"))
        {
          uint64_t v10 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_15:

  return v10;
}

- (uint64_t)hasOnlyCompletionCandidates
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a1 isDummySet]) {
    return 0;
  }
  v2 = [a1 candidates];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(a1, "candidates", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![*(id *)(*((void *)&v11 + 1) + 8 * v8) isCompletionCandidate])
        {
          uint64_t v9 = 0;
          goto LABEL_14;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_14:

  return v9;
}

- (uint64_t)slottedCandidatesCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a1 isDummySet]) {
    return 0;
  }
  v2 = [a1 candidates];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(a1, "candidates", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [*(id *)(*((void *)&v11 + 1) + 8 * i) isSlottedCandidate];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)hasAutofillCandidates
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a1 isDummySet]) {
    return 0;
  }
  v2 = [a1 candidates];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = objc_msgSend(a1, "candidates", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) isAutofillCandidate])
        {
          uint64_t v5 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v5;
}

- (id)ui_uniqueSupplementalCandidates
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v3 = [a1 candidatesIfSupplemental];
    v4 = (void *)[v2 initWithArray:v3 copyItems:1];

    uint64_t v5 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v12 = [v11 candidate];
          long long v13 = [v5 objectForKey:v12];

          if (v13)
          {
            uint64_t v14 = [v13 supplementalItemIdentifiers];
            long long v15 = [v11 supplementalItemIdentifiers];
            uint64_t v16 = [v14 arrayByAddingObjectsFromArray:v15];
            [v13 setSupplementalItemIdentifiers:v16];
          }
          else
          {
            uint64_t v14 = [v11 candidate];
            [v5 setObject:v11 forKey:v14];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v8);
    }

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          v24 = objc_msgSend(v23, "candidate", (void)v28);
          v25 = [v5 objectForKey:v24];

          if (v25)
          {
            [v17 addObject:v25];
            v26 = [v23 candidate];
            [v5 removeObjectForKey:v26];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v20);
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v17;
}

@end