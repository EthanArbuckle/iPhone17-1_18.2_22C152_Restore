@interface TPPeerPermanentInfo
+ (id)mungeModelID:(id)a3;
+ (id)peerIDForData:(id)a3 sig:(id)a4 peerIDHashAlgo:(int64_t)a5;
+ (id)permanentInfoWithMachineID:(id)a3 modelID:(id)a4 epoch:(unint64_t)a5 signingKeyPair:(id)a6 encryptionKeyPair:(id)a7 creationTime:(unint64_t)a8 peerIDHashAlgo:(int64_t)a9 error:(id *)a10;
+ (id)permanentInfoWithPeerID:(id)a3 data:(id)a4 sig:(id)a5 keyFactory:(id)a6;
+ (id)permanentInfoWithPeerID:(id)a3 data:(id)a4 sig:(id)a5 keyFactory:(id)a6 checkSig:(BOOL)a7;
- (NSData)data;
- (NSData)sig;
- (NSString)machineID;
- (NSString)modelID;
- (NSString)peerID;
- (TPPeerPermanentInfo)initWithMachineID:(id)a3 modelID:(id)a4 epoch:(unint64_t)a5 signingPubKey:(id)a6 encryptionPubKey:(id)a7 creationTime:(unint64_t)a8 data:(id)a9 sig:(id)a10 peerID:(id)a11;
- (TPPublicKey)encryptionPubKey;
- (TPPublicKey)signingPubKey;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)creationTime;
- (unint64_t)epoch;
@end

@implementation TPPeerPermanentInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_encryptionPubKey, 0);
  objc_storeStrong((id *)&self->_signingPubKey, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
}

- (NSString)peerID
{
  return self->_peerID;
}

- (NSData)sig
{
  return self->_sig;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)creationTime
{
  return self->_creationTime;
}

- (TPPublicKey)encryptionPubKey
{
  return self->_encryptionPubKey;
}

- (TPPublicKey)signingPubKey
{
  return self->_signingPubKey;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSString)machineID
{
  return self->_machineID;
}

- (id)description
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  v4 = [(TPPeerPermanentInfo *)self dictionaryRepresentation];
  v5 = [v4 description];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [TPPBPeerPermanentInfo alloc];
  v4 = [(TPPeerPermanentInfo *)self data];
  v5 = [(TPPBPeerPermanentInfo *)v3 initWithData:v4];

  v6 = [(TPPBPeerPermanentInfo *)v5 dictionaryRepresentation];

  return v6;
}

- (TPPeerPermanentInfo)initWithMachineID:(id)a3 modelID:(id)a4 epoch:(unint64_t)a5 signingPubKey:(id)a6 encryptionPubKey:(id)a7 creationTime:(unint64_t)a8 data:(id)a9 sig:(id)a10 peerID:(id)a11
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a6;
  id v27 = a7;
  id v26 = a9;
  id v17 = a10;
  id v18 = a11;
  v31.receiver = self;
  v31.super_class = (Class)TPPeerPermanentInfo;
  v19 = [(TPPeerPermanentInfo *)&v31 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_machineID, a3);
    objc_storeStrong((id *)&v20->_modelID, a4);
    v20->_epoch = a5;
    objc_storeStrong((id *)&v20->_signingPubKey, a6);
    objc_storeStrong((id *)&v20->_encryptionPubKey, a7);
    v20->_creationTime = a8;
    objc_storeStrong((id *)&v20->_data, a9);
    objc_storeStrong((id *)&v20->_sig, a10);
    v21 = +[TPStringTable defaultTable];
    uint64_t v22 = [v21 stringWithString:v18];
    peerID = v20->_peerID;
    v20->_peerID = (NSString *)v22;
  }
  return v20;
}

+ (id)permanentInfoWithPeerID:(id)a3 data:(id)a4 sig:(id)a5 keyFactory:(id)a6 checkSig:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [[TPPBPeerPermanentInfo alloc] initWithData:v12];
  v16 = v15;
  if (v15)
  {
    id v17 = [(TPPBPeerPermanentInfo *)v15 signingPubKey];
    id v18 = (TPPeerPermanentInfo *)[v17 length];

    if (v18)
    {
      v19 = [(TPPBPeerPermanentInfo *)v16 encryptionPubKey];
      id v18 = (TPPeerPermanentInfo *)[v19 length];

      if (v18)
      {
        v20 = [(TPPBPeerPermanentInfo *)v16 signingPubKey];
        v21 = [v14 keyFromSPKI:v20];

        if (!v21
          || v7 && !checkTypesafeSignature(v21, v13, v12, @"TPPB.PeerPermanentInfo")
          || (int64_t v22 = +[TPHashBuilder algoOfHash:v11], v22 == -1))
        {
          id v18 = 0;
        }
        else
        {
          v23 = +[TPPeerPermanentInfo peerIDForData:v12 sig:v13 peerIDHashAlgo:v22];
          if ([v23 isEqualToString:v11])
          {
            v24 = [(TPPBPeerPermanentInfo *)v16 encryptionPubKey];
            v25 = [v14 keyFromSPKI:v24];

            if (v25)
            {
              id v29 = [TPPeerPermanentInfo alloc];
              id v28 = [(TPPBPeerPermanentInfo *)v16 machineId];
              id v26 = [(TPPBPeerPermanentInfo *)v16 modelId];
              id v18 = [(TPPeerPermanentInfo *)v29 initWithMachineID:v28 modelID:v26 epoch:[(TPPBPeerPermanentInfo *)v16 epoch] signingPubKey:v21 encryptionPubKey:v25 creationTime:[(TPPBPeerPermanentInfo *)v16 creationTime] data:v12 sig:v13 peerID:v11];
            }
            else
            {
              id v18 = 0;
            }
          }
          else
          {
            id v18 = 0;
          }
        }
      }
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (id)permanentInfoWithPeerID:(id)a3 data:(id)a4 sig:(id)a5 keyFactory:(id)a6
{
  return +[TPPeerPermanentInfo permanentInfoWithPeerID:a3 data:a4 sig:a5 keyFactory:a6 checkSig:1];
}

+ (id)peerIDForData:(id)a3 sig:(id)a4 peerIDHashAlgo:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[TPHashBuilder alloc] initWithAlgo:a5];
  [(TPHashBuilder *)v9 updateWithData:v8];

  [(TPHashBuilder *)v9 updateWithData:v7];
  v10 = [(TPHashBuilder *)v9 finalHash];

  return v10;
}

+ (id)permanentInfoWithMachineID:(id)a3 modelID:(id)a4 epoch:(unint64_t)a5 signingKeyPair:(id)a6 encryptionKeyPair:(id)a7 creationTime:(unint64_t)a8 peerIDHashAlgo:(int64_t)a9 error:(id *)a10
{
  v15 = a10;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a6;
  v20 = [v19 publicKey];
  v21 = [v18 publicKey];

  if (TPBecomeiProdOverride())
  {
    id v38 = 0;
    unint64_t v22 = a8;
    v23 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^[^0-9,]*" options:0 error:&v38];
    id v24 = v38;
    if (v23)
    {
      objc_msgSend(v23, "stringByReplacingMatchesInString:options:range:withTemplate:", v17, 0, 0, -[NSObject length](v17, "length"), @"iProd");
      id v17 = v25 = v17;
    }
    else
    {
      v25 = TPModelLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v40 = v24;
        _os_log_impl(&dword_20CB20000, v25, OS_LOG_TYPE_DEFAULT, "Failed to make regex; cannot change modelID: %{public}@",
          buf,
          0xCu);
      }
    }

    a8 = v22;
    v15 = a10;
  }
  uint64_t v26 = +[TPPeerPermanentInfo mungeModelID:v17];

  id v27 = objc_alloc_init(TPPBPeerPermanentInfo);
  [(TPPBPeerPermanentInfo *)v27 setMachineId:v16];
  v37 = (void *)v26;
  [(TPPBPeerPermanentInfo *)v27 setModelId:v26];
  [(TPPBPeerPermanentInfo *)v27 setEpoch:a5];
  id v28 = [v20 spki];
  [(TPPBPeerPermanentInfo *)v27 setSigningPubKey:v28];

  id v29 = [v21 spki];
  [(TPPBPeerPermanentInfo *)v27 setEncryptionPubKey:v29];

  [(TPPBPeerPermanentInfo *)v27 setCreationTime:a8];
  id v30 = [(TPPBPeerPermanentInfo *)v27 data];
  typesafeSignature(v19, v30, @"TPPB.PeerPermanentInfo", v15);
  objc_super v31 = v16;
  v33 = unint64_t v32 = a8;

  if (v33)
  {
    v34 = +[TPPeerPermanentInfo peerIDForData:v30 sig:v33 peerIDHashAlgo:a9];
    v35 = [[TPPeerPermanentInfo alloc] initWithMachineID:v31 modelID:v37 epoch:a5 signingPubKey:v20 encryptionPubKey:v21 creationTime:v32 data:v30 sig:v33 peerID:v34];
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

+ (id)mungeModelID:(id)a3
{
  id v3 = a3;
  return v3;
}

@end