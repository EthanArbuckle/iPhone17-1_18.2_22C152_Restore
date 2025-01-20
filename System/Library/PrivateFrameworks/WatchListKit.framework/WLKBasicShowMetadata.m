@interface WLKBasicShowMetadata
- (NSDate)finaleDate;
- (NSDate)releaseDate;
- (NSString)network;
- (WLKBasicShowMetadata)init;
- (WLKBasicShowMetadata)initWithDictionary:(id)a3;
@end

@implementation WLKBasicShowMetadata

- (WLKBasicShowMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WLKBasicShowMetadata;
  v5 = [(WLKBasicContentMetadata *)&v14 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", @"releaseDate");
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v6;

    uint64_t v8 = objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", @"finaleDate");
    finaleDate = v5->_finaleDate;
    v5->_finaleDate = (NSDate *)v8;

    v10 = objc_msgSend(v4, "wlk_stringForKey:", @"network");
    uint64_t v11 = [v10 copy];
    network = v5->_network;
    v5->_network = (NSString *)v11;
  }
  return v5;
}

- (WLKBasicShowMetadata)init
{
  return [(WLKBasicShowMetadata *)self initWithDictionary:0];
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSDate)finaleDate
{
  return self->_finaleDate;
}

- (NSString)network
{
  return self->_network;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_finaleDate, 0);

  objc_storeStrong((id *)&self->_releaseDate, 0);
}

@end