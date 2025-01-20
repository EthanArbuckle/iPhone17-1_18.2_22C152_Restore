@interface TTMSchemaTTMNeuralCombinerRequestEnded
- (BOOL)hasAsset;
- (BOOL)hasMitigationAssetVersion;
- (BOOL)hasNeuralCombinerThreshold;
- (BOOL)hasSpeakerIdThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)results;
- (NSData)jsonData;
- (NSString)mitigationAssetVersion;
- (SISchemaAsset)asset;
- (TTMSchemaTTMNeuralCombinerRequestEnded)initWithDictionary:(id)a3;
- (TTMSchemaTTMNeuralCombinerRequestEnded)initWithJSON:(id)a3;
- (float)neuralCombinerThreshold;
- (float)speakerIdThreshold;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)resultsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)resultsCount;
- (void)addResults:(id)a3;
- (void)clearResults;
- (void)deleteAsset;
- (void)deleteMitigationAssetVersion;
- (void)deleteNeuralCombinerThreshold;
- (void)deleteSpeakerIdThreshold;
- (void)setAsset:(id)a3;
- (void)setHasAsset:(BOOL)a3;
- (void)setHasMitigationAssetVersion:(BOOL)a3;
- (void)setHasNeuralCombinerThreshold:(BOOL)a3;
- (void)setHasSpeakerIdThreshold:(BOOL)a3;
- (void)setMitigationAssetVersion:(id)a3;
- (void)setNeuralCombinerThreshold:(float)a3;
- (void)setResults:(id)a3;
- (void)setSpeakerIdThreshold:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTMSchemaTTMNeuralCombinerRequestEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TTMSchemaTTMNeuralCombinerRequestEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self results];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(TTMSchemaTTMNeuralCombinerRequestEnded *)self setResults:v7];

  v8 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self asset];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(TTMSchemaTTMNeuralCombinerRequestEnded *)self deleteAsset];
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
  objc_storeStrong((id *)&self->_mitigationAssetVersion, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)setHasMitigationAssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAsset:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)speakerIdThreshold
{
  return self->_speakerIdThreshold;
}

- (void)setMitigationAssetVersion:(id)a3
{
}

- (NSString)mitigationAssetVersion
{
  return self->_mitigationAssetVersion;
}

- (float)neuralCombinerThreshold
{
  return self->_neuralCombinerThreshold;
}

- (void)setAsset:(id)a3
{
}

- (SISchemaAsset)asset
{
  return self->_asset;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (TTMSchemaTTMNeuralCombinerRequestEnded)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TTMSchemaTTMNeuralCombinerRequestEnded;
  v5 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"results"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [TTMSchemaTTMNeuralCombinerTCUResult alloc];
              v14 = -[TTMSchemaTTMNeuralCombinerTCUResult initWithDictionary:](v13, "initWithDictionary:", v12, (void)v23);
              [(TTMSchemaTTMNeuralCombinerRequestEnded *)v5 addResults:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"asset", (void)v23);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaAsset alloc] initWithDictionary:v15];
      [(TTMSchemaTTMNeuralCombinerRequestEnded *)v5 setAsset:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"neuralCombinerThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 floatValue];
      -[TTMSchemaTTMNeuralCombinerRequestEnded setNeuralCombinerThreshold:](v5, "setNeuralCombinerThreshold:");
    }
    v18 = [v4 objectForKeyedSubscript:@"mitigationAssetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(TTMSchemaTTMNeuralCombinerRequestEnded *)v5 setMitigationAssetVersion:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"speakerIdThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      -[TTMSchemaTTMNeuralCombinerRequestEnded setSpeakerIdThreshold:](v5, "setSpeakerIdThreshold:");
    }
    v21 = v5;
  }
  return v5;
}

- (TTMSchemaTTMNeuralCombinerRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self dictionaryRepresentation];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_asset)
  {
    id v4 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self asset];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"asset"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"asset"];
    }
  }
  if (self->_mitigationAssetVersion)
  {
    uint64_t v7 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self mitigationAssetVersion];
    uint64_t v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"mitigationAssetVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v9 = NSNumber;
    [(TTMSchemaTTMNeuralCombinerRequestEnded *)self neuralCombinerThreshold];
    uint64_t v10 = objc_msgSend(v9, "numberWithFloat:");
    [v3 setObject:v10 forKeyedSubscript:@"neuralCombinerThreshold"];
  }
  if ([(NSArray *)self->_results count])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = self->_results;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          if (v17)
          {
            [v11 addObject:v17];
          }
          else
          {
            v18 = [MEMORY[0x1E4F1CA98] null];
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"results"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v19 = NSNumber;
    [(TTMSchemaTTMNeuralCombinerRequestEnded *)self speakerIdThreshold];
    v20 = objc_msgSend(v19, "numberWithFloat:");
    [v3 setObject:v20 forKeyedSubscript:@"speakerIdThreshold"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_results hash];
  unint64_t v4 = [(SISchemaAsset *)self->_asset hash];
  if (*(unsigned char *)&self->_has)
  {
    float neuralCombinerThreshold = self->_neuralCombinerThreshold;
    double v7 = neuralCombinerThreshold;
    if (neuralCombinerThreshold < 0.0) {
      double v7 = -neuralCombinerThreshold;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_mitigationAssetVersion hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    float speakerIdThreshold = self->_speakerIdThreshold;
    double v13 = speakerIdThreshold;
    if (speakerIdThreshold < 0.0) {
      double v13 = -speakerIdThreshold;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t v5 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self results];
  v6 = [v4 results];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self results];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self results];
    NSUInteger v10 = [v4 results];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unint64_t v5 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self asset];
  v6 = [v4 asset];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self asset];
  if (v12)
  {
    double v13 = (void *)v12;
    long double v14 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self asset];
    double v15 = [v4 asset];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[44] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    float neuralCombinerThreshold = self->_neuralCombinerThreshold;
    [v4 neuralCombinerThreshold];
    if (neuralCombinerThreshold != v18) {
      goto LABEL_20;
    }
  }
  unint64_t v5 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self mitigationAssetVersion];
  v6 = [v4 mitigationAssetVersion];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v19 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self mitigationAssetVersion];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self mitigationAssetVersion];
    long long v22 = [v4 mitigationAssetVersion];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  int v26 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v26 == ((v4[44] >> 1) & 1))
  {
    if (!v26
      || (float speakerIdThreshold = self->_speakerIdThreshold,
          [v4 speakerIdThreshold],
          speakerIdThreshold == v28))
    {
      BOOL v24 = 1;
      goto LABEL_21;
    }
  }
LABEL_20:
  BOOL v24 = 0;
LABEL_21:

  return v24;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = self->_results;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  NSUInteger v10 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self asset];

  if (v10)
  {
    int v11 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self asset];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
  uint64_t v12 = [(TTMSchemaTTMNeuralCombinerRequestEnded *)self mitigationAssetVersion];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTMSchemaTTMNeuralCombinerRequestEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteSpeakerIdThreshold
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSpeakerIdThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSpeakerIdThreshold
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSpeakerIdThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float speakerIdThreshold = a3;
}

- (void)deleteMitigationAssetVersion
{
}

- (BOOL)hasMitigationAssetVersion
{
  return self->_mitigationAssetVersion != 0;
}

- (void)deleteNeuralCombinerThreshold
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNeuralCombinerThreshold:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNeuralCombinerThreshold
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNeuralCombinerThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float neuralCombinerThreshold = a3;
}

- (void)deleteAsset
{
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_results objectAtIndexedSubscript:a3];
}

- (unint64_t)resultsCount
{
  return [(NSArray *)self->_results count];
}

- (void)addResults:(id)a3
{
  id v4 = a3;
  results = self->_results;
  id v8 = v4;
  if (!results)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_results;
    self->_results = v6;

    id v4 = v8;
    results = self->_results;
  }
  [(NSArray *)results addObject:v4];
}

- (void)clearResults
{
}

@end