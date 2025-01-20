@interface PKPaymentOfferDynamicContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKPaymentOfferDynamicContent)initWithCoder:(id)a3;
- (PKPaymentOfferDynamicContent)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dynamicContentPageForPageType:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferDynamicContent

- (PKPaymentOfferDynamicContent)initWithDictionary:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__PKPaymentOfferDynamicContent_initWithDictionary___block_invoke;
  v14[3] = &unk_1E56DCAC8;
  id v7 = v6;
  id v15 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v14];

  if ([v7 count])
  {
    v13.receiver = self;
    v13.super_class = (Class)PKPaymentOfferDynamicContent;
    v8 = [(PKPaymentOfferDynamicContent *)&v13 init];
    if (v8)
    {
      uint64_t v9 = [v7 copy];
      contentByPageType = v8->_contentByPageType;
      v8->_contentByPageType = (NSDictionary *)v9;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __51__PKPaymentOfferDynamicContent_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (__CFString *)v5;
  v42 = v7;
  if (v7 == @"splashScreen")
  {
    uint64_t v9 = 1;
LABEL_38:

    v10 = [[PKPaymentOfferDynamicContentPage alloc] initWithDictionary:v6 pageType:v9];
    v40 = *(void **)(a1 + 32);
    v41 = [NSNumber numberWithUnsignedInteger:v9];
    [v40 safelySetObject:v10 forKey:v41];

    goto LABEL_39;
  }
  if (!v7)
  {
    v10 = 0;
    goto LABEL_39;
  }
  char v8 = [(__CFString *)v7 isEqualToString:@"splashScreen"];

  if (v8)
  {
    uint64_t v9 = 1;
LABEL_37:
    id v7 = v42;
    goto LABEL_38;
  }
  v11 = v42;
  if (v11 == @"installmentOfferSelection"
    || (v12 = v11,
        char v13 = [(__CFString *)v11 isEqualToString:@"installmentOfferSelection"],
        v12,
        (v13 & 1) != 0))
  {
    uint64_t v9 = 2;
    goto LABEL_37;
  }
  v14 = v12;
  if (v14 == @"webviewScreen"
    || (id v15 = v14,
        char v16 = [(__CFString *)v14 isEqualToString:@"webviewScreen"],
        v15,
        (v16 & 1) != 0))
  {
    uint64_t v9 = 3;
    goto LABEL_37;
  }
  v17 = v15;
  if (v17 == @"offersChanged"
    || (v18 = v17,
        char v19 = [(__CFString *)v17 isEqualToString:@"offersChanged"],
        v18,
        (v19 & 1) != 0))
  {
    uint64_t v9 = 4;
    goto LABEL_37;
  }
  v20 = v18;
  if (v20 == @"ineligibleOffers"
    || (v21 = v20,
        char v22 = [(__CFString *)v20 isEqualToString:@"ineligibleOffers"],
        v21,
        (v22 & 1) != 0))
  {
    uint64_t v9 = 5;
    goto LABEL_37;
  }
  v23 = v21;
  if (v23 == @"languageNotice"
    || (v24 = v23,
        char v25 = [(__CFString *)v23 isEqualToString:@"languageNotice"],
        v24,
        (v25 & 1) != 0))
  {
    uint64_t v9 = 6;
    goto LABEL_37;
  }
  v26 = v24;
  if (v26 == @"offerSummary"
    || (v27 = v26,
        char v28 = [(__CFString *)v26 isEqualToString:@"offerSummary"],
        v27,
        (v28 & 1) != 0))
  {
    uint64_t v9 = 7;
    goto LABEL_37;
  }
  v29 = v27;
  if (v29 == @"offerShortSummary"
    || (v30 = v29,
        char v31 = [(__CFString *)v29 isEqualToString:@"offerShortSummary"],
        v30,
        (v31 & 1) != 0))
  {
    uint64_t v9 = 8;
    goto LABEL_37;
  }
  v32 = v30;
  if (v32 == @"offerPaymentSummary"
    || (v33 = v32,
        char v34 = [(__CFString *)v32 isEqualToString:@"offerPaymentSummary"],
        v33,
        (v34 & 1) != 0))
  {
    uint64_t v9 = 9;
    goto LABEL_37;
  }
  v35 = v33;
  if (v35 == @"provisioning"
    || (v36 = v35,
        char v37 = [(__CFString *)v35 isEqualToString:@"provisioning"],
        v36,
        (v37 & 1) != 0))
  {
    uint64_t v9 = 10;
    goto LABEL_37;
  }
  v38 = v36;
  if (v38 == @"installmentPartnerExplanation"
    || (v10 = (PKPaymentOfferDynamicContentPage *)v38,
        int v39 = [(__CFString *)v38 isEqualToString:@"installmentPartnerExplanation"],
        v10,
        v39))
  {
    uint64_t v9 = 11;
    goto LABEL_37;
  }
LABEL_39:
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  contentByPageType = self->_contentByPageType;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PKPaymentOfferDynamicContent_dictionaryRepresentation__block_invoke;
  v8[3] = &unk_1E56F1480;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)contentByPageType enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __56__PKPaymentOfferDynamicContent_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = [a2 integerValue] - 1;
  if (v6 > 0xA) {
    id v7 = @"unknown";
  }
  else {
    id v7 = off_1E56F14E0[v6];
  }
  char v8 = *(void **)(a1 + 32);
  id v9 = [v5 dictionaryRepresentation];

  [v8 safelySetObject:v9 forKey:v7];
}

- (id)dynamicContentPageForPageType:(unint64_t)a3
{
  contentByPageType = self->_contentByPageType;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSDictionary *)contentByPageType objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPaymentOfferDynamicContent *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    contentByPageType = self->_contentByPageType;
    id v7 = v5->_contentByPageType;
    if (contentByPageType && v7) {
      char v8 = -[NSDictionary isEqual:](contentByPageType, "isEqual:");
    }
    else {
      char v8 = contentByPageType == v7;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_contentByPageType];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"contentByPageType: '%@'; ", self->_contentByPageType];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferDynamicContent;
  id v5 = [(PKPaymentOfferDynamicContent *)&v13 init];
  if (v5)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"contentByPageType"];
    contentByPageType = v5->_contentByPageType;
    v5->_contentByPageType = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferDynamicContent allocWithZone:](PKPaymentOfferDynamicContent, "allocWithZone:") init];
  uint64_t v6 = [(NSDictionary *)self->_contentByPageType copyWithZone:a3];
  contentByPageType = v5->_contentByPageType;
  v5->_contentByPageType = (NSDictionary *)v6;

  return v5;
}

- (void).cxx_destruct
{
}

@end