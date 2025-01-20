@interface PKTransactionReceiptLineItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransactionReceiptLineItem:(id)a3;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (NSString)identifier;
- (NSString)secondarySubtitle;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)iconImageURL;
- (PKCurrencyAmount)currencyAmount;
- (PKImage)image;
- (PKTransactionReceiptLineItem)initWithCoder:(id)a3;
- (PKTransactionReceiptLineItem)initWithDictionary:(id)a3 bundle:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)adamIdentifier;
- (unint64_t)hash;
- (unint64_t)quantity;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamIdentifier:(unint64_t)a3;
- (void)setAmount:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setIconImageURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setQuantity:(unint64_t)a3;
- (void)setSecondarySubtitle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKTransactionReceiptLineItem

- (PKTransactionReceiptLineItem)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PKTransactionReceiptLineItem;
  v8 = [(PKTransactionReceiptLineItem *)&v37 init];
  if (v8)
  {
    uint64_t v9 = [v6 PKStringForKey:@"identifier"];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = [v6 PKStringForKey:@"title"];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = PKLocalizedReceiptStringForReceiptBundle(v11, v7);
      title = v8->_title;
      v8->_title = (NSString *)v13;
    }
    v15 = [v6 PKStringForKey:@"subtitle"];
    v16 = v15;
    if (v15)
    {
      uint64_t v17 = PKLocalizedReceiptStringForReceiptBundle(v15, v7);
      subtitle = v8->_subtitle;
      v8->_subtitle = (NSString *)v17;
    }
    v19 = [v6 PKStringForKey:@"itemDescription"];
    v20 = v19;
    if (v19)
    {
      uint64_t v21 = PKLocalizedReceiptStringForReceiptBundle(v19, v7);
      secondarySubtitle = v8->_secondarySubtitle;
      v8->_secondarySubtitle = (NSString *)v21;
    }
    uint64_t v23 = [v6 PKURLForKey:@"imageURL"];
    iconImageURL = v8->_iconImageURL;
    v8->_iconImageURL = (NSURL *)v23;

    v8->_quantity = [v6 PKIntegerForKey:@"quantity"];
    uint64_t v25 = [v6 PKDecimalNumberFromStringForKey:@"amount"];
    amount = v8->_amount;
    v8->_amount = (NSDecimalNumber *)v25;

    uint64_t v27 = [v6 PKStringForKey:@"currencyCode"];
    currencyCode = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v27;

    v8->_adamIdentifier = [v6 PKIntegerForKey:@"adamID"];
    v29 = [v6 PKStringForKey:@"imageName"];
    if (v29)
    {
      uint64_t v30 = +[PKImage imageNamed:v29 inBundle:v7];
      image = v8->_image;
      v8->_image = (PKImage *)v30;
    }
    else
    {
      v32 = v8->_iconImageURL;
      if (!v32)
      {
LABEL_13:

        goto LABEL_14;
      }
      image = [(NSURL *)v32 pathExtension];
      v33 = [(NSString *)v8->_identifier stringByAppendingPathExtension:image];
      uint64_t v34 = +[PKImage imageNamed:v33 inBundle:v7];
      v35 = v8->_image;
      v8->_image = (PKImage *)v34;
    }
    goto LABEL_13;
  }
LABEL_14:

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"title: '%@'; ", self->_title];
  [v3 appendFormat:@"subtitle: '%@'; ", self->_subtitle];
  [v3 appendFormat:@"image: '%@'; ", self->_image];
  v4 = [NSNumber numberWithUnsignedInteger:self->_quantity];
  [v3 appendFormat:@"quantity: '%@'; ", v4];

  [v3 appendFormat:@"amount: '%@'; ", self->_amount];
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  v5 = [NSNumber numberWithUnsignedInteger:self->_adamIdentifier];
  [v3 appendFormat:@"adamIdentifier: '%@'; ", v5];

  [v3 appendFormat:@">"];
  id v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKTransactionReceiptLineItem *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransactionReceiptLineItem *)self isEqualToTransactionReceiptLineItem:v5];

  return v6;
}

- (BOOL)isEqualToTransactionReceiptLineItem:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_48;
  }
  BOOL v6 = (void *)v4[1];
  id v7 = self->_identifier;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_47;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_48;
    }
  }
  v11 = (void *)v5[2];
  id v7 = self->_title;
  v12 = v11;
  if (v7 == v12)
  {
  }
  else
  {
    uint64_t v9 = v12;
    if (!v7 || !v12) {
      goto LABEL_47;
    }
    BOOL v13 = [(NSString *)v7 isEqualToString:v12];

    if (!v13) {
      goto LABEL_48;
    }
  }
  v14 = (void *)v5[3];
  id v7 = self->_subtitle;
  v15 = v14;
  if (v7 == v15)
  {
  }
  else
  {
    uint64_t v9 = v15;
    if (!v7 || !v15) {
      goto LABEL_47;
    }
    BOOL v16 = [(NSString *)v7 isEqualToString:v15];

    if (!v16) {
      goto LABEL_48;
    }
  }
  uint64_t v17 = (void *)v5[4];
  id v7 = self->_secondarySubtitle;
  v18 = v17;
  if (v7 == v18)
  {
  }
  else
  {
    uint64_t v9 = v18;
    if (!v7 || !v18) {
      goto LABEL_47;
    }
    BOOL v19 = [(NSString *)v7 isEqualToString:v18];

    if (!v19) {
      goto LABEL_48;
    }
  }
  iconImageURL = self->_iconImageURL;
  uint64_t v21 = (NSURL *)v5[9];
  if (iconImageURL && v21)
  {
    if ((-[NSURL isEqual:](iconImageURL, "isEqual:") & 1) == 0) {
      goto LABEL_48;
    }
  }
  else if (iconImageURL != v21)
  {
    goto LABEL_48;
  }
  image = self->_image;
  uint64_t v23 = (PKImage *)v5[5];
  if (image && v23)
  {
    if (!-[PKImage isEqual:](image, "isEqual:")) {
      goto LABEL_48;
    }
  }
  else if (image != v23)
  {
    goto LABEL_48;
  }
  if (self->_quantity != v5[6]) {
    goto LABEL_48;
  }
  amount = self->_amount;
  uint64_t v25 = (NSDecimalNumber *)v5[7];
  if (amount && v25)
  {
    if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0) {
      goto LABEL_48;
    }
  }
  else if (amount != v25)
  {
    goto LABEL_48;
  }
  v26 = (void *)v5[8];
  id v7 = self->_currencyCode;
  uint64_t v27 = v26;
  if (v7 == v27)
  {

LABEL_51:
    BOOL v29 = self->_adamIdentifier == v5[10];
    goto LABEL_49;
  }
  uint64_t v9 = v27;
  if (!v7 || !v27)
  {
LABEL_47:

    goto LABEL_48;
  }
  BOOL v28 = [(NSString *)v7 isEqualToString:v27];

  if (v28) {
    goto LABEL_51;
  }
LABEL_48:
  BOOL v29 = 0;
LABEL_49:

  return v29;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_subtitle];
  [v3 safelyAddObject:self->_secondarySubtitle];
  [v3 safelyAddObject:self->_iconImageURL];
  [v3 safelyAddObject:self->_image];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_currencyCode];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_adamIdentifier - v4 + 32 * v4;
  unint64_t v6 = self->_quantity - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReceiptLineItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKTransactionReceiptLineItem;
  unint64_t v5 = [(PKTransactionReceiptLineItem *)&v23 init];
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

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemDescription"];
    secondarySubtitle = v5->_secondarySubtitle;
    v5->_secondarySubtitle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL"];
    iconImageURL = v5->_iconImageURL;
    v5->_iconImageURL = (NSURL *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (PKImage *)v16;

    v5->_quantity = [v4 decodeIntegerForKey:@"quantity"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v20;

    v5->_adamIdentifier = [v4 decodeIntegerForKey:@"adamID"];
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
  [v5 encodeObject:self->_secondarySubtitle forKey:@"itemDescription"];
  [v5 encodeObject:self->_iconImageURL forKey:@"imageURL"];
  [v5 encodeObject:self->_image forKey:@"image"];
  [v5 encodeInteger:self->_quantity forKey:@"quantity"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeInteger:self->_adamIdentifier forKey:@"adamID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  id v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_subtitle copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_secondarySubtitle copyWithZone:a3];
  BOOL v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSURL *)self->_iconImageURL copyWithZone:a3];
  v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  objc_storeStrong((id *)(v5 + 40), self->_image);
  *(void *)(v5 + 48) = self->_quantity;
  uint64_t v16 = [(NSDecimalNumber *)self->_amount copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  uint64_t v18 = [(NSString *)self->_currencyCode copyWithZone:a3];
  BOOL v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  *(void *)(v5 + 80) = self->_adamIdentifier;
  return (id)v5;
}

- (PKCurrencyAmount)currencyAmount
{
  amount = self->_amount;
  if (amount)
  {
    currencyCode = self->_currencyCode;
    if (currencyCode)
    {
      PKCurrencyAmountCreate(amount, currencyCode, 0);
      amount = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      amount = 0;
    }
  }
  return (PKCurrencyAmount *)amount;
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

- (NSString)secondarySubtitle
{
  return self->_secondarySubtitle;
}

- (void)setSecondarySubtitle:(id)a3
{
}

- (PKImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (unint64_t)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(unint64_t)a3
{
  self->_quantity = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSURL)iconImageURL
{
  return self->_iconImageURL;
}

- (void)setIconImageURL:(id)a3
{
}

- (unint64_t)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(unint64_t)a3
{
  self->_adamIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageURL, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_secondarySubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end