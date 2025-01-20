@interface PSGResponseSuggestionsExpConfigDefaults
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)isMLModelEnabled;
- (NSString)espressoBinFilePath;
- (NSString)inferenceModelConfigPath;
- (NSString)inferenceModelFilePath;
- (NSString)language;
- (NSString)treatmentName;
- (NSString)vocabFilePath;
- (PSGResponseSuggestionsExpConfigDefaults)init;
- (TRIExperimentIdentifiers)experimentIdentifiers;
- (TRIRolloutIdentifiers)rolloutIdentifiers;
@end

@implementation PSGResponseSuggestionsExpConfigDefaults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_vocabFilePath, 0);
  objc_storeStrong((id *)&self->_espressoBinFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, 0);
  objc_storeStrong((id *)&self->_inferenceModelFilePath, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
}

- (NSString)language
{
  return self->_language;
}

- (NSString)vocabFilePath
{
  return self->_vocabFilePath;
}

- (NSString)espressoBinFilePath
{
  return self->_espressoBinFilePath;
}

- (NSString)inferenceModelConfigPath
{
  return self->_inferenceModelConfigPath;
}

- (NSString)inferenceModelFilePath
{
  return self->_inferenceModelFilePath;
}

- (BOOL)isMLModelEnabled
{
  return self->_isMLModelEnabled;
}

- (TRIExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (TRIRolloutIdentifiers)rolloutIdentifiers
{
  return self->_rolloutIdentifiers;
}

- (NSString)treatmentName
{
  return self->_treatmentName;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSGResponseSuggestionsExpConfigDefaults *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGResponseSuggestionsExpConfigDefaults *)self isEqualToConfig:v5];

  return v6;
}

- (BOOL)isEqualToConfig:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4 || self->_isMLModelEnabled != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_25;
  }
  treatmentName = self->_treatmentName;
  v7 = (NSString *)v4[2];
  if (treatmentName == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = treatmentName;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_25;
    }
  }
  inferenceModelFilePath = self->_inferenceModelFilePath;
  v12 = (NSString *)v5[5];
  if (inferenceModelFilePath == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = inferenceModelFilePath;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_25;
    }
  }
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  v17 = (NSString *)v5[6];
  if (inferenceModelConfigPath == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = inferenceModelConfigPath;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_25;
    }
  }
  espressoBinFilePath = self->_espressoBinFilePath;
  v22 = (NSString *)v5[7];
  if (espressoBinFilePath == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = espressoBinFilePath;
    char v25 = [(NSString *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_25;
    }
  }
  vocabFilePath = self->_vocabFilePath;
  v27 = (NSString *)v5[8];
  if (vocabFilePath == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = vocabFilePath;
    char v30 = [(NSString *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_25;
    }
  }
  rolloutIdentifiers = self->_rolloutIdentifiers;
  v32 = (TRIRolloutIdentifiers *)v5[3];
  if (rolloutIdentifiers == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = rolloutIdentifiers;
    char v35 = [(TRIRolloutIdentifiers *)v34 isEqual:v33];

    if ((v35 & 1) == 0)
    {
LABEL_25:
      char v36 = 0;
      goto LABEL_26;
    }
  }
  v38 = self->_experimentIdentifiers;
  v39 = v38;
  if (v38 == v5[4]) {
    char v36 = 1;
  }
  else {
    char v36 = -[TRIExperimentIdentifiers isEqual:](v38, "isEqual:");
  }

LABEL_26:
  return v36;
}

- (PSGResponseSuggestionsExpConfigDefaults)init
{
  v13.receiver = self;
  v13.super_class = (Class)PSGResponseSuggestionsExpConfigDefaults;
  v2 = [(PSGResponseSuggestionsExpConfigDefaults *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_isMLModelEnabled = 0;
    treatmentName = v2->_treatmentName;
    v2->_treatmentName = (NSString *)@"EP_ZKW_NIL_MODEL";

    rolloutIdentifiers = v3->_rolloutIdentifiers;
    v3->_rolloutIdentifiers = 0;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F80E40]) initWithExperimentId:@"EP_ZKW_NIL_EXP_ID" deploymentId:0xFFFFFFFFLL treatmentId:@"EP_ZKW_NIL_TRT_ID"];
    experimentIdentifiers = v3->_experimentIdentifiers;
    v3->_experimentIdentifiers = (TRIExperimentIdentifiers *)v6;

    inferenceModelFilePath = v3->_inferenceModelFilePath;
    v3->_inferenceModelFilePath = 0;

    inferenceModelConfigPath = v3->_inferenceModelConfigPath;
    v3->_inferenceModelConfigPath = 0;

    espressoBinFilePath = v3->_espressoBinFilePath;
    v3->_espressoBinFilePath = 0;

    vocabFilePath = v3->_vocabFilePath;
    v3->_vocabFilePath = 0;
  }
  return v3;
}

@end