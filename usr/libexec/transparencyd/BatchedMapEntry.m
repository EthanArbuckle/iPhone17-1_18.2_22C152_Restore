@interface BatchedMapEntry
+ (id)descriptor;
- (NSDictionary)metadata;
- (SignedMapHead)smh;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyMapEntryVerifier)verifier;
- (id)diagnosticsJsonDictionary;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setSmh:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation BatchedMapEntry

+ (id)descriptor
{
  id v2 = (id)qword_10032EEC0;
  if (!qword_10032EEC0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:BatchedMapEntry messageName:@"BatchedMapEntry" fileDescription:&unk_100325780 fields:&off_100325998 fieldCount:3 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B42D];
    qword_10032EEC0 = (uint64_t)v2;
  }
  return v2;
}

- (TransparencyMapEntryVerifier)verifier
{
  return (TransparencyMapEntryVerifier *)objc_getAssociatedObject(self, @"verifierKey");
}

- (void)setVerifier:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, @"dataStoreKey");
}

- (void)setDataStore:(id)a3
{
}

- (SignedMapHead)smh
{
  return (SignedMapHead *)objc_getAssociatedObject(self, @"smh");
}

- (void)setSmh:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, @"metadata");
}

- (void)setMetadata:(id)a3
{
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = [(BatchedMapEntry *)self metadata];
    id v8 = [v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v8 setObject:v9 forKeyedSubscript:v6];
    [(BatchedMapEntry *)self setMetadata:v8];
  }
}

- (id)diagnosticsJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(BatchedMapEntry *)self index];
  v5 = [v4 kt_hexString];
  [v3 setObject:v5 forKeyedSubscript:@"index"];

  id v6 = [(BatchedMapEntry *)self mapLeaf];
  v7 = [v6 kt_hexString];
  [v3 setObject:v7 forKeyedSubscript:@"mapLeaf"];

  id v8 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(BatchedMapEntry *)self hashesOfPeersInPathToRootArray];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) kt_hexString];
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v3 setObject:v8 forKeyedSubscript:@"hashesOfPeersInPathToRoot"];

  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  uint64_t v5 = [(BatchedMapEntry *)self mapLeaf];
  if (!v5
    || (id v6 = (void *)v5,
        [(BatchedMapEntry *)self mapLeaf],
        v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 length],
        v7,
        v6,
        !v8))
  {
    uint64_t v22 = -16;
    if (!a3)
    {
LABEL_9:
      if (qword_10032EFC8 != -1) {
        dispatch_once(&qword_10032EFC8, &stru_1002C59B8);
      }
      uint64_t v23 = qword_10032EFD0;
      if (!os_log_type_enabled((os_log_t)qword_10032EFD0, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v22;
      v24 = "map entry data required for verification: %ld";
      v25 = v23;
      uint32_t v26 = 12;
      goto LABEL_13;
    }
LABEL_8:
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:v22 description:@"map entry data required for verification"];
    goto LABEL_9;
  }
  uint64_t v9 = [(BatchedMapEntry *)self hashesOfPeersInPathToRootArray];
  if (!v9
    || (id v10 = (void *)v9,
        id v11 = [(BatchedMapEntry *)self hashesOfPeersInPathToRootArray_Count],
        v10,
        !v11))
  {
    uint64_t v22 = -17;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v12 = [(BatchedMapEntry *)self verifier];
  v13 = [(BatchedMapEntry *)self mapLeaf];
  v29 = [(BatchedMapEntry *)self verifier];
  v14 = [v29 entryPosition];
  v28 = [(BatchedMapEntry *)self smh];
  v15 = [v28 parsedMapHead];
  long long v16 = [v15 mapHeadHash];
  long long v17 = [(BatchedMapEntry *)self smh];
  long long v18 = [v17 parsedMapHead];
  id v19 = [v18 treeId];
  v20 = [(BatchedMapEntry *)self hashesOfPeersInPathToRootArray];
  LOBYTE(v19) = [v12 verifyInclusionOfMapLeaf:v13 position:v14 treeHead:v16 treeId:v19 hashPath:v20 error:a3];

  if (v19) {
    return 1;
  }
  if (a3)
  {
    *a3 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-43 underlyingError:*a3 description:@"failed to verify inclusion proof for map leaf in mapHeadHash"];
  }
  if (qword_10032EFC8 != -1) {
    dispatch_once(&qword_10032EFC8, &stru_1002C59D8);
  }
  uint64_t v27 = qword_10032EFD0;
  if (os_log_type_enabled((os_log_t)qword_10032EFD0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v24 = "failed to verify inclusion proof for map leaf in mapHeadHash";
    v25 = v27;
    uint32_t v26 = 2;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
  }
  return 0;
}

@end