@interface ICQOffer
+ (BOOL)supportsSecureCoding;
+ (id)_settingsBannerSpecificationWithServerDictionary:(id)a3 bundleId:(id)a4;
+ (id)offerReasonForServerReason:(id)a3;
+ (id)sampleOfferForLevel:(int64_t)a3;
- (BOOL)iTunesAccountExists;
- (BOOL)isBuddyOffer;
- (BOOL)isDefaultOffer;
- (BOOL)isDetailAppBannerOffer;
- (BOOL)isExpired;
- (BOOL)isPremiumOffer;
- (BOOL)placeholderExists;
- (BOOL)showsPhotoVideoCounts;
- (ICQActionBasedUniversalLinkSpecification)actionBasedUniversalLinkSpecification;
- (ICQOffer)initWithCoder:(id)a3;
- (ICQOffer)initWithServerDictionary:(id)a3 accountAltDSID:(id)a4 notificationID:(id)a5 retrievalDate:(id)a6 callbackInterval:(double)a7 appLaunchLink:(id)a8 bundleIdentifier:(id)a9;
- (NSDate)expirationDate;
- (NSDate)lastUpdated;
- (NSDate)retrievalDate;
- (NSString)accountAltDSID;
- (NSString)appVersionId;
- (NSString)bundleIdentifier;
- (NSString)context;
- (NSString)notificationID;
- (NSString)offerId;
- (NSURL)requestedServerUIURL;
- (NSURL)serverUIURL;
- (_ICQAppLaunchLink)appLaunchLink;
- (_ICQBannerSpecification)bannerSpecification;
- (_ICQBannerSpecification)inAppMessageSpecification;
- (_ICQBannerSpecification)recommendationSpecification;
- (_ICQBannerSpecification)settingsBannerSpecification;
- (_ICQBannerSpecification)universalLinkSpecification;
- (_ICQBannerSpecification)universalSuccessInfoSpecification;
- (_ICQButtonSpecification)buttonSpecification;
- (_ICQDeviceInfo)deviceInfo;
- (_ICQDynamicUISpecification)dynamicUISpecification;
- (_ICQFollowupSpecification)followupSpecification;
- (_ICQUpgradeFlowSpecification)upgradeFlowSpecification;
- (_ICQXMLSpecification)XMLSpecification;
- (double)_callbackInterval;
- (id)_processICQURL:(id)a3;
- (id)alertSpecificationAtIndex:(unint64_t)a3;
- (id)alertSpecificationForAlertKey:(id)a3;
- (id)debugDescription;
- (id)inAppMessageSpecificationForReason:(id)a3 bundleId:(id)a4;
- (id)journeyLinkForId:(id)a3;
- (id)messageSpecificationForPlacement:(id)a3;
- (id)messageSpecificationForReason:(id)a3 bundleId:(id)a4 placement:(id)a5;
- (id)settingsBannerSpecificationForReason:(id)a3 bundleId:(id)a4;
- (id)storagePurchaseKeybagForButtonId:(id)a3;
- (id)universalLink;
- (id)universalLinkForContext:(id)a3;
- (id)universalSuccessLink;
- (int64_t)action;
- (int64_t)level;
- (int64_t)offerType;
- (unint64_t)bannerPriority;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountAltDSID:(id)a3;
- (void)setAppLaunchLink:(id)a3;
- (void)setAppVersionId:(id)a3;
- (void)setBannerSpecification:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setButtonSpecification:(id)a3;
- (void)setContext:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setFollowupSpecification:(id)a3;
- (void)setITunesAccountExists:(BOOL)a3;
- (void)setInAppMessageSpecification:(id)a3;
- (void)setLevel:(int64_t)a3;
- (void)setNotificationID:(id)a3;
- (void)setOfferId:(id)a3;
- (void)setRecommendationSpecification:(id)a3;
- (void)setRequestedServerUIURL:(id)a3;
- (void)setRetrievalDate:(id)a3;
- (void)setSettingsBannerSpecification:(id)a3;
- (void)setUniversalLinkSpecification:(id)a3;
- (void)setUniversalSuccessInfoSpecification:(id)a3;
- (void)setUpgradeFlowSpecification:(id)a3;
- (void)setXMLSpecification:(id)a3;
- (void)universalLink;
- (void)universalSuccessLink;
- (void)updateOfferWithAction:(int64_t)a3;
- (void)updateOfferWithPlanDetails:(id)a3 actionString:(id)a4;
@end

@implementation ICQOffer

- (BOOL)isExpired
{
  expirationDate = self->_expirationDate;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(expirationDate) = [(NSDate *)expirationDate compare:v3] == NSOrderedAscending;

  return (char)expirationDate;
}

- (BOOL)showsPhotoVideoCounts
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(ICQOffer *)self bundleIdentifier];
  if (![v3 isEqualToString:@"com.apple.mobileslideshow"]
    || ![(ICQOffer *)self isDetailAppBannerOffer])
  {

    return 0;
  }
  BOOL v4 = [(ICQOffer *)self placeholderExists];

  if (!v4) {
    return 0;
  }
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Offer %@ will show count", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  serverDictionary = self->_serverDictionary;
  id v6 = a3;
  [v6 encodeObject:serverDictionary forKey:@"serverDict"];
  [v6 encodeObject:self->_accountAltDSID forKey:@"accountAltDSID"];
  [v6 encodeObject:self->_notificationID forKey:@"notificationID"];
  [v6 encodeObject:self->_retrievalDate forKey:@"retrievalDate"];
  [v6 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v6 encodeObject:self->_appVersionId forKey:@"appVersionId"];
  [(ICQOffer *)self _callbackInterval];
  objc_msgSend(v6, "encodeDouble:forKey:", @"callbackInterval");
  [v6 encodeObject:self->_context forKey:@"context"];
  v5 = [(ICQOffer *)self requestedServerUIURL];
  [v6 encodeObject:v5 forKey:@"requestedServerUIURL"];

  [v6 encodeInteger:self->_actionOverride forKey:@"actionOverride"];
  [v6 encodeObject:self->_appLaunchLink forKey:@"appLaunchLink"];
}

- (ICQOffer)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICQOffer;
  v5 = [(ICQOffer *)&v25 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v24 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v23 = [v4 decodeObjectOfClasses:v24 forKey:@"serverDict"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountAltDSID"];
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationID"];
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"retrievalDate"];
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    [v4 decodeDoubleForKey:@"callbackInterval"];
    double v17 = v16;
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appVersionId"];
    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appLaunchLink"];
    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedServerUIURL"];
    [(ICQOffer *)v5 setRequestedServerUIURL:v21];

    v5->_actionOverride = [v4 decodeIntegerForKey:@"actionOverride"];
    [(ICQOffer *)v5 setContext:v18];
    [(ICQOffer *)v5 setAppVersionId:v19];
    v5 = [(ICQOffer *)v5 initWithServerDictionary:v23 accountAltDSID:v12 notificationID:v13 retrievalDate:v14 callbackInterval:v20 appLaunchLink:v15 bundleIdentifier:v17];
  }
  return v5;
}

- (NSURL)serverUIURL
{
  v3 = [(ICQOffer *)self requestedServerUIURL];

  if (v3)
  {
    uint64_t v4 = [(ICQOffer *)self requestedServerUIURL];
  }
  else
  {
    v5 = [(_ICQBannerSpecification *)self->_bannerSpecification serverUIURL];

    if (v5)
    {
      bannerSpecification = self->_bannerSpecification;
    }
    else
    {
      uint64_t v7 = [(_ICQFollowupSpecification *)self->_followupSpecification serverUIURL];

      if (v7)
      {
        bannerSpecification = self->_followupSpecification;
      }
      else
      {
        uint64_t v8 = [(_ICQBannerSpecification *)self->_universalLinkSpecification serverUIURL];

        if (!v8) {
          goto LABEL_15;
        }
        bannerSpecification = self->_universalLinkSpecification;
      }
    }
    uint64_t v4 = [bannerSpecification serverUIURL];
  }
  uint64_t v8 = (void *)v4;
  if (v4)
  {
    uint64_t v9 = [(ICQOffer *)self bundleIdentifier];
    if ([v9 isEqualToString:@"com.apple.icq"])
    {
      uint64_t v10 = [(ICQOffer *)self context];

      if (!v10) {
        goto LABEL_15;
      }
      [(ICQOffer *)self _processICQURL:v8];
      v8 = uint64_t v9 = v8;
    }
  }
LABEL_15:
  return (NSURL *)v8;
}

- (_ICQDynamicUISpecification)dynamicUISpecification
{
  v3 = [(ICQOffer *)self serverUIURL];
  p_bannerSpecification = (id *)&self->_bannerSpecification;
  v5 = [(_ICQBannerSpecification *)self->_bannerSpecification dynamicUIRouteURL];

  if (v5) {
    goto LABEL_5;
  }
  p_bannerSpecification = (id *)&self->_followupSpecification;
  id v6 = [(_ICQFollowupSpecification *)self->_followupSpecification dynamicUIRouteURL];

  if (v6) {
    goto LABEL_5;
  }
  universalLinkSpecification = self->_universalLinkSpecification;
  p_universalLinkSpecification = &self->_universalLinkSpecification;
  uint64_t v9 = [(_ICQBannerSpecification *)universalLinkSpecification dynamicUIRouteURL];

  if (v9)
  {
    p_bannerSpecification = (id *)p_universalLinkSpecification;
LABEL_5:
    uint64_t v10 = [*p_bannerSpecification dynamicUIRouteURL];
    uint64_t v9 = [*p_bannerSpecification purchaseAttribution];
    goto LABEL_6;
  }
  uint64_t v10 = 0;
LABEL_6:
  uint64_t v11 = [[_ICQDynamicUISpecification alloc] initWithRouteURL:v10 pageContentsURL:v3 attributionSuffix:v9];

  return v11;
}

- (id)universalLink
{
  v3 = [(ICQOffer *)self universalLinkSpecification];
  uint64_t v4 = [v3 links];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(ICQOffer *)self universalLinkSpecification];
    uint64_t v7 = [v6 links];
    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    uint64_t v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(ICQOffer *)self universalLink];
    }

    uint64_t v8 = 0;
  }
  return v8;
}

- (id)universalSuccessLink
{
  v3 = [(ICQOffer *)self universalSuccessInfoSpecification];
  uint64_t v4 = [v3 links];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(ICQOffer *)self universalSuccessInfoSpecification];
    uint64_t v7 = [v6 links];
    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    uint64_t v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(ICQOffer *)self universalSuccessLink];
    }

    uint64_t v8 = 0;
  }
  return v8;
}

- (id)_processICQURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICQOffer *)self context];
  id v6 = objc_msgSend(v4, "icq_URLByAppendingQueryParamtersFromContext:", v5);

  return v6;
}

- (id)journeyLinkForId:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSDictionary *)self->_serverDictionary objectForKeyedSubscript:@"journeyLinks"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"btnId", (void)v18);
        if ([v11 isEqualToString:v4])
        {
          v13 = [v10 objectForKeyedSubscript:@"btnTitle"];
          v14 = [v10 objectForKeyedSubscript:@"btnAction"];
          v15 = [v10 objectForKeyedSubscript:@"btnActParams"];
          double v16 = [v10 objectForKeyedSubscript:@"btnId"];
          v12 = _ICQLinkForServerValues(v13, v14, v15, 0, v16, 0);

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)universalLinkForContext:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICQOffer universalLinkForContext:]();
  }

  uint64_t v6 = [(ICQActionBasedUniversalLinkSpecification *)self->_actionBasedUniversalLinkSpecification icqLinkForContext:v4];
  uint64_t v7 = _ICQGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "universalLinkForContext found action based link", buf, 2u);
    }

    id v9 = v6;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "universalLinkForContext falling back to legacy universal link", v12, 2u);
    }

    id v9 = [(ICQOffer *)self universalLink];
  }
  uint64_t v10 = v9;

  return v10;
}

- (id)messageSpecificationForPlacement:(id)a3
{
  if ([a3 isEqualToString:@"InSettingsAppDetail"]) {
    [(ICQOffer *)self settingsBannerSpecification];
  }
  else {
  id v4 = [(ICQOffer *)self inAppMessageSpecification];
  }
  return v4;
}

- (id)messageSpecificationForReason:(id)a3 bundleId:(id)a4 placement:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  if ([a5 isEqualToString:@"InSettingsAppDetail"]) {
    [(ICQOffer *)self settingsBannerSpecificationForReason:v9 bundleId:v8];
  }
  else {
  uint64_t v10 = [(ICQOffer *)self inAppMessageSpecificationForReason:v9 bundleId:v8];
  }

  return v10;
}

- (id)inAppMessageSpecificationForReason:(id)a3 bundleId:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSDictionary *)self->_serverDictionary objectForKeyedSubscript:@"detailAppBannerInfo"];
  if (v8)
  {

    goto LABEL_4;
  }
  id v9 = [(NSDictionary *)self->_serverDictionary objectForKeyedSubscript:@"bubbleBannerInfo"];

  if (v9)
  {
LABEL_4:
    uint64_t v10 = [(NSDictionary *)self->_serverDictionary objectForKeyedSubscript:@"bubbleBannerInfo"];
    uint64_t v11 = _ICQBubbleBannerSpecificationForServerDict(v10, v7);

    if (v11)
    {
      uint64_t v11 = v11;
      v12 = (_ICQBannerSpecification *)v11;
      goto LABEL_26;
    }
    v13 = [(NSDictionary *)self->_serverDictionary objectForKeyedSubscript:@"detailAppBannerInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = _ICQServerDictionaryForBundleIdentifier(v13, v7, v6, 0);
      if (!v14)
      {
        v15 = _ICQGetLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412290;
          v22 = (const char *)v6;
          _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "Using banner fallback search for reason %@", (uint8_t *)&v21, 0xCu);
        }

        v14 = _ICQServerDictionaryForBundleIdentifier(v13, @"__WILDCARD__", v6, 0);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [[_ICQBannerSpecification alloc] initWithDetailBannerInfo:v14 source:@"ICQBannerSourceDetailAppBannerInfo"];
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      if (v14)
      {
        double v17 = _ICQGetLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          long long v18 = (objc_class *)objc_opt_class();
          Name = class_getName(v18);
          int v21 = 136315394;
          v22 = Name;
          __int16 v23 = 2112;
          v24 = v14;
          _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v21, 0x16u);
        }
      }
    }
    else
    {
      if (!v13)
      {
        v12 = 0;
        goto LABEL_25;
      }
      v14 = _ICQGetLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        double v16 = (objc_class *)objc_opt_class();
        int v21 = 136315394;
        v22 = class_getName(v16);
        __int16 v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v21, 0x16u);
      }
    }
    v12 = 0;
    goto LABEL_24;
  }
  uint64_t v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[ICQOffer inAppMessageSpecificationForReason:bundleId:](v11);
  }
  v12 = 0;
LABEL_26:

  return v12;
}

- (id)settingsBannerSpecificationForReason:(id)a3 bundleId:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSDictionary *)self->_serverDictionary objectForKeyedSubscript:@"settingsBannerInfo"];

  if (v8)
  {
    id v9 = @"ICQBannerSourceSettingsBannerInfo";
    uint64_t v10 = [(NSDictionary *)self->_serverDictionary objectForKeyedSubscript:@"settingsBannerInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = _ICQServerDictionaryForBundleIdentifier(v10, v7, v6, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [[_ICQBannerSpecification alloc] initWithDetailBannerInfo:v11 source:v9];
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      if (v11)
      {
        v14 = _ICQGetLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (objc_class *)objc_opt_class();
          int v17 = 136315394;
          Name = class_getName(v15);
          __int16 v19 = 2112;
          long long v20 = v11;
          _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v17, 0x16u);
        }
      }
    }
    else
    {
      if (!v10)
      {
        v12 = 0;
        goto LABEL_17;
      }
      uint64_t v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        int v17 = 136315394;
        Name = class_getName(v13);
        __int16 v19 = 2112;
        long long v20 = v10;
        _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v17, 0x16u);
      }
    }
    v12 = 0;
    goto LABEL_16;
  }
  _ICQGetLogSystem();
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
    -[ICQOffer settingsBannerSpecificationForReason:bundleId:]((os_log_t)v9);
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"Offer server dictionary: %@", self->_serverDictionary];
}

+ (id)_settingsBannerSpecificationWithServerDictionary:(id)a3 bundleId:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:@"settingsBannerInfo"];

  if (!v7)
  {
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  id v8 = [v5 objectForKeyedSubscript:@"settingsBannerInfo"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v8)
    {
      uint64_t v10 = 0;
      goto LABEL_15;
    }
    id v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      int v15 = 136315394;
      Name = class_getName(v11);
      __int16 v17 = 2112;
      long long v18 = v8;
      _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_13;
  }
  id v9 = _ICQServerDictionaryForBundleIdentifier(v8, v6, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v9)
    {
      v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        int v15 = 136315394;
        Name = class_getName(v13);
        __int16 v17 = 2112;
        long long v18 = v9;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v15, 0x16u);
      }
    }
LABEL_13:
    uint64_t v10 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = [[_ICQBannerSpecification alloc] initWithDetailBannerInfo:v9 source:@"ICQBannerSourceSettingsBannerInfo"];
LABEL_14:

LABEL_15:
LABEL_16:

  return v10;
}

- (NSDate)retrievalDate
{
  return self->_retrievalDate;
}

- (void)setRetrievalDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (int64_t)offerType
{
  return self->_offerType;
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)appVersionId
{
  return self->_appVersionId;
}

- (void)setAppVersionId:(id)a3
{
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)setAccountAltDSID:(id)a3
{
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
}

- (NSString)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
}

- (ICQActionBasedUniversalLinkSpecification)actionBasedUniversalLinkSpecification
{
  return self->_actionBasedUniversalLinkSpecification;
}

- (_ICQBannerSpecification)bannerSpecification
{
  return self->_bannerSpecification;
}

- (void)setBannerSpecification:(id)a3
{
}

- (_ICQBannerSpecification)recommendationSpecification
{
  return self->_recommendationSpecification;
}

- (void)setRecommendationSpecification:(id)a3
{
}

- (_ICQBannerSpecification)inAppMessageSpecification
{
  return self->_inAppMessageSpecification;
}

- (void)setInAppMessageSpecification:(id)a3
{
}

- (_ICQBannerSpecification)settingsBannerSpecification
{
  return self->_settingsBannerSpecification;
}

- (void)setSettingsBannerSpecification:(id)a3
{
}

- (_ICQButtonSpecification)buttonSpecification
{
  return self->_buttonSpecification;
}

- (void)setButtonSpecification:(id)a3
{
}

- (_ICQFollowupSpecification)followupSpecification
{
  return self->_followupSpecification;
}

- (void)setFollowupSpecification:(id)a3
{
}

- (_ICQUpgradeFlowSpecification)upgradeFlowSpecification
{
  return self->_upgradeFlowSpecification;
}

- (void)setUpgradeFlowSpecification:(id)a3
{
}

- (_ICQXMLSpecification)XMLSpecification
{
  return self->_XMLSpecification;
}

- (void)setXMLSpecification:(id)a3
{
}

- (_ICQDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (_ICQBannerSpecification)universalLinkSpecification
{
  return self->_universalLinkSpecification;
}

- (void)setUniversalLinkSpecification:(id)a3
{
}

- (_ICQBannerSpecification)universalSuccessInfoSpecification
{
  return self->_universalSuccessInfoSpecification;
}

- (void)setUniversalSuccessInfoSpecification:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)iTunesAccountExists
{
  return self->_iTunesAccountExists;
}

- (void)setITunesAccountExists:(BOOL)a3
{
  self->_iTunesAccountExists = a3;
}

- (_ICQAppLaunchLink)appLaunchLink
{
  return self->_appLaunchLink;
}

- (void)setAppLaunchLink:(id)a3
{
}

- (NSURL)requestedServerUIURL
{
  return self->_requestedServerUIURL;
}

- (void)setRequestedServerUIURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedServerUIURL, 0);
  objc_storeStrong((id *)&self->_appLaunchLink, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_universalSuccessInfoSpecification, 0);
  objc_storeStrong((id *)&self->_universalLinkSpecification, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_XMLSpecification, 0);
  objc_storeStrong((id *)&self->_upgradeFlowSpecification, 0);
  objc_storeStrong((id *)&self->_followupSpecification, 0);
  objc_storeStrong((id *)&self->_buttonSpecification, 0);
  objc_storeStrong((id *)&self->_settingsBannerSpecification, 0);
  objc_storeStrong((id *)&self->_inAppMessageSpecification, 0);
  objc_storeStrong((id *)&self->_recommendationSpecification, 0);
  objc_storeStrong((id *)&self->_bannerSpecification, 0);
  objc_storeStrong((id *)&self->_actionBasedUniversalLinkSpecification, 0);
  objc_storeStrong((id *)&self->_offerId, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
  objc_storeStrong((id *)&self->_appVersionId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_retrievalDate, 0);
  objc_storeStrong((id *)&self->_planDetailsOverride, 0);
  objc_storeStrong((id *)&self->_serverDictionary, 0);
}

+ (id)sampleOfferForLevel:(int64_t)a3
{
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  [v4 setRetrievalDate:v5];

  [v4 setLevel:a3];
  [v4 setAccountAltDSID:&stru_1F2DCE430];
  [v4 setNotificationID:&stru_1F2DCE430];
  [v4 setOfferId:&stru_1F2DCE430];
  id v6 = +[_ICQBannerSpecification bannerSpecificationSampleForLevel:a3];
  [v4 setBannerSpecification:v6];

  id v7 = +[_ICQButtonSpecification buttonSpecificationSampleForLevel:a3];
  [v4 setButtonSpecification:v7];

  id v8 = +[_ICQUpgradeFlowSpecification upgradeFlowSpecificationSampleForLevel:a3];
  [v4 setUpgradeFlowSpecification:v8];

  return v4;
}

- (ICQOffer)initWithServerDictionary:(id)a3 accountAltDSID:(id)a4 notificationID:(id)a5 retrievalDate:(id)a6 callbackInterval:(double)a7 appLaunchLink:(id)a8 bundleIdentifier:(id)a9
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v152 = a6;
  id v151 = a8;
  id v19 = a9;
  v153.receiver = self;
  v153.super_class = (Class)ICQOffer;
  long long v20 = [(ICQOffer *)&v153 init];
  if (!v20) {
    goto LABEL_134;
  }
  id v149 = a8;
  uint64_t v21 = [v16 copy];
  serverDictionary = v20->_serverDictionary;
  v20->_serverDictionary = (NSDictionary *)v21;

  uint64_t v23 = [v19 copy];
  bundleIdentifier = v20->_bundleIdentifier;
  v20->_bundleIdentifier = (NSString *)v23;

  objc_storeStrong((id *)&v20->_retrievalDate, a6);
  uint64_t v25 = [(NSDate *)v20->_retrievalDate dateByAddingTimeInterval:a7];
  expirationDate = v20->_expirationDate;
  v20->_expirationDate = (NSDate *)v25;

  _ICQServerDictToOfferTypeAndLevel(v16, (unint64_t *)&v20->_offerType, &v20->_level);
  id v150 = v17;
  uint64_t v27 = [v17 copy];
  accountAltDSID = v20->_accountAltDSID;
  v20->_accountAltDSID = (NSString *)v27;

  uint64_t v29 = [v18 copy];
  notificationID = v20->_notificationID;
  v20->_notificationID = (NSString *)v29;

  uint64_t v31 = _ICQStringForKey(v16, @"offerId");
  offerId = v20->_offerId;
  v20->_offerId = (NSString *)v31;

  id v33 = v16;
  id v34 = v19;
  v35 = _ICQBubbleBannerSpecificationForServerDict(v33, v34);
  v36 = v35;
  id v147 = v19;
  id v148 = v18;
  if (v35)
  {
    v37 = v35;
    goto LABEL_33;
  }
  v38 = [v33 objectForKeyedSubscript:@"detailAppBannerInfo"];
  if (!v38)
  {
    v39 = v34;
    id v40 = v33;
    if ([v39 isEqualToString:@"com.apple.icq"]) {
      v41 = @"universalLinkInfo";
    }
    else {
      v41 = @"appBannerInfo";
    }
    v42 = [v40 objectForKeyedSubscript:v41];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = _ICQServerDictionaryForBundleIdentifier(v42, v39, 0, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = [[_ICQBannerSpecification alloc] initWithServerDictionary:v43];
      }
      else
      {
        if (v43)
        {
          v51 = _ICQGetLogSystem();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v52 = (objc_class *)objc_opt_class();
            Name = class_getName(v52);
            *(_DWORD *)buf = 136315394;
            v163 = Name;
            __int16 v164 = 2112;
            v165 = v43;
            _os_log_impl(&dword_1D5851000, v51, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
          }
        }
        v37 = 0;
      }
    }
    else
    {
      if (!v42)
      {
        v37 = 0;
        goto LABEL_31;
      }
      v43 = _ICQGetLogSystem();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v46 = (objc_class *)objc_opt_class();
        v47 = class_getName(v46);
        *(_DWORD *)buf = 136315394;
        v163 = v47;
        __int16 v164 = 2112;
        v165 = v42;
        _os_log_impl(&dword_1D5851000, v43, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
      v37 = 0;
    }

LABEL_31:
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = _ICQGetLogSystem();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (objc_class *)objc_opt_class();
      v45 = class_getName(v44);
      *(_DWORD *)buf = 136315394;
      v163 = v45;
      __int16 v164 = 2112;
      v165 = v38;
      _os_log_impl(&dword_1D5851000, v39, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
  v39 = _ICQServerDictionaryForBundleIdentifier(v38, v34, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v39)
    {
      v48 = _ICQGetLogSystem();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (objc_class *)objc_opt_class();
        v50 = class_getName(v49);
        *(_DWORD *)buf = 136315394;
        v163 = v50;
        __int16 v164 = 2112;
        v165 = v39;
        _os_log_impl(&dword_1D5851000, v48, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
LABEL_24:
    v37 = 0;
    goto LABEL_32;
  }
  v37 = [[_ICQBannerSpecification alloc] initWithDetailBannerInfo:v39 source:@"ICQBannerSourceDetailAppBannerInfo"];
LABEL_32:

LABEL_33:
  bannerSpecification = v20->_bannerSpecification;
  v20->_bannerSpecification = v37;

  id v55 = v34;
  v56 = [v33 objectForKeyedSubscript:@"iCloudInAppRecommendations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v57 = _ICQServerDictionaryForBundleIdentifier(v56, v55, 0, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v58 = [[_ICQBannerSpecification alloc] initWithDetailBannerInfo:v57 source:@"ICQBannerSourceBubbleBannerInfo"];
LABEL_44:

      goto LABEL_45;
    }
    if (v57)
    {
      v61 = _ICQGetLogSystem();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = (objc_class *)objc_opt_class();
        v63 = class_getName(v62);
        *(_DWORD *)buf = 136315394;
        v163 = v63;
        __int16 v164 = 2112;
        v165 = v57;
        _os_log_impl(&dword_1D5851000, v61, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
LABEL_43:
    v58 = 0;
    goto LABEL_44;
  }
  if (v56)
  {
    v57 = _ICQGetLogSystem();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v59 = (objc_class *)objc_opt_class();
      v60 = class_getName(v59);
      *(_DWORD *)buf = 136315394;
      v163 = v60;
      __int16 v164 = 2112;
      v165 = v56;
      _os_log_impl(&dword_1D5851000, v57, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
    goto LABEL_43;
  }
  v58 = 0;
LABEL_45:

  recommendationSpecification = v20->_recommendationSpecification;
  v20->_recommendationSpecification = v58;

  id v65 = v55;
  v66 = [v33 objectForKeyedSubscript:@"appBannerInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v67 = _ICQServerDictionaryForBundleIdentifier(v66, v65, 0, 1);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v68 = [[_ICQButtonSpecification alloc] initWithServerDictionary:v67];
LABEL_56:

      goto LABEL_57;
    }
    if (v67)
    {
      v71 = _ICQGetLogSystem();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        v72 = (objc_class *)objc_opt_class();
        v73 = class_getName(v72);
        *(_DWORD *)buf = 136315394;
        v163 = v73;
        __int16 v164 = 2112;
        v165 = v67;
        _os_log_impl(&dword_1D5851000, v71, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
LABEL_55:
    v68 = 0;
    goto LABEL_56;
  }
  if (v66)
  {
    v67 = _ICQGetLogSystem();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v69 = (objc_class *)objc_opt_class();
      v70 = class_getName(v69);
      *(_DWORD *)buf = 136315394;
      v163 = v70;
      __int16 v164 = 2112;
      v165 = v66;
      _os_log_impl(&dword_1D5851000, v67, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
    goto LABEL_55;
  }
  v68 = 0;
LABEL_57:

  buttonSpecification = v20->_buttonSpecification;
  v20->_buttonSpecification = v68;

  id v75 = v33;
  v76 = [v75 objectForKeyedSubscript:@"followUpInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v77 = [[_ICQDetailFollowupSpecification alloc] initWithServerDictionary:v75];
    v78 = v149;
    id v17 = v150;
  }
  else
  {
    v78 = v149;
    id v17 = v150;
    if (v76)
    {
      v79 = _ICQGetLogSystem();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v80 = (objc_class *)objc_opt_class();
        v81 = class_getName(v80);
        *(_DWORD *)buf = 136315394;
        v163 = v81;
        __int16 v164 = 2112;
        v165 = v76;
        _os_log_impl(&dword_1D5851000, v79, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
    v77 = 0;
  }

  followupSpecification = v20->_followupSpecification;
  v20->_followupSpecification = &v77->super;

  v83 = v75;
  id v84 = v65;
  v85 = [v83 objectForKeyedSubscript:@"appContextInfo"];
  v86 = v83;
  if (!v85)
  {
LABEL_97:
    v93 = [[_ICQUpgradeFlowSpecification alloc] initWithServerDictionary:v86];
    goto LABEL_98;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v146 = v85;
    v87 = v85;
    id v88 = v84;
    if ([v88 isEqualToString:@"__WILDCARD__"])
    {
      id v89 = [v87 firstObject];
    }
    else
    {
      id v143 = v84;
      v144 = v83;
      id v145 = v16;
      long long v156 = 0u;
      long long v157 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      v142 = v87;
      v94 = v87;
      uint64_t v95 = [v94 countByEnumeratingWithState:&v154 objects:buf count:16];
      if (v95)
      {
        uint64_t v96 = v95;
        uint64_t v97 = *(void *)v155;
        do
        {
          for (uint64_t i = 0; i != v96; ++i)
          {
            if (*(void *)v155 != v97) {
              objc_enumerationMutation(v94);
            }
            v99 = *(void **)(*((void *)&v154 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v100 = [v99 objectForKeyedSubscript:@"appId"];
              char v101 = [v100 isEqualToString:v88];

              if (v101)
              {
                id v89 = v99;

                goto LABEL_88;
              }
            }
            else if (v99)
            {
              v102 = _ICQGetLogSystem();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
              {
                v103 = (objc_class *)objc_opt_class();
                v104 = class_getName(v103);
                *(_DWORD *)v158 = 136315394;
                v159 = v104;
                __int16 v160 = 2112;
                v161 = v99;
                _os_log_impl(&dword_1D5851000, v102, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", v158, 0x16u);
              }
            }
          }
          uint64_t v96 = [v94 countByEnumeratingWithState:&v154 objects:buf count:16];
        }
        while (v96);
      }

      id v89 = 0;
LABEL_88:
      v83 = v144;
      id v16 = v145;
      v78 = v149;
      id v17 = v150;
      v87 = v142;
      id v84 = v143;
    }

    v105 = _ICQGetLogSystem();
    BOOL v106 = os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT);
    if (v89)
    {
      if (v106)
      {
        *(_DWORD *)buf = 138412290;
        v163 = (const char *)v88;
        _os_log_impl(&dword_1D5851000, v105, OS_LOG_TYPE_DEFAULT, "found app-specific flow for %@", buf, 0xCu);
      }

      v86 = v89;
      v105 = v83;
    }
    else
    {
      if (v106)
      {
        *(_DWORD *)buf = 138412290;
        v163 = (const char *)v88;
        _os_log_impl(&dword_1D5851000, v105, OS_LOG_TYPE_DEFAULT, "app-specific flow for %@ not found; using top-level flow",
          buf,
          0xCu);
      }
      v86 = v83;
    }

    v85 = v146;
    goto LABEL_97;
  }
  v90 = _ICQGetLogSystem();
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    v91 = (objc_class *)objc_opt_class();
    v92 = class_getName(v91);
    *(_DWORD *)buf = 136315394;
    v163 = v92;
    __int16 v164 = 2112;
    v165 = v85;
    _os_log_impl(&dword_1D5851000, v90, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
  }

  v93 = 0;
  v86 = v83;
LABEL_98:

  upgradeFlowSpecification = v20->_upgradeFlowSpecification;
  v20->_upgradeFlowSpecification = v93;

  v108 = [_ICQXMLSpecification alloc];
  v109 = [v83 objectForKeyedSubscript:@"placeHolderInfo"];
  uint64_t v110 = [(_ICQXMLSpecification *)v108 initWithPlaceholderInfo:v109];
  XMLSpecification = v20->_XMLSpecification;
  v20->_XMLSpecification = (_ICQXMLSpecification *)v110;

  id v112 = v84;
  v113 = [v83 objectForKeyedSubscript:@"universalLinkInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v114 = _ICQServerDictionaryForBundleIdentifier(v113, v112, 0, 0);
    if (!v114)
    {
      v114 = _ICQServerDictionaryForBundleIdentifier(v113, @"com.apple.icq", 0, 0);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v115 = [[_ICQBannerSpecification alloc] initWithServerDictionary:v114];
LABEL_111:

      goto LABEL_112;
    }
    if (v114)
    {
      v118 = _ICQGetLogSystem();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        v119 = (objc_class *)objc_opt_class();
        v120 = class_getName(v119);
        *(_DWORD *)buf = 136315394;
        v163 = v120;
        __int16 v164 = 2112;
        v165 = v114;
        _os_log_impl(&dword_1D5851000, v118, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
LABEL_110:
    v115 = 0;
    goto LABEL_111;
  }
  if (v113)
  {
    v114 = _ICQGetLogSystem();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      v116 = (objc_class *)objc_opt_class();
      v117 = class_getName(v116);
      *(_DWORD *)buf = 136315394;
      v163 = v117;
      __int16 v164 = 2112;
      v165 = v113;
      _os_log_impl(&dword_1D5851000, v114, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
    goto LABEL_110;
  }
  v115 = 0;
LABEL_112:

  universalLinkSpecification = v20->_universalLinkSpecification;
  v20->_universalLinkSpecification = v115;

  id v122 = v112;
  v123 = [v83 objectForKeyedSubscript:@"universalSuccessLinkInfo"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v123)
    {
      v125 = 0;
      goto LABEL_126;
    }
    v124 = _ICQGetLogSystem();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      v126 = (objc_class *)objc_opt_class();
      v127 = class_getName(v126);
      *(_DWORD *)buf = 136315394;
      v163 = v127;
      __int16 v164 = 2112;
      v165 = v123;
      _os_log_impl(&dword_1D5851000, v124, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
    goto LABEL_124;
  }
  v124 = _ICQServerDictionaryForBundleIdentifier(v123, v122, 0, 0);
  if (!v124)
  {
    v124 = _ICQServerDictionaryForBundleIdentifier(v123, @"com.apple.icq", 0, 0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v124)
    {
      v128 = _ICQGetLogSystem();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
      {
        v129 = (objc_class *)objc_opt_class();
        v130 = class_getName(v129);
        *(_DWORD *)buf = 136315394;
        v163 = v130;
        __int16 v164 = 2112;
        v165 = v124;
        _os_log_impl(&dword_1D5851000, v128, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
LABEL_124:
    v125 = 0;
    goto LABEL_125;
  }
  v125 = [[_ICQBannerSpecification alloc] initWithServerDictionary:v124];
LABEL_125:

LABEL_126:
  universalSuccessInfoSpecification = v20->_universalSuccessInfoSpecification;
  v20->_universalSuccessInfoSpecification = v125;

  v132 = [v83 objectForKeyedSubscript:@"actionBasedUniversalLinkInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v133 = [[ICQActionBasedUniversalLinkSpecification alloc] initWithServerDictionary:v132];
  }
  else
  {
    if (v132)
    {
      v134 = _ICQGetLogSystem();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
      {
        v135 = (objc_class *)objc_opt_class();
        v136 = class_getName(v135);
        *(_DWORD *)buf = 136315394;
        v163 = v136;
        __int16 v164 = 2112;
        v165 = v132;
        _os_log_impl(&dword_1D5851000, v134, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
    v133 = 0;
  }

  actionBasedUniversalLinkSpecification = v20->_actionBasedUniversalLinkSpecification;
  v20->_actionBasedUniversalLinkSpecification = v133;

  objc_storeStrong((id *)&v20->_inAppMessageSpecification, v20->_bannerSpecification);
  uint64_t v138 = +[ICQOffer _settingsBannerSpecificationWithServerDictionary:v83 bundleId:v122];
  settingsBannerSpecification = v20->_settingsBannerSpecification;
  v20->_settingsBannerSpecification = (_ICQBannerSpecification *)v138;

  v140 = [v83 objectForKeyedSubscript:@"iTunesAccountExists"];
  v20->_iTunesAccountExists = _ICQBooleanForServerObjectDefault(v140, 1);

  objc_storeStrong((id *)&v20->_appLaunchLink, v78);
  id v19 = v147;
  id v18 = v148;
LABEL_134:

  return v20;
}

- (int64_t)action
{
  uint64_t actionOverride = self->_actionOverride;
  if (!actionOverride)
  {
    id v4 = [(ICQOffer *)self buttonSpecification];
    id v5 = [v4 buttonLink];
    uint64_t actionOverride = [v5 action];

    if (!actionOverride)
    {
      id v6 = [(ICQOffer *)self followupSpecification];
      uint64_t actionOverride = [v6 primaryAction];
    }
  }
  return actionOverride;
}

- (void)updateOfferWithPlanDetails:(id)a3 actionString:(id)a4
{
  id v6 = a4;
  id v7 = (NSDictionary *)[a3 copy];
  planDetailsOverride = self->_planDetailsOverride;
  self->_planDetailsOverride = v7;

  int64_t v9 = _ICQActionForServerActionString(v6);
  self->_uint64_t actionOverride = v9;
}

- (void)updateOfferWithAction:(int64_t)a3
{
  self->_uint64_t actionOverride = a3;
}

- (double)_callbackInterval
{
  v3 = [(ICQOffer *)self expirationDate];
  id v4 = [(ICQOffer *)self retrievalDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (BOOL)isBuddyOffer
{
  return _ICQIsBuddyOfferDictionary(self->_serverDictionary);
}

- (BOOL)isDefaultOffer
{
  return _ICQIsDefaultOfferDictionary(self->_serverDictionary);
}

- (BOOL)isPremiumOffer
{
  return _ICQIsPremiumOfferDictionary(self->_serverDictionary);
}

- (id)storagePurchaseKeybagForButtonId:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  planDetailsOverride = self->_planDetailsOverride;
  if (planDetailsOverride)
  {
    id v7 = planDetailsOverride;
LABEL_6:
    int64_t v9 = v7;
    goto LABEL_7;
  }
  if (!v4
    || (_ICQDictionaryForKey(self->_serverDictionary, @"planDetailsByBtnId"),
        id v8 = objc_claimAutoreleasedReturnValue(),
        _ICQDictionaryForKey(v8, v5),
        int64_t v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    _ICQDictionaryForKey(self->_serverDictionary, @"planDetails");
    id v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (id)alertSpecificationForAlertKey:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(NSDictionary *)self->_serverDictionary objectForKeyedSubscript:@"inlineAlertInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v26 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v28 = 0;
      uint64_t v9 = *(void *)v30;
      unint64_t v10 = 0x1E4F1C000uLL;
      uint64_t v11 = @"alertKey";
      unint64_t v12 = 0x1E4F29000uLL;
      do
      {
        uint64_t v13 = 0;
        uint64_t v27 = v8;
        do
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          v14 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v15 = [v14 objectForKeyedSubscript:v11];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && [v15 isEqualToString:v4])
            {
              v35 = @"alertInfo";
              v36 = v14;
              id v16 = [*(id *)(v10 + 2536) dictionaryWithObjects:&v36 forKeys:&v35 count:1];
              _ICQAlertSpecificationForServerDict(v16);
              uint64_t v17 = v9;
              unint64_t v18 = v10;
              id v19 = v6;
              long long v20 = v11;
              unint64_t v21 = v12;
              uint64_t v23 = v22 = v4;

              v28 = (void *)v23;
              id v4 = v22;
              unint64_t v12 = v21;
              uint64_t v11 = v20;
              id v6 = v19;
              unint64_t v10 = v18;
              uint64_t v9 = v17;
              uint64_t v8 = v27;
            }
          }
          else
          {
            int v15 = _ICQGetLogSystem();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v34 = v14;
              _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "expected inlineAlertInfo to be NSArray<NSDictionary *> but found %@", buf, 0xCu);
            }
          }

          ++v13;
        }
        while (v8 != v13);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v8);
    }
    else
    {
      v28 = 0;
    }

    double v5 = v26;
    v24 = v28;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)alertSpecificationAtIndex:(unint64_t)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSDictionary *)self->_serverDictionary objectForKeyedSubscript:@"inlineAlertInfo"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v4 count] <= a3)
  {
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  double v5 = [v4 objectAtIndexedSubscript:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "expected inlineAlertInfo to be NSArray<NSDictionary *> but found %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_9;
  }
  id v6 = [v5 objectForKeyedSubscript:@"alertKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  unint64_t v12 = @"alertInfo";
  v13[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v8 = _ICQAlertSpecificationForServerDict(v7);

LABEL_10:
LABEL_11:

  return v8;
}

- (BOOL)isDetailAppBannerOffer
{
  return [(_ICQBannerSpecification *)self->_bannerSpecification isDetailBannerInfoAvailable];
}

- (BOOL)placeholderExists
{
  return [(_ICQBannerSpecification *)self->_bannerSpecification placeholderExists];
}

+ (id)offerReasonForServerReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"iCloudFullViolation"])
  {
    id v4 = @"iCloudStorageFull";
  }
  else if ([v3 isEqualToString:@"iCloudAlmostFullViolation"])
  {
    id v4 = @"iCloudStorageAlmostFull";
  }
  else
  {
    id v4 = (__CFString *)v3;
  }

  return v4;
}

- (NSDate)lastUpdated
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(ICQOffer *)self recommendationSpecification];
  id v3 = v2;
  if (v2 && ([v2 reason], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    double v5 = [v3 decayUntil];
    [v5 doubleValue];
    double v7 = v6;

    uint64_t v8 = [v3 reason];
    uint64_t v9 = +[_ICQHelperFunctions lastUpdatedForReason:v8 decayUntil:v7];

    int v10 = _ICQBannerLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v3 reason];
      int v14 = 138412802;
      int v15 = v11;
      __int16 v16 = 2048;
      double v17 = v7;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "Providing last updated for Photos Bubble Banner - Reason: %@ Decay: %f lastUpdated: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    unint64_t v12 = _ICQBannerLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "We do not have a recommendation banner spec. In this case sending the current timestamp.", (uint8_t *)&v14, 2u);
    }

    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  }

  return (NSDate *)v9;
}

- (unint64_t)bannerPriority
{
  return 2;
}

- (void)universalLink
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 debugDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_1D5851000, a2, v4, "Universal link is not available in offer %@", v5);
}

- (void)universalSuccessLink
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 debugDescription];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_1D5851000, a2, v4, "Universal success link is not available in offer %@", v5);
}

- (void)universalLinkForContext:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_1D5851000, v0, v1, "universalLinkForContext: %@", v2);
}

- (void)inAppMessageSpecificationForReason:(os_log_t)log bundleId:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "No detail banners found in default offer", v1, 2u);
}

- (void)settingsBannerSpecificationForReason:(os_log_t)log bundleId:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "No settings banners found in default offer", v1, 2u);
}

@end