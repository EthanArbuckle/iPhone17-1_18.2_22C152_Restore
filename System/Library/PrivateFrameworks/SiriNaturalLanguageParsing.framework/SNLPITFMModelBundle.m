@interface SNLPITFMModelBundle
+ (SNLPITFMModelBundle)bundleWithEspressoModelURL:(id)a3 configURL:(id)a4 contextVocabularyURL:(id)a5 spanVocabularyURL:(id)a6 spanMappingURL:(id)a7 targetVocabularyURL:(id)a8 versionURL:(id)a9 errorDomain:(id)a10 error:(id *)a11;
+ (id)_errorForMissingResourceURL:(id)a3 errorDomain:(id)a4;
+ (id)_existErrorForEspressoModelURL:(id)a3 configURL:(id)a4 contextVocabularyURL:(id)a5 spanVocabularyURL:(id)a6 spanMappingURL:(id)a7 targetVocabularyURL:(id)a8 versionURL:(id)a9 errorDomain:(id)a10;
- (NSURL)configURL;
- (NSURL)contextVocabularyURL;
- (NSURL)espressoModelURL;
- (NSURL)spanMappingURL;
- (NSURL)spanVocabularyURL;
- (NSURL)targetVocabularyURL;
- (NSURL)versionURL;
- (id)_initWithEspressoModelURL:(id)a3 configURL:(id)a4 contextVocabularyURL:(id)a5 spanVocabularyURL:(id)a6 spanMappingURL:(id)a7 targetVocabularyURL:(id)a8 versionURL:(id)a9;
@end

@implementation SNLPITFMModelBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionURL, 0);
  objc_storeStrong((id *)&self->_targetVocabularyURL, 0);
  objc_storeStrong((id *)&self->_spanMappingURL, 0);
  objc_storeStrong((id *)&self->_spanVocabularyURL, 0);
  objc_storeStrong((id *)&self->_contextVocabularyURL, 0);
  objc_storeStrong((id *)&self->_configURL, 0);
  objc_storeStrong((id *)&self->_espressoModelURL, 0);
}

- (NSURL)versionURL
{
  return self->_versionURL;
}

- (NSURL)targetVocabularyURL
{
  return self->_targetVocabularyURL;
}

- (NSURL)spanMappingURL
{
  return self->_spanMappingURL;
}

- (NSURL)spanVocabularyURL
{
  return self->_spanVocabularyURL;
}

- (NSURL)contextVocabularyURL
{
  return self->_contextVocabularyURL;
}

- (NSURL)configURL
{
  return self->_configURL;
}

- (NSURL)espressoModelURL
{
  return self->_espressoModelURL;
}

- (id)_initWithEspressoModelURL:(id)a3 configURL:(id)a4 contextVocabularyURL:(id)a5 spanVocabularyURL:(id)a6 spanMappingURL:(id)a7 targetVocabularyURL:(id)a8 versionURL:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)SNLPITFMModelBundle;
  v18 = [(SNLPITFMModelBundle *)&v26 init];
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_espressoModelURL, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 7, a9);
  }

  return p_isa;
}

+ (id)_errorForMissingResourceURL:(id)a3 errorDomain:(id)a4
{
  v25[3] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 mainBundle];
  v9 = [v8 localizedStringForKey:@"Missing resource: %@" value:&stru_1F23628D0 table:0];

  v10 = [MEMORY[0x1E4F28B50] mainBundle];
  v11 = [v10 localizedStringForKey:@"Check that resource is available: %@" value:&stru_1F23628D0 table:0];

  v24[0] = *MEMORY[0x1E4F28568];
  v12 = NSString;
  v13 = [v7 path];
  v14 = objc_msgSend(v12, "stringWithFormat:", v9, v13);
  v25[0] = v14;
  v24[1] = *MEMORY[0x1E4F28588];
  v15 = NSString;
  id v16 = [v7 path];
  id v17 = objc_msgSend(v15, "stringWithFormat:", v9, v16);
  v25[1] = v17;
  v24[2] = *MEMORY[0x1E4F285A0];
  v18 = NSString;
  v19 = [v7 path];

  v20 = objc_msgSend(v18, "stringWithFormat:", v11, v19);
  v25[2] = v20;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

  id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:v6 code:2 userInfo:v21];

  return v22;
}

+ (id)_existErrorForEspressoModelURL:(id)a3 configURL:(id)a4 contextVocabularyURL:(id)a5 spanVocabularyURL:(id)a6 spanMappingURL:(id)a7 targetVocabularyURL:(id)a8 versionURL:(id)a9 errorDomain:(id)a10
{
  id v14 = a3;
  id v15 = a4;
  id v34 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v35 = 0;
  id v21 = [v14 path];
  LODWORD(a5) = [v20 fileExistsAtPath:v21 isDirectory:&v35];

  if (a5 && v35
    || ([(id)objc_opt_class() _errorForMissingResourceURL:v14 errorDomain:v19],
        (id v22 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v23 = [v15 path];
    char v24 = [v20 isReadableFileAtPath:v23];

    if ((v24 & 1) != 0
      || ([(id)objc_opt_class() _errorForMissingResourceURL:v15 errorDomain:v19],
          (id v22 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v25 = [v16 path];
      char v26 = [v20 isReadableFileAtPath:v25];

      if ((v26 & 1) != 0
        || ([(id)objc_opt_class() _errorForMissingResourceURL:v16 errorDomain:v19],
            (id v22 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v27 = [v34 path];
        char v28 = [v20 isReadableFileAtPath:v27];

        if (v28)
        {
          id v22 = 0;
        }
        else
        {
          id v22 = [(id)objc_opt_class() _errorForMissingResourceURL:v34 errorDomain:v19];
        }
        if (!v17)
        {
          if (v22) {
            goto LABEL_21;
          }
          goto LABEL_18;
        }
        if (!v22)
        {
          v29 = [v17 path];
          uint64_t v30 = [v20 isReadableFileAtPath:v29];

          if (v30)
          {
LABEL_18:
            v31 = [v18 path];
            char v32 = [v20 isReadableFileAtPath:v31];

            if (v32)
            {
              id v22 = 0;
            }
            else
            {
              id v22 = [(id)objc_opt_class() _errorForMissingResourceURL:v18 errorDomain:v19];
            }
            goto LABEL_21;
          }
          id v22 = [(id)objc_opt_class() _errorForMissingResourceURL:v17 errorDomain:v19];
        }
        if (v22) {
          goto LABEL_21;
        }
        goto LABEL_18;
      }
    }
  }
LABEL_21:

  return v22;
}

+ (SNLPITFMModelBundle)bundleWithEspressoModelURL:(id)a3 configURL:(id)a4 contextVocabularyURL:(id)a5 spanVocabularyURL:(id)a6 spanMappingURL:(id)a7 targetVocabularyURL:(id)a8 versionURL:(id)a9 errorDomain:(id)a10 error:(id *)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  char v24 = [(id)objc_opt_class() _existErrorForEspressoModelURL:v16 configURL:v17 contextVocabularyURL:v18 spanVocabularyURL:v19 spanMappingURL:v20 targetVocabularyURL:v21 versionURL:v22 errorDomain:v23];

  if (v24)
  {
    id v25 = 0;
    if (a11) {
      *a11 = v24;
    }
  }
  else
  {
    id v25 = [[SNLPITFMModelBundle alloc] _initWithEspressoModelURL:v16 configURL:v17 contextVocabularyURL:v18 spanVocabularyURL:v19 spanMappingURL:v20 targetVocabularyURL:v21 versionURL:v22];
  }

  return (SNLPITFMModelBundle *)v25;
}

@end