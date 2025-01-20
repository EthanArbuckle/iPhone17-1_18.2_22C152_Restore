@interface POMMESSchemaPOMMESCacheStoringStarted
- (BOOL)hasEntry;
- (BOOL)hasResultDomain;
- (BOOL)hasResultSizeInBytes;
- (BOOL)hasTimeToLiveInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)resultDomain;
- (POMMESSchemaPOMMESCacheEntry)entry;
- (POMMESSchemaPOMMESCacheStoringStarted)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESCacheStoringStarted)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)resultSizeInBytes;
- (unsigned)timeToLiveInSeconds;
- (void)deleteEntry;
- (void)deleteResultDomain;
- (void)deleteResultSizeInBytes;
- (void)deleteTimeToLiveInSeconds;
- (void)setEntry:(id)a3;
- (void)setHasEntry:(BOOL)a3;
- (void)setHasResultDomain:(BOOL)a3;
- (void)setHasResultSizeInBytes:(BOOL)a3;
- (void)setHasTimeToLiveInSeconds:(BOOL)a3;
- (void)setResultDomain:(id)a3;
- (void)setResultSizeInBytes:(unsigned int)a3;
- (void)setTimeToLiveInSeconds:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESCacheStoringStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESCacheStoringStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESCacheStoringStarted *)self entry];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(POMMESSchemaPOMMESCacheStoringStarted *)self deleteEntry];
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
  objc_storeStrong((id *)&self->_resultDomain, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

- (void)setHasResultDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasEntry:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)timeToLiveInSeconds
{
  return self->_timeToLiveInSeconds;
}

- (unsigned)resultSizeInBytes
{
  return self->_resultSizeInBytes;
}

- (void)setResultDomain:(id)a3
{
}

- (NSString)resultDomain
{
  return self->_resultDomain;
}

- (void)setEntry:(id)a3
{
}

- (POMMESSchemaPOMMESCacheEntry)entry
{
  return self->_entry;
}

- (POMMESSchemaPOMMESCacheStoringStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)POMMESSchemaPOMMESCacheStoringStarted;
  v5 = [(POMMESSchemaPOMMESCacheStoringStarted *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"entry"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[POMMESSchemaPOMMESCacheEntry alloc] initWithDictionary:v6];
      [(POMMESSchemaPOMMESCacheStoringStarted *)v5 setEntry:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"resultDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(POMMESSchemaPOMMESCacheStoringStarted *)v5 setResultDomain:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"resultSizeInBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheStoringStarted setResultSizeInBytes:](v5, "setResultSizeInBytes:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"timeToLiveInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheStoringStarted setTimeToLiveInSeconds:](v5, "setTimeToLiveInSeconds:", [v11 unsignedIntValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESCacheStoringStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESCacheStoringStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESCacheStoringStarted *)self dictionaryRepresentation];
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
  if (self->_entry)
  {
    id v4 = [(POMMESSchemaPOMMESCacheStoringStarted *)self entry];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"entry"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"entry"];
    }
  }
  if (self->_resultDomain)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESCacheStoringStarted *)self resultDomain];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"resultDomain"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheStoringStarted resultSizeInBytes](self, "resultSizeInBytes"));
    [v3 setObject:v10 forKeyedSubscript:@"resultSizeInBytes"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheStoringStarted timeToLiveInSeconds](self, "timeToLiveInSeconds"));
    [v3 setObject:v11 forKeyedSubscript:@"timeToLiveInSeconds"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(POMMESSchemaPOMMESCacheEntry *)self->_entry hash];
  NSUInteger v4 = [(NSString *)self->_resultDomain hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_resultSizeInBytes;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_timeToLiveInSeconds;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(POMMESSchemaPOMMESCacheStoringStarted *)self entry];
  uint64_t v6 = [v4 entry];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(POMMESSchemaPOMMESCacheStoringStarted *)self entry];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(POMMESSchemaPOMMESCacheStoringStarted *)self entry];
    v10 = [v4 entry];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(POMMESSchemaPOMMESCacheStoringStarted *)self resultDomain];
  uint64_t v6 = [v4 resultDomain];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(POMMESSchemaPOMMESCacheStoringStarted *)self resultDomain];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(POMMESSchemaPOMMESCacheStoringStarted *)self resultDomain];
    v15 = [v4 resultDomain];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $1175BCAC6D36ED481810B4B170A53CD8 has = self->_has;
  unsigned int v20 = v4[32];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      unsigned int resultSizeInBytes = self->_resultSizeInBytes;
      if (resultSizeInBytes != [v4 resultSizeInBytes]) {
        goto LABEL_12;
      }
      $1175BCAC6D36ED481810B4B170A53CD8 has = self->_has;
      unsigned int v20 = v4[32];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22
        || (unsigned int timeToLiveInSeconds = self->_timeToLiveInSeconds,
            timeToLiveInSeconds == [v4 timeToLiveInSeconds]))
      {
        BOOL v17 = 1;
        goto LABEL_13;
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
  id v9 = a3;
  NSUInteger v4 = [(POMMESSchemaPOMMESCacheStoringStarted *)self entry];

  if (v4)
  {
    uint64_t v5 = [(POMMESSchemaPOMMESCacheStoringStarted *)self entry];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(POMMESSchemaPOMMESCacheStoringStarted *)self resultDomain];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  v8 = v9;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    v8 = v9;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheStoringStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteTimeToLiveInSeconds
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTimeToLiveInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimeToLiveInSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimeToLiveInSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int timeToLiveInSeconds = a3;
}

- (void)deleteResultSizeInBytes
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResultSizeInBytes:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResultSizeInBytes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResultSizeInBytes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int resultSizeInBytes = a3;
}

- (void)deleteResultDomain
{
}

- (BOOL)hasResultDomain
{
  return self->_resultDomain != 0;
}

- (void)deleteEntry
{
}

- (BOOL)hasEntry
{
  return self->_entry != 0;
}

@end