@interface PKPeerPaymentRecurringPaymentFundingSource
+ (BOOL)supportsSecureCoding;
+ (id)fundingSourceWithDictionary:(id)a3;
+ (id)fundingSourceWithPass:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)dpanIdentifier;
- (NSString)fpanIdentifier;
- (NSString)mpanIdentifier;
- (NSString)name;
- (NSString)suffix;
- (PKPeerPaymentRecurringPaymentFundingSource)initWithCoder:(id)a3;
- (PKPeerPaymentRecurringPaymentFundingSource)initWithDictionary:(id)a3;
- (PKPeerPaymentRecurringPaymentFundingSource)initWithPass:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)network;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDPANIdentifier:(id)a3;
- (void)setFPANIdentifier:(id)a3;
- (void)setMPANIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setNetwork:(int64_t)a3;
- (void)setSuffix:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPeerPaymentRecurringPaymentFundingSource

+ (id)fundingSourceWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (PKPeerPaymentRecurringPaymentFundingSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentRecurringPaymentFundingSource;
  v5 = [(PKPeerPaymentRecurringPaymentFundingSource *)&v22 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"dpanIdentifier"];
    uint64_t v7 = [v6 copy];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v7;

    v9 = [v4 PKStringForKey:@"fpanIdentifier"];
    uint64_t v10 = [v9 copy];
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v10;

    v12 = [v4 PKStringForKey:@"mpanIdentifier"];
    uint64_t v13 = [v12 copy];
    mpanIdentifier = v5->_mpanIdentifier;
    v5->_mpanIdentifier = (NSString *)v13;

    v15 = [v4 PKStringForKey:@"name"];
    uint64_t v16 = [v15 copy];
    name = v5->_name;
    v5->_name = (NSString *)v16;

    v5->_type = [v4 PKIntegerForKey:@"type"];
    v5->_network = [v4 PKIntegerForKey:@"network"];
    v18 = [v4 PKStringForKey:@"suffix"];
    uint64_t v19 = [v18 copy];
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v19;
  }
  return v5;
}

+ (id)fundingSourceWithPass:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPass:v4];

  return v5;
}

- (PKPeerPaymentRecurringPaymentFundingSource)initWithPass:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentRecurringPaymentFundingSource;
  v5 = [(PKPeerPaymentRecurringPaymentFundingSource *)&v16 init];
  if (v5)
  {
    v6 = [v4 devicePrimaryInAppPaymentApplication];
    uint64_t v7 = [v6 dpanIdentifier];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 primaryAccountIdentifier];
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 localizedDescription];
    name = v5->_name;
    v5->_name = (NSString *)v11;

    v5->_type = [v6 paymentType];
    v5->_network = [v6 paymentNetworkIdentifier];
    uint64_t v13 = [v4 primaryAccountNumberSuffix];
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecurringPaymentFundingSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentRecurringPaymentFundingSource;
  v5 = [(PKPeerPaymentRecurringPaymentFundingSource *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpanIdentifier"];
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mpanIdentifier"];
    mpanIdentifier = v5->_mpanIdentifier;
    v5->_mpanIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v12;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_network = [v4 decodeIntegerForKey:@"network"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suffix"];
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dpanIdentifier = self->_dpanIdentifier;
  id v5 = a3;
  [v5 encodeObject:dpanIdentifier forKey:@"dpanIdentifier"];
  [v5 encodeObject:self->_fpanIdentifier forKey:@"fpanIdentifier"];
  [v5 encodeObject:self->_mpanIdentifier forKey:@"mpanIdentifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_network forKey:@"network"];
  [v5 encodeObject:self->_suffix forKey:@"suffix"];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_dpanIdentifier];
  [v3 safelyAddObject:self->_fpanIdentifier];
  [v3 safelyAddObject:self->_mpanIdentifier];
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_suffix];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_network - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_29;
  }
  dpanIdentifier = self->_dpanIdentifier;
  unint64_t v6 = (NSString *)v4[1];
  if (dpanIdentifier && v6)
  {
    if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (dpanIdentifier != v6)
  {
    goto LABEL_29;
  }
  fpanIdentifier = self->_fpanIdentifier;
  uint64_t v8 = (NSString *)v4[2];
  if (fpanIdentifier && v8)
  {
    if ((-[NSString isEqual:](fpanIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (fpanIdentifier != v8)
  {
    goto LABEL_29;
  }
  mpanIdentifier = self->_mpanIdentifier;
  uint64_t v10 = (NSString *)v4[3];
  if (mpanIdentifier && v10)
  {
    if ((-[NSString isEqual:](mpanIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (mpanIdentifier != v10)
  {
    goto LABEL_29;
  }
  name = self->_name;
  uint64_t v12 = (NSString *)v4[4];
  if (name && v12)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (name != v12)
  {
    goto LABEL_29;
  }
  suffix = self->_suffix;
  uint64_t v14 = (NSString *)v4[7];
  if (!suffix || !v14)
  {
    if (suffix == v14) {
      goto LABEL_27;
    }
LABEL_29:
    BOOL v15 = 0;
    goto LABEL_30;
  }
  if ((-[NSString isEqual:](suffix, "isEqual:") & 1) == 0) {
    goto LABEL_29;
  }
LABEL_27:
  if (self->_type != v4[5]) {
    goto LABEL_29;
  }
  BOOL v15 = self->_network == v4[6];
LABEL_30:

  return v15;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"dpanIdentifier: '%@'; ", self->_dpanIdentifier];
  [v3 appendFormat:@"fpanIdentifier: '%@'; ", self->_fpanIdentifier];
  [v3 appendFormat:@"mpanIdentifier: '%@'; ", self->_mpanIdentifier];
  [v3 appendFormat:@"cardName: '%@'; ", self->_name];
  objc_msgSend(v3, "appendFormat:", @"cardType: '%ld'; ", self->_type);
  objc_msgSend(v3, "appendFormat:", @"cardNetwork: '%ld'; ", self->_network);
  [v3 appendFormat:@"cardSuffix: '%@'; ", self->_suffix];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKPeerPaymentRecurringPaymentFundingSource allocWithZone:](PKPeerPaymentRecurringPaymentFundingSource, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_dpanIdentifier copyWithZone:a3];
  dpanIdentifier = v5->_dpanIdentifier;
  v5->_dpanIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_fpanIdentifier copyWithZone:a3];
  fpanIdentifier = v5->_fpanIdentifier;
  v5->_fpanIdentifier = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_mpanIdentifier copyWithZone:a3];
  mpanIdentifier = v5->_mpanIdentifier;
  v5->_mpanIdentifier = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_name copyWithZone:a3];
  name = v5->_name;
  v5->_name = (NSString *)v12;

  v5->_type = self->_type;
  v5->_network = self->_network;
  uint64_t v14 = [(NSString *)self->_suffix copyWithZone:a3];
  suffix = v5->_suffix;
  v5->_suffix = (NSString *)v14;

  return v5;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFPANIdentifier:(id)a3
{
}

- (NSString)mpanIdentifier
{
  return self->_mpanIdentifier;
}

- (void)setMPANIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
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

- (int64_t)network
{
  return self->_network;
}

- (void)setNetwork:(int64_t)a3
{
  self->_network = a3;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mpanIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end