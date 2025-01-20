@interface RSSSchemaRSSSiriVocabSyncTokenReceived
- (BOOL)hasReason;
- (BOOL)hasSyncTokenTransferLatencyInMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RSSSchemaRSSSiriVocabSyncTokenReceived)initWithDictionary:(id)a3;
- (RSSSchemaRSSSiriVocabSyncTokenReceived)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (unint64_t)hash;
- (unint64_t)syncTokenTransferLatencyInMs;
- (void)deleteReason;
- (void)deleteSyncTokenTransferLatencyInMs;
- (void)setHasReason:(BOOL)a3;
- (void)setHasSyncTokenTransferLatencyInMs:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)setSyncTokenTransferLatencyInMs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation RSSSchemaRSSSiriVocabSyncTokenReceived

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)syncTokenTransferLatencyInMs
{
  return self->_syncTokenTransferLatencyInMs;
}

- (int)reason
{
  return self->_reason;
}

- (RSSSchemaRSSSiriVocabSyncTokenReceived)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RSSSchemaRSSSiriVocabSyncTokenReceived;
  v5 = [(RSSSchemaRSSSiriVocabSyncTokenReceived *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RSSSchemaRSSSiriVocabSyncTokenReceived setReason:](v5, "setReason:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"syncTokenTransferLatencyInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RSSSchemaRSSSiriVocabSyncTokenReceived setSyncTokenTransferLatencyInMs:](v5, "setSyncTokenTransferLatencyInMs:", [v7 unsignedLongLongValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (RSSSchemaRSSSiriVocabSyncTokenReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RSSSchemaRSSSiriVocabSyncTokenReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RSSSchemaRSSSiriVocabSyncTokenReceived *)self dictionaryRepresentation];
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
  if (has)
  {
    unsigned int v5 = [(RSSSchemaRSSSiriVocabSyncTokenReceived *)self reason] - 1;
    if (v5 > 2) {
      v6 = @"RSSSIRIVOCABSYNCDATATOKENTRANSFERREASON_UNKNOWN";
    }
    else {
      v6 = off_1E5EB4BC0[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"reason"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RSSSchemaRSSSiriVocabSyncTokenReceived syncTokenTransferLatencyInMs](self, "syncTokenTransferLatencyInMs"));
    [v3 setObject:v7 forKeyedSubscript:@"syncTokenTransferLatencyInMs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_reason;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_syncTokenTransferLatencyInMs;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $392C13C50E3A86E29C5F670940F0EF99 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int reason = self->_reason;
    if (reason != [v4 reason])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $392C13C50E3A86E29C5F670940F0EF99 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unint64_t syncTokenTransferLatencyInMs = self->_syncTokenTransferLatencyInMs;
    if (syncTokenTransferLatencyInMs != [v4 syncTokenTransferLatencyInMs]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RSSSchemaRSSSiriVocabSyncTokenReceivedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSyncTokenTransferLatencyInMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSyncTokenTransferLatencyInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSyncTokenTransferLatencyInMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSyncTokenTransferLatencyInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t syncTokenTransferLatencyInMs = a3;
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int reason = a3;
}

@end