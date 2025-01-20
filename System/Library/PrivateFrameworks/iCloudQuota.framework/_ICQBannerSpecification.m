@interface _ICQBannerSpecification
+ (id)bannerSpecificationSampleForLevel:(int64_t)a3;
- (BOOL)isDetailBannerInfoAvailable;
- (BOOL)placeholderExists;
- (ICQIconSpecification)iconSpecification;
- (ICQLink)dismissLink;
- (NSArray)links;
- (NSDictionary)iconDetails;
- (NSDictionary)messageTemplates;
- (NSDictionary)titleTemplates;
- (NSNumber)decayUntil;
- (NSNumber)supressUntil;
- (NSString)bannerSource;
- (NSString)linksFormat;
- (NSString)purchaseAttribution;
- (NSString)reason;
- (NSURL)dynamicUIRouteURL;
- (NSURL)serverUIURL;
- (_ICQBannerSpecification)initWithDetailBannerInfo:(id)a3 source:(id)a4;
- (_ICQBannerSpecification)initWithServerDictionary:(id)a3;
- (id)_bannerSpecificationParams;
- (id)iconPath;
- (id)messageWithKey:(id)a3;
- (id)titleWithKey:(id)a3;
- (void)_setDisplayConfigurations:(id)a3;
- (void)setBannerSource:(id)a3;
- (void)setDecayUntil:(id)a3;
- (void)setDismissLink:(id)a3;
- (void)setIconSpecification:(id)a3;
- (void)setLinks:(id)a3;
- (void)setLinksFormat:(id)a3;
- (void)setMessageWithServerMessage:(id)a3;
- (void)setServerUIURL:(id)a3;
- (void)setSupressUntil:(id)a3;
@end

@implementation _ICQBannerSpecification

+ (id)bannerSpecificationSampleForLevel:(int64_t)a3
{
  if (a3 == 3)
  {
    if (_BannerSpecificationSampleForFullLevel_onceToken != -1) {
      dispatch_once(&_BannerSpecificationSampleForFullLevel_onceToken, &__block_literal_global_11);
    }
    v3 = &_BannerSpecificationSampleForFullLevel_sBannerSpecification;
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    if (_BannerSpecificationSampleForAlmostFullLevel_onceToken != -1) {
      dispatch_once(&_BannerSpecificationSampleForAlmostFullLevel_onceToken, &__block_literal_global_2);
    }
    v3 = &_BannerSpecificationSampleForAlmostFullLevel_sBannerSpecification;
LABEL_9:
    id v4 = (id)*v3;
    goto LABEL_11;
  }
  id v4 = 0;
LABEL_11:
  return v4;
}

- (_ICQBannerSpecification)initWithServerDictionary:(id)a3
{
  id v5 = a3;
  v6 = [(_ICQBannerSpecification *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverDict, a3);
    *(_WORD *)&v7->_isDetailBannerInfoAvailable = 0;
    bannerSource = v7->_bannerSource;
    v7->_bannerSource = (NSString *)@"ICQBannerSourceAppBannerInfo";

    v9 = [v5 objectForKeyedSubscript:@"mesg"];
    [(_ICQBannerSpecification *)v7 setMessageWithServerMessage:v9];
  }
  return v7;
}

- (_ICQBannerSpecification)initWithDetailBannerInfo:(id)a3 source:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [(_ICQBannerSpecification *)self init];
  v10 = v9;
  if (v9)
  {
    obuint64_t j = a4;
    id v42 = v8;
    objc_storeStrong((id *)&v9->_serverDict, a3);
    v10->_isDetailBannerInfoAvailable = 1;
    v11 = [v7 objectForKeyedSubscript:@"placeHolderExists"];
    v10->_placeholderExists = [v11 BOOLValue];

    v12 = [v7 objectForKeyedSubscript:@"bannerFooter"];
    [(_ICQBannerSpecification *)v10 setMessageWithServerMessage:v12];

    v40 = [v7 objectForKeyedSubscript:@"displayConfiguration"];
    -[_ICQBannerSpecification _setDisplayConfigurations:](v10, "_setDisplayConfigurations:");
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v44 = v7;
    v14 = [v7 objectForKeyedSubscript:@"mesg"];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v20 = [v19 objectForKeyedSubscript:@"format"];
          v21 = [v19 objectForKeyedSubscript:@"key"];
          [v13 setObject:v20 forKey:v21];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v16);
    }

    v43 = v10;
    objc_storeStrong((id *)&v10->_messageTemplates, v13);
    v22 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v23 = [v44 objectForKeyedSubscript:@"title"];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          v29 = [v28 objectForKeyedSubscript:@"format"];
          v30 = [v28 objectForKeyedSubscript:@"key"];
          [(NSDictionary *)v22 setObject:v29 forKey:v30];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v25);
    }

    v10 = v43;
    titleTemplates = v43->_titleTemplates;
    v43->_titleTemplates = v22;
    v32 = v22;

    id v7 = v44;
    uint64_t v33 = [v44 objectForKeyedSubscript:@"iconDetails"];
    iconDetails = v43->_iconDetails;
    v43->_iconDetails = (NSDictionary *)v33;

    objc_storeStrong((id *)&v43->_bannerSource, obj);
    v35 = [ICQIconSpecification alloc];
    v36 = [v44 objectForKeyedSubscript:@"icon"];
    uint64_t v37 = [(ICQIconSpecification *)v35 initWithDictionary:v36];
    iconSpecification = v43->_iconSpecification;
    v43->_iconSpecification = (ICQIconSpecification *)v37;

    id v8 = v42;
  }

  return v10;
}

- (void)setMessageWithServerMessage:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(_ICQBannerSpecification *)self setLinksFormat:v4];
    [(_ICQBannerSpecification *)self setLinks:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 objectForKeyedSubscript:@"format"];
      [(_ICQBannerSpecification *)self setLinksFormat:v5];

      v6 = [v4 objectForKeyedSubscript:@"params"];
      id v7 = _ICQLinksForServerMessageParameters(v6);
      [(_ICQBannerSpecification *)self setLinks:v7];

      id v8 = +[ICQLink _icqDismissLinkForServerMessageParameters:v6];
      [(_ICQBannerSpecification *)self setDismissLink:v8];
    }
    else
    {
      v9 = _ICQGetLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "invalid banner spec server message:%@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)_setDisplayConfigurations:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 objectForKeyedSubscript:@"decayUntilInMS"];
  if (v4)
  {
    id v5 = (void *)v4;
    v6 = [v14 objectForKeyedSubscript:@"decayUntilInMS"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = [v14 objectForKeyedSubscript:@"decayUntilInMS"];
      [(_ICQBannerSpecification *)self setDecayUntil:v8];
    }
  }
  uint64_t v9 = [v14 objectForKeyedSubscript:@"suppressUntilInMS"];
  if (v9)
  {
    int v10 = (void *)v9;
    id v11 = [v14 objectForKeyedSubscript:@"suppressUntilInMS"];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if (v12)
    {
      id v13 = [v14 objectForKeyedSubscript:@"suppressUntilInMS"];
      [(_ICQBannerSpecification *)self setSupressUntil:v13];
    }
  }
}

- (id)_bannerSpecificationParams
{
  if ([(_ICQBannerSpecification *)self isDetailBannerInfoAvailable]) {
    v3 = @"bannerFooter.params";
  }
  else {
    v3 = @"mesg.params";
  }
  uint64_t v4 = [(NSDictionary *)self->_serverDict valueForKeyPath:v3];
  return v4;
}

- (NSURL)serverUIURL
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(_ICQBannerSpecification *)self _bannerSpecificationParams];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "valueForKeyPath:", @"actParams.openUrl", (void)v11);
        if (v7)
        {
          uint64_t v9 = (void *)v7;
          id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return (NSURL *)v8;
}

- (NSURL)dynamicUIRouteURL
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(_ICQBannerSpecification *)self _bannerSpecificationParams];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "valueForKeyPath:", @"actParams.route", (void)v11);
        if (v7)
        {
          uint64_t v9 = (void *)v7;
          id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return (NSURL *)v8;
}

- (NSString)purchaseAttribution
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(_ICQBannerSpecification *)self _bannerSpecificationParams];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "valueForKeyPath:", @"actParams.purchaseAttribution", (void)v10);
        if (v7)
        {
          id v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return (NSString *)v8;
}

- (id)titleWithKey:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  if ([(_ICQBannerSpecification *)self isDetailBannerInfoAvailable])
  {
    uint64_t v5 = [(_ICQBannerSpecification *)self titleTemplates];
    v6 = [v5 objectForKeyedSubscript:v4];

    uint64_t v7 = [(_ICQBannerSpecification *)self titleTemplates];
    id v8 = v7;
    if (v6) {
      uint64_t v9 = v4;
    }
    else {
      uint64_t v9 = @"default";
    }
    long long v10 = [v7 objectForKeyedSubscript:v9];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)messageWithKey:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  if ([(_ICQBannerSpecification *)self isDetailBannerInfoAvailable])
  {
    uint64_t v5 = [(_ICQBannerSpecification *)self messageTemplates];
    v6 = [v5 objectForKeyedSubscript:v4];

    uint64_t v7 = [(_ICQBannerSpecification *)self messageTemplates];
    id v8 = v7;
    if (v6) {
      uint64_t v9 = v4;
    }
    else {
      uint64_t v9 = @"default";
    }
    long long v10 = [v7 objectForKeyedSubscript:v9];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)iconPath
{
  id v2 = [(_ICQBannerSpecification *)self iconDetails];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"sfSymbolBundlePath"];

  return v3;
}

- (NSString)reason
{
  id v2 = [(NSDictionary *)self->_serverDict objectForKeyedSubscript:@"reason"];
  uint64_t v3 = +[ICQOffer offerReasonForServerReason:v2];

  return (NSString *)v3;
}

- (NSDictionary)messageTemplates
{
  return self->_messageTemplates;
}

- (NSDictionary)titleTemplates
{
  return self->_titleTemplates;
}

- (NSDictionary)iconDetails
{
  return self->_iconDetails;
}

- (NSString)linksFormat
{
  return self->_linksFormat;
}

- (void)setLinksFormat:(id)a3
{
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (ICQLink)dismissLink
{
  return self->_dismissLink;
}

- (void)setDismissLink:(id)a3
{
}

- (BOOL)isDetailBannerInfoAvailable
{
  return self->_isDetailBannerInfoAvailable;
}

- (BOOL)placeholderExists
{
  return self->_placeholderExists;
}

- (void)setServerUIURL:(id)a3
{
}

- (NSString)bannerSource
{
  return self->_bannerSource;
}

- (void)setBannerSource:(id)a3
{
}

- (ICQIconSpecification)iconSpecification
{
  return self->_iconSpecification;
}

- (void)setIconSpecification:(id)a3
{
}

- (NSNumber)supressUntil
{
  return self->_supressUntil;
}

- (void)setSupressUntil:(id)a3
{
}

- (NSNumber)decayUntil
{
  return self->_decayUntil;
}

- (void)setDecayUntil:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decayUntil, 0);
  objc_storeStrong((id *)&self->_supressUntil, 0);
  objc_storeStrong((id *)&self->_iconSpecification, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong((id *)&self->_serverUIURL, 0);
  objc_storeStrong((id *)&self->_dismissLink, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_linksFormat, 0);
  objc_storeStrong((id *)&self->_iconDetails, 0);
  objc_storeStrong((id *)&self->_titleTemplates, 0);
  objc_storeStrong((id *)&self->_messageTemplates, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

@end