@interface LogEntry
+ (id)descriptor;
- (KTOptInManagerServer)optInServer;
- (NSDictionary)metadata;
- (TransparencyFollowUpProtocol)followUp;
- (TransparencyLogEntryVerifier)verifier;
- (TransparencyManagedDataStore)dataStore;
- (id)diagnosticsJsonDictionary;
- (unint64_t)setInclusionResult:(unint64_t)a3 signedLogHead:(id)a4 error:(id *)a5;
- (unint64_t)verifyTLTEntryForPerApplicationLogHead:(id)a3 error:(id *)a4;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setOptInServer:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation LogEntry

+ (id)descriptor
{
  id v2 = (id)qword_10032EDB0;
  if (!qword_10032EDB0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:LogEntry messageName:@"LogEntry" fileDescription:&unk_100324E10 fields:&off_100325008 fieldCount:6 storageSize:48 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B348];
    qword_10032EDB0 = (uint64_t)v2;
  }
  return v2;
}

- (TransparencyLogEntryVerifier)verifier
{
  return (TransparencyLogEntryVerifier *)objc_getAssociatedObject(self, @"verifierKey");
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
    v7 = [(LogEntry *)self metadata];
    id v8 = [v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v8 setObject:v9 forKeyedSubscript:v6];
    [(LogEntry *)self setMetadata:v8];
  }
}

- (id)diagnosticsJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = LogType_EnumDescriptor();
  v5 = [v4 textFormatNameForValue:-[LogEntry logType](self, "logType")];
  [v3 setObject:v5 forKeyedSubscript:@"logType"];

  id v6 = NodeType_EnumDescriptor();
  v7 = [v6 textFormatNameForValue:-[LogEntry nodeType](self, "nodeType")];
  [v3 setObject:v7 forKeyedSubscript:@"nodeType"];

  id v8 = +[NSNumber numberWithUnsignedLongLong:[(LogEntry *)self nodePosition]];
  [v3 setObject:v8 forKeyedSubscript:@"nodePosition"];

  id v9 = [(LogEntry *)self nodeBytes];
  v10 = [v9 kt_hexString];
  [v3 setObject:v10 forKeyedSubscript:@"nodeBytes"];

  v11 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = [(LogEntry *)self hashesOfPeersInPathToRootArray];
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) kt_hexString];
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  [v3 setObject:v11 forKeyedSubscript:@"hashesOfPeersInPathToRoot"];
  if ([(LogEntry *)self hasSlh])
  {
    v18 = [(LogEntry *)self slh];
    v19 = +[SignedLogHead signedTypeWithObject:v18];

    v20 = [v19 diagnosticsJsonDictionary];
    [v3 setObject:v20 forKeyedSubscript:@"slh"];
  }

  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  if (![(LogEntry *)self hasSlh]
    || ([(LogEntry *)self slh], v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    uint64_t v13 = -18;
    if (!a3)
    {
LABEL_12:
      if (qword_10032F2C8 != -1) {
        dispatch_once(&qword_10032F2C8, &stru_1002C9308);
      }
      id v14 = qword_10032F2D0;
      if (os_log_type_enabled((os_log_t)qword_10032F2D0, OS_LOG_TYPE_ERROR))
      {
        int v27 = 134217984;
        uint64_t v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "log entry missing data required for verification: %ld", (uint8_t *)&v27, 0xCu);
      }
      return 0;
    }
LABEL_11:
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:v13 description:@"log entry missing data required for verification"];
    goto LABEL_12;
  }
  uint64_t v6 = [(LogEntry *)self nodeBytes];
  if (!v6
    || (v7 = (void *)v6,
        [(LogEntry *)self nodeBytes],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 length],
        v8,
        v7,
        !v9))
  {
    uint64_t v13 = -19;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v10 = [(LogEntry *)self hashesOfPeersInPathToRootArray];
  if (!v10) {
    goto LABEL_8;
  }
  v11 = (void *)v10;
  if ([(LogEntry *)self nodePosition])
  {
    id v12 = [(LogEntry *)self hashesOfPeersInPathToRootArray_Count];

    if (!v12)
    {
LABEL_8:
      uint64_t v13 = -20;
      if (!a3) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  v17 = [(LogEntry *)self slh];
  v18 = [(LogEntry *)self verifier];
  v19 = [v18 trustedKeyStore];
  v20 = [v19 signatureVerifier];
  v21 = [(LogEntry *)self dataStore];
  long long v22 = +[SignedLogHead signedTypeWithObject:v17 verifier:v20 dataStore:v21];

  long long v23 = [(LogEntry *)self verifier];
  long long v24 = [(LogEntry *)self nodeBytes];
  id v25 = [(LogEntry *)self nodePosition];
  v26 = [(LogEntry *)self hashesOfPeersInPathToRootArray];
  id v15 = [v23 verifyLogEntryWithLogLeaf:v24 position:v25 hashesToRoot:v26 signedLogHead:v22 error:a3];
  if ([(LogEntry *)self logType] == 3) {
    [(LogEntry *)self setInclusionResult:v15 signedLogHead:v22 error:0];
  }

  return (unint64_t)v15;
}

- (unint64_t)setInclusionResult:(unint64_t)a3 signedLogHead:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  unint64_t v31 = a3;
  id v9 = [(LogEntry *)self dataStore];
  [v8 setDataStore:v9];

  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_1001FC938;
  v26 = sub_1001FC948;
  id v27 = 0;
  uint64_t v10 = [(LogEntry *)self dataStore];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001FC950;
  v15[3] = &unk_1002C9390;
  id v11 = v8;
  v18 = &v28;
  v19 = &v22;
  id v16 = v11;
  v17 = self;
  unint64_t v20 = a3;
  v21 = a5;
  [v10 performBlockAndWait:v15];

  if (a5)
  {
    id v12 = (void *)v23[5];
    if (v12) {
      *a5 = v12;
    }
  }
  unint64_t v13 = v29[3];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (unint64_t)verifyTLTEntryForPerApplicationLogHead:(id)a3 error:(id *)a4
{
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1001FD018;
  id v12 = &unk_1002C9418;
  unint64_t v13 = self;
  id v14 = a3;
  id v5 = v14;
  uint64_t v6 = objc_retainBlock(&v9);
  id v7 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:@"ktTLTVerifyInclusionProofEvent", 3, a4, v6, v9, v10, v11, v12, v13 validateType error block];

  return (unint64_t)v7;
}

@end