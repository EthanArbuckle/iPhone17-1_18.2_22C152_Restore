@interface PKPeerPaymentRequestToken
+ (BOOL)supportsSecureCoding;
+ (id)informalRequestToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerPaymentRequestToken:(id)a3;
- (BOOL)isInformalRequestToken;
- (NSDate)expiryDate;
- (NSString)requestToken;
- (NSUUID)deviceScoreIdentifier;
- (PKPeerPaymentRequestToken)initWithCoder:(id)a3;
- (PKPeerPaymentRequestToken)initWithRequestToken:(id)a3 deviceScoreIdentifier:(id)a4;
- (PKPeerPaymentRequestToken)initWithRequestToken:(id)a3 deviceScoreIdentifier:(id)a4 expiryDate:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPeerPaymentRequestToken

- (PKPeerPaymentRequestToken)initWithRequestToken:(id)a3 deviceScoreIdentifier:(id)a4
{
  return [(PKPeerPaymentRequestToken *)self initWithRequestToken:a3 deviceScoreIdentifier:a4 expiryDate:0];
}

- (PKPeerPaymentRequestToken)initWithRequestToken:(id)a3 deviceScoreIdentifier:(id)a4 expiryDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if ([v8 isEqualToString:@"PKPeerPaymentInformalRequestToken"])
    {

      v11 = [(id)objc_opt_class() informalRequestToken];
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)PKPeerPaymentRequestToken;
      v11 = [(PKPeerPaymentRequestToken *)&v19 init];
      if (v11)
      {
        uint64_t v12 = [v8 copy];
        requestToken = v11->_requestToken;
        v11->_requestToken = (NSString *)v12;

        uint64_t v14 = [v9 copy];
        deviceScoreIdentifier = v11->_deviceScoreIdentifier;
        v11->_deviceScoreIdentifier = (NSUUID *)v14;

        uint64_t v16 = [v10 copy];
        expiryDate = v11->_expiryDate;
        v11->_expiryDate = (NSDate *)v16;
      }
    }
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

+ (id)informalRequestToken
{
  if (qword_1EB402C58 != -1) {
    dispatch_once(&qword_1EB402C58, &__block_literal_global_46);
  }
  v2 = (void *)_MergedGlobals_208;
  return v2;
}

void __49__PKPeerPaymentRequestToken_informalRequestToken__block_invoke()
{
  v0 = [[PKPeerPaymentRequestToken alloc] initWithRequestToken:@"PKPeerPaymentInformalRequestToken" deviceScoreIdentifier:0 expiryDate:0];
  v1 = (void *)_MergedGlobals_208;
  _MergedGlobals_208 = (uint64_t)v0;
}

- (BOOL)isEqualToPeerPaymentRequestToken:(id)a3
{
  v4 = a3;
  requestToken = self->_requestToken;
  v6 = (NSString *)v4[1];
  if (requestToken) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (requestToken != v6) {
      goto LABEL_16;
    }
  }
  else if ((-[NSString isEqual:](requestToken, "isEqual:") & 1) == 0)
  {
    goto LABEL_16;
  }
  deviceScoreIdentifier = self->_deviceScoreIdentifier;
  id v9 = (NSUUID *)v4[2];
  if (!deviceScoreIdentifier || !v9)
  {
    if (deviceScoreIdentifier == v9) {
      goto LABEL_12;
    }
LABEL_16:
    char v12 = 0;
    goto LABEL_17;
  }
  if ((-[NSUUID isEqual:](deviceScoreIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_16;
  }
LABEL_12:
  expiryDate = self->_expiryDate;
  v11 = (NSDate *)v4[3];
  if (expiryDate && v11) {
    char v12 = -[NSDate isEqual:](expiryDate, "isEqual:");
  }
  else {
    char v12 = expiryDate == v11;
  }
LABEL_17:

  return v12;
}

- (BOOL)isInformalRequestToken
{
  v3 = +[PKPeerPaymentRequestToken informalRequestToken];
  LOBYTE(self) = v3 == self;

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRequestToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentRequestToken;
  v5 = [(PKPeerPaymentRequestToken *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestToken"];
    requestToken = v5->_requestToken;
    v5->_requestToken = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceScoreIdentifier"];
    deviceScoreIdentifier = v5->_deviceScoreIdentifier;
    v5->_deviceScoreIdentifier = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  requestToken = self->_requestToken;
  id v5 = a3;
  [v5 encodeObject:requestToken forKey:@"requestToken"];
  [v5 encodeObject:self->_deviceScoreIdentifier forKey:@"deviceScoreIdentifier"];
  [v5 encodeObject:self->_expiryDate forKey:@"expiryDate"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"requestToken: '%@'; ", self->_requestToken];
  [v6 appendFormat:@"deviceScoreIdentifier: '%@'; ", self->_deviceScoreIdentifier];
  [v6 appendFormat:@"expiryDate: '%@'; ", self->_expiryDate];
  [v6 appendFormat:@">"];
  BOOL v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_requestToken) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_deviceScoreIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_expiryDate) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPeerPaymentRequestToken *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPeerPaymentRequestToken *)self isEqualToPeerPaymentRequestToken:v5];

  return v6;
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (NSUUID)deviceScoreIdentifier
{
  return self->_deviceScoreIdentifier;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_deviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
}

@end