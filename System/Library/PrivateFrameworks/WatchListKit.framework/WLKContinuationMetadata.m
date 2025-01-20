@interface WLKContinuationMetadata
- (NSArray)siriActionsCategories;
- (NSNumber)siriActionsExpirationEpochMillis;
- (NSString)deleteID;
- (WLKContinuationMetadata)initWithDictionary:(id)a3 context:(id)a4;
- (WLKPlayable)playable;
@end

@implementation WLKContinuationMetadata

- (WLKContinuationMetadata)initWithDictionary:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WLKContinuationMetadata;
  v8 = [(WLKContinuationMetadataBase *)&v22 initWithDictionary:v6 context:v7];
  if (v8)
  {
    v9 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"playable");
    v10 = objc_msgSend(v6, "wlk_arrayForKey:", @"playables");
    if ([v10 count])
    {
      uint64_t v11 = [v10 firstObject];

      v9 = (void *)v11;
    }
    if (v9)
    {
      v12 = [[WLKPlayable alloc] initWithDictionary:v9 context:v7];
      playable = v8->_playable;
      v8->_playable = v12;
    }
    uint64_t v14 = objc_msgSend(v6, "wlk_stringForKey:", @"deleteId");
    deleteID = v8->_deleteID;
    v8->_deleteID = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v6, "wlk_numberForKey:", @"siriActionsExpirationEpochMillis");
    siriActionsExpirationEpochMillis = v8->_siriActionsExpirationEpochMillis;
    v8->_siriActionsExpirationEpochMillis = (NSNumber *)v16;

    v18 = objc_msgSend(v6, "wlk_arrayForKey:", @"siriActionsCategories");
    uint64_t v19 = [v18 copy];
    siriActionsCategories = v8->_siriActionsCategories;
    v8->_siriActionsCategories = (NSArray *)v19;
  }
  return v8;
}

- (WLKPlayable)playable
{
  return self->_playable;
}

- (NSString)deleteID
{
  return self->_deleteID;
}

- (NSNumber)siriActionsExpirationEpochMillis
{
  return self->_siriActionsExpirationEpochMillis;
}

- (NSArray)siriActionsCategories
{
  return self->_siriActionsCategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriActionsCategories, 0);
  objc_storeStrong((id *)&self->_siriActionsExpirationEpochMillis, 0);
  objc_storeStrong((id *)&self->_deleteID, 0);

  objc_storeStrong((id *)&self->_playable, 0);
}

@end