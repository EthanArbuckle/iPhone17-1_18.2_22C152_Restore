@interface TPPeer
+ (BOOL)verifyHMACWithPermanentInfoData:(id)a3 permanentInfoSig:(id)a4 stableInfoData:(id)a5 stableInfoSig:(id)a6 dynamicInfoData:(id)a7 dynamicInfoSig:(id)a8 hmacKey:(id)a9 hmacSig:(id)a10;
+ (id)calculateHmacWithHmacKey:(id)a3 permanentInfoData:(id)a4 permanentInfoSig:(id)a5 stableInfoData:(id)a6 stableInfoSig:(id)a7 dynamicInfoData:(id)a8 dynamicInfoSig:(id)a9;
- (NSSet)trustedPeerIDs;
- (NSString)peerID;
- (TPPeer)initWithPermanentInfo:(id)a3;
- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5;
- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5 checkSig:(BOOL)a6 error:(id *)a7;
- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5 error:(id *)a6;
- (TPPeer)peerWithUpdatedDynamicInfo:(id)a3 error:(id *)a4;
- (TPPeer)peerWithUpdatedStableInfo:(id)a3 error:(id *)a4;
- (TPPeerDynamicInfo)dynamicInfo;
- (TPPeerPermanentInfo)permanentInfo;
- (TPPeerStableInfo)stableInfo;
- (id)calculateHmacWithHmacKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation TPPeer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicInfo, 0);
  objc_storeStrong((id *)&self->_stableInfo, 0);
  objc_storeStrong((id *)&self->_permanentInfo, 0);
}

- (TPPeerDynamicInfo)dynamicInfo
{
  return self->_dynamicInfo;
}

- (TPPeerStableInfo)stableInfo
{
  return self->_stableInfo;
}

- (TPPeerPermanentInfo)permanentInfo
{
  return self->_permanentInfo;
}

- (id)description
{
  v14[3] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  v13[0] = @"permanentInfo";
  v4 = [(TPPeer *)self permanentInfo];
  v5 = [v4 dictionaryRepresentation];
  v14[0] = v5;
  v13[1] = @"stableInfo";
  v6 = [(TPPeer *)self stableInfo];
  v7 = [v6 dictionaryRepresentation];
  v14[1] = v7;
  v13[2] = @"dynamicInfo";
  v8 = [(TPPeer *)self dynamicInfo];
  v9 = [v8 dictionaryRepresentation];
  v14[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  v11 = [v10 description];

  return v11;
}

- (NSSet)trustedPeerIDs
{
  v3 = [(TPPeer *)self dynamicInfo];

  if (v3)
  {
    v4 = [(TPPeer *)self dynamicInfo];
    [v4 includedPeerIDs];
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    v4 = [(TPPeer *)self peerID];
    [v5 setWithObject:v4];
  v6 = };

  return (NSSet *)v6;
}

- (TPPeer)peerWithUpdatedDynamicInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(TPPeer *)self dynamicInfo];
  int v8 = [v7 isEqualToPeerDynamicInfo:v6];

  if (v8)
  {
    v9 = (TPPeer *)[(TPPeer *)self copy];
    goto LABEL_13;
  }
  v10 = [(TPPeer *)self permanentInfo];
  v11 = [v10 signingPubKey];
  char v12 = [v6 checkSignatureWithKey:v11];

  if (v12)
  {
    uint64_t v13 = [(TPPeer *)self dynamicInfo];
    if (!v13
      || (v14 = (void *)v13,
          unint64_t v15 = [v6 clock],
          [(TPPeer *)self dynamicInfo],
          v16 = objc_claimAutoreleasedReturnValue(),
          unint64_t v17 = [v16 clock],
          v16,
          v14,
          v15 > v17))
    {
      v18 = [TPPeer alloc];
      v19 = [(TPPeer *)self permanentInfo];
      v20 = [(TPPeer *)self stableInfo];
      v9 = [(TPPeer *)v18 initWithPermanentInfo:v19 stableInfo:v20 dynamicInfo:v6];

      goto LABEL_13;
    }
    if (a4)
    {
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = TPResultErrorDomain;
      uint64_t v23 = 2;
      goto LABEL_11;
    }
  }
  else if (a4)
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = TPResultErrorDomain;
    uint64_t v23 = 1;
LABEL_11:
    [v21 errorWithDomain:v22 code:v23 userInfo:0];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (TPPeer)peerWithUpdatedStableInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(TPPeer *)self stableInfo];
  int v8 = [v7 isEqualToPeerStableInfo:v6];

  if (v8)
  {
    v9 = (TPPeer *)[(TPPeer *)self copy];
    goto LABEL_13;
  }
  v10 = [(TPPeer *)self permanentInfo];
  v11 = [v10 signingPubKey];
  char v12 = [v6 checkSignatureWithKey:v11];

  if (v12)
  {
    uint64_t v13 = [(TPPeer *)self stableInfo];
    if (!v13
      || (v14 = (void *)v13,
          unint64_t v15 = [v6 clock],
          [(TPPeer *)self stableInfo],
          v16 = objc_claimAutoreleasedReturnValue(),
          unint64_t v17 = [v16 clock],
          v16,
          v14,
          v15 > v17))
    {
      v18 = [TPPeer alloc];
      v19 = [(TPPeer *)self permanentInfo];
      v20 = [(TPPeer *)self dynamicInfo];
      v9 = [(TPPeer *)v18 initWithPermanentInfo:v19 stableInfo:v6 dynamicInfo:v20];

      goto LABEL_13;
    }
    if (a4)
    {
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = TPResultErrorDomain;
      uint64_t v23 = 2;
      goto LABEL_11;
    }
  }
  else if (a4)
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = TPResultErrorDomain;
    uint64_t v23 = 1;
LABEL_11:
    [v21 errorWithDomain:v22 code:v23 userInfo:0];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)calculateHmacWithHmacKey:(id)a3
{
  id v4 = a3;
  v18 = [(TPPeer *)self permanentInfo];
  v5 = [v18 data];
  unint64_t v17 = [(TPPeer *)self permanentInfo];
  id v6 = [v17 sig];
  v16 = [(TPPeer *)self stableInfo];
  v7 = [v16 data];
  int v8 = [(TPPeer *)self stableInfo];
  v9 = [v8 sig];
  v10 = [(TPPeer *)self dynamicInfo];
  v11 = [v10 data];
  char v12 = [(TPPeer *)self dynamicInfo];
  uint64_t v13 = [v12 sig];
  id v15 = +[TPPeer calculateHmacWithHmacKey:v4 permanentInfoData:v5 permanentInfoSig:v6 stableInfoData:v7 stableInfoSig:v9 dynamicInfoData:v11 dynamicInfoSig:v13];

  return v15;
}

- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5 checkSig:(BOOL)a6 error:(id *)a7
{
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = v14;
  if (!v8) {
    goto LABEL_10;
  }
  if (v13)
  {
    uint64_t v8 = [v12 signingPubKey];
    if (([v13 checkSignatureWithKey:v8] & 1) == 0)
    {

      goto LABEL_13;
    }
    if (!v15)
    {

LABEL_10:
      self = [(TPPeer *)self initWithPermanentInfo:v12 stableInfo:v13 dynamicInfo:v15];
      v18 = self;
      goto LABEL_11;
    }
  }
  else if (!v14)
  {
    goto LABEL_10;
  }
  v16 = [v12 signingPubKey];
  char v17 = [v15 checkSignatureWithKey:v16];

  if (v13) {
  if (v17)
  }
    goto LABEL_10;
LABEL_13:
  if (a7)
  {
    [MEMORY[0x263F087E8] errorWithDomain:TPResultErrorDomain code:1 userInfo:0];
    v18 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_11:

  return v18;
}

- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5 error:(id *)a6
{
  return [(TPPeer *)self initWithPermanentInfo:a3 stableInfo:a4 dynamicInfo:a5 checkSig:1 error:a6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [TPPeer alloc];
  v5 = [(TPPeer *)self permanentInfo];
  id v6 = [(TPPeer *)self stableInfo];
  v7 = [(TPPeer *)self dynamicInfo];
  uint64_t v8 = [(TPPeer *)v4 initWithPermanentInfo:v5 stableInfo:v6 dynamicInfo:v7];

  return v8;
}

- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPPeer;
  id v12 = [(TPPeer *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_permanentInfo, a3);
    objc_storeStrong((id *)&v13->_stableInfo, a4);
    objc_storeStrong((id *)&v13->_dynamicInfo, a5);
  }

  return v13;
}

- (TPPeer)initWithPermanentInfo:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPPeer;
  id v6 = [(TPPeer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_permanentInfo, a3);
    stableInfo = v7->_stableInfo;
    v7->_stableInfo = 0;

    dynamicInfo = v7->_dynamicInfo;
    v7->_dynamicInfo = 0;
  }
  return v7;
}

- (NSString)peerID
{
  v2 = [(TPPeer *)self permanentInfo];
  v3 = [v2 peerID];

  return (NSString *)v3;
}

+ (BOOL)verifyHMACWithPermanentInfoData:(id)a3 permanentInfoSig:(id)a4 stableInfoData:(id)a5 stableInfoSig:(id)a6 dynamicInfoData:(id)a7 dynamicInfoSig:(id)a8 hmacKey:(id)a9 hmacSig:(id)a10
{
  id v16 = a10;
  char v17 = +[TPPeer calculateHmacWithHmacKey:a9 permanentInfoData:a3 permanentInfoSig:a4 stableInfoData:a5 stableInfoSig:a6 dynamicInfoData:a7 dynamicInfoSig:a8];
  LOBYTE(a7) = [v17 isEqualToData:v16];

  return (char)a7;
}

+ (id)calculateHmacWithHmacKey:(id)a3 permanentInfoData:(id)a4 permanentInfoSig:(id)a5 stableInfoData:(id)a6 stableInfoSig:(id)a7 dynamicInfoData:(id)a8 dynamicInfoSig:(id)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v19 = (objc_class *)MEMORY[0x263EFF990];
  id v20 = a5;
  id v21 = a4;
  id v22 = objc_alloc_init(v19);
  uint64_t v23 = [@"TPPeer" dataUsingEncoding:4];
  [v22 appendData:v23];

  [v22 appendData:v21];
  [v22 appendData:v20];

  if (v15 && v16)
  {
    [v22 appendData:v15];
    [v22 appendData:v16];
  }
  if (v17 && v18)
  {
    [v22 appendData:v17];
    [v22 appendData:v18];
  }
  v24 = +[TPHashBuilder keyedHashWithAlgo:4 key:v14 data:v22];

  return v24;
}

@end