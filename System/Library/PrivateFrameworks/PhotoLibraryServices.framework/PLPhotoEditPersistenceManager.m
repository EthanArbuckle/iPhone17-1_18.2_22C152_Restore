@interface PLPhotoEditPersistenceManager
+ (BOOL)validateAdjustmentData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 error:(id *)a6;
+ (unsigned)renderTypeForAdjustmentData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5;
- (id)dataFromCompositionController:(id)a3 outFormatIdentifier:(id *)a4 outFormatVersion:(id *)a5 exportProperties:(id)a6;
- (id)debugDescriptionForAdjustmentData:(id)a3;
- (id)debugDescriptionForPhotoEditData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5;
- (id)loadCompositionFrom:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 sidecarData:(id)a6 error:(id *)a7;
- (id)loadPhotoEditData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 importProperties:(id)a6 error:(id *)a7;
- (void)loadMasterDimensionsFromPhotoEditData:(id)a3 outMasterWidth:(int64_t *)a4 outMasterHeight:(int64_t *)a5;
@end

@implementation PLPhotoEditPersistenceManager

- (id)dataFromCompositionController:(id)a3 outFormatIdentifier:(id *)a4 outFormatVersion:(id *)a5 exportProperties:(id)a6
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v8 = a6;
  v28 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 infoDictionary];
  uint64_t v11 = [v10 objectForKey:@"CFBundleVersion"];
  v12 = (void *)v11;
  v13 = &stru_1EEB2EB80;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  v14 = v13;

  v35[0] = @"platform";
  v35[1] = @"buildNumber";
  v36[0] = @"iOS";
  v36[1] = v28;
  v35[2] = @"appVersion";
  v35[3] = @"schemaRevision";
  v36[2] = v14;
  v36[3] = &unk_1EEBEF678;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
  v16 = +[PLCompositionHelper validatedCompositionCopyFor:v27];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v17 = (void *)getPICompositionSerializerMetadataClass_softClass;
  uint64_t v34 = getPICompositionSerializerMetadataClass_softClass;
  if (!getPICompositionSerializerMetadataClass_softClass)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __getPICompositionSerializerMetadataClass_block_invoke;
    v30[3] = &unk_1E5875840;
    v30[4] = &v31;
    __getPICompositionSerializerMetadataClass_block_invoke((uint64_t)v30);
    v17 = (void *)v32[3];
  }
  v18 = v17;
  _Block_object_dispose(&v31, 8);
  id v19 = objc_alloc_init(v18);
  objc_msgSend(v19, "setWidth:", objc_msgSend(v8, "imageWidth"));
  objc_msgSend(v19, "setHeight:", objc_msgSend(v8, "imageHeight"));
  objc_msgSend(v19, "setOrientation:", objc_msgSend(v8, "baseEXIFOrientation"));
  id v29 = 0;
  v20 = [getPICompositionSerializerClass() serializeComposition:v16 versionInfo:v15 serializerMetadata:v19 error:&v29];
  id v21 = v29;
  v22 = [v20 data];
  if (a4)
  {
    v23 = [v20 formatIdentifier];
    *a4 = (id)[v23 copy];
  }
  if (a5)
  {
    v24 = [v20 formatVersion];
    *a5 = (id)[v24 copy];
  }
  return v22;
}

- (id)debugDescriptionForPhotoEditData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([getPICompositionSerializerClass() canInterpretDataWithFormatIdentifier:v8 formatVersion:v9])
  {
    id v22 = 0;
    uint64_t v10 = [getPICompositionSerializerClass() deserializeCompositionFromData:v7 formatIdentifier:v8 formatVersion:v9 error:&v22];
    uint64_t v11 = (void *)v10;
    id v12 = v22;
    if (v10)
    {
      v25 = @"composition";
      v26[0] = v10;
      v13 = (void *)MEMORY[0x1E4F1C9E8];
      id v14 = v22;
      v15 = [v13 dictionaryWithObjects:v26 forKeys:&v25 count:1];
    }
    else
    {
      id v16 = v22;
      id v21 = 0;
      v17 = [getPICompositionSerializerClass() deserializeDictionaryFromData:v7 error:&v21];
      v23[0] = @"error_specific";
      id v18 = v21;
      id v19 = [v16 debugDescription];
      v24[0] = v19;
      v24[1] = @"Failed to deserialize composition\n";
      v23[1] = @"error";
      v23[2] = @"envelopeDictionary";
      v24[2] = v17;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)debugDescriptionForAdjustmentData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v9 = 0;
    v4 = [MEMORY[0x1E4F8DCD8] decompressData:v3 error:&v9];
    id v5 = v9;
    if (v4)
    {
      id v8 = 0;
      v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v8];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)loadMasterDimensionsFromPhotoEditData:(id)a3 outMasterWidth:(int64_t *)a4 outMasterHeight:(int64_t *)a5
{
  *a4 = 0;
  *a5 = 0;
  id v7 = a3;
  uint64_t v14 = 0;
  id v8 = [getPICompositionSerializerClass() deserializeDictionaryFromData:v7 error:&v14];

  if (v8)
  {
    id v9 = [v8 objectForKeyedSubscript:@"metadata"];
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:@"masterWidth"];
      uint64_t v12 = [v10 objectForKeyedSubscript:@"masterHeight"];
      v13 = (void *)v12;
      if (v11 && v12)
      {
        *a4 = [v11 integerValue];
        *a5 = [v13 integerValue];
      }
    }
  }
}

- (id)loadPhotoEditData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 importProperties:(id)a6 error:(id *)a7
{
  id v12 = a6;
  v13 = [(PLPhotoEditPersistenceManager *)self loadCompositionFrom:a3 formatIdentifier:a4 formatVersion:a5 sidecarData:0 error:a7];
  if (v13)
  {
    uint64_t v14 = (void *)[getPIPhotoEditHelperClass_71715() newCompositionControllerWithComposition:v13];
    objc_msgSend(v14, "setImageOrientation:", objc_msgSend(v12, "baseEXIFOrientation"));
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)loadCompositionFrom:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 sidecarData:(id)a6 error:(id *)a7
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v13 = a4;
  id v14 = a5;
  id v60 = a6;
  v61 = a7;
  if (!a7)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, self, @"PLPhotoEditPersistenceManager.m", 74, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  v63 = v14;
  v64 = v13;
  if (([getPIPhotoEditHelperClass_71715() canInterpretDataWithFormatIdentifier:v13 formatVersion:v14] & 1) == 0)
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v83 = *MEMORY[0x1E4F28588];
    v20 = [NSString stringWithFormat:@"Cannot interpret adjustment data: %@ %@", v13, v14];
    v84[0] = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
    *a7 = [v19 errorWithDomain:@"PLPhotoEditPersistenceManagerDomain" code:0 userInfo:v21];

    id v22 = 0;
    goto LABEL_36;
  }
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  v15 = (id *)getPIPhotoEditFormatIdentifierVideoSloMoSymbolLoc_ptr;
  uint64_t v76 = getPIPhotoEditFormatIdentifierVideoSloMoSymbolLoc_ptr;
  if (!getPIPhotoEditFormatIdentifierVideoSloMoSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPIPhotoEditFormatIdentifierVideoSloMoSymbolLoc_block_invoke;
    v78 = &unk_1E5875840;
    v79[0] = &v73;
    id v16 = PhotoImagingLibrary_71654();
    v17 = dlsym(v16, "PIPhotoEditFormatIdentifierVideoSloMo");
    *(void *)(*(void *)(v79[0] + 8) + 24) = v17;
    getPIPhotoEditFormatIdentifierVideoSloMoSymbolLoc_ptr = *(void *)(*(void *)(v79[0] + 8) + 24);
    v15 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v15)
  {
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    v56 = [NSString stringWithUTF8String:"NSString *getPIPhotoEditFormatIdentifierVideoSloMo(void)"];
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, @"PLPhotoEditPersistenceManager.m", 43, @"%s", dlerror());

    goto LABEL_41;
  }
  id v18 = *v15;
  if ([v13 isEqualToString:v18])
  {

LABEL_14:
    id v27 = objc_opt_new();
    v59 = [MEMORY[0x1E4F8DCE0] deserialize:v62 originator:*MEMORY[0x1E4F8DC60] format:v13 formatVersion:v14 error:v61];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v28 = [v59 adjustmentStack];
    id obj = [v28 adjustments];

    uint64_t v29 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
    if (!v29) {
      goto LABEL_34;
    }
    uint64_t v30 = *(void *)v70;
    uint64_t v31 = *MEMORY[0x1E4F8DCB0];
    uint64_t v32 = *MEMORY[0x1E4F8DCD0];
    uint64_t v66 = *MEMORY[0x1E4F8DCA8];
    uint64_t v67 = *MEMORY[0x1E4F8DCA0];
    uint64_t v65 = *MEMORY[0x1E4F8DCC8];
    while (1)
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v70 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void **)(*((void *)&v69 + 1) + 8 * v33);
        v35 = [v34 identifier];
        int v36 = [v35 isEqualToString:v31];

        if (v36)
        {
          v37 = objc_opt_new();
          [v37 setObject:@"SlowMotion" forKeyedSubscript:@"identifier"];
          v38 = [v34 settings];
          [v37 setObject:v38 forKeyedSubscript:@"settings"];

          [v37 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"enabled"];
          [v27 addObject:v37];
        }
        else
        {
          v39 = [v34 identifier];
          int v40 = [v39 isEqualToString:v32];

          if (v40)
          {
            v37 = objc_opt_new();
            v41 = [v34 identifier];
            [v37 setObject:v41 forKeyedSubscript:@"identifier"];

            v42 = [v34 settings];
            [v37 setObject:v42 forKeyedSubscript:@"settings"];

            [v37 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"enabled"];
            [v27 addObject:v37];
          }
          else
          {
            v43 = [v34 identifier];
            int v44 = [v43 isEqualToString:v67];

            if (!v44) {
              goto LABEL_29;
            }
            v45 = [v34 settings];
            v37 = [v45 objectForKeyedSubscript:v66];
            if (v37)
            {
            }
            else
            {
              v46 = [v34 settings];
              v37 = [v46 objectForKeyedSubscript:v65];

              if (!v37)
              {
                v37 = PLBackendGetLog();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  v49 = [v34 identifier];
                  v50 = [v34 version];
                  v51 = [v34 settings];
                  *(_DWORD *)buf = 138413058;
                  *(void *)&buf[4] = v64;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v49;
                  *(_WORD *)&buf[22] = 2112;
                  v78 = v50;
                  LOWORD(v79[0]) = 2112;
                  *(void *)((char *)v79 + 2) = v51;
                  _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "PosterFrame adjustment has unexpected format, will not migrate: %@, %@, %@, %@", buf, 0x2Au);
                }
                goto LABEL_28;
              }
            }
            v47 = objc_opt_new();
            [v47 setObject:@"VideoPosterFrame" forKeyedSubscript:@"identifier"];
            v80 = @"time";
            v81 = v37;
            v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
            [v47 setObject:v48 forKeyedSubscript:@"settings"];

            [v47 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"enabled"];
            [v27 addObject:v47];
          }
        }
LABEL_28:

LABEL_29:
        ++v33;
      }
      while (v29 != v33);
      uint64_t v52 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
      uint64_t v29 = v52;
      if (!v52)
      {
LABEL_34:

        id v22 = [getPICompositionSerializerClass() deserializeCompositionFromAdjustments:v27 metadata:MEMORY[0x1E4F1CC08] formatIdentifier:v64 formatVersion:v63 error:v61];

        goto LABEL_36;
      }
    }
  }
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  v23 = (void *)getPIPhotoEditFormatIdentifierVideoSymbolLoc_ptr;
  uint64_t v76 = getPIPhotoEditFormatIdentifierVideoSymbolLoc_ptr;
  if (!getPIPhotoEditFormatIdentifierVideoSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPIPhotoEditFormatIdentifierVideoSymbolLoc_block_invoke;
    v78 = &unk_1E5875840;
    v79[0] = &v73;
    v24 = PhotoImagingLibrary_71654();
    v25 = dlsym(v24, "PIPhotoEditFormatIdentifierVideo");
    *(void *)(*(void *)(v79[0] + 8) + 24) = v25;
    getPIPhotoEditFormatIdentifierVideoSymbolLoc_ptr = *(void *)(*(void *)(v79[0] + 8) + 24);
    v23 = (void *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v23)
  {
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    v58 = [NSString stringWithUTF8String:"NSString *getPIPhotoEditFormatIdentifierVideo(void)"];
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, @"PLPhotoEditPersistenceManager.m", 45, @"%s", dlerror());

LABEL_41:
    __break(1u);
  }
  int v26 = [v13 isEqualToString:*v23];

  if (v26) {
    goto LABEL_14;
  }
  id v22 = [getPICompositionSerializerClass() deserializeCompositionFromData:v62 formatIdentifier:v13 formatVersion:v14 sidecarData:v60 error:a7];
LABEL_36:

  return v22;
}

+ (unsigned)renderTypeForAdjustmentData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(PLPhotoEditPersistenceManager);
  id v74 = 0;
  uint64_t v11 = [(PLPhotoEditPersistenceManager *)v10 loadCompositionFrom:v7 formatIdentifier:v8 formatVersion:v9 sidecarData:0 error:&v74];
  id v12 = v74;
  if (v11)
  {
    id v67 = v9;
    id v13 = [v11 objectForKeyedSubscript:@"autoLoop"];
    id v14 = v13;
    v64 = v13;
    if (v13)
    {
      v15 = [v13 objectForKeyedSubscript:@"enabled"];
      int v16 = [v15 BOOLValue];

      v17 = [v14 objectForKeyedSubscript:@"flavor"];
      id v18 = v17;
      if (v16)
      {
        int v19 = [v17 isEqualToString:@"AutoLoop"];
        if ([v18 isEqualToString:@"LongExposure"]) {
          v19 |= 4u;
        }
        if ([v18 isEqualToString:@"Mirror"]) {
          LODWORD(v14) = v19 | 8;
        }
        else {
          LODWORD(v14) = v19;
        }
      }
      else
      {
        LODWORD(v14) = 0;
      }
    }
    v20 = [v11 objectForKeyedSubscript:@"depthEffect"];
    v63 = v20;
    if (v20)
    {
      id v21 = [v20 objectForKeyedSubscript:@"enabled"];
      int v22 = [v21 BOOLValue];

      if (v22) {
        LODWORD(v14) = v14 | 2;
      }
    }
    v23 = [v11 objectForKeyedSubscript:@"portraitVideo"];
    id v62 = v23;
    if (v23)
    {
      v24 = [v23 objectForKeyedSubscript:@"enabled"];
      int v25 = [v24 BOOLValue];

      if (v25) {
        LODWORD(v14) = v14 | 2;
      }
    }
    int v26 = [v11 objectForKeyedSubscript:@"smartTone"];
    long long v69 = [v11 objectForKeyedSubscript:@"smartColor"];
    uint64_t v27 = [v11 objectForKeyedSubscript:@"whiteBalance"];
    id v68 = v8;
    id v65 = v12;
    uint64_t v66 = v10;
    v59 = (void *)v27;
    if (v26 || v69 || v27)
    {
      v28 = (void *)v27;
      uint64_t v29 = [v26 objectForKeyedSubscript:@"enabled"];
      int v60 = [v29 BOOLValue];

      uint64_t v30 = [v69 objectForKeyedSubscript:@"enabled"];
      int v57 = [v30 BOOLValue];

      uint64_t v31 = [v28 objectForKeyedSubscript:@"enabled"];
      unsigned __int8 v56 = [v31 BOOLValue];

      uint64_t v32 = [v26 objectForKeyedSubscript:@"auto"];
      int v33 = [v32 BOOLValue];

      uint64_t v34 = [v69 objectForKeyedSubscript:@"auto"];
      int v35 = [v34 BOOLValue];

      int v36 = [v28 objectForKeyedSubscript:@"auto"];
      unsigned __int8 v37 = [v36 BOOLValue];

      if ((v60 ^ 1 | v33) == 1 && v57 ^ 1 | v35)
      {
        if ((v56 ^ 1 | v37)) {
          LODWORD(v14) = v14 | 0x100;
        }
        char v38 = (v56 ^ 1 | v37) ^ 1;
      }
      else
      {
        char v38 = 1;
      }
      char v55 = v38;
    }
    else
    {
      char v55 = 0;
    }
    v39 = [v11 objectForKeyedSubscript:@"cropStraighten"];
    v58 = v39;
    if (v39)
    {
      int v40 = [v39 objectForKeyedSubscript:@"enabled"];
      int v41 = [v40 BOOLValue];

      if (v41) {
        LODWORD(v14) = v14 | 0x200;
      }
    }
    v61 = v26;
    uint64_t v42 = [v11 objectForKeyedSubscript:@"effect"];
    uint64_t v43 = [v11 objectForKeyedSubscript:@"effect3D"];
    if (v42 | v43)
    {
      int v44 = [(id)v42 objectForKeyedSubscript:@"enabled"];
      int v45 = [v44 BOOLValue];

      v46 = [(id)v43 objectForKeyedSubscript:@"enabled"];
      LODWORD(v44) = [v46 BOOLValue];

      if (v45 | v44) {
        LODWORD(v14) = v14 | 0x400;
      }
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v47 = [v11 contents];
    v48 = [v47 allKeys];

    uint64_t v49 = [v48 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v71;
      while (2)
      {
        id v52 = v7;
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v71 != v51) {
            objc_enumerationMutation(v48);
          }
          if (![&unk_1EEBF2078 containsObject:*(void *)(*((void *)&v70 + 1) + 8 * i)])
          {

            id v7 = v52;
            goto LABEL_46;
          }
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v70 objects:v75 count:16];
        id v7 = v52;
        if (v50) {
          continue;
        }
        break;
      }
    }

    if ((v55 & 1) == 0) {
      LODWORD(v14) = v14 | 0x800;
    }
LABEL_46:

    id v9 = v67;
    id v8 = v68;
    id v12 = v65;
    uint64_t v10 = v66;
  }
  else
  {
    LODWORD(v14) = 0;
  }

  return v14;
}

+ (BOOL)validateAdjustmentData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(PLPhotoEditPersistenceManager);
  id v13 = [(PLPhotoEditPersistenceManager *)v12 loadCompositionFrom:v9 formatIdentifier:v10 formatVersion:v11 sidecarData:0 error:a6];
  if (v13)
  {
    uint64_t v21 = 0;
    int v22 = &v21;
    uint64_t v23 = 0x2050000000;
    id v14 = (void *)getNUSourceClass_softClass;
    uint64_t v24 = getNUSourceClass_softClass;
    if (!getNUSourceClass_softClass)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __getNUSourceClass_block_invoke;
      v20[3] = &unk_1E5875840;
      v20[4] = &v21;
      __getNUSourceClass_block_invoke((uint64_t)v20);
      id v14 = (void *)v22[3];
    }
    v15 = v14;
    _Block_object_dispose(&v21, 8);
    id v16 = objc_alloc_init(v15);
    [v16 setAssetIdentifier:@"validate"];
    [v13 setObject:v16 forKeyedSubscript:@"source"];
    v17 = [v13 schema];
    char v18 = [v17 validateComposition:v13 error:a6];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

@end