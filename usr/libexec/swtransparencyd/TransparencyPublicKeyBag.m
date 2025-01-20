@interface TransparencyPublicKeyBag
- (BOOL)allowOldKeys;
- (BOOL)mapStillPopulating;
- (BOOL)processPatClosedProof:(id)a3 error:(id *)a4;
- (BOOL)processPatConfigProof:(id)a3 error:(id *)a4;
- (BOOL)processTltConfigProof:(id)a3 error:(id *)a4;
- (BOOL)unsupported;
- (BOOL)verifyCertificates:(id)a3 intermediates:(id)a4 application:(id)a5 error:(id *)a6;
- (BOOL)verifyConfigProof:(id)a3 error:(id *)a4;
- (NSArray)trustedAppLeafs;
- (NSArray)trustedIntermediates;
- (NSArray)trustedTltLeafs;
- (NSArray)verifiedLogHeads;
- (NSData)patClosedProof;
- (NSData)patConfigProof;
- (NSData)tltConfigProof;
- (NSDate)receiptTime;
- (NSDictionary)trustedAppSigningKeys;
- (NSDictionary)trustedTltSigningKeys;
- (NSMutableArray)__verifiedLogHeads;
- (NSString)application;
- (NSString)treeRollInfoURL;
- (SignedMapHead)verifiedSignedMapHead;
- (TransparencyPublicKeyBag)initWithDiskKeyStore:(id)a3 application:(id)a4 settings:(id)a5 allowOldKeys:(BOOL)a6 error:(id *)a7;
- (TransparencyPublicKeyBag)initWithDiskKeyStore:(id)a3 application:(id)a4 settings:(id)a5 error:(id *)a6;
- (TransparencyPublicKeyBag)initWithKeyData:(id)a3 tltLeafs:(id)a4 intermediates:(id)a5 patConfigProof:(id)a6 tltConfigProof:(id)a7 patClosedProof:(id)a8 pamHeadInPatProof:(id)a9 application:(id)a10 allowOldKeys:(BOOL)a11 settings:(id)a12 error:(id *)a13;
- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 error:(id *)a5;
- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 settings:(id)a5 allowOldKeys:(BOOL)a6 error:(id *)a7;
- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 settings:(id)a5 error:(id *)a6;
- (TransparencySettingsProtocol)settings;
- (TransparencyTrustedKeyStore)appSmtKeyStore;
- (TransparencyTrustedKeyStore)appSthKeyStore;
- (TransparencyTrustedKeyStore)tltKeyStore;
- (VRFPublicKey)vrfKey;
- (id)copyTltBag;
- (id)copyVRFKeyFromConfigProof:(id)a3 error:(id *)a4;
- (id)createTrustedSthKeyStoreFromProofSPKI:(id)a3 signingKeysMap:(id)a4 error:(id *)a5;
- (id)diskStoreDictionary;
- (id)processPamHeadInPatProof:(id)a3 tltEntry:(id)a4 error:(id *)a5;
- (int)patEarliestVersion;
- (int)tltEarliestVersion;
- (int)vrfType;
- (unint64_t)patLogBeginningMs;
- (unint64_t)shutDown;
- (unint64_t)tltLogBeginningMs;
- (void)setAllowOldKeys:(BOOL)a3;
- (void)setAppSmtKeyStore:(id)a3;
- (void)setAppSthKeyStore:(id)a3;
- (void)setApplication:(id)a3;
- (void)setMapStillPopulating:(BOOL)a3;
- (void)setPatClosedProof:(id)a3;
- (void)setPatConfigProof:(id)a3;
- (void)setPatEarliestVersion:(int)a3;
- (void)setPatLogBeginningMs:(unint64_t)a3;
- (void)setReceiptTime:(id)a3;
- (void)setSettings:(id)a3;
- (void)setShutDown:(unint64_t)a3;
- (void)setTltConfigProof:(id)a3;
- (void)setTltEarliestVersion:(int)a3;
- (void)setTltKeyStore:(id)a3;
- (void)setTltLogBeginningMs:(unint64_t)a3;
- (void)setTreeRollInfoURL:(id)a3;
- (void)setTrustedAppLeafs:(id)a3;
- (void)setTrustedAppSigningKeys:(id)a3;
- (void)setTrustedIntermediates:(id)a3;
- (void)setTrustedTltLeafs:(id)a3;
- (void)setTrustedTltSigningKeys:(id)a3;
- (void)setUnsupported:(BOOL)a3;
- (void)setVerifiedSignedMapHead:(id)a3;
- (void)setVrfKey:(id)a3;
- (void)setVrfType:(int)a3;
- (void)set__verifiedLogHeads:(id)a3;
@end

@implementation TransparencyPublicKeyBag

- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 settings:(id)a5 allowOldKeys:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v80 = a4;
  id v79 = a5;
  v13 = &off_10015B000;
  v81 = self;
  if ([v12 status] == 1)
  {
    v14 = 0;
  }
  else
  {
    v15 = a7;
    uint64_t v16 = kTransparencyErrorServer;
    uint64_t v17 = (int)[v12 status];
    v18 = [(TransparencyPublicKeyBag *)self application];
    id v19 = [v12 status];
    uint64_t v20 = v16;
    v13 = &off_10015B000;
    v14 = +[TransparencyError errorWithDomain:v20, v17, @"PublicKeysResponse for %@ indicates server failure %d", v18, v19 code description];

    if (qword_10015B348 != -1) {
      dispatch_once(&qword_10015B348, &stru_1001364B8);
    }
    v21 = (void *)qword_10015B350;
    a7 = v15;
    if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = [(TransparencyPublicKeyBag *)v81 application];
      *(_DWORD *)buf = 138412546;
      v84 = v23;
      __int16 v85 = 1024;
      LODWORD(v86) = [v12 status];
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "PublicKeysResponse for %@ indicates server failure %d", buf, 0x12u);

      v13 = &off_10015B000;
    }
  }
  if ([v12 hasPatConfigProof]
    && ([v12 patConfigProof], v24 = objc_claimAutoreleasedReturnValue(), v24, v24))
  {
    if ([v12 hasTltConfigProof]
      && ([v12 tltConfigProof], v25 = objc_claimAutoreleasedReturnValue(), v25, v25))
    {
      uint64_t v26 = [v12 appLeafsArray];
      if (v26 && (v27 = (void *)v26, id v28 = objc_msgSend(v12, "appLeafsArray_Count"), v27, v28))
      {
        uint64_t v29 = [v12 tltLeafsArray];
        if (v29)
        {
          v30 = (void *)v29;
          id v31 = [v12 tltLeafsArray_Count];

          if (v31)
          {
            uint64_t v32 = 0;
            char v33 = 1;
            if (!v8) {
              goto LABEL_46;
            }
            goto LABEL_40;
          }
        }
        if (qword_10015B348 != -1) {
          dispatch_once(&qword_10015B348, &stru_100136538);
        }
        v37 = qword_10015B350;
        if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "PublicKeyResponse missing tlt leafs", buf, 2u);
        }
        char v33 = 0;
        uint64_t v32 = -36;
        if (v8)
        {
LABEL_40:
          uint64_t v38 = [v12 oldAppRootCertsArray];
          if (v38)
          {
            v39 = (void *)v38;
            id v40 = [v12 oldAppRootCertsArray_Count];

            if (v40)
            {
              v41 = [v12 appLeafsArray];
              v42 = [v12 oldAppRootCertsArray];
              [v41 addObjectsFromArray:v42];
            }
          }
          uint64_t v43 = [v12 oldTltRootCertsArray];
          if (v43)
          {
            v44 = (void *)v43;
            id v45 = [v12 oldTltRootCertsArray_Count];

            if (v45)
            {
              v46 = [v12 tltLeafsArray];
              v47 = [v12 oldTltRootCertsArray];
              [v46 addObjectsFromArray:v47];
            }
          }
        }
      }
      else
      {
        if (qword_10015B348 != -1) {
          dispatch_once(&qword_10015B348, &stru_100136518);
        }
        v36 = qword_10015B350;
        if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "PublicKeyResponse missing app leafs", buf, 2u);
        }
        char v33 = 0;
        uint64_t v32 = -31;
        if (v8) {
          goto LABEL_40;
        }
      }
    }
    else
    {
      if (v13[105] != (__objc2_class *)-1) {
        dispatch_once(&qword_10015B348, &stru_1001364F8);
      }
      v35 = qword_10015B350;
      if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "PublicKeyResponse missing data required for TLT key verification", buf, 2u);
      }
      char v33 = 0;
      uint64_t v32 = -223;
      if (v8) {
        goto LABEL_40;
      }
    }
  }
  else
  {
    if (v13[105] != (__objc2_class *)-1) {
      dispatch_once(&qword_10015B348, &stru_1001364D8);
    }
    v34 = qword_10015B350;
    if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "PublicKeyResponse missing data required for PAT key verification", buf, 2u);
    }
    char v33 = 0;
    uint64_t v32 = -32;
    if (v8) {
      goto LABEL_40;
    }
  }
LABEL_46:
  if ((v33 & 1) == 0)
  {
    uint64_t v59 = kTransparencyErrorDecode;
    v60 = [(TransparencyPublicKeyBag *)v81 application];
    id v61 = +[TransparencyError errorWithDomain:v59, v32, @"PublicKeysResponse for %@ missing or invalid content: %ld", v60, v32 code description];

    if (qword_10015B348 != -1) {
      dispatch_once(&qword_10015B348, &stru_100136558);
    }
    v62 = (void *)qword_10015B350;
    if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
    {
      v63 = v62;
      v64 = v81;
      v65 = [(TransparencyPublicKeyBag *)v81 application];
      *(_DWORD *)buf = 138543618;
      v84 = v65;
      __int16 v85 = 2048;
      uint64_t v86 = v32;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "PublicKeysResponse for %{public}@ missing or invalid content: %ld", buf, 0x16u);

      v66 = 0;
      if (!a7) {
        goto LABEL_72;
      }
      goto LABEL_70;
    }
    goto LABEL_56;
  }
  if ([v12 status] != 1)
  {
    id v61 = v14;
LABEL_56:
    v66 = 0;
    v64 = v81;
    if (!a7) {
      goto LABEL_72;
    }
    goto LABEL_70;
  }
  v75 = a7;
  v48 = [v12 patConfigProof];
  v49 = [v12 metadata];
  uint64_t v50 = kTransparencyResponseMetadataKeyServerHint;
  v51 = [v49 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
  [v48 setMetadataValue:v51 key:v50];

  v52 = [v12 tltConfigProof];
  v53 = [v12 metadata];
  v54 = [v53 objectForKeyedSubscript:v50];
  [v52 setMetadataValue:v54 key:v50];

  uint64_t v55 = [v12 appLeafsArray];
  v78 = [v12 tltLeafsArray];
  v77 = [v12 intermediatesArray];
  v76 = [v12 patConfigProof];
  v56 = [v12 tltConfigProof];
  unsigned int v57 = [v12 hasPatClosedProof];
  if (v57)
  {
    v58 = [v12 patClosedProof];
  }
  else
  {
    v58 = 0;
  }
  unsigned int v67 = [v12 hasPamHeadInPatProof];
  if (v67)
  {
    v68 = [v12 pamHeadInPatProof];
  }
  else
  {
    v68 = 0;
  }
  id v82 = v14;
  LOBYTE(v74) = v8;
  v69 = (void *)v55;
  v70 = [(TransparencyPublicKeyBag *)v81 initWithKeyData:v55 tltLeafs:v78 intermediates:v77 patConfigProof:v76 tltConfigProof:v56 patClosedProof:v58 pamHeadInPatProof:v68 application:v80 allowOldKeys:v74 settings:v79 error:&v82];
  id v61 = v82;

  v66 = v70;
  if (v67) {

  }
  if (v57) {
  if (v66)
  }
  {
    v71 = [v12 treeRollInfoURL];
    [(TransparencyPublicKeyBag *)v66 setTreeRollInfoURL:v71];

    v72 = +[NSDate date];
    [(TransparencyPublicKeyBag *)v66 setReceiptTime:v72];

    v64 = v66;
  }
  else
  {
    v64 = 0;
  }
  a7 = v75;
  if (v75)
  {
LABEL_70:
    if (v61) {
      *a7 = v61;
    }
  }
LABEL_72:

  return v66;
}

- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 settings:(id)a5 error:(id *)a6
{
  return [(TransparencyPublicKeyBag *)self initWithPublicKeysResponse:a3 application:a4 settings:a5 allowOldKeys:0 error:a6];
}

- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 error:(id *)a5
{
  return [(TransparencyPublicKeyBag *)self initWithPublicKeysResponse:a3 application:a4 settings:0 error:a5];
}

- (TransparencyPublicKeyBag)initWithDiskKeyStore:(id)a3 application:(id)a4 settings:(id)a5 allowOldKeys:(BOOL)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [v12 objectForKeyedSubscript:@"PatConfigProof"];
  if (!v15) {
    goto LABEL_22;
  }
  uint64_t v16 = (void *)v15;
  uint64_t v17 = [v12 objectForKeyedSubscript:@"TltConfigProof"];
  if (!v17) {
    goto LABEL_21;
  }
  v18 = (void *)v17;
  uint64_t v19 = [v12 objectForKeyedSubscript:@"Leafs"];
  if (!v19)
  {
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  uint64_t v20 = (void *)v19;
  id v54 = v13;
  uint64_t v21 = [v12 objectForKeyedSubscript:@"TltLeafs"];
  if (!v21)
  {
LABEL_19:

    id v13 = v54;
    goto LABEL_20;
  }
  v22 = (void *)v21;
  id v53 = v14;
  uint64_t v23 = [v12 objectForKeyedSubscript:@"Intermediates"];
  if (!v23)
  {

    goto LABEL_19;
  }
  v24 = (void *)v23;
  v25 = [v12 objectForKeyedSubscript:@"ReceiptTime"];

  id v14 = v53;
  id v13 = v54;
  if (v25)
  {
    uint64_t v26 = [v12 objectForKeyedSubscript:@"PatConfigProof"];
    v27 = +[TransparencyGPBMessage parseFromData:v26 error:a7];

    if (!v27)
    {
      if (a7)
      {
        +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -35, *a7);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v14 = v53;
      if (qword_10015B348 != -1) {
        dispatch_once(&qword_10015B348, &stru_100136598);
      }
      v39 = qword_10015B350;
      if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
      {
        if (a7) {
          id v40 = (NSString *)*a7;
        }
        else {
          id v40 = 0;
        }
        *(_DWORD *)buf = 138412290;
        unsigned int v57 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "PAT inclusion proof from disk failed to parse: %@", buf, 0xCu);
      }
      v37 = 0;
      goto LABEL_59;
    }
    id v28 = [v12 objectForKeyedSubscript:@"TltConfigProof"];
    uint64_t v29 = +[TransparencyGPBMessage parseFromData:v28 error:a7];

    if (v29)
    {
      v52 = v29;
      v30 = [v12 objectForKeyedSubscript:@"PatClosedProof"];

      if (v30)
      {
        id v31 = [v12 objectForKeyedSubscript:@"PatClosedProof"];
        uint64_t v32 = +[TransparencyGPBMessage parseFromData:v31 error:a7];

        if (!v32)
        {
          if (a7)
          {
            +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -35, *a7);
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v29 = v52;
          id v14 = v53;
          if (qword_10015B348 != -1) {
            dispatch_once(&qword_10015B348, &stru_1001365D8);
          }
          char v33 = qword_10015B350;
          if (!os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR)) {
            goto LABEL_57;
          }
          if (a7) {
            v34 = (NSString *)*a7;
          }
          else {
            v34 = 0;
          }
          *(_DWORD *)buf = 138412290;
          unsigned int v57 = v34;
          v49 = "PAT closed inclusion proof from disk failed to parse: %@";
LABEL_56:
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v49, buf, 0xCu);
LABEL_57:
          v37 = 0;
LABEL_58:

LABEL_59:
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v32 = 0;
      }
      v51 = [v12 objectForKeyedSubscript:@"TreeRollInfoURL"];
      v42 = [v12 objectForKeyedSubscript:@"Leafs"];
      uint64_t v43 = [v12 objectForKeyedSubscript:@"TltLeafs"];
      v44 = [v12 objectForKeyedSubscript:@"Intermediates"];
      id v55 = 0;
      LOBYTE(v50) = a6;
      id v45 = [(TransparencyPublicKeyBag *)self initWithKeyData:v42 tltLeafs:v43 intermediates:v44 patConfigProof:v27 tltConfigProof:v52 patClosedProof:v32 pamHeadInPatProof:0 application:v54 allowOldKeys:v50 settings:v53 error:&v55];
      id v46 = v55;
      v47 = v45;

      v48 = [v12 objectForKeyedSubscript:@"ReceiptTime"];
      [(TransparencyPublicKeyBag *)v47 setReceiptTime:v48];

      [(TransparencyPublicKeyBag *)v47 setTreeRollInfoURL:v51];
      if (a7 && v46) {
        *a7 = v46;
      }
      self = v47;

      v37 = self;
      id v14 = v53;
      id v13 = v54;
      uint64_t v29 = v52;
      goto LABEL_58;
    }
    if (a7)
    {
      +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -218, *a7);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v14 = v53;
    if (qword_10015B348 != -1) {
      dispatch_once(&qword_10015B348, &stru_1001365B8);
    }
    char v33 = qword_10015B350;
    if (!os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR)) {
      goto LABEL_57;
    }
    if (a7) {
      v41 = (NSString *)*a7;
    }
    else {
      v41 = 0;
    }
    *(_DWORD *)buf = 138412290;
    unsigned int v57 = v41;
    v49 = "TLT inclusion proof from disk failed to parse: %@";
    goto LABEL_56;
  }
LABEL_22:
  if (a7)
  {
    *a7 = +[TransparencyError errorWithDomain:kTransparencyErrorFile, -54, @"missing fields from the disk store for %@", self->_application code description];
  }
  if (qword_10015B348 != -1) {
    dispatch_once(&qword_10015B348, &stru_100136578);
  }
  v35 = qword_10015B350;
  if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
  {
    application = self->_application;
    *(_DWORD *)buf = 138412290;
    unsigned int v57 = application;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "missing fields from the disk store for %@", buf, 0xCu);
  }
  v37 = 0;
LABEL_29:

  return v37;
}

- (TransparencyPublicKeyBag)initWithDiskKeyStore:(id)a3 application:(id)a4 settings:(id)a5 error:(id *)a6
{
  return [(TransparencyPublicKeyBag *)self initWithDiskKeyStore:a3 application:a4 settings:a5 allowOldKeys:0 error:a6];
}

- (TransparencyPublicKeyBag)initWithKeyData:(id)a3 tltLeafs:(id)a4 intermediates:(id)a5 patConfigProof:(id)a6 tltConfigProof:(id)a7 patClosedProof:(id)a8 pamHeadInPatProof:(id)a9 application:(id)a10 allowOldKeys:(BOOL)a11 settings:(id)a12 error:(id *)a13
{
  id v19 = a3;
  id v66 = a4;
  id v74 = a4;
  id v20 = a5;
  id v75 = a6;
  id v21 = a7;
  id v73 = a8;
  id v76 = a9;
  id v22 = a10;
  id v23 = a12;
  v77.receiver = self;
  v77.super_class = (Class)TransparencyPublicKeyBag;
  v24 = [(TransparencyPublicKeyBag *)&v77 init];
  if (v24)
  {
    id v72 = v21;
    v25 = +[NSMutableArray array];
    [(TransparencyPublicKeyBag *)v24 set__verifiedLogHeads:v25];

    [(TransparencyPublicKeyBag *)v24 setApplication:v22];
    [(TransparencyPublicKeyBag *)v24 setAllowOldKeys:a11];
    [(TransparencyPublicKeyBag *)v24 setSettings:v23];
    uint64_t v26 = [(TransparencyPublicKeyBag *)v24 settings];

    if (!v26)
    {
      id v27 = objc_alloc_init((Class)TransparencySettings);
      [(TransparencyPublicKeyBag *)v24 setSettings:v27];
    }
    id v28 = v19;
    if ([(TransparencyPublicKeyBag *)v24 verifyCertificates:v19 intermediates:v20 application:v22 error:a13])
    {
      uint64_t v29 = +[TransparencyCertificateHelper copyTrustedKeysFromDataArray:v19 error:a13];
      trustedAppSigningKeys = v24->_trustedAppSigningKeys;
      v24->_trustedAppSigningKeys = v29;

      id v31 = v74;
      if (v24->_trustedAppSigningKeys)
      {
        objc_storeStrong((id *)&v24->_trustedAppLeafs, a3);
        uint64_t v32 = [TransparencyTrustedKeyStore alloc];
        char v33 = [(TransparencyPublicKeyBag *)v24 trustedAppSigningKeys];
        v34 = [(TransparencyTrustedKeyStore *)v32 initWithTrustedKeys:v33];
        [(TransparencyPublicKeyBag *)v24 setAppSmtKeyStore:v34];

        v35 = [(TransparencyPublicKeyBag *)v24 appSmtKeyStore];
        [(TransparencyPublicKeyBag *)v24 setAppSthKeyStore:v35];

        if ([(TransparencyPublicKeyBag *)v24 verifyCertificates:v74 intermediates:v20 application:kKTApplicationIdentifierTLT error:a13])
        {
          v36 = +[TransparencyCertificateHelper copyTrustedKeysFromDataArray:v74 error:a13];
          trustedTltSigningKeys = v24->_trustedTltSigningKeys;
          v24->_trustedTltSigningKeys = v36;

          if (v24->_trustedTltSigningKeys)
          {
            objc_storeStrong((id *)&v24->_trustedTltLeafs, v66);
            uint64_t v38 = [TransparencyTrustedKeyStore alloc];
            v39 = [(TransparencyPublicKeyBag *)v24 trustedTltSigningKeys];
            id v40 = [(TransparencyTrustedKeyStore *)v38 initWithTrustedKeys:v39];
            tltKeyStore = v24->_tltKeyStore;
            v24->_tltKeyStore = v40;

            v42 = v75;
            if ([v20 count]) {
              uint64_t v43 = (NSArray *)v20;
            }
            else {
              uint64_t v43 = (NSArray *)&__NSArray0__struct;
            }
            trustedIntermediates = v24->_trustedIntermediates;
            v24->_trustedIntermediates = v43;

            id v45 = v73;
            if (![(TransparencyPublicKeyBag *)v24 processTltConfigProof:v21 error:a13])goto LABEL_38; {
            if (!v76)
            }
            {
LABEL_30:
              if ([(TransparencyPublicKeyBag *)v24 processPatConfigProof:v42 error:a13]&& (!v45|| [(TransparencyPublicKeyBag *)v24 processPatClosedProof:v45 error:a13]))
              {
                v44 = v24;
                goto LABEL_15;
              }
LABEL_38:
              v44 = 0;
              goto LABEL_15;
            }
            if (qword_10015B348 != -1) {
              dispatch_once(&qword_10015B348, &stru_1001365F8);
            }
            v48 = qword_10015B350;
            if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "pamHeadInPatProof present", buf, 2u);
            }
            id objb = [v75 perApplicationTreeEntry];
            v49 = [objb slh];
            uint64_t v50 = [v49 object];
            v51 = [v76 slh];
            v52 = [v51 object];
            unsigned __int8 v67 = [v50 isEqualToData:v52];

            if ((v67 & 1) == 0)
            {
              if (qword_10015B348 != -1) {
                dispatch_once(&qword_10015B348, &stru_100136618);
              }
              id v31 = v74;
              v42 = v75;
              id v21 = v72;
              id v45 = v73;
              v63 = qword_10015B350;
              if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "pamHeadInPatProof was present but didn't match patConfigProof SLH", buf, 2u);
              }
              goto LABEL_38;
            }
            id v53 = [v75 topLevelTreeEntry];
            id v54 = [(TransparencyPublicKeyBag *)v24 processPamHeadInPatProof:v76 tltEntry:v53 error:a13];

            if (v54)
            {
              id v55 = [v54 parsedMapHead];
              v56 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v55 application]);
              id obja = +[TransparencyApplication applicationIdentifierForValue:v56];

              if (qword_10015B348 != -1) {
                dispatch_once(&qword_10015B348, &stru_100136658);
              }
              id v21 = v72;
              unsigned int v57 = (void *)qword_10015B350;
              if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_INFO))
              {
                v58 = v57;
                id v68 = [v54 parsedMapHead];
                id v59 = [v68 revision];
                v60 = [v54 parsedMapHead];
                unsigned int v61 = [v60 populating];
                *(_DWORD *)buf = 138412802;
                id v79 = obja;
                __int16 v80 = 2048;
                id v81 = v59;
                id v21 = v72;
                __int16 v82 = 1024;
                unsigned int v83 = v61;
                _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "pamHeadInPatProof SMH for %@ with revision %llu, populating = %d", buf, 0x1Cu);
              }
              v62 = [v54 parsedMapHead];
              -[TransparencyPublicKeyBag setMapStillPopulating:](v24, "setMapStillPopulating:", [v62 populating]);

              id v31 = v74;
              v42 = v75;
              id v45 = v73;
              goto LABEL_30;
            }
            v42 = v75;
            if (qword_10015B348 != -1) {
              dispatch_once(&qword_10015B348, &stru_100136638);
            }
            id v31 = v74;
            id v21 = v72;
            v64 = qword_10015B350;
            if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
            {
              if (a13) {
                id v65 = *a13;
              }
              else {
                id v65 = 0;
              }
              *(_DWORD *)buf = 138412290;
              id v79 = v65;
              _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "pamHeadInPatProof was present but didn't validate: %@", buf, 0xCu);
            }
            v44 = 0;
            goto LABEL_11;
          }
        }
      }
      v44 = 0;
    }
    else
    {
      v44 = 0;
      id v31 = v74;
    }
    v42 = v75;
    id v45 = v73;
    goto LABEL_15;
  }
  v44 = 0;
  id v28 = v19;
  id v31 = v74;
  v42 = v75;
LABEL_11:
  id v45 = v73;
LABEL_15:

  return v44;
}

- (id)createTrustedSthKeyStoreFromProofSPKI:(id)a3 signingKeysMap:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 kt_sha256];
  v10 = [v8 objectForKey:v9];

  if (v10)
  {
    v11 = [TransparencyTrustedKeyStore alloc];
    id v12 = [v7 kt_sha256];
    id v13 = +[NSDictionary dictionaryWithObject:v10 forKey:v12];
    id v14 = [(TransparencyTrustedKeyStore *)v11 initWithTrustedKeys:v13];
  }
  else
  {
    if (a5)
    {
      *a5 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-219 description:@"Signing key in proof does not match any signing key in certs"];
    }
    if (qword_10015B348 != -1) {
      dispatch_once(&qword_10015B348, &stru_100136678);
    }
    uint64_t v15 = qword_10015B350;
    if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Signing key in proof does not match any signing key in certs", v17, 2u);
    }
    id v14 = 0;
  }

  return v14;
}

- (id)diskStoreDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(TransparencyPublicKeyBag *)self trustedAppLeafs];
  [v3 setObject:v4 forKeyedSubscript:@"Leafs"];

  v5 = [(TransparencyPublicKeyBag *)self trustedTltLeafs];
  [v3 setObject:v5 forKeyedSubscript:@"TltLeafs"];

  v6 = [(TransparencyPublicKeyBag *)self trustedIntermediates];
  [v3 setObject:v6 forKeyedSubscript:@"Intermediates"];

  id v7 = [(TransparencyPublicKeyBag *)self patConfigProof];
  [v3 setObject:v7 forKeyedSubscript:@"PatConfigProof"];

  id v8 = [(TransparencyPublicKeyBag *)self tltConfigProof];
  [v3 setObject:v8 forKeyedSubscript:@"TltConfigProof"];

  v9 = [(TransparencyPublicKeyBag *)self receiptTime];
  [v3 setObject:v9 forKeyedSubscript:@"ReceiptTime"];

  v10 = [(TransparencyPublicKeyBag *)self patClosedProof];
  [v3 setObject:v10 forKeyedSubscript:@"PatClosedProof"];

  v11 = [(TransparencyPublicKeyBag *)self treeRollInfoURL];
  [v3 setObject:v11 forKeyedSubscript:@"TreeRollInfoURL"];

  return v3;
}

- (id)copyTltBag
{
  v3 = objc_alloc_init(TransparencyPublicKeyBag);
  [(TransparencyPublicKeyBag *)v3 setApplication:kKTApplicationIdentifierTLT];
  v4 = [(TransparencyPublicKeyBag *)self tltKeyStore];
  [(TransparencyPublicKeyBag *)v3 setAppSthKeyStore:v4];

  v5 = [(TransparencyPublicKeyBag *)self trustedTltSigningKeys];
  [(TransparencyPublicKeyBag *)v3 setTrustedAppSigningKeys:v5];

  [(TransparencyPublicKeyBag *)v3 setPatLogBeginningMs:[(TransparencyPublicKeyBag *)self tltLogBeginningMs]];
  v6 = [(TransparencyPublicKeyBag *)self tltKeyStore];
  [(TransparencyPublicKeyBag *)v3 setTltKeyStore:v6];

  id v7 = [(TransparencyPublicKeyBag *)self trustedTltSigningKeys];
  [(TransparencyPublicKeyBag *)v3 setTrustedTltSigningKeys:v7];

  [(TransparencyPublicKeyBag *)v3 setTltLogBeginningMs:[(TransparencyPublicKeyBag *)self tltLogBeginningMs]];
  id v8 = [(TransparencyPublicKeyBag *)self vrfKey];
  [(TransparencyPublicKeyBag *)v3 setVrfKey:v8];

  v9 = [(TransparencyPublicKeyBag *)self receiptTime];
  [(TransparencyPublicKeyBag *)v3 setReceiptTime:v9];

  [(TransparencyPublicKeyBag *)v3 setTltEarliestVersion:[(TransparencyPublicKeyBag *)self tltEarliestVersion]];
  [(TransparencyPublicKeyBag *)v3 setShutDown:[(TransparencyPublicKeyBag *)self shutDown]];
  return v3;
}

- (NSArray)verifiedLogHeads
{
  v2 = [(TransparencyPublicKeyBag *)self __verifiedLogHeads];
  v3 = +[NSArray arrayWithArray:v2];

  return (NSArray *)v3;
}

- (BOOL)verifyCertificates:(id)a3 intermediates:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(TransparencyPublicKeyBag *)self settings];
  if ([v13 allowsInternalSecurityPolicies])
  {
    id v14 = [(TransparencyPublicKeyBag *)self settings];
    unsigned int v15 = [v14 getBool:kTransparencyFlagDisableVerifyKeyStoreCertificates];

    if (v15)
    {
      if (qword_10015B348 != -1) {
        dispatch_once(&qword_10015B348, &stru_100136698);
      }
      uint64_t v16 = qword_10015B350;
      if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "certificate verification not enabled", buf, 2u);
      }
      BOOL v17 = 1;
      goto LABEL_24;
    }
  }
  else
  {
  }
  uint64_t AppleKeyTransparency = SecPolicyCreateAppleKeyTransparency();
  if (AppleKeyTransparency)
  {
    id v19 = (const void *)AppleKeyTransparency;
    unsigned __int8 v20 = +[TransparencyCertificateHelper verifyCertificates:v10 intermediates:v11 policy:AppleKeyTransparency error:a6];
    BOOL v17 = v20;
    if (a6 && (v20 & 1) == 0)
    {
      *a6 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-29 underlyingError:v12 description:*a6];
      if (qword_10015B348 != -1) {
        dispatch_once(&qword_10015B348, &stru_1001366D8);
      }
      id v21 = qword_10015B350;
      if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
      {
        id v22 = *a6;
        *(_DWORD *)buf = 138412546;
        id v26 = v12;
        __int16 v27 = 2112;
        id v28 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "certificates for %@ failed trust evaluation: %@", buf, 0x16u);
      }
    }
    CFRelease(v19);
  }
  else
  {
    if (a6)
    {
      *a6 = +[TransparencyError errorWithDomain:kTransparencyErrorAlloc, -53, @"failed to create KT policy for %@", v12 code description];
    }
    if (qword_10015B348 != -1) {
      dispatch_once(&qword_10015B348, &stru_1001366B8);
    }
    id v23 = qword_10015B350;
    if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to create KT policy for %@", buf, 0xCu);
    }
    BOOL v17 = 0;
  }
LABEL_24:

  return v17;
}

- (BOOL)processTltConfigProof:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [TransparencyLogEntryVerifier alloc];
  id v8 = [(TransparencyPublicKeyBag *)self tltKeyStore];
  v9 = [(TransparencyLogEntryVerifier *)v7 initWithTrustedKeyStore:v8];

  [v6 setVerifier:v9];
  if (![v6 verifyWithError:a4])
  {
    if (a4)
    {
      *a4 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-224 underlyingError:*a4 description:@"TLT config proof failed to verify"];
    }
    if (qword_10015B348 != -1) {
      dispatch_once(&qword_10015B348, &stru_1001366F8);
    }
    uint64_t v17 = qword_10015B350;
    if (!os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    if (a4) {
      id v18 = *a4;
    }
    else {
      id v18 = 0;
    }
    *(_DWORD *)buf = 138412290;
    v37[0] = v18;
    id v14 = "TLT config proof failed to verify: %@";
    unsigned int v15 = v17;
    uint32_t v16 = 12;
    goto LABEL_36;
  }
  id v10 = [(TransparencyPublicKeyBag *)self __verifiedLogHeads];
  id v11 = [v6 slh];
  id v12 = +[SignedLogHead signedTypeWithObject:v11];
  [v10 addObject:v12];

  if (![v6 nodePosition])
  {
    id v19 = [v6 nodeBytes];
    unsigned __int8 v20 = +[TransparencyGPBMessage parseFromData:v19 error:a4];

    if (!v20)
    {
      if (qword_10015B348 != -1) {
        dispatch_once(&qword_10015B348, &stru_100136738);
      }
      id v28 = qword_10015B350;
      if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
      {
        if (a4) {
          id v29 = *a4;
        }
        else {
          id v29 = 0;
        }
        *(_DWORD *)buf = 138412290;
        v37[0] = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "TLT config node failed to parse: %@", buf, 0xCu);
      }
      if (a4)
      {
        +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-141 underlyingError:*a4 description:@"TLT config node failed to parse"];
        BOOL v30 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v30 = 0;
      }
      goto LABEL_53;
    }
    id v21 = [v20 publicKeyBytes];
    id v22 = [(TransparencyPublicKeyBag *)self trustedTltSigningKeys];
    id v23 = [(TransparencyPublicKeyBag *)self createTrustedSthKeyStoreFromProofSPKI:v21 signingKeysMap:v22 error:a4];

    if (v23)
    {
      if (![(TransparencyPublicKeyBag *)self allowOldKeys]) {
        [(TransparencyPublicKeyBag *)self setTltKeyStore:v23];
      }
      [(TransparencyPublicKeyBag *)self setTltEarliestVersion:TopLevelTreeConfigNode_EarliestVersion_RawValue((uint64_t)v20)];
      if (![(TransparencyPublicKeyBag *)self tltEarliestVersion]) {
        [(TransparencyPublicKeyBag *)self setTltEarliestVersion:1];
      }
      signed int v24 = [(TransparencyPublicKeyBag *)self tltEarliestVersion];
      uint64_t v25 = kTransparencyProtocolVersion;
      if (v24 <= kTransparencyProtocolVersion)
      {
        uint64_t v32 = [v6 data];
        [(TransparencyPublicKeyBag *)self setTltConfigProof:v32];

        BOOL v30 = 1;
        goto LABEL_47;
      }
      if (qword_10015B348 != -1) {
        dispatch_once(&qword_10015B348, &stru_100136778);
      }
      id v26 = (void *)qword_10015B350;
      if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = v26;
        *(_DWORD *)buf = 67109376;
        LODWORD(v37[0]) = [(TransparencyPublicKeyBag *)self tltEarliestVersion];
        WORD2(v37[0]) = 1024;
        *(_DWORD *)((char *)v37 + 6) = v25;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "TLT config proof earliest version later %d than our version %d", buf, 0xEu);
      }
      if (a4)
      {
        +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -235, *a4, @"TLT config proof earliest version later %d than our version %d", [(TransparencyPublicKeyBag *)self tltEarliestVersion], v25 code underlyingError description];
LABEL_44:
        BOOL v30 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:

LABEL_53:
        goto LABEL_54;
      }
    }
    else
    {
      if (qword_10015B348 != -1) {
        dispatch_once(&qword_10015B348, &stru_100136758);
      }
      id v31 = qword_10015B350;
      if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "TLT config proof signing key did not match any trusted cert", buf, 2u);
      }
      if (a4)
      {
        +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -222, *a4, @"TLT config proof signing key did not match any trusted cert", v34, v35 code underlyingError description];
        goto LABEL_44;
      }
    }
    BOOL v30 = 0;
    goto LABEL_47;
  }
  if (a4)
  {
    *a4 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-220 description:@"TLT config proof at wrong position"];
  }
  if (qword_10015B348 != -1) {
    dispatch_once(&qword_10015B348, &stru_100136718);
  }
  uint64_t v13 = qword_10015B350;
  if (!os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR)) {
    goto LABEL_37;
  }
  *(_WORD *)buf = 0;
  id v14 = "TLT config proof at wrong position";
  unsigned int v15 = v13;
  uint32_t v16 = 2;
LABEL_36:
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
LABEL_37:
  BOOL v30 = 0;
LABEL_54:

  return v30;
}

- (id)processPamHeadInPatProof:(id)a3 tltEntry:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 nodeBytes];
  id v40 = 0;
  id v11 = +[TransparencyGPBMessage parseFromData:v10 error:&v40];
  id v12 = v40;

  if (v11 && ([v11 hasObjectMapHead] ? (BOOL v13 = v12 == 0) : (BOOL v13 = 0), v13))
  {
    uint32_t v16 = [TransparencyLogEntryVerifier alloc];
    uint64_t v17 = [(TransparencyPublicKeyBag *)self appSthKeyStore];
    id v18 = [(TransparencyLogEntryVerifier *)v16 initWithTrustedKeyStore:v17];

    id v19 = [TransparencyLogEntryVerifier alloc];
    unsigned __int8 v20 = [(TransparencyPublicKeyBag *)self tltKeyStore];
    id v21 = [(TransparencyLogEntryVerifier *)v19 initWithTrustedKeyStore:v20];

    id v22 = [v11 objectMapHead];
    id v23 = +[SignedMapHead signedTypeWithObject:v22];

    signed int v24 = [(TransparencyLogEntryVerifier *)v18 trustedKeyStore];
    uint64_t v25 = [v24 signatureVerifier];
    [v23 setVerifier:v25];

    [v23 setOverrideBeginTimeFromLogEntry:v8];
    if (v23)
    {
      id v39 = 0;
      id v26 = [v23 verifyWithError:&v39];
      id v27 = v39;
      if (v26 == (id)1)
      {
        [v8 setVerifier:v18];
        v36 = v21;
        [v9 setVerifier:v21];
        id v28 = [TransparencyMapInclusionProofVerifier alloc];
        id v29 = [(TransparencyPublicKeyBag *)self application];
        BOOL v30 = [(TransparencyMapInclusionProofVerifier *)v28 initWithKeyBag:self application:v29];

        v37 = v30;
        id v38 = v27;
        unint64_t v31 = [(TransparencyMapInclusionProofVerifier *)v30 verifyPerApplicationTreeEntry:v8 mapHead:v23 topLevelTreeEntry:v9 error:&v38];
        id v12 = v38;

        if (v12)
        {
          if (qword_10015B348 != -1) {
            dispatch_once(&qword_10015B348, &stru_1001367F8);
          }
          id v21 = v36;
          uint64_t v32 = qword_10015B350;
          if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v42 = v12;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "verifyPerApplicationTreeEntry failed for pamInPatEntry: %@", buf, 0xCu);
          }
          id v15 = 0;
          if (a5) {
            *a5 = v12;
          }
        }
        else
        {
          if (v31)
          {
            [(TransparencyPublicKeyBag *)self setVerifiedSignedMapHead:v23];
            id v15 = v23;
          }
          else
          {
            id v15 = 0;
          }
          id v21 = v36;
        }
      }
      else
      {
        if (qword_10015B348 != -1) {
          dispatch_once(&qword_10015B348, &stru_1001367D8);
        }
        uint64_t v34 = qword_10015B350;
        if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v27;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Couldn't verify SMH from pamHeadInPatProof: signature was invalid with error %@", buf, 0xCu);
        }
        id v15 = 0;
        if (a5 && v27)
        {
          id v12 = v27;
          id v15 = 0;
          *a5 = v12;
        }
        else
        {
          id v12 = v27;
        }
      }
    }
    else
    {
      if (qword_10015B348 != -1) {
        dispatch_once(&qword_10015B348, &stru_1001367B8);
      }
      char v33 = qword_10015B350;
      if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Couldn't verify SMH from pamHeadInPatProof: object init failure", buf, 2u);
      }
      id v12 = 0;
      id v15 = 0;
    }
  }
  else
  {
    if (qword_10015B348 != -1) {
      dispatch_once(&qword_10015B348, &stru_100136798);
    }
    id v14 = qword_10015B350;
    if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Couldn't parse SMH from pamHeadInPatProof: %@", buf, 0xCu);
    }
    id v15 = 0;
    if (a5 && v12)
    {
      id v12 = v12;
      id v15 = 0;
      *a5 = v12;
    }
  }

  return v15;
}

- (BOOL)verifyConfigProof:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [TransparencyPatInclusionProofVerifier alloc];
  id v8 = [(TransparencyPublicKeyBag *)self application];
  id v9 = [(TransparencyPatInclusionProofVerifier *)v7 initWithKeyBag:self application:v8];

  [v6 setVerifier:v9];
  id v10 = [v6 verifyConfigProof:a4];
  if (v10 == (id)1)
  {
    id v11 = [(TransparencyPublicKeyBag *)self __verifiedLogHeads];
    id v12 = [v6 perApplicationTreeEntry];
    BOOL v13 = [v12 slh];
    id v14 = +[SignedLogHead signedTypeWithObject:v13];
    [v11 addObject:v14];

    id v15 = [(TransparencyPublicKeyBag *)self __verifiedLogHeads];
    uint32_t v16 = [v6 topLevelTreeEntry];
    uint64_t v17 = [v16 slh];
    id v18 = +[SignedLogHead signedTypeWithObject:v17];
    [v15 addObject:v18];
  }
  return v10 == (id)1;
}

- (id)copyVRFKeyFromConfigProof:(id)a3 error:(id *)a4
{
  id v6 = [a3 vrfPublicKeyWithError:a4];
  id v7 = v6;
  if (v6)
  {
    id v8 = +[TransparencyVRFVerifier verifierOfType:key:](TransparencyVRFVerifier, "verifierOfType:key:", [v6 type], v6);
    id v9 = v8;
    if (v8 && [v8 vrfType])
    {
      id v10 = v7;
    }
    else
    {
      if (a4)
      {
        uint64_t v11 = kTransparencyErrorDecode;
        id v12 = [v7 vrfKey];
        BOOL v13 = [v12 kt_hexString];
        +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v11, -143, @"VRF public key [%@] of type %d is invalid", v13, [v7 type]);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (qword_10015B348 != -1) {
        dispatch_once(&qword_10015B348, &stru_100136838);
      }
      id v14 = (void *)qword_10015B350;
      if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
      {
        id v15 = v14;
        uint32_t v16 = [v7 vrfKey];
        uint64_t v17 = [v16 kt_hexString];
        *(_DWORD *)buf = 138412546;
        id v23 = v17;
        __int16 v24 = 1024;
        unsigned int v25 = [v7 type];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "VRF public key [%@] of type %d is invalid", buf, 0x12u);
      }
      id v10 = 0;
    }
  }
  else
  {
    if (qword_10015B348 != -1) {
      dispatch_once(&qword_10015B348, &stru_100136818);
    }
    id v18 = (void *)qword_10015B350;
    if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
    {
      id v19 = v18;
      unsigned __int8 v20 = [(TransparencyPublicKeyBag *)self application];
      *(_DWORD *)buf = 138543362;
      id v23 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to get vrf public key from config proof for %{public}@", buf, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

- (BOOL)processPatConfigProof:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(TransparencyPublicKeyBag *)self verifyConfigProof:v6 error:a4]) {
    goto LABEL_13;
  }
  if (qword_10015B348 != -1) {
    dispatch_once(&qword_10015B348, &stru_100136858);
  }
  id v7 = (void *)qword_10015B350;
  if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    *(_DWORD *)buf = 134218240;
    *(void *)unint64_t v31 = [(TransparencyPublicKeyBag *)self patLogBeginningMs];
    *(_WORD *)&v31[8] = 2048;
    id v32 = [v6 patLogBeginningMs];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Processing new PAT config. Current %llu, processing %llu", buf, 0x16u);
  }
  -[TransparencyPublicKeyBag setPatEarliestVersion:](self, "setPatEarliestVersion:", [v6 earliestCurrentTreeVersionWithError:a4]);
  signed int v9 = [(TransparencyPublicKeyBag *)self patEarliestVersion];
  uint64_t v10 = kTransparencyProtocolVersion;
  if (v9 > kTransparencyProtocolVersion)
  {
    if (qword_10015B348 != -1) {
      dispatch_once(&qword_10015B348, &stru_100136878);
    }
    uint64_t v11 = (void *)qword_10015B350;
    if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
    {
      id v12 = v11;
      unsigned int v13 = [(TransparencyPublicKeyBag *)self patEarliestVersion];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)unint64_t v31 = v13;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "PAT config proof earliest version later %d than our version %d", buf, 0xEu);
    }
    if (a4)
    {
      +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -236, *a4, @"PAT config proof earliest version later %d than our version %d", [(TransparencyPublicKeyBag *)self patEarliestVersion], v10 code underlyingError description];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
LABEL_13:
    BOOL v14 = 0;
    goto LABEL_44;
  }
  id v15 = [v6 patSigningKeyWithError:a4];
  if (v15)
  {
    uint32_t v16 = [(TransparencyPublicKeyBag *)self trustedAppSigningKeys];
    uint64_t v17 = [(TransparencyPublicKeyBag *)self createTrustedSthKeyStoreFromProofSPKI:v15 signingKeysMap:v16 error:a4];

    if (v17)
    {
      if (![(TransparencyPublicKeyBag *)self allowOldKeys]) {
        [(TransparencyPublicKeyBag *)self setAppSthKeyStore:v17];
      }
      id v29 = 0;
      id v18 = [(TransparencyPublicKeyBag *)self copyVRFKeyFromConfigProof:v6 error:&v29];
      id v28 = v29;
      if (v18)
      {
        [(TransparencyPublicKeyBag *)self setVrfKey:v18];
        -[TransparencyPublicKeyBag setVrfType:](self, "setVrfType:", [v18 type]);
      }
      id v19 = [v6 data];
      [(TransparencyPublicKeyBag *)self setPatConfigProof:v19];

      id v20 = [v6 tltLogBeginningMs];
      id v21 = [v6 patLogBeginningMs];
      if (v20) {
        BOOL v22 = v21 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      BOOL v14 = !v22;
      if (v22)
      {
        if (a4)
        {
          *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-169 description:@"PAT config proof STHs missing epoch begin times"];
        }
        if (qword_10015B348 != -1) {
          dispatch_once(&qword_10015B348, &stru_1001368B8);
        }
        __int16 v24 = v28;
        id v26 = qword_10015B350;
        if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "PAT config proof STHs missing epoch begin times", buf, 2u);
        }
      }
      else
      {
        id v23 = v21;
        [(TransparencyPublicKeyBag *)self setTltLogBeginningMs:v20];
        [(TransparencyPublicKeyBag *)self setPatLogBeginningMs:v23];
        __int16 v24 = v28;
      }
    }
    else
    {
      if (qword_10015B348 != -1) {
        dispatch_once(&qword_10015B348, &stru_100136898);
      }
      unsigned int v25 = qword_10015B350;
      if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "PAT config proof signing key did not match any trusted cert", buf, 2u);
      }
      if (a4)
      {
        +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-221 underlyingError:*a4 description:@"PAT config proof signing key did not match any trusted cert"];
        BOOL v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v14 = 0;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

LABEL_44:
  return v14;
}

- (BOOL)processPatClosedProof:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [TransparencyPatInclusionProofVerifier alloc];
  id v8 = [(TransparencyPublicKeyBag *)self application];
  signed int v9 = [(TransparencyPatInclusionProofVerifier *)v7 initWithKeyBag:self application:v8];

  [v6 setVerifier:v9];
  if ([v6 verifyWithError:a4] != (id)1) {
    goto LABEL_11;
  }
  id v10 = [v6 earliestNextTreeVersionWithError:a4];
  BOOL v11 = (BOOL)v10;
  if (v10)
  {
    uint64_t v12 = kTransparencyProtocolVersion;
    if (kTransparencyProtocolVersion < (int)v10)
    {
      LOBYTE(v11) = 1;
      [(TransparencyPublicKeyBag *)self setUnsupported:1];
      unsigned int v13 = [v6 data];
      [(TransparencyPublicKeyBag *)self setPatClosedProof:v13];

      -[TransparencyPublicKeyBag setShutDown:](self, "setShutDown:", [v6 shutdownTimeStamp:a4]);
      goto LABEL_12;
    }
    if (qword_10015B348 != -1) {
      dispatch_once(&qword_10015B348, &stru_1001368D8);
    }
    BOOL v14 = qword_10015B350;
    if (os_log_type_enabled((os_log_t)qword_10015B350, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v17 = v11;
      __int16 v18 = 1024;
      int v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "PAT Closed proof for %d but our version is supported %d", buf, 0xEu);
    }
    if (a4)
    {
      +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -234, *a4, @"PAT Closed proof for %d but our version is supported %d", v11, v12 code underlyingError description];
      LOBYTE(v11) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    LOBYTE(v11) = 0;
  }
LABEL_12:

  return v11;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSDictionary)trustedAppSigningKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTrustedAppSigningKeys:(id)a3
{
}

- (NSDate)receiptTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReceiptTime:(id)a3
{
}

- (VRFPublicKey)vrfKey
{
  return (VRFPublicKey *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVrfKey:(id)a3
{
}

- (TransparencyTrustedKeyStore)appSmtKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAppSmtKeyStore:(id)a3
{
}

- (TransparencyTrustedKeyStore)appSthKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAppSthKeyStore:(id)a3
{
}

- (TransparencyTrustedKeyStore)tltKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTltKeyStore:(id)a3
{
}

- (unint64_t)patLogBeginningMs
{
  return self->_patLogBeginningMs;
}

- (void)setPatLogBeginningMs:(unint64_t)a3
{
  self->_patLogBeginningMs = a3;
}

- (unint64_t)tltLogBeginningMs
{
  return self->_tltLogBeginningMs;
}

- (void)setTltLogBeginningMs:(unint64_t)a3
{
  self->_tltLogBeginningMs = a3;
}

- (int)tltEarliestVersion
{
  return self->_tltEarliestVersion;
}

- (void)setTltEarliestVersion:(int)a3
{
  self->_tltEarliestVersion = a3;
}

- (int)patEarliestVersion
{
  return self->_patEarliestVersion;
}

- (void)setPatEarliestVersion:(int)a3
{
  self->_patEarliestVersion = a3;
}

- (unint64_t)shutDown
{
  return self->_shutDown;
}

- (void)setShutDown:(unint64_t)a3
{
  self->_shutDown = a3;
}

- (BOOL)unsupported
{
  return self->_unsupported;
}

- (void)setUnsupported:(BOOL)a3
{
  self->_unsupported = a3;
}

- (NSString)treeRollInfoURL
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTreeRollInfoURL:(id)a3
{
}

- (BOOL)mapStillPopulating
{
  return self->_mapStillPopulating;
}

- (void)setMapStillPopulating:(BOOL)a3
{
  self->_mapStillPopulating = a3;
}

- (SignedMapHead)verifiedSignedMapHead
{
  return (SignedMapHead *)objc_getProperty(self, a2, 112, 1);
}

- (void)setVerifiedSignedMapHead:(id)a3
{
}

- (NSData)patConfigProof
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPatConfigProof:(id)a3
{
}

- (NSData)tltConfigProof
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTltConfigProof:(id)a3
{
}

- (NSData)patClosedProof
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPatClosedProof:(id)a3
{
}

- (int)vrfType
{
  return self->_vrfType;
}

- (void)setVrfType:(int)a3
{
  self->_vrfType = a3;
}

- (NSArray)trustedAppLeafs
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTrustedAppLeafs:(id)a3
{
}

- (NSDictionary)trustedTltSigningKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTrustedTltSigningKeys:(id)a3
{
}

- (NSArray)trustedTltLeafs
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTrustedTltLeafs:(id)a3
{
}

- (NSArray)trustedIntermediates
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTrustedIntermediates:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSettings:(id)a3
{
}

- (BOOL)allowOldKeys
{
  return self->_allowOldKeys;
}

- (void)setAllowOldKeys:(BOOL)a3
{
  self->_allowOldKeys = a3;
}

- (NSMutableArray)__verifiedLogHeads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)set__verifiedLogHeads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->___verifiedLogHeads, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_trustedIntermediates, 0);
  objc_storeStrong((id *)&self->_trustedTltLeafs, 0);
  objc_storeStrong((id *)&self->_trustedTltSigningKeys, 0);
  objc_storeStrong((id *)&self->_trustedAppLeafs, 0);
  objc_storeStrong((id *)&self->_patClosedProof, 0);
  objc_storeStrong((id *)&self->_tltConfigProof, 0);
  objc_storeStrong((id *)&self->_patConfigProof, 0);
  objc_storeStrong((id *)&self->_verifiedSignedMapHead, 0);
  objc_storeStrong((id *)&self->_treeRollInfoURL, 0);
  objc_storeStrong((id *)&self->_tltKeyStore, 0);
  objc_storeStrong((id *)&self->_appSthKeyStore, 0);
  objc_storeStrong((id *)&self->_appSmtKeyStore, 0);
  objc_storeStrong((id *)&self->_vrfKey, 0);
  objc_storeStrong((id *)&self->_receiptTime, 0);
  objc_storeStrong((id *)&self->_trustedAppSigningKeys, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end