@interface UPModelConfiguration
+ (id)_configurationWithBioLabelsVocabPath:(id)a3 configPath:(id)a4 grammarPath:(id)a5 intentVocabPath:(id)a6 spanVocabPath:(id)a7 parserEspressoModelPath:(id)a8 calibrationEspressoModelPath:(id)a9 error:(id *)a10;
+ (id)configurationFromDirectoryUrl:(id)a3 error:(id *)a4;
- (NSString)bioLabelsVocabPath;
- (NSString)calibrationEspressoModelPath;
- (NSString)configPath;
- (NSString)espressoModelPath;
- (NSString)grammarPath;
- (NSString)intentVocabPath;
- (NSString)parserEspressoModelPath;
- (NSString)spanVocabPath;
- (id)_initWithBioLabelsVocabPath:(id)a3 configPath:(id)a4 grammarPath:(id)a5 intentVocabPath:(id)a6 spanVocabPath:(id)a7 parserEspressoModelPath:(id)a8 calibrationEspressoModelPath:(id)a9;
@end

@implementation UPModelConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoModelPath, 0);
  objc_storeStrong((id *)&self->_calibrationEspressoModelPath, 0);
  objc_storeStrong((id *)&self->_parserEspressoModelPath, 0);
  objc_storeStrong((id *)&self->_spanVocabPath, 0);
  objc_storeStrong((id *)&self->_intentVocabPath, 0);
  objc_storeStrong((id *)&self->_grammarPath, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_bioLabelsVocabPath, 0);
}

- (NSString)espressoModelPath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)calibrationEspressoModelPath
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)parserEspressoModelPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)spanVocabPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)intentVocabPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)grammarPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)configPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)bioLabelsVocabPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)_initWithBioLabelsVocabPath:(id)a3 configPath:(id)a4 grammarPath:(id)a5 intentVocabPath:(id)a6 spanVocabPath:(id)a7 parserEspressoModelPath:(id)a8 calibrationEspressoModelPath:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)UPModelConfiguration;
  v22 = [(UPModelConfiguration *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    bioLabelsVocabPath = v22->_bioLabelsVocabPath;
    v22->_bioLabelsVocabPath = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    configPath = v22->_configPath;
    v22->_configPath = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    grammarPath = v22->_grammarPath;
    v22->_grammarPath = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    intentVocabPath = v22->_intentVocabPath;
    v22->_intentVocabPath = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    spanVocabPath = v22->_spanVocabPath;
    v22->_spanVocabPath = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    parserEspressoModelPath = v22->_parserEspressoModelPath;
    v22->_parserEspressoModelPath = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    calibrationEspressoModelPath = v22->_calibrationEspressoModelPath;
    v22->_calibrationEspressoModelPath = (NSString *)v35;

    objc_storeStrong((id *)&v22->_espressoModelPath, v22->_parserEspressoModelPath);
  }

  return v22;
}

+ (id)configurationFromDirectoryUrl:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 path];
  v6 = [v5 stringByAppendingPathComponent:@"calibration_model.mlmodelc"];

  v32[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  LODWORD(v5) = +[UPUtilities checkFileExistence:v7 error:0];

  id v8 = 0;
  if (v5) {
    id v8 = v6;
  }
  v9 = [v4 path];
  [v9 stringByAppendingPathComponent:@"info.plist"];
  v10 = uint64_t v27 = v6;
  uint64_t v31 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  BOOL v12 = +[UPUtilities checkFileExistence:v11 error:0];

  if (v12) {
    v13 = @"info.plist";
  }
  else {
    v13 = @"model_info.plist";
  }
  v26 = [v4 path];
  v14 = [v26 stringByAppendingPathComponent:@"bio_labels.vocab.txt"];
  uint64_t v25 = [v4 path];
  id v15 = [v25 stringByAppendingPathComponent:v13];
  v24 = [v4 path];
  id v16 = [v24 stringByAppendingPathComponent:@"grammar.json"];
  uint64_t v23 = [v4 path];
  id v17 = [v23 stringByAppendingPathComponent:@"intent.vocab.txt"];
  id v18 = [v4 path];
  id v19 = [v18 stringByAppendingPathComponent:@"span.vocab.txt"];
  id v20 = [v4 path];
  id v21 = [v20 stringByAppendingPathComponent:@"model.mlmodelc"];
  id v30 = [a1 _configurationWithBioLabelsVocabPath:v14 configPath:v15 grammarPath:v16 intentVocabPath:v17 spanVocabPath:v19 parserEspressoModelPath:v21 calibrationEspressoModelPath:v8 error:a4];

  return v30;
}

+ (id)_configurationWithBioLabelsVocabPath:(id)a3 configPath:(id)a4 grammarPath:(id)a5 intentVocabPath:(id)a6 spanVocabPath:(id)a7 parserEspressoModelPath:(id)a8 calibrationEspressoModelPath:(id)a9 error:(id *)a10
{
  v31[6] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v29 = v15;
  v31[0] = v15;
  v31[1] = v16;
  v22 = v16;
  v31[2] = v17;
  v31[3] = v18;
  v31[4] = v19;
  v31[5] = v20;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:6];
  if (+[UPUtilities checkFileExistence:v23 error:a10]
    && (!v21
     || (id v30 = v21,
         [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1],
         v24 = objc_claimAutoreleasedReturnValue(),
         BOOL v25 = +[UPUtilities checkFileExistence:v24 error:a10], v24, v25)))
  {
    v26 = v29;
    id v27 = [[UPModelConfiguration alloc] _initWithBioLabelsVocabPath:v29 configPath:v22 grammarPath:v17 intentVocabPath:v18 spanVocabPath:v19 parserEspressoModelPath:v20 calibrationEspressoModelPath:v21];
  }
  else
  {
    id v27 = 0;
    v26 = v29;
  }

  return v27;
}

@end