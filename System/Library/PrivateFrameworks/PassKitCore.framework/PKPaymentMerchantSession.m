@interface PKPaymentMerchantSession
+ (BOOL)supportsSecureCoding;
+ (PKPaymentMerchantSession)paymentMerchantSessionWithProtobuf:(id)a3;
+ (int64_t)version;
- (BOOL)_isModern;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPaymentMerchantSession:(id)a3;
- (BOOL)supportsURL:(id)a3;
- (NSArray)signedFields;
- (NSData)ampEnrollmentPinning;
- (NSData)signature;
- (NSString)displayName;
- (NSString)domain;
- (NSString)initiative;
- (NSString)initiativeContext;
- (NSString)merchantIdentifier;
- (NSString)merchantSessionIdentifier;
- (NSString)nonce;
- (NSString)operationalAnalyticsIdentifier;
- (NSString)retryNonce;
- (PKPaymentMerchantSession)init;
- (PKPaymentMerchantSession)initWithCoder:(id)a3;
- (PKPaymentMerchantSession)initWithDictionary:(NSDictionary *)dictionary;
- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 domain:(id)a7 displayName:(id)a8 signature:(id)a9;
- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 expiresAt:(unint64_t)a7 displayName:(id)a8 initiativeContext:(id)a9 initiative:(id)a10 ampEnrollmentPinning:(id)a11 operationalAnalyticsIdentifier:(id)a12 signedFields:(id)a13 signature:(id)a14;
- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 expiresAt:(unint64_t)a7 displayName:(id)a8 initiativeContext:(id)a9 initiative:(id)a10 signedFields:(id)a11 signature:(id)a12;
- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 expiresAt:(unint64_t)a7 domain:(id)a8 displayName:(id)a9 operationalAnalyticsIdentifier:(id)a10 signature:(id)a11;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protobuf;
- (id)signedData;
- (unint64_t)epochTimestamp;
- (unint64_t)expiresAt;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRetryNonce:(id)a3;
@end

@implementation PKPaymentMerchantSession

+ (int64_t)version
{
  return 4;
}

- (PKPaymentMerchantSession)init
{
  v3 = [MEMORY[0x1E4F1C9B8] data];
  v4 = [(PKPaymentMerchantSession *)self initWithMerchantIdentifier:&stru_1EE0F5368 merchantSessionIdentifier:&stru_1EE0F5368 nonce:&stru_1EE0F5368 epochTimestamp:0 domain:&stru_1EE0F5368 displayName:&stru_1EE0F5368 signature:v3];

  return v4;
}

- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 domain:(id)a7 displayName:(id)a8 signature:(id)a9
{
  return [(PKPaymentMerchantSession *)self initWithMerchantIdentifier:a3 merchantSessionIdentifier:a4 nonce:a5 epochTimestamp:a6 expiresAt:0 domain:a7 displayName:a8 operationalAnalyticsIdentifier:0 signature:a9];
}

- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 expiresAt:(unint64_t)a7 domain:(id)a8 displayName:(id)a9 operationalAnalyticsIdentifier:(id)a10 signature:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v40.receiver = self;
  v40.super_class = (Class)PKPaymentMerchantSession;
  v24 = [(PKPaymentMerchantSession *)&v40 init];
  if (v24)
  {
    uint64_t v25 = [v17 copy];
    merchantIdentifier = v24->_merchantIdentifier;
    v24->_merchantIdentifier = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    merchantSessionIdentifier = v24->_merchantSessionIdentifier;
    v24->_merchantSessionIdentifier = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    nonce = v24->_nonce;
    v24->_nonce = (NSString *)v29;

    v24->_epochTimestamp = a6;
    v24->_expiresAt = a7;
    uint64_t v31 = [v20 copy];
    domain = v24->_domain;
    v24->_domain = (NSString *)v31;

    uint64_t v33 = [v21 copy];
    displayName = v24->_displayName;
    v24->_displayName = (NSString *)v33;

    uint64_t v35 = [v22 copy];
    operationalAnalyticsIdentifier = v24->_operationalAnalyticsIdentifier;
    v24->_operationalAnalyticsIdentifier = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    signature = v24->_signature;
    v24->_signature = (NSData *)v37;
  }
  return v24;
}

- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 expiresAt:(unint64_t)a7 displayName:(id)a8 initiativeContext:(id)a9 initiative:(id)a10 signedFields:(id)a11 signature:(id)a12
{
  return [(PKPaymentMerchantSession *)self initWithMerchantIdentifier:a3 merchantSessionIdentifier:a4 nonce:a5 epochTimestamp:a6 expiresAt:a7 displayName:a8 initiativeContext:a9 initiative:a10 ampEnrollmentPinning:0 operationalAnalyticsIdentifier:0 signedFields:a11 signature:a12];
}

- (PKPaymentMerchantSession)initWithMerchantIdentifier:(id)a3 merchantSessionIdentifier:(id)a4 nonce:(id)a5 epochTimestamp:(unint64_t)a6 expiresAt:(unint64_t)a7 displayName:(id)a8 initiativeContext:(id)a9 initiative:(id)a10 ampEnrollmentPinning:(id)a11 operationalAnalyticsIdentifier:(id)a12 signedFields:(id)a13 signature:(id)a14
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v53 = a8;
  id v20 = v18;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  v54.receiver = self;
  v54.super_class = (Class)PKPaymentMerchantSession;
  uint64_t v27 = [(PKPaymentMerchantSession *)&v54 init];
  v28 = v27;
  if (v27)
  {
    v27->_epochTimestamp = a6;
    v27->_expiresAt = a7;
    uint64_t v29 = [v20 copy];
    merchantSessionIdentifier = v28->_merchantSessionIdentifier;
    v28->_merchantSessionIdentifier = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    nonce = v28->_nonce;
    v28->_nonce = (NSString *)v31;

    uint64_t v33 = [v17 copy];
    merchantIdentifier = v28->_merchantIdentifier;
    v28->_merchantIdentifier = (NSString *)v33;

    uint64_t v35 = [v53 copy];
    displayName = v28->_displayName;
    v28->_displayName = (NSString *)v35;

    uint64_t v37 = [v21 copy];
    initiativeContext = v28->_initiativeContext;
    v28->_initiativeContext = (NSString *)v37;

    uint64_t v39 = [v22 copy];
    initiative = v28->_initiative;
    v28->_initiative = (NSString *)v39;

    uint64_t v41 = [v23 copy];
    ampEnrollmentPinning = v28->_ampEnrollmentPinning;
    v28->_ampEnrollmentPinning = (NSData *)v41;

    uint64_t v43 = [v24 copy];
    operationalAnalyticsIdentifier = v28->_operationalAnalyticsIdentifier;
    v28->_operationalAnalyticsIdentifier = (NSString *)v43;

    uint64_t v45 = [v25 copy];
    signedFields = v28->_signedFields;
    v28->_signedFields = (NSArray *)v45;

    uint64_t v47 = [v26 copy];
    signature = v28->_signature;
    v28->_signature = (NSData *)v47;
  }
  return v28;
}

- (PKPaymentMerchantSession)initWithDictionary:(NSDictionary *)dictionary
{
  v3 = dictionary;
  v4 = [(NSDictionary *)v3 PKStringForKey:@"initiative"];

  v5 = [(NSDictionary *)v3 PKStringForKey:@"merchantIdentifier"];
  v6 = [(NSDictionary *)v3 PKStringForKey:@"merchantSessionIdentifier"];
  v7 = [(NSDictionary *)v3 PKStringForKey:@"nonce"];
  v8 = [(NSDictionary *)v3 PKNumberForKey:@"epochTimestamp"];
  uint64_t v9 = [v8 unsignedIntegerValue];
  v10 = [(NSDictionary *)v3 PKNumberForKey:@"expiresAt"];
  uint64_t v34 = [v10 unsignedIntegerValue];
  if (v4)
  {
    uint64_t v28 = [(NSDictionary *)v3 PKStringForKey:@"displayName"];
    uint64_t v27 = [(NSDictionary *)v3 PKStringForKey:@"initiativeContext"];
    uint64_t v11 = [(NSDictionary *)v3 PKStringForKey:@"initiative"];
    uint64_t v33 = [(NSDictionary *)v3 PKStringForKey:@"ampEnrollmentPinning"];
    v12 = objc_msgSend(v33, "pk_decodeHexadecimal");
    [(NSDictionary *)v3 PKStringForKey:@"operationalAnalyticsIdentifier"];
    v13 = uint64_t v31 = v7;
    [(NSDictionary *)v3 PKArrayContaining:objc_opt_class() forKey:@"signedFields"];
    v30 = v8;
    v15 = v14 = v5;
    [(NSDictionary *)v3 PKStringForKey:@"signature"];
    uint64_t v29 = v10;
    id v17 = v16 = v6;

    id v18 = objc_msgSend(v17, "pk_decodeHexadecimal");
    uint64_t v35 = (void *)v11;
    id v19 = (void *)v27;
    uint64_t v26 = v11;
    id v20 = (void *)v28;
    id v21 = [(PKPaymentMerchantSession *)self initWithMerchantIdentifier:v14 merchantSessionIdentifier:v16 nonce:v31 epochTimestamp:v9 expiresAt:v34 displayName:v28 initiativeContext:v27 initiative:v26 ampEnrollmentPinning:v12 operationalAnalyticsIdentifier:v13 signedFields:v15 signature:v18];

    v6 = v16;
    v10 = v29;

    v5 = v14;
    v8 = v30;

    v7 = v31;
  }
  else
  {
    id v20 = [(NSDictionary *)v3 PKStringForKey:@"domainName"];
    [(NSDictionary *)v3 PKStringForKey:@"displayName"];
    uint64_t v22 = v32 = v9;
    uint64_t v23 = [(NSDictionary *)v3 PKStringForKey:@"operationalAnalyticsIdentifier"];
    id v24 = [(NSDictionary *)v3 PKStringForKey:@"signature"];

    id v19 = (void *)v22;
    uint64_t v33 = v24;
    v12 = objc_msgSend(v24, "pk_decodeHexadecimal");
    uint64_t v35 = (void *)v23;
    id v21 = [(PKPaymentMerchantSession *)self initWithMerchantIdentifier:v5 merchantSessionIdentifier:v6 nonce:v7 epochTimestamp:v32 expiresAt:v34 domain:v20 displayName:v22 operationalAnalyticsIdentifier:v23 signature:v12];
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  merchantIdentifier = self->_merchantIdentifier;
  id v7 = a3;
  [v7 encodeObject:merchantIdentifier forKey:@"merchantIdentifier"];
  [v7 encodeObject:self->_merchantSessionIdentifier forKey:@"merchantSessionIdentifier"];
  [v7 encodeObject:self->_nonce forKey:@"nonce"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_epochTimestamp];
  [v7 encodeObject:v5 forKey:@"epochTimestamp"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_expiresAt];
  [v7 encodeObject:v6 forKey:@"expiresAt"];

  [v7 encodeObject:self->_domain forKey:@"domainName"];
  [v7 encodeObject:self->_displayName forKey:@"displayName"];
  [v7 encodeObject:self->_signature forKey:@"signature"];
  [v7 encodeObject:self->_retryNonce forKey:@"retryNonce"];
  [v7 encodeObject:self->_initiativeContext forKey:@"initiativeContext"];
  [v7 encodeObject:self->_initiative forKey:@"initiative"];
  [v7 encodeObject:self->_ampEnrollmentPinning forKey:@"ampEnrollmentPinning"];
  [v7 encodeObject:self->_operationalAnalyticsIdentifier forKey:@"operationalAnalyticsIdentifier"];
  [v7 encodeObject:self->_signedFields forKey:@"signedFields"];
}

- (PKPaymentMerchantSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKPaymentMerchantSession;
  v5 = [(PKPaymentMerchantSession *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantSessionIdentifier"];
    merchantSessionIdentifier = v5->_merchantSessionIdentifier;
    v5->_merchantSessionIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"epochTimestamp"];
    v5->_epochTimestamp = [v12 unsignedIntegerValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiresAt"];
    v5->_expiresAt = [v13 unsignedIntegerValue];

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainName"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"retryNonce"];
    retryNonce = v5->_retryNonce;
    v5->_retryNonce = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initiative"];
    initiative = v5->_initiative;
    v5->_initiative = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initiativeContext"];
    initiativeContext = v5->_initiativeContext;
    v5->_initiativeContext = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ampEnrollmentPinning"];
    ampEnrollmentPinning = v5->_ampEnrollmentPinning;
    v5->_ampEnrollmentPinning = (NSData *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationalAnalyticsIdentifier"];
    operationalAnalyticsIdentifier = v5->_operationalAnalyticsIdentifier;
    v5->_operationalAnalyticsIdentifier = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"signedFields"];
    signedFields = v5->_signedFields;
    v5->_signedFields = (NSArray *)v33;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"merchantSessionIdentifier: %@", self->_merchantSessionIdentifier];
  if (self->_initiative) {
    [v3 appendFormat:@", initiative: %@", self->_initiative];
  }
  if (self->_ampEnrollmentPinning) {
    [v3 appendFormat:@", ampEnrollmentPinning: %@", self->_ampEnrollmentPinning];
  }
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKPaymentMerchantSession allocWithZone:](PKPaymentMerchantSession, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_merchantIdentifier copyWithZone:a3];
  merchantIdentifier = v5->_merchantIdentifier;
  v5->_merchantIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_merchantSessionIdentifier copyWithZone:a3];
  merchantSessionIdentifier = v5->_merchantSessionIdentifier;
  v5->_merchantSessionIdentifier = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_nonce copyWithZone:a3];
  nonce = v5->_nonce;
  v5->_nonce = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_domain copyWithZone:a3];
  domain = v5->_domain;
  v5->_domain = (NSString *)v12;

  v5->_epochTimestamp = self->_epochTimestamp;
  v5->_expiresAt = self->_expiresAt;
  uint64_t v14 = [(NSString *)self->_displayName copyWithZone:a3];
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v14;

  uint64_t v16 = [(NSData *)self->_signature copyWithZone:a3];
  signature = v5->_signature;
  v5->_signature = (NSData *)v16;

  uint64_t v18 = [(NSString *)self->_retryNonce copyWithZone:a3];
  retryNonce = v5->_retryNonce;
  v5->_retryNonce = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_initiative copyWithZone:a3];
  initiative = v5->_initiative;
  v5->_initiative = (NSString *)v20;

  uint64_t v22 = [(NSString *)self->_initiativeContext copyWithZone:a3];
  initiativeContext = v5->_initiativeContext;
  v5->_initiativeContext = (NSString *)v22;

  uint64_t v24 = [(NSData *)self->_ampEnrollmentPinning copyWithZone:a3];
  ampEnrollmentPinning = v5->_ampEnrollmentPinning;
  v5->_ampEnrollmentPinning = (NSData *)v24;

  uint64_t v26 = [(NSString *)self->_operationalAnalyticsIdentifier copyWithZone:a3];
  operationalAnalyticsIdentifier = v5->_operationalAnalyticsIdentifier;
  v5->_operationalAnalyticsIdentifier = (NSString *)v26;

  uint64_t v28 = [(NSArray *)self->_signedFields copyWithZone:a3];
  signedFields = v5->_signedFields;
  v5->_signedFields = (NSArray *)v28;

  return v5;
}

- (unint64_t)hash
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  merchantIdentifier = self->_merchantIdentifier;
  long long v22 = *(_OWORD *)&self->_merchantSessionIdentifier;
  signature = self->_signature;
  displayName = self->_displayName;
  uint64_t v24 = signature;
  id v4 = [NSNumber numberWithUnsignedInteger:self->_epochTimestamp];
  id v25 = v4;
  v5 = [NSNumber numberWithUnsignedInteger:self->_expiresAt];
  uint64_t v26 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&merchantIdentifier count:7];

  if (![(PKPaymentMerchantSession *)self _isModern])
  {
    uint64_t v13 = [v6 arrayByAddingObject:self->_domain];
    uint64_t v14 = v6;
LABEL_8:

    uint64_t v14 = (void *)v13;
    goto LABEL_9;
  }
  ampEnrollmentPinning = self->_ampEnrollmentPinning;
  if (ampEnrollmentPinning)
  {
    initiativeContext = self->_initiativeContext;
    v20[0] = self->_initiative;
    v20[1] = initiativeContext;
    signedFields = self->_signedFields;
    v20[2] = ampEnrollmentPinning;
    v20[3] = signedFields;
    uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v11 = v20;
    uint64_t v12 = 4;
  }
  else
  {
    v15 = self->_initiativeContext;
    v19[0] = self->_initiative;
    v19[1] = v15;
    v19[2] = self->_signedFields;
    uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v11 = v19;
    uint64_t v12 = 3;
  }
  uint64_t v16 = [v10 arrayWithObjects:v11 count:v12];
  uint64_t v14 = [v6 arrayByAddingObjectsFromArray:v16];

  if (self->_operationalAnalyticsIdentifier)
  {
    uint64_t v13 = objc_msgSend(v14, "arrayByAddingObject:");
    goto LABEL_8;
  }
LABEL_9:
  unint64_t v17 = PKCombinedHash(17, v14);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentMerchantSession *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentMerchantSession *)self isEqualToPaymentMerchantSession:v5];

  return v6;
}

- (BOOL)isEqualToPaymentMerchantSession:(id)a3
{
  id v4 = a3;
  v5 = (void *)v4[5];
  BOOL v6 = self->_merchantIdentifier;
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_32;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_33;
    }
  }
  uint64_t v11 = (void *)v4[3];
  BOOL v6 = self->_merchantSessionIdentifier;
  uint64_t v12 = v11;
  if (v6 == v12)
  {
  }
  else
  {
    uint64_t v8 = v12;
    if (!v6 || !v12) {
      goto LABEL_32;
    }
    BOOL v13 = [(NSString *)v6 isEqualToString:v12];

    if (!v13) {
      goto LABEL_33;
    }
  }
  uint64_t v14 = (void *)v4[4];
  BOOL v6 = self->_nonce;
  v15 = v14;
  if (v6 == v15)
  {
  }
  else
  {
    uint64_t v8 = v15;
    if (!v6 || !v15) {
      goto LABEL_32;
    }
    BOOL v16 = [(NSString *)v6 isEqualToString:v15];

    if (!v16) {
      goto LABEL_33;
    }
  }
  unint64_t v17 = (void *)v4[7];
  BOOL v6 = self->_domain;
  uint64_t v18 = v17;
  if (v6 == v18)
  {
  }
  else
  {
    uint64_t v8 = v18;
    if (!v6 || !v18) {
      goto LABEL_32;
    }
    BOOL v19 = [(NSString *)v6 isEqualToString:v18];

    if (!v19) {
      goto LABEL_33;
    }
  }
  uint64_t v20 = (void *)v4[8];
  BOOL v6 = self->_displayName;
  id v21 = v20;
  if (v6 == v21)
  {

    goto LABEL_36;
  }
  uint64_t v8 = v21;
  if (!v6 || !v21)
  {
LABEL_32:

    goto LABEL_33;
  }
  BOOL v22 = [(NSString *)v6 isEqualToString:v21];

  if (!v22) {
    goto LABEL_33;
  }
LABEL_36:
  signature = self->_signature;
  uint64_t v26 = (NSData *)v4[13];
  if (signature && v26)
  {
    if ((-[NSData isEqual:](signature, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (signature != v26)
  {
    goto LABEL_33;
  }
  if (self->_epochTimestamp != v4[1] || self->_expiresAt != v4[2]) {
    goto LABEL_33;
  }
  initiative = self->_initiative;
  uint64_t v28 = (NSString *)v4[10];
  if (initiative && v28)
  {
    if ((-[NSString isEqual:](initiative, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (initiative != v28)
  {
    goto LABEL_33;
  }
  initiativeContext = self->_initiativeContext;
  v30 = (NSString *)v4[9];
  if (initiativeContext && v30)
  {
    if ((-[NSString isEqual:](initiativeContext, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (initiativeContext != v30)
  {
    goto LABEL_33;
  }
  ampEnrollmentPinning = self->_ampEnrollmentPinning;
  uint64_t v32 = (NSData *)v4[11];
  if (ampEnrollmentPinning && v32)
  {
    if ((-[NSData isEqual:](ampEnrollmentPinning, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (ampEnrollmentPinning != v32)
  {
    goto LABEL_33;
  }
  operationalAnalyticsIdentifier = self->_operationalAnalyticsIdentifier;
  uint64_t v34 = (NSString *)v4[6];
  if (operationalAnalyticsIdentifier && v34)
  {
    if (-[NSString isEqual:](operationalAnalyticsIdentifier, "isEqual:")) {
      goto LABEL_63;
    }
LABEL_33:
    char v23 = 0;
    goto LABEL_34;
  }
  if (operationalAnalyticsIdentifier != v34) {
    goto LABEL_33;
  }
LABEL_63:
  signedFields = self->_signedFields;
  objc_super v36 = (NSArray *)v4[12];
  if (signedFields && v36) {
    char v23 = -[NSArray isEqual:](signedFields, "isEqual:");
  }
  else {
    char v23 = signedFields == v36;
  }
LABEL_34:

  return v23;
}

- (BOOL)supportsURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPaymentMerchantSession *)self _isModern];
  uint64_t v6 = 56;
  if (v5) {
    uint64_t v6 = 72;
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);
  uint64_t v8 = [v4 host];

  id v9 = v8;
  id v10 = v7;
  uint64_t v11 = v10;
  if (v9 == v10)
  {
    char v13 = 1;
  }
  else
  {
    if (v10) {
      BOOL v12 = v9 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      char v13 = 0;
    }
    else {
      char v13 = [v9 isEqualToString:v10];
    }
  }

  return v13;
}

- (BOOL)_isModern
{
  return self->_initiative != 0;
}

- (id)signedData
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if ([(PKPaymentMerchantSession *)self _isModern])
  {
    id v4 = [(NSArray *)self->_signedFields componentsJoinedByString:&stru_1EE0F5368];
    BOOL v5 = [v4 dataUsingEncoding:4];
    [v3 appendData:v5];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = self->_signedFields;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v7) {
      goto LABEL_15;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", @"nonce", (void)v22))
        {
          BOOL v12 = [(NSString *)self->_nonce pk_decodeHexadecimal];
LABEL_11:
          char v13 = v12;
          goto LABEL_13;
        }
        if ([v11 isEqualToString:@"ampEnrollmentPinning"])
        {
          BOOL v12 = self->_ampEnrollmentPinning;
          goto LABEL_11;
        }
        uint64_t v14 = [(PKPaymentMerchantSession *)self valueForKey:v11];
        char v13 = [v14 dataUsingEncoding:4];

LABEL_13:
        [v3 appendData:v13];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v8)
      {
LABEL_15:

        goto LABEL_17;
      }
    }
  }
  v15 = [(NSString *)self->_merchantIdentifier dataUsingEncoding:4];
  [v3 appendData:v15];

  BOOL v16 = [(NSString *)self->_merchantSessionIdentifier dataUsingEncoding:4];
  [v3 appendData:v16];

  unint64_t v17 = [(NSString *)self->_domain dataUsingEncoding:4];
  [v3 appendData:v17];

  uint64_t v18 = [(NSString *)self->_displayName dataUsingEncoding:4];
  [v3 appendData:v18];

  BOOL v19 = [(NSString *)self->_nonce pk_decodeHexadecimal];
  [v3 appendData:v19];

LABEL_17:
  uint64_t v20 = objc_msgSend(v3, "copy", (void)v22);

  return v20;
}

- (unint64_t)epochTimestamp
{
  return self->_epochTimestamp;
}

- (unint64_t)expiresAt
{
  return self->_expiresAt;
}

- (NSString)merchantSessionIdentifier
{
  return self->_merchantSessionIdentifier;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (NSString)operationalAnalyticsIdentifier
{
  return self->_operationalAnalyticsIdentifier;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)initiativeContext
{
  return self->_initiativeContext;
}

- (NSString)initiative
{
  return self->_initiative;
}

- (NSData)ampEnrollmentPinning
{
  return self->_ampEnrollmentPinning;
}

- (NSArray)signedFields
{
  return self->_signedFields;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)retryNonce
{
  return self->_retryNonce;
}

- (void)setRetryNonce:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryNonce, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_signedFields, 0);
  objc_storeStrong((id *)&self->_ampEnrollmentPinning, 0);
  objc_storeStrong((id *)&self->_initiative, 0);
  objc_storeStrong((id *)&self->_initiativeContext, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_operationalAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_merchantSessionIdentifier, 0);
}

+ (PKPaymentMerchantSession)paymentMerchantSessionWithProtobuf:(id)a3
{
  id v3 = a3;
  int v4 = [v3 hasInitiative];
  BOOL v5 = [PKPaymentMerchantSession alloc];
  uint64_t v6 = [v3 merchantIdentifier];
  uint64_t v7 = [v3 sessionIdentifier];
  uint64_t v8 = [v3 nonce];
  uint64_t v9 = [v3 epochTimestamp];
  uint64_t v26 = [v3 expiresAt];
  if (v4)
  {
    uint64_t v24 = [v3 displayName];
    id v10 = [v3 initiativeContext];
    uint64_t v11 = [v3 initiative];
    BOOL v12 = [v3 ampEnrollmentPinning];
    long long v23 = [v3 operationalAnalyticsIdentifier];
    char v13 = v5;
    long long v25 = v6;
    [v3 signedFields];
    uint64_t v14 = v8;
    BOOL v16 = v15 = v7;
    unint64_t v17 = [v3 signature];
    uint64_t v18 = v13;
    BOOL v19 = (void *)v24;
    uint64_t v20 = [(PKPaymentMerchantSession *)v18 initWithMerchantIdentifier:v25 merchantSessionIdentifier:v15 nonce:v14 epochTimestamp:v9 expiresAt:v26 displayName:v24 initiativeContext:v10 initiative:v11 ampEnrollmentPinning:v12 operationalAnalyticsIdentifier:v23 signedFields:v16 signature:v17];

    uint64_t v7 = v15;
    uint64_t v8 = v14;

    uint64_t v6 = v25;
  }
  else
  {
    BOOL v19 = [v3 domain];
    id v10 = [v3 displayName];
    uint64_t v11 = [v3 operationalAnalyticsIdentifier];
    BOOL v12 = [v3 signature];
    uint64_t v20 = [(PKPaymentMerchantSession *)v5 initWithMerchantIdentifier:v6 merchantSessionIdentifier:v7 nonce:v8 epochTimestamp:v9 expiresAt:v26 domain:v19 displayName:v10 operationalAnalyticsIdentifier:v11 signature:v12];
  }

  if ([v3 hasRetryNonce])
  {
    id v21 = [v3 retryNonce];
    [(PKPaymentMerchantSession *)v20 setRetryNonce:v21];
  }
  return v20;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufPaymentMerchantSession);
  int v4 = [(PKPaymentMerchantSession *)self merchantIdentifier];
  [(PKProtobufPaymentMerchantSession *)v3 setMerchantIdentifier:v4];

  BOOL v5 = [(PKPaymentMerchantSession *)self merchantSessionIdentifier];
  [(PKProtobufPaymentMerchantSession *)v3 setSessionIdentifier:v5];

  uint64_t v6 = [(PKPaymentMerchantSession *)self nonce];
  [(PKProtobufPaymentMerchantSession *)v3 setNonce:v6];

  [(PKProtobufPaymentMerchantSession *)v3 setEpochTimestamp:[(PKPaymentMerchantSession *)self epochTimestamp]];
  [(PKProtobufPaymentMerchantSession *)v3 setExpiresAt:[(PKPaymentMerchantSession *)self expiresAt]];
  uint64_t v7 = [(PKPaymentMerchantSession *)self displayName];
  [(PKProtobufPaymentMerchantSession *)v3 setDisplayName:v7];

  uint64_t v8 = [(PKPaymentMerchantSession *)self signature];
  [(PKProtobufPaymentMerchantSession *)v3 setSignature:v8];

  uint64_t v9 = [(PKPaymentMerchantSession *)self retryNonce];
  [(PKProtobufPaymentMerchantSession *)v3 setRetryNonce:v9];

  id v10 = [(PKPaymentMerchantSession *)self operationalAnalyticsIdentifier];
  [(PKProtobufPaymentMerchantSession *)v3 setOperationalAnalyticsIdentifier:v10];

  uint64_t v11 = [(PKPaymentMerchantSession *)self initiative];

  if (v11)
  {
    BOOL v12 = [(PKPaymentMerchantSession *)self initiative];
    [(PKProtobufPaymentMerchantSession *)v3 setInitiative:v12];

    char v13 = [(PKPaymentMerchantSession *)self initiativeContext];
    [(PKProtobufPaymentMerchantSession *)v3 setInitiativeContext:v13];

    uint64_t v14 = [(PKPaymentMerchantSession *)self signedFields];
    v15 = (void *)[v14 mutableCopy];
    [(PKProtobufPaymentMerchantSession *)v3 setSignedFields:v15];
  }
  else
  {
    uint64_t v14 = [(PKPaymentMerchantSession *)self domain];
    [(PKProtobufPaymentMerchantSession *)v3 setDomain:v14];
  }

  return v3;
}

@end