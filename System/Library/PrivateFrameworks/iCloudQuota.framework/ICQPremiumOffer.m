@interface ICQPremiumOffer
- (BOOL)_hasFollowupEnabledFromServerDict:(id)a3;
- (BOOL)dismissed;
- (BOOL)getBadgeAppFromServerDict:(id)a3;
- (BOOL)isBadgeApp;
- (BOOL)shouldStartOnDeviceJourney;
- (ICQOpportunityBubbleSpecification)opportunityBubble;
- (ICQPremiumOffer)initWithServerDictionary:(id)a3 accountAltDSID:(id)a4 notificationID:(id)a5 retrievalDate:(id)a6 callbackInterval:(double)a7 appLaunchLink:(id)a8 bundleIdentifier:(id)a9;
- (NSNumber)bundleQuotaInfo;
- (NSNumber)commerceQuotaInfo;
- (id)_ICQOpportunityBubbleSpecificationForServerDict:(id)a3 bundleId:(id)a4;
- (id)_bundleStorageLevelFromServerDict:(id)a3;
- (id)_commerceStorageLevelFromServerDict:(id)a3;
- (id)_parseQuotaInfo:(id)a3;
- (id)_serverUIURLFromOfferContents;
- (id)serverUIURL;
- (void)serverUIURL;
- (void)setBundleQuotaInfo:(id)a3;
- (void)setCommerceQuotaInfo:(id)a3;
- (void)setDismissed:(BOOL)a3;
- (void)setIsBadgeApp:(BOOL)a3;
- (void)setOpportunityBubble:(id)a3;
- (void)setShouldStartOnDeviceJourney:(BOOL)a3;
- (void)shouldShowOpportunityBubbleWithCompletion:(id)a3;
- (void)shouldShowOpportunityBubbleWithDisplayRuleResult:(BOOL)a3 completion:(id)a4;
@end

@implementation ICQPremiumOffer

- (ICQPremiumOffer)initWithServerDictionary:(id)a3 accountAltDSID:(id)a4 notificationID:(id)a5 retrievalDate:(id)a6 callbackInterval:(double)a7 appLaunchLink:(id)a8 bundleIdentifier:(id)a9
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v16 = (ICQPremiumOffer *)a3;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ICQPremiumOffer;
  v18 = [(ICQOffer *)&v27 initWithServerDictionary:v16 accountAltDSID:a4 notificationID:a5 retrievalDate:a6 callbackInterval:a8 appLaunchLink:v17 bundleIdentifier:a7];
  v19 = v18;
  if (!v18)
  {
LABEL_6:
    v24 = v19;
    goto LABEL_10;
  }
  if ([(ICQOffer *)v18 offerType] == 8)
  {
    v19->_dismissed = 0;
    [(ICQPremiumOffer *)v19 setIsBadgeApp:[(ICQPremiumOffer *)v19 getBadgeAppFromServerDict:v16]];
    v20 = [(ICQPremiumOffer *)v19 _ICQOpportunityBubbleSpecificationForServerDict:v16 bundleId:v17];
    [(ICQPremiumOffer *)v19 setOpportunityBubble:v20];

    v21 = [(ICQPremiumOffer *)v19 _bundleStorageLevelFromServerDict:v16];
    [(ICQPremiumOffer *)v19 setBundleQuotaInfo:v21];

    v22 = [(ICQPremiumOffer *)v19 _commerceStorageLevelFromServerDict:v16];
    [(ICQPremiumOffer *)v19 setCommerceQuotaInfo:v22];

    [(ICQPremiumOffer *)v19 setShouldStartOnDeviceJourney:[(ICQPremiumOffer *)v19 _hasFollowupEnabledFromServerDict:v16]];
    v23 = _ICQGetLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v19;
      _os_log_impl(&dword_1D5851000, v23, OS_LOG_TYPE_DEFAULT, "Successfully initialized premium offer from server response: %@", buf, 0xCu);
    }

    goto LABEL_6;
  }
  v25 = _ICQGetLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v16;
    _os_log_impl(&dword_1D5851000, v25, OS_LOG_TYPE_DEFAULT, "Cannot initialize premium offer from server dict due to invalid type: %@", buf, 0xCu);
  }

  v24 = 0;
LABEL_10:

  return v24;
}

- (BOOL)getBadgeAppFromServerDict:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [a3 objectForKeyedSubscript:@"badgeApp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = [v3 BOOLValue];
  }
  else
  {
    if (v3)
    {
      v5 = _ICQGetLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        int v8 = 136315394;
        Name = class_getName(v6);
        __int16 v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v8, 0x16u);
      }
    }
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_hasFollowupEnabledFromServerDict:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [a3 objectForKeyedSubscript:@"followUpEnabled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [v3 BOOLValue] ^ 1;
  }
  else
  {
    if (v3)
    {
      v5 = _ICQGetLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        int v8 = 136315394;
        Name = class_getName(v6);
        __int16 v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v8, 0x16u);
      }
    }
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_ICQOpportunityBubbleSpecificationForServerDict:(id)a3 bundleId:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"opportunityBubble"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = _ICQServerDictionaryForBundleIdentifier(v7, v6, 0, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v5 objectForKeyedSubscript:@"opportunitySheet"];
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        __int16 v10 = _ICQServerDictionaryForBundleIdentifier(v9, v6, 0, 0);
      }
      else
      {
        __int16 v10 = 0;
      }
      v14 = [[ICQOpportunityBubbleSpecification alloc] initWithOpportunityBubble:v8 andOpportunitySheet:v10];

      goto LABEL_17;
    }
    if (v8)
    {
      uint64_t v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        int v16 = 136315394;
        Name = class_getName(v13);
        __int16 v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else
  {
    if (!v7)
    {
      v14 = 0;
      goto LABEL_18;
    }
    int v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      int v16 = 136315394;
      Name = class_getName(v11);
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v16, 0x16u);
    }
  }
  v14 = 0;
LABEL_17:

LABEL_18:
  return v14;
}

- (id)serverUIURL
{
  v3 = [(ICQOffer *)self requestedServerUIURL];

  if (v3)
  {
    int v4 = [(ICQOffer *)self requestedServerUIURL];
    if (v4) {
      goto LABEL_9;
    }
  }
  else
  {
    id v5 = [(ICQPremiumOffer *)self _serverUIURLFromOfferContents];

    if (v5)
    {
      int v4 = [(ICQPremiumOffer *)self _serverUIURLFromOfferContents];
      if (v4) {
        goto LABEL_9;
      }
    }
  }
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ICQPremiumOffer serverUIURL](v6);
  }

  int v4 = 0;
LABEL_9:
  return v4;
}

- (id)_serverUIURLFromOfferContents
{
  v3 = [(ICQOffer *)self followupSpecification];

  if (v3)
  {
    int v4 = [(ICQOffer *)self followupSpecification];
  }
  else
  {
    id v5 = [(ICQPremiumOffer *)self opportunityBubble];

    if (!v5) {
      goto LABEL_6;
    }
    int v4 = [(ICQPremiumOffer *)self opportunityBubble];
  }
  id v6 = v4;
  id v5 = [v4 serverUIURL];

LABEL_6:
  return v5;
}

- (id)_bundleStorageLevelFromServerDict:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 objectForKeyedSubscript:@"quotaInfo"];
  id v5 = [v4 objectForKeyedSubscript:@"bundleQuotaInBytes"];

  id v6 = [(ICQPremiumOffer *)self _parseQuotaInfo:v5];
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    __int16 v10 = v6;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Current bundle storage level from Premium offer: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_commerceStorageLevelFromServerDict:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 objectForKeyedSubscript:@"quotaInfo"];
  id v5 = [v4 objectForKeyedSubscript:@"commerceQuotaInBytes"];

  id v6 = [(ICQPremiumOffer *)self _parseQuotaInfo:v5];
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    __int16 v10 = v6;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Current commerce storage level from Premium offer: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_parseQuotaInfo:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return v5;
}

- (void)shouldShowOpportunityBubbleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQPremiumOffer *)self opportunityBubble];
  id v6 = [v5 reportingDetails];

  if (v6 && [v6 displayRuleType] == 2)
  {
    -[ICQPremiumOffer shouldShowOpportunityBubbleWithDisplayRuleResult:completion:](self, "shouldShowOpportunityBubbleWithDisplayRuleResult:completion:", [v6 displayRuleServerAlwaysShow], v4);
  }
  else
  {
    v7 = [(ICQOffer *)self bundleIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__ICQPremiumOffer_shouldShowOpportunityBubbleWithCompletion___block_invoke;
    v8[3] = &unk_1E6A536D8;
    v8[4] = self;
    id v9 = v4;
    +[ICQEngagementReporter shouldShowOpportunityBubbleWithBundleID:v7 completion:v8];
  }
}

uint64_t __61__ICQPremiumOffer_shouldShowOpportunityBubbleWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldShowOpportunityBubbleWithDisplayRuleResult:a2 completion:*(void *)(a1 + 40)];
}

- (void)shouldShowOpportunityBubbleWithDisplayRuleResult:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  v7 = [(ICQPremiumOffer *)self opportunityBubble];
  uint64_t v8 = v7 != 0;

  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = @"NO";
    if (v7) {
      __int16 v10 = @"YES";
    }
    int v14 = 138412290;
    v15 = v10;
    _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "bubble not nil: %@", (uint8_t *)&v14, 0xCu);
  }

  BOOL v11 = +[ICQPreferences shouldEnableUnifiedMessaging];
  uint64_t v12 = _ICQGetLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Using Unified Messaging based on Internal Settings", (uint8_t *)&v14, 2u);
    }

    if (v7) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    if (v13)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Not using Unified Messaging based on Internal Settings", (uint8_t *)&v14, 2u);
    }
  }
  v6[2](v6, v8);
}

- (BOOL)isBadgeApp
{
  return self->_isBadgeApp;
}

- (void)setIsBadgeApp:(BOOL)a3
{
  self->_isBadgeApp = a3;
}

- (BOOL)shouldStartOnDeviceJourney
{
  return self->_shouldStartOnDeviceJourney;
}

- (void)setShouldStartOnDeviceJourney:(BOOL)a3
{
  self->_shouldStartOnDeviceJourney = a3;
}

- (ICQOpportunityBubbleSpecification)opportunityBubble
{
  return self->_opportunityBubble;
}

- (void)setOpportunityBubble:(id)a3
{
}

- (NSNumber)bundleQuotaInfo
{
  return self->_bundleQuotaInfo;
}

- (void)setBundleQuotaInfo:(id)a3
{
}

- (NSNumber)commerceQuotaInfo
{
  return self->_commerceQuotaInfo;
}

- (void)setCommerceQuotaInfo:(id)a3
{
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commerceQuotaInfo, 0);
  objc_storeStrong((id *)&self->_bundleQuotaInfo, 0);
  objc_storeStrong((id *)&self->_opportunityBubble, 0);
}

- (void)serverUIURL
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "The requested RemoteUI URL is nil! We won't be able to present a remoteUI flow", v1, 2u);
}

@end