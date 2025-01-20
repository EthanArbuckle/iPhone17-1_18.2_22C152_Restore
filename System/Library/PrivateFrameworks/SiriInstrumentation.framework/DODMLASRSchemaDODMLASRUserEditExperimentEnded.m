@interface DODMLASRSchemaDODMLASRUserEditExperimentEnded
- (BOOL)hasErrorCode;
- (BOOL)hasLinkId;
- (BOOL)hasNumAudioFilesAvailable;
- (BOOL)hasNumAudioFilesSelected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRUserEditExperimentEnded)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRUserEditExperimentEnded)initWithJSON:(id)a3;
- (NSArray)redecodingResults;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)redecodingResultsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (unint64_t)hash;
- (unint64_t)redecodingResultsCount;
- (unsigned)numAudioFilesAvailable;
- (unsigned)numAudioFilesSelected;
- (void)addRedecodingResults:(id)a3;
- (void)clearRedecodingResults;
- (void)deleteErrorCode;
- (void)deleteLinkId;
- (void)deleteNumAudioFilesAvailable;
- (void)deleteNumAudioFilesSelected;
- (void)setErrorCode:(int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasNumAudioFilesAvailable:(BOOL)a3;
- (void)setHasNumAudioFilesSelected:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setNumAudioFilesAvailable:(unsigned int)a3;
- (void)setNumAudioFilesSelected:(unsigned int)a3;
- (void)setRedecodingResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRUserEditExperimentEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DODMLASRSchemaDODMLASRUserEditExperimentEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self redecodingResults];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self setRedecodingResults:v7];

  v8 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self linkId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_redecodingResults, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (unsigned)numAudioFilesSelected
{
  return self->_numAudioFilesSelected;
}

- (unsigned)numAudioFilesAvailable
{
  return self->_numAudioFilesAvailable;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setRedecodingResults:(id)a3
{
}

- (NSArray)redecodingResults
{
  return self->_redecodingResults;
}

- (DODMLASRSchemaDODMLASRUserEditExperimentEnded)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DODMLASRSchemaDODMLASRUserEditExperimentEnded;
  v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"redecodingResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults alloc];
              v14 = -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults initWithDictionary:](v13, "initWithDictionary:", v12, (void)v22);
              [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)v5 addRedecodingResults:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"linkId", (void)v22);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)v5 setLinkId:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"numAudioFilesAvailable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setNumAudioFilesAvailable:](v5, "setNumAudioFilesAvailable:", [v17 unsignedIntValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"numAudioFilesSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setNumAudioFilesSelected:](v5, "setNumAudioFilesSelected:", [v18 unsignedIntValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setErrorCode:](v5, "setErrorCode:", [v19 intValue]);
    }
    v20 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRUserEditExperimentEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self dictionaryRepresentation];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[DODMLASRSchemaDODMLASRUserEditExperimentEnded errorCode](self, "errorCode"));
    [v3 setObject:v4 forKeyedSubscript:@"errorCode"];
  }
  if (self->_linkId)
  {
    v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self linkId];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"linkId"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"linkId"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRUserEditExperimentEnded numAudioFilesAvailable](self, "numAudioFilesAvailable"));
    [v3 setObject:v9 forKeyedSubscript:@"numAudioFilesAvailable"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRUserEditExperimentEnded numAudioFilesSelected](self, "numAudioFilesSelected"));
    [v3 setObject:v10 forKeyedSubscript:@"numAudioFilesSelected"];
  }
  if ([(NSArray *)self->_redecodingResults count])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v12 = self->_redecodingResults;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
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
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"redecodingResults"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v20);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_redecodingResults hash];
  unint64_t v4 = [(SISchemaUUID *)self->_linkId hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_numAudioFilesAvailable;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_numAudioFilesSelected;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_errorCode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self redecodingResults];
  uint64_t v6 = [v4 redecodingResults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self redecodingResults];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self redecodingResults];
    uint64_t v10 = [v4 redecodingResults];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self linkId];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self linkId];
    uint64_t v15 = [v4 linkId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $FE0B32526F39E42DA6D3F09F59B09502 has = self->_has;
  unsigned int v20 = v4[36];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      unsigned int numAudioFilesAvailable = self->_numAudioFilesAvailable;
      if (numAudioFilesAvailable != [v4 numAudioFilesAvailable]) {
        goto LABEL_12;
      }
      $FE0B32526F39E42DA6D3F09F59B09502 has = self->_has;
      unsigned int v20 = v4[36];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        unsigned int numAudioFilesSelected = self->_numAudioFilesSelected;
        if (numAudioFilesSelected != [v4 numAudioFilesSelected]) {
          goto LABEL_12;
        }
        $FE0B32526F39E42DA6D3F09F59B09502 has = self->_has;
        unsigned int v20 = v4[36];
      }
      int v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (!v24 || (int errorCode = self->_errorCode, errorCode == [v4 errorCode]))
        {
          BOOL v17 = 1;
          goto LABEL_13;
        }
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_redecodingResults;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self linkId];

  if (v10)
  {
    int v11 = [(DODMLASRSchemaDODMLASRUserEditExperimentEnded *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if ((has & 4) != 0) {
LABEL_13:
  }
    PBDataWriterWriteInt32Field();
LABEL_14:
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRUserEditExperimentEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int errorCode = a3;
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

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (id)redecodingResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_redecodingResults objectAtIndexedSubscript:a3];
}

- (unint64_t)redecodingResultsCount
{
  return [(NSArray *)self->_redecodingResults count];
}

- (void)addRedecodingResults:(id)a3
{
  id v4 = a3;
  redecodingResults = self->_redecodingResults;
  id v8 = v4;
  if (!redecodingResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_redecodingResults;
    self->_redecodingResults = v6;

    id v4 = v8;
    redecodingResults = self->_redecodingResults;
  }
  [(NSArray *)redecodingResults addObject:v4];
}

- (void)clearRedecodingResults
{
}

@end