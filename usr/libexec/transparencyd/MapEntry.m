@interface MapEntry
+ (id)descriptor;
- (NSDictionary)metadata;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyMapEntryVerifier)verifier;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setVerifier:(id)a3;
@end

@implementation MapEntry

+ (id)descriptor
{
  id v2 = (id)qword_10032EDC0;
  if (!qword_10032EDC0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:MapEntry messageName:@"MapEntry" fileDescription:&unk_100324E10 fields:&off_1003251E8 fieldCount:3 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B386];
    qword_10032EDC0 = (uint64_t)v2;
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
    v7 = [(MapEntry *)self metadata];
    id v8 = [v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v8 setObject:v9 forKeyedSubscript:v6];
    [(MapEntry *)self setMetadata:v8];
  }
}

- (unint64_t)verifyWithError:(id *)a3
{
  if (![(MapEntry *)self hasSmh]
    || ([(MapEntry *)self smh], v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    uint64_t v26 = -15;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v6 = [(MapEntry *)self mapLeaf];
  if (!v6
    || (v7 = (void *)v6,
        [(MapEntry *)self mapLeaf],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 length],
        v8,
        v7,
        !v9))
  {
    uint64_t v26 = -16;
    if (!a3) {
      goto LABEL_12;
    }
LABEL_11:
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:v26 description:@"map entry data required for verification"];
    goto LABEL_12;
  }
  uint64_t v10 = [(MapEntry *)self hashesOfPeersInPathToRootArray];
  if (v10)
  {
    v11 = (void *)v10;
    id v12 = [(MapEntry *)self hashesOfPeersInPathToRootArray_Count];

    if (v12)
    {
      v13 = [(MapEntry *)self smh];
      v14 = [(MapEntry *)self verifier];
      v15 = [v14 trustedKeyStore];
      v16 = [v15 signatureVerifier];
      v17 = [(MapEntry *)self dataStore];
      v18 = +[SignedMapHead signedTypeWithObject:v13 verifier:v16 dataStore:v17];

      v19 = [(MapEntry *)self metadata];
      v20 = [v19 objectForKeyedSubscript:@"overrideLogBeginTime"];
      [v18 setOverrideBeginTime:[v20 longLongValue]];

      v21 = [(MapEntry *)self verifier];
      v22 = [(MapEntry *)self mapLeaf];
      v23 = [(MapEntry *)self hashesOfPeersInPathToRootArray];
      id v24 = [v21 verifyMapEntryWithMapLeaf:v22 hashesToRoot:v23 signedMapHead:v18 error:a3];

      return (unint64_t)v24;
    }
  }
  uint64_t v26 = -17;
  if (a3) {
    goto LABEL_11;
  }
LABEL_12:
  if (qword_10032F2D8 != -1) {
    dispatch_once(&qword_10032F2D8, &stru_1002C9440);
  }
  v27 = qword_10032F2E0;
  if (os_log_type_enabled((os_log_t)qword_10032F2E0, OS_LOG_TYPE_ERROR))
  {
    int v28 = 134217984;
    uint64_t v29 = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "map entry data required for verification: %ld", (uint8_t *)&v28, 0xCu);
  }
  return 0;
}

@end