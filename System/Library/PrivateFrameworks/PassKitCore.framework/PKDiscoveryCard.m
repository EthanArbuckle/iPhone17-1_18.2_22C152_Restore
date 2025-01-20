@interface PKDiscoveryCard
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)heading;
- (NSString)headingKey;
- (NSString)inlineDescription;
- (NSString)inlineDescriptionKey;
- (NSString)title;
- (NSString)titleKey;
- (PKColor)backgroundColor;
- (PKDiscoveryCallToAction)callToAction;
- (PKDiscoveryCard)initWithCoder:(id)a3;
- (PKDiscoveryCard)initWithDictionary:(id)a3;
- (PKDiscoveryItem)item;
- (PKDiscoveryMedia)backgroundMedia;
- (id)description;
- (int64_t)foregroundContentMode;
- (int64_t)largeCardTemplateType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)localizeWithBundle:(id)a3;
- (void)localizeWithBundle:(id)a3 table:(id)a4;
- (void)setHeading:(id)a3;
- (void)setItem:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKDiscoveryCard

- (PKDiscoveryCard)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKDiscoveryCard;
  v5 = [(PKDiscoveryCard *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"headingKey"];
    headingKey = v5->_headingKey;
    v5->_headingKey = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"titleKey"];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"inlineDescriptionKey"];
    inlineDescriptionKey = v5->_inlineDescriptionKey;
    v5->_inlineDescriptionKey = (NSString *)v10;

    v12 = [v4 PKDictionaryForKey:@"backgroundMedia"];
    v13 = [[PKDiscoveryMedia alloc] initWithDictionary:v12];
    backgroundMedia = v5->_backgroundMedia;
    v5->_backgroundMedia = v13;

    uint64_t v15 = [v4 PKColorForKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v15;

    v17 = [v4 PKStringForKey:@"foregroundContentMode"];
    v5->_foregroundContentMode = PKDiscoveryCardForegroundContentModeFromString(v17);

    v18 = [v4 PKStringForKey:@"largeCardTemplateType"];
    v5->_largeCardTemplateType = 0;

    v19 = [v4 PKDictionaryForKey:@"callToAction"];
    if (v19)
    {
      v20 = [[PKDiscoveryCallToAction alloc] initWithDictionary:v19];
      callToAction = v5->_callToAction;
      v5->_callToAction = v20;

      [(PKDiscoveryCallToAction *)v5->_callToAction setForegroundContentMode:v5->_foregroundContentMode];
    }
  }
  return v5;
}

- (void)localizeWithBundle:(id)a3
{
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  headingKey = self->_headingKey;
  id v7 = a4;
  id v14 = a3;
  uint64_t v8 = [v14 localizedStringForKey:headingKey value:&stru_1EE0F5368 table:v7];
  heading = self->_heading;
  self->_heading = v8;

  uint64_t v10 = [v14 localizedStringForKey:self->_titleKey value:&stru_1EE0F5368 table:v7];
  title = self->_title;
  self->_title = v10;

  v12 = [v14 localizedStringForKey:self->_inlineDescriptionKey value:&stru_1EE0F5368 table:v7];
  inlineDescription = self->_inlineDescription;
  self->_inlineDescription = v12;

  [(PKDiscoveryCallToAction *)self->_callToAction localizeWithBundle:v14 table:v7];
}

- (void)setItem:(id)a3
{
  p_item = &self->_item;
  id v7 = a3;
  objc_storeWeak((id *)p_item, v7);
  v5 = [v7 identifier];
  itemIdentifier = self->_itemIdentifier;
  self->_itemIdentifier = v5;

  [(PKDiscoveryCallToAction *)self->_callToAction setItem:v7];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_42;
  }
  headingKey = self->_headingKey;
  uint64_t v6 = (NSString *)*((void *)v4 + 2);
  if (headingKey && v6)
  {
    if ((-[NSString isEqual:](headingKey, "isEqual:") & 1) == 0) {
      goto LABEL_42;
    }
  }
  else if (headingKey != v6)
  {
    goto LABEL_42;
  }
  titleKey = self->_titleKey;
  uint64_t v8 = (NSString *)*((void *)v4 + 3);
  if (titleKey && v8)
  {
    if ((-[NSString isEqual:](titleKey, "isEqual:") & 1) == 0) {
      goto LABEL_42;
    }
  }
  else if (titleKey != v8)
  {
    goto LABEL_42;
  }
  inlineDescriptionKey = self->_inlineDescriptionKey;
  uint64_t v10 = (NSString *)*((void *)v4 + 4);
  if (inlineDescriptionKey && v10)
  {
    if ((-[NSString isEqual:](inlineDescriptionKey, "isEqual:") & 1) == 0) {
      goto LABEL_42;
    }
  }
  else if (inlineDescriptionKey != v10)
  {
    goto LABEL_42;
  }
  backgroundMedia = self->_backgroundMedia;
  v12 = (PKDiscoveryMedia *)*((void *)v4 + 5);
  if (backgroundMedia && v12)
  {
    if (!-[PKDiscoveryMedia isEqual:](backgroundMedia, "isEqual:")) {
      goto LABEL_42;
    }
  }
  else if (backgroundMedia != v12)
  {
    goto LABEL_42;
  }
  if (!CGColorEqualToColor(-[PKColor CGColor](self->_backgroundColor, "CGColor"), (CGColorRef)[*((id *)v4 + 6) CGColor]))goto LABEL_42; {
  callToAction = self->_callToAction;
  }
  id v14 = (PKDiscoveryCallToAction *)*((void *)v4 + 7);
  if (callToAction && v14)
  {
    if (!-[PKDiscoveryCallToAction isEqual:](callToAction, "isEqual:")) {
      goto LABEL_42;
    }
  }
  else if (callToAction != v14)
  {
    goto LABEL_42;
  }
  if (self->_foregroundContentMode != *((void *)v4 + 8) || self->_largeCardTemplateType != *((void *)v4 + 9)) {
    goto LABEL_42;
  }
  heading = self->_heading;
  v16 = (NSString *)*((void *)v4 + 10);
  if (heading && v16)
  {
    if ((-[NSString isEqual:](heading, "isEqual:") & 1) == 0) {
      goto LABEL_42;
    }
  }
  else if (heading != v16)
  {
    goto LABEL_42;
  }
  title = self->_title;
  v18 = (NSString *)*((void *)v4 + 11);
  if (!title || !v18)
  {
    if (title == v18) {
      goto LABEL_38;
    }
LABEL_42:
    char v21 = 0;
    goto LABEL_43;
  }
  if ((-[NSString isEqual:](title, "isEqual:") & 1) == 0) {
    goto LABEL_42;
  }
LABEL_38:
  inlineDescription = self->_inlineDescription;
  v20 = (NSString *)*((void *)v4 + 12);
  if (inlineDescription && v20) {
    char v21 = -[NSString isEqual:](inlineDescription, "isEqual:");
  }
  else {
    char v21 = inlineDescription == v20;
  }
LABEL_43:

  return v21;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_headingKey];
  [v3 safelyAddObject:self->_titleKey];
  [v3 safelyAddObject:self->_inlineDescriptionKey];
  [v3 safelyAddObject:self->_backgroundMedia];
  [v3 safelyAddObject:self->_backgroundColor];
  [v3 safelyAddObject:self->_callToAction];
  [v3 safelyAddObject:self->_heading];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_inlineDescription];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_foregroundContentMode - v4 + 32 * v4;
  unint64_t v6 = self->_largeCardTemplateType - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"headingKey", self->_headingKey];
  [v3 appendFormat:@"%@: '%@'; ", @"titleKey", self->_titleKey];
  [v3 appendFormat:@"%@: '%@'; ", @"inlineDescriptionKey", self->_inlineDescriptionKey];
  [v3 appendFormat:@"%@: '%@'; ", @"backgroundMedia", self->_backgroundMedia];
  [v3 appendFormat:@"%@: '%@'; ", @"backgroundColor", self->_backgroundColor];
  [v3 appendFormat:@"%@: '%@'; ", @"callToAction", self->_callToAction];
  [v3 appendFormat:@"%@: '%ld'; ", @"foregroundContentMode", self->_foregroundContentMode];
  [v3 appendFormat:@"%@: '%ld'; ", @"largeCardTemplateType", self->_largeCardTemplateType];
  [v3 appendFormat:@"%@: '%@'; ", @"heading", self->_heading];
  [v3 appendFormat:@"%@: '%@'; ", @"title", self->_title];
  [v3 appendFormat:@"%@: '%@'; ", @"inlineDescription", self->_inlineDescription];
  [v3 appendFormat:@"%@: '%@'; ", @"itemIdentifier", self->_itemIdentifier];
  [v3 appendFormat:@">"];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  headingKey = self->_headingKey;
  id v5 = a3;
  [v5 encodeObject:headingKey forKey:@"headingKey"];
  [v5 encodeObject:self->_titleKey forKey:@"titleKey"];
  [v5 encodeObject:self->_inlineDescriptionKey forKey:@"inlineDescriptionKey"];
  [v5 encodeObject:self->_backgroundMedia forKey:@"backgroundMedia"];
  [v5 encodeObject:self->_backgroundColor forKey:@"backgroundColor"];
  [v5 encodeObject:self->_callToAction forKey:@"callToAction"];
  [v5 encodeInteger:self->_foregroundContentMode forKey:@"foregroundContentMode"];
  [v5 encodeInteger:self->_largeCardTemplateType forKey:@"largeCardTemplateType"];
  [v5 encodeObject:self->_heading forKey:@"heading"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_inlineDescription forKey:@"inlineDescription"];
  [v5 encodeObject:self->_itemIdentifier forKey:@"itemIdentifier"];
}

- (PKDiscoveryCard)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKDiscoveryCard;
  id v5 = [(PKDiscoveryCard *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"headingKey"];
    headingKey = v5->_headingKey;
    v5->_headingKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleKey"];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inlineDescriptionKey"];
    inlineDescriptionKey = v5->_inlineDescriptionKey;
    v5->_inlineDescriptionKey = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundMedia"];
    backgroundMedia = v5->_backgroundMedia;
    v5->_backgroundMedia = (PKDiscoveryMedia *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callToAction"];
    callToAction = v5->_callToAction;
    v5->_callToAction = (PKDiscoveryCallToAction *)v16;

    v5->_foregroundContentMode = [v4 decodeIntegerForKey:@"foregroundContentMode"];
    v5->_largeCardTemplateType = [v4 decodeIntegerForKey:@"largeCardTemplateType"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"heading"];
    heading = v5->_heading;
    v5->_heading = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inlineDescription"];
    inlineDescription = v5->_inlineDescription;
    v5->_inlineDescription = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v24;
  }
  return v5;
}

- (NSString)headingKey
{
  return self->_headingKey;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (NSString)inlineDescriptionKey
{
  return self->_inlineDescriptionKey;
}

- (PKDiscoveryMedia)backgroundMedia
{
  return self->_backgroundMedia;
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (PKDiscoveryCallToAction)callToAction
{
  return self->_callToAction;
}

- (int64_t)foregroundContentMode
{
  return self->_foregroundContentMode;
}

- (int64_t)largeCardTemplateType
{
  return self->_largeCardTemplateType;
}

- (NSString)heading
{
  return self->_heading;
}

- (void)setHeading:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)inlineDescription
{
  return self->_inlineDescription;
}

- (PKDiscoveryItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (PKDiscoveryItem *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_inlineDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_callToAction, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundMedia, 0);
  objc_storeStrong((id *)&self->_inlineDescriptionKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_headingKey, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end