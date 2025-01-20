@interface SFResultSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isInitiallyHidden;
- (NSArray)results;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (NSString)moreText;
- (NSString)subtitle;
- (NSString)title;
- (SFCommandButtonItem)button;
- (SFCommandButtonItem)titleButtonItem;
- (SFResultSection)init;
- (SFResultSection)initWithCoder:(id)a3;
- (double)rankingScore;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maxInitiallyVisibleResults;
- (unint64_t)totalAvailableResults;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setButton:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsInitiallyHidden:(BOOL)a3;
- (void)setMaxInitiallyVisibleResults:(unint64_t)a3;
- (void)setMoreText:(id)a3;
- (void)setRankingScore:(double)a3;
- (void)setResults:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleButtonItem:(id)a3;
- (void)setTotalAvailableResults:(unint64_t)a3;
@end

@implementation SFResultSection

- (NSData)jsonData
{
  v2 = [(SFResultSection *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(SFResultSection *)self bundleIdentifier];

  if (v4)
  {
    v5 = [(SFResultSection *)self bundleIdentifier];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"bundleIdentifier"];
  }
  v7 = [(SFResultSection *)self identifier];

  if (v7)
  {
    v8 = [(SFResultSection *)self identifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"identifier"];
  }
  v10 = NSNumber;
  [(SFResultSection *)self rankingScore];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"rankingScore"];

  v12 = [(SFResultSection *)self results];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = [(SFResultSection *)self results];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"results"];
  }
  return (NSDictionary *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_moreText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleButtonItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)setTotalAvailableResults:(unint64_t)a3
{
  self->_totalAvailableResults = a3;
}

- (unint64_t)totalAvailableResults
{
  return self->_totalAvailableResults;
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (void)setButton:(id)a3
{
}

- (SFCommandButtonItem)button
{
  return self->_button;
}

- (void)setMoreText:(id)a3
{
}

- (NSString)moreText
{
  return self->_moreText;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitleButtonItem:(id)a3
{
}

- (SFCommandButtonItem)titleButtonItem
{
  return self->_titleButtonItem;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIsInitiallyHidden:(BOOL)a3
{
  self->_isInitiallyHidden = a3;
}

- (BOOL)isInitiallyHidden
{
  return self->_isInitiallyHidden;
}

- (void)setMaxInitiallyVisibleResults:(unint64_t)a3
{
  self->_maxInitiallyVisibleResults = a3;
}

- (unint64_t)maxInitiallyVisibleResults
{
  return self->_maxInitiallyVisibleResults;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFResultSection *)self bundleIdentifier];
  uint64_t v6 = [v5 copy];
  v7 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v6;

  v8 = [(SFResultSection *)self title];
  uint64_t v9 = [v8 copy];
  v10 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v9;

  [(SFResultSection *)self rankingScore];
  *(void *)(v4 + 88) = v11;
  v12 = [(SFResultSection *)self results];
  uint64_t v13 = [v12 copy];
  v14 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v13;

  *(void *)(v4 + 24) = [(SFResultSection *)self maxInitiallyVisibleResults];
  uint64_t v15 = [(SFResultSection *)self identifier];
  uint64_t v16 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v15;

  *(unsigned char *)(v4 + 8) = [(SFResultSection *)self isInitiallyHidden];
  uint64_t v17 = [(SFResultSection *)self button];
  uint64_t v18 = [v17 copy];
  v19 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v18;

  uint64_t v20 = [(SFResultSection *)self subtitle];
  v21 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v20;

  long long v22 = [(SFResultSection *)self moreText];
  uint64_t v23 = [v22 copy];
  long long v24 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v23;

  *(void *)(v4 + 96) = [(SFResultSection *)self totalAvailableResults];
  long long v25 = [(SFResultSection *)self titleButtonItem];
  uint64_t v26 = [v25 copy];
  uint64_t v27 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v26;

  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"_bundleIdentifier"];
  [v5 encodeObject:self->_title forKey:@"_title"];
  [v5 encodeDouble:@"_rankingScore" forKey:self->_rankingScore];
  [v5 encodeObject:self->_results forKey:@"_results"];
  [v5 encodeInteger:self->_maxInitiallyVisibleResults forKey:@"_maxInitiallyVisibleResults"];
  [v5 encodeObject:self->_moreText forKey:@"_moreText"];
  [v5 encodeObject:self->_button forKey:@"_button"];
  [v5 encodeObject:self->_identifier forKey:@"_identifier"];
  [v5 encodeBool:self->_isInitiallyHidden forKey:@"_isInitiallyHidden"];
  [v5 encodeObject:self->_subtitle forKey:@"_subtitle"];
  [v5 encodeInteger:self->_totalAvailableResults forKey:@"_totalAvailableResults"];
  [v5 encodeObject:self->_titleButtonItem forKey:@"_titleButtonItem"];
}

- (SFResultSection)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v4 = a3;
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v5;

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = self->_title;
    self->_title = v7;

    [v4 decodeDoubleForKey:@"_rankingScore"];
    self->_rankingScore = v9;
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_results"];
    results = self->_results;
    self->_results = v13;

    self->_maxInitiallyVisibleResults = [v4 decodeIntegerForKey:@"_maxInitiallyVisibleResults"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_moreText"];
    moreText = self->_moreText;
    self->_moreText = v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_button"];
    button = self->_button;
    self->_button = v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = self->_identifier;
    self->_identifier = v19;

    self->_isInitiallyHidden = [v4 decodeBoolForKey:@"_isInitiallyHidden"];
    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subtitle"];
    subtitle = self->_subtitle;
    self->_subtitle = v21;

    self->_totalAvailableResults = [v4 decodeIntegerForKey:@"_totalAvailableResults"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_titleButtonItem"];

    titleButtonItem = self->_titleButtonItem;
    self->_titleButtonItem = v23;
  }
  return self;
}

- (SFResultSection)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFResultSection;
  v2 = [(SFResultSection *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end