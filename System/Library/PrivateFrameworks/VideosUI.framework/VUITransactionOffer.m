@interface VUITransactionOffer
- (BOOL)initiateFamilySetup;
- (BOOL)playWhenDone;
- (NSArray)canonicalIDs;
- (NSArray)videosPlayables;
- (NSDictionary)offer;
- (NSString)buyParams;
- (NSString)title;
- (NSURL)sharedWatchUrl;
- (VUITransactionOffer)initWithDictionary:(id)a3;
- (id)notificationBody;
- (id)notificationTitle;
@end

@implementation VUITransactionOffer

- (VUITransactionOffer)initWithDictionary:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VUITransactionOffer;
  v6 = [(VUITransactionOffer *)&v34 init];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v6->_transactionOfferDict, a3);
      v7 = objc_msgSend(v5, "vui_arrayForKey:", @"videosPlayables");
      v8 = objc_msgSend(v5, "vui_dictionaryForKey:", @"contentMetadata");
      v9 = +[VUIVideosPlayable videosPlayablesFromDictionaries:v7 andMetadataDictionary:v8];
      uint64_t v10 = [v9 copy];
      videosPlayables = v6->_videosPlayables;
      v6->_videosPlayables = (NSArray *)v10;

      v12 = objc_msgSend(v5, "vui_dictionaryForKey:", @"offer");
      uint64_t v13 = [v12 copy];
      offer = v6->_offer;
      v6->_offer = (NSDictionary *)v13;

      v6->_initiateFamilySetup = objc_msgSend(v5, "vui_BOOLForKey:defaultValue:", @"initiateFamilySetup", 0);
      uint64_t v15 = objc_msgSend(v5, "vui_URLForKey:", @"sharedWatchUrl");
      sharedWatchUrl = v6->_sharedWatchUrl;
      v6->_sharedWatchUrl = (NSURL *)v15;

      v17 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v18 = [(NSDictionary *)v6->_offer vui_arrayForKey:@"canonicalIds"];
      v19 = (void *)v18;
      if (v18) {
        uint64_t v20 = v18;
      }
      else {
        uint64_t v20 = MEMORY[0x1E4F1CBF0];
      }
      v21 = [v17 setWithArray:v20];

      if (![v21 count] && -[NSArray count](v6->_videosPlayables, "count"))
      {
        v22 = [(NSArray *)v6->_videosPlayables firstObject];
        v23 = [v22 metadata];
        v24 = [v23 showCanonicalId];
        uint64_t v25 = [v24 length];

        if (v25)
        {
          v26 = [v22 metadata];
          v27 = [v26 showCanonicalId];
          [v21 addObject:v27];
        }
        v28 = [v22 canonicalID];
        uint64_t v29 = [v28 length];

        if (v29)
        {
          v30 = [v22 canonicalID];
          [v21 addObject:v30];
        }
      }
      uint64_t v31 = [v21 allObjects];
      canonicalIDs = v6->_canonicalIDs;
      v6->_canonicalIDs = (NSArray *)v31;
    }
  }

  return v6;
}

- (BOOL)playWhenDone
{
  return [(NSDictionary *)self->_transactionOfferDict vui_BOOLForKey:@"playWhenDone" defaultValue:1];
}

- (NSString)buyParams
{
  v3 = [(NSDictionary *)self->_transactionOfferDict vui_stringForKey:@"buyParams"];
  v4 = v3;
  if (!v3 || ![v3 length])
  {
    id v5 = [(VUITransactionOffer *)self offer];
    uint64_t v6 = objc_msgSend(v5, "vui_stringForKey:", @"buyParams");

    v4 = (void *)v6;
  }
  return (NSString *)v4;
}

- (NSString)title
{
  return (NSString *)[(NSDictionary *)self->_transactionOfferDict vui_stringForKey:@"title"];
}

- (id)notificationTitle
{
  return (id)[(NSDictionary *)self->_transactionOfferDict vui_stringForKey:@"notificationTitle"];
}

- (id)notificationBody
{
  return (id)[(NSDictionary *)self->_transactionOfferDict vui_stringForKey:@"notificationBody"];
}

- (NSArray)videosPlayables
{
  return self->_videosPlayables;
}

- (NSArray)canonicalIDs
{
  return self->_canonicalIDs;
}

- (NSDictionary)offer
{
  return self->_offer;
}

- (NSURL)sharedWatchUrl
{
  return self->_sharedWatchUrl;
}

- (BOOL)initiateFamilySetup
{
  return self->_initiateFamilySetup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedWatchUrl, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_canonicalIDs, 0);
  objc_storeStrong((id *)&self->_videosPlayables, 0);
  objc_storeStrong((id *)&self->_transactionOfferDict, 0);
}

@end