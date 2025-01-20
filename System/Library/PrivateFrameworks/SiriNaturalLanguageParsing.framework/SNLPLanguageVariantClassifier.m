@interface SNLPLanguageVariantClassifier
+ (id)classifierWithPathURL:(id)a3 error:(id *)a4;
@end

@implementation SNLPLanguageVariantClassifier

+ (id)classifierWithPathURL:(id)a3 error:(id *)a4
{
  v57[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v55 = 0;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8 isDirectory:&v55];

  if (v55) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  if (v10 == 1)
  {
    v11 = NSString;
    std::string::basic_string[abi:ne180100]<0>(__p, "config.json");
    if (v54 >= 0) {
      v12 = __p;
    }
    else {
      v12 = (void **)__p[0];
    }
    v13 = [v11 stringWithUTF8String:v12];
    v48 = [v6 URLByAppendingPathComponent:v13];

    if (v54 < 0) {
      operator delete(__p[0]);
    }
    v45 = [v6 URLByAppendingPathComponent:@"LVC/LVC.mlmodelc"];
    v44 = [v6 URLByAppendingPathComponent:@"LVC/spans_pad.txt"];
    v43 = [v6 URLByAppendingPathComponent:@"LVC/span_label_mapping.txt"];
    v46 = [v6 URLByAppendingPathComponent:@"LVC/context_pad.txt"];
    v14 = [v6 URLByAppendingPathComponent:@"LVC/targets.txt"];
    v15 = NSString;
    std::string::basic_string[abi:ne180100]<0>(__p, "version.yaml");
    if (v54 >= 0) {
      v16 = __p;
    }
    else {
      v16 = (void **)__p[0];
    }
    v17 = [v15 stringWithUTF8String:v16];
    v18 = [v6 URLByAppendingPathComponent:v17];

    if (v54 < 0) {
      operator delete(__p[0]);
    }
    id v52 = 0;
    v19 = +[SNLPITFMModelBundle bundleWithEspressoModelURL:v45 configURL:v48 contextVocabularyURL:v46 spanVocabularyURL:v44 spanMappingURL:v43 targetVocabularyURL:v14 versionURL:v18 errorDomain:@"SNLPLanguageVariantClassifierErrorDomain" error:&v52];
    id v20 = v52;
    v21 = v20;
    if (v19)
    {
      v22 = [[SNLPITFMModelInfo alloc] initWithType:3 loggingComponent:5 errorDomain:@"SNLPLanguageVariantClassifierErrorDomain"];
      id v23 = objc_alloc((Class)a1);
      v51.receiver = a1;
      v51.super_class = (Class)&OBJC_METACLASS___SNLPLanguageVariantClassifier;
      v24 = objc_msgSendSuper2(&v51, sel__initializationBlock);
      id v50 = 0;
      id v25 = (id)[v23 initWithModelBundle:v19 modelInfo:v22 initializationBlock:v24 error:&v50];
      id v26 = v50;

      if (v25)
      {
        int v27 = 0;
      }
      else
      {
        if (a4) {
          *a4 = v26;
        }
        int v27 = 1;
      }
    }
    else
    {
      id v25 = 0;
      if (a4) {
        *a4 = v20;
      }
      int v27 = 1;
    }

    if (v27)
    {
      v41 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    if (a4)
    {
      v28 = [MEMORY[0x1E4F28B50] mainBundle];
      v49 = [v28 localizedStringForKey:@"An error occured when attempting to read the LVC model bundle at: %@" value:&stru_1F23628D0 table:0];

      v29 = [MEMORY[0x1E4F28B50] mainBundle];
      v47 = [v29 localizedStringForKey:@"Check that the path contains a valid model bundle: %@" value:&stru_1F23628D0 table:0];

      v30 = (void *)MEMORY[0x1E4F28C58];
      v56[0] = *MEMORY[0x1E4F28568];
      v31 = NSString;
      v32 = [v6 path];
      v33 = objc_msgSend(v31, "stringWithFormat:", v49, v32);
      v57[0] = v33;
      v56[1] = *MEMORY[0x1E4F28588];
      v34 = NSString;
      v35 = [v6 path];
      v36 = objc_msgSend(v34, "stringWithFormat:", v49, v35);
      v57[1] = v36;
      v56[2] = *MEMORY[0x1E4F285A0];
      v37 = NSString;
      v38 = [v6 path];
      v39 = objc_msgSend(v37, "stringWithFormat:", v47, v38);
      v57[2] = v39;
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
      *a4 = [v30 errorWithDomain:@"SNLPLanguageVariantClassifierErrorDomain" code:1 userInfo:v40];
    }
    id v25 = 0;
  }
  id v25 = v25;
  v41 = v25;
LABEL_31:

  return v41;
}

@end