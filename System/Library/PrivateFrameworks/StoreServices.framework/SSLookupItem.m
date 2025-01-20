@interface SSLookupItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isPOIBased;
- (NSArray)artwork;
- (NSArray)categoryNames;
- (NSArray)offers;
- (NSDictionary)lookupDictionary;
- (NSNumber)ITunesStoreIdentifier;
- (NSString)artistName;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)itemKind;
- (NSURL)productPageURL;
- (SSLookupItem)initWithCoder:(id)a3;
- (SSLookupItem)initWithLookupDictionary:(id)a3;
- (float)userRating;
- (float)userRatingForCurrentVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfUserRatings;
- (int64_t)numberOfUserRatingsForCurrentVersion;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SSLookupItem

- (SSLookupItem)initWithLookupDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSLookupItem;
  v4 = [(SSLookupItem *)&v6 init];
  if (v4) {
    v4->_dictionary = (NSDictionary *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSLookupItem;
  [(SSLookupItem *)&v3 dealloc];
}

- (NSString)artistName
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"artistName"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;
  return (NSString *)v3;
}

- (NSArray)artwork
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(NSDictionary *)self->_dictionary objectForKey:@"artwork"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
LABEL_5:
    objc_super v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v4, 0);
    goto LABEL_5;
  }
  objc_super v6 = 0;
LABEL_7:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [[SSLookupItemArtwork alloc] initWithLookupDictionary:v11];
          if (v12)
          {
            v13 = v12;
            [(NSArray *)v3 addObject:v12];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v3;
}

- (NSString)bundleIdentifier
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"bundleId"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;
  return (NSString *)v3;
}

- (NSArray)categoryNames
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"genreNames"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;
  return (NSArray *)v3;
}

- (NSString)displayName
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"name"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;
  return (NSString *)v3;
}

- (BOOL)isPOIBased
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"poiBased"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (NSString)itemKind
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"kind"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;
  return (NSString *)v3;
}

- (NSNumber)ITunesStoreIdentifier
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"id"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = (id)objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
    }
    else {
      id v2 = 0;
    }
  }
  id v3 = v2;
  return (NSNumber *)v3;
}

- (int64_t)numberOfUserRatings
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"userRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (void *)[v2 objectForKey:@"ratingCount"];
  }
  else {
    id v3 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v3 integerValue];
}

- (int64_t)numberOfUserRatingsForCurrentVersion
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"userRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (void *)[v2 objectForKey:@"ratingCountCurrentVersion"];
  }
  else {
    id v3 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v3 integerValue];
}

- (NSArray)offers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(NSDictionary *)self->_dictionary objectForKey:@"offers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v10 = [[SSLookupItemOffer alloc] initWithLookupDictionary:v9];
            if (v10)
            {
              uint64_t v11 = v10;
              [(NSArray *)v3 addObject:v10];
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  return v3;
}

- (NSURL)productPageURL
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  return (NSURL *)[v3 URLWithString:v2];
}

- (float)userRating
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"userRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (void *)[v2 objectForKey:@"value"];
  }
  else {
    id v3 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  [v3 floatValue];
  return result;
}

- (float)userRatingForCurrentVersion
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"userRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (void *)[v2 objectForKey:@"valueCurrentVersion"];
  }
  else {
    id v3 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  [v3 floatValue];
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = [(NSDictionary *)self->_dictionary copy];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSLookupItem)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSLookupItem;
  id v4 = [(SSLookupItem *)&v6 init];
  if (v4) {
    v4->_dictionary = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"SSEncodingDictionary"), "copy");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)lookupDictionary
{
  return self->_dictionary;
}

@end