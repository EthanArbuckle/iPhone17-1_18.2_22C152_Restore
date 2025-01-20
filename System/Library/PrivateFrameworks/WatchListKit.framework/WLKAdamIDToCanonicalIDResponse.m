@interface WLKAdamIDToCanonicalIDResponse
- (NSString)canonicalID;
- (NSString)showID;
- (NSString)type;
- (NSString)url;
- (WLKAdamIDToCanonicalIDResponse)initWithDictionary:(id)a3;
@end

@implementation WLKAdamIDToCanonicalIDResponse

- (WLKAdamIDToCanonicalIDResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WLKAdamIDToCanonicalIDResponse;
  v5 = [(WLKAdamIDToCanonicalIDResponse *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"id");
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "wlk_stringForKey:", @"showId");
    showID = v5->_showID;
    v5->_showID = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "wlk_stringForKey:", @"url");
    url = v5->_url;
    v5->_url = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "wlk_stringForKey:", @"type");
    type = v5->_type;
    v5->_type = (NSString *)v12;
  }
  return v5;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSString)showID
{
  return self->_showID;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_showID, 0);

  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end