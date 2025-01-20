@interface PKPaymentOfferDynamicContentCustomLayoutItemTextDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isBold;
- (BOOL)isEqual:(id)a3;
- (NSString)altText;
- (NSString)text;
- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)initWithCoder:(id)a3;
- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)font;
- (unint64_t)hash;
- (unint64_t)textColor;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferDynamicContentCustomLayoutItemTextDetails

- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 PKStringForKey:@"text"];
    v6 = [v4 PKStringForKey:@"altText"];
    if (![v5 length])
    {
      v11 = 0;
LABEL_51:

      goto LABEL_52;
    }
    v7 = [v4 PKStringForKey:@"font"];
    v8 = v7;
    if (v7 == @"title") {
      goto LABEL_6;
    }
    if (!v7) {
      goto LABEL_36;
    }
    char v9 = [(__CFString *)v7 isEqualToString:@"title"];

    if (v9)
    {
LABEL_6:
      uint64_t v10 = 1;
      goto LABEL_37;
    }
    v12 = v8;
    if (v12 == @"title2"
      || (v13 = v12,
          char v14 = [(__CFString *)v12 isEqualToString:@"title2"],
          v13,
          (v14 & 1) != 0))
    {
      uint64_t v10 = 2;
      goto LABEL_37;
    }
    v15 = v13;
    if (v15 == @"title3"
      || (v16 = v15,
          char v17 = [(__CFString *)v15 isEqualToString:@"title3"],
          v16,
          (v17 & 1) != 0))
    {
      uint64_t v10 = 3;
      goto LABEL_37;
    }
    v18 = v16;
    if (v18 == @"headline"
      || (v19 = v18,
          char v20 = [(__CFString *)v18 isEqualToString:@"headline"],
          v19,
          (v20 & 1) != 0))
    {
      uint64_t v10 = 4;
      goto LABEL_37;
    }
    v21 = v19;
    if (v21 == @"subheadline"
      || (v22 = v21,
          char v23 = [(__CFString *)v21 isEqualToString:@"subheadline"],
          v22,
          (v23 & 1) != 0))
    {
      uint64_t v10 = 5;
      goto LABEL_37;
    }
    v24 = v22;
    if (v24 == @"body"
      || (v25 = v24,
          char v26 = [(__CFString *)v24 isEqualToString:@"body"],
          v25,
          (v26 & 1) != 0))
    {
      uint64_t v10 = 6;
      goto LABEL_37;
    }
    v27 = v25;
    if (v27 == @"callout"
      || (v28 = v27,
          char v29 = [(__CFString *)v27 isEqualToString:@"callout"],
          v28,
          (v29 & 1) != 0))
    {
      uint64_t v10 = 7;
      goto LABEL_37;
    }
    v30 = v28;
    if (v30 == @"footnote"
      || (v31 = v30,
          char v32 = [(__CFString *)v30 isEqualToString:@"footnote"],
          v31,
          (v32 & 1) != 0))
    {
      uint64_t v10 = 8;
      goto LABEL_37;
    }
    v33 = v31;
    if (v33 == @"caption"
      || (v34 = v33,
          char v35 = [(__CFString *)v33 isEqualToString:@"caption"],
          v34,
          (v35 & 1) != 0))
    {
      uint64_t v10 = 9;
      goto LABEL_37;
    }
    v36 = v34;
    if (v36 == @"caption2"
      || (v37 = v36,
          int v38 = [(__CFString *)v36 isEqualToString:@"caption2"],
          v37,
          v38))
    {
      uint64_t v10 = 10;
    }
    else
    {
LABEL_36:
      uint64_t v10 = 0;
    }
LABEL_37:

    v39 = [v4 PKStringForKey:@"textColor"];
    v40 = v39;
    if (v39 != @"primary")
    {
      if (v39)
      {
        char v41 = [(__CFString *)v39 isEqualToString:@"primary"];

        if (v41) {
          goto LABEL_40;
        }
        v43 = v40;
        if (v43 == @"secondary"
          || (v44 = v43,
              char v45 = [(__CFString *)v43 isEqualToString:@"secondary"],
              v44,
              (v45 & 1) != 0))
        {
          uint64_t v42 = 2;
          goto LABEL_48;
        }
        v46 = v44;
        if (v46 == @"accentColor"
          || (v47 = v46,
              int v48 = [(__CFString *)v46 isEqualToString:@"accentColor"],
              v47,
              v48))
        {
          uint64_t v42 = 3;
          goto LABEL_48;
        }
      }
      uint64_t v42 = 0;
      goto LABEL_48;
    }
LABEL_40:
    uint64_t v42 = 1;
LABEL_48:

    char v49 = [v4 PKBoolForKey:@"bold"];
    v53.receiver = self;
    v53.super_class = (Class)PKPaymentOfferDynamicContentCustomLayoutItemTextDetails;
    v50 = [(PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)&v53 init];
    v51 = v50;
    if (v50)
    {
      objc_storeStrong((id *)&v50->_text, v5);
      objc_storeStrong((id *)&v51->_altText, v6);
      v51->_font = v10;
      v51->_textColor = v42;
      v51->_bold = v49;
    }
    self = v51;
    v11 = self;
    goto LABEL_51;
  }
  v11 = 0;
LABEL_52:

  return v11;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_text forKeyedSubscript:@"text"];
  [v3 setObject:self->_altText forKeyedSubscript:@"altText"];
  unint64_t v4 = self->_font - 1;
  if (v4 > 9) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E56F1538[v4];
  }
  [v3 setObject:v5 forKeyedSubscript:@"font"];
  unint64_t v6 = self->_textColor - 1;
  if (v6 > 2) {
    v7 = @"unknown";
  }
  else {
    v7 = off_1E56F1588[v6];
  }
  [v3 setObject:v7 forKeyedSubscript:@"textColor"];
  v8 = [NSNumber numberWithBool:self->_bold];
  char v9 = [v8 stringValue];
  [v3 setObject:v9 forKeyedSubscript:@"bold"];

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)a3;
  v5 = v4;
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
        unint64_t v6 = v5;
        text = v6->_text;
        v8 = self->_text;
        char v9 = text;
        if (v8 == v9)
        {
        }
        else
        {
          uint64_t v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_17;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_22;
          }
        }
        altText = v6->_altText;
        v8 = self->_altText;
        char v14 = altText;
        if (v8 == v14)
        {

LABEL_19:
          if (self->_font == v6->_font && self->_textColor == v6->_textColor)
          {
            BOOL v12 = self->_bold == v6->_bold;
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:
          BOOL v12 = 0;
          goto LABEL_23;
        }
        uint64_t v10 = v14;
        if (v8 && v14)
        {
          BOOL v15 = [(NSString *)v8 isEqualToString:v14];

          if (!v15) {
            goto LABEL_22;
          }
          goto LABEL_19;
        }
LABEL_17:

        goto LABEL_22;
      }
    }
    BOOL v12 = 0;
  }
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_text];
  [v3 safelyAddObject:self->_altText];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_font - v4 + 32 * v4;
  unint64_t v6 = self->_textColor - v5 + 32 * v5;
  unint64_t v7 = self->_bold - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"text: '%@'; ", self->_text];
  [v3 appendFormat:@"altText: '%@'; ", self->_altText];
  unint64_t v4 = self->_font - 1;
  if (v4 > 9) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56F1538[v4];
  }
  [v3 appendFormat:@"font: '%@'; ", v5];
  unint64_t v6 = self->_textColor - 1;
  if (v6 > 2) {
    unint64_t v7 = @"unknown";
  }
  else {
    unint64_t v7 = off_1E56F1588[v6];
  }
  [v3 appendFormat:@"textColor: '%@'; ", v7];
  if (self->_bold) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v3 appendFormat:@"bold: '%@'; ", v8];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferDynamicContentCustomLayoutItemTextDetails;
  unint64_t v5 = [(PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altText"];
    altText = v5->_altText;
    v5->_altText = (NSString *)v8;

    v5->_font = [v4 decodeIntegerForKey:@"font"];
    v5->_textColor = [v4 decodeIntegerForKey:@"textColor"];
    v5->_bold = [v4 decodeBoolForKey:@"bold"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeObject:self->_altText forKey:@"altText"];
  [v5 encodeInteger:self->_font forKey:@"font"];
  [v5 encodeInteger:self->_textColor forKey:@"textColor"];
  [v5 encodeBool:self->_bold forKey:@"bold"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails allocWithZone:](PKPaymentOfferDynamicContentCustomLayoutItemTextDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_text copyWithZone:a3];
  text = v5->_text;
  v5->_text = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_altText copyWithZone:a3];
  altText = v5->_altText;
  v5->_altText = (NSString *)v8;

  v5->_font = self->_font;
  v5->_textColor = self->_textColor;
  v5->_bold = self->_bold;
  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)altText
{
  return self->_altText;
}

- (unint64_t)font
{
  return self->_font;
}

- (unint64_t)textColor
{
  return self->_textColor;
}

- (BOOL)isBold
{
  return self->_bold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end