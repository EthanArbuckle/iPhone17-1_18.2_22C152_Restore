@interface SFAutoFillOneTimeCode
+ (BOOL)supportsSecureCoding;
- (BOOL)domainStrictMatch;
- (BOOL)isEqual:(id)a3;
- (NSArray)embeddedDomains;
- (NSDate)lastUseDateOfAssociatedSavedAccount;
- (NSDate)timestamp;
- (NSString)GUID;
- (NSString)code;
- (NSString)detectedCode;
- (NSString)displayCode;
- (NSString)domain;
- (NSString)embeddedDomain;
- (NSString)handle;
- (NSString)machineReadableCode;
- (NSString)user;
- (NSURL)_domainBoundEmbeddedURL;
- (NSURL)_domainBoundTopLevelURL;
- (SFAutoFillOneTimeCode)initWithCoder:(id)a3;
- (SFAutoFillOneTimeCode)initWithIMCoreDictionary:(id)a3;
- (SFAutoFillOneTimeCode)initWithMailOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5;
- (SFAutoFillOneTimeCode)initWithTOTPGenerator:(id)a3 user:(id)a4 highLevelDomain:(id)a5 lastUsedDateOfAssociatedSavedAccount:(id)a6;
- (WBSTOTPGenerator)totpGenerator;
- (id)_embeddedDomainArrayFromIMCoreEmbeddedDomains:(id)a3;
- (id)_secureURLForDomain:(id)a3;
- (id)_stringForSource:(int64_t)a3;
- (id)description;
- (id)localizedSubtitleForContext:(int64_t)a3;
- (id)localizedTitleForContext:(int64_t)a3;
- (int64_t)_matchBoundDomainAndEmbeddedDomainWithFrameURLs:(id)a3;
- (int64_t)_matchBoundDomainAndEmbeddedDomainsWithFrameURLs:(id)a3;
- (int64_t)_matchURL:(id)a3 withBoundDomainURL:(id)a4 strict:(BOOL)a5;
- (int64_t)matchBoundDomainsWithFrameURLs:(id)a3;
- (int64_t)matchDomainWithURL:(id)a3;
- (int64_t)messageID;
- (int64_t)source;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFAutoFillOneTimeCode

- (SFAutoFillOneTimeCode)initWithIMCoreDictionary:(id)a3
{
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)SFAutoFillOneTimeCode;
  v5 = [(SFAutoFillOneTimeCode *)&v68 init];
  v6 = v5;
  if (v5)
  {
    v5->_source = 0;
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v7 = (id *)getIMOneTimeCodeTimeStampKeySymbolLoc_ptr;
    uint64_t v77 = getIMOneTimeCodeTimeStampKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeTimeStampKeySymbolLoc_ptr)
    {
      uint64_t v69 = MEMORY[0x263EF8330];
      uint64_t v70 = 3221225472;
      v71 = __getIMOneTimeCodeTimeStampKeySymbolLoc_block_invoke;
      v72 = &unk_264390A98;
      v73 = &v74;
      v8 = (void *)IMSharedUtilitiesLibrary();
      v9 = dlsym(v8, "IMOneTimeCodeTimeStampKey");
      *(void *)(v73[1] + 24) = v9;
      getIMOneTimeCodeTimeStampKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
      v7 = (id *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v7) {
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:]();
    }
    id v10 = *v7;
    uint64_t v11 = [v4 objectForKeyedSubscript:v10];
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v11;

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v13 = (id *)getIMOneTimeCodeGuidKeySymbolLoc_ptr;
    uint64_t v77 = getIMOneTimeCodeGuidKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeGuidKeySymbolLoc_ptr)
    {
      uint64_t v69 = MEMORY[0x263EF8330];
      uint64_t v70 = 3221225472;
      v71 = __getIMOneTimeCodeGuidKeySymbolLoc_block_invoke;
      v72 = &unk_264390A98;
      v73 = &v74;
      v14 = (void *)IMSharedUtilitiesLibrary();
      v15 = dlsym(v14, "IMOneTimeCodeGuidKey");
      *(void *)(v73[1] + 24) = v15;
      getIMOneTimeCodeGuidKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
      v13 = (id *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v13) {
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:]();
    }
    id v16 = *v13;
    uint64_t v17 = [v4 objectForKeyedSubscript:v16];
    GUID = v6->_GUID;
    v6->_GUID = (NSString *)v17;

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v19 = (id *)getIMOneTimeCodeKeySymbolLoc_ptr;
    uint64_t v77 = getIMOneTimeCodeKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeKeySymbolLoc_ptr)
    {
      uint64_t v69 = MEMORY[0x263EF8330];
      uint64_t v70 = 3221225472;
      v71 = __getIMOneTimeCodeKeySymbolLoc_block_invoke;
      v72 = &unk_264390A98;
      v73 = &v74;
      v20 = (void *)IMSharedUtilitiesLibrary();
      v21 = dlsym(v20, "IMOneTimeCodeKey");
      *(void *)(v73[1] + 24) = v21;
      getIMOneTimeCodeKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
      v19 = (id *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v19) {
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:]();
    }
    id v22 = *v19;
    uint64_t v23 = [v4 objectForKeyedSubscript:v22];
    detectedCode = v6->_detectedCode;
    v6->_detectedCode = (NSString *)v23;

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v25 = (id *)getIMOneTimeCodeDisplayKeySymbolLoc_ptr;
    uint64_t v77 = getIMOneTimeCodeDisplayKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeDisplayKeySymbolLoc_ptr)
    {
      uint64_t v69 = MEMORY[0x263EF8330];
      uint64_t v70 = 3221225472;
      v71 = __getIMOneTimeCodeDisplayKeySymbolLoc_block_invoke;
      v72 = &unk_264390A98;
      v73 = &v74;
      v26 = (void *)IMSharedUtilitiesLibrary();
      v27 = dlsym(v26, "IMOneTimeCodeDisplayKey");
      *(void *)(v73[1] + 24) = v27;
      getIMOneTimeCodeDisplayKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
      v25 = (id *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v25) {
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.4();
    }
    id v28 = *v25;
    uint64_t v29 = [v4 objectForKeyedSubscript:v28];
    displayCode = v6->_displayCode;
    v6->_displayCode = (NSString *)v29;

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v31 = (id *)getIMOneTimeCodeHandleKeySymbolLoc_ptr;
    uint64_t v77 = getIMOneTimeCodeHandleKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeHandleKeySymbolLoc_ptr)
    {
      uint64_t v69 = MEMORY[0x263EF8330];
      uint64_t v70 = 3221225472;
      v71 = __getIMOneTimeCodeHandleKeySymbolLoc_block_invoke;
      v72 = &unk_264390A98;
      v73 = &v74;
      v32 = (void *)IMSharedUtilitiesLibrary();
      v33 = dlsym(v32, "IMOneTimeCodeHandleKey");
      *(void *)(v73[1] + 24) = v33;
      getIMOneTimeCodeHandleKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
      v31 = (id *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v31) {
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.5();
    }
    id v34 = *v31;
    uint64_t v35 = [v4 objectForKeyedSubscript:v34];
    handle = v6->_handle;
    v6->_handle = (NSString *)v35;

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v37 = (id *)getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_ptr;
    uint64_t v77 = getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_ptr)
    {
      uint64_t v69 = MEMORY[0x263EF8330];
      uint64_t v70 = 3221225472;
      v71 = __getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_block_invoke;
      v72 = &unk_264390A98;
      v73 = &v74;
      v38 = (void *)IMSharedUtilitiesLibrary();
      v39 = dlsym(v38, "IMOneTimeCodeMachineReadableCodeKey");
      *(void *)(v73[1] + 24) = v39;
      getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
      v37 = (id *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v37) {
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.6();
    }
    id v40 = *v37;
    uint64_t v41 = [v4 objectForKeyedSubscript:v40];
    machineReadableCode = v6->_machineReadableCode;
    v6->_machineReadableCode = (NSString *)v41;

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v43 = (id *)getIMOneTimeCodeDomainKeySymbolLoc_ptr;
    uint64_t v77 = getIMOneTimeCodeDomainKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeDomainKeySymbolLoc_ptr)
    {
      uint64_t v69 = MEMORY[0x263EF8330];
      uint64_t v70 = 3221225472;
      v71 = __getIMOneTimeCodeDomainKeySymbolLoc_block_invoke;
      v72 = &unk_264390A98;
      v73 = &v74;
      v44 = (void *)IMSharedUtilitiesLibrary();
      v45 = dlsym(v44, "IMOneTimeCodeDomainKey");
      *(void *)(v73[1] + 24) = v45;
      getIMOneTimeCodeDomainKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
      v43 = (id *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v43) {
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.7();
    }
    id v46 = *v43;
    uint64_t v47 = [v4 objectForKeyedSubscript:v46];
    domain = v6->_domain;
    v6->_domain = (NSString *)v47;

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v49 = (id *)getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_ptr;
    uint64_t v77 = getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_ptr)
    {
      uint64_t v69 = MEMORY[0x263EF8330];
      uint64_t v70 = 3221225472;
      v71 = __getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_block_invoke;
      v72 = &unk_264390A98;
      v73 = &v74;
      v50 = (void *)IMSharedUtilitiesLibrary();
      v51 = dlsym(v50, "IMOneTimeCodeEmbeddedDomainKey");
      *(void *)(v73[1] + 24) = v51;
      getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
      v49 = (id *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v49) {
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.8();
    }
    id v52 = *v49;
    uint64_t v53 = [v4 objectForKeyedSubscript:v52];
    embeddedDomain = v6->_embeddedDomain;
    v6->_embeddedDomain = (NSString *)v53;

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v55 = (void *)getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_ptr;
    uint64_t v77 = getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_ptr)
    {
      uint64_t v69 = MEMORY[0x263EF8330];
      uint64_t v70 = 3221225472;
      v71 = __getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_block_invoke;
      v72 = &unk_264390A98;
      v73 = &v74;
      v56 = (void *)IMSharedUtilitiesLibrary();
      v57 = dlsym(v56, "IMOneTimeCodeDomainStrictMatchKey");
      *(void *)(v73[1] + 24) = v57;
      getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
      v55 = (void *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v55) {
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:].cold.9();
    }
    v58 = [v4 objectForKeyedSubscript:*v55];
    v6->_domainStrictMatch = [v58 BOOLValue];

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v59 = (id *)getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_ptr;
    uint64_t v77 = getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_ptr;
    if (!getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_ptr)
    {
      uint64_t v69 = MEMORY[0x263EF8330];
      uint64_t v70 = 3221225472;
      v71 = __getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_block_invoke;
      v72 = &unk_264390A98;
      v73 = &v74;
      v60 = (void *)IMSharedUtilitiesLibrary();
      v61 = dlsym(v60, "IMOneTimeCodeEmbeddedDomainsKey");
      *(void *)(v73[1] + 24) = v61;
      getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
      v59 = (id *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v59) {
      -[SFAutoFillOneTimeCode initWithIMCoreDictionary:]0();
    }
    id v62 = *v59;
    v63 = [v4 objectForKeyedSubscript:v62];
    uint64_t v64 = [(SFAutoFillOneTimeCode *)v6 _embeddedDomainArrayFromIMCoreEmbeddedDomains:v63];
    embeddedDomains = v6->_embeddedDomains;
    v6->_embeddedDomains = (NSArray *)v64;

    v66 = v6;
  }

  return v6;
}

- (SFAutoFillOneTimeCode)initWithMailOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFAutoFillOneTimeCode;
  uint64_t v11 = [(SFAutoFillOneTimeCode *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v11->_source = 1;
    objc_storeStrong((id *)&v11->_displayCode, a3);
    objc_storeStrong((id *)&v12->_detectedCode, a3);
    objc_storeStrong((id *)&v12->_timestamp, a4);
    v12->_messageID = a5;
    GUID = v12->_GUID;
    v12->_GUID = (NSString *)&stru_26CA7A2D0;

    handle = v12->_handle;
    v12->_handle = (NSString *)&stru_26CA7A2D0;

    v15 = v12;
  }

  return v12;
}

- (SFAutoFillOneTimeCode)initWithTOTPGenerator:(id)a3 user:(id)a4 highLevelDomain:(id)a5 lastUsedDateOfAssociatedSavedAccount:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SFAutoFillOneTimeCode;
  v15 = [(SFAutoFillOneTimeCode *)&v23 init];
  id v16 = v15;
  if (v15)
  {
    v15->_source = 2;
    objc_storeStrong((id *)&v15->_totpGenerator, a3);
    uint64_t v17 = [v12 copy];
    user = v16->_user;
    v16->_user = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    domain = v16->_domain;
    v16->_domain = (NSString *)v19;

    objc_storeStrong((id *)&v16->_lastUseDateOfAssociatedSavedAccount, a6);
    v21 = v16;
  }

  return v16;
}

- (NSString)code
{
  unint64_t source = self->_source;
  if (source >= 2)
  {
    if (source == 2)
    {
      totpGenerator = self->_totpGenerator;
      v6 = [MEMORY[0x263EFF910] date];
      id v4 = [(WBSTOTPGenerator *)totpGenerator codeForDate:v6];
    }
    else
    {
      id v4 = &stru_26CA7A2D0;
    }
  }
  else
  {
    machineReadableCode = self->_machineReadableCode;
    if (!machineReadableCode || !self->_domain) {
      machineReadableCode = self->_detectedCode;
    }
    id v4 = machineReadableCode;
  }
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFAutoFillOneTimeCode *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_source == v5->_source
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual())
      {
        char v6 = WBSIsEqual();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t source = self->_source;
  NSUInteger v4 = [(NSString *)self->_detectedCode hash] ^ source;
  NSUInteger v5 = [(NSString *)self->_machineReadableCode hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_displayCode hash];
  NSUInteger v7 = [(NSString *)self->_GUID hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_handle hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSDate *)self->_timestamp hash];
  NSUInteger v10 = [(NSString *)self->_user hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_domain hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_embeddedDomain hash];
  return v9 ^ v12 ^ [(WBSTOTPGenerator *)self->_totpGenerator hash];
}

- (id)description
{
  unint64_t source = self->_source;
  if (source >= 2)
  {
    if (source != 2)
    {
      v14.receiver = self;
      v14.super_class = (Class)SFAutoFillOneTimeCode;
      NSUInteger v7 = [(SFAutoFillOneTimeCode *)&v14 description];
      goto LABEL_7;
    }
    NSUInteger v8 = NSString;
    uint64_t v9 = objc_opt_class();
    NSUInteger v6 = [(SFAutoFillOneTimeCode *)self _stringForSource:self->_source];
    totpGenerator = self->_totpGenerator;
    NSUInteger v11 = [MEMORY[0x263EFF910] date];
    NSUInteger v12 = [(WBSTOTPGenerator *)totpGenerator codeForDate:v11];
    objc_msgSend(v8, "stringWithFormat:", @"<%@: %p; source=%@; code=<promised>%@; generator=%p; user=\"%@\"; domain=\"%@\">",
      v9,
      self,
      v6,
      v12,
      self->_totpGenerator,
      self->_user,
    NSUInteger v7 = self->_domain);
  }
  else
  {
    NSUInteger v4 = NSString;
    uint64_t v5 = objc_opt_class();
    NSUInteger v6 = [(SFAutoFillOneTimeCode *)self _stringForSource:self->_source];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; source=%@; code=\"%@\"; machineReadableCode=\"%@\"; displayCode=\"%@\"; guid=\"%@\"; handle=\"%@\"; timeStamp=\"%@\"; user=\"%@\"; domain=\"%@\" embeddedDomain=\"%@\">",
      v5,
      self,
      v6,
      self->_detectedCode,
      self->_machineReadableCode,
      self->_displayCode,
      self->_GUID,
      self->_handle,
      self->_timestamp,
      self->_user,
      self->_domain,
    NSUInteger v7 = self->_embeddedDomain);
  }

LABEL_7:
  return v7;
}

- (NSDate)timestamp
{
  unint64_t source = self->_source;
  if (source >= 2)
  {
    if (source == 2) {
      [MEMORY[0x263EFF910] date];
    }
    else {
    v3 = [MEMORY[0x263EFF910] now];
    }
  }
  else
  {
    v3 = self->_timestamp;
  }
  return v3;
}

- (NSString)detectedCode
{
  unint64_t source = self->_source;
  if (source >= 2)
  {
    if (source == 2)
    {
      totpGenerator = self->_totpGenerator;
      uint64_t v5 = [MEMORY[0x263EFF910] date];
      v3 = [(WBSTOTPGenerator *)totpGenerator codeForDate:v5];
    }
    else
    {
      v3 = &stru_26CA7A2D0;
    }
  }
  else
  {
    v3 = self->_detectedCode;
  }
  return (NSString *)v3;
}

- (int64_t)matchDomainWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_domain)
  {
    if (v4 && self->_machineReadableCode)
    {
      NSUInteger v6 = [(SFAutoFillOneTimeCode *)self _domainBoundTopLevelURL];
      int64_t v7 = [(SFAutoFillOneTimeCode *)self _matchURL:v5 withBoundDomainURL:v6 strict:self->_domainStrictMatch];
    }
    else
    {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 2;
  }

  return v7;
}

- (int64_t)matchBoundDomainsWithFrameURLs:(id)a3
{
  id v4 = a3;
  if (!self->_domain && ![(NSArray *)self->_embeddedDomains count] && !self->_embeddedDomain)
  {
    int64_t v6 = 2;
    goto LABEL_22;
  }
  if (!self->_machineReadableCode) {
    goto LABEL_21;
  }
  uint64_t v5 = [v4 count];
  if (v5 == 1)
  {
    if (self->_domain && !self->_embeddedDomain && ![(NSArray *)self->_embeddedDomains count])
    {
      int64_t v7 = [v4 firstObject];
      NSUInteger v8 = [(SFAutoFillOneTimeCode *)self _domainBoundTopLevelURL];
      int64_t v6 = [(SFAutoFillOneTimeCode *)self _matchURL:v7 withBoundDomainURL:v8 strict:self->_domainStrictMatch];

      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v5)
  {
    if (self->_domain)
    {
      if ([(NSArray *)self->_embeddedDomains count])
      {
        int64_t v9 = [(SFAutoFillOneTimeCode *)self _matchBoundDomainAndEmbeddedDomainsWithFrameURLs:v4];
LABEL_20:
        int64_t v6 = v9;
        goto LABEL_22;
      }
      if (self->_embeddedDomain)
      {
        int64_t v9 = [(SFAutoFillOneTimeCode *)self _matchBoundDomainAndEmbeddedDomainWithFrameURLs:v4];
        goto LABEL_20;
      }
    }
LABEL_21:
    int64_t v6 = 0;
    goto LABEL_22;
  }
  if (self->_domain || [(NSArray *)self->_embeddedDomains count]) {
    goto LABEL_21;
  }
  int64_t v6 = 2 * (self->_embeddedDomain == 0);
LABEL_22:

  return v6;
}

- (int64_t)_matchBoundDomainAndEmbeddedDomainWithFrameURLs:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SFAutoFillOneTimeCode *)self _domainBoundTopLevelURL];
  int64_t v6 = [(SFAutoFillOneTimeCode *)self _domainBoundEmbeddedURL];
  int64_t v7 = [v4 firstObject];
  int64_t v8 = [(SFAutoFillOneTimeCode *)self _matchURL:v7 withBoundDomainURL:v6 strict:0];

  if (v8)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v22 = v4;
      uint64_t v12 = *(void *)v24;
      int64_t v13 = 2;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          int64_t v16 = [(SFAutoFillOneTimeCode *)self _matchURL:v15 withBoundDomainURL:v5 strict:0];
          int64_t v17 = [(SFAutoFillOneTimeCode *)self _matchURL:v15 withBoundDomainURL:v6 strict:0];
          if (!(v16 | v17))
          {

            int64_t v13 = 0;
            id v4 = v22;
            goto LABEL_21;
          }
          if (v17 != 2 && v16 != 2) {
            int64_t v13 = 1;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }

      id v4 = v22;
    }
    else
    {

      int64_t v13 = 2;
    }
    uint64_t v19 = [v9 lastObject];
    unint64_t v20 = [(SFAutoFillOneTimeCode *)self _matchURL:v19 withBoundDomainURL:v5 strict:0];

    if (v20 <= 1) {
      int64_t v13 = v20;
    }
  }
  else
  {
    int64_t v13 = 0;
  }
LABEL_21:

  return v13;
}

- (int64_t)_matchBoundDomainAndEmbeddedDomainsWithFrameURLs:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v33 = [(SFAutoFillOneTimeCode *)self _domainBoundTopLevelURL];
  uint64_t v5 = [(NSArray *)self->_embeddedDomains firstObject];
  int64_t v6 = [v5 domain];
  int64_t v7 = [(SFAutoFillOneTimeCode *)self _secureURLForDomain:v6];

  int64_t v8 = [v4 firstObject];
  int64_t v9 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v8, v7, [v5 strict]);

  if (v9)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v10 = v4;
    uint64_t v32 = [v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v32)
    {
      v27 = v7;
      uint64_t v28 = v5;
      id obj = v10;
      uint64_t v31 = *(void *)v42;
      int64_t v9 = 2;
      id v29 = v4;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          int64_t v35 = v9;
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v11;
          uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * v11);
          int64_t v36 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v12, v33, self->_domainStrictMatch, v27, v28);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          int64_t v13 = self->_embeddedDomains;
          uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            int64_t v16 = 0;
            uint64_t v17 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v38 != v17) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                unint64_t v20 = [v19 domain];
                v21 = [(SFAutoFillOneTimeCode *)self _secureURLForDomain:v20];
                int64_t v22 = -[SFAutoFillOneTimeCode _matchURL:withBoundDomainURL:strict:](self, "_matchURL:withBoundDomainURL:strict:", v12, v21, [v19 strict]);

                if (v22 > v16) {
                  int64_t v16 = v22;
                }
              }
              uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v15);
          }
          else
          {
            int64_t v16 = 0;
          }

          if (!(v36 | v16))
          {

            int64_t v9 = 0;
            uint64_t v5 = v28;
            id v4 = v29;
            int64_t v7 = v27;
            goto LABEL_31;
          }
          BOOL v23 = v16 == 2 || v36 == 2;
          int64_t v9 = v35;
          if (!v23) {
            int64_t v9 = 1;
          }
          uint64_t v11 = v34 + 1;
        }
        while (v34 + 1 != v32);
        id v4 = v29;
        uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v32) {
          continue;
        }
        break;
      }
      id v10 = obj;

      int64_t v7 = v27;
      uint64_t v5 = v28;
    }
    else
    {

      int64_t v9 = 2;
    }
    long long v24 = [v10 lastObject];
    unint64_t v25 = [(SFAutoFillOneTimeCode *)self _matchURL:v24 withBoundDomainURL:v33 strict:self->_domainStrictMatch];

    if (v25 <= 1) {
      int64_t v9 = v25;
    }
  }
LABEL_31:

  return v9;
}

- (int64_t)_matchURL:(id)a3 withBoundDomainURL:(id)a4 strict:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v8, "safari_hasSameOriginAsURL:", v7)) {
    int64_t v9 = 2;
  }
  else {
    int64_t v9 = !a5 && (objc_msgSend(v8, "safari_hasSameSiteAsURL:", v7) & 1) != 0;
  }

  return v9;
}

- (NSURL)_domainBoundTopLevelURL
{
  return (NSURL *)[(SFAutoFillOneTimeCode *)self _secureURLForDomain:self->_domain];
}

- (NSURL)_domainBoundEmbeddedURL
{
  if ([(NSArray *)self->_embeddedDomains count])
  {
    v3 = [(NSArray *)self->_embeddedDomains firstObject];
    id v4 = [v3 domain];
    uint64_t v5 = [(SFAutoFillOneTimeCode *)self _secureURLForDomain:v4];
  }
  else
  {
    uint64_t v5 = [(SFAutoFillOneTimeCode *)self _secureURLForDomain:self->_embeddedDomain];
  }
  return (NSURL *)v5;
}

- (id)_secureURLForDomain:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F08BA0];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    [v5 setScheme:@"https"];
    [v5 setHost:v4];

    int64_t v6 = [v5 URL];
  }
  else
  {
    int64_t v6 = 0;
  }
  return v6;
}

- (id)_stringForSource:(int64_t)a3
{
  v3 = @"Messages";
  if (a3 == 1) {
    v3 = @"Mail";
  }
  if (a3 == 2) {
    return @"TOTPGenerator";
  }
  else {
    return v3;
  }
}

- (id)_embeddedDomainArrayFromIMCoreEmbeddedDomains:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v10 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF980] array];
    if ([v3 count])
    {
      unint64_t v5 = 0;
      while (1)
      {
        int64_t v6 = [v3 objectAtIndexedSubscript:v5];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        unint64_t v7 = v5 + 1;
        id v8 = [v3 objectAtIndexedSubscript:v7];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          break;
        }
        int64_t v9 = objc_alloc_init(SFAutoFillOneTimeCodeEmbeddedDomainPair);
        [(SFAutoFillOneTimeCodeEmbeddedDomainPair *)v9 setDomain:v6];
        -[SFAutoFillOneTimeCodeEmbeddedDomainPair setStrict:](v9, "setStrict:", [v8 BOOLValue]);
        [v4 addObject:v9];

        unint64_t v5 = v7 + 1;
        if (v5 >= [v3 count]) {
          goto LABEL_7;
        }
      }

      id v10 = 0;
    }
    else
    {
LABEL_7:
      id v10 = v4;
    }
  }
  return v10;
}

- (id)localizedTitleForContext:(int64_t)a3
{
  int64_t source = self->_source;
  if (source == 2) {
    goto LABEL_11;
  }
  if (source == 1)
  {
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (a3 != 1)
      {
        if (!a3) {
          goto LABEL_20;
        }
        goto LABEL_11;
      }
LABEL_19:
      fillCodeString(self->_displayCode);
      id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
  }
  else
  {
    if (source)
    {
      int64_t v9 = &stru_26CA7A2D0;
      goto LABEL_22;
    }
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (a3 != 1)
      {
        if (!a3) {
          goto LABEL_20;
        }
LABEL_11:
        unint64_t v5 = +[SFCredentialProviderExtensionManager sharedManager];
        int v6 = [v5 atLeastOneEnabledExtensionSupportsOneTimeCodes];

        domain = self->_domain;
        if (v6)
        {
          if (domain)
          {
            id v8 = NSString;
LABEL_18:
            uint64_t v11 = _WBSLocalizedString();
            objc_msgSend(v8, "stringWithFormat:", v11, self->_domain);
            int64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_22;
          }
        }
        else if (domain)
        {
          id v8 = NSString;
          goto LABEL_18;
        }
LABEL_20:
        _WBSLocalizedString();
        id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  id v10 = self->_displayCode;
LABEL_21:
  int64_t v9 = (__CFString *)v10;
LABEL_22:
  return v9;
}

- (id)localizedSubtitleForContext:(int64_t)a3
{
  int64_t source = self->_source;
  if (source != 2)
  {
    if (source == 1)
    {
      if ((unint64_t)(a3 - 1) < 3)
      {
LABEL_7:
        _WBSLocalizedString();
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      if (source)
      {
        id v4 = &stru_26CA7A2D0;
        goto LABEL_13;
      }
      if ((unint64_t)(a3 - 1) < 3) {
        goto LABEL_7;
      }
    }
    if (!a3) {
      goto LABEL_11;
    }
  }
  user = self->_user;
  if (!user) {
LABEL_11:
  }
    user = self->_displayCode;
  id v4 = user;
LABEL_13:
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t source = self->_source;
  id v5 = a3;
  [v5 encodeInteger:source forKey:@"source"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_GUID forKey:@"GUID"];
  [v5 encodeObject:self->_detectedCode forKey:@"detectedCode"];
  [v5 encodeObject:self->_displayCode forKey:@"displayCode"];
  [v5 encodeObject:self->_handle forKey:@"handle"];
  [v5 encodeObject:self->_machineReadableCode forKey:@"machineReadableCode"];
  [v5 encodeObject:self->_domain forKey:@"domain"];
  [v5 encodeBool:self->_domainStrictMatch forKey:@"domainStrictMatch"];
  [v5 encodeObject:self->_embeddedDomain forKey:@"embeddedDomain"];
  [v5 encodeObject:self->_embeddedDomains forKey:@"embeddedDomains"];
  [v5 encodeObject:self->_user forKey:@"user"];
}

- (SFAutoFillOneTimeCode)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SFAutoFillOneTimeCode;
  id v5 = [(SFAutoFillOneTimeCode *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user"];
    user = v5->_user;
    v5->_user = (NSString *)v6;

    v5->_int64_t source = [v4 decodeIntegerForKey:@"source"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GUID"];
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detectedCode"];
    detectedCode = v5->_detectedCode;
    v5->_detectedCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayCode"];
    displayCode = v5->_displayCode;
    v5->_displayCode = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"machineReadableCode"];
    machineReadableCode = v5->_machineReadableCode;
    v5->_machineReadableCode = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v20;

    v5->_domainStrictMatch = [v4 decodeBoolForKey:@"domainStrictMatch"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embeddedDomain"];
    embeddedDomain = v5->_embeddedDomain;
    v5->_embeddedDomain = (NSString *)v22;

    uint64_t v24 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"embeddedDomains"];
    embeddedDomains = v5->_embeddedDomains;
    v5->_embeddedDomains = (NSArray *)v24;

    long long v26 = v5;
  }

  return v5;
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)machineReadableCode
{
  return self->_machineReadableCode;
}

- (NSString)displayCode
{
  return self->_displayCode;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)user
{
  return self->_user;
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)domainStrictMatch
{
  return self->_domainStrictMatch;
}

- (NSString)embeddedDomain
{
  return self->_embeddedDomain;
}

- (NSArray)embeddedDomains
{
  return self->_embeddedDomains;
}

- (int64_t)messageID
{
  return self->_messageID;
}

- (WBSTOTPGenerator)totpGenerator
{
  return self->_totpGenerator;
}

- (NSDate)lastUseDateOfAssociatedSavedAccount
{
  return self->_lastUseDateOfAssociatedSavedAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUseDateOfAssociatedSavedAccount, 0);
  objc_storeStrong((id *)&self->_embeddedDomains, 0);
  objc_storeStrong((id *)&self->_embeddedDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_displayCode, 0);
  objc_storeStrong((id *)&self->_machineReadableCode, 0);
  objc_storeStrong((id *)&self->_totpGenerator, 0);
  objc_storeStrong((id *)&self->_detectedCode, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)initWithIMCoreDictionary:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIMOneTimeCodeTimeStampKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillOneTimeCode.m", 19, @"%s", dlerror());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIMOneTimeCodeGuidKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillOneTimeCode.m", 18, @"%s", dlerror());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.3()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIMOneTimeCodeKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillOneTimeCode.m", 15, @"%s", dlerror());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.4()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIMOneTimeCodeDisplayKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillOneTimeCode.m", 17, @"%s", dlerror());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.5()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIMOneTimeCodeHandleKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillOneTimeCode.m", 20, @"%s", dlerror());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.6()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIMOneTimeCodeMachineReadableCodeKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillOneTimeCode.m", 16, @"%s", dlerror());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.7()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIMOneTimeCodeDomainKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillOneTimeCode.m", 21, @"%s", dlerror());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.8()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIMOneTimeCodeEmbeddedDomainKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillOneTimeCode.m", 23, @"%s", dlerror());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.9()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIMOneTimeCodeDomainStrictMatchKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillOneTimeCode.m", 22, @"%s", dlerror());

  __break(1u);
}

- (void)initWithIMCoreDictionary:.cold.10()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getIMOneTimeCodeEmbeddedDomainsKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillOneTimeCode.m", 24, @"%s", dlerror());

  __break(1u);
}

@end