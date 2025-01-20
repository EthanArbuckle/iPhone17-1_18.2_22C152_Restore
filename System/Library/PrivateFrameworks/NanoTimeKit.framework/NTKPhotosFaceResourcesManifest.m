@interface NTKPhotosFaceResourcesManifest
- (BOOL)_imageListItemContainsValidImage:(id)a3;
- (BOOL)_imageListItemContainsValidIrisVideo:(id)a3;
- (BOOL)_imageListItemHasValidAnalysisValues:(id)a3;
- (BOOL)_imageListItemHasValidCropValues:(id)a3;
- (BOOL)didLoadRawManifest:(id)a3;
- (BOOL)validateImageListItem:(id)a3 withError:(id *)a4;
- (NSString)assetCollectionIdentifier;
- (unint64_t)maxCompatibleVersion;
- (unint64_t)maxNumberOfPhotos;
- (unint64_t)minCompatibleVersion;
@end

@implementation NTKPhotosFaceResourcesManifest

- (BOOL)didLoadRawManifest:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"assetCollection"];
  assetCollectionIdentifier = self->_assetCollectionIdentifier;
  self->_assetCollectionIdentifier = v4;

  if (!self->_assetCollectionIdentifier) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  v7 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    [(NTKPhotosFaceResourcesManifest *)self didLoadRawManifest:v7];
  }

  return 0;
}

- (BOOL)validateImageListItem:(id)a3 withError:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"localIdentifier"];
  if (!v6
    || (v7 = (void *)v6,
        [v5 objectForKeyedSubscript:@"localIdentifier"],
        v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        v7,
        (isKindOfClass & 1) == 0))
  {
    v21 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
      v24 = [v23 lastPathComponent];
      v25 = [v5 objectForKeyedSubscript:@"localIdentifier"];
      int v26 = 138412546;
      v27 = v24;
      __int16 v28 = 2112;
      v29 = v25;
      _os_log_error_impl(&dword_1BC5A9000, v21, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid image list item identifier '%@'.", (uint8_t *)&v26, 0x16u);
    }
    goto LABEL_15;
  }
  v10 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
    v12 = [v11 lastPathComponent];
    v13 = [v5 objectForKeyedSubscript:@"localIdentifier"];
    int v26 = 138412546;
    v27 = v12;
    __int16 v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "[SANITIZER:%@]: validating image list item: %@", (uint8_t *)&v26, 0x16u);
  }
  if (![(NTKPhotosFaceResourcesManifest *)self _imageListItemContainsValidImage:v5])goto LABEL_15; {
  v14 = [v5 objectForKeyedSubscript:@"isIris"];
  }
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    v16 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
      v18 = [v17 lastPathComponent];
      v19 = [v5 objectForKeyedSubscript:@"localIdentifier"];
      int v26 = 138412546;
      v27 = v18;
      __int16 v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "[SANITIZER:%@]: image list item '%@' includes iris video.", (uint8_t *)&v26, 0x16u);
    }
    if (![(NTKPhotosFaceResourcesManifest *)self _imageListItemContainsValidIrisVideo:v5])goto LABEL_15; {
  }
    }
  if (![(NTKPhotosFaceResourcesManifest *)self _imageListItemHasValidCropValues:v5])
  {
LABEL_15:
    BOOL v20 = 0;
    goto LABEL_16;
  }
  BOOL v20 = [(NTKPhotosFaceResourcesManifest *)self _imageListItemHasValidAnalysisValues:v5];
LABEL_16:

  return v20;
}

- (BOOL)_imageListItemContainsValidImage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"imageURL"];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [v4 objectForKeyedSubscript:@"imageURL"],
        v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) != 0))
  {
    v9 = [v4 objectForKeyedSubscript:@"imageURL"];
    if ([(NTKBasePhotoResourcesManifest *)self resourceWithName:v9 isValidMediaAssetOfType:&unk_1F16E8C80 withMinFileSize:1000 maxFileSize:2000000])
    {
      BOOL v10 = [(NTKBasePhotoResourcesManifest *)self resourceWithNameIsValidImage:v9];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    v11 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
      v14 = [v13 lastPathComponent];
      int v15 = [v4 objectForKeyedSubscript:@"imageURL"];
      int v16 = 138412802;
      v17 = v14;
      __int16 v18 = 2112;
      v19 = v15;
      __int16 v20 = 2112;
      v21 = @"imageURL";
      _os_log_error_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid value: %@ for key: %@", (uint8_t *)&v16, 0x20u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_imageListItemContainsValidIrisVideo:(id)a3
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"irisVideoURL"];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [v4 objectForKeyedSubscript:@"irisVideoURL"],
        v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v8 = objc_opt_isKindOfClass(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = [v4 objectForKeyedSubscript:@"irisVideoURL"];
    if ([(NTKBasePhotoResourcesManifest *)self resourceWithName:v9 isValidMediaAssetOfType:&unk_1F16E8C98 withMinFileSize:10000 maxFileSize:4000000])
    {
      BOOL v10 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
      v11 = [v10 URLByAppendingPathComponent:v9 isDirectory:0];

      v12 = (void *)MEMORY[0x1E4F166C8];
      uint64_t v61 = *MEMORY[0x1E4F16148];
      v62[0] = MEMORY[0x1E4F1CC38];
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
      v14 = [v12 URLAssetWithURL:v11 options:v13];

      if (([v14 isPlayable] & 1) == 0)
      {
        int v16 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[NTKPhotosFaceResourcesManifest _imageListItemContainsValidIrisVideo:](self, v11);
        }
        goto LABEL_21;
      }
      int v15 = [v14 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
      int v16 = [v15 firstObject];

      if (!v16)
      {
        v21 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[NTKPhotosFaceResourcesManifest _imageListItemContainsValidIrisVideo:](self, v11);
        }
        goto LABEL_20;
      }
      [v16 naturalSize];
      if (v17 < 1.0
        || ([v16 naturalSize], v18 < 1.0)
        || ([v16 naturalSize], v19 > 1920.0)
        || ([v16 naturalSize], v20 > 1920.0))
      {
        v21 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
          v23 = [v22 lastPathComponent];
          [v16 naturalSize];
          v24 = NSStringFromCGSize(v63);
          v25 = [v11 path];
          *(_DWORD *)buf = 138412802;
          v54 = v23;
          __int16 v55 = 2112;
          v56 = v24;
          __int16 v57 = 2112;
          v58 = v25;
          _os_log_error_impl(&dword_1BC5A9000, v21, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: unexpected iris video dimensions '%@' at path '%@'", buf, 0x20u);
        }
        goto LABEL_20;
      }
      if (v14) {
        [v14 duration];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      double Seconds = CMTimeGetSeconds(&time);
      uint64_t v32 = [v4 objectForKeyedSubscript:@"irisDuration"];
      if (v32
        && (v33 = (void *)v32,
            [v4 objectForKeyedSubscript:@"irisDuration"],
            v34 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char v35 = objc_opt_isKindOfClass(),
            v34,
            v33,
            (v35 & 1) != 0))
      {
        uint64_t v36 = [v4 objectForKeyedSubscript:@"irisStillDisplayTime"];
        if (v36)
        {
          v37 = (void *)v36;
          v38 = [v4 objectForKeyedSubscript:@"irisStillDisplayTime"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v40 = [v4 objectForKeyedSubscript:@"irisDuration"];
            [v40 doubleValue];
            double v42 = v41;

            v43 = [v4 objectForKeyedSubscript:@"irisStillDisplayTime"];
            [v43 doubleValue];
            double v45 = v44;

            if (v42 <= 0.0 || v42 >= 10.0 || vabdd_f64(Seconds, v42) >= 0.100000001)
            {
              v21 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
              if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                goto LABEL_20;
              }
              v46 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
              v49 = [v46 lastPathComponent];
              v50 = [v11 path];
              *(_DWORD *)buf = 138413058;
              v54 = v49;
              __int16 v55 = 2112;
              v56 = v50;
              __int16 v57 = 2048;
              v58 = *(__CFString **)&Seconds;
              __int16 v59 = 2048;
              double v60 = v42;
              v51 = "[SANITIZER:%@]: iris video '%@' has unexpected duration. Actual: %f, encoded: %f";
            }
            else
            {
              if (v45 > 0.0 && v45 < Seconds)
              {
                BOOL v26 = 1;
                goto LABEL_22;
              }
              v21 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
              if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                goto LABEL_20;
              }
              v46 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
              v49 = [v46 lastPathComponent];
              v50 = [v11 path];
              *(_DWORD *)buf = 138413058;
              v54 = v49;
              __int16 v55 = 2112;
              v56 = v50;
              __int16 v57 = 2048;
              v58 = *(__CFString **)&v45;
              __int16 v59 = 2048;
              double v60 = Seconds;
              v51 = "[SANITIZER:%@]: iris video '%@' has unexpected still dislplay time: %f. Actual Duration: %f";
            }
            _os_log_error_impl(&dword_1BC5A9000, v21, OS_LOG_TYPE_ERROR, v51, buf, 0x2Au);

            goto LABEL_40;
          }
        }
        v21 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
LABEL_39:
          v46 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
          v47 = [v46 lastPathComponent];
          v48 = [v4 objectForKeyedSubscript:@"irisDuration"];
          *(_DWORD *)buf = 138412802;
          v54 = v47;
          __int16 v55 = 2112;
          v56 = v48;
          __int16 v57 = 2112;
          v58 = @"irisDuration";
          _os_log_error_impl(&dword_1BC5A9000, v21, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid value: %@ for key: %@", buf, 0x20u);

LABEL_40:
        }
      }
      else
      {
        v21 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
      }
LABEL_20:

LABEL_21:
      BOOL v26 = 0;
LABEL_22:

      goto LABEL_15;
    }
  }
  else
  {
    v9 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
      v29 = [v28 lastPathComponent];
      uint64_t v30 = [v4 objectForKeyedSubscript:@"irisVideoURL"];
      *(_DWORD *)buf = 138412802;
      v54 = v29;
      __int16 v55 = 2112;
      v56 = v30;
      __int16 v57 = 2112;
      v58 = @"irisVideoURL";
      _os_log_error_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid value: %@ for key: %@", buf, 0x20u);
    }
  }
  BOOL v26 = 0;
LABEL_15:

  return v26;
}

- (BOOL)_imageListItemHasValidCropValues:(id)a3
{
  uint64_t v36 = self;
  v55[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v55[0] = @"cropH";
  v55[1] = @"cropW";
  v55[2] = @"cropX";
  v55[3] = @"cropY";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:4];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, v36);
        if (v9)
        {
          BOOL v10 = [v3 objectForKeyedSubscript:v8];
          objc_opt_class();
          unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
        }
        else
        {
          unsigned __int8 isKindOfClass = 0;
        }

        v12 = [v3 objectForKeyedSubscript:v8];
        [v12 floatValue];
        float v14 = v13;

        if (((fabsf(v14) != INFINITY) & isKindOfClass) == 0)
        {
          int v16 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = [(NTKBasePhotoResourcesManifest *)v36 resourceDirectoryURL];
            v31 = [v30 lastPathComponent];
            uint64_t v32 = [v3 objectForKeyedSubscript:v8];
            *(_DWORD *)buf = 138412802;
            v49 = v31;
            __int16 v50 = 2112;
            v51 = v32;
            __int16 v52 = 2112;
            uint64_t v53 = v8;
            _os_log_error_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid crop value: %@ for key: %@", buf, 0x20u);
          }
          BOOL v26 = 0;
          int v15 = obj;
          v27 = obj;
          goto LABEL_30;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int v15 = obj;

  v47[0] = @"originalCropH";
  v47[1] = @"originalCropW";
  v47[2] = @"originalCropX";
  v47[3] = @"originalCropY";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  int v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v39;
    while (2)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        uint64_t v22 = objc_msgSend(v3, "objectForKeyedSubscript:", v21, v36);
        if (v22)
        {
          v23 = (void *)v22;
          v24 = [v3 objectForKeyedSubscript:v21];
          objc_opt_class();
          char v25 = objc_opt_isKindOfClass();

          if (v25) {
            continue;
          }
        }
        __int16 v28 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v33 = [(NTKBasePhotoResourcesManifest *)v36 resourceDirectoryURL];
          v34 = [v33 lastPathComponent];
          char v35 = [v3 objectForKeyedSubscript:v21];
          *(_DWORD *)buf = 138412802;
          v49 = v34;
          __int16 v50 = 2112;
          v51 = v35;
          __int16 v52 = 2112;
          uint64_t v53 = v21;
          _os_log_error_impl(&dword_1BC5A9000, v28, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid crop value: %@ for key: %@", buf, 0x20u);
        }
        BOOL v26 = 0;
        goto LABEL_28;
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v46 count:16];
      BOOL v26 = 1;
      if (v18) {
        continue;
      }
      break;
    }
LABEL_28:
    v27 = v16;
    int v15 = obj;
  }
  else
  {
    BOOL v26 = 1;
    v27 = v16;
  }
LABEL_30:

  return v26;
}

- (BOOL)_imageListItemHasValidAnalysisValues:(id)a3
{
  v51[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v51[0] = @"topAnalysis";
  v51[1] = @"bottomAnalysis";
  v51[2] = @"leftAnalysis";
  v51[3] = @"rightAnalysis";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        BOOL v10 = [v3 objectForKeyedSubscript:v9];
        BOOL v11 = +[NTKPhotoAnalysis isValidDictionary:v10];

        if (!v11)
        {
          v12 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            BOOL v26 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
            v27 = [v26 lastPathComponent];
            __int16 v28 = [v3 objectForKeyedSubscript:v9];
            *(_DWORD *)buf = 138412802;
            long long v45 = v27;
            __int16 v46 = 2112;
            v47 = v28;
            __int16 v48 = 2112;
            uint64_t v49 = v9;
            _os_log_error_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid analysis dictionary: %@ for key: %@", buf, 0x20u);
          }
          BOOL v22 = 0;
          v23 = v4;
          goto LABEL_27;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v43[0] = @"fastAnalysis";
  v43[1] = @"slowAnalysis";
  v43[2] = @"insideAnalysis";
  v43[3] = @"outsideAnalysis";
  v43[4] = @"upAnalysis";
  v43[5] = @"downAnalysis";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:6];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v32 = v4;
    uint64_t v15 = *(void *)v35;
    while (2)
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * j);
        uint64_t v18 = objc_msgSend(v3, "objectForKeyedSubscript:", v17, v32);
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          double v20 = [v3 objectForKeyedSubscript:v17];
          BOOL v21 = +[NTKPhotoAnalysis isValidDictionary:v20];

          if (!v21)
          {
            v24 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v29 = [(NTKBasePhotoResourcesManifest *)self resourceDirectoryURL];
              uint64_t v30 = [v29 lastPathComponent];
              v31 = [v3 objectForKeyedSubscript:v17];
              *(_DWORD *)buf = 138412802;
              long long v45 = v30;
              __int16 v46 = 2112;
              v47 = v31;
              __int16 v48 = 2112;
              uint64_t v49 = v17;
              _os_log_error_impl(&dword_1BC5A9000, v24, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid analysis dictionary: %@ for key: %@", buf, 0x20u);
            }
            BOOL v22 = 0;
            goto LABEL_25;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v42 count:16];
      BOOL v22 = 1;
      if (v14) {
        continue;
      }
      break;
    }
LABEL_25:
    v23 = v12;
    uint64_t v4 = v32;
  }
  else
  {
    BOOL v22 = 1;
    v23 = v12;
  }
LABEL_27:

  return v22;
}

- (unint64_t)minCompatibleVersion
{
  return 1;
}

- (unint64_t)maxCompatibleVersion
{
  return 1;
}

- (unint64_t)maxNumberOfPhotos
{
  return 24;
}

- (NSString)assetCollectionIdentifier
{
  return self->_assetCollectionIdentifier;
}

- (void).cxx_destruct
{
}

- (void)didLoadRawManifest:(NSObject *)a3 .cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 resourceDirectoryURL];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = *a2;
  int v8 = 138412802;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = @"assetCollection";
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: unexpected value: '%@' for key: %@.", (uint8_t *)&v8, 0x20u);
}

- (void)_imageListItemContainsValidIrisVideo:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = [a1 resourceDirectoryURL];
  uint64_t v4 = [v3 lastPathComponent];
  uint64_t v5 = [a2 path];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v6, v7, "[SANITIZER:%@]: invalid video asset at path '%@'", v8, v9, v10, v11, v12);
}

@end