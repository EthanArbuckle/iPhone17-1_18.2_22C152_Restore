@interface PSGWordBoundarySuggestionsExpConfigDefaults
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)isMLModelEnabled;
- (NSString)espressoBinFilePath;
- (NSString)inferenceModelConfigPath;
- (NSString)treatmentName;
- (PSGWordBoundarySuggestionsExpConfigDefaults)init;
- (TRIExperimentIdentifiers)experimentIdentifiers;
- (TRIRolloutIdentifiers)rolloutIdentifiers;
@end

@implementation PSGWordBoundarySuggestionsExpConfigDefaults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoBinFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
}

- (NSString)espressoBinFilePath
{
  return self->_espressoBinFilePath;
}

- (NSString)inferenceModelConfigPath
{
  return self->_inferenceModelConfigPath;
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
  v4 = (PSGWordBoundarySuggestionsExpConfigDefaults *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGWordBoundarySuggestionsExpConfigDefaults *)self isEqualToConfig:v5];

  return v6;
}

- (BOOL)isEqualToConfig:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4 || self->_isMLModelEnabled != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_13;
  }
  rolloutIdentifiers = self->_rolloutIdentifiers;
  v7 = (TRIRolloutIdentifiers *)v4[3];
  if (rolloutIdentifiers == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = rolloutIdentifiers;
    char v10 = [(TRIRolloutIdentifiers *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_13;
    }
  }
  experimentIdentifiers = self->_experimentIdentifiers;
  v12 = (TRIExperimentIdentifiers *)v5[4];
  if (experimentIdentifiers == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = experimentIdentifiers;
    char v15 = [(TRIExperimentIdentifiers *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
  }
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  v17 = (NSString *)v5[5];
  if (inferenceModelConfigPath == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = inferenceModelConfigPath;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0)
    {
LABEL_13:
      char v21 = 0;
      goto LABEL_14;
    }
  }
  v23 = self->_espressoBinFilePath;
  v24 = v23;
  if (v23 == v5[6]) {
    char v21 = 1;
  }
  else {
    char v21 = -[NSString isEqual:](v23, "isEqual:");
  }

LABEL_14:
  return v21;
}

- (PSGWordBoundarySuggestionsExpConfigDefaults)init
{
  v11.receiver = self;
  v11.super_class = (Class)PSGWordBoundarySuggestionsExpConfigDefaults;
  v2 = [(PSGWordBoundarySuggestionsExpConfigDefaults *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_isMLModelEnabled = 0;
    treatmentName = v2->_treatmentName;
    v2->_treatmentName = (NSString *)@"EP_WORD_BOUNDARY_NIL_MODEL";

    rolloutIdentifiers = v3->_rolloutIdentifiers;
    v3->_rolloutIdentifiers = 0;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F80E40]) initWithExperimentId:@"EP_WORD_BOUNDARY_NIL_EXP_ID" deploymentId:0xFFFFFFFFLL treatmentId:@"EP_WORD_BOUNDARY_NIL_TRT_ID"];
    experimentIdentifiers = v3->_experimentIdentifiers;
    v3->_experimentIdentifiers = (TRIExperimentIdentifiers *)v6;

    inferenceModelConfigPath = v3->_inferenceModelConfigPath;
    v3->_inferenceModelConfigPath = 0;

    espressoBinFilePath = v3->_espressoBinFilePath;
    v3->_espressoBinFilePath = 0;
  }
  return v3;
}

@end