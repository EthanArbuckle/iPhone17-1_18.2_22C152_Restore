@interface INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated
- (BOOL)hasIndependentSignal;
- (BOOL)hasPlayOnThirdPartyAppSignals;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated)playOnThirdPartyAppSignals;
- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals)independentSignal;
- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated)initWithJSON:(id)a3;
- (NSArray)dependentSignals;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dependentSignalsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)dependentSignalsCount;
- (unint64_t)hash;
- (void)addDependentSignals:(id)a3;
- (void)clearDependentSignals;
- (void)deleteIndependentSignal;
- (void)deletePlayOnThirdPartyAppSignals;
- (void)setDependentSignals:(id)a3;
- (void)setHasIndependentSignal:(BOOL)a3;
- (void)setHasPlayOnThirdPartyAppSignals:(BOOL)a3;
- (void)setIndependentSignal:(id)a3;
- (void)setPlayOnThirdPartyAppSignals:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self playOnThirdPartyAppSignals];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self deletePlayOnThirdPartyAppSignals];
  }
  v9 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self independentSignal];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self deleteIndependentSignal];
  }
  v12 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self dependentSignals];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self setDependentSignals:v13];

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
  objc_storeStrong((id *)&self->_dependentSignals, 0);
  objc_storeStrong((id *)&self->_independentSignal, 0);
  objc_storeStrong((id *)&self->_playOnThirdPartyAppSignals, 0);
}

- (void)setHasIndependentSignal:(BOOL)a3
{
  self->_hasIndependentSignal = a3;
}

- (void)setHasPlayOnThirdPartyAppSignals:(BOOL)a3
{
  self->_hasPlayOnThirdPartyAppSignals = a3;
}

- (void)setDependentSignals:(id)a3
{
}

- (NSArray)dependentSignals
{
  return self->_dependentSignals;
}

- (void)setIndependentSignal:(id)a3
{
}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals)independentSignal
{
  return self->_independentSignal;
}

- (void)setPlayOnThirdPartyAppSignals:(id)a3
{
}

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated)playOnThirdPartyAppSignals
{
  return self->_playOnThirdPartyAppSignals;
}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated;
  v5 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"playOnThirdPartyAppSignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)v5 setPlayOnThirdPartyAppSignals:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"independentSignal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals alloc] initWithDictionary:v8];
      [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)v5 setIndependentSignal:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"dependentSignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v8;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationDependentSignals alloc] initWithDictionary:v16];
              [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)v5 addDependentSignals:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v13);
      }

      int v8 = v20;
    }
    v18 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_dependentSignals count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v5 = self->_dependentSignals;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            id v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"dependentSignals"];
  }
  if (self->_independentSignal)
  {
    uint64_t v12 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self independentSignal];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"independentSignal"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"independentSignal"];
    }
  }
  if (self->_playOnThirdPartyAppSignals)
  {
    objc_super v15 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self playOnThirdPartyAppSignals];
    uint64_t v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"playOnThirdPartyAppSignals"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"playOnThirdPartyAppSignals"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *)self->_playOnThirdPartyAppSignals hash];
  unint64_t v4 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self->_independentSignal hash] ^ v3;
  return v4 ^ [(NSArray *)self->_dependentSignals hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self playOnThirdPartyAppSignals];
  uint64_t v6 = [v4 playOnThirdPartyAppSignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self playOnThirdPartyAppSignals];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self playOnThirdPartyAppSignals];
    v10 = [v4 playOnThirdPartyAppSignals];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self independentSignal];
  uint64_t v6 = [v4 independentSignal];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self independentSignal];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self independentSignal];
    objc_super v15 = [v4 independentSignal];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self dependentSignals];
  uint64_t v6 = [v4 dependentSignals];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self dependentSignals];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self dependentSignals];
    long long v20 = [v4 dependentSignals];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self playOnThirdPartyAppSignals];

  if (v5)
  {
    uint64_t v6 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self playOnThirdPartyAppSignals];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self independentSignal];

  if (v7)
  {
    uint64_t v8 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)self independentSignal];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_dependentSignals;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGeneratedReadFrom(self, (uint64_t)a3);
}

- (id)dependentSignalsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_dependentSignals objectAtIndexedSubscript:a3];
}

- (unint64_t)dependentSignalsCount
{
  return [(NSArray *)self->_dependentSignals count];
}

- (void)addDependentSignals:(id)a3
{
  id v4 = a3;
  dependentSignals = self->_dependentSignals;
  id v8 = v4;
  if (!dependentSignals)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_dependentSignals;
    self->_dependentSignals = v6;

    id v4 = v8;
    dependentSignals = self->_dependentSignals;
  }
  [(NSArray *)dependentSignals addObject:v4];
}

- (void)clearDependentSignals
{
}

- (void)deleteIndependentSignal
{
}

- (BOOL)hasIndependentSignal
{
  return self->_independentSignal != 0;
}

- (void)deletePlayOnThirdPartyAppSignals
{
}

- (BOOL)hasPlayOnThirdPartyAppSignals
{
  return self->_playOnThirdPartyAppSignals != 0;
}

@end