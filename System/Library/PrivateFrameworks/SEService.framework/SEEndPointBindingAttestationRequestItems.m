@interface SEEndPointBindingAttestationRequestItems
+ (BOOL)supportsSecureCoding;
+ (id)withSubCAAttestation:(id)a3 casdECDSACertificate:(id)a4 casdRSACertificate:(id)a5;
- (NSData)casdECDSACertificate;
- (NSData)casdRSACertificate;
- (NSData)subCAAttestation;
- (SEEndPointBindingAttestationRequestItems)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCasdECDSACertificate:(id)a3;
- (void)setCasdRSACertificate:(id)a3;
- (void)setSubCAAttestation:(id)a3;
@end

@implementation SEEndPointBindingAttestationRequestItems

+ (id)withSubCAAttestation:(id)a3 casdECDSACertificate:(id)a4 casdRSACertificate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setSubCAAttestation:v9];

  [v10 setCasdECDSACertificate:v8];
  [v10 setCasdRSACertificate:v7];

  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SEEndPointBindingAttestationRequestItems *)self subCAAttestation];
  v5 = [v4 asHexString];
  v6 = [(SEEndPointBindingAttestationRequestItems *)self casdECDSACertificate];
  id v7 = [v6 asHexString];
  id v8 = [(SEEndPointBindingAttestationRequestItems *)self casdRSACertificate];
  id v9 = [v3 stringWithFormat:@"{\n\tsubCAAttestation : %@,\n\tcasdECDACertificate : %@\n,\n\tcasdRSACertificate : %@\n}", v5, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SEEndPointBindingAttestationRequestItems *)self subCAAttestation];
  [v4 encodeObject:v5 forKey:@"subCAAttestation"];

  v6 = [(SEEndPointBindingAttestationRequestItems *)self casdECDSACertificate];
  [v4 encodeObject:v6 forKey:@"casdECDSACertificate"];

  id v7 = [(SEEndPointBindingAttestationRequestItems *)self casdRSACertificate];
  [v4 encodeObject:v7 forKey:@"casdRSACertificate"];
}

- (SEEndPointBindingAttestationRequestItems)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SEEndPointBindingAttestationRequestItems;
  v5 = [(SEEndPointBindingAttestationRequestItems *)&v17 init];
  v6 = v5;
  if (v5)
  {
    id v7 = [(SEEndPointBindingAttestationRequestItems *)v5 subCAAttestation];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subCAAttestation"];
    subCAAttestation = v6->_subCAAttestation;
    v6->_subCAAttestation = (NSData *)v8;

    v10 = [(SEEndPointBindingAttestationRequestItems *)v6 casdECDSACertificate];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"casdECDSACertificate"];
    casdECDSACertificate = v6->_casdECDSACertificate;
    v6->_casdECDSACertificate = (NSData *)v11;

    v13 = [(SEEndPointBindingAttestationRequestItems *)v6 casdRSACertificate];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"casdRSACertificate"];
    casdRSACertificate = v6->_casdRSACertificate;
    v6->_casdRSACertificate = (NSData *)v14;
  }
  return v6;
}

- (NSData)subCAAttestation
{
  return self->_subCAAttestation;
}

- (void)setSubCAAttestation:(id)a3
{
}

- (NSData)casdECDSACertificate
{
  return self->_casdECDSACertificate;
}

- (void)setCasdECDSACertificate:(id)a3
{
}

- (NSData)casdRSACertificate
{
  return self->_casdRSACertificate;
}

- (void)setCasdRSACertificate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casdRSACertificate, 0);
  objc_storeStrong((id *)&self->_casdECDSACertificate, 0);
  objc_storeStrong((id *)&self->_subCAAttestation, 0);
}

@end