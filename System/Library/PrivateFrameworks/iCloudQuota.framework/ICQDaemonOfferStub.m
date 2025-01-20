@interface ICQDaemonOfferStub
- (BOOL)isBuddyOffer;
- (BOOL)isDefaultOffer;
- (BOOL)isEventOffer;
- (BOOL)isPremiumOffer;
- (Class)offerClass;
- (ICQDaemonOfferConditions)conditionsWhenChosen;
- (ICQDaemonOfferCriteria)criteria;
- (ICQDaemonOfferStub)initWithServerDictionary:(id)a3;
- (NSDictionary)offerResetPayload;
- (NSDictionary)serverDictionary;
- (NSString)offerId;
- (NSString)offerResetURL;
- (id)persistedOffer;
- (int64_t)requestType;
- (void)offerResetURL;
- (void)setConditionsWhenChosen:(id)a3;
@end

@implementation ICQDaemonOfferStub

- (ICQDaemonOfferStub)initWithServerDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQDaemonOfferStub;
  v5 = [(ICQDaemonOfferStub *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serverDict = v5->_serverDict;
    v5->_serverDict = (NSDictionary *)v6;
  }
  return v5;
}

- (NSDictionary)serverDictionary
{
  return self->_serverDict;
}

- (NSString)offerId
{
  v2 = [(NSDictionary *)self->_serverDict objectForKeyedSubscript:@"offerId"];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1F2DCE430;
  }
  id v4 = v2;

  return v4;
}

- (BOOL)isBuddyOffer
{
  return _ICQIsBuddyOfferDictionary(self->_serverDict);
}

- (BOOL)isDefaultOffer
{
  return _ICQIsDefaultOfferDictionary(self->_serverDict);
}

- (BOOL)isPremiumOffer
{
  return _ICQIsPremiumOfferDictionary(self->_serverDict);
}

- (BOOL)isEventOffer
{
  return _ICQIsEventOfferDictionary(self->_serverDict);
}

- (ICQDaemonOfferCriteria)criteria
{
  v2 = [(ICQDaemonOfferStub *)self serverDictionary];
  v3 = [v2 objectForKeyedSubscript:@"criteria"];

  id v4 = [[ICQDaemonOfferCriteria alloc] initWithServerDictionary:v3];
  return v4;
}

- (Class)offerClass
{
  if (![(ICQDaemonOfferStub *)self isBuddyOffer]
    && ![(ICQDaemonOfferStub *)self isPremiumOffer]
    && ![(ICQDaemonOfferStub *)self isDefaultOffer])
  {
    [(ICQDaemonOfferStub *)self isEventOffer];
  }
  v3 = objc_opt_class();
  return (Class)v3;
}

- (id)persistedOffer
{
  v2 = [(ICQDaemonOfferStub *)self offerClass];
  return (id)[(objc_class *)v2 persistedObject];
}

- (int64_t)requestType
{
  if ([(ICQDaemonOfferStub *)self isBuddyOffer]) {
    return 4;
  }
  if ([(ICQDaemonOfferStub *)self isPremiumOffer]) {
    return 2;
  }
  if ([(ICQDaemonOfferStub *)self isDefaultOffer]) {
    return 1;
  }
  if ([(ICQDaemonOfferStub *)self isEventOffer]) {
    return 5;
  }
  return 3;
}

- (NSString)offerResetURL
{
  v2 = [(NSDictionary *)self->_serverDict objectForKeyedSubscript:@"offerResetURL"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ICQDaemonOfferStub offerResetURL]();
    }

    id v3 = 0;
  }
  else
  {
    id v3 = v2;
  }

  return (NSString *)v3;
}

- (NSDictionary)offerResetPayload
{
  v2 = [(NSDictionary *)self->_serverDict objectForKeyedSubscript:@"offerResetPayload"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ICQDaemonOfferStub offerResetURL]();
    }

    id v3 = 0;
  }
  else
  {
    id v3 = v2;
  }

  return (NSDictionary *)v3;
}

- (ICQDaemonOfferConditions)conditionsWhenChosen
{
  return self->_conditionsWhenChosen;
}

- (void)setConditionsWhenChosen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionsWhenChosen, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

- (void)offerResetURL
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_2(&dword_1D5851000, v1, v2, "Expected String for offerResetURL got %@", v3, v4, v5, v6, 2u);
}

@end