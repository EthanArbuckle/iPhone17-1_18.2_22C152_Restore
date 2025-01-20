@interface WLKOfferListing
- (BOOL)_prefersSD;
- (NSArray)storeOffers;
- (WLKOfferListing)initWithMAPIDictionaries:(id)a3;
- (WLKStoreOffer)bestStoreBuyOffer;
- (WLKStoreOffer)bestStoreGetOffer;
- (WLKStoreOffer)bestStoreRedownloadOffer;
- (WLKStoreOffer)bestStoreRentalOffer;
- (id)_bestStoreOfferForOfferType:(unint64_t)a3;
- (id)_filteredStoreContentSource:(id)a3;
- (id)_highDefinitionPredicate;
- (id)_standardDefinitionPredicate;
- (id)_storeOffersFromMAPIDictionaries:(id)a3;
@end

@implementation WLKOfferListing

- (WLKOfferListing)initWithMAPIDictionaries:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WLKOfferListing;
  v5 = [(WLKOfferListing *)&v10 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(WLKOfferListing *)v5 _storeOffersFromMAPIDictionaries:v4];
    storeOffers = v6->_storeOffers;
    v6->_storeOffers = (NSArray *)v7;
  }
  return v6;
}

- (WLKStoreOffer)bestStoreBuyOffer
{
  return (WLKStoreOffer *)[(WLKOfferListing *)self _bestStoreOfferForOfferType:1];
}

- (WLKStoreOffer)bestStoreRentalOffer
{
  return (WLKStoreOffer *)[(WLKOfferListing *)self _bestStoreOfferForOfferType:2];
}

- (WLKStoreOffer)bestStoreGetOffer
{
  return (WLKStoreOffer *)[(WLKOfferListing *)self _bestStoreOfferForOfferType:5];
}

- (WLKStoreOffer)bestStoreRedownloadOffer
{
  return (WLKStoreOffer *)[(WLKOfferListing *)self _bestStoreOfferForOfferType:6];
}

- (id)_storeOffersFromMAPIDictionaries:(id)a3
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
        v12 = -[WLKStoreOffer initWithMAPIDictionary:](v11, "initWithMAPIDictionary:", v10, (void)v15);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    v13 = (void *)[v4 copy];
  }
  else {
    v13 = 0;
  }

  return v13;
}

- (id)_filteredStoreContentSource:(id)a3
{
  id v4 = a3;
  if ([(WLKOfferListing *)self _prefersSD])
  {
    id v5 = [(WLKOfferListing *)self _standardDefinitionPredicate];
    uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];
  }
  else
  {
    uint64_t v7 = [(WLKOfferListing *)self _highDefinitionPredicate];
    uint64_t v6 = [v4 filteredArrayUsingPredicate:v7];

    if ([v6 count]) {
      goto LABEL_6;
    }
    id v5 = [(WLKOfferListing *)self _standardDefinitionPredicate];
    uint64_t v8 = [v4 filteredArrayUsingPredicate:v5];

    uint64_t v6 = (void *)v8;
  }

LABEL_6:
  v9 = [v6 firstObject];

  return v9;
}

- (id)_standardDefinitionPredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"dictionary.variant = 'SD'"];
}

- (id)_highDefinitionPredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"dictionary.variant = 'HD'"];
}

- (BOOL)_prefersSD
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.videos-preferences"];
  id v3 = [v2 objectForKey:@"PreferredPurchaseResolution"];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v4 = [v3 integerValue] == 1;
  }
  else
  {
    NSLog(&cfstr_Wlkofferlistin.isa);
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_bestStoreOfferForOfferType:(unint64_t)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"offerType = %d", a3);
  id v5 = [(WLKOfferListing *)self storeOffers];
  uint64_t v6 = [v5 filteredArrayUsingPredicate:v4];

  uint64_t v7 = [(WLKOfferListing *)self _filteredStoreContentSource:v6];

  return v7;
}

- (NSArray)storeOffers
{
  return self->_storeOffers;
}

- (void).cxx_destruct
{
}

@end