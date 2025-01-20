@interface PKSEConsistencyCheckDeviceCredential
+ (id)deviceCredentialWithApplet:(id)a3;
+ (id)deviceCredentialWithDAKeyInformation:(id)a3;
+ (id)deviceCredentialWithISOCredentialProperties:(id)a3 hasKeyMeterial:(BOOL)a4;
- (BOOL)shouldRegister;
- (NSData)keyMaterialHash;
- (NSNumber)underlyingCredentialState;
- (PKSEConsistencyCheckDeviceCredential)init;
- (PKSEConsistencyCheckDeviceCredential)initWithType:(unint64_t)a3 state:(unint64_t)a4 underlyingCredentialState:(id)a5 address:(id)a6;
- (PKSEConsistencyCheckDeviceCredentialAppletProperties)appletProperties;
- (PKSEConsistencyCheckDeviceCredentialISO18013Properties)isoProperties;
- (PKSECredentialAddress)address;
- (id)description;
- (int64_t)credentialType;
- (unint64_t)state;
- (unint64_t)type;
- (void)setAppletProperties:(id)a3;
- (void)setCredentialType:(int64_t)a3;
- (void)setIsoProperties:(id)a3;
- (void)setUnderlyingCredentialState:(id)a3;
@end

@implementation PKSEConsistencyCheckDeviceCredential

- (PKSEConsistencyCheckDeviceCredential)init
{
  return 0;
}

- (PKSEConsistencyCheckDeviceCredential)initWithType:(unint64_t)a3 state:(unint64_t)a4 underlyingCredentialState:(id)a5 address:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKSEConsistencyCheckDeviceCredential;
  v13 = [(PKSEConsistencyCheckDeviceCredential *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v13->_state = a4;
    objc_storeStrong((id *)&v13->_underlyingCredentialState, a5);
    objc_storeStrong((id *)&v14->_address, a6);
  }

  return v14;
}

+ (id)deviceCredentialWithISOCredentialProperties:(id)a3 hasKeyMeterial:(BOOL)a4
{
  id v4 = a3;
  v5 = [v4 credentialIdentifier];
  v6 = [v4 presentmentKeys];
  v7 = [v6 allValues];
  v8 = [v7 firstObject];
  v9 = [v8 hexEncoding];
  v10 = [v9 uppercaseString];

  id v11 = [v4 partition];
  id v12 = @"identity";
  if (v11 == v12)
  {

    goto LABEL_7;
  }
  v13 = v12;
  if (v11 && v12)
  {
    int v14 = [(__CFString *)v11 isEqualToString:v12];

    if (!v14) {
      goto LABEL_9;
    }
LABEL_7:
    int v15 = 1;
    objc_super v16 = v5;
    goto LABEL_10;
  }

LABEL_9:
  int v15 = 0;
  objc_super v16 = v10;
LABEL_10:
  v17 = v16;
  v18 = [PKSECredentialAddress alloc];
  if (v17) {
    v19 = v17;
  }
  else {
    v19 = @"null";
  }
  v20 = [(PKSECredentialAddress *)v18 initWithType:1 identifier:v19];
  unint64_t v21 = [v4 credentialState];
  unint64_t v22 = v21;
  if (v21 > 3) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = qword_191673B50[v21];
  }
  v24 = [PKSEConsistencyCheckDeviceCredential alloc];
  v25 = [NSNumber numberWithUnsignedInteger:v22];
  v26 = [(PKSEConsistencyCheckDeviceCredential *)v24 initWithType:2 state:v23 underlyingCredentialState:v25 address:v20];

  if (!v26) {
    goto LABEL_33;
  }
  v27 = [PKSEConsistencyCheckDeviceCredentialISO18013Properties alloc];
  id v28 = v5;
  if (v27)
  {
    v40.receiver = v27;
    v40.super_class = (Class)PKSEConsistencyCheckDeviceCredentialISO18013Properties;
    v29 = objc_msgSendSuper2(&v40, sel_init);
    v27 = v29;
    if (v29)
    {
      v29->_hasKeyMeterial = a4;
      objc_storeStrong((id *)&v29->_isoIdentifier, v5);
    }
  }

  isoProperties = v26->_isoProperties;
  v26->_isoProperties = v27;

  if (v15)
  {
    v31 = [v4 docType];
    v32 = @"org.iso.23220.1.jp.mnc";
    if (v31 == v32)
    {
    }
    else
    {
      v33 = v32;
      if (!v31 || !v32)
      {

LABEL_30:
        uint64_t v35 = 129;
        goto LABEL_31;
      }
      int v34 = [(__CFString *)v31 isEqualToString:v32];

      if (!v34) {
        goto LABEL_30;
      }
    }
    uint64_t v35 = 138;
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v35 = 130;
LABEL_32:
  [(PKSEConsistencyCheckDeviceCredential *)v26 setCredentialType:v35];
  uint64_t v36 = [v4 payloadIngestionHash];
  keyMaterialHash = v26->_keyMaterialHash;
  v26->_keyMaterialHash = (NSData *)v36;

LABEL_33:
  return v26;
}

+ (id)deviceCredentialWithDAKeyInformation:(id)a3
{
  id v3 = a3;
  switch([v3 keyType])
  {
    case 1:
      id v4 = [v3 alishaKeyInformation];
      int v14 = [v4 revocationAttestation];

      if (v14)
      {
        uint64_t v9 = 2;
        uint64_t v10 = 129;
      }
      else
      {
        int v15 = [v4 trackingReceipt];

        if (v15) {
          uint64_t v10 = 15;
        }
        else {
          uint64_t v10 = 21;
        }
        if (v15) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = 4;
        }
      }
      objc_super v16 = [v4 trackingRequest];
      BOOL v8 = v16 != 0;

      v7 = @"A000000809434343444B417631";
      uint64_t v11 = 301;
      goto LABEL_14;
    case 2:
    case 4:
      id v4 = [v3 hydraKeyInformation];
      v5 = [v4 appletIdentifier];
      v6 = [v5 hexEncoding];
      v7 = [v6 uppercaseString];

      BOOL v8 = 0;
      uint64_t v9 = 1;
      uint64_t v10 = 21;
      uint64_t v11 = 130;
      goto LABEL_14;
    case 3:
    case 5:
      id v4 = [v3 homeKeyInformation];
      id v12 = [v4 appletIdentifier];
      v13 = [v12 hexEncoding];
      v7 = [v13 uppercaseString];

      BOOL v8 = 0;
      uint64_t v9 = 1;
      uint64_t v10 = 21;
      uint64_t v11 = 133;
LABEL_14:

      break;
    default:
      BOOL v8 = 0;
      v7 = 0;
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = 0;
      break;
  }
  v17 = [v3 publicKeyIdentifier];
  v18 = [[PKSECredentialAddress alloc] initWithType:0 identifier:v7];
  [(PKSECredentialAddress *)v18 appendType:1 identifier:v17];
  v19 = [PKSEConsistencyCheckDeviceCredential alloc];
  v20 = [NSNumber numberWithUnsignedInteger:v10];
  uint64_t v21 = [(PKSEConsistencyCheckDeviceCredential *)v19 initWithType:1 state:v9 underlyingCredentialState:v20 address:v18];

  if (v21)
  {
    *(void *)(v21 + 56) = v11;
    *(unsigned char *)(v21 + 8) = v8;
  }

  return (id)v21;
}

+ (id)deviceCredentialWithApplet:(id)a3
{
  id v3 = a3;
  id v4 = [PKSECredentialAddress alloc];
  v5 = [v3 identifier];
  v6 = [(PKSECredentialAddress *)v4 initWithType:0 identifier:v5];

  uint64_t v7 = [v3 lifecycleState];
  uint64_t v8 = v7;
  if (v7 <= 14)
  {
    if (v7 == 1 || v7 == 3 || v7 == 7) {
      uint64_t v13 = 5;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v9 = 2;
    uint64_t v10 = 6;
    if (v7 != 130) {
      uint64_t v10 = 0;
    }
    if (v7 != 129) {
      uint64_t v9 = v10;
    }
    uint64_t v11 = 1;
    uint64_t v12 = 4;
    if (v7 != 23) {
      uint64_t v12 = 0;
    }
    if (v7 != 15) {
      uint64_t v11 = v12;
    }
    if (v7 <= 128) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v9;
    }
  }
  int v14 = [PKSEConsistencyCheckDeviceCredential alloc];
  int v15 = [NSNumber numberWithUnsignedInteger:v8];
  objc_super v16 = [(PKSEConsistencyCheckDeviceCredential *)v14 initWithType:0 state:v13 underlyingCredentialState:v15 address:v6];

  if (v16)
  {
    v17 = [PKSEConsistencyCheckDeviceCredentialAppletProperties alloc];
    char v18 = [v3 isLocked];
    char v19 = [v3 containsSubKeys];
    if (v17)
    {
      char v20 = v19;
      v24.receiver = v17;
      v24.super_class = (Class)PKSEConsistencyCheckDeviceCredentialAppletProperties;
      uint64_t v21 = objc_msgSendSuper2(&v24, sel_init);
      if (v21)
      {
        v21->_locked = v18;
        v21->_container = v20;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    appletProperties = v16->_appletProperties;
    v16->_appletProperties = v21;
  }
  return v16;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 2) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E56E00A0[type];
  }
  v5 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v5 appendFormat:@"type: '%@'; ", v4];
  objc_msgSend(v5, "appendFormat:", @"state: '%lu'; ", self->_state);
  objc_msgSend(v5, "appendFormat:", @"credentialType: '%lu'; ", self->_credentialType);
  [v5 appendFormat:@"underlyingCredentialState: '%@'; ", self->_underlyingCredentialState];
  v6 = [(PKSECredentialAddress *)self->_address shortDescription];
  [v5 appendFormat:@"address: '%@'; ", v6];

  if (self->_appletProperties) {
    [v5 appendFormat:@"appletProperties: '%@'; ", self->_appletProperties];
  }
  if (self->_isoProperties) {
    [v5 appendFormat:@"isoProperties: '%@'; ", self->_isoProperties];
  }
  keyMaterialHash = self->_keyMaterialHash;
  if (keyMaterialHash)
  {
    uint64_t v8 = [(NSData *)keyMaterialHash base64EncodedStringWithOptions:0];
    [v5 appendFormat:@"keyMaterialHash: '%@'; ", v8];
  }
  [v5 appendFormat:@">"];
  return v5;
}

- (PKSECredentialAddress)address
{
  return self->_address;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSData)keyMaterialHash
{
  return self->_keyMaterialHash;
}

- (NSNumber)underlyingCredentialState
{
  return self->_underlyingCredentialState;
}

- (void)setUnderlyingCredentialState:(id)a3
{
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (BOOL)shouldRegister
{
  return self->_shouldRegister;
}

- (PKSEConsistencyCheckDeviceCredentialAppletProperties)appletProperties
{
  return self->_appletProperties;
}

- (void)setAppletProperties:(id)a3
{
}

- (PKSEConsistencyCheckDeviceCredentialISO18013Properties)isoProperties
{
  return self->_isoProperties;
}

- (void)setIsoProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoProperties, 0);
  objc_storeStrong((id *)&self->_appletProperties, 0);
  objc_storeStrong((id *)&self->_underlyingCredentialState, 0);
  objc_storeStrong((id *)&self->_keyMaterialHash, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end