@interface BatchQueryResponse
+ (id)descriptor;
- (KTOptInManagerServer)optInServer;
- (NSDictionary)metadata;
- (SignedMapHead)verifiableSmh;
- (TransparencyFollowUpProtocol)followUp;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyMapInclusionProofVerifier)verifier;
- (id)diagnosticsJsonDictionary;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setOptInServer:(id)a3;
- (void)setVerifiableSmh:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation BatchQueryResponse

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

- (SignedMapHead)verifiableSmh
{
  return (SignedMapHead *)objc_getAssociatedObject(self, @"smh");
}

- (void)setVerifiableSmh:(id)a3
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

- (id)diagnosticsJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithInt:[(BatchQueryResponse *)self status]];
  [v3 setObject:v4 forKeyedSubscript:@"status"];

  v5 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = [(BatchQueryResponse *)self queryInfoArray];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v20 + 1) + 8 * i) diagnosticsJsonDictionary];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    [v3 setObject:v5 forKeyedSubscript:@"queryInfos"];
  }
  if ([(BatchQueryResponse *)self hasSmh])
  {
    v12 = [(BatchQueryResponse *)self smh];
    v13 = +[SignedMapHead signedTypeWithObject:v12];

    v14 = [v13 diagnosticsJsonDictionary];
    [v3 setObject:v14 forKeyedSubscript:@"smh"];
  }
  if ([(BatchQueryResponse *)self hasPerApplicationTreeEntry])
  {
    v15 = [(BatchQueryResponse *)self perApplicationTreeEntry];
    v16 = [v15 diagnosticsJsonDictionary];
    [v3 setObject:v16 forKeyedSubscript:@"patEntry"];
  }
  if ([(BatchQueryResponse *)self hasTopLevelTreeEntry])
  {
    v17 = [(BatchQueryResponse *)self topLevelTreeEntry];
    v18 = [v17 diagnosticsJsonDictionary];
    [v3 setObject:v18 forKeyedSubscript:@"tltEntry"];
  }

  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  if (![(BatchQueryResponse *)self hasSmh]
    || ([(BatchQueryResponse *)self smh], v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    uint64_t v23 = -12;
    if (!a3) {
      goto LABEL_9;
    }
LABEL_8:
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:v23 description:@"KT Inclusion proof data required for verification"];
    goto LABEL_9;
  }
  if (![(BatchQueryResponse *)self hasTopLevelTreeEntry]
    || ([(BatchQueryResponse *)self hasPerApplicationTreeEntry] & 1) != 0)
  {
    v6 = [TransparencyLogEntryVerifier alloc];
    id v7 = [(BatchQueryResponse *)self verifier];
    id v8 = [v7 keyBag];
    uint64_t v9 = [v8 appSthKeyStore];
    v10 = [(TransparencyLogEntryVerifier *)v6 initWithTrustedKeyStore:v9];

    v11 = [TransparencyLogEntryVerifier alloc];
    v12 = [(BatchQueryResponse *)self verifier];
    v13 = [v12 keyBag];
    v14 = [v13 tltKeyStore];
    v15 = [(TransparencyLogEntryVerifier *)v11 initWithTrustedKeyStore:v14];

    v16 = [(BatchQueryResponse *)self dataStore];
    v17 = [(BatchQueryResponse *)self smh];
    v18 = [(TransparencyLogEntryVerifier *)v10 trustedKeyStore];
    v19 = [v18 signatureVerifier];
    long long v20 = [(BatchQueryResponse *)self dataStore];
    long long v21 = +[SignedMapHead signedTypeWithObject:v17 verifier:v19 dataStore:v20];

    if ([(BatchQueryResponse *)self hasPerApplicationTreeEntry])
    {
      long long v22 = [(BatchQueryResponse *)self perApplicationTreeEntry];
      [v21 setOverrideBeginTimeFromLogEntry:v22];
    }
    else
    {
      long long v22 = [(BatchQueryResponse *)self verifier];
      v26 = [v22 keyBag];
      [v21 setOverrideBeginTime:[v26 patLogBeginningMs]];
    }
    [(BatchQueryResponse *)self setVerifiableSmh:v21];
    id v41 = 0;
    id v25 = [v21 verifyWithError:&v41];
    id v27 = v41;
    +[TransparencyMapEntryVerifier storeSMHSignatureResult:v25 smh:v21 error:v27];
    if (v25 != (id)1)
    {
      if (a3 && v27) {
        *a3 = v27;
      }
      goto LABEL_31;
    }
    if ([(BatchQueryResponse *)self hasPerApplicationTreeEntry])
    {
      v28 = [(BatchQueryResponse *)self perApplicationTreeEntry];

      if (v28)
      {
        v40 = v15;
        v28 = [(BatchQueryResponse *)self perApplicationTreeEntry];
        [v28 setVerifier:v10];
        [v28 setDataStore:v16];
        v29 = [(BatchQueryResponse *)self metadata];
        uint64_t v30 = kTransparencyResponseMetadataKeyServerHint;
        v31 = [v29 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
        [v28 setMetadataValue:v31 key:v30];

        v32 = [(BatchQueryResponse *)self optInServer];
        [v28 setOptInServer:v32];

        if ([(BatchQueryResponse *)self hasTopLevelTreeEntry]
          && ([(BatchQueryResponse *)self topLevelTreeEntry],
              v33 = objc_claimAutoreleasedReturnValue(),
              v33,
              v33))
        {
          v34 = [(BatchQueryResponse *)self topLevelTreeEntry];
          [v34 setVerifier:v40];
          [v34 setDataStore:v16];
          v39 = [(BatchQueryResponse *)self metadata];
          v35 = [v39 objectForKeyedSubscript:v30];
          [v34 setMetadataValue:v35 key:v30];

          v36 = [(BatchQueryResponse *)self optInServer];
          [v34 setOptInServer:v36];
        }
        else
        {
          v34 = 0;
        }
        v15 = v40;
        goto LABEL_30;
      }
    }
    else
    {
      v28 = 0;
    }
    v34 = 0;
LABEL_30:
    v37 = [(BatchQueryResponse *)self verifier];
    id v25 = [v37 verifyPerApplicationTreeEntry:v28 mapHead:v21 topLevelTreeEntry:v34 error:a3];

LABEL_31:
    return (unint64_t)v25;
  }
  uint64_t v23 = -11;
  if (a3) {
    goto LABEL_8;
  }
LABEL_9:
  if (qword_10032EE18 != -1) {
    dispatch_once(&qword_10032EE18, &stru_1002C3870);
  }
  v24 = qword_10032EE20;
  if (os_log_type_enabled((os_log_t)qword_10032EE20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "KT Inclusion proof data required for verification", buf, 2u);
  }
  return 0;
}

+ (id)descriptor
{
  id v2 = (id)qword_10032EEB0;
  if (!qword_10032EEB0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:BatchQueryResponse messageName:@"BatchQueryResponse" fileDescription:&unk_100325780 fields:&off_100325878 fieldCount:5 storageSize:40 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B403];
    qword_10032EEB0 = (uint64_t)v2;
  }
  return v2;
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
    id v7 = [(BatchQueryResponse *)self metadata];
    id v8 = [v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v8 setObject:v9 forKeyedSubscript:v6];
    [(BatchQueryResponse *)self setMetadata:v8];
  }
}

@end