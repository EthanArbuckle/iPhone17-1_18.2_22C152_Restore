@interface SPSearchSuggestionEntity
+ (BOOL)supportsSecureCoding;
- (SPSearchSuggestionEntity)initWithCoder:(id)a3;
- (SPSearchSuggestionEntity)initWithSearchString:(id)a3 spotlightQueryString:(id)a4 preferredBundleIDs:(id)a5;
- (id)spotlightQueryString;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPSearchSuggestionEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SPSearchSuggestionEntity;
  id v4 = a3;
  [(SPSearchEntity *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_spotlightQueryString, @"spotlightQueryString", v5.receiver, v5.super_class);
}

- (SPSearchSuggestionEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPSearchSuggestionEntity;
  objc_super v5 = [(SPSearchEntity *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spotlightQueryString"];
    spotlightQueryString = v5->_spotlightQueryString;
    v5->_spotlightQueryString = (NSString *)v6;

    [(SPSearchEntity *)v5 setIsSuggestion:1];
  }

  return v5;
}

- (SPSearchSuggestionEntity)initWithSearchString:(id)a3 spotlightQueryString:(id)a4 preferredBundleIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SPSearchSuggestionEntity;
  v11 = [(SPSearchSuggestionEntity *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(SPSearchEntity *)v11 setSearchString:v8];
    [(SPSearchEntity *)v12 setDisplayString:v8];
    objc_storeStrong((id *)&v12->_spotlightQueryString, a4);
    [(SPSearchEntity *)v12 setPreferredBundleIDs:v10];
  }

  return v12;
}

- (id)spotlightQueryString
{
  return self->_spotlightQueryString;
}

- (void).cxx_destruct
{
}

@end