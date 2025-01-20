@interface TRIFlatbufferUtils
+ (id)_maAutoAssetReferencedInDir:(id)a3 byFactorName:(id)a4;
+ (id)convertFBFactorLevelToProtoFactorLevel:(id)a3 parentDir:(id)a4 namespaceName:(id)a5 isRelativePath:(BOOL)a6;
@end

@implementation TRIFlatbufferUtils

+ (id)convertFBFactorLevelToProtoFactorLevel:(id)a3 parentDir:(id)a4 namespaceName:(id)a5 isRelativePath:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = MEMORY[0x19F3AD060]();
  uint64_t v14 = objc_opt_new();
  v109 = objc_opt_new();
  v15 = objc_opt_new();
  v16 = &off_19D98B000;
  id v107 = v12;
  v108 = (void *)v14;
  v106 = (void *)v13;
  switch([v10 levelType])
  {
    case 0u:
      v17 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v102 = [v10 name];
        *(_DWORD *)buf = 138543362;
        v117 = v102;
        _os_log_error_impl(&dword_19D909000, v17, OS_LOG_TYPE_ERROR, "Factor level type set to none: %{public}@", buf, 0xCu);
      }
      goto LABEL_5;
    case 1u:
      v23 = [v10 levelAsBoolVal];
      v19 = v109;
      objc_msgSend(v109, "setBooleanValue:", objc_msgSend(v23, "val"));

      uint64_t v18 = 10;
      goto LABEL_58;
    case 2u:
      v20 = [v10 levelAsStringVal];
      v19 = v109;
      [v109 setStringValue:v20];

      uint64_t v18 = 11;
      goto LABEL_58;
    case 3u:
      v21 = [v10 levelAsInt64Val];
      v19 = v109;
      objc_msgSend(v109, "setLongValue:", objc_msgSend(v21, "val"));

      uint64_t v18 = 13;
      goto LABEL_58;
    case 4u:
      v22 = [v10 levelAsDoubleVal];
      [v22 val];
      v19 = v109;
      objc_msgSend(v109, "setDoubleValue:");

      uint64_t v18 = 15;
      goto LABEL_58;
    case 5u:
      v104 = v11;
      context = (void *)MEMORY[0x19F3AD060]();
      v24 = objc_opt_new();
      v25 = [v10 levelAsTrialAssetVal];
      v26 = [v25 path];
      uint64_t v27 = [v26 length];

      if (v27)
      {
        v28 = [v25 path];
        v29 = v109;
        if (v6)
        {
          v30 = [v104 stringByAppendingPathComponent:v28];
          [v24 setPath:v30];
        }
        else
        {
          [v24 setPath:v28];
        }
      }
      else
      {
        [v24 setHasPath:0];
        v29 = v109;
      }
      if ([v25 hasDownloadSize])
      {
        uint64_t v48 = [v25 downloadSize];
        v49 = [v24 asset];
        [v49 setSize:v48];
      }
      if ([v25 hasOnDemandFlag]) {
        objc_msgSend(v24, "setIsOnDemand:", objc_msgSend(v25, "isOnDemand"));
      }
      v50 = [v25 assetName];
      uint64_t v51 = [v50 length];

      if (v51)
      {
        v52 = [v25 assetName];
        v53 = [v24 asset];
        [v53 setName:v52];
      }
      v54 = [v25 assetId];
      v55 = [v24 asset];
      [v55 setAssetId:v54];

      int v56 = [v25 cloudKitMetadataType];
      if (v56 == 1)
      {
        v57 = [v25 cloudKitMetadataAsTreatment];
        int v59 = [v57 container];
        if (v59 == 2)
        {
          v63 = [v24 asset];
          v60 = v63;
          uint64_t v64 = 2;
        }
        else
        {
          if (v59 != 1)
          {
            if (v59)
            {
LABEL_48:
              v65 = v29;
              if ([v57 hasCkIndex])
              {
                uint64_t v66 = [v57 assetIndex];
                v67 = [v24 asset];
                [v67 setCloudKitIndex:v66];
              }
              v68 = [v57 treatmentId];
              uint64_t v69 = [v68 length];

              if (v69)
              {
                v70 = [v57 treatmentId];
                v71 = [v24 asset];
                [v71 setTreatmentId:v70];
              }
              v29 = v65;
              goto LABEL_53;
            }
            v60 = TRILogCategory_ClientFramework();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              [v10 name];
              v62 = v61 = v29;
              *(_DWORD *)buf = 138543362;
              v117 = v62;
              _os_log_impl(&dword_19D909000, v60, OS_LOG_TYPE_INFO, "CloudKit container unknown for: %{public}@", buf, 0xCu);

              v29 = v61;
            }
LABEL_47:

            goto LABEL_48;
          }
          v63 = [v24 asset];
          v60 = v63;
          uint64_t v64 = 1;
        }
        [v63 setCloudKitContainer:v64];
        goto LABEL_47;
      }
      if (v56) {
        goto LABEL_54;
      }
      v57 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v58 = [v10 name];
        *(_DWORD *)buf = 138543362;
        v117 = v58;
        _os_log_error_impl(&dword_19D909000, v57, OS_LOG_TYPE_ERROR, "CloudKit metadata type as none for: %{public}@", buf, 0xCu);
      }
LABEL_53:

LABEL_54:
      v72 = v24;
      if ([v25 fileType] == 1)
      {
        uint64_t v73 = [v29 setFileValue:v24];
        uint64_t v18 = 100;
      }
      else
      {
        uint64_t v73 = [v29 setDirectoryValue:v24];
        uint64_t v18 = 101;
      }
      v74 = v29;
      v75 = (void *)MEMORY[0x19F3AD060](v73);
      id v76 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v77 = [v10 metadata];
      v78 = objc_msgSend(v76, "initWithCapacity:", objc_msgSend(v77, "count"));

      v79 = [v10 metadata];
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke;
      v114[3] = &unk_1E596AF38;
      id v115 = v78;
      id v80 = v78;
      [v79 enumerateObjectsUsingBlock:v114];

      [v74 setMetadata:v80];

      id v11 = v104;
      v19 = v74;
      v16 = &off_19D98B000;
LABEL_58:
      v81 = (void *)MEMORY[0x19F3AD060]();
      v82 = (void *)[(id)objc_opt_new() init];
      v83 = [v10 metadata];
      v112[0] = MEMORY[0x1E4F143A8];
      uint64_t v84 = *((void *)v16 + 237);
      v112[1] = v84;
      v112[2] = __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke_2;
      v112[3] = &unk_1E596AF38;
      id v85 = v82;
      id v113 = v85;
      [v83 enumerateObjectsUsingBlock:v112];

      if ([v85 count]) {
        [v19 setMetadata:v85];
      }

      [v108 setLevel:v19];
      v86 = [v10 factorNamespaceName];
      uint64_t v87 = [v86 length];

      if (v87)
      {
        v88 = [v10 factorNamespaceName];
        [v15 setNamespaceName:v88];

        v89 = v107;
      }
      else
      {
        v89 = v107;
        [v15 setNamespaceName:v107];
      }
      if ([v10 hasNamespaceId])
      {
        objc_msgSend(v15, "setNamespaceId:", objc_msgSend(v10, "namespaceId"));
      }
      else
      {
        v90 = (void *)MEMORY[0x1E4FB05B8];
        v91 = [v15 namespaceName];
        objc_msgSend(v15, "setNamespaceId:", objc_msgSend(v90, "namespaceIdFromName:", v91));
      }
      v92 = [v10 name];
      [v15 setName:v92];

      v93 = [v10 alias];
      [v15 setAlias:v93];

      [v15 setType:v18];
      v94 = [v10 factorId];
      uint64_t v95 = [v94 length];

      if (v95)
      {
        v96 = [v10 factorId];
        objc_msgSend(v15, "setId_p:", v96);
      }
      v97 = (void *)MEMORY[0x19F3AD060]();
      v98 = objc_opt_new();
      v99 = [v10 metadata];
      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = v84;
      v110[2] = __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke_3;
      v110[3] = &unk_1E596AF38;
      id v111 = v98;
      id v100 = v98;
      [v99 enumerateObjectsUsingBlock:v110];

      [v15 setMetadataKeysArray:v100];
      [v108 setFactor:v15];

      return v108;
    case 6u:
      id v105 = v11;
      v31 = objc_opt_new();
      v32 = [v10 levelAsMaRefVal];
      if ([v32 hasIsOnDemand]) {
        objc_msgSend(v31, "setIsOnDemand:", objc_msgSend(v32, "isOnDemand"));
      }
      if ([v32 hasDownloadSize])
      {
        uint64_t v33 = [v32 downloadSize];
        v34 = [v31 asset];
        [v34 setSize:v33];
      }
      v35 = [v32 assetName];
      uint64_t v36 = [v35 length];

      if (v36)
      {
        v37 = [v32 assetName];
        v38 = [v31 asset];
        [v38 setName:v37];
      }
      id v39 = [NSString alloc];
      v40 = [v32 type];
      v41 = [v32 specifier];
      v42 = [v32 version];
      v43 = (void *)[v39 initWithFormat:@"%@-%@-%@", v40, v41, v42];
      v44 = [v31 asset];
      [v44 setAssetId:v43];

      v45 = [v10 name];
      v46 = [a1 _maAutoAssetReferencedInDir:v105 byFactorName:v45];

      v47 = v31;
      if (v46) {
        [v31 setPath:v46];
      }
      v19 = v109;
      if ([v32 hasFileType] && objc_msgSend(v32, "fileType") == 1)
      {
        [v109 setFileValue:v31];
        uint64_t v18 = 100;
      }
      else
      {
        [v109 setDirectoryValue:v31];
        uint64_t v18 = 101;
      }
      v16 = &off_19D98B000;

      id v11 = v105;
      goto LABEL_58;
    default:
LABEL_5:
      uint64_t v18 = 0;
      v19 = v109;
      goto LABEL_58;
  }
}

void __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 val];
  v4 = [v3 key];

  [v2 setObject:v5 forKey:v4];
}

void __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 val];
  v4 = [v3 key];

  [v2 setObject:v5 forKey:v4];
}

void __100__TRIFlatbufferUtils_convertFBFactorLevelToProtoFactorLevel_parentDir_namespaceName_isRelativePath___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 key];
  [v2 addObject:v3];
}

+ (id)_maAutoAssetReferencedInDir:(id)a3 byFactorName:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x19F3AD060]();
  v8 = [v6 triFilenameForFactorName];
  v9 = (void *)[[NSString alloc] initWithFormat:@"%@/maRefs/%@", v5, v8];
  id v21 = 0;
  id v10 = [NSString stringWithContentsOfFile:v9 encoding:4 error:&v21];
  id v11 = v21;
  id v12 = [v10 triTrim];

  if (!v12)
  {
    if (v11)
    {
      v17 = [v11 domain];
      if ([v17 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        uint64_t v18 = [v11 code];

        if (v18 == 260) {
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    v19 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_error_impl(&dword_19D909000, v19, OS_LOG_TYPE_ERROR, "Unable to read MA path from reference path: %{public}@: %@", buf, 0x16u);
    }
LABEL_17:

LABEL_18:
    id v16 = 0;
    goto LABEL_19;
  }
  if (![v12 length])
  {
    v19 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_impl(&dword_19D909000, v19, OS_LOG_TYPE_DEFAULT, "Path for factor %{public}@ is empty. This usually means that the level is about to be deleted.", buf, 0xCu);
    }
    goto LABEL_17;
  }
  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v14 = [v13 fileExistsAtPath:v12];

  if ((v14 & 1) == 0)
  {
    v15 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v12;
      _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "Trial asset path does not exist on disk: %{public}@.", buf, 0xCu);
    }
  }
  id v16 = v12;
LABEL_19:

  return v16;
}

@end