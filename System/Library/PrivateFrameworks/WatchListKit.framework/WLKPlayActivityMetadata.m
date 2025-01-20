@interface WLKPlayActivityMetadata
- (NSArray)siriActionsCategories;
- (NSNumber)isCurrentEpisode;
- (NSNumber)isShowClosed;
- (NSString)canonicalID;
- (NSString)canonicalShowID;
- (NSString)externalShowID;
- (NSString)internalLegID;
- (NSString)key;
- (NSString)nowPlayingPassThrough;
- (NSString)overrideChannelID;
- (NSString)url;
- (WLKPlayActivityMetadata)initWithDictionary:(id)a3;
- (WLKPlayActivityMetadata)initWithKey:(id)a3 dictionary:(id)a4;
- (unint64_t)contentType;
@end

@implementation WLKPlayActivityMetadata

- (WLKPlayActivityMetadata)initWithKey:(id)a3 dictionary:(id)a4
{
  id v6 = a4;
  if ([a3 rangeOfString:@":" options:6] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid key provided"];
    v7 = 0;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)WLKPlayActivityMetadata;
    v8 = [(WLKPlayActivityMetadata *)&v28 init];
    if (v8)
    {
      uint64_t v9 = objc_msgSend(v6, "wlk_stringForKey:", @"externalShowId");
      externalShowID = v8->_externalShowID;
      v8->_externalShowID = (NSString *)v9;

      uint64_t v11 = objc_msgSend(v6, "wlk_stringForKey:", @"canonicalId");
      canonicalID = v8->_canonicalID;
      v8->_canonicalID = (NSString *)v11;

      uint64_t v13 = objc_msgSend(v6, "wlk_stringForKey:", @"canonicalShowId");
      canonicalShowID = v8->_canonicalShowID;
      v8->_canonicalShowID = (NSString *)v13;

      uint64_t v15 = objc_msgSend(v6, "wlk_stringForKey:", @"internalLegId");
      internalLegID = v8->_internalLegID;
      v8->_internalLegID = (NSString *)v15;

      uint64_t v17 = objc_msgSend(v6, "wlk_numberForKey:", @"isShowClosed");
      isShowClosed = v8->_isShowClosed;
      v8->_isShowClosed = (NSNumber *)v17;

      uint64_t v19 = objc_msgSend(v6, "wlk_numberForKey:", @"isCurrent");
      isCurrentEpisode = v8->_isCurrentEpisode;
      v8->_isCurrentEpisode = (NSNumber *)v19;

      uint64_t v21 = objc_msgSend(v6, "wlk_stringForKey:", @"brandId");
      overrideChannelID = v8->_overrideChannelID;
      v8->_overrideChannelID = (NSString *)v21;

      v23 = objc_msgSend(v6, "wlk_arrayForKey:", @"siriActionsCategories");
      uint64_t v24 = [v23 copy];
      siriActionsCategories = v8->_siriActionsCategories;
      v8->_siriActionsCategories = (NSArray *)v24;

      v26 = [v6 objectForKey:@"contentType"];
      v8->_contentType = +[WLKBasicContentMetadata contentTypeForString:v26];
    }
    self = v8;
    v7 = self;
  }

  return v7;
}

- (WLKPlayActivityMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WLKPlayActivityMetadata;
  v5 = [(WLKPlayActivityMetadata *)&v14 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"canonicalId");
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "wlk_stringForKey:", @"url");
    url = v5->_url;
    v5->_url = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "wlk_stringForKey:", @"nowPlayingPassThrough");
    nowPlayingPassThrough = v5->_nowPlayingPassThrough;
    v5->_nowPlayingPassThrough = (NSString *)v10;

    v12 = [v4 objectForKey:@"type"];
    v5->_contentType = +[WLKBasicContentMetadata contentTypeForString:v12];
  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSString)externalShowID
{
  return self->_externalShowID;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSString)canonicalShowID
{
  return self->_canonicalShowID;
}

- (NSString)internalLegID
{
  return self->_internalLegID;
}

- (NSString)overrideChannelID
{
  return self->_overrideChannelID;
}

- (NSArray)siriActionsCategories
{
  return self->_siriActionsCategories;
}

- (NSNumber)isCurrentEpisode
{
  return self->_isCurrentEpisode;
}

- (NSNumber)isShowClosed
{
  return self->_isShowClosed;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)nowPlayingPassThrough
{
  return self->_nowPlayingPassThrough;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingPassThrough, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_isShowClosed, 0);
  objc_storeStrong((id *)&self->_isCurrentEpisode, 0);
  objc_storeStrong((id *)&self->_siriActionsCategories, 0);
  objc_storeStrong((id *)&self->_overrideChannelID, 0);
  objc_storeStrong((id *)&self->_internalLegID, 0);
  objc_storeStrong((id *)&self->_canonicalShowID, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_externalShowID, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end