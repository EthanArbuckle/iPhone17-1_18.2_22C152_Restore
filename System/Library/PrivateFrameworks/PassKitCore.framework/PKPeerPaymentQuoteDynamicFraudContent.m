@interface PKPeerPaymentQuoteDynamicFraudContent
+ (BOOL)supportsSecureCoding;
+ (id)dynamicFraudContentWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)defaultButtonTitle;
- (NSString)header;
- (NSString)message;
- (NSString)otherButtonTitle;
- (PKPeerPaymentQuoteDynamicFraudContent)initWithCoder:(id)a3;
- (PKPeerPaymentQuoteDynamicFraudContent)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPeerPaymentQuoteDynamicFraudContent

+ (id)dynamicFraudContentWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (PKPeerPaymentQuoteDynamicFraudContent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentQuoteDynamicFraudContent;
  v5 = [(PKPeerPaymentQuoteDynamicFraudContent *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"header"];
    header = v5->_header;
    v5->_header = (NSString *)v6;

    if (!v5->_header)
    {
      uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_1.isa, 0);
      v9 = v5->_header;
      v5->_header = (NSString *)v8;
    }
    uint64_t v10 = [v4 PKStringForKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v10;

    if (!v5->_message)
    {
      uint64_t v12 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_2.isa, 0);
      v13 = v5->_message;
      v5->_message = (NSString *)v12;
    }
    uint64_t v14 = [v4 PKStringForKey:@"defaultButtonTitle"];
    defaultButtonTitle = v5->_defaultButtonTitle;
    v5->_defaultButtonTitle = (NSString *)v14;

    if (!v5->_defaultButtonTitle)
    {
      uint64_t v16 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_3.isa, 0);
      v17 = v5->_defaultButtonTitle;
      v5->_defaultButtonTitle = (NSString *)v16;
    }
    uint64_t v18 = [v4 PKStringForKey:@"otherButtonTitle"];
    otherButtonTitle = v5->_otherButtonTitle;
    v5->_otherButtonTitle = (NSString *)v18;

    if (!v5->_otherButtonTitle)
    {
      uint64_t v20 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCon_4.isa, 0);
      v21 = v5->_otherButtonTitle;
      v5->_otherButtonTitle = (NSString *)v20;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentQuoteDynamicFraudContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentQuoteDynamicFraudContent;
  v5 = [(PKPeerPaymentQuoteDynamicFraudContent *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"header"];
    header = v5->_header;
    v5->_header = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultButtonTitle"];
    defaultButtonTitle = v5->_defaultButtonTitle;
    v5->_defaultButtonTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherButtonTitle"];
    otherButtonTitle = v5->_otherButtonTitle;
    v5->_otherButtonTitle = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  header = self->_header;
  id v5 = a3;
  [v5 encodeObject:header forKey:@"header"];
  [v5 encodeObject:self->_message forKey:@"message"];
  [v5 encodeObject:self->_defaultButtonTitle forKey:@"defaultButtonTitle"];
  [v5 encodeObject:self->_otherButtonTitle forKey:@"otherButtonTitle"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"header: '%@'; ", self->_header];
  [v3 appendFormat:@"message: '%@'; ", self->_message];
  [v3 appendFormat:@"defaultButtonTitle: '%@'; ", self->_defaultButtonTitle];
  [v3 appendFormat:@"otherButtonTitle: '%@'; ", self->_otherButtonTitle];
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  header = self->_header;
  uint64_t v6 = (NSString *)v4[1];
  if (header && v6)
  {
    if ((-[NSString isEqual:](header, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (header != v6)
  {
    goto LABEL_19;
  }
  message = self->_message;
  uint64_t v8 = (NSString *)v4[2];
  if (message && v8)
  {
    if ((-[NSString isEqual:](message, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (message != v8)
  {
    goto LABEL_19;
  }
  defaultButtonTitle = self->_defaultButtonTitle;
  uint64_t v10 = (NSString *)v4[3];
  if (!defaultButtonTitle || !v10)
  {
    if (defaultButtonTitle == v10) {
      goto LABEL_15;
    }
LABEL_19:
    char v13 = 0;
    goto LABEL_20;
  }
  if ((-[NSString isEqual:](defaultButtonTitle, "isEqual:") & 1) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  otherButtonTitle = self->_otherButtonTitle;
  uint64_t v12 = (NSString *)v4[4];
  if (otherButtonTitle && v12) {
    char v13 = -[NSString isEqual:](otherButtonTitle, "isEqual:");
  }
  else {
    char v13 = otherButtonTitle == v12;
  }
LABEL_20:

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_header];
  [v3 safelyAddObject:self->_message];
  [v3 safelyAddObject:self->_defaultButtonTitle];
  [v3 safelyAddObject:self->_otherButtonTitle];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)header
{
  return self->_header;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (NSString)otherButtonTitle
{
  return self->_otherButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end