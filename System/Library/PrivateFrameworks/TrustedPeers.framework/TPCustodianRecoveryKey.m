@interface TPCustodianRecoveryKey
+ (id)custodianRecoveryKeyWithData:(id)a3 sig:(id)a4 keyFactory:(id)a5;
+ (id)peerIDForData:(id)a3 sig:(id)a4 peerIDHashAlgo:(int64_t)a5;
- (NSData)data;
- (NSData)sig;
- (NSString)peerID;
- (NSUUID)uuid;
- (TPCustodianRecoveryKey)initWithUUID:(id)a3 signingPublicKey:(id)a4 encryptionPublicKey:(id)a5 kind:(int)a6 data:(id)a7 sig:(id)a8 peerID:(id)a9;
- (TPCustodianRecoveryKey)initWithUUID:(id)a3 signingPublicKey:(id)a4 encryptionPublicKey:(id)a5 signingKeyPair:(id)a6 kind:(int)a7 error:(id *)a8;
- (TPPublicKey)encryptionPublicKey;
- (TPPublicKey)signingPublicKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)kind;
- (void)setEncryptionPublicKey:(id)a3;
- (void)setKind:(int)a3;
- (void)setPeerID:(id)a3;
- (void)setSigningPublicKey:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation TPCustodianRecoveryKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_encryptionPublicKey, 0);
  objc_storeStrong((id *)&self->_signingPublicKey, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSData)sig
{
  return self->_sig;
}

- (NSData)data
{
  return self->_data;
}

- (void)setKind:(int)a3
{
  self->_kind = a3;
}

- (int)kind
{
  return self->_kind;
}

- (void)setEncryptionPublicKey:(id)a3
{
}

- (TPPublicKey)encryptionPublicKey
{
  return self->_encryptionPublicKey;
}

- (void)setSigningPublicKey:(id)a3
{
}

- (TPPublicKey)signingPublicKey
{
  return self->_signingPublicKey;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)[(NSUUID *)self->_uuid copyWithZone:a3];
  [v5 setUuid:v6];

  [v5 setSigningPublicKey:self->_signingPublicKey];
  [v5 setEncryptionPublicKey:self->_encryptionPublicKey];
  v7 = (void *)[(NSString *)self->_peerID copyWithZone:a3];
  [v5 setPeerID:v7];

  [v5 setKind:self->_kind];
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [TPPBCustodianRecoveryKey alloc];
  v4 = [(TPCustodianRecoveryKey *)self data];
  v5 = [(TPPBCustodianRecoveryKey *)v3 initWithData:v4];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v7 = [(TPPBCustodianRecoveryKey *)v5 dictionaryRepresentation];
  [v6 addEntriesFromDictionary:v7];

  v8 = [(TPCustodianRecoveryKey *)self peerID];
  [v6 setObject:v8 forKeyedSubscript:@"peerID"];

  return v6;
}

- (TPCustodianRecoveryKey)initWithUUID:(id)a3 signingPublicKey:(id)a4 encryptionPublicKey:(id)a5 signingKeyPair:(id)a6 kind:(int)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = objc_alloc_init(TPPBCustodianRecoveryKey);
  v19 = [v14 UUIDString];
  [(TPPBCustodianRecoveryKey *)v18 setUuid:v19];

  v20 = [v15 spki];
  [(TPPBCustodianRecoveryKey *)v18 setSigningPublicKey:v20];

  v21 = [v16 spki];
  [(TPPBCustodianRecoveryKey *)v18 setEncryptionPublicKey:v21];

  [(TPPBCustodianRecoveryKey *)v18 setKind:v9];
  v22 = [(TPPBCustodianRecoveryKey *)v18 data];
  v23 = typesafeSignature(v17, v22, @"TPPB.CustodianRecoveryKey", a8);

  if (v23)
  {
    v24 = +[TPCustodianRecoveryKey peerIDForData:v22 sig:v23 peerIDHashAlgo:1];
    self = [(TPCustodianRecoveryKey *)self initWithUUID:v14 signingPublicKey:v15 encryptionPublicKey:v16 kind:v9 data:v22 sig:v23 peerID:v24];

    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (TPCustodianRecoveryKey)initWithUUID:(id)a3 signingPublicKey:(id)a4 encryptionPublicKey:(id)a5 kind:(int)a6 data:(id)a7 sig:(id)a8 peerID:(id)a9
{
  id v31 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v32.receiver = self;
  v32.super_class = (Class)TPCustodianRecoveryKey;
  v21 = [(TPCustodianRecoveryKey *)&v32 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_uuid, a3);
    objc_storeStrong((id *)&v22->_signingPublicKey, a4);
    objc_storeStrong((id *)&v22->_encryptionPublicKey, a5);
    v22->_kind = a6;
    uint64_t v23 = [v18 copy];
    data = v22->_data;
    v22->_data = (NSData *)v23;

    uint64_t v25 = [v19 copy];
    sig = v22->_sig;
    v22->_sig = (NSData *)v25;

    v27 = +[TPStringTable defaultTable];
    uint64_t v28 = [v27 stringWithString:v20];
    peerID = v22->_peerID;
    v22->_peerID = (NSString *)v28;
  }
  return v22;
}

+ (id)custodianRecoveryKeyWithData:(id)a3 sig:(id)a4 keyFactory:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [[TPPBCustodianRecoveryKey alloc] initWithData:v7];
  v11 = v10;
  if (v10)
  {
    v12 = [(TPPBCustodianRecoveryKey *)v10 signingPublicKey];
    v13 = [v9 keyFromSPKI:v12];

    if (v13 && checkTypesafeSignature(v13, v8, v7, @"TPPB.CustodianRecoveryKey"))
    {
      id v14 = [(TPPBCustodianRecoveryKey *)v11 encryptionPublicKey];
      id v15 = [v9 keyFromSPKI:v14];

      if (v15)
      {
        id v16 = +[TPCustodianRecoveryKey peerIDForData:v7 sig:v8 peerIDHashAlgo:1];
        id v17 = [TPCustodianRecoveryKey alloc];
        id v18 = objc_alloc(MEMORY[0x263F08C38]);
        id v19 = [(TPPBCustodianRecoveryKey *)v11 uuid];
        id v20 = (void *)[v18 initWithUUIDString:v19];
        v21 = [(TPCustodianRecoveryKey *)v17 initWithUUID:v20 signingPublicKey:v13 encryptionPublicKey:v15 kind:[(TPPBCustodianRecoveryKey *)v11 kind] data:v7 sig:v8 peerID:v16];
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)peerIDForData:(id)a3 sig:(id)a4 peerIDHashAlgo:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[TPHashBuilder alloc] initWithAlgo:a5];
  [(TPHashBuilder *)v9 updateWithData:v8];

  [(TPHashBuilder *)v9 updateWithData:v7];
  v10 = [(TPHashBuilder *)v9 finalHash];

  return v10;
}

@end