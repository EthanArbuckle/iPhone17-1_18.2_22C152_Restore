@interface WLKContentRating
- (NSString)contentRatingSystem;
- (NSString)displayName;
- (NSString)name;
- (WLKContentRating)init;
- (WLKContentRating)initWithDictionary:(id)a3;
- (unint64_t)ratingValue;
- (unint64_t)systemType;
@end

@implementation WLKContentRating

- (WLKContentRating)init
{
  return 0;
}

- (WLKContentRating)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v19.receiver = self;
    v19.super_class = (Class)WLKContentRating;
    v5 = [(WLKContentRating *)&v19 init];
    if (!v5)
    {
LABEL_11:
      self = v5;
      v17 = self;
      goto LABEL_12;
    }
    uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"system");
    contentRatingSystem = v5->_contentRatingSystem;
    v5->_contentRatingSystem = (NSString *)v6;

    v8 = objc_msgSend(v4, "wlk_numberForKey:", @"value");
    v5->_ratingValue = [v8 unsignedIntegerValue];

    v9 = objc_msgSend(v4, "wlk_stringForKey:", @"displayName");
    uint64_t v10 = [v9 copy];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    v12 = objc_msgSend(v4, "wlk_stringForKey:", @"name");
    uint64_t v13 = [v12 copy];
    name = v5->_name;
    v5->_name = (NSString *)v13;

    v15 = objc_msgSend(v4, "wlk_stringForKey:", @"systemType");
    if ([v15 isEqualToString:@"movies"])
    {
      uint64_t v16 = 1;
    }
    else
    {
      if (![v15 isEqualToString:@"tv"])
      {
        v5->_systemType = 0;
        goto LABEL_10;
      }
      uint64_t v16 = 2;
    }
    v5->_systemType = v16;
LABEL_10:

    goto LABEL_11;
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)ratingValue
{
  return self->_ratingValue;
}

- (NSString)contentRatingSystem
{
  return self->_contentRatingSystem;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)systemType
{
  return self->_systemType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_contentRatingSystem, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end