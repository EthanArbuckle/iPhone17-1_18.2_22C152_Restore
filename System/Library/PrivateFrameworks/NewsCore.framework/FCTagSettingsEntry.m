@interface FCTagSettingsEntry
- (BOOL)webAccessOptIn;
- (CKRecord)asCKRecord;
- (FCTagSettingsEntry)initWithEntryID:(id)a3 tagID:(id)a4 fontMultiplier:(id)a5 fontMultiplierMacOS:(id)a6 contentScale:(id)a7 contentScaleMacOS:(id)a8 accessToken:(id)a9 webAccessOptIn:(BOOL)a10;
- (NSNumber)contentScale;
- (NSNumber)contentScaleMacOS;
- (NSNumber)fontMultiplier;
- (NSNumber)fontMultiplierMacOS;
- (NSString)accessToken;
- (NSString)identifier;
- (NSString)tagID;
- (id)dictionaryRepresentation;
- (id)initWithEntryID:(void *)a1 dictionaryRepresentation:(void *)a2;
@end

@implementation FCTagSettingsEntry

- (FCTagSettingsEntry)initWithEntryID:(id)a3 tagID:(id)a4 fontMultiplier:(id)a5 fontMultiplierMacOS:(id)a6 contentScale:(id)a7 contentScaleMacOS:(id)a8 accessToken:(id)a9 webAccessOptIn:(BOOL)a10
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v40 = (void *)[[NSString alloc] initWithFormat:@"tag settings list entry must have an identifier"];
    *(_DWORD *)buf = 136315906;
    v44 = "-[FCTagSettingsEntry initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:a"
          "ccessToken:webAccessOptIn:]";
    __int16 v45 = 2080;
    v46 = "FCTagSettingsEntry.m";
    __int16 v47 = 1024;
    int v48 = 24;
    __int16 v49 = 2114;
    v50 = v40;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v17) {
      goto LABEL_6;
    }
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v41 = (void *)[[NSString alloc] initWithFormat:@"tag settings list entry must have a tag identifier"];
    *(_DWORD *)buf = 136315906;
    v44 = "-[FCTagSettingsEntry initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:a"
          "ccessToken:webAccessOptIn:]";
    __int16 v45 = 2080;
    v46 = "FCTagSettingsEntry.m";
    __int16 v47 = 1024;
    int v48 = 25;
    __int16 v49 = 2114;
    v50 = v41;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v42.receiver = self;
  v42.super_class = (Class)FCTagSettingsEntry;
  v23 = [(FCTagSettingsEntry *)&v42 init];
  v24 = v23;
  if (v23)
  {
    if (v16 && v17)
    {
      uint64_t v25 = [v16 copy];
      identifier = v24->_identifier;
      v24->_identifier = (NSString *)v25;

      uint64_t v27 = [v17 copy];
      tagID = v24->_tagID;
      v24->_tagID = (NSString *)v27;

      uint64_t v29 = [v18 copy];
      fontMultiplier = v24->_fontMultiplier;
      v24->_fontMultiplier = (NSNumber *)v29;

      uint64_t v31 = [v19 copy];
      fontMultiplierMacOS = v24->_fontMultiplierMacOS;
      v24->_fontMultiplierMacOS = (NSNumber *)v31;

      uint64_t v33 = [v20 copy];
      contentScale = v24->_contentScale;
      v24->_contentScale = (NSNumber *)v33;

      uint64_t v35 = [v21 copy];
      contentScaleMacOS = v24->_contentScaleMacOS;
      v24->_contentScaleMacOS = (NSNumber *)v35;

      uint64_t v37 = [v22 copy];
      accessToken = v24->_accessToken;
      v24->_accessToken = (NSString *)v37;

      v24->_webAccessOptIn = a10;
    }
    else
    {

      v24 = 0;
    }
  }

  return v24;
}

- (CKRecord)asCKRecord
{
  if (qword_1EB5D1058 != -1) {
    dispatch_once(&qword_1EB5D1058, &__block_literal_global_9);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v4 = [(FCTagSettingsEntry *)self identifier];
  v5 = (void *)[v3 initWithRecordName:v4 zoneID:_MergedGlobals_143];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"TagSettings" recordID:v5];
  v7 = [(FCTagSettingsEntry *)self tagID];
  [v6 setValue:v7 forKey:@"tagID"];

  v8 = [(FCTagSettingsEntry *)self fontMultiplier];
  [v6 setValue:v8 forKey:@"fontMultiplier"];

  v9 = [(FCTagSettingsEntry *)self fontMultiplierMacOS];
  [v6 setValue:v9 forKey:@"fontMultiplierMacOS"];

  v10 = [(FCTagSettingsEntry *)self contentScale];
  [v6 setValue:v10 forKey:@"contentScale"];

  v11 = [(FCTagSettingsEntry *)self contentScaleMacOS];
  [v6 setValue:v11 forKey:@"contentScaleMacOS"];

  v12 = [(FCTagSettingsEntry *)self accessToken];
  [v6 setValue:v12 forKey:@"accessToken"];

  if ([(FCTagSettingsEntry *)self webAccessOptIn])
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[FCTagSettingsEntry webAccessOptIn](self, "webAccessOptIn"));
    [v6 setValue:v13 forKey:@"webAccessOptIn"];
  }
  return (CKRecord *)v6;
}

uint64_t __32__FCTagSettingsEntry_asCKRecord__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = [v0 initWithZoneName:@"UserInfo" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v2 = _MergedGlobals_143;
  _MergedGlobals_143 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (NSNumber)fontMultiplier
{
  return self->_fontMultiplier;
}

- (NSNumber)fontMultiplierMacOS
{
  return self->_fontMultiplierMacOS;
}

- (NSNumber)contentScale
{
  return self->_contentScale;
}

- (NSNumber)contentScaleMacOS
{
  return self->_contentScaleMacOS;
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (BOOL)webAccessOptIn
{
  return self->_webAccessOptIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_contentScaleMacOS, 0);
  objc_storeStrong((id *)&self->_contentScale, 0);
  objc_storeStrong((id *)&self->_fontMultiplierMacOS, 0);
  objc_storeStrong((id *)&self->_fontMultiplier, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)initWithEntryID:(void *)a1 dictionaryRepresentation:(void *)a2
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v3 objectForKeyedSubscript:@"tagID"];
    v5 = [v3 objectForKeyedSubscript:@"fontMultiplier"];
    v6 = [v3 objectForKeyedSubscript:@"fontMultiplierMacOS"];
    v7 = [v3 objectForKeyedSubscript:@"contentScale"];
    v8 = [v3 objectForKeyedSubscript:@"contentScaleMacOS"];
    v9 = [v3 objectForKeyedSubscript:@"accessToken"];
    v10 = [v3 objectForKeyedSubscript:@"webAccessOptIn"];

    v11 = [NSString stringWithFormat:@"ts-%@", v4];
    LOBYTE(v13) = [v10 BOOLValue];
    id v2 = (id)[v2 initWithEntryID:v11 tagID:v4 fontMultiplier:v5 fontMultiplierMacOS:v6 contentScale:v7 contentScaleMacOS:v8 accessToken:v9 webAccessOptIn:v13];
  }
  return v2;
}

- (id)dictionaryRepresentation
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [a1 tagID];
  [v2 setObject:v3 forKey:@"tagID"];

  v4 = [a1 fontMultiplier];

  if (v4)
  {
    v5 = [a1 fontMultiplier];
    [v2 setObject:v5 forKey:@"fontMultiplier"];
  }
  v6 = [a1 fontMultiplierMacOS];

  if (v6)
  {
    v7 = [a1 fontMultiplierMacOS];
    [v2 setObject:v7 forKey:@"fontMultiplierMacOS"];
  }
  v8 = [a1 contentScale];

  if (v8)
  {
    v9 = [a1 contentScale];
    [v2 setObject:v9 forKey:@"contentScale"];
  }
  v10 = [a1 contentScaleMacOS];

  if (v10)
  {
    v11 = [a1 contentScaleMacOS];
    [v2 setObject:v11 forKey:@"contentScaleMacOS"];
  }
  v12 = [a1 accessToken];

  if (v12)
  {
    uint64_t v13 = [a1 accessToken];
    [v2 setObject:v13 forKey:@"accessToken"];
  }
  if ([a1 webAccessOptIn])
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "webAccessOptIn"));
    [v2 setObject:v14 forKey:@"webAccessOptIn"];
  }
  v15 = (void *)[v2 copy];

  return v15;
}

@end