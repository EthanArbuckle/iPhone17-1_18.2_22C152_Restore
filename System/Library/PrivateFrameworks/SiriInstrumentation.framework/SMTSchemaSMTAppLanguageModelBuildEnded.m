@interface SMTSchemaSMTAppLanguageModelBuildEnded
- (BOOL)hasArtifactFilepath;
- (BOOL)hasAssetName;
- (BOOL)hasLanguageModelFileSizeInBytes;
- (BOOL)hasNumCustomPronunciations;
- (BOOL)hasNumOutOfVocabulary;
- (BOOL)hasTrainingDataSizeInTokens;
- (BOOL)hasTrainingTimeInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)artifactFilepath;
- (NSString)assetName;
- (SMTSchemaSMTAppLanguageModelBuildEnded)initWithDictionary:(id)a3;
- (SMTSchemaSMTAppLanguageModelBuildEnded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)languageModelFileSizeInBytes;
- (unint64_t)numCustomPronunciations;
- (unint64_t)numOutOfVocabulary;
- (unint64_t)trainingDataSizeInTokens;
- (unint64_t)trainingTimeInNs;
- (void)deleteArtifactFilepath;
- (void)deleteAssetName;
- (void)deleteLanguageModelFileSizeInBytes;
- (void)deleteNumCustomPronunciations;
- (void)deleteNumOutOfVocabulary;
- (void)deleteTrainingDataSizeInTokens;
- (void)deleteTrainingTimeInNs;
- (void)setArtifactFilepath:(id)a3;
- (void)setAssetName:(id)a3;
- (void)setHasArtifactFilepath:(BOOL)a3;
- (void)setHasAssetName:(BOOL)a3;
- (void)setHasLanguageModelFileSizeInBytes:(BOOL)a3;
- (void)setHasNumCustomPronunciations:(BOOL)a3;
- (void)setHasNumOutOfVocabulary:(BOOL)a3;
- (void)setHasTrainingDataSizeInTokens:(BOOL)a3;
- (void)setHasTrainingTimeInNs:(BOOL)a3;
- (void)setLanguageModelFileSizeInBytes:(unint64_t)a3;
- (void)setNumCustomPronunciations:(unint64_t)a3;
- (void)setNumOutOfVocabulary:(unint64_t)a3;
- (void)setTrainingDataSizeInTokens:(unint64_t)a3;
- (void)setTrainingTimeInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SMTSchemaSMTAppLanguageModelBuildEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artifactFilepath, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
}

- (void)setHasArtifactFilepath:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAssetName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setArtifactFilepath:(id)a3
{
}

- (NSString)artifactFilepath
{
  return self->_artifactFilepath;
}

- (unint64_t)languageModelFileSizeInBytes
{
  return self->_languageModelFileSizeInBytes;
}

- (unint64_t)trainingTimeInNs
{
  return self->_trainingTimeInNs;
}

- (void)setAssetName:(id)a3
{
}

- (NSString)assetName
{
  return self->_assetName;
}

- (unint64_t)numCustomPronunciations
{
  return self->_numCustomPronunciations;
}

- (unint64_t)numOutOfVocabulary
{
  return self->_numOutOfVocabulary;
}

- (unint64_t)trainingDataSizeInTokens
{
  return self->_trainingDataSizeInTokens;
}

- (SMTSchemaSMTAppLanguageModelBuildEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SMTSchemaSMTAppLanguageModelBuildEnded;
  v5 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"trainingDataSizeInTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SMTSchemaSMTAppLanguageModelBuildEnded setTrainingDataSizeInTokens:](v5, "setTrainingDataSizeInTokens:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numOutOfVocabulary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SMTSchemaSMTAppLanguageModelBuildEnded setNumOutOfVocabulary:](v5, "setNumOutOfVocabulary:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numCustomPronunciations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SMTSchemaSMTAppLanguageModelBuildEnded setNumCustomPronunciations:](v5, "setNumCustomPronunciations:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"assetName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(SMTSchemaSMTAppLanguageModelBuildEnded *)v5 setAssetName:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"trainingTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SMTSchemaSMTAppLanguageModelBuildEnded setTrainingTimeInNs:](v5, "setTrainingTimeInNs:", [v11 unsignedLongLongValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"languageModelFileSizeInBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SMTSchemaSMTAppLanguageModelBuildEnded setLanguageModelFileSizeInBytes:](v5, "setLanguageModelFileSizeInBytes:", [v12 unsignedLongLongValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"artifactFilepath"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(SMTSchemaSMTAppLanguageModelBuildEnded *)v5 setArtifactFilepath:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (SMTSchemaSMTAppLanguageModelBuildEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_artifactFilepath)
  {
    id v4 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self artifactFilepath];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"artifactFilepath"];
  }
  if (self->_assetName)
  {
    v6 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self assetName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"assetName"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildEnded languageModelFileSizeInBytes](self, "languageModelFileSizeInBytes"));
    [v3 setObject:v11 forKeyedSubscript:@"languageModelFileSizeInBytes"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildEnded numCustomPronunciations](self, "numCustomPronunciations"));
  [v3 setObject:v12 forKeyedSubscript:@"numCustomPronunciations"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildEnded numOutOfVocabulary](self, "numOutOfVocabulary"));
  [v3 setObject:v13 forKeyedSubscript:@"numOutOfVocabulary"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_17:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildEnded trainingDataSizeInTokens](self, "trainingDataSizeInTokens"));
  [v3 setObject:v14 forKeyedSubscript:@"trainingDataSizeInTokens"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildEnded trainingTimeInNs](self, "trainingTimeInNs"));
    [v3 setObject:v9 forKeyedSubscript:@"trainingTimeInNs"];
  }
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v3 = 2654435761u * self->_trainingDataSizeInTokens;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_numOutOfVocabulary;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_numCustomPronunciations;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_assetName hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unint64_t v7 = 2654435761u * self->_trainingTimeInNs;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_12:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6 ^ [(NSString *)self->_artifactFilepath hash];
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  unint64_t v8 = 2654435761u * self->_languageModelFileSizeInBytes;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6 ^ [(NSString *)self->_artifactFilepath hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  $8494B2B5C7B53500B5CF4A754BF27F2A has = self->_has;
  unsigned int v6 = v4[64];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t trainingDataSizeInTokens = self->_trainingDataSizeInTokens;
    if (trainingDataSizeInTokens != [v4 trainingDataSizeInTokens]) {
      goto LABEL_30;
    }
    $8494B2B5C7B53500B5CF4A754BF27F2A has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_30;
  }
  if (v8)
  {
    unint64_t numOutOfVocabulary = self->_numOutOfVocabulary;
    if (numOutOfVocabulary != [v4 numOutOfVocabulary]) {
      goto LABEL_30;
    }
    $8494B2B5C7B53500B5CF4A754BF27F2A has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_30;
  }
  if (v10)
  {
    unint64_t numCustomPronunciations = self->_numCustomPronunciations;
    if (numCustomPronunciations != [v4 numCustomPronunciations]) {
      goto LABEL_30;
    }
  }
  v12 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self assetName];
  v13 = [v4 assetName];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_29;
  }
  uint64_t v14 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self assetName];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self assetName];
    objc_super v17 = [v4 assetName];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  $8494B2B5C7B53500B5CF4A754BF27F2A v19 = self->_has;
  int v20 = (*(unsigned int *)&v19 >> 3) & 1;
  unsigned int v21 = v4[64];
  if (v20 != ((v21 >> 3) & 1)) {
    goto LABEL_30;
  }
  if (v20)
  {
    unint64_t trainingTimeInNs = self->_trainingTimeInNs;
    if (trainingTimeInNs != [v4 trainingTimeInNs]) {
      goto LABEL_30;
    }
    $8494B2B5C7B53500B5CF4A754BF27F2A v19 = self->_has;
    unsigned int v21 = v4[64];
  }
  int v23 = (*(unsigned int *)&v19 >> 4) & 1;
  if (v23 != ((v21 >> 4) & 1)) {
    goto LABEL_30;
  }
  if (v23)
  {
    unint64_t languageModelFileSizeInBytes = self->_languageModelFileSizeInBytes;
    if (languageModelFileSizeInBytes != [v4 languageModelFileSizeInBytes]) {
      goto LABEL_30;
    }
  }
  v12 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self artifactFilepath];
  v13 = [v4 artifactFilepath];
  if ((v12 == 0) == (v13 != 0))
  {
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v25 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self artifactFilepath];
  if (!v25)
  {

LABEL_33:
    BOOL v30 = 1;
    goto LABEL_31;
  }
  v26 = (void *)v25;
  v27 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self artifactFilepath];
  v28 = [v4 artifactFilepath];
  char v29 = [v27 isEqual:v28];

  if (v29) {
    goto LABEL_33;
  }
LABEL_30:
  BOOL v30 = 0;
LABEL_31:

  return v30;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  unint64_t v5 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self assetName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0) {
    PBDataWriterWriteUint64Field();
  }
  unint64_t v7 = [(SMTSchemaSMTAppLanguageModelBuildEnded *)self artifactFilepath];

  int v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    int v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SMTSchemaSMTAppLanguageModelBuildEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteArtifactFilepath
{
}

- (BOOL)hasArtifactFilepath
{
  return self->_artifactFilepath != 0;
}

- (void)deleteLanguageModelFileSizeInBytes
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasLanguageModelFileSizeInBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLanguageModelFileSizeInBytes
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLanguageModelFileSizeInBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unint64_t languageModelFileSizeInBytes = a3;
}

- (void)deleteTrainingTimeInNs
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasTrainingTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTrainingTimeInNs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTrainingTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t trainingTimeInNs = a3;
}

- (void)deleteAssetName
{
}

- (BOOL)hasAssetName
{
  return self->_assetName != 0;
}

- (void)deleteNumCustomPronunciations
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumCustomPronunciations:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumCustomPronunciations
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumCustomPronunciations:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t numCustomPronunciations = a3;
}

- (void)deleteNumOutOfVocabulary
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumOutOfVocabulary:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumOutOfVocabulary
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumOutOfVocabulary:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t numOutOfVocabulary = a3;
}

- (void)deleteTrainingDataSizeInTokens
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTrainingDataSizeInTokens:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTrainingDataSizeInTokens
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTrainingDataSizeInTokens:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t trainingDataSizeInTokens = a3;
}

@end