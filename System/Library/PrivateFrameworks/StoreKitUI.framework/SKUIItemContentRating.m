@interface SKUIItemContentRating
- (NSArray)contentRatingAdvisories;
- (NSString)contentRank;
- (NSString)contentRatingName;
- (NSString)contentRatingSystemName;
- (SKUIItemContentRating)initWithContentRatingDictionary:(id)a3 systemName:(id)a4;
- (id)description;
@end

@implementation SKUIItemContentRating

- (SKUIItemContentRating)initWithContentRatingDictionary:(id)a3 systemName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIItemContentRating initWithContentRatingDictionary:systemName:]();
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIItemContentRating;
  v8 = [(SKUIItemContentRating *)&v23 init];
  if (v8)
  {
    v9 = [v6 objectForKey:*MEMORY[0x1E4FA86F8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      contentRatingAdvisories = v8->_contentRatingAdvisories;
      v8->_contentRatingAdvisories = (NSArray *)v10;
    }
    v12 = [v6 objectForKey:*MEMORY[0x1E4FA8728]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      contentRatingName = v8->_contentRatingName;
      v8->_contentRatingName = (NSString *)v13;
    }
    v15 = [v6 objectForKey:@"rank"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 stringValue];
      contentRank = v8->_contentRank;
      v8->_contentRank = (NSString *)v16;
    }
    v18 = [v6 objectForKey:@"system"];

    if (v18) {
      v19 = v18;
    }
    else {
      v19 = v7;
    }
    uint64_t v20 = [v19 copy];
    contentRatingSystemName = v8->_contentRatingSystemName;
    v8->_contentRatingSystemName = (NSString *)v20;
  }
  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{ system:%@ name:%@ rank:%@ advisories:%@ }", self->_contentRatingSystemName, self->_contentRatingName, self->_contentRank, self->_contentRatingAdvisories];
}

- (NSString)contentRatingName
{
  return self->_contentRatingName;
}

- (NSArray)contentRatingAdvisories
{
  return self->_contentRatingAdvisories;
}

- (NSString)contentRatingSystemName
{
  return self->_contentRatingSystemName;
}

- (NSString)contentRank
{
  return self->_contentRank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRank, 0);
  objc_storeStrong((id *)&self->_contentRatingSystemName, 0);
  objc_storeStrong((id *)&self->_contentRatingName, 0);

  objc_storeStrong((id *)&self->_contentRatingAdvisories, 0);
}

- (void)initWithContentRatingDictionary:systemName:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItemContentRating initWithContentRatingDictionary:systemName:]";
}

@end