@interface InclusionProof
+ (id)descriptor;
- (KTOptInManagerServer)optInServer;
- (NSDictionary)metadata;
- (TransparencyFollowUpProtocol)followUp;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyMapInclusionProofVerifier)verifier;
- (id)mapLeafWithError:(id *)a3;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setOptInServer:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation InclusionProof

+ (id)descriptor
{
  id v2 = (id)qword_10032EDC8;
  if (!qword_10032EDC8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:InclusionProof messageName:@"InclusionProof" fileDescription:&unk_100324E10 fields:&off_100325248 fieldCount:4 storageSize:40 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B3A7];
    qword_10032EDC8 = (uint64_t)v2;
  }
  return v2;
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, @"dataStore");
}

- (void)setDataStore:(id)a3
{
}

- (TransparencyMapInclusionProofVerifier)verifier
{
  return (TransparencyMapInclusionProofVerifier *)objc_getAssociatedObject(self, @"verifier");
}

- (void)setVerifier:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, @"metadata");
}

- (void)setMetadata:(id)a3
{
}

- (KTOptInManagerServer)optInServer
{
  return (KTOptInManagerServer *)objc_getAssociatedObject(self, @"optInServerKey");
}

- (void)setOptInServer:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, @"optInServerKey", a3, (void *)1);
  }
}

- (TransparencyFollowUpProtocol)followUp
{
  return (TransparencyFollowUpProtocol *)objc_getAssociatedObject(self, @"followUpKey");
}

- (void)setFollowUp:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, @"followUpKey", a3, (void *)1);
  }
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = [(InclusionProof *)self metadata];
    id v8 = [v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v8 setObject:v9 forKeyedSubscript:v6];
    [(InclusionProof *)self setMetadata:v8];
  }
}

- (id)mapLeafWithError:(id *)a3
{
  if ([(InclusionProof *)self hasMapEntry]
    && ([(InclusionProof *)self mapEntry],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 mapLeaf],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = [(InclusionProof *)self mapEntry];
    id v8 = [v7 mapLeaf];
    id v9 = +[IdsMapLeaf parseFromData:v8 error:a3];

    if (!v9)
    {
      if (a3)
      {
        +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -142, *a3);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (qword_10032EFB8 != -1) {
        dispatch_once(&qword_10032EFB8, &stru_1002C5978);
      }
      v10 = qword_10032EFC0;
      if (os_log_type_enabled((os_log_t)qword_10032EFC0, OS_LOG_TYPE_ERROR))
      {
        if (a3) {
          id v11 = *a3;
        }
        else {
          id v11 = 0;
        }
        *(_DWORD *)buf = 138412290;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to decode map leaf: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (a3)
    {
      *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-16 description:@"KT Inclusion proof missing map leaf"];
    }
    if (qword_10032EFB8 != -1) {
      dispatch_once(&qword_10032EFB8, &stru_1002C5958);
    }
    v12 = qword_10032EFC0;
    if (os_log_type_enabled((os_log_t)qword_10032EFC0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "KT Inclusion proof missing map leaf", buf, 2u);
    }
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)verifyWithError:(id *)a3
{
  if ([(InclusionProof *)self hasMapEntry]
    && ([(InclusionProof *)self mapEntry],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if ([(InclusionProof *)self hasTopLevelTreeEntry]
      && ![(InclusionProof *)self hasPerApplicationTreeEntry])
    {
      uint64_t v49 = -11;
    }
    else
    {
      uint64_t v6 = [(InclusionProof *)self index];
      if (v6)
      {
        v7 = (void *)v6;
        id v8 = [(InclusionProof *)self index];
        id v9 = [v8 length];

        if (v9)
        {
          uint64_t v10 = [(InclusionProof *)self index];
          id v11 = [TransparencyMapEntryVerifier alloc];
          v12 = [(InclusionProof *)self verifier];
          v13 = [v12 keyBag];
          v14 = [v13 appSthKeyStore];
          v56 = (void *)v10;
          id v15 = [(TransparencyMapEntryVerifier *)v11 initWithPositon:v10 trustedKeyStore:v14];

          v16 = [TransparencyLogEntryVerifier alloc];
          v17 = [(InclusionProof *)self verifier];
          v18 = [v17 keyBag];
          v19 = [v18 appSthKeyStore];
          v20 = [(TransparencyLogEntryVerifier *)v16 initWithTrustedKeyStore:v19];

          v21 = [TransparencyLogEntryVerifier alloc];
          v22 = [(InclusionProof *)self verifier];
          v23 = [v22 keyBag];
          v24 = [v23 tltKeyStore];
          v57 = [(TransparencyLogEntryVerifier *)v21 initWithTrustedKeyStore:v24];

          v25 = [(InclusionProof *)self dataStore];
          v26 = [(InclusionProof *)self mapEntry];
          v55 = v15;
          [v26 setVerifier:v15];

          v27 = [(InclusionProof *)self mapEntry];
          [v27 setDataStore:v25];

          v28 = [(InclusionProof *)self mapEntry];
          v29 = [(InclusionProof *)self metadata];
          uint64_t v30 = kTransparencyResponseMetadataKeyServerHint;
          v31 = [v29 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
          [v28 setMetadataValue:v31 key:v30];

          v32 = [(InclusionProof *)self mapEntry];
          v33 = [(InclusionProof *)self verifier];
          v34 = [v33 keyBag];
          v35 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v34 patLogBeginningMs]);
          v36 = [v35 stringValue];
          [v32 setMetadataValue:v36 key:@"overrideLogBeginTime"];

          if ([(InclusionProof *)self hasPerApplicationTreeEntry]
            && ([(InclusionProof *)self perApplicationTreeEntry],
                v37 = objc_claimAutoreleasedReturnValue(),
                v37,
                v37))
          {
            v38 = [(InclusionProof *)self perApplicationTreeEntry];
            [v38 setVerifier:v20];
            [v38 setDataStore:v25];
            v39 = [(InclusionProof *)self metadata];
            v40 = [v39 objectForKeyedSubscript:v30];
            [v38 setMetadataValue:v40 key:v30];

            v41 = [(InclusionProof *)self optInServer];
            [v38 setOptInServer:v41];

            v42 = [(InclusionProof *)self followUp];
            [v38 setFollowUp:v42];

            if ([(InclusionProof *)self hasTopLevelTreeEntry])
            {
              v43 = [(InclusionProof *)self topLevelTreeEntry];

              if (v43)
              {
                v44 = [(InclusionProof *)self topLevelTreeEntry];
                [v44 setVerifier:v57];
                [v44 setDataStore:v25];
                v45 = [(InclusionProof *)self metadata];
                v46 = [v45 objectForKeyedSubscript:v30];
                [v44 setMetadataValue:v46 key:v30];

                v47 = [(InclusionProof *)self optInServer];
                [v44 setOptInServer:v47];

                v48 = [(InclusionProof *)self followUp];
                [v44 setFollowUp:v48];

LABEL_24:
                v52 = [(InclusionProof *)self verifier];
                v53 = [(InclusionProof *)self mapEntry];
                id v54 = [v52 verifyInclusionProofWithMapEntry:v53 perAppLogEntry:v38 topLevelTreeEntry:v44 error:a3];

                return (unint64_t)v54;
              }
            }
          }
          else
          {
            v38 = 0;
          }
          v44 = 0;
          goto LABEL_24;
        }
      }
      uint64_t v49 = -48;
    }
  }
  else
  {
    uint64_t v49 = -10;
  }
  if (a3)
  {
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:v49 description:@"KT Inclusion proof data required for verification"];
  }
  if (qword_10032EFB8 != -1) {
    dispatch_once(&qword_10032EFB8, &stru_1002C5998);
  }
  v50 = qword_10032EFC0;
  if (os_log_type_enabled((os_log_t)qword_10032EFC0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "KT Inclusion proof data required for verification", buf, 2u);
  }
  return 0;
}

@end