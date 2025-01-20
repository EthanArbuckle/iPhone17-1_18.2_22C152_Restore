@interface PKAccountTaxForm
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)closingDate;
- (NSDate)openingDate;
- (NSString)identifier;
- (PKAccountTaxForm)initWithCoder:(id)a3;
- (PKAccountTaxForm)initWithDictionary:(id)a3;
- (id)description;
- (id)displayableTaxFormString;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setClosingDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOpeningDate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountTaxForm

- (PKAccountTaxForm)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKAccountTaxForm;
  v5 = [(PKAccountTaxForm *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"taxFormType"];
    v9 = v8;
    if (v8 != @"1099-int")
    {
      if (v8)
      {
        char v10 = [(__CFString *)v8 isEqualToString:@"1099-int"];

        if (v10) {
          goto LABEL_5;
        }
        v12 = v9;
        if (v12 == @"1099-div"
          || (v13 = v12,
              char v14 = [(__CFString *)v12 isEqualToString:@"1099-div"],
              v13,
              (v14 & 1) != 0))
        {
          uint64_t v11 = 2;
          goto LABEL_19;
        }
        v15 = v13;
        if (v15 == @"1099-b"
          || (v16 = v15,
              char v17 = [(__CFString *)v15 isEqualToString:@"1099-b"],
              v16,
              (v17 & 1) != 0))
        {
          uint64_t v11 = 3;
          goto LABEL_19;
        }
        v18 = v16;
        if (v18 == @"1099-misc"
          || (v19 = v18,
              char v20 = [(__CFString *)v18 isEqualToString:@"1099-misc"],
              v19,
              (v20 & 1) != 0))
        {
          uint64_t v11 = 4;
          goto LABEL_19;
        }
        v21 = v19;
        if (v21 == @"1099-consolidated"
          || (v22 = v21,
              int v23 = [(__CFString *)v21 isEqualToString:@"1099-consolidated"],
              v22,
              v23))
        {
          uint64_t v11 = 5;
          goto LABEL_19;
        }
      }
      uint64_t v11 = 0;
      goto LABEL_19;
    }
LABEL_5:
    uint64_t v11 = 1;
LABEL_19:

    v5->_type = v11;
    uint64_t v24 = [v4 PKDateForKey:@"openingDate"];
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v24;

    uint64_t v26 = [v4 PKDateForKey:@"closingDate"];
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v26;
  }
  return v5;
}

- (id)displayableTaxFormString
{
  unint64_t v7 = self->_type - 1;
  if (v7 > 4)
  {
    v8 = 0;
  }
  else
  {
    v8 = PKLocalizedFeatureString(off_1E56EC8F0[v7], 5, 0, v2, v3, v4, v5, v6, vars0);
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountTaxForm)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountTaxForm;
  uint64_t v5 = [(PKAccountTaxForm *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"taxFormType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openingDate"];
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"closingDate"];
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_type forKey:@"taxFormType"];
  [v5 encodeObject:self->_openingDate forKey:@"openingDate"];
  [v5 encodeObject:self->_closingDate forKey:@"closingDate"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  identifier = self->_identifier;
  uint64_t v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_15;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_15;
  }
  if (self->_type != v4[2]) {
    goto LABEL_15;
  }
  openingDate = self->_openingDate;
  uint64_t v8 = (NSDate *)v4[3];
  if (!openingDate || !v8)
  {
    if (openingDate == v8) {
      goto LABEL_11;
    }
LABEL_15:
    char v11 = 0;
    goto LABEL_16;
  }
  if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  closingDate = self->_closingDate;
  uint64_t v10 = (NSDate *)v4[4];
  if (closingDate && v10) {
    char v11 = -[NSDate isEqual:](closingDate, "isEqual:");
  }
  else {
    char v11 = closingDate == v10;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = self->_type + 527;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [v4 safelyAddObject:self->_identifier];
  [v4 safelyAddObject:self->_openingDate];
  [v4 safelyAddObject:self->_closingDate];
  unint64_t v5 = PKCombinedHash(v3, v4);

  return v5;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t v4 = self->_type - 1;
  if (v4 > 4) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56EC918[v4];
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  uint64_t v6 = [(NSDate *)self->_openingDate description];
  [v3 appendFormat:@"openingDate: '%@'; ", v6];

  unint64_t v7 = [(NSDate *)self->_closingDate description];
  [v3 appendFormat:@"closingDate: '%@'; ", v7];

  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (void)setOpeningDate:(id)a3
{
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (void)setClosingDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end