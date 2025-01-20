@interface DODMLASRSchemaDODMLASRPersonalizationExperimentEnded
- (BOOL)hasDatapackVersion;
- (BOOL)hasDeviceThermalState;
- (BOOL)hasExperimentStatusCode;
- (BOOL)hasNumAudioFilesAvailable;
- (BOOL)hasNumAudioFilesSelected;
- (BOOL)hasPersonalizedLanguageModelMetrics;
- (BOOL)hasTextFetchDurationInNs;
- (BOOL)hasTextProcessingDurationInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRPersonalizationExperimentEnded)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRPersonalizationExperimentEnded)initWithJSON:(id)a3;
- (DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics)personalizedLanguageModelMetrics;
- (NSArray)audioFileResults;
- (NSData)jsonData;
- (NSString)datapackVersion;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)audioFileResultsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)deviceThermalState;
- (int)experimentStatusCode;
- (unint64_t)audioFileResultsCount;
- (unint64_t)hash;
- (unint64_t)textFetchDurationInNs;
- (unint64_t)textProcessingDurationInNs;
- (unsigned)numAudioFilesAvailable;
- (unsigned)numAudioFilesSelected;
- (void)addAudioFileResults:(id)a3;
- (void)clearAudioFileResults;
- (void)deleteDatapackVersion;
- (void)deleteDeviceThermalState;
- (void)deleteExperimentStatusCode;
- (void)deleteNumAudioFilesAvailable;
- (void)deleteNumAudioFilesSelected;
- (void)deletePersonalizedLanguageModelMetrics;
- (void)deleteTextFetchDurationInNs;
- (void)deleteTextProcessingDurationInNs;
- (void)setAudioFileResults:(id)a3;
- (void)setDatapackVersion:(id)a3;
- (void)setDeviceThermalState:(int)a3;
- (void)setExperimentStatusCode:(int)a3;
- (void)setHasDatapackVersion:(BOOL)a3;
- (void)setHasDeviceThermalState:(BOOL)a3;
- (void)setHasExperimentStatusCode:(BOOL)a3;
- (void)setHasNumAudioFilesAvailable:(BOOL)a3;
- (void)setHasNumAudioFilesSelected:(BOOL)a3;
- (void)setHasPersonalizedLanguageModelMetrics:(BOOL)a3;
- (void)setHasTextFetchDurationInNs:(BOOL)a3;
- (void)setHasTextProcessingDurationInNs:(BOOL)a3;
- (void)setNumAudioFilesAvailable:(unsigned int)a3;
- (void)setNumAudioFilesSelected:(unsigned int)a3;
- (void)setPersonalizedLanguageModelMetrics:(id)a3;
- (void)setTextFetchDurationInNs:(unint64_t)a3;
- (void)setTextProcessingDurationInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRPersonalizationExperimentEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DODMLASRSchemaDODMLASRPersonalizationExperimentEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self audioFileResults];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self setAudioFileResults:v7];

  v8 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self personalizedLanguageModelMetrics];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self deletePersonalizedLanguageModelMetrics];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedLanguageModelMetrics, 0);
  objc_storeStrong((id *)&self->_audioFileResults, 0);
  objc_storeStrong((id *)&self->_datapackVersion, 0);
}

- (void)setHasPersonalizedLanguageModelMetrics:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDatapackVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)deviceThermalState
{
  return self->_deviceThermalState;
}

- (unint64_t)textProcessingDurationInNs
{
  return self->_textProcessingDurationInNs;
}

- (unint64_t)textFetchDurationInNs
{
  return self->_textFetchDurationInNs;
}

- (void)setPersonalizedLanguageModelMetrics:(id)a3
{
}

- (DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics)personalizedLanguageModelMetrics
{
  return self->_personalizedLanguageModelMetrics;
}

- (void)setAudioFileResults:(id)a3
{
}

- (NSArray)audioFileResults
{
  return self->_audioFileResults;
}

- (int)experimentStatusCode
{
  return self->_experimentStatusCode;
}

- (unsigned)numAudioFilesSelected
{
  return self->_numAudioFilesSelected;
}

- (unsigned)numAudioFilesAvailable
{
  return self->_numAudioFilesAvailable;
}

- (void)setDatapackVersion:(id)a3
{
}

- (NSString)datapackVersion
{
  return self->_datapackVersion;
}

- (DODMLASRSchemaDODMLASRPersonalizationExperimentEnded)initWithDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)DODMLASRSchemaDODMLASRPersonalizationExperimentEnded;
  v5 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)&v34 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"datapackVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)v5 setDatapackVersion:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"numAudioFilesAvailable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setNumAudioFilesAvailable:](v5, "setNumAudioFilesAvailable:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"numAudioFilesSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setNumAudioFilesSelected:](v5, "setNumAudioFilesSelected:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"experimentStatusCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setExperimentStatusCode:](v5, "setExperimentStatusCode:", [v10 intValue]);
    }
    v29 = v10;
    objc_super v11 = [v4 objectForKeyedSubscript:@"audioFileResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v9;
      v27 = v8;
      v28 = v6;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [[DODMLASRSchemaDODMLASRAudioFileResult alloc] initWithDictionary:v17];
              [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)v5 addAudioFileResults:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v14);
      }

      v8 = v27;
      v9 = v26;
    }
    v19 = objc_msgSend(v4, "objectForKeyedSubscript:", @"personalizedLanguageModelMetrics", v26, v27, v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics alloc] initWithDictionary:v19];
      [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)v5 setPersonalizedLanguageModelMetrics:v20];
    }
    v21 = [v4 objectForKeyedSubscript:@"textFetchDurationInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setTextFetchDurationInNs:](v5, "setTextFetchDurationInNs:", [v21 unsignedLongLongValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"textProcessingDurationInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setTextProcessingDurationInNs:](v5, "setTextProcessingDurationInNs:", [v22 unsignedLongLongValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"deviceThermalState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setDeviceThermalState:](v5, "setDeviceThermalState:", [v23 intValue]);
    }
    v24 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRPersonalizationExperimentEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self dictionaryRepresentation];
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
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_audioFileResults count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v5 = self->_audioFileResults;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "dictionaryRepresentation", (void)v27);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            objc_super v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"audioFileResults"];
  }
  if (self->_datapackVersion)
  {
    id v12 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self datapackVersion];
    uint64_t v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"datapackVersion"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    unsigned int v15 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self deviceThermalState] - 1;
    if (v15 > 3) {
      v16 = @"DEVICETHERMALSTATE_UNKNOWN";
    }
    else {
      v16 = off_1E5EAE3A0[v15];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, @"deviceThermalState", (void)v27);
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v20 = objc_msgSend(NSNumber, "numberWithInt:", -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded experimentStatusCode](self, "experimentStatusCode"));
    [v3 setObject:v20 forKeyedSubscript:@"experimentStatusCode"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_22:
      if ((has & 2) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_22;
  }
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded numAudioFilesAvailable](self, "numAudioFilesAvailable", (void)v27));
  [v3 setObject:v21 forKeyedSubscript:@"numAudioFilesAvailable"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_23:
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded numAudioFilesSelected](self, "numAudioFilesSelected", (void)v27));
    [v3 setObject:v17 forKeyedSubscript:@"numAudioFilesSelected"];
  }
LABEL_24:
  if (self->_personalizedLanguageModelMetrics)
  {
    v18 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self personalizedLanguageModelMetrics];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"personalizedLanguageModelMetrics"];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"personalizedLanguageModelMetrics"];
    }
  }
  char v23 = (char)self->_has;
  if ((v23 & 8) != 0)
  {
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded textFetchDurationInNs](self, "textFetchDurationInNs"));
    [v3 setObject:v24 forKeyedSubscript:@"textFetchDurationInNs"];

    char v23 = (char)self->_has;
  }
  if ((v23 & 0x10) != 0)
  {
    v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded textProcessingDurationInNs](self, "textProcessingDurationInNs"));
    [v3 setObject:v25 forKeyedSubscript:@"textProcessingDurationInNs"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v27);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_datapackVersion hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_numAudioFilesAvailable;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_numAudioFilesSelected;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_experimentStatusCode;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  uint64_t v7 = [(NSArray *)self->_audioFileResults hash];
  unint64_t v8 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self->_personalizedLanguageModelMetrics hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    unint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    unint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  unint64_t v9 = 2654435761u * self->_textFetchDurationInNs;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  unint64_t v10 = 2654435761u * self->_textProcessingDurationInNs;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_deviceThermalState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self datapackVersion];
  uint64_t v6 = [v4 datapackVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_27;
  }
  uint64_t v7 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self datapackVersion];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self datapackVersion];
    unint64_t v10 = [v4 datapackVersion];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  $06ADFEA5A482C26EC14BE55344F829F8 has = self->_has;
  unsigned int v13 = v4[68];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_28;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numAudioFilesAvailable = self->_numAudioFilesAvailable;
    if (numAudioFilesAvailable != [v4 numAudioFilesAvailable]) {
      goto LABEL_28;
    }
    $06ADFEA5A482C26EC14BE55344F829F8 has = self->_has;
    unsigned int v13 = v4[68];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_28;
  }
  if (v15)
  {
    unsigned int numAudioFilesSelected = self->_numAudioFilesSelected;
    if (numAudioFilesSelected != [v4 numAudioFilesSelected]) {
      goto LABEL_28;
    }
    $06ADFEA5A482C26EC14BE55344F829F8 has = self->_has;
    unsigned int v13 = v4[68];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_28;
  }
  if (v17)
  {
    int experimentStatusCode = self->_experimentStatusCode;
    if (experimentStatusCode != [v4 experimentStatusCode]) {
      goto LABEL_28;
    }
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self audioFileResults];
  uint64_t v6 = [v4 audioFileResults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_27;
  }
  uint64_t v19 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self audioFileResults];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self audioFileResults];
    v22 = [v4 audioFileResults];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self personalizedLanguageModelMetrics];
  uint64_t v6 = [v4 personalizedLanguageModelMetrics];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v24 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self personalizedLanguageModelMetrics];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self personalizedLanguageModelMetrics];
    long long v27 = [v4 personalizedLanguageModelMetrics];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  $06ADFEA5A482C26EC14BE55344F829F8 v31 = self->_has;
  int v32 = (*(unsigned int *)&v31 >> 3) & 1;
  unsigned int v33 = v4[68];
  if (v32 == ((v33 >> 3) & 1))
  {
    if (v32)
    {
      unint64_t textFetchDurationInNs = self->_textFetchDurationInNs;
      if (textFetchDurationInNs != [v4 textFetchDurationInNs]) {
        goto LABEL_28;
      }
      $06ADFEA5A482C26EC14BE55344F829F8 v31 = self->_has;
      unsigned int v33 = v4[68];
    }
    int v35 = (*(unsigned int *)&v31 >> 4) & 1;
    if (v35 == ((v33 >> 4) & 1))
    {
      if (v35)
      {
        unint64_t textProcessingDurationInNs = self->_textProcessingDurationInNs;
        if (textProcessingDurationInNs != [v4 textProcessingDurationInNs]) {
          goto LABEL_28;
        }
        $06ADFEA5A482C26EC14BE55344F829F8 v31 = self->_has;
        unsigned int v33 = v4[68];
      }
      int v37 = (*(unsigned int *)&v31 >> 5) & 1;
      if (v37 == ((v33 >> 5) & 1))
      {
        if (!v37
          || (int deviceThermalState = self->_deviceThermalState,
              deviceThermalState == [v4 deviceThermalState]))
        {
          BOOL v29 = 1;
          goto LABEL_29;
        }
      }
    }
  }
LABEL_28:
  BOOL v29 = 0;
LABEL_29:

  return v29;
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self datapackVersion];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_audioFileResults;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v12 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self personalizedLanguageModelMetrics];

  if (v12)
  {
    unsigned int v13 = [(DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *)self personalizedLanguageModelMetrics];
    PBDataWriterWriteSubmessage();
  }
  char v14 = (char)self->_has;
  if ((v14 & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_18;
    }
LABEL_25:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  PBDataWriterWriteUint64Field();
  char v14 = (char)self->_has;
  if ((v14 & 0x10) != 0) {
    goto LABEL_25;
  }
LABEL_18:
  if ((v14 & 0x20) != 0) {
LABEL_19:
  }
    PBDataWriterWriteInt32Field();
LABEL_20:
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRPersonalizationExperimentEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDeviceThermalState
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasDeviceThermalState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDeviceThermalState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setDeviceThermalState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int deviceThermalState = a3;
}

- (void)deleteTextProcessingDurationInNs
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasTextProcessingDurationInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTextProcessingDurationInNs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTextProcessingDurationInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unint64_t textProcessingDurationInNs = a3;
}

- (void)deleteTextFetchDurationInNs
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasTextFetchDurationInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTextFetchDurationInNs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTextFetchDurationInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t textFetchDurationInNs = a3;
}

- (void)deletePersonalizedLanguageModelMetrics
{
}

- (BOOL)hasPersonalizedLanguageModelMetrics
{
  return self->_personalizedLanguageModelMetrics != 0;
}

- (id)audioFileResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_audioFileResults objectAtIndexedSubscript:a3];
}

- (unint64_t)audioFileResultsCount
{
  return [(NSArray *)self->_audioFileResults count];
}

- (void)addAudioFileResults:(id)a3
{
  id v4 = a3;
  audioFileResults = self->_audioFileResults;
  id v8 = v4;
  if (!audioFileResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_audioFileResults;
    self->_audioFileResults = v6;

    id v4 = v8;
    audioFileResults = self->_audioFileResults;
  }
  [(NSArray *)audioFileResults addObject:v4];
}

- (void)clearAudioFileResults
{
}

- (void)deleteExperimentStatusCode
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasExperimentStatusCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasExperimentStatusCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setExperimentStatusCode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int experimentStatusCode = a3;
}

- (void)deleteNumAudioFilesSelected
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumAudioFilesSelected:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumAudioFilesSelected
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumAudioFilesSelected:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numAudioFilesSelected = a3;
}

- (void)deleteNumAudioFilesAvailable
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumAudioFilesAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumAudioFilesAvailable
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumAudioFilesAvailable:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numAudioFilesAvailable = a3;
}

- (void)deleteDatapackVersion
{
}

- (BOOL)hasDatapackVersion
{
  return self->_datapackVersion != 0;
}

@end