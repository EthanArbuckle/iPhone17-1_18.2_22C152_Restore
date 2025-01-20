@interface WLKStoreOffer
+ (id)offersWithMAPIDictionaries:(id)a3;
+ (id)offersWithSubscriptionDictionaries:(id)a3;
- (BOOL)specialOfferEligible;
- (NSDictionary)dictionary;
- (NSNumber)price;
- (NSString)buyParameters;
- (NSString)formattedPrice;
- (NSString)title;
- (WLKStoreOffer)initWithMAPIDictionary:(id)a3;
- (WLKStoreOffer)initWithSubscriptionDictionary:(id)a3;
- (WLKStoreOfferPeriod)freeTrialPeriod;
- (WLKStoreOfferPeriod)introOfferPeriod;
- (WLKStoreOfferPeriod)renewalPeriod;
- (id)sui_buttonSubtitleWithServiceName:(id)a3;
- (id)sui_buttonTitle;
- (unint64_t)offerType;
- (unint64_t)subscriptionType;
@end

@implementation WLKStoreOffer

- (id)sui_buttonSubtitleWithServiceName:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(WLKStoreOffer *)self offerType];
  switch(v5)
  {
    case 3uLL:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
      v7 = v6;
      v8 = @"OFFER_ACTION_PREORDER";
      goto LABEL_7;
    case 2uLL:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
      v7 = v6;
      v8 = @"OFFER_ACTION_RENT";
      goto LABEL_7;
    case 1uLL:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
      v7 = v6;
      v8 = @"OFFER_ACTION_BUY";
LABEL_7:
      v9 = [v6 localizedStringForKey:v8 value:&stru_1F13BCF18 table:@"WatchListKit"];

      goto LABEL_9;
  }
  v9 = 0;
LABEL_9:
  if ([v9 length])
  {
    v10 = NSString;
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
    v12 = [v11 localizedStringForKey:@"OFFER_PURCHASE_SUBTITLE_FORMAT" value:&stru_1F13BCF18 table:@"WatchListKit"];
    objc_msgSend(v10, "stringWithFormat:", v12, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    goto LABEL_12;
  }
  id v13 = v4;
  if ([(WLKStoreOffer *)self offerType] == 4)
  {
    if (v13)
    {
      v15 = NSString;
      v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
      v16 = [v11 localizedStringForKey:@"OFFER_SUBSCRIPTION_SUBTITLE_FORMAT" value:&stru_1F13BCF18 table:@"WatchListKit"];
      uint64_t v17 = objc_msgSend(v15, "stringWithFormat:", v16, v13);

      id v13 = (id)v17;
    }
    else
    {
      v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
      id v13 = [v11 localizedStringForKey:@"OFFER_SUBSCRIPTION_SUBTITLE_FALLBACK" value:&stru_1F13BCF18 table:@"WatchListKit"];
    }
    goto LABEL_11;
  }
LABEL_12:

  return v13;
}

- (id)sui_buttonTitle
{
  v3 = [(WLKStoreOffer *)self formattedPrice];
  if ([(WLKStoreOffer *)self offerType] == 4)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
    unint64_t v5 = [v4 localizedStringForKey:@"OFFER_ACTION_SUBSCRIBE" value:&stru_1F13BCF18 table:@"WatchListKit"];

    if ([(WLKStoreOffer *)self subscriptionType] == 2)
    {
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
      v3 = [v6 localizedStringForKey:@"OFFER_ACTION_SUBSCRIBE_FREE_TRIAL" value:&stru_1F13BCF18 table:@"WatchListKit"];
    }
    else
    {
      v3 = v5;
    }
  }

  return v3;
}

- (WLKStoreOffer)initWithSubscriptionDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WLKStoreOffer;
  unint64_t v5 = [(WLKStoreOffer *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v5->_offerType = 4;
    v8 = objc_msgSend(v4, "wlk_stringForKey:", @"buyParams");
    uint64_t v9 = [v8 copy];
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v9;

    v11 = objc_msgSend(v4, "wlk_stringForKey:", @"title");
    uint64_t v12 = [v11 copy];
    title = v5->_title;
    v5->_title = (NSString *)v12;

    v14 = objc_msgSend(v4, "wlk_stringForKey:", @"price");
    v15 = NSNumber;
    [v14 floatValue];
    uint64_t v16 = objc_msgSend(v15, "numberWithFloat:");
    price = v5->_price;
    v5->_price = (NSNumber *)v16;

    uint64_t v18 = objc_msgSend(v4, "wlk_stringForKey:", @"priceForDisplay");
    formattedPrice = v5->_formattedPrice;
    v5->_formattedPrice = (NSString *)v18;

    v5->_subscriptionType = 1;
    v20 = objc_msgSend(v4, "wlk_stringForKey:", @"eligibilityType");
    if ([v20 isEqualToString:@"INTRO"])
    {
      v5->_subscriptionType = 2;
      v21 = objc_msgSend(v4, "wlk_stringForKey:", @"freeTrialPeriod");
      v22 = [[WLKStoreOfferPeriod alloc] initWithString:v21];
      freeTrialPeriod = v5->_freeTrialPeriod;
      v5->_freeTrialPeriod = v22;
    }
    else
    {
      if (![v20 isEqualToString:@"HARDWARE_1"])
      {
LABEL_7:
        v25 = objc_msgSend(v4, "wlk_stringForKey:", @"renewalPeriod");
        v26 = [[WLKStoreOfferPeriod alloc] initWithString:v25];
        renewalPeriod = v5->_renewalPeriod;
        v5->_renewalPeriod = v26;

        goto LABEL_8;
      }
      v5->_subscriptionType = 3;
      v21 = objc_msgSend(v4, "wlk_stringForKey:", @"introOfferPeriod");
      v24 = [[WLKStoreOfferPeriod alloc] initWithString:v21];
      freeTrialPeriod = v5->_introOfferPeriod;
      v5->_introOfferPeriod = v24;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (WLKStoreOffer)initWithMAPIDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WLKStoreOffer;
  unint64_t v5 = [(WLKStoreOffer *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v8 = objc_msgSend(v4, "wlk_stringForKey:", @"buyParams");
    uint64_t v9 = [v8 copy];
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v9;

    v11 = objc_msgSend(v4, "wlk_stringForKey:", @"price");
    uint64_t v12 = objc_msgSend(v4, "wlk_numberForKey:", @"price");
    id v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      v15 = NSNumber;
      [v11 floatValue];
      objc_msgSend(v15, "numberWithFloat:");
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    price = v5->_price;
    v5->_price = v14;

    uint64_t v17 = objc_msgSend(v4, "wlk_stringForKey:", @"priceFormatted");
    formattedPrice = v5->_formattedPrice;
    v5->_formattedPrice = (NSString *)v17;

    v5->_offerType = 0;
    v5->_subscriptionType = 0;
    v19 = objc_msgSend(v4, "wlk_stringForKey:", @"kind");
    if ([v19 isEqualToString:@"buy"])
    {
      uint64_t v20 = 1;
    }
    else if ([v19 isEqualToString:@"rent"])
    {
      uint64_t v20 = 2;
    }
    else if ([v19 isEqualToString:@"preorder"])
    {
      uint64_t v20 = 3;
    }
    else if ([v19 isEqualToString:@"get"])
    {
      uint64_t v20 = 5;
    }
    else
    {
      if (![v19 isEqualToString:@"redownload"])
      {
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v20 = 6;
    }
    v5->_offerType = v20;
    goto LABEL_16;
  }
LABEL_17:

  return v5;
}

- (BOOL)specialOfferEligible
{
  v3 = [(WLKStoreOffer *)self freeTrialPeriod];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    unint64_t v5 = [(WLKStoreOffer *)self introOfferPeriod];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

+ (id)offersWithSubscriptionDictionaries:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [WLKStoreOffer alloc];
        uint64_t v12 = -[WLKStoreOffer initWithSubscriptionDictionary:](v11, "initWithSubscriptionDictionary:", v10, (void)v15);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    id v13 = (void *)[v4 copy];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

+ (id)offersWithMAPIDictionaries:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [WLKStoreOffer alloc];
        uint64_t v12 = -[WLKStoreOffer initWithMAPIDictionary:](v11, "initWithMAPIDictionary:", v10, (void)v15);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    id v13 = (void *)[v4 copy];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (NSString)formattedPrice
{
  return self->_formattedPrice;
}

- (NSNumber)price
{
  return self->_price;
}

- (unint64_t)offerType
{
  return self->_offerType;
}

- (unint64_t)subscriptionType
{
  return self->_subscriptionType;
}

- (NSString)title
{
  return self->_title;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (WLKStoreOfferPeriod)renewalPeriod
{
  return self->_renewalPeriod;
}

- (WLKStoreOfferPeriod)freeTrialPeriod
{
  return self->_freeTrialPeriod;
}

- (WLKStoreOfferPeriod)introOfferPeriod
{
  return self->_introOfferPeriod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_introOfferPeriod, 0);
  objc_storeStrong((id *)&self->_freeTrialPeriod, 0);
  objc_storeStrong((id *)&self->_renewalPeriod, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_formattedPrice, 0);

  objc_storeStrong((id *)&self->_buyParameters, 0);
}

@end