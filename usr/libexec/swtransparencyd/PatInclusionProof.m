@interface PatInclusionProof
+ (id)descriptor;
- (NSDictionary)metadata;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyPatInclusionProofVerifier)verifier;
- (id)patSigningKeyWithError:(id *)a3;
- (id)vrfPublicKeyWithError:(id *)a3;
- (int)earliestCurrentTreeVersionWithError:(id *)a3;
- (int)earliestNextTreeVersionWithError:(id *)a3;
- (unint64_t)patLogBeginningMs;
- (unint64_t)shutdownTimeStamp:(id *)a3;
- (unint64_t)tltLogBeginningMs;
- (unint64_t)verifyConfigProof:(id *)a3;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setVerifier:(id)a3;
@end

@implementation PatInclusionProof

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, @"dataStore");
}

- (void)setDataStore:(id)a3
{
}

- (TransparencyPatInclusionProofVerifier)verifier
{
  return (TransparencyPatInclusionProofVerifier *)objc_getAssociatedObject(self, @"verifier");
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

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = [(PatInclusionProof *)self metadata];
    id v8 = [v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v8 setObject:v9 forKeyedSubscript:v6];
    [(PatInclusionProof *)self setMetadata:v8];
  }
}

- (id)patSigningKeyWithError:(id *)a3
{
  v5 = [(PatInclusionProof *)self perApplicationTreeEntry];
  uint64_t v6 = [v5 nodeBytes];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [(PatInclusionProof *)self perApplicationTreeEntry];
    id v9 = [v8 nodeBytes];
    id v10 = [v9 length];

    if (v10)
    {
      v11 = [(PatInclusionProof *)self perApplicationTreeEntry];
      v12 = [v11 nodeBytes];
      v13 = +[TransparencyGPBMessage parseFromData:v12 error:a3];

      if (v13)
      {
        uint64_t v14 = [v13 publicKeyBytes];
        if (v14)
        {
          v15 = (void *)v14;
          v16 = [v13 publicKeyBytes];
          id v17 = [v16 length];

          if (v17)
          {
            v18 = [v13 publicKeyBytes];
LABEL_32:

            goto LABEL_33;
          }
        }
        if (a3)
        {
          *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-216 description:@"Signing Public key missing from per-app tree config node"];
        }
        if (qword_10015B190 != -1) {
          dispatch_once(&qword_10015B190, &stru_100135F08);
        }
        uint64_t v20 = qword_10015B198;
        if (!os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          v18 = 0;
          goto LABEL_32;
        }
        *(_WORD *)buf = 0;
        v21 = "Signing Public key missing from per-app tree config node";
        v22 = v20;
        uint32_t v23 = 2;
      }
      else
      {
        if (a3)
        {
          +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -165, *a3);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (qword_10015B190 != -1) {
          dispatch_once(&qword_10015B190, &stru_100135EE8);
        }
        uint64_t v24 = qword_10015B198;
        if (!os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        if (a3) {
          id v25 = *a3;
        }
        else {
          id v25 = 0;
        }
        *(_DWORD *)buf = 138412290;
        id v28 = v25;
        v21 = "failed to decode Per Application Tree config node: %@";
        v22 = v24;
        uint32_t v23 = 12;
      }
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
      goto LABEL_31;
    }
  }
  else
  {
  }
  if (a3)
  {
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-164 description:@"KT PAT Config proof missing signing key"];
  }
  if (qword_10015B190 != -1) {
    dispatch_once(&qword_10015B190, &stru_100135EC8);
  }
  v19 = qword_10015B198;
  if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "KT PAT Config proof missing signing key", buf, 2u);
  }
  v18 = 0;
LABEL_33:

  return v18;
}

- (id)vrfPublicKeyWithError:(id *)a3
{
  v5 = [(PatInclusionProof *)self perApplicationTreeEntry];
  uint64_t v6 = [v5 nodeBytes];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [(PatInclusionProof *)self perApplicationTreeEntry];
    id v9 = [v8 nodeBytes];
    id v10 = [v9 length];

    if (v10)
    {
      v11 = [(PatInclusionProof *)self perApplicationTreeEntry];
      v12 = [v11 nodeBytes];
      v13 = +[TransparencyGPBMessage parseFromData:v12 error:a3];

      if (v13)
      {
        if ([v13 hasVrfPublicKey])
        {
          uint64_t v14 = [v13 vrfPublicKey];

          if (v14)
          {
            v15 = [v13 vrfPublicKey];
LABEL_27:

            goto LABEL_28;
          }
        }
        if (a3)
        {
          +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-166 description:@"VRF Public key missing from per-app tree config node"];
          v15 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
      }
      else
      {
        if (a3)
        {
          +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -165, *a3);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (qword_10015B190 != -1) {
          dispatch_once(&qword_10015B190, &stru_100135F48);
        }
        id v17 = qword_10015B198;
        if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
        {
          if (a3) {
            id v18 = *a3;
          }
          else {
            id v18 = 0;
          }
          *(_DWORD *)buf = 138412290;
          id v21 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to decode Per Application Tree config node: %@", buf, 0xCu);
        }
      }
      v15 = 0;
      goto LABEL_27;
    }
  }
  else
  {
  }
  if (a3)
  {
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-164 description:@"KT PAT Config proof missing VRFPublicKey"];
  }
  if (qword_10015B190 != -1) {
    dispatch_once(&qword_10015B190, &stru_100135F28);
  }
  v16 = qword_10015B198;
  if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "KT PAT Config proof missing VRFPublicKey", buf, 2u);
  }
  v15 = 0;
LABEL_28:

  return v15;
}

- (int)earliestNextTreeVersionWithError:(id *)a3
{
  v5 = [(PatInclusionProof *)self perApplicationTreeEntry];
  uint64_t v6 = [v5 nodeBytes];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [(PatInclusionProof *)self perApplicationTreeEntry];
    id v9 = [v8 nodeBytes];
    id v10 = [v9 length];

    if (v10)
    {
      v11 = [(PatInclusionProof *)self perApplicationTreeEntry];
      v12 = [v11 nodeBytes];
      v13 = +[TransparencyGPBMessage parseFromData:v12 error:a3];

      if (v13)
      {
        int Tree_RawValue = LogClosedNode_EarliestVersionForNextTree_RawValue((uint64_t)v13);
      }
      else
      {
        if (a3)
        {
          +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -233, *a3);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (qword_10015B190 != -1) {
          dispatch_once(&qword_10015B190, &stru_100135F88);
        }
        v16 = qword_10015B198;
        if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
        {
          if (a3) {
            id v17 = *a3;
          }
          else {
            id v17 = 0;
          }
          *(_DWORD *)buf = 138412290;
          id v20 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to decode PAT closed node: %@", buf, 0xCu);
        }
        int Tree_RawValue = 0;
      }

      return Tree_RawValue;
    }
  }
  else
  {
  }
  if (a3)
  {
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-232 description:@"KT PAT closed proof missing node bytes"];
  }
  if (qword_10015B190 != -1) {
    dispatch_once(&qword_10015B190, &stru_100135F68);
  }
  v15 = qword_10015B198;
  if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "KT PAT closed proof missing node bytes", buf, 2u);
  }
  return 0;
}

- (unint64_t)shutdownTimeStamp:(id *)a3
{
  v5 = [(PatInclusionProof *)self perApplicationTreeEntry];
  uint64_t v6 = [v5 nodeBytes];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [(PatInclusionProof *)self perApplicationTreeEntry];
    id v9 = [v8 nodeBytes];
    id v10 = [v9 length];

    if (v10)
    {
      v11 = [(PatInclusionProof *)self perApplicationTreeEntry];
      v12 = [v11 nodeBytes];
      v13 = +[TransparencyGPBMessage parseFromData:v12 error:a3];

      if (v13)
      {
        id v14 = [v13 timestampMs];
      }
      else
      {
        if (a3)
        {
          +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -233, *a3);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (qword_10015B190 != -1) {
          dispatch_once(&qword_10015B190, &stru_100135FC8);
        }
        v16 = qword_10015B198;
        if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
        {
          if (a3) {
            id v17 = *a3;
          }
          else {
            id v17 = 0;
          }
          *(_DWORD *)buf = 138412290;
          id v20 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to decode PAT closed node: %@", buf, 0xCu);
        }
        id v14 = 0;
      }

      return (unint64_t)v14;
    }
  }
  else
  {
  }
  if (a3)
  {
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-232 description:@"KT PAT closed proof missing node bytes"];
  }
  if (qword_10015B190 != -1) {
    dispatch_once(&qword_10015B190, &stru_100135FA8);
  }
  v15 = qword_10015B198;
  if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "KT PAT closed proof missing node bytes", buf, 2u);
  }
  return 0;
}

- (int)earliestCurrentTreeVersionWithError:(id *)a3
{
  v5 = [(PatInclusionProof *)self perApplicationTreeEntry];
  uint64_t v6 = [v5 nodeBytes];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [(PatInclusionProof *)self perApplicationTreeEntry];
    id v9 = [v8 nodeBytes];
    id v10 = [v9 length];

    if (v10)
    {
      v11 = [(PatInclusionProof *)self perApplicationTreeEntry];
      v12 = [v11 nodeBytes];
      v13 = +[TransparencyGPBMessage parseFromData:v12 error:a3];

      if (v13)
      {
        unsigned int v14 = PerApplicationTreeConfigNode_EarliestVersion_RawValue((uint64_t)v13);
        if (v14 <= 1) {
          int v15 = 1;
        }
        else {
          int v15 = v14;
        }
      }
      else
      {
        if (a3)
        {
          +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -165, *a3);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (qword_10015B190 != -1) {
          dispatch_once(&qword_10015B190, &stru_100136008);
        }
        int v15 = 999999999;
        id v17 = qword_10015B198;
        if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
        {
          if (a3) {
            id v18 = *a3;
          }
          else {
            id v18 = 0;
          }
          *(_DWORD *)buf = 138412290;
          id v21 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to decode Per Application Tree config node: %@", buf, 0xCu);
        }
      }

      return v15;
    }
  }
  else
  {
  }
  if (a3)
  {
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-164 description:@"KT PAT Config proof missing node bytes"];
  }
  if (qword_10015B190 != -1) {
    dispatch_once(&qword_10015B190, &stru_100135FE8);
  }
  int v15 = 999999999;
  v16 = qword_10015B198;
  if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "KT PAT Config proof missing node bytes", buf, 2u);
  }
  return v15;
}

- (unint64_t)patLogBeginningMs
{
  v2 = [(PatInclusionProof *)self perApplicationTreeEntry];
  v3 = [v2 slh];
  v4 = +[SignedLogHead signedTypeWithObject:v3];

  v5 = [v4 parsedLogHead];
  id v6 = [v5 logBeginningMs];

  return (unint64_t)v6;
}

- (unint64_t)tltLogBeginningMs
{
  v2 = [(PatInclusionProof *)self topLevelTreeEntry];
  v3 = [v2 slh];
  v4 = +[SignedLogHead signedTypeWithObject:v3];

  v5 = [v4 parsedLogHead];
  id v6 = [v5 logBeginningMs];

  return (unint64_t)v6;
}

- (unint64_t)verifyWithError:(id *)a3
{
  if (![(PatInclusionProof *)self hasPerApplicationTreeEntry]
    || ([(PatInclusionProof *)self perApplicationTreeEntry],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    uint64_t v34 = -33;
    if (!a3) {
      goto LABEL_8;
    }
LABEL_7:
    *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:v34 description:@"PAT inclusion proof missing required field"];
    goto LABEL_8;
  }
  if ([(PatInclusionProof *)self hasTopLevelTreeEntry])
  {
    id v6 = [(PatInclusionProof *)self topLevelTreeEntry];

    if (v6)
    {
      v7 = [TransparencyLogEntryVerifier alloc];
      id v8 = [(PatInclusionProof *)self verifier];
      id v9 = [v8 keyBag];
      id v10 = [v9 appSthKeyStore];
      v11 = [(TransparencyLogEntryVerifier *)v7 initWithTrustedKeyStore:v10];

      v12 = [TransparencyLogEntryVerifier alloc];
      v13 = [(PatInclusionProof *)self verifier];
      unsigned int v14 = [v13 keyBag];
      int v15 = [v14 tltKeyStore];
      v16 = [(TransparencyLogEntryVerifier *)v12 initWithTrustedKeyStore:v15];

      id v17 = [(PatInclusionProof *)self dataStore];
      id v18 = [(PatInclusionProof *)self perApplicationTreeEntry];
      [v18 setVerifier:v11];

      v19 = [(PatInclusionProof *)self perApplicationTreeEntry];
      [v19 setDataStore:v17];

      id v20 = [(PatInclusionProof *)self perApplicationTreeEntry];
      id v21 = [(PatInclusionProof *)self metadata];
      uint64_t v22 = kTransparencyResponseMetadataKeyServerHint;
      uint32_t v23 = [v21 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
      [v20 setMetadataValue:v23 key:v22];

      uint64_t v24 = [(PatInclusionProof *)self topLevelTreeEntry];
      [v24 setVerifier:v16];

      id v25 = [(PatInclusionProof *)self topLevelTreeEntry];
      [v25 setDataStore:v17];

      v26 = [(PatInclusionProof *)self topLevelTreeEntry];
      v27 = [(PatInclusionProof *)self metadata];
      id v28 = [v27 objectForKeyedSubscript:v22];
      [v26 setMetadataValue:v28 key:v22];

      v29 = [(PatInclusionProof *)self verifier];
      v30 = [(PatInclusionProof *)self perApplicationTreeEntry];
      v31 = [(PatInclusionProof *)self topLevelTreeEntry];
      id v32 = [v29 verifyPatInclusionProofWithPerAppLogEntry:v30 topLevelTreeEntry:v31 error:a3];

      return (unint64_t)v32;
    }
  }
  uint64_t v34 = -34;
  if (a3) {
    goto LABEL_7;
  }
LABEL_8:
  if (qword_10015B190 != -1) {
    dispatch_once(&qword_10015B190, &stru_100136028);
  }
  v35 = qword_10015B198;
  if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "PAT inclusion proof missing required field", v36, 2u);
  }
  return 0;
}

- (unint64_t)verifyConfigProof:(id *)a3
{
  unint64_t result = -[PatInclusionProof verifyWithError:](self, "verifyWithError:");
  if (result == 1)
  {
    id v6 = [(PatInclusionProof *)self perApplicationTreeEntry];
    id v7 = [v6 nodePosition];

    if (v7)
    {
      if (a3)
      {
        id v8 = [(PatInclusionProof *)self perApplicationTreeEntry];
        +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", @"TransparencyErrorVerify", -163, @"per-app tree (config) inclusion proof not position 0; instead position %llu",
          [v8 nodePosition]);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        id v9 = +[NSMutableDictionary dictionary];
        if (+[TransparencyAnalytics hasInternalDiagnostics])
        {
          id v10 = [(PatInclusionProof *)self metadata];
          uint64_t v11 = kTransparencyResponseMetadataKeyServerHint;
          v12 = [v10 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];

          if (v12)
          {
            v13 = [(PatInclusionProof *)self metadata];
            unsigned int v14 = [v13 objectForKeyedSubscript:v11];
            [v9 setObject:v14 forKeyedSubscript:v11];
          }
        }
        int v15 = +[TransparencyAnalytics logger];
        v16 = [(PatInclusionProof *)self verifier];
        id v17 = [v16 application];
        id v18 = +[TransparencyAnalytics formatEventName:@"VerifyPATInclusionProofEvent" application:v17];
        [v15 logResultForEvent:v18 hardFailure:1 result:*a3 withAttributes:v9];
      }
      if (qword_10015B190 != -1) {
        dispatch_once(&qword_10015B190, &stru_100136048);
      }
      v19 = (void *)qword_10015B198;
      if (os_log_type_enabled((os_log_t)qword_10015B198, OS_LOG_TYPE_ERROR))
      {
        id v20 = v19;
        id v21 = [(PatInclusionProof *)self perApplicationTreeEntry];
        *(_DWORD *)buf = 134217984;
        id v23 = [v21 nodePosition];
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "per-app tree (config) inclusion proof not position 0; instead position %llu",
          buf,
          0xCu);
      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

+ (id)descriptor
{
  id v2 = (id)qword_10015B238;
  if (!qword_10015B238)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:PatInclusionProof messageName:@"PatInclusionProof" fileDescription:&unk_1001560A0 fields:&off_100156558 fieldCount:2 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10010A288];
    qword_10015B238 = (uint64_t)v2;
  }
  return v2;
}

@end