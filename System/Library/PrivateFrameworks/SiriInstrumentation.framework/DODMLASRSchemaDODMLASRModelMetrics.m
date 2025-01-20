@interface DODMLASRSchemaDODMLASRModelMetrics
- (BOOL)hasConfigName;
- (BOOL)hasConversionDurationInMs;
- (BOOL)hasModelTrainingStatusCode;
- (BOOL)hasNgramOrder;
- (BOOL)hasNumFiniteStateTransducerArcs;
- (BOOL)hasNumFiniteStateTransducerStates;
- (BOOL)hasOptimizationDurationInMs;
- (BOOL)hasResidualAdaptationWeight;
- (BOOL)hasTotalDurationInMs;
- (BOOL)hasTrainingDurationInMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRModelMetrics)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRModelMetrics)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)configName;
- (float)residualAdaptationWeight;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)conversionDurationInMs;
- (unint64_t)hash;
- (unint64_t)optimizationDurationInMs;
- (unint64_t)totalDurationInMs;
- (unint64_t)trainingDurationInMs;
- (unsigned)modelTrainingStatusCode;
- (unsigned)ngramOrder;
- (unsigned)numFiniteStateTransducerArcs;
- (unsigned)numFiniteStateTransducerStates;
- (void)deleteConfigName;
- (void)deleteConversionDurationInMs;
- (void)deleteModelTrainingStatusCode;
- (void)deleteNgramOrder;
- (void)deleteNumFiniteStateTransducerArcs;
- (void)deleteNumFiniteStateTransducerStates;
- (void)deleteOptimizationDurationInMs;
- (void)deleteResidualAdaptationWeight;
- (void)deleteTotalDurationInMs;
- (void)deleteTrainingDurationInMs;
- (void)setConfigName:(id)a3;
- (void)setConversionDurationInMs:(unint64_t)a3;
- (void)setHasConfigName:(BOOL)a3;
- (void)setHasConversionDurationInMs:(BOOL)a3;
- (void)setHasModelTrainingStatusCode:(BOOL)a3;
- (void)setHasNgramOrder:(BOOL)a3;
- (void)setHasNumFiniteStateTransducerArcs:(BOOL)a3;
- (void)setHasNumFiniteStateTransducerStates:(BOOL)a3;
- (void)setHasOptimizationDurationInMs:(BOOL)a3;
- (void)setHasResidualAdaptationWeight:(BOOL)a3;
- (void)setHasTotalDurationInMs:(BOOL)a3;
- (void)setHasTrainingDurationInMs:(BOOL)a3;
- (void)setModelTrainingStatusCode:(unsigned int)a3;
- (void)setNgramOrder:(unsigned int)a3;
- (void)setNumFiniteStateTransducerArcs:(unsigned int)a3;
- (void)setNumFiniteStateTransducerStates:(unsigned int)a3;
- (void)setOptimizationDurationInMs:(unint64_t)a3;
- (void)setResidualAdaptationWeight:(float)a3;
- (void)setTotalDurationInMs:(unint64_t)a3;
- (void)setTrainingDurationInMs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRModelMetrics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasConfigName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (unsigned)numFiniteStateTransducerStates
{
  return self->_numFiniteStateTransducerStates;
}

- (unsigned)numFiniteStateTransducerArcs
{
  return self->_numFiniteStateTransducerArcs;
}

- (unsigned)modelTrainingStatusCode
{
  return self->_modelTrainingStatusCode;
}

- (float)residualAdaptationWeight
{
  return self->_residualAdaptationWeight;
}

- (unsigned)ngramOrder
{
  return self->_ngramOrder;
}

- (unint64_t)totalDurationInMs
{
  return self->_totalDurationInMs;
}

- (unint64_t)optimizationDurationInMs
{
  return self->_optimizationDurationInMs;
}

- (unint64_t)conversionDurationInMs
{
  return self->_conversionDurationInMs;
}

- (unint64_t)trainingDurationInMs
{
  return self->_trainingDurationInMs;
}

- (void)setConfigName:(id)a3
{
}

- (NSString)configName
{
  return self->_configName;
}

- (DODMLASRSchemaDODMLASRModelMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DODMLASRSchemaDODMLASRModelMetrics;
  v5 = [(DODMLASRSchemaDODMLASRModelMetrics *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"configName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(DODMLASRSchemaDODMLASRModelMetrics *)v5 setConfigName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"trainingDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRModelMetrics setTrainingDurationInMs:](v5, "setTrainingDurationInMs:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"conversionDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRModelMetrics setConversionDurationInMs:](v5, "setConversionDurationInMs:", [v9 unsignedLongLongValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"optimizationDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRModelMetrics setOptimizationDurationInMs:](v5, "setOptimizationDurationInMs:", [v10 unsignedLongLongValue]);
    }
    v20 = v10;
    v11 = [v4 objectForKeyedSubscript:@"totalDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRModelMetrics setTotalDurationInMs:](v5, "setTotalDurationInMs:", [v11 unsignedLongLongValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"ngramOrder"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRModelMetrics setNgramOrder:](v5, "setNgramOrder:", [v12 unsignedIntValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"residualAdaptationWeight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[DODMLASRSchemaDODMLASRModelMetrics setResidualAdaptationWeight:](v5, "setResidualAdaptationWeight:");
    }
    v21 = v9;
    v22 = v8;
    v14 = [v4 objectForKeyedSubscript:@"modelTrainingStatusCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRModelMetrics setModelTrainingStatusCode:](v5, "setModelTrainingStatusCode:", [v14 unsignedIntValue]);
    }
    v15 = v6;
    v16 = [v4 objectForKeyedSubscript:@"numFiniteStateTransducerArcs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRModelMetrics setNumFiniteStateTransducerArcs:](v5, "setNumFiniteStateTransducerArcs:", [v16 unsignedIntValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"numFiniteStateTransducerStates"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRModelMetrics setNumFiniteStateTransducerStates:](v5, "setNumFiniteStateTransducerStates:", [v17 unsignedIntValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRModelMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRModelMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRModelMetrics *)self dictionaryRepresentation];
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
  if (self->_configName)
  {
    id v4 = [(DODMLASRSchemaDODMLASRModelMetrics *)self configName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"configName"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRModelMetrics conversionDurationInMs](self, "conversionDurationInMs"));
    [v3 setObject:v9 forKeyedSubscript:@"conversionDurationInMs"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRModelMetrics modelTrainingStatusCode](self, "modelTrainingStatusCode"));
  [v3 setObject:v10 forKeyedSubscript:@"modelTrainingStatusCode"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRModelMetrics ngramOrder](self, "ngramOrder"));
  [v3 setObject:v11 forKeyedSubscript:@"ngramOrder"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRModelMetrics numFiniteStateTransducerArcs](self, "numFiniteStateTransducerArcs"));
  [v3 setObject:v12 forKeyedSubscript:@"numFiniteStateTransducerArcs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRModelMetrics numFiniteStateTransducerStates](self, "numFiniteStateTransducerStates"));
  [v3 setObject:v13 forKeyedSubscript:@"numFiniteStateTransducerStates"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRModelMetrics optimizationDurationInMs](self, "optimizationDurationInMs"));
  [v3 setObject:v14 forKeyedSubscript:@"optimizationDurationInMs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  v15 = NSNumber;
  [(DODMLASRSchemaDODMLASRModelMetrics *)self residualAdaptationWeight];
  v16 = objc_msgSend(v15, "numberWithFloat:");
  [v3 setObject:v16 forKeyedSubscript:@"residualAdaptationWeight"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_23:
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRModelMetrics totalDurationInMs](self, "totalDurationInMs"));
  [v3 setObject:v17 forKeyedSubscript:@"totalDurationInMs"];

  if (*(_WORD *)&self->_has)
  {
LABEL_12:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRModelMetrics trainingDurationInMs](self, "trainingDurationInMs"));
    [v3 setObject:v7 forKeyedSubscript:@"trainingDurationInMs"];
  }
LABEL_13:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_configName hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v5 = 2654435761u * self->_trainingDurationInMs;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v6 = 2654435761u * self->_conversionDurationInMs;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    unint64_t v7 = 2654435761u * self->_optimizationDurationInMs;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    unint64_t v8 = 2654435761u * self->_totalDurationInMs;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v9 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  unint64_t v8 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_ngramOrder;
  if ((has & 0x20) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  float residualAdaptationWeight = self->_residualAdaptationWeight;
  double v11 = residualAdaptationWeight;
  if (residualAdaptationWeight < 0.0) {
    double v11 = -residualAdaptationWeight;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if ((has & 0x40) == 0)
  {
    uint64_t v15 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_21;
    }
LABEL_24:
    uint64_t v16 = 0;
    if ((has & 0x100) != 0) {
      goto LABEL_22;
    }
LABEL_25:
    uint64_t v17 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17;
  }
  uint64_t v15 = 2654435761 * self->_modelTrainingStatusCode;
  if ((has & 0x80) == 0) {
    goto LABEL_24;
  }
LABEL_21:
  uint64_t v16 = 2654435761 * self->_numFiniteStateTransducerArcs;
  if ((has & 0x100) == 0) {
    goto LABEL_25;
  }
LABEL_22:
  uint64_t v17 = 2654435761 * self->_numFiniteStateTransducerStates;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  unint64_t v5 = [(DODMLASRSchemaDODMLASRModelMetrics *)self configName];
  unint64_t v6 = [v4 configName];
  unint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_44;
  }
  uint64_t v8 = [(DODMLASRSchemaDODMLASRModelMetrics *)self configName];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [(DODMLASRSchemaDODMLASRModelMetrics *)self configName];
    double v11 = [v4 configName];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  $158CE04404E577B8922D1A958EF18294 has = self->_has;
  unsigned int v14 = v4[34];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_44:
    BOOL v33 = 0;
    goto LABEL_45;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t trainingDurationInMs = self->_trainingDurationInMs;
    if (trainingDurationInMs != [v4 trainingDurationInMs]) {
      goto LABEL_44;
    }
    $158CE04404E577B8922D1A958EF18294 has = self->_has;
    unsigned int v14 = v4[34];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_44;
  }
  if (v16)
  {
    unint64_t conversionDurationInMs = self->_conversionDurationInMs;
    if (conversionDurationInMs != [v4 conversionDurationInMs]) {
      goto LABEL_44;
    }
    $158CE04404E577B8922D1A958EF18294 has = self->_has;
    unsigned int v14 = v4[34];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_44;
  }
  if (v18)
  {
    unint64_t optimizationDurationInMs = self->_optimizationDurationInMs;
    if (optimizationDurationInMs != [v4 optimizationDurationInMs]) {
      goto LABEL_44;
    }
    $158CE04404E577B8922D1A958EF18294 has = self->_has;
    unsigned int v14 = v4[34];
  }
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_44;
  }
  if (v20)
  {
    unint64_t totalDurationInMs = self->_totalDurationInMs;
    if (totalDurationInMs != [v4 totalDurationInMs]) {
      goto LABEL_44;
    }
    $158CE04404E577B8922D1A958EF18294 has = self->_has;
    unsigned int v14 = v4[34];
  }
  int v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_44;
  }
  if (v22)
  {
    unsigned int ngramOrder = self->_ngramOrder;
    if (ngramOrder != [v4 ngramOrder]) {
      goto LABEL_44;
    }
    $158CE04404E577B8922D1A958EF18294 has = self->_has;
    unsigned int v14 = v4[34];
  }
  int v24 = (*(unsigned int *)&has >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1)) {
    goto LABEL_44;
  }
  if (v24)
  {
    float residualAdaptationWeight = self->_residualAdaptationWeight;
    [v4 residualAdaptationWeight];
    if (residualAdaptationWeight != v26) {
      goto LABEL_44;
    }
    $158CE04404E577B8922D1A958EF18294 has = self->_has;
    unsigned int v14 = v4[34];
  }
  int v27 = (*(unsigned int *)&has >> 6) & 1;
  if (v27 != ((v14 >> 6) & 1)) {
    goto LABEL_44;
  }
  if (v27)
  {
    unsigned int modelTrainingStatusCode = self->_modelTrainingStatusCode;
    if (modelTrainingStatusCode != [v4 modelTrainingStatusCode]) {
      goto LABEL_44;
    }
    $158CE04404E577B8922D1A958EF18294 has = self->_has;
    unsigned int v14 = v4[34];
  }
  int v29 = (*(unsigned int *)&has >> 7) & 1;
  if (v29 != ((v14 >> 7) & 1)) {
    goto LABEL_44;
  }
  if (v29)
  {
    unsigned int numFiniteStateTransducerArcs = self->_numFiniteStateTransducerArcs;
    if (numFiniteStateTransducerArcs == [v4 numFiniteStateTransducerArcs])
    {
      $158CE04404E577B8922D1A958EF18294 has = self->_has;
      unsigned int v14 = v4[34];
      goto LABEL_40;
    }
    goto LABEL_44;
  }
LABEL_40:
  int v31 = (*(unsigned int *)&has >> 8) & 1;
  if (v31 != ((v14 >> 8) & 1)) {
    goto LABEL_44;
  }
  if (v31)
  {
    unsigned int numFiniteStateTransducerStates = self->_numFiniteStateTransducerStates;
    if (numFiniteStateTransducerStates != [v4 numFiniteStateTransducerStates]) {
      goto LABEL_44;
    }
  }
  BOOL v33 = 1;
LABEL_45:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(DODMLASRSchemaDODMLASRModelMetrics *)self configName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
  }
  unint64_t v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    unint64_t v6 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  unint64_t v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  unint64_t v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  unint64_t v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  unint64_t v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  unint64_t v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  unint64_t v6 = v7;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    PBDataWriterWriteUint32Field();
    unint64_t v6 = v7;
  }
LABEL_14:
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRModelMetricsReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteNumFiniteStateTransducerStates
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasNumFiniteStateTransducerStates:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumFiniteStateTransducerStates
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumFiniteStateTransducerStates:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int numFiniteStateTransducerStates = a3;
}

- (void)deleteNumFiniteStateTransducerArcs
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasNumFiniteStateTransducerArcs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumFiniteStateTransducerArcs
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumFiniteStateTransducerArcs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int numFiniteStateTransducerArcs = a3;
}

- (void)deleteModelTrainingStatusCode
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasModelTrainingStatusCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasModelTrainingStatusCode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setModelTrainingStatusCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int modelTrainingStatusCode = a3;
}

- (void)deleteResidualAdaptationWeight
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasResidualAdaptationWeight:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasResidualAdaptationWeight
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setResidualAdaptationWeight:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_float residualAdaptationWeight = a3;
}

- (void)deleteNgramOrder
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasNgramOrder:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNgramOrder
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNgramOrder:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int ngramOrder = a3;
}

- (void)deleteTotalDurationInMs
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasTotalDurationInMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTotalDurationInMs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTotalDurationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unint64_t totalDurationInMs = a3;
}

- (void)deleteOptimizationDurationInMs
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasOptimizationDurationInMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasOptimizationDurationInMs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setOptimizationDurationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unint64_t optimizationDurationInMs = a3;
}

- (void)deleteConversionDurationInMs
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasConversionDurationInMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConversionDurationInMs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setConversionDurationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unint64_t conversionDurationInMs = a3;
}

- (void)deleteTrainingDurationInMs
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasTrainingDurationInMs:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTrainingDurationInMs
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTrainingDurationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unint64_t trainingDurationInMs = a3;
}

- (void)deleteConfigName
{
}

- (BOOL)hasConfigName
{
  return self->_configName != 0;
}

@end