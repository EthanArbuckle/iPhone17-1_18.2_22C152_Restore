@interface RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived
- (BOOL)hasSyncTokenFetchRequestTransferLatencyInMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived)initWithDictionary:(id)a3;
- (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)syncTokenFetchRequestTransferLatencyInMs;
- (void)deleteSyncTokenFetchRequestTransferLatencyInMs;
- (void)setHasSyncTokenFetchRequestTransferLatencyInMs:(BOOL)a3;
- (void)setSyncTokenFetchRequestTransferLatencyInMs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)syncTokenFetchRequestTransferLatencyInMs
{
  return self->_syncTokenFetchRequestTransferLatencyInMs;
}

- (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived;
  v5 = [(RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"syncTokenFetchRequestTransferLatencyInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived setSyncTokenFetchRequestTransferLatencyInMs:](v5, "setSyncTokenFetchRequestTransferLatencyInMs:", [v6 unsignedLongLongValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived syncTokenFetchRequestTransferLatencyInMs](self, "syncTokenFetchRequestTransferLatencyInMs"));
    [v3 setObject:v4 forKeyedSubscript:@"syncTokenFetchRequestTransferLatencyInMs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_syncTokenFetchRequestTransferLatencyInMs;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[16] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (unint64_t syncTokenFetchRequestTransferLatencyInMs = self->_syncTokenFetchRequestTransferLatencyInMs,
            syncTokenFetchRequestTransferLatencyInMs == [v4 syncTokenFetchRequestTransferLatencyInMs]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceivedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSyncTokenFetchRequestTransferLatencyInMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSyncTokenFetchRequestTransferLatencyInMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSyncTokenFetchRequestTransferLatencyInMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSyncTokenFetchRequestTransferLatencyInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t syncTokenFetchRequestTransferLatencyInMs = a3;
}

@end