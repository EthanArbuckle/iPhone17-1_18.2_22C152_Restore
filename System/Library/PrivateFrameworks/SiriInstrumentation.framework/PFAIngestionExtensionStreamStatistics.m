@interface PFAIngestionExtensionStreamStatistics
- (BOOL)hasPostProcessingCount;
- (BOOL)hasPreProcessingCount;
- (BOOL)hasStreamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PFAIngestionExtensionStreamStatistics)initWithDictionary:(id)a3;
- (PFAIngestionExtensionStreamStatistics)initWithJSON:(id)a3;
- (SISchemaUUID)streamId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)postProcessingCount;
- (unsigned)preProcessingCount;
- (void)deletePostProcessingCount;
- (void)deletePreProcessingCount;
- (void)deleteStreamId;
- (void)setHasPostProcessingCount:(BOOL)a3;
- (void)setHasPreProcessingCount:(BOOL)a3;
- (void)setHasStreamId:(BOOL)a3;
- (void)setPostProcessingCount:(unsigned int)a3;
- (void)setPreProcessingCount:(unsigned int)a3;
- (void)setStreamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAIngestionExtensionStreamStatistics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PFAIngestionExtensionStreamStatistics;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PFAIngestionExtensionStreamStatistics *)self streamId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PFAIngestionExtensionStreamStatistics *)self deleteStreamId];
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
}

- (void)setHasStreamId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)postProcessingCount
{
  return self->_postProcessingCount;
}

- (unsigned)preProcessingCount
{
  return self->_preProcessingCount;
}

- (void)setStreamId:(id)a3
{
}

- (SISchemaUUID)streamId
{
  return self->_streamId;
}

- (PFAIngestionExtensionStreamStatistics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFAIngestionExtensionStreamStatistics;
  v5 = [(PFAIngestionExtensionStreamStatistics *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"streamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PFAIngestionExtensionStreamStatistics *)v5 setStreamId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"preProcessingCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAIngestionExtensionStreamStatistics setPreProcessingCount:](v5, "setPreProcessingCount:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"postProcessingCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAIngestionExtensionStreamStatistics setPostProcessingCount:](v5, "setPostProcessingCount:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (PFAIngestionExtensionStreamStatistics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAIngestionExtensionStreamStatistics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAIngestionExtensionStreamStatistics *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFAIngestionExtensionStreamStatistics postProcessingCount](self, "postProcessingCount"));
    [v3 setObject:v5 forKeyedSubscript:@"postProcessingCount"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFAIngestionExtensionStreamStatistics preProcessingCount](self, "preProcessingCount"));
    [v3 setObject:v6 forKeyedSubscript:@"preProcessingCount"];
  }
  if (self->_streamId)
  {
    uint64_t v7 = [(PFAIngestionExtensionStreamStatistics *)self streamId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"streamId"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"streamId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_streamId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_preProcessingCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_postProcessingCount;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(PFAIngestionExtensionStreamStatistics *)self streamId];
  v6 = [v4 streamId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(PFAIngestionExtensionStreamStatistics *)self streamId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(PFAIngestionExtensionStreamStatistics *)self streamId];
    v11 = [v4 streamId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $6836BB5E57BC0055E017C1CCAC205017 has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int preProcessingCount = self->_preProcessingCount;
    if (preProcessingCount == [v4 preProcessingCount])
    {
      $6836BB5E57BC0055E017C1CCAC205017 has = self->_has;
      unsigned int v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    unsigned int postProcessingCount = self->_postProcessingCount;
    if (postProcessingCount != [v4 postProcessingCount]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(PFAIngestionExtensionStreamStatistics *)self streamId];

  if (v4)
  {
    uint64_t v5 = [(PFAIngestionExtensionStreamStatistics *)self streamId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAIngestionExtensionStreamStatisticsReadFrom(self, (uint64_t)a3);
}

- (void)deletePostProcessingCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPostProcessingCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPostProcessingCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPostProcessingCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int postProcessingCount = a3;
}

- (void)deletePreProcessingCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPreProcessingCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPreProcessingCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPreProcessingCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int preProcessingCount = a3;
}

- (void)deleteStreamId
{
}

- (BOOL)hasStreamId
{
  return self->_streamId != 0;
}

@end