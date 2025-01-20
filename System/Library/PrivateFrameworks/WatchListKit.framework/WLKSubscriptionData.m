@interface WLKSubscriptionData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSubscriptionData:(id)a3;
- (BOOL)isTVPlusSubscriber;
- (WLKSubscriptionData)initWithCoder:(id)a3;
- (WLKSubscriptionData)initWithDictionary:(id)a3;
- (id)activeTVPlusSubscription;
- (id)currentAccount;
- (id)currentFamily;
- (id)subscriptionByAdamID:(id)a3;
- (id)subscriptions;
- (unint64_t)activeSubscriptionsCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WLKSubscriptionData

void __42__WLKSubscriptionData_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = objc_msgSend(v8, "wlk_numberForKey:", @"adamId");
  if (v3) {
    [*(id *)(a1 + 32) setObject:v8 forKey:v3];
  }
  if (objc_msgSend(v8, "wlk_BOOLForKey:defaultValue:", @"isActive", 0)) {
    ++*(void *)(*(void *)(a1 + 40) + 48);
  }
  v4 = objc_msgSend(v8, "wlk_stringForKey:", @"type");
  if ([v4 isEqualToString:@"TV_PLUS"])
  {
    int v5 = objc_msgSend(v8, "wlk_BOOLForKey:defaultValue:", @"isActive", 0);

    if (!v5) {
      goto LABEL_9;
    }
    uint64_t v6 = [v8 copy];
    uint64_t v7 = *(void *)(a1 + 40);
    v4 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = v6;
  }

LABEL_9:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKSubscriptionData)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    int v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_WLKSubscriptionDataCoderKeyBackingDictionary"];
    self = [(WLKSubscriptionData *)self initWithDictionary:v11];

    v12 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
    v12 = 0;
  }

  return v12;
}

- (WLKSubscriptionData)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v29.receiver = self;
    v29.super_class = (Class)WLKSubscriptionData;
    int v5 = [(WLKSubscriptionData *)&v29 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      backingDictionary = v5->_backingDictionary;
      v5->_backingDictionary = (NSDictionary *)v6;

      uint64_t v8 = [(NSDictionary *)v5->_backingDictionary wlk_arrayForKey:@"subscriptions"];
      subscriptionArray = v5->_subscriptionArray;
      v5->_subscriptionArray = (NSArray *)v8;

      uint64_t v10 = [(NSDictionary *)v5->_backingDictionary wlk_dictionaryForKey:@"account"];
      account = v5->_account;
      v5->_account = (NSDictionary *)v10;

      uint64_t v12 = [(NSDictionary *)v5->_backingDictionary wlk_dictionaryForKey:@"family"];
      family = v5->_family;
      v5->_family = (NSDictionary *)v12;

      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v15 = v5->_subscriptionArray;
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __42__WLKSubscriptionData_initWithDictionary___block_invoke;
      v26 = &unk_1E620C320;
      id v16 = v14;
      id v27 = v16;
      v17 = v5;
      v28 = v17;
      [(NSArray *)v15 enumerateObjectsUsingBlock:&v23];
      if (objc_msgSend(v16, "count", v23, v24, v25, v26))
      {
        uint64_t v18 = [v16 copy];
        subscriptionsByAdamID = v17->_subscriptionsByAdamID;
        v17->_subscriptionsByAdamID = (NSDictionary *)v18;
      }
    }
    self = v5;
    v20 = self;
  }
  else
  {
    v21 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v21, OS_LOG_TYPE_DEFAULT, "Initializing WLKSubscriptionData with an empty dictionary", buf, 2u);
    }

    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeObject:self->_backingDictionary forKey:@"_WLKSubscriptionDataCoderKeyBackingDictionary"];
}

- (id)subscriptions
{
  v2 = (void *)[(NSArray *)self->_subscriptionArray copy];

  return v2;
}

- (id)subscriptionByAdamID:(id)a3
{
  v3 = [(NSDictionary *)self->_subscriptionsByAdamID wlk_dictionaryForKey:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)currentFamily
{
  return self->_family;
}

- (id)currentAccount
{
  return self->_account;
}

- (BOOL)isTVPlusSubscriber
{
  v2 = [(WLKSubscriptionData *)self activeTVPlusSubscription];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)activeSubscriptionsCount
{
  return self->_activeSubscriptionsCount;
}

- (id)activeTVPlusSubscription
{
  return self->_activeTVPlusSubscription;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WLKSubscriptionData *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(WLKSubscriptionData *)self isEqualToSubscriptionData:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_backingDictionary hash];
}

- (BOOL)isEqualToSubscriptionData:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)*((void *)v4 + 1);
    uint64_t v7 = self->_backingDictionary;
    uint64_t v8 = v6;
    uint64_t v9 = v8;
    if (v7 == v8)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v7 && v8) {
        char v10 = [(NSDictionary *)v7 isEqual:v8];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTVPlusSubscription, 0);
  objc_storeStrong((id *)&self->_subscriptionsByAdamID, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_subscriptionArray, 0);

  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

@end