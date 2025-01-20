@interface SNLPServerNLClassifier
+ (id)_classifierWithModelURL:(id)a3 configURL:(id)a4 spanVocabularyURL:(id)a5 spanMappingURL:(id)a6 contextVocabularyURL:(id)a7 versionURL:(id)a8 error:(id *)a9;
+ (id)_convertITFMResponse:(id)a3;
+ (id)_convertSNLCRequest:(id)a3;
+ (id)_initializationBlock;
+ (id)classifierWithPathURL:(id)a3 error:(id *)a4;
- (id)inferenceResponseForRequest:(id)a3;
- (id)inferenceResponseForRequest:(id)a3 error:(id *)a4;
- (id)responseForRequest:(id)a3 error:(id *)a4;
@end

@implementation SNLPServerNLClassifier

+ (id)_convertITFMResponse:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA2A68]);
  objc_msgSend(v4, "setClassificationLabel:", objc_msgSend(v3, "classificationLabel"));
  [v3 classificationProbability];
  objc_msgSend(v4, "setClassificationProbability:");

  return v4;
}

+ (id)_convertSNLCRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA29F8]);
  v5 = [v3 embeddings];
  [v4 setEmbeddings:v5];

  v6 = [v3 matchingSpans];
  [v4 setMatchingSpans:v6];

  v7 = [v3 tokenisedUtterance];
  [v4 setTokenisedUtterance:v7];

  v8 = [v3 requestId];
  [v4 setRequestId:v8];

  v9 = [v3 nluRequestId];
  [v4 setNluRequestId:v9];

  v10 = [v3 turnInput];
  [v4 setTurnInput:v10];

  return v4;
}

+ (id)_initializationBlock
{
  return &__block_literal_global_1539;
}

void __46__SNLPServerNLClassifier__initializationBlock__block_invoke(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
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
  v8 = (const std::__fs::filesystem::path *)std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v11, &v10);
  getAssetDirectoryNCV(v8);
}

+ (id)_classifierWithModelURL:(id)a3 configURL:(id)a4 spanVocabularyURL:(id)a5 spanMappingURL:(id)a6 contextVocabularyURL:(id)a7 versionURL:(id)a8 error:(id *)a9
{
  id v22 = 0;
  v10 = +[SNLPITFMModelBundle bundleWithEspressoModelURL:a3 configURL:a4 contextVocabularyURL:a7 spanVocabularyURL:a5 spanMappingURL:a6 targetVocabularyURL:0 versionURL:a8 errorDomain:@"SNLPServerNLClassifierErrorDomain" error:&v22];
  id v11 = v22;
  uint64_t v12 = v11;
  if (v10)
  {
    v13 = [[SNLPITFMModelInfo alloc] initWithType:1 loggingComponent:1 errorDomain:@"SNLPServerNLClassifierErrorDomain"];
    v21.receiver = a1;
    v21.super_class = (Class)&OBJC_METACLASS___SNLPServerNLClassifier;
    id v14 = objc_msgSendSuper2(&v21, sel_alloc);
    v15 = [(id)objc_opt_class() _initializationBlock];
    id v20 = 0;
    v16 = (void *)[v14 initWithModelBundle:v10 modelInfo:v13 initializationBlock:v15 error:&v20];
    id v17 = v20;

    if (v16)
    {
      id v18 = v16;
    }
    else if (a9)
    {
      *a9 = v17;
    }
  }
  else
  {
    v16 = 0;
    if (a9) {
      *a9 = v11;
    }
  }

  return v16;
}

+ (id)classifierWithPathURL:(id)a3 error:(id *)a4
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v35 = 0;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8 isDirectory:&v35];

  if (v35) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  if (v10 == 1)
  {
    id v11 = NSString;
    std::string::basic_string[abi:ne180100]<0>(__p, "config.json");
    if (v34 >= 0) {
      uint64_t v12 = __p;
    }
    else {
      uint64_t v12 = (void **)__p[0];
    }
    v13 = [v11 stringWithUTF8String:v12];
    v32 = [v6 URLByAppendingPathComponent:v13];

    if (v34 < 0) {
      operator delete(__p[0]);
    }
    v31 = [v6 URLByAppendingPathComponent:@"SNLC/SNLC.mlmodelc"];
    id v14 = [v6 URLByAppendingPathComponent:@"SNLC/spans_pad.txt"];
    v15 = [v6 URLByAppendingPathComponent:@"SNLC/span_label_mapping.txt"];
    v16 = [v6 URLByAppendingPathComponent:@"SNLC/context_pad.txt"];
    id v17 = NSString;
    std::string::basic_string[abi:ne180100]<0>(__p, "version.yaml");
    if (v34 >= 0) {
      id v18 = __p;
    }
    else {
      id v18 = (void **)__p[0];
    }
    v19 = [v17 stringWithUTF8String:v18];
    id v20 = [v6 URLByAppendingPathComponent:v19];

    if (v34 < 0) {
      operator delete(__p[0]);
    }
    a4 = [a1 _classifierWithModelURL:v31 configURL:v32 spanVocabularyURL:v14 spanMappingURL:v15 contextVocabularyURL:v16 versionURL:v20 error:a4];
  }
  else
  {
    if (!a4) {
      goto LABEL_19;
    }
    objc_super v21 = [MEMORY[0x1E4F28B50] mainBundle];
    v32 = [v21 localizedStringForKey:@"An error occured when attempting to read the SNLC model bundle at: %@" value:&stru_1F23628D0 table:0];

    id v22 = [MEMORY[0x1E4F28B50] mainBundle];
    v31 = [v22 localizedStringForKey:@"Check that the path contains a valid model bundle: %@" value:&stru_1F23628D0 table:0];

    v23 = (void *)MEMORY[0x1E4F28C58];
    v36[0] = *MEMORY[0x1E4F28568];
    v24 = NSString;
    id v14 = [v6 path];
    v15 = objc_msgSend(v24, "stringWithFormat:", v32, v14);
    v37[0] = v15;
    v36[1] = *MEMORY[0x1E4F28588];
    v25 = NSString;
    v16 = [v6 path];
    id v20 = objc_msgSend(v25, "stringWithFormat:", v32, v16);
    v37[1] = v20;
    v36[2] = *MEMORY[0x1E4F285A0];
    v26 = NSString;
    v27 = [v6 path];
    v28 = objc_msgSend(v26, "stringWithFormat:", v31, v27);
    v37[2] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
    *a4 = [v23 errorWithDomain:@"SNLPServerNLClassifierErrorDomain" code:1 userInfo:v29];

    a4 = 0;
  }

LABEL_19:
  return a4;
}

- (id)inferenceResponseForRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v3 = [(SNLPServerNLClassifier *)self inferenceResponseForRequest:a3 error:&v9];
  id v4 = v9;
  if (!v3)
  {
    id v5 = SNLPOSLoggerForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [v4 localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v11 = "SNLC";
      __int16 v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1C8DA9000, v5, OS_LOG_TYPE_ERROR, "[%s] Encountered error in deprecated version of inferenceResponseForRequest: %@ (returning SERVER parser response)", buf, 0x16u);
    }
    id v3 = objc_alloc_init(MEMORY[0x1E4FA2A68]);
    [v3 setClassificationLabel:0];
    LODWORD(v7) = 1.0;
    [v3 setClassificationProbability:v7];
  }

  return v3;
}

- (id)inferenceResponseForRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(id)objc_opt_class() _convertSNLCRequest:v6];
  v8 = [(SNLPServerNLClassifier *)self responseForRequest:v7 error:a4];
  if (v8)
  {
    id v9 = [(id)objc_opt_class() _convertITFMResponse:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)responseForRequest:(id)a3 error:(id *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SNLPServerNLClassifier;
  id v4 = [(SNLPITFMClassifier *)&v6 responseForRequest:a3 error:a4];
  return v4;
}

@end