@interface WBSSavedAccountTreeMatch
+ (BOOL)userNameString:(id)a3 matchesPotentiallyObfuscatedUserNameString:(id)a4;
- (NSDictionary)accountStoreTreeMatchingSearchCriteria;
- (NSMutableArray)flattenedSavedAccountsFromTree;
- (NSString)domain;
- (WBSSavedAccountTreeMatch)initWithDomain:(id)a3 savedAccountTree:(id)a4 matchLevel:(int64_t)a5;
- (int64_t)matchLevel;
- (void)pruneDontSaveTrees;
- (void)pruneEmptyUsernameTrees;
- (void)pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers:(id)a3;
- (void)pruneUsernameTreesNotMatchingTitleQuery:(id)a3;
- (void)pruneUsernameTreesNotMatchingUserNameQuery:(id)a3 orPasskeyIdentifiers:(id)a4;
@end

@implementation WBSSavedAccountTreeMatch

- (WBSSavedAccountTreeMatch)initWithDomain:(id)a3 savedAccountTree:(id)a4 matchLevel:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSSavedAccountTreeMatch;
  v10 = [(WBSSavedAccountTreeMatch *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    domain = v10->_domain;
    v10->_domain = (NSString *)v11;

    uint64_t v13 = deepMutableDictionaryCopy(v9);
    accountStoreTreeMatchingSearchCriteria = v10->_accountStoreTreeMatchingSearchCriteria;
    v10->_accountStoreTreeMatchingSearchCriteria = (NSMutableDictionary *)v13;

    v10->_matchLevel = a5;
    v15 = v10;
  }

  return v10;
}

- (NSMutableArray)flattenedSavedAccountsFromTree
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [(NSMutableDictionary *)self->_accountStoreTreeMatchingSearchCriteria allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v10 = objc_msgSend(v9, "allValues", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              [v3 addObjectsFromArray:*(void *)(*((void *)&v16 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  return (NSMutableArray *)v3;
}

- (void)pruneEmptyUsernameTrees
{
}

- (void)pruneDontSaveTrees
{
  accountStoreTreeMatchingSearchCriteria = self->_accountStoreTreeMatchingSearchCriteria;
  id v3 = +[WBSDontSaveMarker dontSaveMarker];
  [(NSMutableDictionary *)accountStoreTreeMatchingSearchCriteria removeObjectForKey:v3];
}

- (void)pruneUsernameTreesNotMatchingUserNameQuery:(id)a3 orPasskeyIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 matchingType];
  id v9 = [v7 string];

  if (v8 || [v9 length])
  {
    v10 = objc_msgSend(v6, "safari_setByApplyingBlock:", &__block_literal_global_62);
    if ([v9 hasPrefix:@"+1"])
    {
      uint64_t v11 = [v9 substringFromIndex:2];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [v9 componentsSeparatedByString:@"@"];
    uint64_t v13 = [v12 firstObject];

    if (v13) {
      v14 = v13;
    }
    else {
      v14 = v9;
    }
    id v15 = v14;
    long long v16 = [(NSMutableDictionary *)self->_accountStoreTreeMatchingSearchCriteria allKeys];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    long long v23 = __92__WBSSavedAccountTreeMatch_pruneUsernameTreesNotMatchingUserNameQuery_orPasskeyIdentifiers___block_invoke_2;
    v24 = &unk_1E615DA98;
    uint64_t v30 = v8;
    id v25 = v15;
    uint64_t v26 = self;
    id v27 = v9;
    id v28 = v11;
    id v29 = v10;
    id v17 = v10;
    id v18 = v11;
    id v19 = v15;
    long long v20 = objc_msgSend(v16, "safari_filterObjectsUsingBlock:", &v21);

    -[NSMutableDictionary removeObjectsForKeys:](self->_accountStoreTreeMatchingSearchCriteria, "removeObjectsForKeys:", v20, v21, v22, v23, v24);
  }
}

uint64_t __92__WBSSavedAccountTreeMatch_pruneUsernameTreesNotMatchingUserNameQuery_orPasskeyIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 credentialID];
}

uint64_t __92__WBSSavedAccountTreeMatch_pruneUsernameTreesNotMatchingUserNameQuery_orPasskeyIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 72);
  if (v5 == 1)
  {
    int v9 = [v3 isEqualToString:*(void *)(a1 + 48)] ^ 1;
  }
  else if (v5)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    uint64_t v6 = [v3 rangeOfString:*(void *)(a1 + 32) options:9];
    char v7 = [(id)objc_opt_class() userNameString:v4 matchesPotentiallyObfuscatedUserNameString:*(void *)(a1 + 48)];
    if ([*(id *)(a1 + 56) length]) {
      BOOL v8 = [v4 rangeOfString:*(void *)(a1 + 56) options:9] == 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v8 = 1;
    }
    char v10 = v8 & ~v7;
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      LOBYTE(v9) = v10;
    }
    else {
      LOBYTE(v9) = 0;
    }
  }
  if ([*(id *)(a1 + 64) count])
  {
    v24 = v4;
    [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:v4];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v25 = v35 = 0u;
    obuint64_t j = [v25 allKeys];
    uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        uint64_t v14 = 0;
        uint64_t v26 = v12;
        do
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
          if (([v15 integerValue] & 2) != 0)
          {
            long long v16 = [v25 objectForKeyedSubscript:v15];
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v29;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v29 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void **)(a1 + 64);
                  uint64_t v22 = [*(id *)(*((void *)&v28 + 1) + 8 * i) passkeyCredentialID];
                  LOBYTE(v21) = [v21 containsObject:v22];

                  LOBYTE(v9) = (v21 ^ 1) & v9;
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
              }
              while (v18);
            }

            uint64_t v12 = v26;
          }
          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v12);
    }

    v4 = v24;
  }

  return v9 & 1;
}

- (void)pruneUsernameTreesNotMatchingTitleQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_accountStoreTreeMatchingSearchCriteria allKeys];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  char v10 = __68__WBSSavedAccountTreeMatch_pruneUsernameTreesNotMatchingTitleQuery___block_invoke;
  uint64_t v11 = &unk_1E615DAE8;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &v8);

  -[NSMutableDictionary removeObjectsForKeys:](self->_accountStoreTreeMatchingSearchCriteria, "removeObjectsForKeys:", v7, v8, v9, v10, v11, v12);
}

uint64_t __68__WBSSavedAccountTreeMatch_pruneUsernameTreesNotMatchingTitleQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__WBSSavedAccountTreeMatch_pruneUsernameTreesNotMatchingTitleQuery___block_invoke_2;
  v7[3] = &unk_1E615DAC0;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = &v10;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v5 = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __68__WBSSavedAccountTreeMatch_pruneUsernameTreesNotMatchingTitleQuery___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  id v7 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = [*(id *)(a1 + 32) matchingType];
        if (v13 == 1)
        {
          uint64_t v17 = [v12 customTitle];
          uint64_t v18 = [*(id *)(a1 + 32) string];
          char v19 = WBSIsEqual(v17, v18);

          if ((v19 & 1) == 0) {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          }
        }
        else if (!v13)
        {
          uint64_t v14 = [v12 customTitle];
          uint64_t v15 = [v14 length];
          if (v15)
          {
            id v3 = [v12 customTitle];
            id v4 = [*(id *)(a1 + 32) string];
            BOOL v16 = [v3 rangeOfString:v4 options:9] == 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            BOOL v16 = 1;
          }
          uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
          if (!*(unsigned char *)(v20 + 24)) {
            BOOL v16 = 0;
          }
          *(unsigned char *)(v20 + 24) = v16;
          if (v15)
          {
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
}

+ (BOOL)userNameString:(id)a3 matchesPotentiallyObfuscatedUserNameString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 length];
  if (v7 == [v6 length])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"*•"];
    if (v7)
    {
      BOOL v9 = 0;
      for (i = 0; i != v7; BOOL v9 = i >= v7)
      {
        uint64_t v11 = [v6 characterAtIndex:i];
        if (([v8 characterIsMember:v11] & 1) == 0
          && [v5 characterAtIndex:i] != v11)
        {
          break;
        }
        ++i;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a3, "safari_setByApplyingBlock:", &__block_literal_global_16_3);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_accountStoreTreeMatchingSearchCriteria allValues];
  uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v30;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v5;
        id v6 = *(void **)(*((void *)&v29 + 1) + 8 * v5);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        unint64_t v7 = [v6 allKeys];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              uint64_t v13 = [v6 objectForKeyedSubscript:v12];
              uint64_t v14 = [v12 integerValue];
              v20[0] = MEMORY[0x1E4F143A8];
              v20[1] = 3221225472;
              v20[2] = __82__WBSSavedAccountTreeMatch_pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers___block_invoke_2;
              v20[3] = &unk_1E615DB10;
              uint64_t v23 = v14;
              id v15 = v4;
              __int16 v24 = 256;
              id v21 = v15;
              long long v22 = &stru_1F105D3F0;
              objc_msgSend(v13, "safari_removeObjectsPassingTest:", v20);
              if (![v13 count]) {
                [v6 removeObjectForKey:v12];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v19 + 1;
      }
      while (v19 + 1 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v18);
  }
}

uint64_t __82__WBSSavedAccountTreeMatch_pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 credentialID];
}

uint64_t __82__WBSSavedAccountTreeMatch_pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if ((a1[6] & 2) != 0)
  {
    uint64_t v5 = (void *)a1[4];
    id v6 = [v3 passkeyCredentialID];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5)
    {
      unint64_t v7 = (unsigned __int8 *)(a1 + 7);
      goto LABEL_8;
    }
    if (a1[6] == 2)
    {
      unint64_t v7 = (unsigned __int8 *)a1 + 57;
      goto LABEL_8;
    }
  }
  uint64_t v8 = [v4 password];
  int v9 = [v8 isEqualToString:a1[5]];

  unint64_t v7 = (unsigned __int8 *)(a1 + 7);
  if (v9) {
    unint64_t v7 = (unsigned __int8 *)a1 + 57;
  }
LABEL_8:
  uint64_t v10 = *v7;

  return v10;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSDictionary)accountStoreTreeMatchingSearchCriteria
{
  return &self->_accountStoreTreeMatchingSearchCriteria->super;
}

- (int64_t)matchLevel
{
  return self->_matchLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_accountStoreTreeMatchingSearchCriteria, 0);
}

@end