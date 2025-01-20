@interface TXRAssetCatalogParser
+ (BOOL)exportSetConfig:(id)a3 face:(unsigned int)a4 directoryPath:(id)a5 error:(id *)a6;
+ (id)exportSet:(id)a3 location:(id)a4 error:(id *)a5;
@end

@implementation TXRAssetCatalogParser

+ (BOOL)exportSetConfig:(id)a3 face:(unsigned int)a4 directoryPath:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  v53[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v49 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v52[0] = @"info";
  v52[1] = @"properties";
  v53[0] = &unk_1F37CDDB8;
  v53[1] = v11;
  v52[2] = @"levels";
  v53[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
  if ([v9 mipmapOption] != 2)
  {
    if ([v9 mipmapOption] == 3) {
      +[TXRAssetCatalogParser exportSetConfig:face:directoryPath:error:](v11);
    }
    if ([v9 mipmapOption] == 1) {
      +[TXRAssetCatalogParser exportSetConfig:face:directoryPath:error:](v11);
    }
    if (![v9 mipmapOption]) {
      [v11 setObject:@"none" forKeyedSubscript:@"level-mode"];
    }
  }
  if (![v9 mipmapOption] || objc_msgSend(v9, "mipmapOption") == 2)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"level-0"];
    v14 = [v9 texture];
    int v15 = [v14 cubemap];

    if (v15)
    {
      v16 = objc_msgSend([NSString alloc], "initWithFormat:", @" face-%d", v8);
      [v13 appendString:v16];
    }
    v17 = [v9 baseFileAttributes];
    uint64_t v18 = [v17 fileFormat];

    v47 = v10;
    v48 = a6;
    v45 = v12;
    id v46 = v11;
    if (v18)
    {
      if (v18 != 1)
      {
        uint64_t v43 = 0;
        goto LABEL_16;
      }
      v19 = (uint64_t *)MEMORY[0x1E4F22610];
      v20 = @".jpg";
    }
    else
    {
      v19 = (uint64_t *)MEMORY[0x1E4F22678];
      v20 = @".png";
    }
    [v13 appendString:v20];
    uint64_t v43 = *v19;
LABEL_16:
    v50[0] = @"filename";
    v50[1] = @"mipmap-level";
    v51[0] = v13;
    v51[1] = @"base";
    v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
    v21 = [v9 texture];
    v22 = [v21 mipmapLevels];
    v23 = [v22 objectAtIndexedSubscript:0];
    v24 = [v23 elements];
    v25 = [v24 objectAtIndexedSubscript:0];
    v26 = [v25 faces];
    v27 = [v26 objectAtIndexedSubscript:v8];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = v27;
    }
    else
    {
      v29 = [TXRImageIndependent alloc];
      v30 = [v9 texture];
      [v30 dimensions];
      double v42 = v31;
      v32 = [v9 texture];
      uint64_t v33 = [v32 pixelFormat];
      v34 = [v9 texture];
      v28 = -[TXRImageIndependent initWithImage:dimensions:pixelFormat:alphaInfo:](v29, "initWithImage:dimensions:pixelFormat:alphaInfo:", v27, v33, [v34 alphaInfo], v42);
    }
    v35 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v49, v13];
    v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v35 isDirectory:0];
    v37 = [v9 baseFileAttributes];
    uint64_t v38 = [v37 colorSpace];
    v39 = [v9 baseFileAttributes];
    a6 = v48;
    +[TXRParserImageIO exportImage:url:uttype:colorSpace:orientation:error:](TXRParserImageIO, "exportImage:url:uttype:colorSpace:orientation:error:", v28, v36, v43, v38, [v39 exifOrientation], v48);

    id v10 = v47;
    [v47 addObject:v44];

    v12 = v45;
    id v11 = v46;
  }
  BOOL v40 = writeContentsJsonAtPath(v12, v49, (uint64_t)a6);

  return v40;
}

+ (id)exportSet:(id)a3 location:(id)a4 error:(id *)a5
{
  v104[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 configs];
  id v10 = [v9 objectAtIndexedSubscript:0];
  id v11 = [v10 texture];
  int v12 = [v11 cubemap];

  id v13 = objc_alloc(MEMORY[0x1E4F28E78]);
  v85 = v8;
  v14 = [v8 absoluteString];
  uint64_t v15 = [v7 name];
  v16 = (void *)v15;
  int v87 = v12;
  if (v12) {
    v17 = @"%@/%@.cubetextureset";
  }
  else {
    v17 = @"%@/%@.textureset";
  }
  uint64_t v18 = objc_msgSend(v13, "initWithFormat:", v17, v14, v15);

  uint64_t v19 = [[NSString alloc] initWithFormat:@"%@/Contents.json", v18];
  [MEMORY[0x1E4F28CB8] defaultManager];
  v94 = char v99 = 0;
  v89 = a5;
  v84 = (void *)v19;
  if (![v94 fileExistsAtPath:v19 isDirectory:&v99] || v99)
  {
    v23 = [v7 name];
    v24 = [v23 componentsSeparatedByString:@"/"];

    id v25 = objc_alloc(MEMORY[0x1E4F28E78]);
    v26 = [v85 absoluteString];
    v27 = (void *)[v25 initWithFormat:@"%@", v26];

    if ([v24 count] != 1)
    {
      unint64_t v31 = 0;
      char v28 = 1;
      while (1)
      {
        [v27 appendString:@"/"];
        v32 = v24;
        uint64_t v33 = [v24 objectAtIndexedSubscript:v31];
        [v27 appendString:v33];

        if (![v94 fileExistsAtPath:v27 isDirectory:&v99] || !v99)
        {
          if (([v94 createDirectoryAtPath:v27 withIntermediateDirectories:v28 & 1 attributes:0 error:v89] & 1) == 0)
          {
            _newTXRErrorWithCodeAndErrorString(5, @"Could not create folder hierarchy for texture name");
            id *v89 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_101;
          }
          v103 = @"info";
          v104[0] = &unk_1F37CDDB8;
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:&v103 count:1];
          if (!writeContentsJsonAtPath(v34, v27, (uint64_t)v89))
          {
            _newTXRErrorWithCodeAndErrorString(5, @"Could not create Content.json for hierarchy of texture name");
            id *v89 = (id)objc_claimAutoreleasedReturnValue();

LABEL_101:
            id v29 = 0;
            id v88 = 0;
            v30 = 0;
            v20 = v32;
            id v22 = 0;
LABEL_102:

            goto LABEL_107;
          }

          char v28 = 0;
        }
        ++v31;
        v24 = v32;
        if (v31 >= [v32 count] - 1) {
          goto LABEL_19;
        }
      }
    }
    char v28 = 1;
LABEL_19:
    uint64_t v35 = v28 & 1;
    a5 = v89;
    [v94 createDirectoryAtPath:v18 withIntermediateDirectories:v35 attributes:0 error:v89];
    id v36 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v37 = [v7 configs];
    uint64_t v38 = objc_msgSend(v36, "initWithCapacity:", objc_msgSend(v37, "count"));

    v101[0] = @"info";
    v101[1] = @"textures";
    v102[0] = &unk_1F37CDDB8;
    v102[1] = v38;
    id v88 = (id)v38;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:2];
    uint64_t v40 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v39];

    if (![v7 interpretation])
    {
      id v29 = 0;
LABEL_27:
      id v22 = (id)v40;
      goto LABEL_28;
    }
LABEL_20:
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
LABEL_21:
    if ([v7 interpretation] == 1)
    {
      v41 = @"non-premultiplied-colors";
    }
    else
    {
      if ([v7 interpretation] != 2) {
        +[TXRAssetCatalogParser exportSet:location:error:]();
      }
      v41 = @"data";
    }
    [v29 setObject:v41 forKeyedSubscript:@"interpretation"];
    goto LABEL_27;
  }
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithFileAtPath:v19];
  [v20 open];
  v21 = [MEMORY[0x1E4F28D90] JSONObjectWithStream:v20 options:1 error:a5];
  [v20 close];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v21;
  }
  else
  {
    if (a5)
    {
      _newTXRErrorWithCodeAndErrorString(3, @"Unexpected format of Contents.json");
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      id v29 = 0;
      id v88 = 0;
      id v22 = 0;
      v30 = 0;
      goto LABEL_102;
    }
    id v22 = 0;
  }
  v68 = [v22 objectForKeyedSubscript:@"properties"];
  if (v68)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v82 = v68;
      goto LABEL_92;
    }
    if (a5)
    {
      v69 = v20;
      _newTXRErrorWithCodeAndErrorString(3, @"Value of properties key is not an object");
      id v82 = 0;
      id v88 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      int v70 = 1;
      goto LABEL_105;
    }
  }
  id v82 = 0;
LABEL_92:
  v71 = [v22 objectForKeyedSubscript:@"textures"];
  if (v71)
  {
    objc_opt_class();
    v69 = v20;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a5)
      {
        _newTXRErrorWithCodeAndErrorString(3, @"Value of textures key is not an array");
        id v88 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        int v70 = 1;
      }
      else
      {
        int v70 = 0;
        id v88 = 0;
      }
      goto LABEL_104;
    }
    id v88 = v71;
  }
  else
  {
    v69 = v20;
    id v72 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v73 = [v7 configs];
    uint64_t v74 = objc_msgSend(v72, "initWithCapacity:", objc_msgSend(v73, "count"));

    id v88 = (id)v74;
    [v22 setObject:v74 forKeyedSubscript:@"textures"];
  }
  int v70 = 0;
LABEL_104:

LABEL_105:
  if (v70)
  {
    v30 = 0;
    id v29 = v82;
    goto LABEL_107;
  }
  id v29 = v82;
  if ([v7 interpretation])
  {
    uint64_t v40 = (uint64_t)v22;
    if (v82) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v82) {
    [v82 removeObjectForKey:@"interpretation"];
  }
LABEL_28:
  if ([v7 origin] == 1)
  {
    if (v29)
    {
      [v29 setObject:@"bottom-left" forKeyedSubscript:@"origin"];
LABEL_34:
      [v22 setObject:v29 forKeyedSubscript:@"properties"];
      goto LABEL_35;
    }
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v29 setObject:@"bottom-left" forKeyedSubscript:@"origin"];
    if (v29) {
      goto LABEL_34;
    }
  }
  else if (v29)
  {
    [v29 removeObjectForKey:@"origin"];
    goto LABEL_34;
  }
LABEL_35:
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v20 = [v7 configs];
  uint64_t v77 = [v20 countByEnumeratingWithState:&v95 objects:v100 count:16];
  if (v77)
  {
    if (v87) {
      int v42 = 6;
    }
    else {
      int v42 = 1;
    }
    int v86 = v42;
    uint64_t v43 = *(void *)v96;
    id v81 = v29;
    id v83 = v7;
    id v79 = v22;
    v80 = v20;
    uint64_t v76 = *(void *)v96;
    while (1)
    {
      uint64_t v44 = 0;
LABEL_41:
      if (*(void *)v96 != v43)
      {
        uint64_t v45 = v44;
        objc_enumerationMutation(v20);
        uint64_t v44 = v45;
      }
      uint64_t v78 = v44;
      id v46 = *(void **)(*((void *)&v95 + 1) + 8 * v44);
      v47 = [v46 texture];
      int v48 = [v47 cubemap];

      if (v87 != v48) {
        break;
      }
      uint64_t v49 = 0;
      do
      {
        v50 = v18;
        unint64_t v51 = [v46 idiom];
        if (v51 > 5)
        {
          v52 = 0;
          v53 = 0;
        }
        else
        {
          v52 = off_1E6CA2AE8[v51];
          v53 = off_1E6CA2B18[v51];
        }
        unint64_t v54 = [v46 graphicsFeatureSet] - 1;
        if (v54 > 3)
        {
          v93 = 0;
          v91 = 0;
        }
        else
        {
          v93 = off_1E6CA2B48[v54];
          v91 = off_1E6CA2B68[v54];
        }
        unint64_t v55 = [v46 memory] - 1;
        if (v55 > 3)
        {
          v90 = 0;
          v56 = 0;
        }
        else
        {
          v90 = off_1E6CA2B88[v55];
          v56 = off_1E6CA2BA8[v55];
        }
        uint64_t v57 = [v46 displayColorSpace];
        v58 = @"sRGB";
        if (v57 != 1) {
          v58 = 0;
        }
        if (v57 == 2) {
          v59 = @"P3";
        }
        else {
          v59 = v58;
        }
        v60 = 0;
        unint64_t v61 = [v46 scaleFactor] - 1;
        if (v61 <= 2) {
          v60 = off_1E6CA2BC8[v61];
        }
        uint64_t v62 = [v46 pixelFormat];
        if ((unint64_t)(v62 - 1) > 0xB) {
          v92 = 0;
        }
        else {
          v92 = off_1E6CA2BE0[v62 - 1];
        }
        id v63 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v64 setObject:v53 forKeyedSubscript:@"idiom"];
        [v63 setString:v52];
        uint64_t v18 = v50;
        if (v87)
        {
          if (v49 >= 6u) {
            +[TXRAssetCatalogParser exportSet:location:error:]();
          }
          v65 = off_1E6CA2C40[(char)v49];
          [v64 setObject:off_1E6CA2C70[(char)v49] forKeyedSubscript:@"cube-face"];
          [v63 appendString:@" "];
          [v63 appendString:v65];
        }
        if ([v46 memory])
        {
          [v64 setObject:v56 forKeyedSubscript:@"memory"];
          [v63 appendString:@" "];
          [v63 appendString:v90];
        }
        if ([v46 graphicsFeatureSet])
        {
          [v64 setObject:v91 forKeyedSubscript:@"graphics-feature-set"];
          [v63 appendString:@" "];
          [v63 appendString:v93];
        }
        if ([v46 displayColorSpace])
        {
          [v64 setObject:v59 forKeyedSubscript:@"color-space"];
          [v63 appendString:@" "];
          [v63 appendString:v59];
        }
        if ([v46 scaleFactor])
        {
          [v64 setObject:v60 forKeyedSubscript:@"scale"];
          [v63 appendString:@" "];
          [v63 appendString:v60];
        }
        if ([v46 pixelFormat]) {
          [v64 setObject:v92 forKeyedSubscript:@"pixel-format"];
        }
        [v63 appendString:@".mipmapset"];
        [v64 setObject:v63 forKeyedSubscript:@"filename"];
        [v88 addObject:v64];
        v66 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v50, v63];
        a5 = v89;
        [v94 createDirectoryAtPath:v66 withIntermediateDirectories:1 attributes:0 error:v89];
        BOOL v67 = +[TXRAssetCatalogParser exportSetConfig:v46 face:v49 directoryPath:v66 error:v89];

        if (!v67)
        {
          v30 = 0;
          id v29 = v81;
          id v7 = v83;
          id v22 = v79;
          v20 = v80;
          goto LABEL_102;
        }
        uint64_t v49 = (v49 + 1);
      }
      while (v86 != v49);
      uint64_t v44 = v78 + 1;
      id v29 = v81;
      id v7 = v83;
      id v22 = v79;
      v20 = v80;
      uint64_t v43 = v76;
      if (v78 + 1 != v77) {
        goto LABEL_41;
      }
      uint64_t v77 = [v80 countByEnumeratingWithState:&v95 objects:v100 count:16];
      if (!v77) {
        goto LABEL_81;
      }
    }
    _newTXRErrorWithCodeAndErrorString(7, @"Inconsistant set specifed.  Some mipmapsets specified are cubemap textures while other mipmapsets are 2D textures");
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = v81;
    id v7 = v83;
    goto LABEL_102;
  }
LABEL_81:

  if (writeContentsJsonAtPath(v22, v18, (uint64_t)a5))
  {
    v20 = [v18 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    v30 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20];
    goto LABEL_102;
  }
  v30 = 0;
LABEL_107:

  return v30;
}

+ (void)exportSetConfig:(void *)a1 face:directoryPath:error:.cold.1(void *a1)
{
}

+ (void)exportSetConfig:(void *)a1 face:directoryPath:error:.cold.2(void *a1)
{
}

+ (void)exportSet:location:error:.cold.1()
{
}

+ (void)exportSet:location:error:.cold.2()
{
  __assert_rtn("+[TXRAssetCatalogParser exportSet:location:error:]", "TXRAssetCatalogParser.m", 311, "TXRAssetInterpretationData == set.interpretation");
}

@end