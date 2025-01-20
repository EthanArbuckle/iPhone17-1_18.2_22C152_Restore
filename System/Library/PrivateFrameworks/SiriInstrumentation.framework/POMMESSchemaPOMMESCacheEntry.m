@interface POMMESSchemaPOMMESCacheEntry
- (BOOL)hasOrigin;
- (BOOL)hasPegasusDomain;
- (BOOL)hasSizeInBytes;
- (BOOL)hasTimeToLiveInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)pegasusDomain;
- (POMMESSchemaPOMMESCacheEntry)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESCacheEntry)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)origin;
- (unint64_t)hash;
- (unsigned)sizeInBytes;
- (unsigned)timeToLiveInSeconds;
- (void)deleteOrigin;
- (void)deletePegasusDomain;
- (void)deleteSizeInBytes;
- (void)deleteTimeToLiveInSeconds;
- (void)setHasOrigin:(BOOL)a3;
- (void)setHasPegasusDomain:(BOOL)a3;
- (void)setHasSizeInBytes:(BOOL)a3;
- (void)setHasTimeToLiveInSeconds:(BOOL)a3;
- (void)setOrigin:(int)a3;
- (void)setPegasusDomain:(id)a3;
- (void)setSizeInBytes:(unsigned int)a3;
- (void)setTimeToLiveInSeconds:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESCacheEntry

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasPegasusDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)origin
{
  return self->_origin;
}

- (unsigned)timeToLiveInSeconds
{
  return self->_timeToLiveInSeconds;
}

- (unsigned)sizeInBytes
{
  return self->_sizeInBytes;
}

- (void)setPegasusDomain:(id)a3
{
}

- (NSString)pegasusDomain
{
  return self->_pegasusDomain;
}

- (POMMESSchemaPOMMESCacheEntry)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)POMMESSchemaPOMMESCacheEntry;
  v5 = [(POMMESSchemaPOMMESCacheEntry *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pegasusDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(POMMESSchemaPOMMESCacheEntry *)v5 setPegasusDomain:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"sizeInBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheEntry setSizeInBytes:](v5, "setSizeInBytes:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"timeToLiveInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheEntry setTimeToLiveInSeconds:](v5, "setTimeToLiveInSeconds:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"origin"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheEntry setOrigin:](v5, "setOrigin:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESCacheEntry)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESCacheEntry *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESCacheEntry *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int v4 = [(POMMESSchemaPOMMESCacheEntry *)self origin];
    v5 = @"POMMESCACHEENTRYORIGIN_UNKNOWN";
    if (v4 == 1) {
      v5 = @"POMMESCACHEENTRYORIGIN_SIRI_REQUEST";
    }
    if (v4 == 2) {
      v6 = @"POMMESCACHEENTRYORIGIN_PREPOPULATION";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"origin"];
  }
  if (self->_pegasusDomain)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESCacheEntry *)self pegasusDomain];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"pegasusDomain"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheEntry sizeInBytes](self, "sizeInBytes"));
    [v3 setObject:v10 forKeyedSubscript:@"sizeInBytes"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheEntry timeToLiveInSeconds](self, "timeToLiveInSeconds"));
    [v3 setObject:v11 forKeyedSubscript:@"timeToLiveInSeconds"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_pegasusDomain hash];
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
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_sizeInBytes;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_timeToLiveInSeconds;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_origin;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(POMMESSchemaPOMMESCacheEntry *)self pegasusDomain];
  uint64_t v6 = [v4 pegasusDomain];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(POMMESSchemaPOMMESCacheEntry *)self pegasusDomain];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(POMMESSchemaPOMMESCacheEntry *)self pegasusDomain];
    v11 = [v4 pegasusDomain];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $C1AFC7298A8111C8EE7B7170865402D2 has = self->_has;
  unsigned int v14 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int sizeInBytes = self->_sizeInBytes;
    if (sizeInBytes != [v4 sizeInBytes]) {
      goto LABEL_20;
    }
    $C1AFC7298A8111C8EE7B7170865402D2 has = self->_has;
    unsigned int v14 = v4[28];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v16)
  {
    unsigned int timeToLiveInSeconds = self->_timeToLiveInSeconds;
    if (timeToLiveInSeconds == [v4 timeToLiveInSeconds])
    {
      $C1AFC7298A8111C8EE7B7170865402D2 has = self->_has;
      unsigned int v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v18)
  {
    int origin = self->_origin;
    if (origin != [v4 origin]) {
      goto LABEL_20;
    }
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(POMMESSchemaPOMMESCacheEntry *)self pegasusDomain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  uint64_t v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v7;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheEntryReadFrom(self, (uint64_t)a3);
}

- (void)deleteOrigin
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasOrigin:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOrigin
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setOrigin:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int origin = a3;
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

- (void)deleteSizeInBytes
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSizeInBytes:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSizeInBytes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSizeInBytes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int sizeInBytes = a3;
}

- (void)deletePegasusDomain
{
}

- (BOOL)hasPegasusDomain
{
  return self->_pegasusDomain != 0;
}

@end