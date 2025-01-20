@interface PKPeerPaymentPurchaseData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPKPeerPaymentPurchaseData:(id)a3;
- (BOOL)requiresInteraction;
- (PKPeerPaymentPurchaseData)initWithCoder:(id)a3;
- (PKPeerPaymentPurchaseData)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setRequiresInteraction:(BOOL)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation PKPeerPaymentPurchaseData

- (PKPeerPaymentPurchaseData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentPurchaseData;
  v5 = [(PKServiceProviderPurchaseData *)&v8 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"status"];
    v5->_status = PKPeerPaymentPurchaseDataStatusFromString(v6);

    v5->_requiresInteraction = [v4 PKBoolForKey:@"requiresInteraction"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPurchaseData)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentPurchaseData;
  v5 = [(PKPeerPaymentPurchaseData *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    v5->_status = PKPeerPaymentPurchaseDataStatusFromString(v6);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiresInteraction"];
    v5->_requiresInteraction = [v7 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4 = self->_status - 1;
  if (v4 > 5) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E56E57D8[v4];
  }
  id v6 = a3;
  [v6 encodeObject:v5 forKey:@"status"];
  id v7 = [NSNumber numberWithBool:self->_requiresInteraction];
  [v6 encodeObject:v7 forKey:@"requiresInteraction"];
}

- (unint64_t)hash
{
  return self->_requiresInteraction - self->_status + 32 * self->_status + 16337;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(PKPeerPaymentPurchaseData *)self isEqualToPKPeerPaymentPurchaseData:v4];

  return v5;
}

- (BOOL)isEqualToPKPeerPaymentPurchaseData:(id)a3
{
  id v4 = (PKPeerPaymentPurchaseData *)a3;
  BOOL v5 = self == v4 || self->_status == v4->_status && self->_requiresInteraction == v4->_requiresInteraction;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  BOOL v5 = @"pending";
  switch(self->_status)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      BOOL v5 = @"complete";
      goto LABEL_8;
    case 3uLL:
      BOOL v5 = @"rejected";
      goto LABEL_8;
    case 4uLL:
      BOOL v5 = @"canceled";
      goto LABEL_8;
    case 5uLL:
      BOOL v5 = @"expired";
      goto LABEL_8;
    case 6uLL:
      BOOL v5 = @"failed";
      goto LABEL_8;
    default:
      BOOL v5 = @"unknown";
LABEL_8:
      [v3 appendFormat:@"status: '%@'; ", v5];
LABEL_9:
      if (self->_requiresInteraction) {
        [v4 appendFormat:@"requiredInteraction: '%@'; ", @"YES"];
      }
      [v4 appendFormat:@">"];
      return v4;
  }
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (BOOL)requiresInteraction
{
  return self->_requiresInteraction;
}

- (void)setRequiresInteraction:(BOOL)a3
{
  self->_requiresInteraction = a3;
}

@end