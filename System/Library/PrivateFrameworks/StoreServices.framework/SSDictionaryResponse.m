@interface SSDictionaryResponse
- (BOOL)isSupportedProtocolVersion;
- (NSArray)actions;
- (NSArray)pingURLs;
- (NSDictionary)responseDictionary;
- (NSNumber)failureType;
- (NSURL)versionMismatchURL;
- (SSDictionaryResponse)init;
- (SSDictionaryResponse)initWithResponseDictionary:(id)a3;
- (id)_copyAccount;
- (id)_valueForProtocolKey:(id)a3;
- (id)actionsWithActionType:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SSDictionaryResponse

- (SSDictionaryResponse)init
{
  return [(SSDictionaryResponse *)self initWithResponseDictionary:0];
}

- (SSDictionaryResponse)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)SSDictionaryResponse;
    v5 = [(SSDictionaryResponse *)&v9 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      dictionary = v5->_dictionary;
      v5->_dictionary = (NSDictionary *)v6;
    }
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil dictionary"];
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDictionary *)self->_dictionary copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSArray)actions
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v47 = [MEMORY[0x1E4F1CA48] array];
  v3 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"dialog"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[SSDialog alloc] initWithDialogDictionary:v3];
    if (v4)
    {
      v5 = +[SSResponseAction _dialogActionWithDialog:v4];
      [v47 addObject:v5];
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v6 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"tid-dialog"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v7 = [[SSDialog alloc] initWithDialogDictionary:v6];

  if (v7)
  {
    v8 = +[SSResponseAction _dialogActionWithTouchIDDialog:v7];
    [v47 addObject:v8];

    id v4 = v7;
LABEL_8:
  }
  objc_super v9 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"invalidate-url-bags"];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v9 BOOLValue])
  {
    v10 = +[SSResponseAction _invalidateURLBagsAction];
    [v47 addObject:v10];
  }
  id v11 = [(SSDictionaryResponse *)self _copyAccount];
  if (v11)
  {
    v12 = +[SSResponseAction _setActiveAccountActionWithAccount:v11];
    [v47 addObject:v12];
  }
  v13 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"creditDisplay"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"dsPersonId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "integerValue"));

      v14 = (void *)v15;
    }
    if (v14
      || ([(SSDictionaryResponse *)self _valueForProtocolKey:@"dsid"],
          (v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = +[SSAccountStore defaultStore];
      v17 = [v16 accountWithUniqueIdentifier:v14];

      if (!v17)
      {
        v17 = objc_alloc_init(SSAccount);
        [(SSAccount *)v17 setUniqueIdentifier:v14];
      }
      v18 = +[SSResponseAction _setCreditsActionWithCredits:v13 account:v17];
      [v47 addObject:v18];
    }
  }
  v19 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"action"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [v19 objectForKey:@"kind"];
    v21 = [v19 objectForKey:@"url"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_33;
    }
    if ([v20 caseInsensitiveCompare:@"GoBack"])
    {
      if ([v20 caseInsensitiveCompare:@"RetryRestoreAll"])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v21];
          if ([v20 isEqualToString:@"Goto"])
          {
            v23 = @"SSResponseActionTypeGotoURL";
LABEL_65:
            v43 = +[SSResponseAction _urlActionWithType:v23 URL:v22];
            [v47 addObject:v43];

            goto LABEL_32;
          }
          if ([v20 isEqualToString:@"OpenURL"])
          {
            v23 = @"SSResponseActionTypeOpenURL";
            goto LABEL_65;
          }
LABEL_32:
        }
LABEL_33:

        goto LABEL_34;
      }
      v24 = @"SSResponseActionTypeRetryRestoreDownloads";
    }
    else
    {
      v24 = @"SSResponseActionTypeDismissCurrentPage";
    }
    v22 = +[SSResponseAction _actionWithActionType:v24];
    [v47 addObject:v22];
    goto LABEL_32;
  }
LABEL_34:
  v45 = v11;
  v25 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"selected-footer-section"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = +[SSResponseAction _selectFooterActionWithSection:v25];
    [v47 addObject:v26];
  }
  v27 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"trigger-in-app-purchase-queue"];

  objc_opt_class();
  v46 = self;
  v44 = v27;
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObject:v27];
    }
    else
    {
      id v28 = 0;
    }
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v29 = v28;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v49 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v35 = [v34 objectForKey:@"client-id"];
          v36 = [v34 objectForKey:@"environment"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v37 = +[SSResponseAction _checkInAppQueueActionWithClientID:v35 environment:v36];
              [v47 addObject:v37];
            }
          }
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v31);
  }

  v38 = [(SSDictionaryResponse *)v46 _valueForProtocolKey:@"trigger-download"];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v38 BOOLValue])
  {
    v39 = +[SSResponseAction _actionWithActionType:@"SSResponseActionTypeCheckDownloadQueues"];
    [v47 addObject:v39];
  }
  v40 = [(SSDictionaryResponse *)v46 _valueForProtocolKey:@"refresh-subscription-status"];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v40 BOOLValue])
  {
    v41 = +[SSResponseAction _actionWithActionType:@"SSResponseActionTypeRefreshSubscriptionStatus"];
    [v47 addObject:v41];
  }
  return (NSArray *)v47;
}

- (id)actionsWithActionType:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(SSDictionaryResponse *)self actions];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 actionType];
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSNumber)failureType
{
  return (NSNumber *)[(SSDictionaryResponse *)self _valueForProtocolKey:@"failureType"];
}

- (BOOL)isSupportedProtocolVersion
{
  v2 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"store-version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 objectForKey:@"1.0"];
    if (v3
      || ([v2 objectForKey:@"*"], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = [v3 objectForKey:@"redirect-url"];
      BOOL v5 = v4 == 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (NSArray)pingURLs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"pings"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"ping"];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, 0);

    v3 = (void *)v5;
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          int v13 = [v12 host];

          if (v13) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  return (NSArray *)v6;
}

- (NSURL)versionMismatchURL
{
  v2 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"store-version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 objectForKey:@"1.0"];
    if (!v3)
    {
      v3 = [v2 objectForKey:@"*"];
    }
    id v4 = [v3 objectForKey:@"redirect-url"];
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSURL *)v5;
}

- (id)_copyAccount
{
  v3 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"accountInfo"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [(SSDictionaryResponse *)self _valueForProtocolKey:@"set-current-user"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v3 = (void *)[v4 mutableCopy];
      uint64_t v5 = [v3 objectForKey:@"accountInfo"];

      if (v5)
      {
        [v3 addEntriesFromDictionary:v5];
        [v3 removeObjectForKey:@"accountInfo"];
      }
    }
    else
    {
      v3 = v4;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [[SSAuthenticationResponse alloc] initWithURLResponse:0 dictionary:v3];
    id v7 = [(SSAuthenticationResponse *)v6 newAccount];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_valueForProtocolKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_dictionary objectForKey:@"protocol"];
  uint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v6 = [(NSDictionary *)self->_dictionary objectForKey:v4];
  }

  return v6;
}

- (NSDictionary)responseDictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end