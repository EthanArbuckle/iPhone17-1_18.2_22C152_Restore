@interface ICQDaemonOfferStubs
+ (id)daemonOfferStubsDictionarySample;
+ (id)persistenceKey;
- (BOOL)_isValidServerStubs:(id)a3 key:(id)a4;
- (BOOL)_stubsArrayContainsOfferID:(id)a3 stubs:(id)a4;
- (BOOL)containsOfferID:(id)a3;
- (ICQDaemonOfferStubs)initWithDictionary:(id)a3;
- (NSArray)buddyStubs;
- (NSArray)defaultStubs;
- (NSArray)eventStubs;
- (NSArray)premiumStubs;
- (NSArray)serverStubs;
- (id)_chooseStubFromServerStubs:(id)a3 conditions:(id)a4;
- (id)_chooseStubFromServerStubs:(id)a3 offerType:(int64_t)a4;
- (id)_initWithAccount:(id)a3 error:(id)a4;
- (id)_initWithAccount:(id)a3 serverDictionary:(id)a4;
- (id)chooseBuddyStub;
- (id)chooseBuddyStubForConditions:(id)a3;
- (id)chooseBuddyStubForOfferType:(int64_t)a3;
- (id)chooseDefaultStub;
- (id)chooseDefaultStubForConditions:(id)a3;
- (id)chooseEventStub;
- (id)chooseEventStubForConditions:(id)a3;
- (id)chooseFirstDefaultStub;
- (id)chooseFirstEventStub;
- (id)chooseFirstPremiumStub;
- (id)chooseFirstStub;
- (id)choosePremiumStub;
- (id)choosePremiumStubForConditions:(id)a3;
- (id)chooseStub;
- (id)chooseStubForConditions:(id)a3;
- (id)chooseStubForOfferType:(int64_t)a3;
- (id)sortedServerStubs:(id)a3;
- (void)_initServerStubsFromServerDictionary;
- (void)setServerDictionary:(id)a3;
@end

@implementation ICQDaemonOfferStubs

+ (id)persistenceKey
{
  return @"_ICQCachedOfferStubsInternal";
}

+ (id)daemonOfferStubsDictionarySample
{
  return &unk_1F2DE1990;
}

- (id)chooseStub
{
  v3 = [(ICQDaemonOfferStubs *)self serverStubs];
  v4 = +[ICQDaemonOfferConditions currentConditions];
  v5 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v3 conditions:v4];

  return v5;
}

- (id)chooseStubForConditions:(id)a3
{
  id v4 = a3;
  v5 = [(ICQDaemonOfferStubs *)self serverStubs];
  v6 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v5 conditions:v4];

  return v6;
}

- (id)chooseFirstStub
{
  v3 = [(ICQDaemonOfferStubs *)self serverStubs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(ICQDaemonOfferStubs *)self serverStubs];
    v6 = [v5 firstObject];

    v7 = [[ICQDaemonOfferStub alloc] initWithServerDictionary:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)chooseBuddyStub
{
  v3 = [(ICQDaemonOfferStubs *)self buddyStubs];
  uint64_t v4 = +[ICQDaemonOfferConditions currentConditions];
  v5 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v3 conditions:v4];

  return v5;
}

- (id)chooseBuddyStubForConditions:(id)a3
{
  id v4 = a3;
  v5 = [(ICQDaemonOfferStubs *)self buddyStubs];
  v6 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v5 conditions:v4];

  return v6;
}

- (id)chooseDefaultStub
{
  v3 = [(ICQDaemonOfferStubs *)self defaultStubs];
  id v4 = +[ICQDaemonOfferConditions currentConditions];
  v5 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v3 conditions:v4];

  return v5;
}

- (id)chooseDefaultStubForConditions:(id)a3
{
  id v4 = a3;
  v5 = [(ICQDaemonOfferStubs *)self defaultStubs];
  v6 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v5 conditions:v4];

  return v6;
}

- (id)chooseFirstDefaultStub
{
  v3 = [(ICQDaemonOfferStubs *)self defaultStubs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(ICQDaemonOfferStubs *)self defaultStubs];
    v6 = [v5 firstObject];

    v7 = [[ICQDaemonOfferStub alloc] initWithServerDictionary:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)choosePremiumStub
{
  v3 = [(ICQDaemonOfferStubs *)self premiumStubs];
  uint64_t v4 = +[ICQDaemonOfferConditions currentConditions];
  v5 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v3 conditions:v4];

  return v5;
}

- (id)choosePremiumStubForConditions:(id)a3
{
  id v4 = a3;
  v5 = [(ICQDaemonOfferStubs *)self premiumStubs];
  v6 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v5 conditions:v4];

  return v6;
}

- (id)chooseFirstPremiumStub
{
  v3 = [(ICQDaemonOfferStubs *)self premiumStubs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(ICQDaemonOfferStubs *)self premiumStubs];
    v6 = [v5 firstObject];

    v7 = [[ICQDaemonOfferStub alloc] initWithServerDictionary:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)chooseEventStub
{
  v3 = +[ICQDaemonOfferConditions currentConditions];
  uint64_t v4 = [(ICQDaemonOfferStubs *)self chooseEventStubForConditions:v3];

  return v4;
}

- (id)chooseEventStubForConditions:(id)a3
{
  id v4 = a3;
  v5 = [(ICQDaemonOfferStubs *)self eventStubs];
  v6 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v5 conditions:v4];

  return v6;
}

- (id)chooseFirstEventStub
{
  v3 = [(ICQDaemonOfferStubs *)self eventStubs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(ICQDaemonOfferStubs *)self eventStubs];
    v6 = [v5 firstObject];

    v7 = [[ICQDaemonOfferStub alloc] initWithServerDictionary:v6];
    v8 = +[ICQDaemonOfferConditions currentConditions];
    [(ICQDaemonOfferStub *)v7 setConditionsWhenChosen:v8];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)containsOfferID:(id)a3
{
  id v4 = a3;
  v5 = [(ICQDaemonOfferStubs *)self serverStubs];
  if ([(ICQDaemonOfferStubs *)self _stubsArrayContainsOfferID:v4 stubs:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [(ICQDaemonOfferStubs *)self premiumStubs];
    if ([(ICQDaemonOfferStubs *)self _stubsArrayContainsOfferID:v4 stubs:v7])
    {
      BOOL v6 = 1;
    }
    else
    {
      v8 = [(ICQDaemonOfferStubs *)self defaultStubs];
      if ([(ICQDaemonOfferStubs *)self _stubsArrayContainsOfferID:v4 stubs:v8])
      {
        BOOL v6 = 1;
      }
      else
      {
        v9 = [(ICQDaemonOfferStubs *)self buddyStubs];
        if ([(ICQDaemonOfferStubs *)self _stubsArrayContainsOfferID:v4 stubs:v9])
        {
          BOOL v6 = 1;
        }
        else
        {
          v10 = [(ICQDaemonOfferStubs *)self eventStubs];
          BOOL v6 = [(ICQDaemonOfferStubs *)self _stubsArrayContainsOfferID:v4 stubs:v10];
        }
      }
    }
  }

  return v6;
}

- (id)_initWithAccount:(id)a3 serverDictionary:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICQDaemonOfferStubs;
  id v4 = [(ICQDaemonPersisted *)&v7 _initWithAccount:a3 serverDictionary:a4];
  v5 = v4;
  if (v4) {
    [v4 _initServerStubsFromServerDictionary];
  }
  return v5;
}

- (id)_initWithAccount:(id)a3 error:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)ICQDaemonOfferStubs;
  id v4 = [(ICQDaemonPersisted *)&v13 _initWithAccount:a3 error:a4];
  v5 = v4;
  if (v4)
  {
    BOOL v6 = (void *)v4[7];
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
    v4[7] = MEMORY[0x1E4F1CBF0];

    v8 = (void *)v5[8];
    v5[8] = v7;

    v9 = (void *)v5[9];
    v5[9] = v7;

    v10 = (void *)v5[10];
    v5[10] = v7;

    v11 = (void *)v5[11];
    v5[11] = v7;
  }
  return v5;
}

- (ICQDaemonOfferStubs)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICQDaemonOfferStubs;
  v3 = [(ICQDaemonPersisted *)&v6 initWithDictionary:a3];
  id v4 = v3;
  if (v3) {
    [(ICQDaemonOfferStubs *)v3 _initServerStubsFromServerDictionary];
  }
  return v4;
}

- (void)setServerDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQDaemonOfferStubs;
  [(ICQDaemonPersisted *)&v4 setServerDictionary:a3];
  [(ICQDaemonOfferStubs *)self _initServerStubsFromServerDictionary];
}

- (id)sortedServerStubs:(id)a3
{
  return (id)[a3 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_17];
}

uint64_t __41__ICQDaemonOfferStubs_sortedServerStubs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 objectForKeyedSubscript:@"priority"];
  objc_super v6 = [v4 objectForKeyedSubscript:@"priority"];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v7 = [v5 integerValue];
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v6) {
      goto LABEL_8;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v6 integerValue];
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
  if (v7 < v8) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v7 > v8;
  }

  return v9;
}

- (void)_initServerStubsFromServerDictionary
{
  v3 = [(ICQDaemonPersisted *)self serverDictionary];
  id v24 = [v3 objectForKeyedSubscript:@"deviceOffers"];

  BOOL v4 = [(ICQDaemonOfferStubs *)self _isValidServerStubs:v24 key:@"deviceOffers"];
  v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  if (v4)
  {
    objc_super v6 = [(ICQDaemonOfferStubs *)self sortedServerStubs:v24];
    serverStubs = self->_serverStubs;
    self->_serverStubs = v6;
  }
  else
  {
    serverStubs = self->_serverStubs;
    self->_serverStubs = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  uint64_t v8 = [(ICQDaemonPersisted *)self serverDictionary];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"buddyOffers"];

  if ([(ICQDaemonOfferStubs *)self _isValidServerStubs:v9 key:@"buddyOffers"])
  {
    v10 = [(ICQDaemonOfferStubs *)self sortedServerStubs:v9];
    buddyStubs = self->_buddyStubs;
    self->_buddyStubs = v10;
  }
  else
  {
    buddyStubs = self->_buddyStubs;
    self->_buddyStubs = v5;
  }

  v12 = [(ICQDaemonPersisted *)self serverDictionary];
  objc_super v13 = [v12 objectForKeyedSubscript:@"defaultOffers"];

  if ([(ICQDaemonOfferStubs *)self _isValidServerStubs:v13 key:@"defaultOffers"])
  {
    v14 = [(ICQDaemonOfferStubs *)self sortedServerStubs:v13];
    defaultStubs = self->_defaultStubs;
    self->_defaultStubs = v14;
  }
  else
  {
    defaultStubs = self->_defaultStubs;
    self->_defaultStubs = v5;
  }

  v16 = [(ICQDaemonPersisted *)self serverDictionary];
  v17 = [v16 objectForKeyedSubscript:@"premiumOffers"];

  if ([(ICQDaemonOfferStubs *)self _isValidServerStubs:v17 key:@"premiumOffers"])
  {
    v18 = [(ICQDaemonOfferStubs *)self sortedServerStubs:v17];
    premiumStubs = self->_premiumStubs;
    self->_premiumStubs = v18;
  }
  else
  {
    premiumStubs = self->_premiumStubs;
    self->_premiumStubs = v5;
  }

  v20 = [(ICQDaemonPersisted *)self serverDictionary];
  v21 = [v20 objectForKeyedSubscript:@"eventOffers"];

  if ([(ICQDaemonOfferStubs *)self _isValidServerStubs:v21 key:@"eventOffers"])
  {
    v22 = [(ICQDaemonOfferStubs *)self sortedServerStubs:v21];
    eventStubs = self->_eventStubs;
    self->_eventStubs = v22;
  }
  else
  {
    eventStubs = self->_eventStubs;
    self->_eventStubs = v5;
  }
}

- (BOOL)_isValidServerStubs:(id)a3 key:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  if (!v5)
  {
    uint64_t v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v6;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ is missing", buf, 0xCu);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v20 = v6;
      __int16 v21 = 2112;
      v22 = v9;
      id v10 = v9;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "invalid %{public}@ of class %@", buf, 0x16u);
    }
LABEL_9:

    BOOL v7 = 0;
    *((unsigned char *)v16 + 24) = 0;
    goto LABEL_10;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__ICQDaemonOfferStubs__isValidServerStubs_key___block_invoke;
  v12[3] = &unk_1E6A53668;
  id v13 = v6;
  v14 = &v15;
  [v5 enumerateObjectsUsingBlock:v12];

  BOOL v7 = *((unsigned char *)v16 + 24) != 0;
LABEL_10:
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __47__ICQDaemonOfferStubs__isValidServerStubs_key___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138543874;
      uint64_t v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = a3;
      __int16 v15 = 2112;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "invalid %{public}@[%ld] of class %@", (uint8_t *)&v11, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)_chooseStubFromServerStubs:(id)a3 conditions:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v26 = v5;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v30;
      id v10 = @"criteria";
      unint64_t v11 = 0x1E6A51000uLL;
      uint64_t v27 = *(void *)v30;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        __int16 v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
        uint64_t v14 = _ICQDictionaryForKey(v13, v10);
        __int16 v15 = (void *)[objc_alloc(*(Class *)(v11 + 2184)) initWithServerDictionary:v14];
        id v16 = _ICQGetLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          _ICQStringForKey(v13, @"offerType");
          id v17 = v6;
          v19 = char v18 = v10;
          _ICQStringForKey(v13, @"type");
          v21 = uint64_t v20 = v8;
          *(_DWORD *)buf = 138543874;
          v34 = v19;
          __int16 v35 = 2114;
          v36 = v21;
          __int16 v37 = 2114;
          v38 = v14;
          _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, "checking criteria for offer type %{public}@ type %{public}@ criteria\n%{public}@", buf, 0x20u);

          uint64_t v8 = v20;
          id v10 = v18;
          id v6 = v17;
          uint64_t v9 = v27;
          unint64_t v11 = 0x1E6A51000;
        }

        if ([v15 isSatisfiedByConditions:v6]) {
          break;
        }

        if (v8 == ++v12)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
      v22 = [[ICQDaemonOfferStub alloc] initWithServerDictionary:v13];

      if (!v22) {
        goto LABEL_15;
      }
      [(ICQDaemonOfferStub *)v22 setConditionsWhenChosen:v6];
    }
    else
    {
LABEL_12:

LABEL_15:
      uint64_t v23 = _ICQGetLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v23, OS_LOG_TYPE_DEFAULT, "choose stub: none with matching criteria found", buf, 2u);
      }

      v22 = 0;
    }
    id v5 = v26;
  }
  else
  {
    id v24 = _ICQGetLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v24, OS_LOG_TYPE_DEFAULT, "choose stub: none present", buf, 2u);
    }

    v22 = 0;
  }

  return v22;
}

- (BOOL)_stubsArrayContainsOfferID:(id)a3 stubs:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "objectForKeyedSubscript:", @"offerId", (void)v15);
        char v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (NSArray)serverStubs
{
  return self->_serverStubs;
}

- (NSArray)buddyStubs
{
  return self->_buddyStubs;
}

- (NSArray)defaultStubs
{
  return self->_defaultStubs;
}

- (NSArray)premiumStubs
{
  return self->_premiumStubs;
}

- (NSArray)eventStubs
{
  return self->_eventStubs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStubs, 0);
  objc_storeStrong((id *)&self->_premiumStubs, 0);
  objc_storeStrong((id *)&self->_defaultStubs, 0);
  objc_storeStrong((id *)&self->_buddyStubs, 0);
  objc_storeStrong((id *)&self->_serverStubs, 0);
}

- (id)chooseStubForOfferType:(int64_t)a3
{
  id v5 = [(ICQDaemonOfferStubs *)self serverStubs];
  id v6 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v5 offerType:a3];

  return v6;
}

- (id)chooseBuddyStubForOfferType:(int64_t)a3
{
  id v5 = [(ICQDaemonOfferStubs *)self buddyStubs];
  id v6 = [(ICQDaemonOfferStubs *)self _chooseStubFromServerStubs:v5 offerType:a3];

  return v6;
}

- (id)_chooseStubFromServerStubs:(id)a3 offerType:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[ICQDaemonOfferConditions currentConditions];
  if ([v5 count])
  {
    uint64_t v23 = v6;
    id v24 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
        char v12 = _ICQStringForKey(v11, @"offerType");
        uint64_t v13 = _ICQOfferTypeForServerString(v12);
        uint64_t v14 = _ICQGetLogSystem();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13 == a4) {
          break;
        }
        if (v15)
        {
          long long v16 = _ICQStringForOfferType(v13);
          long long v17 = _ICQStringForOfferType(a4);
          *(_DWORD *)buf = 138412802;
          long long v31 = v16;
          __int16 v32 = 2112;
          v33 = v12;
          __int16 v34 = 2112;
          __int16 v35 = v17;
          _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "skipping server offer type %@ (%@) because it doesn't match requested %@", buf, 0x20u);
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
      if (v15)
      {
        long long v18 = _ICQStringForOfferType(a4);
        *(_DWORD *)buf = 138412546;
        long long v31 = v18;
        __int16 v32 = 2112;
        v33 = v11;
        _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "choose offer type (%@):\n%@", buf, 0x16u);
      }
      v19 = [[ICQDaemonOfferStub alloc] initWithServerDictionary:v11];

      id v5 = v24;
      if (v19) {
        goto LABEL_21;
      }
    }
    else
    {
LABEL_12:

      id v5 = v24;
    }
    uint64_t v20 = _ICQGetLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = _ICQStringForOfferType(a4);
      *(_DWORD *)buf = 138412290;
      long long v31 = v21;
      _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "choose offer type (%@): none found", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v20 = _ICQGetLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "choose offer type: none present", buf, 2u);
    }
  }

  v19 = 0;
LABEL_21:
  -[ICQDaemonOfferStub setConditionsWhenChosen:](v19, "setConditionsWhenChosen:", v6, v23, v24);

  return v19;
}

@end