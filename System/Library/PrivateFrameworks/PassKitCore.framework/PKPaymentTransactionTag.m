@interface PKPaymentTransactionTag
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)rank;
- (NSString)localeIdentifier;
- (NSString)localizedTitle;
- (PKPaymentTransactionTag)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setRank:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentTransactionTag

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  v6 = v5;
  v7 = v6;
  if (!v6 || self->_type != v6[1]) {
    goto LABEL_18;
  }
  rank = self->_rank;
  v9 = (NSDecimalNumber *)v7[4];
  if (rank && v9)
  {
    if ((-[NSDecimalNumber isEqual:](rank, "isEqual:") & 1) == 0) {
      goto LABEL_18;
    }
  }
  else if (rank != v9)
  {
    goto LABEL_18;
  }
  localeIdentifier = self->_localeIdentifier;
  v11 = (NSString *)v7[3];
  if (!localeIdentifier || !v11)
  {
    if (localeIdentifier == v11) {
      goto LABEL_14;
    }
LABEL_18:
    char v14 = 0;
    goto LABEL_19;
  }
  if ((-[NSString isEqual:](localeIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_18;
  }
LABEL_14:
  localizedTitle = self->_localizedTitle;
  v13 = (NSString *)v7[2];
  if (localizedTitle && v13) {
    char v14 = -[NSString isEqual:](localizedTitle, "isEqual:");
  }
  else {
    char v14 = localizedTitle == v13;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_rank];
  [v3 safelyAddObject:self->_localeIdentifier];
  [v3 safelyAddObject:self->_localizedTitle];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentTransactionTag;
  unint64_t v5 = [(PKPaymentTransactionTag *)&v13 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rank"];
    rank = v5->_rank;
    v5->_rank = (NSDecimalNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_localeIdentifier forKey:@"localeIdentifier"];
  [v5 encodeObject:self->_rank forKey:@"rank"];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSDecimalNumber)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end