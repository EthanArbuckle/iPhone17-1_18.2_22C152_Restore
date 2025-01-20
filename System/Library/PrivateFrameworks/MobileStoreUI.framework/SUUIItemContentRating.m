@interface SUUIItemContentRating
- (NSArray)contentRatingAdvisories;
- (NSString)contentRank;
- (NSString)contentRatingName;
- (NSString)contentRatingSystemName;
- (SUUIItemContentRating)initWithContentRatingDictionary:(id)a3 systemName:(id)a4;
- (id)description;
@end

@implementation SUUIItemContentRating

- (SUUIItemContentRating)initWithContentRatingDictionary:(id)a3 systemName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SUUIItemContentRating;
  v8 = [(SUUIItemContentRating *)&v23 init];
  if (v8)
  {
    v9 = [v6 objectForKey:*MEMORY[0x263F7B9D0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      contentRatingAdvisories = v8->_contentRatingAdvisories;
      v8->_contentRatingAdvisories = (NSArray *)v10;
    }
    v12 = [v6 objectForKey:*MEMORY[0x263F7BA00]];

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

@end