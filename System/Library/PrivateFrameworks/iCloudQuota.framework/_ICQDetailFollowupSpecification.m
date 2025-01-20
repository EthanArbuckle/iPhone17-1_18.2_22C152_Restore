@interface _ICQDetailFollowupSpecification
+ (id)replaceWordsIn:(id)a3 with:(id)a4;
- (NSDictionary)followUpInfo;
- (NSDictionary)followupMesgTemplates;
- (NSDictionary)followupTitleTemplates;
- (NSDictionary)lockScreenInfo;
- (NSDictionary)mesgTemplates;
- (NSDictionary)subTitleTemplates;
- (NSDictionary)titleTemplates;
- (NSString)bundleId;
- (_ICQDetailFollowupSpecification)initWithServerDictionary:(id)a3;
- (id)mesgWithKey:(id)a3;
- (id)subTitleWithKey:(id)a3;
- (id)titleWithKey:(id)a3;
- (void)postFollowupWithController:(id)a3 replaceExisting:(BOOL)a4 completion:(id)a5;
- (void)setBundleId:(id)a3;
- (void)setFollowUpInfo:(id)a3;
- (void)setFollowupMesgTemplates:(id)a3;
- (void)setFollowupTitleTemplates:(id)a3;
- (void)setLockScreenInfo:(id)a3;
- (void)setMesgTemplates:(id)a3;
- (void)setSubTitleTemplates:(id)a3;
- (void)setTitleTemplates:(id)a3;
@end

@implementation _ICQDetailFollowupSpecification

- (_ICQDetailFollowupSpecification)initWithServerDictionary:(id)a3
{
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "request for detail notification object", buf, 2u);
  }

  v13.receiver = self;
  v13.super_class = (Class)_ICQDetailFollowupSpecification;
  v6 = [(_ICQFollowupSpecification *)&v13 initWithServerDictionary:v4];
  v7 = v6;
  if (v6)
  {
    [(_ICQDetailFollowupSpecification *)v6 setBundleId:@"com.apple.mobileslideshow"];
    v8 = [v4 objectForKeyedSubscript:@"lockScreenInfo"];

    if (v8)
    {
      v9 = [v4 objectForKeyedSubscript:@"lockScreenInfo"];
      [(_ICQDetailFollowupSpecification *)v7 setLockScreenInfo:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"followUpInfo"];

    if (v10)
    {
      v11 = [v4 objectForKeyedSubscript:@"followUpInfo"];
      [(_ICQDetailFollowupSpecification *)v7 setFollowUpInfo:v11];
    }
  }

  return v7;
}

- (void)setLockScreenInfo:(id)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_lockScreenInfo, a3);
  v6 = [v5 objectForKeyedSubscript:@"lockTitle"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v5 objectForKeyedSubscript:@"lockTitle"];
    v9 = +[_ICQHelperFunctions parseTemplates:v8];
    [(_ICQDetailFollowupSpecification *)self setTitleTemplates:v9];
  }
  else
  {
    v10 = [v5 objectForKeyedSubscript:@"lockTitle"];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      v43 = @"default";
      v12 = [v5 objectForKeyedSubscript:@"lockTitle"];
      v44[0] = v12;
      objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
      [(_ICQDetailFollowupSpecification *)self setTitleTemplates:v13];
    }
    else
    {
      v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "\"lockTitle\" field not present or of undefined type in lockScreenInfo", (uint8_t *)&v37, 2u);
      }
    }
  }
  v14 = [v5 objectForKeyedSubscript:@"lockSubTitle"];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    v16 = [v5 objectForKeyedSubscript:@"lockSubTitle"];
    uint64_t v17 = +[_ICQHelperFunctions parseTemplates:v16];
LABEL_12:
    v20 = (void *)v17;
    [(_ICQDetailFollowupSpecification *)self setSubTitleTemplates:v17];

    goto LABEL_13;
  }
  v18 = [v5 objectForKeyedSubscript:@"lockSubTitle"];
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  if (v19)
  {
    v41 = @"default";
    v16 = [v5 objectForKeyedSubscript:@"lockSubTitle"];
    v42 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    goto LABEL_12;
  }
  v16 = _ICQGetLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v37) = 0;
    _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "\"lockSubTitle\" field not present or of undefined type in lockScreenInfo", (uint8_t *)&v37, 2u);
  }
LABEL_13:

  v21 = [v5 objectForKeyedSubscript:@"lockMessage"];
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if (v22)
  {
    v23 = [v5 objectForKeyedSubscript:@"lockMessage"];
    uint64_t v24 = +[_ICQHelperFunctions parseTemplates:v23];
LABEL_17:
    v27 = (void *)v24;
    [(_ICQDetailFollowupSpecification *)self setMesgTemplates:v24];

    goto LABEL_18;
  }
  v25 = [v5 objectForKeyedSubscript:@"lockMessage"];
  objc_opt_class();
  char v26 = objc_opt_isKindOfClass();

  if (v26)
  {
    v39 = @"default";
    v23 = [v5 objectForKeyedSubscript:@"lockMessage"];
    v40 = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    goto LABEL_17;
  }
  v23 = _ICQGetLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v37) = 0;
    _os_log_impl(&dword_1D5851000, v23, OS_LOG_TYPE_DEFAULT, "\"lockMessage\" field not present or of undefined type in lockScreenInfo", (uint8_t *)&v37, 2u);
  }
LABEL_18:

  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v29 = [v5 objectForKeyedSubscript:@"actParams"];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [v5 objectForKeyedSubscript:@"action"];

    if (v31)
    {
      v32 = [v5 objectForKeyedSubscript:@"actParams"];
      [v28 setObject:v32 forKey:@"actParams"];

      v33 = [v5 objectForKeyedSubscript:@"action"];
      [v28 setObject:v33 forKey:@"action"];

      [v28 setObject:&stru_1F2DCE430 forKey:@"display"];
      v34 = _ICQLinkForServerMessageParameter(v28);
      [(_ICQFollowupSpecification *)self setNoteActivateLink:v34];
    }
  }
  v35 = [v5 objectForKeyedSubscript:ICQFollowupNotifyingAppIdKey];
  if (v35)
  {
    v36 = _ICQGetLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412290;
      v38 = v35;
      _os_log_impl(&dword_1D5851000, v36, OS_LOG_TYPE_DEFAULT, "Lockscreen info contains notifyingAppId %@", (uint8_t *)&v37, 0xCu);
    }

    [(_ICQFollowupSpecification *)self setNotifyingAppId:v35];
  }
}

- (void)setFollowUpInfo:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_followUpInfo, a3);
  v6 = [v5 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v5 objectForKeyedSubscript:@"title"];
    v9 = +[_ICQHelperFunctions parseTemplates:v8];
    [(_ICQDetailFollowupSpecification *)self setFollowupTitleTemplates:v9];
  }
  else
  {
    v10 = [v5 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      uint64_t v24 = @"default";
      v12 = [v5 objectForKeyedSubscript:@"title"];
      v25[0] = v12;
      objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      [(_ICQDetailFollowupSpecification *)self setFollowupTitleTemplates:v13];
    }
    else
    {
      v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "\"title\" field not present or of undefined type in followups", v21, 2u);
      }
    }
  }
  v14 = [v5 objectForKeyedSubscript:@"mesg"];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    v16 = [v5 objectForKeyedSubscript:@"mesg"];
    uint64_t v17 = +[_ICQHelperFunctions parseTemplates:v16];
LABEL_12:
    v20 = (void *)v17;
    [(_ICQDetailFollowupSpecification *)self setFollowupMesgTemplates:v17];

    goto LABEL_13;
  }
  v18 = [v5 objectForKeyedSubscript:@"mesg"];
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  if (v19)
  {
    char v22 = @"default";
    v16 = [v5 objectForKeyedSubscript:@"mesg"];
    v23 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    goto LABEL_12;
  }
  v16 = _ICQGetLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "\"mesg\" field not present or of undefined type in followups", v21, 2u);
  }
LABEL_13:
}

+ (id)replaceWordsIn:(id)a3 with:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
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
      uint64_t v10 = 0;
      char v11 = v5;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        objc_super v13 = [v6 objectForKey:v12];
        id v5 = [v11 stringByReplacingOccurrencesOfString:v12 withString:v13];

        ++v10;
        char v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)titleWithKey:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = [(_ICQDetailFollowupSpecification *)self titleTemplates];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [(_ICQDetailFollowupSpecification *)self titleTemplates];
  uint64_t v8 = v7;
  if (v6) {
    uint64_t v9 = v4;
  }
  else {
    uint64_t v9 = @"default";
  }
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];

  return v10;
}

- (id)subTitleWithKey:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = [(_ICQDetailFollowupSpecification *)self subTitleTemplates];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [(_ICQDetailFollowupSpecification *)self subTitleTemplates];
  uint64_t v8 = v7;
  if (v6) {
    uint64_t v9 = v4;
  }
  else {
    uint64_t v9 = @"default";
  }
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];

  return v10;
}

- (id)mesgWithKey:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = [(_ICQDetailFollowupSpecification *)self mesgTemplates];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [(_ICQDetailFollowupSpecification *)self mesgTemplates];
  uint64_t v8 = v7;
  if (v6) {
    uint64_t v9 = v4;
  }
  else {
    uint64_t v9 = @"default";
  }
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];

  return v10;
}

- (void)postFollowupWithController:(id)a3 replaceExisting:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "Posting detail notification", buf, 2u);
  }

  char v11 = [(_ICQDetailFollowupSpecification *)self bundleId];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89___ICQDetailFollowupSpecification_postFollowupWithController_replaceExisting_completion___block_invoke;
  v14[3] = &unk_1E6A53870;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  +[_ICQDeviceInfo getInfoWithBundleId:v11 completion:v14];
}

- (NSDictionary)lockScreenInfo
{
  return self->_lockScreenInfo;
}

- (NSDictionary)followUpInfo
{
  return self->_followUpInfo;
}

- (NSDictionary)mesgTemplates
{
  return self->_mesgTemplates;
}

- (void)setMesgTemplates:(id)a3
{
}

- (NSDictionary)titleTemplates
{
  return self->_titleTemplates;
}

- (void)setTitleTemplates:(id)a3
{
}

- (NSDictionary)subTitleTemplates
{
  return self->_subTitleTemplates;
}

- (void)setSubTitleTemplates:(id)a3
{
}

- (NSDictionary)followupMesgTemplates
{
  return self->_followupMesgTemplates;
}

- (void)setFollowupMesgTemplates:(id)a3
{
}

- (NSDictionary)followupTitleTemplates
{
  return self->_followupTitleTemplates;
}

- (void)setFollowupTitleTemplates:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_followupTitleTemplates, 0);
  objc_storeStrong((id *)&self->_followupMesgTemplates, 0);
  objc_storeStrong((id *)&self->_subTitleTemplates, 0);
  objc_storeStrong((id *)&self->_titleTemplates, 0);
  objc_storeStrong((id *)&self->_mesgTemplates, 0);
  objc_storeStrong((id *)&self->_followUpInfo, 0);
  objc_storeStrong((id *)&self->_lockScreenInfo, 0);
}

@end