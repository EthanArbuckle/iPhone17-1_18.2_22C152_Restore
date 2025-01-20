@interface PKPassAuxiliaryPassInformationItem
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)fields;
- (NSArray)sections;
- (NSString)detailFooterLeadingText;
- (NSString)detailFooterLeadingTitle;
- (NSString)detailFooterTrailingText;
- (NSString)detailFooterTrailingTitle;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)subtitle2;
- (NSString)title;
- (NSURL)mapsURL;
- (PKMerchant)merchant;
- (PKPassAuxiliaryPassInformationItem)initWithCoder:(id)a3;
- (PKPassAuxiliaryPassInformationItem)initWithItemInformation:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)merchantCategory;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDetailFooterLeadingText:(id)a3;
- (void)setDetailFooterLeadingTitle:(id)a3;
- (void)setDetailFooterTrailingText:(id)a3;
- (void)setDetailFooterTrailingTitle:(id)a3;
- (void)setFields:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMapsURL:(id)a3;
- (void)setMerchant:(id)a3;
- (void)setMerchantCategory:(int64_t)a3;
- (void)setSections:(id)a3;
- (void)setSubtitle2:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPassAuxiliaryPassInformationItem

- (PKPassAuxiliaryPassInformationItem)initWithItemInformation:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v99.receiver = self;
  v99.super_class = (Class)PKPassAuxiliaryPassInformationItem;
  v13 = [(PKPassAuxiliaryPassInformationItem *)&v99 init];
  if (v13)
  {
    uint64_t v14 = [v10 PKStringForKey:@"identifier"];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = [v10 PKStringForKey:@"title"];
    uint64_t v17 = PKLocalizedPassStringForPassBundle(v16, v11, v12);
    title = v13->_title;
    v13->_title = (NSString *)v17;

    v19 = [v10 PKStringForKey:@"subtitle"];
    uint64_t v20 = PKLocalizedPassStringForPassBundle(v19, v11, v12);
    subtitle = v13->_subtitle;
    v13->_subtitle = (NSString *)v20;

    v22 = [v10 PKStringForKey:@"subtitle2"];
    uint64_t v23 = PKLocalizedPassStringForPassBundle(v22, v11, v12);
    subtitle2 = v13->_subtitle2;
    v13->_subtitle2 = (NSString *)v23;

    uint64_t v25 = [v10 PKURLForKey:@"mapsURL"];
    mapsURL = v13->_mapsURL;
    v13->_mapsURL = (NSURL *)v25;

    v27 = [v10 PKStringForKey:@"locationCategory"];
    v28 = v27;
    if (v27) {
      v13->_merchantCategory = PKMerchantCategoryFromString(v27);
    }
    v81 = v28;
    v85 = v13;
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v82 = v10;
    v30 = [v10 objectForKey:@"fields"];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v95 objects:v102 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v96 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = _FieldForTypeWithDictionaryAndBundle(3, *(void **)(*((void *)&v95 + 1) + 8 * i), v11, v12, 0, 0, a6);
          [v86 safelyAddObject:v35];
          v36 = [v35 key];
          objc_msgSend(v29, "pk_safelyAddObject:", v36);
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v95 objects:v102 count:16];
      }
      while (v32);
    }

    v37 = (void *)[v29 copy];
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v39 = [v82 objectForKey:@"sections"];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v91 objects:v101 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v92;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v92 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = [[PKPassDetailSection alloc] initWithDictionary:*(void *)(*((void *)&v91 + 1) + 8 * j) allowedRows:v37 bundle:v11 privateBundle:v12];
          [v38 safelyAddObject:v44];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v91 objects:v101 count:16];
      }
      while (v41);
    }

    id v10 = v82;
    v45 = [v82 objectForKey:@"footerConfiguration"];
    v46 = [v45 PKStringForKey:@"leadingTitle"];
    uint64_t v47 = PKLocalizedPassStringForPassBundle(v46, v11, v12);
    v13 = v85;
    detailFooterLeadingTitle = v85->_detailFooterLeadingTitle;
    v85->_detailFooterLeadingTitle = (NSString *)v47;

    v49 = [v45 PKStringForKey:@"leadingDetailText"];
    uint64_t v50 = PKLocalizedPassStringForPassBundle(v49, v11, v12);
    detailFooterLeadingText = v85->_detailFooterLeadingText;
    v85->_detailFooterLeadingText = (NSString *)v50;

    v52 = [v45 PKStringForKey:@"trailingTitle"];
    uint64_t v53 = PKLocalizedPassStringForPassBundle(v52, v11, v12);
    detailFooterTrailingTitle = v85->_detailFooterTrailingTitle;
    v85->_detailFooterTrailingTitle = (NSString *)v53;

    v55 = [v45 PKStringForKey:@"trailingDetailText"];
    uint64_t v56 = PKLocalizedPassStringForPassBundle(v55, v11, v12);
    detailFooterTrailingText = v85->_detailFooterTrailingText;
    v85->_detailFooterTrailingText = (NSString *)v56;

    if (!v85->_subtitle)
    {
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      obuint64_t j = v86;
      uint64_t v58 = [obj countByEnumeratingWithState:&v87 objects:v100 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v88;
        do
        {
          for (uint64_t k = 0; k != v59; ++k)
          {
            if (*(void *)v88 != v60) {
              objc_enumerationMutation(obj);
            }
            v62 = *(void **)(*((void *)&v87 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v63 = [v62 value];
              v64 = v85->_subtitle;
              v85->_subtitle = (NSString *)v63;

              if (!v85->_detailFooterLeadingText)
              {
                if (v85->_detailFooterTrailingText) {
                  goto LABEL_42;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v83 = v62;
                  uint64_t v67 = [v83 displayableStartDate];
                  v68 = v85->_detailFooterLeadingText;
                  v85->_detailFooterLeadingText = (NSString *)v67;

                  uint64_t v69 = [v83 displayableEndDate];
                  v70 = v85->_detailFooterTrailingText;
                  v85->_detailFooterTrailingText = (NSString *)v69;
                }
                if (!v85->_detailFooterLeadingText)
                {
LABEL_42:
                  if (!v85->_detailFooterTrailingTitle)
                  {
                    uint64_t v65 = [v62 value];
                    v66 = v85->_detailFooterLeadingText;
                    v85->_detailFooterLeadingText = (NSString *)v65;
                  }
                }
              }
            }
          }
          uint64_t v59 = [obj countByEnumeratingWithState:&v87 objects:v100 count:16];
        }
        while (v59);
      }

      v13 = v85;
      id v10 = v82;
    }
    if (!v13->_subtitle2)
    {
      merchant = v13->_merchant;
      if (merchant)
      {
        v72 = [(PKMerchant *)merchant mapsMerchant];
        v73 = [v72 postalAddress];
        uint64_t v74 = PKMerchantFormattedLocationForPostalAddress(v73);
        v75 = v13->_subtitle2;
        v13->_subtitle2 = (NSString *)v74;
      }
    }
    uint64_t v76 = [v86 copy];
    fields = v13->_fields;
    v13->_fields = (NSArray *)v76;

    uint64_t v78 = [v38 copy];
    sections = v13->_sections;
    v13->_sections = (NSArray *)v78;
  }
  return v13;
}

- (void)setMerchant:(id)a3
{
  id v10 = a3;
  p_merchant = &self->_merchant;
  objc_storeStrong((id *)&self->_merchant, a3);
  if (!self->_subtitle2 && *p_merchant)
  {
    v6 = [(PKMerchant *)*p_merchant mapsMerchant];
    v7 = [v6 postalAddress];
    PKMerchantFormattedLocationForPostalAddress(v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitle2 = self->_subtitle2;
    self->_subtitle2 = v8;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_title hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_subtitle hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_subtitle2 hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_detailFooterLeadingTitle hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_detailFooterLeadingText hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_detailFooterTrailingTitle hash] - v8 + 32 * v8;
  NSUInteger v10 = [(NSString *)self->_detailFooterTrailingText hash] - v9 + 32 * v9;
  uint64_t v11 = [(NSURL *)self->_mapsURL hash];
  return self->_merchantCategory - (v11 - v10 + 32 * v10) + 32 * (v11 - v10 + 32 * v10) + 0x31809BE32FDED1;
}

- (PKPassAuxiliaryPassInformationItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKPassAuxiliaryPassInformationItem;
  NSUInteger v5 = [(PKPassAuxiliaryPassInformationItem *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle2"];
    subtitle2 = v5->_subtitle2;
    v5->_subtitle2 = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leadingTitle"];
    detailFooterLeadingTitle = v5->_detailFooterLeadingTitle;
    v5->_detailFooterLeadingTitle = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leadingDetailText"];
    detailFooterLeadingText = v5->_detailFooterLeadingText;
    v5->_detailFooterLeadingText = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trailingTitle"];
    detailFooterTrailingTitle = v5->_detailFooterTrailingTitle;
    v5->_detailFooterTrailingTitle = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trailingDetailText"];
    detailFooterTrailingText = v5->_detailFooterTrailingText;
    v5->_detailFooterTrailingText = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapsURL"];
    mapsURL = v5->_mapsURL;
    v5->_mapsURL = (NSURL *)v22;

    v5->_merchantCategory = [v4 decodeIntegerForKey:@"locationCategory"];
    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"sections"];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v27;

    id v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"fields"];
    fields = v5->_fields;
    v5->_fields = (NSArray *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeObject:self->_subtitle2 forKey:@"subtitle2"];
  [v5 encodeObject:self->_detailFooterLeadingTitle forKey:@"leadingTitle"];
  [v5 encodeObject:self->_detailFooterLeadingText forKey:@"leadingDetailText"];
  [v5 encodeObject:self->_detailFooterTrailingTitle forKey:@"trailingTitle"];
  [v5 encodeObject:self->_detailFooterTrailingText forKey:@"trailingDetailText"];
  [v5 encodeObject:self->_mapsURL forKey:@"mapsURL"];
  [v5 encodeInteger:self->_merchantCategory forKey:@"locationCategory"];
  [v5 encodeObject:self->_sections forKey:@"sections"];
  [v5 encodeObject:self->_fields forKey:@"fields"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPassAuxiliaryPassInformationItem allocWithZone:](PKPassAuxiliaryPassInformationItem, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_subtitle copyWithZone:a3];
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_subtitle2 copyWithZone:a3];
  subtitle2 = v5->_subtitle2;
  v5->_subtitle2 = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_detailFooterLeadingTitle copyWithZone:a3];
  detailFooterLeadingTitle = v5->_detailFooterLeadingTitle;
  v5->_detailFooterLeadingTitle = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_detailFooterLeadingText copyWithZone:a3];
  detailFooterLeadingText = v5->_detailFooterLeadingText;
  v5->_detailFooterLeadingText = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_detailFooterTrailingTitle copyWithZone:a3];
  detailFooterTrailingTitle = v5->_detailFooterTrailingTitle;
  v5->_detailFooterTrailingTitle = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_detailFooterTrailingText copyWithZone:a3];
  detailFooterTrailingText = v5->_detailFooterTrailingText;
  v5->_detailFooterTrailingText = (NSString *)v20;

  uint64_t v22 = [(NSURL *)self->_mapsURL copyWithZone:a3];
  mapsURL = v5->_mapsURL;
  v5->_mapsURL = (NSURL *)v22;

  v5->_merchantCategory = self->_merchantCategory;
  uint64_t v24 = [(NSArray *)self->_sections copyWithZone:a3];
  sections = v5->_sections;
  v5->_sections = (NSArray *)v24;

  uint64_t v26 = [(NSArray *)self->_fields copyWithZone:a3];
  fields = v5->_fields;
  v5->_fields = (NSArray *)v26;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  NSUInteger v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"title: '%@'; ", self->_title];
  [v3 appendFormat:@"_subtitle: '%@'; ", self->_subtitle];
  [v3 appendFormat:@"_subtitle2: '%@'; ", self->_subtitle2];
  [v3 appendFormat:@"_mapsURL: '%@'; ", self->_mapsURL];
  objc_msgSend(v3, "appendFormat:", @"_merchantCategory: '%ld'; ", self->_merchantCategory);
  [v3 appendFormat:@"_sections: '%@'; ", self->_sections];
  [v3 appendFormat:@"_fields: '%@'; ", self->_fields];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassAuxiliaryPassInformationItem *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassAuxiliaryPassInformationItem *)self _isEqualToItem:v5];

  return v6;
}

- (BOOL)_isEqualToItem:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[1];
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_29;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_29;
  }
  title = self->_title;
  NSUInteger v9 = (NSString *)v4[2];
  if (title && v9)
  {
    if ((-[NSString isEqual:](title, "isEqual:") & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (title != v9)
  {
    goto LABEL_29;
  }
  subtitle = self->_subtitle;
  uint64_t v11 = (NSString *)v4[3];
  if (subtitle && v11)
  {
    if ((-[NSString isEqual:](subtitle, "isEqual:") & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (subtitle != v11)
  {
    goto LABEL_29;
  }
  subtitle2 = self->_subtitle2;
  v13 = (NSString *)v4[4];
  if (subtitle2 && v13)
  {
    if ((-[NSString isEqual:](subtitle2, "isEqual:") & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (subtitle2 != v13)
  {
    goto LABEL_29;
  }
  mapsURL = self->_mapsURL;
  v15 = (NSURL *)v4[9];
  if (!mapsURL || !v15)
  {
    if (mapsURL == v15) {
      goto LABEL_27;
    }
LABEL_29:
    BOOL v16 = 0;
    goto LABEL_30;
  }
  if ((-[NSURL isEqual:](mapsURL, "isEqual:") & 1) == 0) {
    goto LABEL_29;
  }
LABEL_27:
  BOOL v16 = self->_merchantCategory == v4[11];
LABEL_30:

  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle2
{
  return self->_subtitle2;
}

- (void)setSubtitle2:(id)a3
{
}

- (NSString)detailFooterLeadingTitle
{
  return self->_detailFooterLeadingTitle;
}

- (void)setDetailFooterLeadingTitle:(id)a3
{
}

- (NSString)detailFooterTrailingTitle
{
  return self->_detailFooterTrailingTitle;
}

- (void)setDetailFooterTrailingTitle:(id)a3
{
}

- (NSString)detailFooterLeadingText
{
  return self->_detailFooterLeadingText;
}

- (void)setDetailFooterLeadingText:(id)a3
{
}

- (NSString)detailFooterTrailingText
{
  return self->_detailFooterTrailingText;
}

- (void)setDetailFooterTrailingText:(id)a3
{
}

- (NSURL)mapsURL
{
  return self->_mapsURL;
}

- (void)setMapsURL:(id)a3
{
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (int64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (NSArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_mapsURL, 0);
  objc_storeStrong((id *)&self->_detailFooterTrailingText, 0);
  objc_storeStrong((id *)&self->_detailFooterLeadingText, 0);
  objc_storeStrong((id *)&self->_detailFooterTrailingTitle, 0);
  objc_storeStrong((id *)&self->_detailFooterLeadingTitle, 0);
  objc_storeStrong((id *)&self->_subtitle2, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end