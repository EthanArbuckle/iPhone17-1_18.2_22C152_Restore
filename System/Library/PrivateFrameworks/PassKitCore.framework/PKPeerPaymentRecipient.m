@interface PKPeerPaymentRecipient
+ (BOOL)supportsSecureCoding;
+ (PKPeerPaymentRecipient)recipientWithDictionary:(id)a3;
- (BOOL)allowsFormalPaymentRequests;
- (BOOL)isEqual:(id)a3;
- (NSDate)cacheUntil;
- (NSDecimalNumber)maximumReceiveAmount;
- (NSDecimalNumber)minimumReceiveAmount;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)phoneOrEmail;
- (NSString)receiveCurrency;
- (PKPeerPaymentRecipient)initWithCoder:(id)a3;
- (PKPeerPaymentRecipient)initWithDictionary:(id)a3;
- (id)cacheableCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)receiveMethod;
- (unint64_t)status;
- (unint64_t)statusReason;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsFormalPaymentRequests:(BOOL)a3;
- (void)setCacheUntil:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaximumReceiveAmount:(id)a3;
- (void)setMinimumReceiveAmount:(id)a3;
- (void)setPhoneOrEmail:(id)a3;
- (void)setReceiveCurrency:(id)a3;
- (void)setReceiveMethod:(unint64_t)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setStatusReason:(unint64_t)a3;
@end

@implementation PKPeerPaymentRecipient

+ (PKPeerPaymentRecipient)recipientWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return (PKPeerPaymentRecipient *)v5;
}

- (PKPeerPaymentRecipient)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPeerPaymentRecipient;
  v5 = [(PKPeerPaymentRecipient *)&v26 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"recipientStatus"];
    v5->_status = PKPeerPaymentRecipientStatusFromString(v6);

    v7 = [v4 PKStringForKey:@"recipientStatusReason"];
    v5->_statusReason = PKPeerPaymentRecipientStatusReasonFromString(v7);

    v8 = [v4 PKStringForKey:@"recipientIdentifier"];
    uint64_t v9 = [v8 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v9;

    v11 = [v4 PKStringForKey:@"receiveMethod"];
    v5->_receiveMethod = [@"iMessage" isEqualToString:v11];

    v12 = [v4 PKStringForKey:@"receiveCurrency"];
    uint64_t v13 = [v12 copy];
    receiveCurrency = v5->_receiveCurrency;
    v5->_receiveCurrency = (NSString *)v13;

    v15 = [v4 PKStringForKey:@"minimumReceiveAmount"];
    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v15];
      minimumReceiveAmount = v5->_minimumReceiveAmount;
      v5->_minimumReceiveAmount = (NSDecimalNumber *)v16;
    }
    else
    {
      minimumReceiveAmount = v5->_minimumReceiveAmount;
      v5->_minimumReceiveAmount = 0;
    }

    v18 = [v4 PKStringForKey:@"maximumReceiveAmount"];
    if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v18];
      maximumReceiveAmount = v5->_maximumReceiveAmount;
      v5->_maximumReceiveAmount = (NSDecimalNumber *)v19;
    }
    else
    {
      maximumReceiveAmount = v5->_maximumReceiveAmount;
      v5->_maximumReceiveAmount = 0;
    }

    v21 = [v4 PKNumberForKey:@"allowsFormalPaymentRequests"];
    v22 = v21;
    if (!v21) {
      v21 = (void *)MEMORY[0x1E4F1CC38];
    }
    v5->_allowsFormalPaymentRequests = [v21 BOOLValue];

    uint64_t v23 = [v4 PKDateForKey:@"cacheUntil"];
    cacheUntil = v5->_cacheUntil;
    v5->_cacheUntil = (NSDate *)v23;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 24) = self->_status;
  *(void *)(v5 + 32) = self->_statusReason;
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(void *)(v5 + 40) = self->_receiveMethod;
  uint64_t v8 = [(NSString *)self->_receiveCurrency copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_minimumReceiveAmount copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_maximumReceiveAmount copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  *(unsigned char *)(v5 + 8) = self->_allowsFormalPaymentRequests;
  uint64_t v14 = [(NSDate *)self->_cacheUntil copyWithZone:a3];
  v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  uint64_t v16 = [(NSString *)self->_phoneOrEmail copyWithZone:a3];
  v17 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v16;

  uint64_t v18 = [(NSString *)self->_displayName copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v18;

  return (id)v5;
}

- (id)cacheableCopy
{
  id v2 = [(PKPeerPaymentRecipient *)self copyWithZone:0];
  [v2 setPhoneOrEmail:0];
  [v2 setDisplayName:0];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecipient)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentRecipient;
  uint64_t v5 = [(PKPeerPaymentRecipient *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientStatus"];
    v5->_status = PKPeerPaymentRecipientStatusFromString(v6);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientStatusReason"];
    v5->_statusReason = PKPeerPaymentRecipientStatusReasonFromString(v7);

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v5->_receiveMethod = [v4 decodeIntegerForKey:@"receiveMethod"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiveCurrency"];
    receiveCurrency = v5->_receiveCurrency;
    v5->_receiveCurrency = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumReceiveAmount"];
    minimumReceiveAmount = v5->_minimumReceiveAmount;
    v5->_minimumReceiveAmount = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumReceiveAmount"];
    maximumReceiveAmount = v5->_maximumReceiveAmount;
    v5->_maximumReceiveAmount = (NSDecimalNumber *)v14;

    v5->_allowsFormalPaymentRequests = [v4 decodeBoolForKey:@"allowsFormalPaymentRequests"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cacheUntil"];
    cacheUntil = v5->_cacheUntil;
    v5->_cacheUntil = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneOrEmail"];
    phoneOrEmail = v5->_phoneOrEmail;
    v5->_phoneOrEmail = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v11 = a3;
  [v11 encodeObject:identifier forKey:@"recipientIdentifier"];
  unint64_t status = self->_status;
  uint64_t v6 = @"unknown";
  if (status == 2) {
    uint64_t v6 = @"invalid";
  }
  if (status == 1) {
    v7 = @"valid";
  }
  else {
    v7 = v6;
  }
  [v11 encodeObject:v7 forKey:@"recipientStatus"];
  unint64_t statusReason = self->_statusReason;
  uint64_t v9 = @"none";
  if (statusReason == 2) {
    uint64_t v9 = @"notInFamily";
  }
  if (statusReason == 1) {
    uint64_t v10 = @"accountClosed";
  }
  else {
    uint64_t v10 = v9;
  }
  [v11 encodeObject:v10 forKey:@"recipientStatusReason"];
  [v11 encodeInteger:self->_receiveMethod forKey:@"receiveMethod"];
  [v11 encodeObject:self->_receiveCurrency forKey:@"receiveCurrency"];
  [v11 encodeObject:self->_minimumReceiveAmount forKey:@"minimumReceiveAmount"];
  [v11 encodeObject:self->_maximumReceiveAmount forKey:@"maximumReceiveAmount"];
  [v11 encodeBool:self->_allowsFormalPaymentRequests forKey:@"allowsFormalPaymentRequests"];
  [v11 encodeObject:self->_cacheUntil forKey:@"cacheUntil"];
  [v11 encodeObject:self->_phoneOrEmail forKey:@"phoneOrEmail"];
  [v11 encodeObject:self->_displayName forKey:@"displayName"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_receiveCurrency];
  [v3 safelyAddObject:self->_minimumReceiveAmount];
  [v3 safelyAddObject:self->_maximumReceiveAmount];
  [v3 safelyAddObject:self->_cacheUntil];
  [v3 safelyAddObject:self->_phoneOrEmail];
  [v3 safelyAddObject:self->_displayName];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_status - v4 + 32 * v4;
  unint64_t v6 = self->_statusReason - v5 + 32 * v5;
  unint64_t v7 = self->_receiveMethod - v6 + 32 * v6;
  unint64_t v8 = self->_allowsFormalPaymentRequests - v7 + 32 * v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_41;
  }
  identifier = self->_identifier;
  unint64_t v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_41;
  }
  receiveCurrency = self->_receiveCurrency;
  unint64_t v8 = (NSString *)v4[6];
  if (receiveCurrency && v8)
  {
    if ((-[NSString isEqual:](receiveCurrency, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (receiveCurrency != v8)
  {
    goto LABEL_41;
  }
  minimumReceiveAmount = self->_minimumReceiveAmount;
  uint64_t v10 = (NSDecimalNumber *)v4[7];
  if (minimumReceiveAmount && v10)
  {
    if ((-[NSDecimalNumber isEqual:](minimumReceiveAmount, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (minimumReceiveAmount != v10)
  {
    goto LABEL_41;
  }
  maximumReceiveAmount = self->_maximumReceiveAmount;
  uint64_t v12 = (NSDecimalNumber *)v4[8];
  if (maximumReceiveAmount && v12)
  {
    if ((-[NSDecimalNumber isEqual:](maximumReceiveAmount, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (maximumReceiveAmount != v12)
  {
    goto LABEL_41;
  }
  cacheUntil = self->_cacheUntil;
  uint64_t v14 = (NSDate *)v4[9];
  if (cacheUntil && v14)
  {
    if ((-[NSDate isEqual:](cacheUntil, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (cacheUntil != v14)
  {
    goto LABEL_41;
  }
  phoneOrEmail = self->_phoneOrEmail;
  uint64_t v16 = (NSString *)v4[10];
  if (phoneOrEmail && v16)
  {
    if ((-[NSString isEqual:](phoneOrEmail, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (phoneOrEmail != v16)
  {
    goto LABEL_41;
  }
  displayName = self->_displayName;
  uint64_t v18 = (NSString *)v4[11];
  if (!displayName || !v18)
  {
    if (displayName == v18) {
      goto LABEL_37;
    }
LABEL_41:
    BOOL v19 = 0;
    goto LABEL_42;
  }
  if ((-[NSString isEqual:](displayName, "isEqual:") & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  if (self->_status != v4[3] || self->_statusReason != v4[4] || self->_receiveMethod != v4[5]) {
    goto LABEL_41;
  }
  BOOL v19 = self->_allowsFormalPaymentRequests == *((unsigned __int8 *)v4 + 8);
LABEL_42:

  return v19;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t status = self->_status;
  unint64_t v5 = @"invalid";
  if (status != 2) {
    unint64_t v5 = @"unknown";
  }
  if (status == 1) {
    unint64_t v6 = @"valid";
  }
  else {
    unint64_t v6 = v5;
  }
  [v3 appendFormat:@"status: '%@'; ", v6];
  unint64_t statusReason = self->_statusReason;
  unint64_t v8 = @"none";
  if (statusReason == 2) {
    unint64_t v8 = @"notInFamily";
  }
  if (statusReason == 1) {
    uint64_t v9 = @"accountClosed";
  }
  else {
    uint64_t v9 = v8;
  }
  [v3 appendFormat:@"statusReason: '%@'; ", v9];
  if (self->_receiveMethod == 1) {
    uint64_t v10 = @"iMessage";
  }
  else {
    uint64_t v10 = @"unknown";
  }
  [v3 appendFormat:@"receiveMethod: '%@'; ", v10];
  [v3 appendFormat:@"receiveCurrency: '%@'; ", self->_receiveCurrency];
  [v3 appendFormat:@"minimumReceiveAmount: '%@'; ", self->_minimumReceiveAmount];
  [v3 appendFormat:@"maximumReceiveAmount: '%@'; ", self->_maximumReceiveAmount];
  id v11 = [NSNumber numberWithBool:self->_allowsFormalPaymentRequests];
  [v3 appendFormat:@"allowsFormalPaymentRequests: '%@'; ", v11];

  [v3 appendFormat:@"cacheUntil: '%@'; ", self->_cacheUntil];
  [v3 appendFormat:@"phoneOrEmail: '%@'; ", self->_phoneOrEmail];
  [v3 appendFormat:@"displayName: '%@'; ", self->_displayName];
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

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_unint64_t status = a3;
}

- (unint64_t)statusReason
{
  return self->_statusReason;
}

- (void)setStatusReason:(unint64_t)a3
{
  self->_unint64_t statusReason = a3;
}

- (unint64_t)receiveMethod
{
  return self->_receiveMethod;
}

- (void)setReceiveMethod:(unint64_t)a3
{
  self->_receiveMethod = a3;
}

- (NSString)receiveCurrency
{
  return self->_receiveCurrency;
}

- (void)setReceiveCurrency:(id)a3
{
}

- (NSDecimalNumber)minimumReceiveAmount
{
  return self->_minimumReceiveAmount;
}

- (void)setMinimumReceiveAmount:(id)a3
{
}

- (NSDecimalNumber)maximumReceiveAmount
{
  return self->_maximumReceiveAmount;
}

- (void)setMaximumReceiveAmount:(id)a3
{
}

- (BOOL)allowsFormalPaymentRequests
{
  return self->_allowsFormalPaymentRequests;
}

- (void)setAllowsFormalPaymentRequests:(BOOL)a3
{
  self->_allowsFormalPaymentRequests = a3;
}

- (NSDate)cacheUntil
{
  return self->_cacheUntil;
}

- (void)setCacheUntil:(id)a3
{
}

- (NSString)phoneOrEmail
{
  return self->_phoneOrEmail;
}

- (void)setPhoneOrEmail:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_phoneOrEmail, 0);
  objc_storeStrong((id *)&self->_cacheUntil, 0);
  objc_storeStrong((id *)&self->_maximumReceiveAmount, 0);
  objc_storeStrong((id *)&self->_minimumReceiveAmount, 0);
  objc_storeStrong((id *)&self->_receiveCurrency, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end