@interface CuttlefishPCSServiceIdentifier
+ (BOOL)supportsSecureCoding;
- (CuttlefishPCSServiceIdentifier)initWithCoder:(id)a3;
- (NSData)PCSPublicKey;
- (NSNumber)PCSServiceID;
- (NSString)zoneID;
- (id)description;
- (id)init:(id)a3 PCSPublicKey:(id)a4 zoneID:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setPCSPublicKey:(id)a3;
- (void)setPCSServiceID:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CuttlefishPCSServiceIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_PCSPublicKey, 0);

  objc_storeStrong((id *)&self->_PCSServiceID, 0);
}

- (void)setZoneID:(id)a3
{
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPCSPublicKey:(id)a3
{
}

- (NSData)PCSPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPCSServiceID:(id)a3
{
}

- (NSNumber)PCSServiceID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = [(CuttlefishPCSServiceIdentifier *)self zoneID];
  v4 = [(CuttlefishPCSServiceIdentifier *)self PCSServiceID];
  v5 = +[NSString stringWithFormat:@"<CuttlefishPCSServiceIdentifier(%@): %@>", v3, v4];

  return v5;
}

- (CuttlefishPCSServiceIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CuttlefishPCSServiceIdentifier;
  v5 = [(CuttlefishPCSServiceIdentifier *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneID"];
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pcsServiceID"];
    PCSServiceID = v5->_PCSServiceID;
    v5->_PCSServiceID = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pcsPublicKey"];
    PCSPublicKey = v5->_PCSPublicKey;
    v5->_PCSPublicKey = (NSData *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CuttlefishPCSServiceIdentifier *)self PCSPublicKey];
  [v4 encodeObject:v5 forKey:@"pcsPublicKey"];

  uint64_t v6 = [(CuttlefishPCSServiceIdentifier *)self PCSServiceID];
  [v4 encodeObject:v6 forKey:@"pcsServiceID"];

  id v7 = [(CuttlefishPCSServiceIdentifier *)self zoneID];
  [v4 encodeObject:v7 forKey:@"zoneID"];
}

- (id)init:(id)a3 PCSPublicKey:(id)a4 zoneID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CuttlefishPCSServiceIdentifier;
  v12 = [(CuttlefishPCSServiceIdentifier *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_PCSServiceID, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end