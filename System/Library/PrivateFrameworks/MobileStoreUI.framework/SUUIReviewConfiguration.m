@interface SUUIReviewConfiguration
- (NSString)allVersionsURLString;
- (NSString)currentVersionURLString;
- (NSString)pageNumberQueryParameter;
- (NSString)ratingURLString;
- (SUUIReviewConfiguration)initWithConfigurationDictionary:(id)a3;
@end

@implementation SUUIReviewConfiguration

- (SUUIReviewConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUIReviewConfiguration;
  v5 = [(SUUIReviewConfiguration *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"allVersionsUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      allVersionsURLString = v5->_allVersionsURLString;
      v5->_allVersionsURLString = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"currentVersionUrl"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      currentVersionURLString = v5->_currentVersionURLString;
      v5->_currentVersionURLString = (NSString *)v10;
    }
    v12 = [v4 objectForKey:@"inlineRatingUrl"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      ratingURLString = v5->_ratingURLString;
      v5->_ratingURLString = (NSString *)v13;
    }
    v15 = [v4 objectForKey:@"pageNumberQueryParam"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 copy];
      pageNumberQueryParameter = v5->_pageNumberQueryParameter;
      v5->_pageNumberQueryParameter = (NSString *)v16;
    }
  }

  return v5;
}

- (NSString)allVersionsURLString
{
  return self->_allVersionsURLString;
}

- (NSString)currentVersionURLString
{
  return self->_currentVersionURLString;
}

- (NSString)pageNumberQueryParameter
{
  return self->_pageNumberQueryParameter;
}

- (NSString)ratingURLString
{
  return self->_ratingURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingURLString, 0);
  objc_storeStrong((id *)&self->_pageNumberQueryParameter, 0);
  objc_storeStrong((id *)&self->_currentVersionURLString, 0);
  objc_storeStrong((id *)&self->_allVersionsURLString, 0);
}

@end