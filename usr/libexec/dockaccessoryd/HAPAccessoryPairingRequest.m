@interface HAPAccessoryPairingRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresUserConsent;
- (HAPPairingIdentity)pairingIdentity;
- (NSData)ownershipToken;
- (NSData)psk;
- (NSNumber)chipFabricIndex;
- (NSString)isoCountryCode;
- (NSString)ssid;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setChipFabricIndex:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setOwnershipToken:(id)a3;
- (void)setPairingIdentity:(id)a3;
- (void)setPsk:(id)a3;
- (void)setRequiresUserConsent:(BOOL)a3;
- (void)setSsid:(id)a3;
@end

@implementation HAPAccessoryPairingRequest

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_12;
  }
  v7 = [(HAPAccessoryPairingRequest *)self pairingIdentity];
  v8 = [v6 pairingIdentity];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_12;
  }
  unsigned int v10 = [(HAPAccessoryPairingRequest *)self requiresUserConsent];
  if (v10 != [v6 requiresUserConsent]) {
    goto LABEL_12;
  }
  v11 = [(HAPAccessoryPairingRequest *)self ownershipToken];
  v12 = [v6 ownershipToken];
  int v13 = HMFEqualObjects();

  if (!v13) {
    goto LABEL_12;
  }
  v14 = [(HAPAccessoryPairingRequest *)self ssid];
  v15 = [v6 ssid];
  int v16 = HMFEqualObjects();

  if (!v16) {
    goto LABEL_12;
  }
  v17 = [(HAPAccessoryPairingRequest *)self psk];
  v18 = [v6 psk];
  int v19 = HMFEqualObjects();

  if (!v19) {
    goto LABEL_12;
  }
  v20 = [(HAPAccessoryPairingRequest *)self isoCountryCode];
  v21 = [v6 isoCountryCode];
  int v22 = HMFEqualObjects();

  if (v22)
  {
    v23 = [(HAPAccessoryPairingRequest *)self chipFabricIndex];
    v24 = [v6 chipFabricIndex];
    char v25 = HMFEqualObjects();
  }
  else
  {
LABEL_12:
    char v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  v3 = [(HAPAccessoryPairingRequest *)self pairingIdentity];
  unint64_t v4 = (unint64_t)[v3 hash];

  uint64_t v5 = [(HAPAccessoryPairingRequest *)self requiresUserConsent];
  id v6 = [(HAPAccessoryPairingRequest *)self ownershipToken];
  unint64_t v7 = v4 ^ (unint64_t)[v6 hash] ^ v5;

  v8 = [(HAPAccessoryPairingRequest *)self ssid];
  unint64_t v9 = (unint64_t)[v8 hash];

  unsigned int v10 = [(HAPAccessoryPairingRequest *)self psk];
  unint64_t v11 = v9 ^ (unint64_t)[v10 hash];

  v12 = [(HAPAccessoryPairingRequest *)self isoCountryCode];
  unint64_t v13 = v7 ^ v11 ^ (unint64_t)[v12 hash];

  v14 = [(HAPAccessoryPairingRequest *)self chipFabricIndex];
  unint64_t v15 = v13 ^ (unint64_t)[v14 hash];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [+[HAPAccessoryPairingRequest allocWithZone:a3] init];
  uint64_t v5 = [(HAPAccessoryPairingRequest *)self pairingIdentity];
  [(HAPAccessoryPairingRequest *)v4 setPairingIdentity:v5];

  [(HAPAccessoryPairingRequest *)v4 setRequiresUserConsent:[(HAPAccessoryPairingRequest *)self requiresUserConsent]];
  id v6 = [(HAPAccessoryPairingRequest *)self ownershipToken];
  [(HAPAccessoryPairingRequest *)v4 setOwnershipToken:v6];

  unint64_t v7 = [(HAPAccessoryPairingRequest *)self ssid];
  [(HAPAccessoryPairingRequest *)v4 setSsid:v7];

  v8 = [(HAPAccessoryPairingRequest *)self psk];
  [(HAPAccessoryPairingRequest *)v4 setPsk:v8];

  unint64_t v9 = [(HAPAccessoryPairingRequest *)self isoCountryCode];
  [(HAPAccessoryPairingRequest *)v4 setIsoCountryCode:v9];

  unsigned int v10 = [(HAPAccessoryPairingRequest *)self chipFabricIndex];
  [(HAPAccessoryPairingRequest *)v4 setChipFabricIndex:v10];

  return v4;
}

- (id)attributeDescriptions
{
  v3 = +[NSMutableArray array];
  unint64_t v4 = [(HAPAccessoryPairingRequest *)self pairingIdentity];

  if (v4)
  {
    id v5 = objc_alloc((Class)HMFAttributeDescription);
    id v6 = [(HAPAccessoryPairingRequest *)self pairingIdentity];
    id v7 = [v5 initWithName:@"Pairing Identity" value:v6];
    [v3 addObject:v7];
  }
  if ([(HAPAccessoryPairingRequest *)self requiresUserConsent])
  {
    id v8 = objc_alloc((Class)HMFAttributeDescription);
    [(HAPAccessoryPairingRequest *)self requiresUserConsent];
    unint64_t v9 = HMFBooleanToString();
    id v10 = [v8 initWithName:@"Requires User Consent" value:v9];
    [v3 addObject:v10];
  }
  unint64_t v11 = [(HAPAccessoryPairingRequest *)self ownershipToken];

  if (v11)
  {
    id v12 = objc_alloc((Class)HMFAttributeDescription);
    unint64_t v13 = [(HAPAccessoryPairingRequest *)self ownershipToken];
    id v14 = [v12 initWithName:@"Ownership Token" value:v13];
    [v3 addObject:v14];
  }
  unint64_t v15 = [(HAPAccessoryPairingRequest *)self ssid];

  if (v15)
  {
    id v16 = objc_alloc((Class)HMFAttributeDescription);
    v17 = [(HAPAccessoryPairingRequest *)self ssid];
    id v18 = [v16 initWithName:@"SSID" value:v17];
    [v3 addObject:v18];
  }
  int v19 = [(HAPAccessoryPairingRequest *)self psk];

  if (v19)
  {
    id v20 = objc_alloc((Class)HMFAttributeDescription);
    v21 = [(HAPAccessoryPairingRequest *)self psk];
    id v22 = [v20 initWithName:@"PSK" value:v21];
    [v3 addObject:v22];
  }
  v23 = [(HAPAccessoryPairingRequest *)self isoCountryCode];

  if (v23)
  {
    id v24 = objc_alloc((Class)HMFAttributeDescription);
    char v25 = [(HAPAccessoryPairingRequest *)self isoCountryCode];
    id v26 = [v24 initWithName:@"ISO Country Code" value:v25];
    [v3 addObject:v26];
  }
  v27 = [(HAPAccessoryPairingRequest *)self chipFabricIndex];

  if (v27)
  {
    id v28 = objc_alloc((Class)HMFAttributeDescription);
    v29 = [(HAPAccessoryPairingRequest *)self chipFabricIndex];
    id v30 = [v28 initWithName:@"CHIP Fabric Index" value:v29];
    [v3 addObject:v30];
  }
  id v31 = [v3 copy];

  return v31;
}

- (HAPPairingIdentity)pairingIdentity
{
  return (HAPPairingIdentity *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPairingIdentity:(id)a3
{
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (NSData)ownershipToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOwnershipToken:(id)a3
{
}

- (NSString)ssid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSsid:(id)a3
{
}

- (NSData)psk
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPsk:(id)a3
{
}

- (NSString)isoCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSNumber)chipFabricIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setChipFabricIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipFabricIndex, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_psk, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);

  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

@end