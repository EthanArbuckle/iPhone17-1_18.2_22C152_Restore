@interface _ICQUpgradeFlowSpecification
+ (id)_upgradePageIdentifierForError:(id)a3;
+ (id)sanitizedUpgradeFlowServerDict:(id)a3;
+ (id)upgradeFlowSpecificationSampleForLevel:(int64_t)a3;
- (BOOL)needsWiFi;
- (NSDictionary)serverDict;
- (_ICQUpgradeFlowSpecification)initWithServerDictionary:(id)a3;
- (id)upgradeFailurePage;
- (id)upgradeFailurePageForNetwork;
- (id)upgradePageForError:(id)a3;
- (id)upgradePageForSuccess:(BOOL)a3;
- (id)upgradeSuccessPage;
- (id)upgradeSuccessPageForWiFi;
- (int64_t)offerType;
- (void)setNeedsWiFi:(BOOL)a3;
- (void)setOfferType:(int64_t)a3;
@end

@implementation _ICQUpgradeFlowSpecification

+ (id)upgradeFlowSpecificationSampleForLevel:(int64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___UpgradeFlowSpecificationSampleForLevel_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (_UpgradeFlowSpecificationSampleForLevel_onceToken != -1) {
    dispatch_once(&_UpgradeFlowSpecificationSampleForLevel_onceToken, block);
  }
  id v3 = (id)_UpgradeFlowSpecificationSampleForLevel_sUpgradeFlowSpecification;
  return v3;
}

- (id)upgradeSuccessPage
{
  v2 = [(_ICQFlowSpecification *)self pagesByIdentifier];
  id v3 = [v2 objectForKey:@"UpgradeComplete"];

  if (!v3)
  {
    v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "no upgrade success page available", v6, 2u);
    }
  }
  return v3;
}

- (id)upgradeFailurePage
{
  v2 = [(_ICQFlowSpecification *)self pagesByIdentifier];
  id v3 = [v2 objectForKey:@"UpgradeFailure"];

  if (!v3)
  {
    v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "no upgrade failure page available", v6, 2u);
    }
  }
  return v3;
}

- (id)upgradePageForSuccess:(BOOL)a3
{
  if (a3) {
    [(_ICQUpgradeFlowSpecification *)self upgradeSuccessPage];
  }
  else {
  id v3 = [(_ICQUpgradeFlowSpecification *)self upgradeFailurePage];
  }
  return v3;
}

- (id)upgradeSuccessPageForWiFi
{
  id v3 = [(_ICQFlowSpecification *)self pagesByIdentifier];
  v4 = [v3 objectForKey:@"UpgradeSuccessWiFi"];

  if (!v4)
  {
    v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "missing wireless network success page, falling back on generic", v7, 2u);
    }

    v4 = [(_ICQUpgradeFlowSpecification *)self upgradeSuccessPage];
  }
  return v4;
}

- (id)upgradeFailurePageForNetwork
{
  id v3 = [(_ICQFlowSpecification *)self pagesByIdentifier];
  v4 = [v3 objectForKey:@"UpgradeFailureNetwork"];

  if (!v4)
  {
    v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "missing network failure page, falling back on generic", v7, 2u);
    }

    v4 = [(_ICQUpgradeFlowSpecification *)self upgradeFailurePage];
  }
  return v4;
}

- (id)upgradePageForError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(id)objc_opt_class() _upgradePageIdentifierForError:v4];
    v6 = [(_ICQFlowSpecification *)self pagesByIdentifier];
    v7 = [v6 objectForKey:v5];

    if (!v7)
    {
      v8 = _ICQGetLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "missing page spec for error: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_upgradePageIdentifierForError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F4DA40]];

  if (v5)
  {
    if ([v3 code] == 6) {
      v6 = 0;
    }
    else {
      v6 = @"UpgradeFailure";
    }
  }
  else
  {
    v7 = [v3 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v8 = [v3 code];

      if (v8 == -1001)
      {
        v6 = @"UpgradeFailureNetwork";
        goto LABEL_10;
      }
    }
    else
    {
    }
    v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "code"));
    v6 = [v9 stringValue];
  }
LABEL_10:

  return v6;
}

+ (id)sanitizedUpgradeFlowServerDict:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = _ICQDictionaryForOneOfKeys(v3, &unk_1F2DE1B28);
  v37 = (void *)v5;
  if (v5)
  {
    [v4 setObject:v5 forKey:@"UpgradeOffer"];
  }
  else
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "missing upgradeInfo and actionInfo", buf, 2u);
    }
  }
  v7 = _ICQDictionaryForKey(v3, @"postUpgradeInfo");
  uint64_t v8 = _ICQDictionaryForKey(v3, @"successInfo");
  v38 = (void *)v8;
  v39 = v7;
  if (!v7)
  {
    v19 = (void *)v8;
    if (!v8)
    {
      v33 = _ICQGetLogSystem();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v33, OS_LOG_TYPE_DEFAULT, "missing postUpgradeInfo and successInfo", buf, 2u);
      }
      goto LABEL_49;
    }
    [v4 setObject:v8 forKey:@"UpgradeComplete"];
LABEL_21:
    uint64_t v20 = _ICQDictionaryForKey(v3, @"failureInfo");
    if (v20)
    {
      [v4 setObject:v20 forKey:@"UpgradeFailure"];
    }
    else if (!v7)
    {
      v21 = _ICQGetLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v21, OS_LOG_TYPE_DEFAULT, "missing failureInfo", buf, 2u);
      }
    }
    v22 = _ICQDictionaryForKey(v3, @"network");
    if (v22)
    {
      [v4 setObject:v22 forKey:@"UpgradeFailureNetwork"];
    }
    else if (!v7)
    {
      v23 = _ICQGetLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v23, OS_LOG_TYPE_DEFAULT, "missing network failure page (might not be needed)", buf, 2u);
      }
    }
    v36 = v20;
    v24 = _ICQDictionaryForKey(v3, @"wifi");
    if (v24)
    {
      [v4 setObject:v24 forKey:@"UpgradeSuccessWiFi"];
    }
    else if (!v7)
    {
      v25 = _ICQGetLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v25, OS_LOG_TYPE_DEFAULT, "missing wifi failure page (might not be needed)", buf, 2u);
      }
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v26 = v3;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v31, "integerValue", v36, v37))
          {
            v32 = _ICQDictionaryForKey(v26, v31);
            [v4 setObject:v32 forKey:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v28);
    }

    v19 = v38;
    v7 = v39;
    v33 = v36;
LABEL_49:

    goto LABEL_50;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(__CFString **)(*((void *)&v44 + 1) + 8 * j);
        v15 = _ICQDictionaryForKey(v9, v14);
        if ([(__CFString *)v14 isEqualToString:@"200"])
        {
          v16 = v4;
          v17 = v15;
          v18 = @"UpgradeComplete";
        }
        else
        {
          v16 = v4;
          v17 = v15;
          v18 = v14;
        }
        [v16 setObject:v17 forKey:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v11);
  }

  v19 = v38;
  v7 = v39;
  if (v38) {
    goto LABEL_21;
  }
LABEL_50:
  v34 = objc_msgSend(v4, "copy", v36);

  return v34;
}

- (_ICQUpgradeFlowSpecification)initWithServerDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _ICQServerDictToOfferTypeAndLevel(v4, (unint64_t *)&self->_offerType, 0);
  uint64_t v5 = [v4 objectForKeyedSubscript:@"needsWifi"];
  self->_needsWiFuint64_t i = _ICQBooleanForServerObjectDefault(v5, 0);

  id v6 = [v4 objectForKeyedSubscript:@"offerInfo"];
  if (!v6) {
    id v6 = v4;
  }
  v23 = v4;
  v7 = +[_ICQUpgradeFlowSpecification sanitizedUpgradeFlowServerDict:v6];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v7;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v15 = [_ICQUpgradeOfferPageSpecification alloc];
        v16 = [v9 objectForKeyedSubscript:v14];
        v17 = [(_ICQUpgradeOfferPageSpecification *)v15 initWithServerDictionary:v16 pageIdentifier:v14];

        if ([v14 isEqualToString:@"UpgradeOffer"]) {
          [v8 insertObject:v17 atIndex:0];
        }
        else {
          [v8 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  v18 = (void *)[v8 copy];
  v24.receiver = self;
  v24.super_class = (Class)_ICQUpgradeFlowSpecification;
  v19 = [(_ICQFlowSpecification *)&v24 initWithPages:v18];
  uint64_t v20 = v19;
  if (v19) {
    objc_storeStrong((id *)&v19->_serverDict, obj);
  }

  return v20;
}

- (NSDictionary)serverDict
{
  return self->_serverDict;
}

- (int64_t)offerType
{
  return self->_offerType;
}

- (void)setOfferType:(int64_t)a3
{
  self->_offerType = a3;
}

- (BOOL)needsWiFi
{
  return self->_needsWiFi;
}

- (void)setNeedsWiFi:(BOOL)a3
{
  self->_needsWiFuint64_t i = a3;
}

- (void).cxx_destruct
{
}

@end