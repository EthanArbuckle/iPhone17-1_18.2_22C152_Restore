@interface PLPhotoDerivativeUtilities
+ (id)generateDerivativeForMSAsset:(id)a3 derivativeType:(int)a4 withSpecificationInfo:(id)a5 collectionGUID:(id)a6;
@end

@implementation PLPhotoDerivativeUtilities

+ (id)generateDerivativeForMSAsset:(id)a3 derivativeType:(int)a4 withSpecificationInfo:(id)a5 collectionGUID:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v73 = a6;
  if (!*MEMORY[0x1E4F59AC0])
  {
    v11 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v8;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v10;
      __int16 v88 = 2112;
      id v89 = v73;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "generateDerivativeForMSAsset %@ type %i specificationInfo %@ collectionGUID %@", buf, 0x26u);
    }
  }
  v74 = [v9 path];
  v76 = [v9 metadata];
  uint64_t v69 = *MEMORY[0x1E4F5C720];
  v12 = objc_msgSend(v76, "objectForKey:");
  [v12 doubleValue];
  double v14 = v13;

  uint64_t v68 = *MEMORY[0x1E4F5C718];
  v15 = objc_msgSend(v76, "objectForKey:");
  [v15 doubleValue];
  double v17 = v16;

  v75 = [v9 type];
  v18 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v75];
  v19 = (void *)*MEMORY[0x1E4F44410];
  [v18 isEqual:*MEMORY[0x1E4F44410]];
  int v20 = [v18 isEqual:*MEMORY[0x1E4F443D0]];
  v72 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v8) {
    int v21 = 0;
  }
  else {
    int v21 = v20;
  }
  int v70 = v21;
  if (v14 == 0.0 || v17 == 0.0)
  {
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_35;
    }
    v23 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v74;
      v24 = "no width or height to generate derived asset for %@";
      v25 = v23;
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
      uint32_t v27 = 12;
LABEL_24:
      _os_log_impl(&dword_19B3C7000, v25, v26, v24, buf, v27);
    }
  }
  else
  {
    v22 = PLMyPhotoStreamGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v74;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "derivedAssetForMasterAsset for master image at path %@", buf, 0xCu);
    }

    if (v8 == 1)
    {
      if (v73)
      {
        v71 = +[PLPhotoSharingHelper temporaryThumbnailPathForCollectionGUID:](PLPhotoSharingHelper, "temporaryThumbnailPathForCollectionGUID:");
        goto LABEL_29;
      }
      v29 = [v9 GUID];
      v71 = +[PLPhotoSharingHelper temporaryThumbnailPathForCollectionGUID:v29];
LABEL_28:

LABEL_29:
      if (v71)
      {
        [v72 removeItemAtPath:v71 error:0];
        +[PLPhotoSharingHelper derivedAssetSizeForMasterSizeWidth:v8 height:v10 derivativeType:v14 withSpecificationInfo:v17];
        double v31 = v30;
        double v33 = v32;
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        buf[24] = 0;
        if (v70)
        {
          v34 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v74 isDirectory:0];
          v35 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v71 isDirectory:0];
          char v36 = [v72 copyItemAtURL:v34 toURL:v35 error:0];
          *(unsigned char *)(*(void *)&buf[8] + 24) = v36;

          if (*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            if (*MEMORY[0x1E4F59AC0]) {
              goto LABEL_42;
            }
            v37 = __CPLAssetsdOSLogDomain();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
LABEL_40:

              if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
                goto LABEL_42;
              }
              goto LABEL_41;
            }
            *(_WORD *)v83 = 0;
            v38 = "will use copy of original JPEG that's already within size";
            v39 = v37;
            os_log_type_t v40 = OS_LOG_TYPE_DEBUG;
LABEL_39:
            _os_log_impl(&dword_19B3C7000, v39, v40, v38, v83, 2u);
            goto LABEL_40;
          }
          if (!*MEMORY[0x1E4F59AC0])
          {
            v37 = __CPLAssetsdOSLogDomain();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_40;
            }
            *(_WORD *)v83 = 0;
            v38 = "failed to make copy of original JPEG that's already within size";
            v39 = v37;
            os_log_type_t v40 = OS_LOG_TYPE_ERROR;
            goto LABEL_39;
          }
        }
LABEL_41:
        dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
        v42 = (void *)MEMORY[0x1E4F59AD8];
        v43 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v74 isDirectory:0];
        v44 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v71 isDirectory:0];
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __111__PLPhotoDerivativeUtilities_generateDerivativeForMSAsset_derivativeType_withSpecificationInfo_collectionGUID___block_invoke;
        v78[3] = &unk_1E586F2E0;
        id v79 = v74;
        id v80 = v71;
        v82 = buf;
        v45 = v41;
        v81 = v45;
        [v42 resizeImageAtURL:v43 destinationURL:v44 maximumPixelCount:(uint64_t)(v31 * v33) bakeInOrientation:1 colorOutput:1 reason:@"Photo Stream full size image fallback generation" completionHandler:v78];

        dispatch_semaphore_wait(v45, 0xFFFFFFFFFFFFFFFFLL);
        if (!*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          id v48 = 0;
LABEL_79:
          v23 = v48;
          _Block_object_dispose(buf, 8);

          v28 = v23;
          goto LABEL_80;
        }
LABEL_42:
        id v77 = 0;
        v46 = [v72 attributesOfItemAtPath:v71 error:&v77];
        id v67 = v77;
        if (!v46)
        {
          if (*MEMORY[0x1E4F59AC0])
          {
            id v48 = 0;
LABEL_78:

            goto LABEL_79;
          }
          v58 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v83 = 138412546;
            v84 = v71;
            __int16 v85 = 2112;
            id v86 = v67;
            v47 = v58;
            _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "Couldn't read attributes for file %@ : %@", v83, 0x16u);
          }
          else
          {
            v47 = v58;
          }
          id v48 = 0;
LABEL_74:

          if (!*MEMORY[0x1E4F59AC0])
          {
            v65 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v83 = 138412546;
              v84 = v71;
              __int16 v85 = 2112;
              id v86 = v48;
              _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_DEBUG, "generated derived asset at path %@ : %@", v83, 0x16u);
            }
          }
          goto LABEL_78;
        }
        v47 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v46, "fileSize"));
        id v48 = objc_alloc_init(MEMORY[0x1E4F5C380]);
        v49 = [v9 fileHash];
        [v48 setMasterAssetHash:v49];

        [v48 setPath:v71];
        v50 = v75;
        if ((v70 & 1) == 0)
        {
          v50 = [v19 identifier];
        }
        [v48 setType:v50];
        if ((v70 & 1) == 0) {

        }
        id v51 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v51 setObject:v47 forKey:*MEMORY[0x1E4F5C710]];
        v52 = [NSNumber numberWithDouble:v31];
        [v51 setObject:v52 forKey:v69];

        v53 = [NSNumber numberWithDouble:v33];
        [v51 setObject:v53 forKey:v68];

        [v48 setMetadata:v51];
        if (!v10)
        {
          if (v8)
          {
            [v48 setMediaAssetType:2];
            v59 = (void *)MEMORY[0x1E4F5C708];
          }
          else
          {
            [v48 setMediaAssetType:3];
            v59 = (void *)MEMORY[0x1E4F5C700];
          }
          [v51 setObject:*v59 forKey:*MEMORY[0x1E4F5C6F8]];
          goto LABEL_73;
        }
        uint64_t v54 = *MEMORY[0x1E4F5C6F8];
        v55 = [v10 objectForKey:*MEMORY[0x1E4F5C6F8]];
        v56 = v55;
        if (!v55)
        {
LABEL_63:
          v60 = v48;
          uint64_t v61 = *MEMORY[0x1E4F5C6F0];
          v62 = [v10 objectForKey:*MEMORY[0x1E4F5C6F0]];
          v63 = v62;
          if (!v62)
          {
LABEL_70:

            id v48 = v60;
LABEL_73:

            goto LABEL_74;
          }
          if ([v62 intValue])
          {
            uint64_t v64 = 2;
          }
          else
          {
            if (([v63 intValue] & 2) == 0)
            {
LABEL_69:
              [v51 setObject:v63 forKey:v61];
              goto LABEL_70;
            }
            uint64_t v64 = 3;
          }
          [v60 setMediaAssetType:v64];
          goto LABEL_69;
        }
        if ([v55 isEqualToString:*MEMORY[0x1E4F5C708]])
        {
          uint64_t v57 = 2;
        }
        else
        {
          if (![v56 isEqualToString:*MEMORY[0x1E4F5C700]])
          {
LABEL_62:
            [v51 setObject:v56 forKey:v54];
            goto LABEL_63;
          }
          uint64_t v57 = 3;
        }
        [v48 setMediaAssetType:v57];
        goto LABEL_62;
      }
LABEL_35:
      v28 = 0;
      goto LABEL_81;
    }
    if (!v8)
    {
      if (v73)
      {
        v71 = +[PLPhotoSharingHelper temporaryDerivativePathForCollectionGUID:v73 uti:v75];
        goto LABEL_29;
      }
      v29 = [v9 GUID];
      v71 = +[PLPhotoSharingHelper temporaryDerivativePathForCollectionGUID:v29 uti:v75];
      goto LABEL_28;
    }
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_35;
    }
    v23 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v8;
      v24 = "ERROR, unknown PLDerivativeType %i";
      v25 = v23;
      os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
      uint32_t v27 = 8;
      goto LABEL_24;
    }
  }
  v28 = 0;
LABEL_80:

LABEL_81:
  return v28;
}

void __111__PLPhotoDerivativeUtilities_generateDerivativeForMSAsset_derivativeType_withSpecificationInfo_collectionGUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      v7 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
        int v10 = 138412802;
        uint64_t v11 = v8;
        __int16 v12 = 2112;
        uint64_t v13 = v9;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "failed to resize %@ to %@: %@", (uint8_t *)&v10, 0x20u);
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end