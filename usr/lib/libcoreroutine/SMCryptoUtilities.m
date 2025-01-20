@interface SMCryptoUtilities
+ (id)createAllowReadToken;
+ (id)createSafetyCacheKey;
+ (id)decryptSafetyCache:(id)a3 key:(id)a4 sessionID:(id)a5 role:(id)a6 device:(int64_t)a7 metricsDict:(id *)a8 hashString:(id *)a9;
+ (id)decryptSafetyCache:(id)a3 withKey:(id)a4;
+ (id)encryptSafetyCache:(id)a3 withKey:(id)a4;
+ (id)getDeserializedJsonDict:(id)a3;
+ (id)getRandomBytes:(unint64_t)a3;
+ (id)getSerializedJsonData:(id)a3;
@end

@implementation SMCryptoUtilities

+ (id)getSerializedJsonData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v10 = 0;
    id v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:&v10];
    v4 = v10;
    if (v4)
    {
      v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,getSerializedJsonData,failed to serialize dict into JSON,error,%@", buf, 0xCu);
      }
      v6 = 0;
    }
    else
    {
      v7 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
      v5 = [v7 stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];

      v8 = [v5 dataUsingEncoding:4];

      id v3 = v8;
      v6 = v3;
    }
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,getSerializedJsonData,dict is nil", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)getDeserializedJsonDict:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v8 = 0;
    id v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:1 error:&v8];
    v4 = v8;
    if (v4)
    {
      v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v4;
        _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,getDeserializedJsonDict,failed to deserialize json dictionary,error,%@", buf, 0xCu);
      }

      id v6 = 0;
    }
    else
    {
      id v6 = v3;
    }
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,getDeserializedJsonDict,jsonData is nil", buf, 2u);
    }
    id v6 = 0;
  }

  return v6;
}

+ (id)getRandomBytes:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a3];
  v5 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  id v6 = v4;
  int v7 = SecRandomCopyBytes(v5, a3, (void *)[v6 mutableBytes]);
  if (v7)
  {
    int v8 = v7;
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v8;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,getRandomBytes,failed to generate AES key,error,%d", (uint8_t *)v12, 8u);
    }

    id v10 = 0;
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

+ (id)createAllowReadToken
{
  return +[SMCryptoUtilities getRandomBytes:32];
}

+ (id)createSafetyCacheKey
{
  return +[SMCryptoUtilities getRandomBytes:32];
}

+ (id)encryptSafetyCache:(id)a3 withKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (!v5 || !v6)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v20 = 0;
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v17 = "#SafetyCache,SMCU,encryptSafetyCache,data and/or key pointer are nil";
    v18 = v9;
    uint32_t v19 = 2;
LABEL_24:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_12;
  }
  if ([v6 length] != 32)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 67109120;
    int v23 = [v7 length];
    v17 = "#SafetyCache,SMCU,encryptSafetyCache,unsupported AES key length,%d";
    v18 = v9;
    uint32_t v19 = 8;
    goto LABEL_24;
  }
  uint64_t v8 = [v5 length];
  v9 = +[SMCryptoUtilities getRandomBytes:16];
  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v8 + 32];
    [v10 replaceBytesInRange:0, 16, -[NSObject bytes](v9, "bytes")];
    id v11 = v10;
    [v11 mutableBytes];
    id v12 = v7;
    [v12 bytes];
    [v12 length];
    uint64_t v13 = v11;
    [v13 mutableBytes];
    [v5 bytes];
    int v14 = CCCryptorGCMOneshotEncrypt();
    v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = v15;
    if (!v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,SMCU,encryptSafetyCache,successfully encrypted data", buf, 2u);
      }

      uint64_t v13 = v13;
      v20 = v13;
      goto LABEL_19;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v23 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,encryptSafetyCache,failed to encrypt data,error,%d", buf, 8u);
    }
  }
  else
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,encryptSafetyCache,failed to generate IV", buf, 2u);
    }
  }
  v20 = 0;
LABEL_19:

LABEL_20:

  return v20;
}

+ (id)decryptSafetyCache:(id)a3 withKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (!v5 || !v6)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v9 = "#SafetyCache,SMCU,decryptSafetyCache,encryptedData and/or key pointer are nil";
      id v10 = v8;
      uint32_t v11 = 2;
      goto LABEL_8;
    }
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  if ((unint64_t)[v5 length] <= 0x20)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = [v5 length];
      v9 = "#SafetyCache,SMCU,decryptSafetyCache,encryptedData is too short,length,%d";
      id v10 = v8;
      uint32_t v11 = 8;
LABEL_8:
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  uint64_t v12 = [v5 length] - 32;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v12];
  [v5 bytes];
  id v14 = v7;
  [v14 bytes];
  [v14 length];
  uint64_t v8 = v13;
  [v8 mutableBytes];
  int v15 = CCCryptorGCMOneshotDecrypt();
  v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,decryptSafetyCache,failed to decrypt data,error,%d", buf, 8u);
    }

    goto LABEL_13;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "#SafetyCache,SMCU,decryptSafetyCache,successfully decrypted data", buf, 2u);
  }

  uint64_t v8 = v8;
  v18 = v8;
LABEL_14:

  return v18;
}

+ (id)decryptSafetyCache:(id)a3 key:(id)a4 sessionID:(id)a5 role:(id)a6 device:(int64_t)a7 metricsDict:(id *)a8 hashString:(id *)a9
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (!v15)
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

LABEL_18:
      int v21 = 0;
      goto LABEL_59;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: encryptedData";
LABEL_66:
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
    goto LABEL_17;
  }
  if (!v17)
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_66;
  }
  if (v16)
  {
    uint64_t v19 = +[SMCryptoUtilities decryptSafetyCache:v15 withKey:v16];
    v64 = (void *)v19;
    if (!v19)
    {
      v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v51 = (objc_class *)objc_opt_class();
        v52 = NSStringFromClass(v51);
        NSStringFromSelector(a2);
        v54 = int64_t v53 = a7;
        *(_DWORD *)buf = 138413058;
        id v66 = v18;
        __int16 v67 = 2112;
        id v68 = v17;
        __int16 v69 = 2112;
        v70 = v52;
        __int16 v71 = 2112;
        v72 = v54;
        _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,sessionID:%@,%@,%@,decryption failed", buf, 0x2Au);

        a7 = v53;
      }

      if (a7 == 1 && a8)
      {
        id v36 = *a8;
        v37 = @"phoneCacheDecryptionResult";
      }
      else
      {
        int64_t v42 = a7;
        int v21 = 0;
        if (v42 != 2 || !a8) {
          goto LABEL_58;
        }
        id v36 = *a8;
        v37 = @"watchCacheDecryptionResult";
      }
      [v36 setValue:&unk_1F3451338 forKey:v37];
      int v21 = 0;
LABEL_58:

      goto LABEL_59;
    }
    uint64_t v20 = +[SMCryptoUtilities getDeserializedJsonDict:v19];
    if (!v20)
    {
      v29 = 0;
      v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v55 = (objc_class *)objc_opt_class();
        v56 = NSStringFromClass(v55);
        NSStringFromSelector(a2);
        v58 = int64_t v57 = a7;
        *(_DWORD *)buf = 138413058;
        id v66 = v18;
        __int16 v67 = 2112;
        id v68 = v17;
        __int16 v69 = 2112;
        v70 = v56;
        __int16 v71 = 2112;
        v72 = v58;
        _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,sessionID:%@,%@,%@,deserialization failed", buf, 0x2Au);

        a7 = v57;
      }

      if (a7 == 1 && a8)
      {
        id v40 = *a8;
        v41 = @"phoneCacheDecryptionResult";
      }
      else
      {
        int64_t v45 = a7;
        int v21 = 0;
        if (v45 != 2 || !a8) {
          goto LABEL_57;
        }
        id v40 = *a8;
        v41 = @"watchCacheDecryptionResult";
      }
      [v40 setValue:&unk_1F3451350 forKey:v41];
      int v21 = 0;
LABEL_57:

      goto LABEL_58;
    }
    int64_t v63 = a7;
    v62 = (void *)v20;
    int v21 = (void *)[objc_alloc(MEMORY[0x1E4F99818]) initWithDictionary:v20];
    if (!v21)
    {
      v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v59 = (objc_class *)objc_opt_class();
        v60 = NSStringFromClass(v59);
        v61 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        id v66 = v18;
        __int16 v67 = 2112;
        id v68 = v17;
        __int16 v69 = 2112;
        v70 = v60;
        __int16 v71 = 2112;
        v72 = v61;
        _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,sessionID:%@,%@,%@,initialization of SMCache object failed", buf, 0x2Au);
      }
      if (v63 == 1 && a8)
      {
        [*a8 setValue:&unk_1F3451368 forKey:@"phoneCacheDecryptionResult"];
        v29 = v62;
      }
      else
      {
        v29 = v62;
        if (v63 == 2 && a8) {
          [*a8 setValue:&unk_1F3451368 forKey:@"watchCacheDecryptionResult"];
        }
      }
      goto LABEL_52;
    }
    if (a9)
    {
      uint64_t v22 = [v64 md5];
      *a9 = [v22 hexString];
    }
    int v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      v26 = NSStringFromSelector(a2);
      v27 = [v21 identifier];
      *(_DWORD *)buf = 138413570;
      id v66 = v18;
      __int16 v67 = 2112;
      id v68 = v17;
      __int16 v69 = 2112;
      v70 = v25;
      __int16 v71 = 2112;
      v72 = v26;
      __int16 v73 = 2112;
      v74 = v27;
      __int16 v75 = 2048;
      uint64_t v76 = [v21 identifierHash];
      _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,sessionID:%@,%@,%@,successfully decrypted safety cache data,cacheIdentifier %@, hash %lu", buf, 0x3Eu);
    }
    if (v63 == 1 && a8)
    {
      v28 = @"phoneCacheDecryptionResult";
      v29 = v62;
    }
    else
    {
      v29 = v62;
      if (v63 != 2 || !a8) {
        goto LABEL_51;
      }
      v28 = @"watchCacheDecryptionResult";
    }
    [*a8 setValue:&unk_1F3451380 forKey:v28];
LABEL_51:
    id v44 = v21;
LABEL_52:

    goto LABEL_57;
  }
  v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v47 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v47);
    NSStringFromSelector(a2);
    v50 = int64_t v49 = a7;
    *(_DWORD *)buf = 138413058;
    id v66 = v18;
    __int16 v67 = 2112;
    id v68 = v17;
    __int16 v69 = 2112;
    v70 = v48;
    __int16 v71 = 2112;
    v72 = v50;
    _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,sessionID:%@,%@,%@,no safety cache key available", buf, 0x2Au);

    a7 = v49;
  }

  if (a7 == 1 && a8)
  {
    id v33 = *a8;
    v34 = @"phoneCacheDecryptionResult";
LABEL_32:
    [v33 setValue:&unk_1F3451320 forKey:v34];
    goto LABEL_18;
  }
  int64_t v38 = a7;
  int v21 = 0;
  if (v38 == 2 && a8)
  {
    id v33 = *a8;
    v34 = @"watchCacheDecryptionResult";
    goto LABEL_32;
  }
LABEL_59:

  return v21;
}

@end