@interface PKFeatureApplicationOfferDetailsInfo
+ (BOOL)supportsSecureCoding;
- (NSString)body;
- (NSString)disclosureTitle;
- (NSString)heroImageURL;
- (NSString)primaryActionIdentifier;
- (NSString)primaryActionTitle;
- (NSString)secondaryActionIdentifier;
- (NSString)secondaryActionTitle;
- (NSString)title;
- (PKFeatureApplicationOfferDetailsInfo)initWithCoder:(id)a3;
- (PKFeatureApplicationOfferDetailsInfo)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)layout;
- (void)encodeWithCoder:(id)a3;
- (void)setBody:(id)a3;
- (void)setDisclosureTitle:(id)a3;
- (void)setHeroImageURL:(id)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setPrimaryActionIdentifier:(id)a3;
- (void)setPrimaryActionTitle:(id)a3;
- (void)setSecondaryActionIdentifier:(id)a3;
- (void)setSecondaryActionTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKFeatureApplicationOfferDetailsInfo

- (PKFeatureApplicationOfferDetailsInfo)initWithDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKFeatureApplicationOfferDetailsInfo;
  v5 = [(PKFeatureApplicationOfferDetailsInfo *)&v35 init];
  if (!v5) {
    goto LABEL_20;
  }
  uint64_t v6 = [v4 PKStringForKey:@"title"];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  uint64_t v8 = [v4 PKStringForKey:@"body"];
  body = v5->_body;
  v5->_body = (NSString *)v8;

  uint64_t v10 = [v4 PKStringForKey:@"primaryActionTitle"];
  primaryActionTitle = v5->_primaryActionTitle;
  v5->_primaryActionTitle = (NSString *)v10;

  uint64_t v12 = [v4 PKStringForKey:@"primaryActionIdentifier"];
  primaryActionIdentifier = v5->_primaryActionIdentifier;
  v5->_primaryActionIdentifier = (NSString *)v12;

  uint64_t v14 = [v4 PKStringForKey:@"secondaryActionTitle"];
  secondaryActionTitle = v5->_secondaryActionTitle;
  v5->_secondaryActionTitle = (NSString *)v14;

  uint64_t v16 = [v4 PKStringForKey:@"secondaryActionIdentifier"];
  secondaryActionIdentifier = v5->_secondaryActionIdentifier;
  v5->_secondaryActionIdentifier = (NSString *)v16;

  uint64_t v18 = [v4 PKStringForKey:@"disclosureTitle"];
  disclosureTitle = v5->_disclosureTitle;
  v5->_disclosureTitle = (NSString *)v18;

  v20 = [v4 PKStringForKey:@"layout"];
  v21 = v20;
  if (v20 == @"table") {
    goto LABEL_5;
  }
  if (!v20)
  {
LABEL_9:
    uint64_t v23 = 0;
    goto LABEL_10;
  }
  char v22 = [@"table" isEqualToString:v20];

  if ((v22 & 1) == 0)
  {
    v24 = v21;
    if (v24 == @"text"
      || (v25 = v24, int v26 = [@"text" isEqualToString:v24], v25, v26))
    {
      uint64_t v23 = 2;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v23 = 1;
LABEL_10:

  v5->_layout = v23;
  v27 = [v4 PKDictionaryForKey:@"heroImage"];
  if (v27)
  {
    double v28 = PKScreenScale();
    v29 = @"2x";
    if (v28 > 2.0) {
      v29 = @"3x";
    }
    v30 = v29;
    uint64_t v31 = [v27 PKStringForKey:v30];
    heroImageURL = v5->_heroImageURL;
    v5->_heroImageURL = (NSString *)v31;

    if (!v5->_heroImageURL)
    {
      v33 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v30;
        _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, "No valid imageURL found for scale: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v30 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "No imageURLs specified", buf, 2u);
    }
  }

LABEL_20:
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplicationOfferDetailsInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKFeatureApplicationOfferDetailsInfo;
  v5 = [(PKFeatureApplicationOfferDetailsInfo *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    body = v5->_body;
    v5->_body = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryActionTitle"];
    primaryActionTitle = v5->_primaryActionTitle;
    v5->_primaryActionTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryActionIdentifier"];
    primaryActionIdentifier = v5->_primaryActionIdentifier;
    v5->_primaryActionIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryActionTitle"];
    secondaryActionTitle = v5->_secondaryActionTitle;
    v5->_secondaryActionTitle = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryActionIdentifier"];
    secondaryActionIdentifier = v5->_secondaryActionIdentifier;
    v5->_secondaryActionIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disclosureTitle"];
    disclosureTitle = v5->_disclosureTitle;
    v5->_disclosureTitle = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"heroImageURL"];
    heroImageURL = v5->_heroImageURL;
    v5->_heroImageURL = (NSString *)v20;

    v5->_layout = [v4 decodeIntegerForKey:@"layout"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_body forKey:@"body"];
  [v5 encodeObject:self->_primaryActionTitle forKey:@"primaryActionTitle"];
  [v5 encodeObject:self->_primaryActionIdentifier forKey:@"primaryActionIdentifier"];
  [v5 encodeObject:self->_secondaryActionTitle forKey:@"secondaryActionTitle"];
  [v5 encodeObject:self->_secondaryActionIdentifier forKey:@"secondaryActionIdentifier"];
  [v5 encodeObject:self->_disclosureTitle forKey:@"disclosureTitle"];
  [v5 encodeObject:self->_heroImageURL forKey:@"heroImageURL"];
  [v5 encodeInteger:self->_layout forKey:@"layout"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"title: '%@'; ", self->_title];
  [v3 appendFormat:@"body: '%@'; ", self->_body];
  [v3 appendFormat:@"primaryActionIdentifier: '%@'; ", self->_primaryActionIdentifier];
  [v3 appendFormat:@"primaryActionTitle: '%@'; ", self->_primaryActionTitle];
  [v3 appendFormat:@"secondaryActionTitle: '%@'; ", self->_secondaryActionTitle];
  [v3 appendFormat:@"secondaryActionIdentifier: '%@'; ", self->_secondaryActionIdentifier];
  [v3 appendFormat:@"disclosureTitle: '%@'; ", self->_disclosureTitle];
  [v3 appendFormat:@"heroImageURL: '%@'; ", self->_heroImageURL];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_layout];
  [v3 appendFormat:@"layout: '%@'; ", v4];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKFeatureApplicationOfferDetailsInfo allocWithZone:](PKFeatureApplicationOfferDetailsInfo, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_body copyWithZone:a3];
  body = v5->_body;
  v5->_body = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_primaryActionTitle copyWithZone:a3];
  primaryActionTitle = v5->_primaryActionTitle;
  v5->_primaryActionTitle = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_primaryActionIdentifier copyWithZone:a3];
  primaryActionIdentifier = v5->_primaryActionIdentifier;
  v5->_primaryActionIdentifier = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_secondaryActionTitle copyWithZone:a3];
  secondaryActionTitle = v5->_secondaryActionTitle;
  v5->_secondaryActionTitle = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_secondaryActionIdentifier copyWithZone:a3];
  secondaryActionIdentifier = v5->_secondaryActionIdentifier;
  v5->_secondaryActionIdentifier = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_disclosureTitle copyWithZone:a3];
  disclosureTitle = v5->_disclosureTitle;
  v5->_disclosureTitle = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_heroImageURL copyWithZone:a3];
  heroImageURL = v5->_heroImageURL;
  v5->_heroImageURL = (NSString *)v20;

  v5->_layout = self->_layout;
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (void)setPrimaryActionTitle:(id)a3
{
}

- (NSString)primaryActionIdentifier
{
  return self->_primaryActionIdentifier;
}

- (void)setPrimaryActionIdentifier:(id)a3
{
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (void)setSecondaryActionTitle:(id)a3
{
}

- (NSString)secondaryActionIdentifier
{
  return self->_secondaryActionIdentifier;
}

- (void)setSecondaryActionIdentifier:(id)a3
{
}

- (NSString)disclosureTitle
{
  return self->_disclosureTitle;
}

- (void)setDisclosureTitle:(id)a3
{
}

- (NSString)heroImageURL
{
  return self->_heroImageURL;
}

- (void)setHeroImageURL:(id)a3
{
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImageURL, 0);
  objc_storeStrong((id *)&self->_disclosureTitle, 0);
  objc_storeStrong((id *)&self->_secondaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end