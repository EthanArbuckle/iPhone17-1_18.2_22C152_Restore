@interface SNLPPommesServerClassifier
+ (id)_initializationBlock;
+ (id)classifierWithPathURL:(id)a3 error:(id *)a4;
- (float)confidenceThreshold;
- (id)responseForRequest:(id)a3 error:(id *)a4;
- (void)setConfidenceThreshold:(float)a3;
@end

@implementation SNLPPommesServerClassifier

- (void)setConfidenceThreshold:(float)a3
{
  self->_confidenceThreshold = a3;
}

- (float)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (id)responseForRequest:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)SNLPPommesServerClassifier;
  v5 = [(SNLPITFMClassifier *)&v25 responseForRequest:a3 error:a4];
  v6 = v5;
  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = objc_msgSend(v5, "hypotheses", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v11 label] == 1)
          {
            [v11 probability];
            float v13 = v12;
            [(SNLPPommesServerClassifier *)self confidenceThreshold];
            if (v13 < v14)
            {
              v15 = SNLPOSLoggerForCategory(2);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                v16 = [v11 stringLabel];
                [v11 probability];
                float v18 = v17;
                [(SNLPPommesServerClassifier *)self confidenceThreshold];
                *(_DWORD *)buf = 136316162;
                v27 = "PSC";
                __int16 v28 = 2080;
                v29 = "[insights-snlp-psc]: ";
                __int16 v30 = 2112;
                v31 = v16;
                __int16 v32 = 2048;
                double v33 = v18;
                __int16 v34 = 2048;
                double v35 = v19;
                _os_log_impl(&dword_1C8DA9000, v15, OS_LOG_TYPE_DEBUG, "[%s] %sPSC %@ probability (%1.2f) is below the 'confidence_threshold: (%1.2f)', setting to -0.0", buf, 0x34u);
              }
              [v11 setProbability:COERCE_DOUBLE(0x8000000080000000)];
              [v6 setClassificationProbability:COERCE_DOUBLE(0x8000000080000000)];
            }
            goto LABEL_15;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v36 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  return v6;
}

+ (id)_initializationBlock
{
  return &__block_literal_global_1845;
}

void __50__SNLPPommesServerClassifier__initializationBlock__block_invoke(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  a2;
  *a3 = 0;
  v6 = [v5 configURL];
  id v7 = [v6 path];
  std::string::basic_string[abi:ne180100]<0>(&v9, (char *)[v7 UTF8String]);

  [v5 versionURL];
  v10 = [(id)objc_claimAutoreleasedReturnValue() path];
  uint64_t v8 = (const std::__fs::filesystem::path *)std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v11, &v10);
  getAssetDirectoryNCV(v8);
}

+ (id)classifierWithPathURL:(id)a3 error:(id *)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v62 = 0;
  v59 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [v6 path];
  int v8 = [v59 fileExistsAtPath:v7 isDirectory:&v62];

  if (v62) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  if (v9 == 1)
  {
    v10 = NSString;
    std::string::basic_string[abi:ne180100]<0>(buf, "config.json");
    if (v68 >= 0) {
      std::string v11 = buf;
    }
    else {
      std::string v11 = *(unsigned char **)buf;
    }
    uint64_t v12 = [v10 stringWithUTF8String:v11];
    v55 = [v6 URLByAppendingPathComponent:v12];

    if (v68 < 0) {
      operator delete(*(void **)buf);
    }
    v52 = [v6 URLByAppendingPathComponent:@"PSC/PSC.mlmodelc"];
    v53 = [v6 URLByAppendingPathComponent:@"PSC/spans_pad.txt"];
    v54 = [v6 URLByAppendingPathComponent:@"PSC/span_label_mapping.txt"];
    v57 = [v6 URLByAppendingPathComponent:@"PSC/context_pad.txt"];
    float v13 = [v6 URLByAppendingPathComponent:@"PSC/targets.txt"];
    float v14 = NSString;
    std::string::basic_string[abi:ne180100]<0>(buf, "version.yaml");
    if (v68 >= 0) {
      v15 = buf;
    }
    else {
      v15 = *(unsigned char **)buf;
    }
    v16 = [v14 stringWithUTF8String:v15];
    float v17 = [v6 URLByAppendingPathComponent:v16];

    if (v68 < 0) {
      operator delete(*(void **)buf);
    }
    float v18 = [v13 path];
    char v19 = [v59 isReadableFileAtPath:v18];

    if ((v19 & 1) == 0)
    {

      float v13 = 0;
    }
    id v61 = 0;
    v20 = +[SNLPITFMModelBundle bundleWithEspressoModelURL:v52 configURL:v55 contextVocabularyURL:v57 spanVocabularyURL:v53 spanMappingURL:v54 targetVocabularyURL:v13 versionURL:v17 errorDomain:@"SNLPPommesServerClassifierErrorDomain" error:&v61];
    id v51 = v61;
    if (v20)
    {
      long long v21 = [[SNLPITFMModelInfo alloc] initWithType:2 loggingComponent:4 errorDomain:@"SNLPPommesServerClassifierErrorDomain"];
      id v22 = objc_alloc((Class)a1);
      long long v23 = [a1 _initializationBlock];
      id v60 = 0;
      id v24 = (id)[v22 initWithModelBundle:v20 modelInfo:v21 initializationBlock:v23 error:&v60];
      id v25 = v60;

      if (v24)
      {
        v26 = (void *)MEMORY[0x1E4F28D90];
        v27 = (void *)MEMORY[0x1E4F1C9B8];
        __int16 v28 = [v20 configURL];
        v29 = [v27 dataWithContentsOfURL:v28];
        __int16 v30 = [v26 JSONObjectWithData:v29 options:0 error:0];

        v31 = [v30 objectForKey:@"confidence_threshold"];
        [v31 floatValue];
        objc_msgSend(v24, "setConfidenceThreshold:");

        [v24 confidenceThreshold];
        if (v32 > 0.0)
        {
          double v33 = SNLPOSLoggerForCategory(2);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            [v24 confidenceThreshold];
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "PSC";
            __int16 v66 = 2048;
            double v67 = v34;
            _os_log_impl(&dword_1C8DA9000, v33, OS_LOG_TYPE_DEBUG, "[%s] Loaded config confidence_threshold: %1.2f", buf, 0x16u);
          }
        }
        int v35 = 0;
      }
      else
      {
        if (a4) {
          *a4 = v25;
        }
        int v35 = 1;
      }
    }
    else
    {
      id v24 = 0;
      if (a4) {
        *a4 = v51;
      }
      int v35 = 1;
    }

    if (v35)
    {
      v49 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    if (a4)
    {
      v36 = [MEMORY[0x1E4F28B50] mainBundle];
      v58 = [v36 localizedStringForKey:@"An error occured when attempting to read the LVC model bundle at: %@" value:&stru_1F23628D0 table:0];

      uint64_t v37 = [MEMORY[0x1E4F28B50] mainBundle];
      v56 = [v37 localizedStringForKey:@"Check that the path contains a valid model bundle: %@" value:&stru_1F23628D0 table:0];

      v38 = (void *)MEMORY[0x1E4F28C58];
      v63[0] = *MEMORY[0x1E4F28568];
      v39 = NSString;
      v40 = [v6 path];
      v41 = objc_msgSend(v39, "stringWithFormat:", v58, v40);
      v64[0] = v41;
      v63[1] = *MEMORY[0x1E4F28588];
      v42 = NSString;
      v43 = [v6 path];
      v44 = objc_msgSend(v42, "stringWithFormat:", v58, v43);
      v64[1] = v44;
      v63[2] = *MEMORY[0x1E4F285A0];
      v45 = NSString;
      v46 = [v6 path];
      v47 = objc_msgSend(v45, "stringWithFormat:", v56, v46);
      v64[2] = v47;
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
      *a4 = [v38 errorWithDomain:@"SNLPPommesServerClassifierErrorDomain" code:1 userInfo:v48];
    }
    id v24 = 0;
  }
  id v24 = v24;
  v49 = v24;
LABEL_37:

  return v49;
}

@end