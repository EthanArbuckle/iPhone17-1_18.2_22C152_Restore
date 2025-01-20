@interface PKPayLaterDynamicContentPage
+ (id)_contentByIdentifierFromDictionary:(id)a3 pageType:(unint64_t)a4;
+ (id)_productSectionByTypeFromDictionary:(id)a3 pageType:(unint64_t)a4;
+ (id)keyForProductType:(unint64_t)a3 optionIdentifier:(id)a4;
- (NSArray)sections;
- (NSString)altHeaderSubtitle;
- (NSString)altPrimaryActionIdentifier;
- (NSString)altPrimaryActionTitle;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (NSString)optionIdentifier;
- (NSString)primaryActionIdentifier;
- (NSString)primaryActionTitle;
- (NSString)secondaryActionIdentifier;
- (NSString)secondaryActionTitle;
- (PKApplyFooterContent)footerContent;
- (PKCurrencyAmount)maximumAmount;
- (PKCurrencyAmount)minimumAmount;
- (PKPayLaterDynamicContentPage)initWithDictionary:(id)a3 pageType:(unint64_t)a4;
- (PKPayLaterDynamicContentPageItem)contentItem;
- (id)description;
- (id)dynamicContentPageForProductType:(unint64_t)a3 optionIdentifier:(id)a4;
- (id)productSectionForType:(unint64_t)a3;
- (int64_t)altHeaderSubtitleTimeInterval;
- (unint64_t)pageType;
- (unint64_t)productType;
- (void)setAltHeaderSubtitle:(id)a3;
- (void)setAltHeaderSubtitleTimeInterval:(int64_t)a3;
- (void)setAltPrimaryActionIdentifier:(id)a3;
- (void)setAltPrimaryActionTitle:(id)a3;
- (void)setContentItem:(id)a3;
- (void)setFooterContent:(id)a3;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setMaximumAmount:(id)a3;
- (void)setMinimumAmount:(id)a3;
- (void)setOptionIdentifier:(id)a3;
- (void)setPageType:(unint64_t)a3;
- (void)setPrimaryActionIdentifier:(id)a3;
- (void)setPrimaryActionTitle:(id)a3;
- (void)setProductType:(unint64_t)a3;
- (void)setSecondaryActionIdentifier:(id)a3;
- (void)setSecondaryActionTitle:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation PKPayLaterDynamicContentPage

- (PKPayLaterDynamicContentPage)initWithDictionary:(id)a3 pageType:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v29 = [(id)objc_opt_class() _contentByIdentifierFromDictionary:v6 pageType:a4];
    unint64_t v26 = a4;
    v7 = [(id)objc_opt_class() _productSectionByTypeFromDictionary:v6 pageType:a4];
    v8 = [v6 PKArrayContaining:objc_opt_class() forKey:@"products"];
    v9 = [v6 PKStringForKey:@"headerTitle"];
    v40 = [v6 PKStringForKey:@"headerSubtitle"];
    id v39 = [v6 PKStringForKey:@"altHeaderSubtitle"];
    uint64_t v25 = [v6 PKIntegerForKey:@"altHeaderSubtitleTimeInterval"];
    id v38 = [v6 PKStringForKey:@"primaryActionTitle"];
    id v37 = [v6 PKStringForKey:@"primaryActionIdentifier"];
    id v36 = [v6 PKStringForKey:@"altPrimaryActionTitle"];
    id v35 = [v6 PKStringForKey:@"altPrimaryActionIdentifier"];
    id v34 = [v6 PKStringForKey:@"secondaryActionTitle"];
    id v33 = [v6 PKStringForKey:@"secondaryActionIdentifier"];
    v10 = [v6 PKStringForKey:@"productType"];
    uint64_t v27 = PKPayLaterAccountProductTypeFromString(v10);

    id v30 = [v6 PKStringForKey:@"optionIdentifier"];
    id v32 = [v6 PKCurrencyAmountForKey:@"minimumAmount"];
    id v31 = [v6 PKCurrencyAmountForKey:@"maximumAmount"];
    v11 = [v6 PKDictionaryForKey:@"footerContent"];
    if ([v11 count]) {
      v12 = [[PKApplyFooterContent alloc] initWithDictionary:v11];
    }
    else {
      v12 = 0;
    }
    v14 = [v6 PKArrayContaining:objc_opt_class() forKey:@"sections"];
    v15 = objc_msgSend(v14, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_110);
    v16 = [[PKPayLaterDynamicContentPageItem alloc] initWithDictionary:v6];
    id obj = v9;
    if ([v8 count]
      || v9
      || v40
      || v39
      || v38
      || v37
      || v36
      || v35
      || v34
      || v33
      || v12
      || [v15 count]
      || v16
      || v32
      || v31
      || v27
      || v30)
    {
      v41.receiver = self;
      v41.super_class = (Class)PKPayLaterDynamicContentPage;
      v17 = [(PKPayLaterDynamicContentPage *)&v41 init];
      if (v17)
      {
        if ([v29 count])
        {
          uint64_t v18 = [v29 copy];
          contentByIdentifier = v17->_contentByIdentifier;
          v17->_contentByIdentifier = (NSDictionary *)v18;
        }
        else
        {
          contentByIdentifier = v17->_contentByIdentifier;
          v17->_contentByIdentifier = 0;
        }

        if ([v7 count])
        {
          uint64_t v20 = [v7 copy];
          productSectionByType = v17->_productSectionByType;
          v17->_productSectionByType = (NSDictionary *)v20;
        }
        else
        {
          productSectionByType = v17->_productSectionByType;
          v17->_productSectionByType = 0;
        }

        objc_storeStrong((id *)&v17->_headerTitle, v9);
        objc_storeStrong((id *)&v17->_altHeaderSubtitle, v39);
        v17->_altHeaderSubtitleTimeInterval = v25;
        objc_storeStrong((id *)&v17->_headerSubtitle, v40);
        objc_storeStrong((id *)&v17->_primaryActionTitle, v38);
        objc_storeStrong((id *)&v17->_primaryActionIdentifier, v37);
        objc_storeStrong((id *)&v17->_altPrimaryActionTitle, v36);
        objc_storeStrong((id *)&v17->_altPrimaryActionIdentifier, v35);
        objc_storeStrong((id *)&v17->_secondaryActionTitle, v34);
        objc_storeStrong((id *)&v17->_secondaryActionIdentifier, v33);
        objc_storeStrong((id *)&v17->_footerContent, v12);
        objc_storeStrong((id *)&v17->_contentItem, v16);
        if ([v15 count])
        {
          uint64_t v22 = [v15 copy];
          sections = v17->_sections;
          v17->_sections = (NSArray *)v22;
        }
        else
        {
          sections = v17->_sections;
          v17->_sections = 0;
        }

        v17->_productType = v27;
        objc_storeStrong((id *)&v17->_optionIdentifier, v30);
        objc_storeStrong((id *)&v17->_minimumAmount, v32);
        objc_storeStrong((id *)&v17->_maximumAmount, v31);
        v17->_pageType = v26;
      }
      self = v17;
      v13 = self;
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

PKPayLaterDynamicContentSection *__60__PKPayLaterDynamicContentPage_initWithDictionary_pageType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPayLaterDynamicContentSection alloc] initWithDictionary:v2];

  return v3;
}

+ (id)_contentByIdentifierFromDictionary:(id)a3 pageType:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v22 = v4;
  [v4 PKArrayContaining:objc_opt_class() forKey:@"products"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v10 = objc_msgSend(v4, "mutableCopy", v19);
        [v10 removeObjectForKey:@"products"];
        [v10 removeObjectForKey:@"footerContent"];
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v11 addEntriesFromDictionary:v9];
        [v11 addEntriesFromDictionary:v10];
        v12 = [[PKPayLaterDynamicContentPage alloc] initWithDictionary:v11 pageType:a4];
        uint64_t v13 = [(PKPayLaterDynamicContentPage *)v12 productType];
        v14 = [(PKPayLaterDynamicContentPage *)v12 optionIdentifier];
        v15 = +[PKPayLaterDynamicContentPage keyForProductType:v13 optionIdentifier:v14];

        if (v12 && v15) {
          [v19 setObject:v12 forKey:v15];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }
  v16 = v19;
  if (objc_msgSend(v19, "count", v19)) {
    v17 = (void *)[v16 copy];
  }
  else {
    v17 = 0;
  }

  return v17;
}

+ (id)_productSectionByTypeFromDictionary:(id)a3 pageType:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v29 = v4;
  uint64_t v6 = [v4 PKDictionaryForKey:@"productSectionTypes"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v7) {
    goto LABEL_24;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v31;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v31 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = (__CFString *)*(id *)(*((void *)&v30 + 1) + 8 * v10);
      v12 = v11;
      if (v11 == @"availableProductsSection")
      {
LABEL_9:
        uint64_t v14 = 1;
LABEL_10:

        v15 = [v6 objectForKeyedSubscript:v12];
        v16 = [[PKPayLaterDynamicContentPageItem alloc] initWithDictionary:v15];
        v17 = [NSNumber numberWithUnsignedInteger:v14];
        [v5 safelySetObject:v16 forKey:v17];

        goto LABEL_12;
      }
      if (v11)
      {
        char v13 = [(__CFString *)v11 isEqualToString:@"availableProductsSection"];

        if (v13) {
          goto LABEL_9;
        }
        uint64_t v18 = v12;
        if (v18 == @"unavailableProductsSection"
          || (v19 = v18, char v20 = -[__CFString isEqualToString:](v18, "isEqualToString:"),
                         v19,
                         (v20 & 1) != 0))
        {
          uint64_t v14 = 2;
          goto LABEL_10;
        }
        v21 = v19;
        if (v21 == @"otherProductsSection"
          || (uint64_t v22 = v21, v23 = -[__CFString isEqualToString:](v21, "isEqualToString:"),
                         v22,
                         (v23 & 1) != 0))
        {
          uint64_t v14 = 3;
          goto LABEL_10;
        }
        long long v24 = v22;
        if (v24 == @"selectedOptionProductSection"
          || (v15 = v24, int v25 = -[__CFString isEqualToString:](v24, "isEqualToString:"), v15, v25))
        {
          uint64_t v14 = 4;
          goto LABEL_10;
        }
      }
      else
      {
        v15 = 0;
      }
LABEL_12:

      ++v10;
    }
    while (v8 != v10);
    uint64_t v26 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    uint64_t v8 = v26;
  }
  while (v26);
LABEL_24:
  if ([v5 count]) {
    uint64_t v27 = (void *)[v5 copy];
  }
  else {
    uint64_t v27 = 0;
  }

  return v27;
}

- (id)dynamicContentPageForProductType:(unint64_t)a3 optionIdentifier:(id)a4
{
  id v5 = +[PKPayLaterDynamicContentPage keyForProductType:a3 optionIdentifier:a4];
  if (!v5
    || ([(NSDictionary *)self->_contentByIdentifier objectForKey:v5],
        (uint64_t v6 = (PKPayLaterDynamicContentPage *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = self;
  }

  return v6;
}

- (id)productSectionForType:(unint64_t)a3
{
  productSectionByType = self->_productSectionByType;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSDictionary *)productSectionByType objectForKey:v4];

  return v5;
}

+ (id)keyForProductType:(unint64_t)a3 optionIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = PKPayLaterAccountProductTypeToString(a3);
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = [NSString stringWithFormat:@"%@-%@", v6, v5];
  }
  else
  {
    id v8 = v6;
  }
  uint64_t v9 = v8;

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_headerTitle) {
    [v3 appendFormat:@"headerTitle: '%@'; ", self->_headerTitle];
  }
  if (self->_headerSubtitle) {
    [v4 appendFormat:@"headerSubtitle: '%@'; ", self->_headerSubtitle];
  }
  if (self->_altHeaderSubtitle) {
    [v4 appendFormat:@"altHeaderSubtitle: '%@'; ", self->_altHeaderSubtitle];
  }
  if (self->_altHeaderSubtitleTimeInterval >= 1) {
    objc_msgSend(v4, "appendFormat:", @"altHeaderSubtitleTimeInterval: %ld; ",
  }
      self->_altHeaderSubtitleTimeInterval);
  if (self->_headerSubtitle) {
    [v4 appendFormat:@"headerSubtitle: '%@'; ", self->_headerSubtitle];
  }
  if (self->_primaryActionTitle) {
    [v4 appendFormat:@"primaryActionTitle: '%@'; ", self->_primaryActionTitle];
  }
  if (self->_primaryActionIdentifier) {
    [v4 appendFormat:@"primaryActionIdentifier: '%@'; ", self->_primaryActionIdentifier];
  }
  if (self->_altPrimaryActionTitle) {
    [v4 appendFormat:@"altPrimaryActionTitle: '%@'; ", self->_altPrimaryActionTitle];
  }
  if (self->_altPrimaryActionIdentifier) {
    [v4 appendFormat:@"altPrimaryActionIdentifier: '%@'; ", self->_altPrimaryActionIdentifier];
  }
  if (self->_secondaryActionTitle) {
    [v4 appendFormat:@"secondaryActionTitle: '%@'; ", self->_secondaryActionTitle];
  }
  if (self->_secondaryActionIdentifier) {
    [v4 appendFormat:@"secondaryActionIdentifier: '%@'; ", self->_secondaryActionIdentifier];
  }
  if (self->_contentItem) {
    [v4 appendFormat:@"contentItem: '%@'; ", self->_contentItem];
  }
  if (self->_footerContent) {
    [v4 appendFormat:@"footerContent: '%@'; ", self->_footerContent];
  }
  if ([(NSArray *)self->_sections count]) {
    [v4 appendFormat:@"sections: '%@'; ", self->_sections];
  }
  if ([(NSDictionary *)self->_contentByIdentifier count]) {
    [v4 appendFormat:@"contentByIdentifier: '%@'; ", self->_contentByIdentifier];
  }
  [v4 appendFormat:@">"];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (unint64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(unint64_t)a3
{
  self->_pageType = a3;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (void)setHeaderSubtitle:(id)a3
{
}

- (NSString)altHeaderSubtitle
{
  return self->_altHeaderSubtitle;
}

- (void)setAltHeaderSubtitle:(id)a3
{
}

- (int64_t)altHeaderSubtitleTimeInterval
{
  return self->_altHeaderSubtitleTimeInterval;
}

- (void)setAltHeaderSubtitleTimeInterval:(int64_t)a3
{
  self->_altHeaderSubtitleTimeInterval = a3;
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

- (NSString)altPrimaryActionTitle
{
  return self->_altPrimaryActionTitle;
}

- (void)setAltPrimaryActionTitle:(id)a3
{
}

- (NSString)altPrimaryActionIdentifier
{
  return self->_altPrimaryActionIdentifier;
}

- (void)setAltPrimaryActionIdentifier:(id)a3
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

- (PKCurrencyAmount)minimumAmount
{
  return self->_minimumAmount;
}

- (void)setMinimumAmount:(id)a3
{
}

- (PKCurrencyAmount)maximumAmount
{
  return self->_maximumAmount;
}

- (void)setMaximumAmount:(id)a3
{
}

- (PKPayLaterDynamicContentPageItem)contentItem
{
  return self->_contentItem;
}

- (void)setContentItem:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (void)setFooterContent:(id)a3
{
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (NSString)optionIdentifier
{
  return self->_optionIdentifier;
}

- (void)setOptionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionIdentifier, 0);
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_maximumAmount, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_secondaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_altPrimaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_altPrimaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_altHeaderSubtitle, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_productSectionByType, 0);
  objc_storeStrong((id *)&self->_contentByIdentifier, 0);
}

@end