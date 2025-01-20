@interface ICStorePlatformOffer
- (ICStorePlatformOffer)initWithResponseDictionary:(id)a3;
- (NSArray)assets;
- (NSNumber)price;
- (NSString)buyParameters;
- (NSString)formattedPrice;
- (NSString)offerType;
@end

@implementation ICStorePlatformOffer

- (void).cxx_destruct
{
}

- (NSNumber)price
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"price"];
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSNumber *)v2;
}

- (NSString)offerType
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"type"];
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)formattedPrice
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"priceFormatted"];
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)buyParameters
{
  v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"buyParams"];
  if ((_NSIsNSString() & 1) == 0)
  {
    v4 = [(NSDictionary *)self->_responseDictionary objectForKey:@"action-params"];

    if (_NSIsNSString())
    {
      v3 = v4;
    }
    else
    {

      v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (NSArray)assets
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"assets"];
  if (_NSIsNSArray())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      v6 = 0;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v10 = [ICStorePlatformOfferAsset alloc];
            v11 = -[ICStorePlatformOfferAsset initWithResponseDictionary:](v10, "initWithResponseDictionary:", v9, (void)v13);
            if (v11)
            {
              if (!v6) {
                v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
              }
              [v6 addObject:v11];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (ICStorePlatformOffer)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStorePlatformOffer;
  uint64_t v5 = [(ICStorePlatformOffer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end