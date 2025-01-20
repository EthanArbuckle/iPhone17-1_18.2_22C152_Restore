@interface PKVerificationChannel
+ (BOOL)supportsSecureCoding;
+ (id)verificationChannelWithDictionary:(id)a3 andOrganizationName:(id)a4;
- (BOOL)needsServerRequest;
- (BOOL)requiresUserInteraction;
- (NSString)contactPoint;
- (NSString)identifier;
- (NSString)organizationName;
- (NSString)sourceAddress;
- (NSString)typeDescription;
- (NSString)typeDescriptionUnlocalized;
- (PKVerificationChannel)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setContactPoint:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setRequiresUserInteraction:(BOOL)a3;
- (void)setSourceAddress:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setTypeDescription:(id)a3;
@end

@implementation PKVerificationChannel

+ (id)verificationChannelWithDictionary:(id)a3 andOrganizationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    v9 = [v6 objectForKey:@"identifier"];
    [v8 setIdentifier:v9];

    v10 = [v6 objectForKey:@"type"];
    objc_msgSend(v8, "setType:", objc_msgSend(v10, "unsignedIntegerValue"));

    v11 = [v6 objectForKey:@"typeDescription"];
    [v8 setTypeDescription:v11];

    [v8 setOrganizationName:v7];
    v12 = [v6 objectForKey:@"requiresUserInteraction"];
    objc_msgSend(v8, "setRequiresUserInteraction:", objc_msgSend(v12, "BOOLValue"));

    v13 = [v6 objectForKey:@"contactPoint"];
    [v8 setContactPoint:v13];

    v14 = [v6 objectForKey:@"sourceAddress"];
    [v8 setSourceAddress:v14];
  }
  return v8;
}

- (PKVerificationChannel)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKVerificationChannel;
  v5 = [(PKVerificationChannel *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(PKVerificationChannel *)v5 setIdentifier:v6];

    -[PKVerificationChannel setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeDescription"];
    [(PKVerificationChannel *)v5 setTypeDescription:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"organizationName"];
    [(PKVerificationChannel *)v5 setOrganizationName:v8];

    -[PKVerificationChannel setRequiresUserInteraction:](v5, "setRequiresUserInteraction:", [v4 decodeIntegerForKey:@"requiresUserInteraction"] != 0);
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactPoint"];
    [(PKVerificationChannel *)v5 setContactPoint:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAddress"];
    [(PKVerificationChannel *)v5 setSourceAddress:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKVerificationChannel *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKVerificationChannel type](self, "type"), @"type");
  id v6 = [(PKVerificationChannel *)self typeDescription];
  [v4 encodeObject:v6 forKey:@"typeDescription"];

  id v7 = [(PKVerificationChannel *)self organizationName];
  [v4 encodeObject:v7 forKey:@"organizationName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKVerificationChannel requiresUserInteraction](self, "requiresUserInteraction"), @"requiresUserInteraction");
  id v8 = [(PKVerificationChannel *)self contactPoint];
  [v4 encodeObject:v8 forKey:@"contactPoint"];

  id v9 = [(PKVerificationChannel *)self sourceAddress];
  [v4 encodeObject:v9 forKey:@"sourceAddress"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(void *)(v5 + 24) = self->_type;
  uint64_t v8 = [(NSString *)self->_typeDescription copyWithZone:a3];
  id v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_organizationName copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  *(unsigned char *)(v5 + 8) = self->_requiresUserInteraction;
  uint64_t v12 = [(NSString *)self->_contactPoint copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_sourceAddress copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  return (id)v5;
}

- (NSString)typeDescriptionUnlocalized
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 7) {
    return (NSString *)@"other";
  }
  else {
    return &off_1E56E34A8[v2]->isa;
  }
}

- (NSString)typeDescription
{
  v3 = self->_typeDescription;
  switch(self->_type)
  {
    case 1uLL:
      id v4 = @"VERIFICATION_CHANNEL_EMAIL";
      goto LABEL_7;
    case 2uLL:
      id v4 = @"VERIFICATION_CHANNEL_SMS";
      goto LABEL_7;
    case 3uLL:
      id v4 = @"VERIFICATION_CHANNEL_INBOUND_PHONE_CALL";
      goto LABEL_7;
    case 4uLL:
      organizationName = self->_organizationName;
      uint64_t v5 = @"VERIFICATION_CHANNEL_OUTBOUND_PHONE_CALL";
      goto LABEL_10;
    case 5uLL:
      organizationName = self->_organizationName;
      uint64_t v5 = @"VERIFICATION_CHANNEL_BANK_APP";
      goto LABEL_10;
    case 6uLL:
      id v4 = @"VERIFICATION_CHANNEL_BANK_STATEMENT";
LABEL_7:
      PKLocalizedPaymentString(&v4->isa, 0);
      goto LABEL_11;
    case 8uLL:
      organizationName = self->_organizationName;
      uint64_t v5 = @"VERIFICATION_CHANNEL_URL";
LABEL_10:
      PKLocalizedPaymentString(&v5->isa, &stru_1EE0F6808.isa, organizationName);
      uint64_t v6 = LABEL_11:;

      v3 = (NSString *)v6;
      break;
    default:
      break;
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(PKVerificationChannel *)self identifier];
  uint64_t v5 = [(PKVerificationChannel *)self typeDescriptionUnlocalized];
  uint64_t v6 = [(PKVerificationChannel *)self organizationName];
  BOOL v7 = [(PKVerificationChannel *)self requiresUserInteraction];
  uint64_t v8 = [(PKVerificationChannel *)self contactPoint];
  id v9 = [(PKVerificationChannel *)self sourceAddress];
  uint64_t v10 = [v3 stringWithFormat:@"identifier: %@, typeDescription: %@, organizationName:%@ requiresUserInteraction: %d, contactPoint: %@, sourceAddress: %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)needsServerRequest
{
  return (self->_type > 8) | (0xCFu >> self->_type) & 1;
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

- (void)setTypeDescription:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (BOOL)requiresUserInteraction
{
  return self->_requiresUserInteraction;
}

- (void)setRequiresUserInteraction:(BOOL)a3
{
  self->_requiresUserInteraction = a3;
}

- (NSString)contactPoint
{
  return self->_contactPoint;
}

- (void)setContactPoint:(id)a3
{
}

- (NSString)sourceAddress
{
  return self->_sourceAddress;
}

- (void)setSourceAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAddress, 0);
  objc_storeStrong((id *)&self->_contactPoint, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_typeDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end