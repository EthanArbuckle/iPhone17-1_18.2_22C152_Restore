@interface PKPaymentOfferDynamicContentPage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)bodyLinks;
- (NSString)body;
- (NSString)primaryActionTitle;
- (NSString)secondaryActionTitle;
- (NSString)subtitle;
- (NSString)title;
- (PKApplyFooterContent)altFooterContent;
- (PKApplyFooterContent)footerContent;
- (PKPaymentOfferDynamicContentCustomLayout)customLayout;
- (PKPaymentOfferDynamicContentIcon)iconURL;
- (PKPaymentOfferDynamicContentPage)initWithCoder:(id)a3;
- (PKPaymentOfferDynamicContentPage)initWithDictionary:(id)a3 pageType:(unint64_t)a4;
- (PKSystemIconConfiguration)systemIcon;
- (id)bodyLinkContent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)pageType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferDynamicContentPage

- (PKPaymentOfferDynamicContentPage)initWithDictionary:(id)a3 pageType:(unint64_t)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 PKStringForKey:@"title"];
  v7 = [v5 PKStringForKey:@"subtitle"];
  v8 = [v5 PKStringForKey:@"body"];
  v9 = [v5 PKArrayContaining:objc_opt_class() forKey:@"bodyLinks"];
  v10 = [v5 PKStringForKey:@"primaryActionTitle"];
  v11 = [v5 PKStringForKey:@"secondaryActionTitle"];
  v12 = [v5 PKDictionaryForKey:@"iconURL"];
  v45 = [v5 PKDictionaryForKey:@"systemIcon"];
  v47 = [v5 PKDictionaryForKey:@"footerContent"];
  v46 = [v5 PKDictionaryForKey:@"altFooterContent"];
  uint64_t v13 = [v5 PKArrayContaining:objc_opt_class() forKey:@"customLayout"];
  v44 = (void *)v13;
  if (v6
    || v7
    || v8
    || v10
    || v11
    || (v14 = (void *)v13, [v12 count])
    || [v12 count]
    || [v47 count]
    || [v46 count]
    || [v14 count]
    || [v9 count]
    || [v45 count])
  {
    v52.receiver = self;
    v52.super_class = (Class)PKPaymentOfferDynamicContentPage;
    v15 = [(PKPaymentOfferDynamicContentPage *)&v52 init];
    v16 = v15;
    if (v15)
    {
      v43 = v9;
      v15->_pageType = a4;
      objc_storeStrong((id *)&v15->_title, v6);
      objc_storeStrong((id *)&v16->_subtitle, v7);
      objc_storeStrong((id *)&v16->_body, v8);
      objc_storeStrong((id *)&v16->_primaryActionTitle, v10);
      objc_storeStrong((id *)&v16->_secondaryActionTitle, v11);
      if ([v12 count])
      {
        v17 = [[PKPaymentOfferDynamicContentIcon alloc] initWithDictionary:v12];
        iconURL = v16->_iconURL;
        v16->_iconURL = v17;
      }
      if ([v45 count])
      {
        v19 = [[PKSystemIconConfiguration alloc] initWithDictionary:v45];
        systemIcon = v16->_systemIcon;
        v16->_systemIcon = v19;
      }
      if ([v47 count])
      {
        v21 = [[PKApplyFooterContent alloc] initWithDictionary:v47];
        footerContent = v16->_footerContent;
        v16->_footerContent = v21;
      }
      if ([v46 count])
      {
        v23 = [[PKApplyFooterContent alloc] initWithDictionary:v46];
        altFooterContent = v16->_altFooterContent;
        v16->_altFooterContent = v23;
      }
      if ([v44 count])
      {
        v25 = [[PKPaymentOfferDynamicContentCustomLayout alloc] initWithArray:v44];
        customLayout = v16->_customLayout;
        v16->_customLayout = v25;
      }
      if ([v9 count])
      {
        v38 = v11;
        v39 = v10;
        v40 = v8;
        v42 = v6;
        id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v28 = v9;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v49 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = [[PKApplyFooterContentLink alloc] initWithDictionary:*(void *)(*((void *)&v48 + 1) + 8 * i)];
              [v27 safelyAddObject:v33];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v53 count:16];
          }
          while (v30);
        }

        if ([v27 count])
        {
          uint64_t v34 = [v27 copy];
          bodyLinks = v16->_bodyLinks;
          v16->_bodyLinks = (NSArray *)v34;
        }
        else
        {
          bodyLinks = v16->_bodyLinks;
          v16->_bodyLinks = 0;
        }
        v6 = v42;
        v10 = v39;
        v8 = v40;
        v11 = v38;

        v9 = v43;
      }
    }
    self = v16;
    v36 = self;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  unint64_t v5 = self->_pageType - 1;
  if (v5 > 0xA) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E56F14E0[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"pageType"];
  [v4 setObject:self->_title forKeyedSubscript:@"title"];
  [v4 setObject:self->_subtitle forKeyedSubscript:@"subtitle"];
  [v4 setObject:self->_body forKeyedSubscript:@"body"];
  [v4 setObject:self->_primaryActionTitle forKeyedSubscript:@"primaryActionTitle"];
  [v4 setObject:self->_secondaryActionTitle forKeyedSubscript:@"secondaryActionTitle"];
  v7 = [(PKPaymentOfferDynamicContentIcon *)self->_iconURL dictionaryRepresentation];
  [v4 setObject:v7 forKeyedSubscript:@"iconURL"];

  v8 = [(PKSystemIconConfiguration *)self->_systemIcon dictionaryRepresentation];
  [v4 setObject:v8 forKeyedSubscript:@"systemIcon"];

  v9 = [(PKApplyFooterContent *)self->_footerContent dictionaryRepresentation];
  [v4 setObject:v9 forKeyedSubscript:@"footerContent"];

  v10 = [(PKApplyFooterContent *)self->_altFooterContent dictionaryRepresentation];
  [v4 setObject:v10 forKeyedSubscript:@"altFooterContent"];

  v11 = [(PKPaymentOfferDynamicContentCustomLayout *)self->_customLayout dictionaryRepresentation];
  [v4 setObject:v11 forKeyedSubscript:@"customLayout"];

  id v12 = [(NSArray *)self->_bodyLinks pk_createArrayBySafelyApplyingBlock:&__block_literal_global_185];
  [v4 setObject:v12 forKeyedSubscript:@"bodyLinks"];

  uint64_t v13 = (void *)[v4 copy];
  return v13;
}

uint64_t __60__PKPaymentOfferDynamicContentPage_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)bodyLinkContent
{
  if (self->_body)
  {
    id v3 = objc_alloc_init(PKApplyFooterContent);
    [(PKApplyFooterContent *)v3 setFooterText:self->_body];
    [(PKApplyFooterContent *)v3 setLinks:self->_bodyLinks];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPaymentOfferDynamicContentPage *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        title = v6->_title;
        v8 = self->_title;
        v9 = title;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_35;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_36;
          }
        }
        subtitle = v6->_subtitle;
        v8 = self->_subtitle;
        v14 = subtitle;
        if (v8 == v14)
        {
        }
        else
        {
          v10 = v14;
          if (!v8 || !v14) {
            goto LABEL_35;
          }
          BOOL v15 = [(NSString *)v8 isEqualToString:v14];

          if (!v15) {
            goto LABEL_36;
          }
        }
        body = v6->_body;
        v8 = self->_body;
        v17 = body;
        if (v8 == v17)
        {
        }
        else
        {
          v10 = v17;
          if (!v8 || !v17) {
            goto LABEL_35;
          }
          BOOL v18 = [(NSString *)v8 isEqualToString:v17];

          if (!v18) {
            goto LABEL_36;
          }
        }
        primaryActionTitle = v6->_primaryActionTitle;
        v8 = self->_primaryActionTitle;
        v20 = primaryActionTitle;
        if (v8 == v20)
        {
        }
        else
        {
          v10 = v20;
          if (!v8 || !v20) {
            goto LABEL_35;
          }
          BOOL v21 = [(NSString *)v8 isEqualToString:v20];

          if (!v21) {
            goto LABEL_36;
          }
        }
        secondaryActionTitle = v6->_secondaryActionTitle;
        v8 = self->_secondaryActionTitle;
        v23 = secondaryActionTitle;
        if (v8 == v23)
        {

LABEL_40:
          iconURL = self->_iconURL;
          id v27 = v6->_iconURL;
          if (iconURL && v27)
          {
            if (!-[PKPaymentOfferDynamicContentIcon isEqual:](iconURL, "isEqual:")) {
              goto LABEL_36;
            }
          }
          else if (iconURL != v27)
          {
            goto LABEL_36;
          }
          systemIcon = self->_systemIcon;
          uint64_t v29 = v6->_systemIcon;
          if (systemIcon && v29)
          {
            if (!-[PKSystemIconConfiguration isEqual:](systemIcon, "isEqual:")) {
              goto LABEL_36;
            }
          }
          else if (systemIcon != v29)
          {
            goto LABEL_36;
          }
          footerContent = self->_footerContent;
          uint64_t v31 = v6->_footerContent;
          if (footerContent && v31)
          {
            if (!-[PKApplyFooterContent isEqual:](footerContent, "isEqual:")) {
              goto LABEL_36;
            }
          }
          else if (footerContent != v31)
          {
            goto LABEL_36;
          }
          altFooterContent = self->_altFooterContent;
          v33 = v6->_altFooterContent;
          if (altFooterContent && v33)
          {
            if (!-[PKApplyFooterContent isEqual:](altFooterContent, "isEqual:")) {
              goto LABEL_36;
            }
          }
          else if (altFooterContent != v33)
          {
            goto LABEL_36;
          }
          customLayout = self->_customLayout;
          v35 = v6->_customLayout;
          if (customLayout && v35)
          {
            if (!-[PKPaymentOfferDynamicContentCustomLayout isEqual:](customLayout, "isEqual:")) {
              goto LABEL_36;
            }
          }
          else if (customLayout != v35)
          {
            goto LABEL_36;
          }
          bodyLinks = self->_bodyLinks;
          v37 = v6->_bodyLinks;
          if (bodyLinks && v37)
          {
            if (-[NSArray isEqual:](bodyLinks, "isEqual:")) {
              goto LABEL_70;
            }
          }
          else if (bodyLinks == v37)
          {
LABEL_70:
            BOOL v12 = self->_pageType == v6->_pageType;
            goto LABEL_37;
          }
LABEL_36:
          BOOL v12 = 0;
LABEL_37:

          goto LABEL_38;
        }
        v10 = v23;
        if (v8 && v23)
        {
          BOOL v24 = [(NSString *)v8 isEqualToString:v23];

          if (!v24) {
            goto LABEL_36;
          }
          goto LABEL_40;
        }
LABEL_35:

        goto LABEL_36;
      }
    }
    BOOL v12 = 0;
  }
LABEL_38:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_subtitle];
  [v3 safelyAddObject:self->_body];
  [v3 safelyAddObject:self->_primaryActionTitle];
  [v3 safelyAddObject:self->_secondaryActionTitle];
  [v3 safelyAddObject:self->_iconURL];
  [v3 safelyAddObject:self->_systemIcon];
  [v3 safelyAddObject:self->_footerContent];
  [v3 safelyAddObject:self->_altFooterContent];
  [v3 safelyAddObject:self->_customLayout];
  [v3 safelyAddObject:self->_bodyLinks];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_pageType - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = self->_pageType - 1;
  if (v4 > 0xA) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56F14E0[v4];
  }
  [v3 appendFormat:@"pageType: '%@'; ", v5];
  [v3 appendFormat:@"title: '%@'; ", self->_title];
  [v3 appendFormat:@"subtitle: '%@'; ", self->_subtitle];
  [v3 appendFormat:@"body: '%@'; ", self->_body];
  [v3 appendFormat:@"primaryActionTitle: '%@'; ", self->_primaryActionTitle];
  [v3 appendFormat:@"secondaryActionTitle: '%@'; ", self->_secondaryActionTitle];
  [v3 appendFormat:@"iconURL: '%@'; ", self->_iconURL];
  [v3 appendFormat:@"systemIcon: '%@'; ", self->_systemIcon];
  [v3 appendFormat:@"footerContent: '%@'; ", self->_footerContent];
  [v3 appendFormat:@"altFooterContent: '%@'; ", self->_altFooterContent];
  [v3 appendFormat:@"customLayout: '%@'; ", self->_customLayout];
  if ([(NSArray *)self->_bodyLinks count]) {
    [v3 appendFormat:@"bodyLinks: '%@'; ", self->_bodyLinks];
  }
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentPage)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKPaymentOfferDynamicContentPage;
  unint64_t v5 = [(PKPaymentOfferDynamicContentPage *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    body = v5->_body;
    v5->_body = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryActionTitle"];
    primaryActionTitle = v5->_primaryActionTitle;
    v5->_primaryActionTitle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryActionTitle"];
    secondaryActionTitle = v5->_secondaryActionTitle;
    v5->_secondaryActionTitle = (NSString *)v14;

    v5->_pageType = [v4 decodeIntegerForKey:@"pageType"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footerContent"];
    footerContent = v5->_footerContent;
    v5->_footerContent = (PKApplyFooterContent *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altFooterContent"];
    altFooterContent = v5->_altFooterContent;
    v5->_altFooterContent = (PKApplyFooterContent *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customLayout"];
    customLayout = v5->_customLayout;
    v5->_customLayout = (PKPaymentOfferDynamicContentCustomLayout *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconURL"];
    iconURL = v5->_iconURL;
    v5->_iconURL = (PKPaymentOfferDynamicContentIcon *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemIcon"];
    systemIcon = v5->_systemIcon;
    v5->_systemIcon = (PKSystemIconConfiguration *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    id v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"bodyLinks"];
    bodyLinks = v5->_bodyLinks;
    v5->_bodyLinks = (NSArray *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_body forKey:@"body"];
  [v5 encodeObject:self->_primaryActionTitle forKey:@"primaryActionTitle"];
  [v5 encodeObject:self->_secondaryActionTitle forKey:@"secondaryActionTitle"];
  [v5 encodeInteger:self->_pageType forKey:@"pageType"];
  [v5 encodeObject:self->_footerContent forKey:@"footerContent"];
  [v5 encodeObject:self->_altFooterContent forKey:@"altFooterContent"];
  [v5 encodeObject:self->_customLayout forKey:@"customLayout"];
  [v5 encodeObject:self->_iconURL forKey:@"iconURL"];
  [v5 encodeObject:self->_systemIcon forKey:@"systemIcon"];
  [v5 encodeObject:self->_bodyLinks forKey:@"bodyLinks"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferDynamicContentPage allocWithZone:](PKPaymentOfferDynamicContentPage, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_subtitle copyWithZone:a3];
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_body copyWithZone:a3];
  body = v5->_body;
  v5->_body = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_primaryActionTitle copyWithZone:a3];
  primaryActionTitle = v5->_primaryActionTitle;
  v5->_primaryActionTitle = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_secondaryActionTitle copyWithZone:a3];
  secondaryActionTitle = v5->_secondaryActionTitle;
  v5->_secondaryActionTitle = (NSString *)v14;

  uint64_t v16 = [(PKApplyFooterContent *)self->_footerContent copyWithZone:a3];
  footerContent = v5->_footerContent;
  v5->_footerContent = v16;

  uint64_t v18 = [(PKApplyFooterContent *)self->_altFooterContent copyWithZone:a3];
  altFooterContent = v5->_altFooterContent;
  v5->_altFooterContent = v18;

  uint64_t v20 = [(PKPaymentOfferDynamicContentCustomLayout *)self->_customLayout copyWithZone:a3];
  customLayout = v5->_customLayout;
  v5->_customLayout = v20;

  uint64_t v22 = [(PKPaymentOfferDynamicContentIcon *)self->_iconURL copyWithZone:a3];
  iconURL = v5->_iconURL;
  v5->_iconURL = v22;

  uint64_t v24 = [(PKSystemIconConfiguration *)self->_systemIcon copyWithZone:a3];
  systemIcon = v5->_systemIcon;
  v5->_systemIcon = v24;

  uint64_t v26 = [(NSArray *)self->_bodyLinks copyWithZone:a3];
  bodyLinks = v5->_bodyLinks;
  v5->_bodyLinks = (NSArray *)v26;

  v5->_pageType = self->_pageType;
  return v5;
}

- (unint64_t)pageType
{
  return self->_pageType;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)body
{
  return self->_body;
}

- (NSArray)bodyLinks
{
  return self->_bodyLinks;
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (PKPaymentOfferDynamicContentIcon)iconURL
{
  return self->_iconURL;
}

- (PKSystemIconConfiguration)systemIcon
{
  return self->_systemIcon;
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (PKApplyFooterContent)altFooterContent
{
  return self->_altFooterContent;
}

- (PKPaymentOfferDynamicContentCustomLayout)customLayout
{
  return self->_customLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLayout, 0);
  objc_storeStrong((id *)&self->_altFooterContent, 0);
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_systemIcon, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_bodyLinks, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end