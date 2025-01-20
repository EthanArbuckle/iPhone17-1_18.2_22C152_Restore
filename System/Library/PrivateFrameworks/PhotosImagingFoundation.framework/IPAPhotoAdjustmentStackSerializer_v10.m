@interface IPAPhotoAdjustmentStackSerializer_v10
- (id)archiveFromData:(id)a3 error:(id *)a4;
- (id)dataFromArchive:(id)a3 error:(id *)a4;
- (id)dataFromPhotoAdjustmentStack:(id)a3 error:(id *)a4;
- (id)photoAdjustmentFromArchive:(id)a3 error:(id *)a4;
- (id)photoAdjustmentStackFromData:(id)a3 error:(id *)a4;
@end

@implementation IPAPhotoAdjustmentStackSerializer_v10

- (id)archiveFromData:(id)a3 error:(id *)a4
{
  v5 = +[IPAAdjustmentStackSerializer decompressData:error:](IPAAdjustmentStackSerializer, "decompressData:error:", a3);
  if (v5)
  {
    v6 = +[IPAAdjustmentStackSerializer JSONFromData:v5 error:a4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)photoAdjustmentStackFromData:(id)a3 error:(id *)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v84 = 0;
  v6 = +[IPAAdjustmentStackSerializer decompressData:a3 error:&v84];
  id v7 = v84;
  if (v6)
  {
    id v83 = v7;
    v8 = +[IPAAdjustmentStackSerializer JSONFromData:v6 error:&v83];
    unint64_t v9 = (unint64_t)v83;

    if (!v8)
    {
      v29 = 0;
      v28 = 0;
      v37 = 0;
      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v38 = objc_opt_class();
      uint64_t v36 = IPAAdjustmentError(1007, @"Malformed archive of type: %@", v39, v40, v41, v42, v43, v44, v38);
      v29 = 0;
      v28 = 0;
      goto LABEL_16;
    }
    uint64_t v10 = [v8 objectForKeyedSubscript:@"formatVersion"];
    if (v10)
    {
      uint64_t v11 = v10;
      v18 = +[IPAAdjustmentVersion versionFromArchivalRepresentation:v10];
      if (v18)
      {
        v19 = +[IPAAdjustmentVersion versionForMajor:1 minor:0];
        char v20 = [v18 isEqualToAdjustmentVersion:v19];

        if (v20)
        {

          goto LABEL_8;
        }
        IPAAdjustmentError(1007, @"unsupported version %@", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      }
      else
      {
        IPAAdjustmentError(1007, @"unable to parse stack formatVersion: %@", v12, v13, v14, v15, v16, v17, v11);
      uint64_t v54 = };

      v29 = 0;
      v28 = 0;
      v37 = 0;
      unint64_t v9 = v54;
      goto LABEL_54;
    }
LABEL_8:
    v27 = [v8 objectForKeyedSubscript:@"versionInfo"];
    v28 = +[IPAAdjustmentVersionInfo versionInfoFromArchivalRepresentation:v27];

    v29 = [v8 objectForKeyedSubscript:@"adjustments"];
    if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (!v9)
      {
        objc_opt_class();
        uint64_t v36 = IPAAdjustmentError(1001, @"bad input: archived '%@' missing or wrong type: %@", v30, v31, v32, v33, v34, v35, @"adjustments");
LABEL_16:
        v37 = 0;
        uint64_t v11 = v9;
        unint64_t v9 = v36;
LABEL_54:

LABEL_55:
        id v7 = (id)v9;
        if (!a4) {
          goto LABEL_58;
        }
        goto LABEL_56;
      }
    }
    uint64_t v45 = [v29 count];
    v72 = v28;
    v73 = a4;
    if (!v45)
    {
      uint64_t v11 = 0;
LABEL_39:
      if (!(v11 | v9))
      {
        uint64_t v11 = [MEMORY[0x1E4F1C978] array];
      }
      if (v11)
      {
        v37 = objc_opt_new();
        [v37 setAdjustments:v11];
        [v37 setVersionInfo:v28];
        v55 = [v8 objectForKeyedSubscript:@"metadata"];
        uint64_t v71 = [v55 objectForKeyedSubscript:@"pipelineVersion"];
        uint64_t v56 = +[IPAPhotoAdjustmentPipeline pipelineFromString:](IPAPhotoAdjustmentPipeline, "pipelineFromString:");
        v77 = (void *)v56;
        if (v56)
        {
          [v37 setPipeline:v56];
        }
        else
        {
          v57 = +[IPAPhotoAdjustmentPipeline current];
          [v37 setPipeline:v57];
        }
        v58 = [v55 objectForKeyedSubscript:@"orientation"];
        if (v58
          || ([v55 objectForKeyedSubscript:@"masterOrientation"],
              (v58 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v59 = v55;
          uint64_t v60 = [v58 integerValue];
        }
        else
        {
          v59 = v55;
          uint64_t v60 = 0;
        }
        [v37 setOrientation:v60];
        v61 = v59;
        uint64_t v62 = [v59 objectForKeyedSubscript:@"masterWidth"];
        id obja = v61;
        uint64_t v63 = [v61 objectForKeyedSubscript:@"masterHeight"];
        v64 = (void *)v63;
        uint64_t v65 = 0;
        v66 = (void *)v62;
        uint64_t v67 = 0;
        if (v62)
        {
          v68 = (void *)v71;
          if (v63)
          {
            uint64_t v65 = [v66 integerValue];
            uint64_t v67 = [v64 integerValue];
          }
        }
        else
        {
          v68 = (void *)v71;
        }
        objc_msgSend(v37, "setInputSize:", v65, v67);

        v28 = v72;
        a4 = v73;
      }
      else
      {
        v37 = 0;
      }
      goto LABEL_54;
    }
    v76 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v45];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v46 = v29;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v79 objects:v85 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      id obj = v46;
      uint64_t v49 = *(void *)v80;
      while (2)
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v80 != v49) {
            objc_enumerationMutation(obj);
          }
          uint64_t v51 = *(void *)(*((void *)&v79 + 1) + 8 * i);
          id v78 = (id)v9;
          v52 = [(IPAPhotoAdjustmentStackSerializer_v10 *)self photoAdjustmentFromArchive:v51 error:&v78];
          id v53 = v78;

          if (v52) {
            [v76 addObject:v52];
          }

          if (v53)
          {

            uint64_t v11 = 0;
            v28 = v72;
            a4 = v73;
            goto LABEL_38;
          }
          unint64_t v9 = 0;
        }
        uint64_t v48 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
        unint64_t v9 = 0;
        if (v48) {
          continue;
        }
        break;
      }

      v28 = v72;
    }
    else
    {

      if (v9)
      {
        uint64_t v11 = 0;
        id v53 = (id)v9;
        goto LABEL_37;
      }
    }
    uint64_t v11 = v76;
    id v53 = 0;
LABEL_37:
    a4 = v73;
LABEL_38:

    unint64_t v9 = (unint64_t)v53;
    goto LABEL_39;
  }
  v29 = 0;
  v28 = 0;
  v8 = 0;
  v37 = 0;
  if (!a4) {
    goto LABEL_58;
  }
LABEL_56:
  if (v7) {
    *a4 = v7;
  }
LABEL_58:
  id v69 = v37;

  return v69;
}

- (id)photoAdjustmentFromArchive:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  v8 = [v4 objectForKeyedSubscript:@"version"];
  if (!v8)
  {
    v8 = [v4 objectForKeyedSubscript:@"formatVersion"];
  }
  unint64_t v9 = [v4 objectForKeyedSubscript:@"settings"];
  uint64_t v10 = [v4 objectForKeyedSubscript:@"enabled"];
  if ([(__CFString *)v7 isEqualToString:@"PosterFrame"])
  {
    uint64_t v11 = @"VideoPosterFrame";

    uint64_t v12 = [v9 objectForKeyedSubscript:@"frameTime"];
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v12 forKey:@"time"];

      unint64_t v9 = (void *)v13;
    }

    uint64_t v14 = (void *)MEMORY[0x1E4F1CC38];
    id v7 = @"VideoPosterFrame";
  }
  else if (v10)
  {
    uint64_t v14 = v10;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CC38];
  }
  uint64_t v15 = [v4 objectForKeyedSubscript:@"maskUUID"];
  uint64_t v16 = [v4 objectForKeyedSubscript:@"auto"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![(__CFString *)v7 length])
  {
    uint64_t v57 = objc_opt_class();
    IPAAdjustmentError(1001, @"bad input: identifier missing or wrong type: %@, expected NSString", v25, v26, v27, v28, v29, v30, v57);
LABEL_29:
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v58 = objc_opt_class();
    IPAAdjustmentError(1001, @"bad input: settings missing or wrong type: %@, expected NSDictionary", v33, v34, v35, v36, v37, v38, v58);
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v59 = objc_opt_class();
    IPAAdjustmentError(1001, @"bad input: enabled missing or wrong type: %@, expected NSNumber", v39, v40, v41, v42, v43, v44, v59);
    goto LABEL_29;
  }
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v15 length])
    {
      uint64_t v60 = objc_opt_class();
      IPAAdjustmentError(1001, @"bad input: maskUUID is present but wrong type %@, expecting NSString", v45, v46, v47, v48, v49, v50, v60);
      goto LABEL_29;
    }
  }
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v61 = objc_opt_class();
      IPAAdjustmentError(1001, @"bad input: auto settings present but wrong type %@, expecting NSDictionary", v51, v52, v53, v54, v55, v56, v61);
      goto LABEL_29;
    }
  }
  if (!v8)
  {
    id v17 = 0;
LABEL_41:
    uint64_t v31 = objc_opt_new();
    [v31 setIdentifier:v7];
    [v31 setVersion:v17];
    [v31 setSettings:v9];
    objc_msgSend(v31, "setEnabled:", objc_msgSend(v14, "BOOLValue"));
    [v31 setMaskUUID:v15];
    [v31 setAutoSettings:v16];

    id v17 = 0;
    goto LABEL_33;
  }
  id v17 = +[IPAAdjustmentVersion versionFromArchivalRepresentation:v8];
  if (v17) {
    goto LABEL_41;
  }
  uint64_t v18 = objc_opt_class();
  IPAAdjustmentError(1001, @"bad input: adjustment version wrong type: %@, expected NSNumber|NSString", v19, v20, v21, v22, v23, v24, v18);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17) {
    goto LABEL_41;
  }
LABEL_30:
  uint64_t v31 = 0;
  if (a4 && v17)
  {
    id v17 = v17;
    uint64_t v31 = 0;
    *a4 = v17;
  }
LABEL_33:

  return v31;
}

- (id)dataFromArchive:(id)a3 error:(id *)a4
{
  v5 = +[IPAAdjustmentStackSerializer dataFromJSON:error:](IPAAdjustmentStackSerializer, "dataFromJSON:error:", a3);
  if (v5)
  {
    v6 = +[IPAAdjustmentStackSerializer compressData:v5 error:a4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dataFromPhotoAdjustmentStack:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = [v6 pipeline];
  if (v13)
  {
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = [v13 string];
    uint64_t v51 = self;
    uint64_t v49 = (void *)v15;
    if (v15) {
      [v14 setObject:v15 forKeyedSubscript:@"pipelineVersion"];
    }
    else {
      _PFAssertContinueHandler();
    }
    uint64_t v52 = v13;
    uint64_t v53 = a4;
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v6, "orientation"));
    [v14 setObject:v18 forKeyedSubscript:@"orientation"];

    uint64_t v19 = [v6 inputSize];
    uint64_t v21 = v20;
    uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v19];
    [v14 setObject:v22 forKeyedSubscript:@"masterWidth"];

    uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v21];
    [v14 setObject:v23 forKeyedSubscript:@"masterHeight"];

    uint64_t v24 = objc_opt_new();
    uint64_t v50 = v14;
    [v24 setObject:v14 forKeyedSubscript:@"metadata"];
    uint64_t v25 = [v6 versionInfo];
    uint64_t v26 = v25;
    if (v25)
    {
      uint64_t v27 = [v25 archivalRepresentation];
      [v24 setObject:v27 forKeyedSubscript:@"versionInfo"];
    }
    uint64_t v47 = v26;
    uint64_t v48 = v24;
    id v54 = v6;
    uint64_t v55 = objc_opt_new();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = [v6 adjustments];
    uint64_t v28 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v59;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v59 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void **)(*((void *)&v58 + 1) + 8 * v31);
          uint64_t v33 = objc_msgSend(v32, "identifier", v46, v47);
          if (!v33)
          {
            uint64_t v46 = v32;
LABEL_25:
            _PFAssertContinueHandler();
            goto LABEL_28;
          }
          uint64_t v34 = [v32 version];
          if (!v34)
          {
            uint64_t v35 = [v32 identifier];
            uint64_t v34 = IPAAdjustmentCurrentVersionForIdentifier(v35);

            if (!v34)
            {
              uint64_t v46 = v54;
              goto LABEL_25;
            }
          }
          uint64_t v36 = [v34 archivalRepresentation];
          if (v36)
          {
            uint64_t v37 = objc_opt_new();
            [v37 setObject:v33 forKeyedSubscript:@"identifier"];
            uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v32, "enabled"));
            [v37 setObject:v38 forKeyedSubscript:@"enabled"];

            [v37 setObject:v36 forKeyedSubscript:@"formatVersion"];
            uint64_t v39 = [v32 maskUUID];
            if (v39) {
              [v37 setObject:v39 forKeyedSubscript:@"maskUUID"];
            }
            uint64_t v40 = [v32 settings];
            if (v40) {
              [v37 setObject:v40 forKeyedSubscript:@"settings"];
            }
            uint64_t v41 = [v32 autoSettings];
            if (v41) {
              [v37 setObject:v41 forKeyedSubscript:@"auto"];
            }
            [v55 addObject:v37];
          }
          else
          {
            uint64_t v46 = v34;
            _PFAssertContinueHandler();
          }

LABEL_28:
          ++v31;
        }
        while (v29 != v31);
        uint64_t v42 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
        uint64_t v29 = v42;
      }
      while (v42);
    }

    id v17 = v48;
    [v48 setObject:v55 forKeyedSubscript:@"adjustments"];
    [v48 setObject:&unk_1F38A17A0 forKeyedSubscript:@"formatVersion"];

    uint64_t v16 = 0;
    a4 = v53;
    id v6 = v54;
    self = v51;
    uint64_t v13 = v52;
  }
  else
  {
    uint64_t v16 = IPAAdjustmentError(1000, @"expected adjustment stack to have a pipeline: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
    id v17 = 0;
  }
  id v57 = v16;
  uint64_t v43 = -[IPAPhotoAdjustmentStackSerializer_v10 dataFromArchive:error:](self, "dataFromArchive:error:", v17, &v57, v46);
  id v44 = v57;

  if (a4 && v44) {
    *a4 = v44;
  }

  return v43;
}

@end