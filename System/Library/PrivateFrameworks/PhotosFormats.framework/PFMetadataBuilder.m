@interface PFMetadataBuilder
- (CLLocation)location;
- (NSArray)keywords;
- (NSArray)peopleNames;
- (NSDate)creationDate;
- (NSString)accessibilityDescription;
- (NSString)caption;
- (NSString)title;
- (NSTimeZone)creationTimeZone;
- (PFMetadataBuilder)init;
- (id)combinedKeywordsAndPeople;
- (void)setAccessibilityDescription:(id)a3;
- (void)setCaption:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCreationDate:(id)a3 timeZone:(id)a4;
- (void)setCreationTimeZone:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPeopleNames:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PFMetadataBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_peopleNames, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_creationTimeZone, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setPeopleNames:(id)a3
{
}

- (NSArray)peopleNames
{
  return self->_peopleNames;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setKeywords:(id)a3
{
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setCaption:(id)a3
{
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCreationTimeZone:(id)a3
{
}

- (NSTimeZone)creationTimeZone
{
  return self->_creationTimeZone;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (id)combinedKeywordsAndPeople
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(PFMetadataBuilder *)self keywords];
  v4 = [(PFMetadataBuilder *)self peopleNames];
  if ([v3 count])
  {
    v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count") + objc_msgSend(v3, "count"));
  if ([v3 count]) {
    [v6 addObjectsFromArray:v3];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v12, (void)v14) & 1) == 0) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)setCreationDate:(id)a3 timeZone:(id)a4
{
  id v6 = a4;
  [(PFMetadataBuilder *)self setCreationDate:a3];
  [(PFMetadataBuilder *)self setCreationTimeZone:v6];
}

- (PFMetadataBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataBuilder;
  v2 = [(PFMetadataBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    creationTimeZone = v2->_creationTimeZone;
    v2->_creationTimeZone = (NSTimeZone *)v3;
  }
  return v2;
}

@end