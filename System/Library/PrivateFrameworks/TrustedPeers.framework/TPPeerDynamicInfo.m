@interface TPPeerDynamicInfo
+ (id)dynamicInfoPBWithClock:(unint64_t)a3 includedPeerIDs:(id)a4 excludedPeerIDs:(id)a5 dispositions:(id)a6 preapprovals:(id)a7;
+ (id)dynamicInfoWithClock:(unint64_t)a3 includedPeerIDs:(id)a4 excludedPeerIDs:(id)a5 dispositions:(id)a6 preapprovals:(id)a7 signingKeyPair:(id)a8 error:(id *)a9;
+ (id)dynamicInfoWithData:(id)a3 sig:(id)a4;
- (BOOL)checkSignatureWithKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerDynamicInfo:(id)a3;
- (NSData)data;
- (NSData)sig;
- (NSDictionary)dispositions;
- (NSSet)excludedPeerIDs;
- (NSSet)includedPeerIDs;
- (NSSet)preapprovals;
- (TPPeerDynamicInfo)initWithObj:(id)a3 tsd:(id)a4;
- (TPTypedSignedData)tsd;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pb;
- (unint64_t)clock;
- (void)setTsd:(id)a3;
@end

@implementation TPPeerDynamicInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tsd, 0);
  objc_storeStrong((id *)&self->_preapprovals, 0);
  objc_storeStrong((id *)&self->_excludedPeerIDs, 0);
  objc_storeStrong((id *)&self->_includedPeerIDs, 0);
}

- (void)setTsd:(id)a3
{
}

- (TPTypedSignedData)tsd
{
  return self->_tsd;
}

- (NSSet)preapprovals
{
  return self->_preapprovals;
}

- (NSSet)excludedPeerIDs
{
  return self->_excludedPeerIDs;
}

- (NSSet)includedPeerIDs
{
  return self->_includedPeerIDs;
}

- (unint64_t)clock
{
  return self->_clock;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TPPeerDynamicInfo *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPPeerDynamicInfo *)self isEqualToPeerDynamicInfo:v4];
  }

  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  v4 = [(TPPeerDynamicInfo *)self dictionaryRepresentation];
  BOOL v5 = [v4 description];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  v4 = [(TPPeerDynamicInfo *)self pb];
  BOOL v5 = [v4 dictionaryRepresentation];

  return v5;
}

- (BOOL)isEqualToPeerDynamicInfo:(id)a3
{
  v4 = (TPPeerDynamicInfo *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    BOOL v5 = [(TPPeerDynamicInfo *)self data];
    v6 = [(TPPeerDynamicInfo *)v4 data];
    if ([v5 isEqualToData:v6])
    {
      v7 = [(TPPeerDynamicInfo *)self sig];
      v8 = [(TPPeerDynamicInfo *)v4 sig];
      char v9 = [v7 isEqualToData:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (NSData)sig
{
  v2 = [(TPPeerDynamicInfo *)self tsd];
  v3 = [v2 sig];

  return (NSData *)v3;
}

- (NSData)data
{
  v2 = [(TPPeerDynamicInfo *)self tsd];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TPPeerDynamicInfo *)self tsd];
  char v6 = [v5 checkSignatureWithKey:v4];

  return v6;
}

- (NSDictionary)dispositions
{
  v3 = +[TPStringTable defaultTable];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v5 = (void *)MEMORY[0x210554CF0]();
  char v6 = [(TPPeerDynamicInfo *)self pb];
  v7 = [v6 dispositions];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__TPPeerDynamicInfo_dispositions__block_invoke;
  v11[3] = &unk_2640EC500;
  id v8 = v4;
  id v12 = v8;
  id v9 = v3;
  id v13 = v9;
  [v7 enumerateObjectsUsingBlock:v11];

  return (NSDictionary *)v8;
}

void __33__TPPeerDynamicInfo_dispositions__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 peerID];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [v11 disposition];

    if (v5)
    {
      char v6 = [v11 disposition];
      id v8 = *(void **)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      id v9 = [v11 peerID];
      v10 = [v7 stringWithString:v9];
      [v8 setObject:v6 forKeyedSubscript:v10];
    }
  }
}

- (id)pb
{
  uint64_t v3 = [TPPBPeerDynamicInfo alloc];
  id v4 = [(TPPeerDynamicInfo *)self data];
  BOOL v5 = [(TPPBPeerDynamicInfo *)v3 initWithData:v4];

  return v5;
}

- (TPPeerDynamicInfo)initWithObj:(id)a3 tsd:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TPStringTable defaultTable];
  v20.receiver = self;
  v20.super_class = (Class)TPPeerDynamicInfo;
  id v9 = [(TPPeerDynamicInfo *)&v20 init];
  if (v9)
  {
    v9->_clock = [v6 clock];
    v10 = [v6 includeds];
    uint64_t v11 = [v8 setWithArray:v10];
    includedPeerIDs = v9->_includedPeerIDs;
    v9->_includedPeerIDs = (NSSet *)v11;

    id v13 = [v6 excludeds];
    uint64_t v14 = [v8 setWithArray:v13];
    excludedPeerIDs = v9->_excludedPeerIDs;
    v9->_excludedPeerIDs = (NSSet *)v14;

    v16 = [v6 preapprovals];
    uint64_t v17 = [v8 setWithArray:v16];
    preapprovals = v9->_preapprovals;
    v9->_preapprovals = (NSSet *)v17;

    objc_storeStrong((id *)&v9->_tsd, a4);
  }

  return v9;
}

+ (id)dynamicInfoWithData:(id)a3 sig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x210554CF0]();
  id v8 = [[TPPBPeerDynamicInfo alloc] initWithData:v5];
  if (v8)
  {
    id v9 = [TPPeerDynamicInfo alloc];
    v10 = [[TPTypedSignedData alloc] initWithData:v5 sig:v6 signatureTypeName:@"TPPB.PeerDynamicInfo"];
    uint64_t v11 = [(TPPeerDynamicInfo *)v9 initWithObj:v8 tsd:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)dynamicInfoWithClock:(unint64_t)a3 includedPeerIDs:(id)a4 excludedPeerIDs:(id)a5 dispositions:(id)a6 preapprovals:(id)a7 signingKeyPair:(id)a8 error:(id *)a9
{
  v15 = (TPPeerDynamicInfo *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  objc_super v20 = (void *)MEMORY[0x210554CF0]();
  v26 = v15;
  v21 = [a1 dynamicInfoPBWithClock:a3 includedPeerIDs:v15 excludedPeerIDs:v16 dispositions:v17 preapprovals:v18];
  v22 = [v21 data];
  id v27 = 0;
  v23 = [[TPTypedSignedData alloc] initWithData:v22 key:v19 signatureTypeName:@"TPPB.PeerDynamicInfo" error:&v27];
  id v24 = v27;
  if (v23) {
    v15 = [[TPPeerDynamicInfo alloc] initWithObj:v21 tsd:v23];
  }

  if (!v23)
  {
    v15 = 0;
    if (a9)
    {
      if (v24)
      {
        v15 = 0;
        *a9 = v24;
      }
    }
  }

  return v15;
}

+ (id)dynamicInfoPBWithClock:(unint64_t)a3 includedPeerIDs:(id)a4 excludedPeerIDs:(id)a5 dispositions:(id)a6 preapprovals:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = objc_alloc_init(TPPBPeerDynamicInfo);
  [(TPPBPeerDynamicInfo *)v15 setClock:a3];
  id v16 = [v14 allObjects];

  id v17 = (void *)[v16 mutableCopy];
  [(TPPBPeerDynamicInfo *)v15 setIncludeds:v17];

  id v18 = [v13 allObjects];

  id v19 = (void *)[v18 mutableCopy];
  [(TPPBPeerDynamicInfo *)v15 setExcludeds:v19];

  objc_super v20 = [v11 allObjects];

  v21 = (void *)[v20 mutableCopy];
  [(TPPBPeerDynamicInfo *)v15 setPreapprovals:v21];

  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(TPPBPeerDynamicInfo *)v15 setDispositions:v22];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __102__TPPeerDynamicInfo_dynamicInfoPBWithClock_includedPeerIDs_excludedPeerIDs_dispositions_preapprovals___block_invoke;
  v25[3] = &unk_2640EC4D8;
  v23 = v15;
  v26 = v23;
  [v12 enumerateKeysAndObjectsUsingBlock:v25];

  return v23;
}

void __102__TPPeerDynamicInfo_dynamicInfoPBWithClock_includedPeerIDs_excludedPeerIDs_dispositions_preapprovals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init(TPPBDispositionEntry);
  [(TPPBDispositionEntry *)v8 setPeerID:v6];

  [(TPPBDispositionEntry *)v8 setDisposition:v5];
  id v7 = [*(id *)(a1 + 32) dispositions];
  [v7 addObject:v8];
}

@end