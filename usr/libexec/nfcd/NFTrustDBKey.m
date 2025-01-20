@interface NFTrustDBKey
+ (BOOL)supportsSecureCoding;
- (NFTrustDBKey)initWithCoder:(id)a3;
- (NSArray)localValidations;
- (NSString)applicationIdentifier;
- (NSString)instanceAID;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstanceAID:(id)a3;
- (void)setLocalValidations:(id)a3;
@end

@implementation NFTrustDBKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustDBKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NFTrustDBKey;
  v5 = [(NFTrustObject *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(NFTrustDBKey *)v5 setValue:v6 forKey:@"identifier"];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    [(NFTrustDBKey *)v5 setValue:v7 forKey:@"applicationIdentifier"];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instanceAID"];
    [(NFTrustDBKey *)v5 setValue:v8 forKey:@"instanceAID"];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slot"];
    [(NFTrustDBKey *)v5 setValue:v9 forKey:@"slot"];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyAttestationAuthority"];
    [(NFTrustDBKey *)v5 setValue:v10 forKey:@"keyAttestationAuthority"];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyAttestation"];
    [(NFTrustDBKey *)v5 setValue:v11 forKey:@"keyAttestation"];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"counterValue"];
    [(NFTrustDBKey *)v5 setValue:v12 forKey:@"counterValue"];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"counterLimit"];
    [(NFTrustDBKey *)v5 setValue:v13 forKey:@"counterLimit"];

    v14 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfArrayOfClass:objc_opt_class() forKey:@"localValidations"];
    [(NFTrustDBKey *)v5 setValue:v14 forKey:@"localValidations"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  if (self)
  {
    [v10 encodeObject:self->_identifier forKey:@"identifier"];
    id v4 = [(NFTrustDBKey *)self applicationIdentifier];
    [v10 encodeObject:v4 forKey:@"applicationIdentifier"];

    v5 = [(NFTrustDBKey *)self instanceAID];
    [v10 encodeObject:v5 forKey:@"instanceAID"];

    [v10 encodeObject:self->_slot forKey:@"slot"];
    [v10 encodeObject:self->_keyAttestationAuthority forKey:@"keyAttestationAuthority"];
    [v10 encodeObject:self->_keyAttestation forKey:@"keyAttestation"];
    [v10 encodeObject:self->_counterValue forKey:@"counterValue"];
    counterLimit = self->_counterLimit;
  }
  else
  {
    [v10 encodeObject:0 forKey:@"identifier"];
    v8 = [0 applicationIdentifier];
    [v10 encodeObject:v8 forKey:@"applicationIdentifier"];

    v9 = [0 instanceAID];
    [v10 encodeObject:v9 forKey:@"instanceAID"];

    [v10 encodeObject:0 forKey:@"slot"];
    [v10 encodeObject:0 forKey:@"keyAttestationAuthority"];
    [v10 encodeObject:0 forKey:@"keyAttestation"];
    [v10 encodeObject:0 forKey:@"counterValue"];
    counterLimit = 0;
  }
  [v10 encodeObject:counterLimit forKey:@"counterLimit"];
  v7 = [(NFTrustDBKey *)self localValidations];
  [v10 encodeObject:v7 forKey:@"localValidations"];
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)instanceAID
{
  return self->_instanceAID;
}

- (void)setInstanceAID:(id)a3
{
}

- (NSArray)localValidations
{
  return self->_localValidations;
}

- (void)setLocalValidations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localValidations, 0);
  objc_storeStrong((id *)&self->_instanceAID, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_counterValue, 0);
  objc_storeStrong((id *)&self->_counterLimit, 0);
  objc_storeStrong((id *)&self->_slot, 0);
  objc_storeStrong((id *)&self->_keyAttestation, 0);
  objc_storeStrong((id *)&self->_keyAttestationAuthority, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end