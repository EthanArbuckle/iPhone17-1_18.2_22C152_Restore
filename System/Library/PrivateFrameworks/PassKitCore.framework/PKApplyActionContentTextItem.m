@interface PKApplyActionContentTextItem
- (NSArray)odiDetails;
- (NSCopying)identifier;
- (NSString)analyticsIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (PKApplyActionContentTextItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)odiAttributesDictionary;
- (void)setAnalyticsIdentifier:(id)a3;
@end

@implementation PKApplyActionContentTextItem

- (PKApplyActionContentTextItem)initWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKApplyActionContentTextItem;
  v5 = [(PKApplyActionContentTextItem *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"analyticsIdentifier"];
    analyticsIdentifier = v5->_analyticsIdentifier;
    v5->_analyticsIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    v12 = [v4 PKArrayContaining:objc_opt_class() forKey:@"odiDetails"];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * v18);
          v20 = [PKApplyActionContentTextItemODIDetail alloc];
          v21 = -[PKApplyActionContentTextItemODIDetail initWithDictionary:](v20, "initWithDictionary:", v19, (void)v25);
          [v13 safelyAddObject:v21];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v16);
    }

    if ([v13 count])
    {
      uint64_t v22 = [v13 copy];
      odiDetails = v5->_odiDetails;
      v5->_odiDetails = (NSArray *)v22;
    }
    else
    {
      odiDetails = v5->_odiDetails;
      v5->_odiDetails = 0;
    }
  }
  return v5;
}

- (id)odiAttributesDictionary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_odiDetails;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "odiAttributesDictionary", (void)v11);
        [v3 addEntriesFromDictionary:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  if (self->_analyticsIdentifier) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_title) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_subtitle) {
    objc_msgSend(v3, "appendString:");
  }
  uint64_t v6 = (void *)[v3 copy];

  return (NSCopying *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PKApplyActionContentTextItem allocWithZone:](PKApplyActionContentTextItem, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_analyticsIdentifier copyWithZone:a3];
  analyticsIdentifier = v5->_analyticsIdentifier;
  v5->_analyticsIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_subtitle copyWithZone:a3];
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v10;

  uint64_t v12 = [(NSArray *)self->_odiDetails copyWithZone:a3];
  odiDetails = v5->_odiDetails;
  v5->_odiDetails = (NSArray *)v12;

  return v5;
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSArray)odiDetails
{
  return self->_odiDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiDetails, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
}

@end