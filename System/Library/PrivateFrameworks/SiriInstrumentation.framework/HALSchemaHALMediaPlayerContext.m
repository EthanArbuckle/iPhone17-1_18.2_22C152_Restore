@interface HALSchemaHALMediaPlayerContext
- (BOOL)hasState;
- (BOOL)hasTimeSinceLastMediaPlaybackInSeconds;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HALSchemaHALMediaPlayerContext)initWithDictionary:(id)a3;
- (HALSchemaHALMediaPlayerContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)state;
- (int)type;
- (unint64_t)hash;
- (unsigned)timeSinceLastMediaPlaybackInSeconds;
- (void)deleteState;
- (void)deleteTimeSinceLastMediaPlaybackInSeconds;
- (void)deleteType;
- (void)setHasState:(BOOL)a3;
- (void)setHasTimeSinceLastMediaPlaybackInSeconds:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setTimeSinceLastMediaPlaybackInSeconds:(unsigned int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HALSchemaHALMediaPlayerContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)timeSinceLastMediaPlaybackInSeconds
{
  return self->_timeSinceLastMediaPlaybackInSeconds;
}

- (int)type
{
  return self->_type;
}

- (int)state
{
  return self->_state;
}

- (HALSchemaHALMediaPlayerContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HALSchemaHALMediaPlayerContext;
  v5 = [(HALSchemaHALMediaPlayerContext *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"state"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALMediaPlayerContext setState:](v5, "setState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALMediaPlayerContext setType:](v5, "setType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"timeSinceLastMediaPlaybackInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALMediaPlayerContext setTimeSinceLastMediaPlaybackInSeconds:](v5, "setTimeSinceLastMediaPlaybackInSeconds:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (HALSchemaHALMediaPlayerContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(HALSchemaHALMediaPlayerContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HALSchemaHALMediaPlayerContext *)self dictionaryRepresentation];
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
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HALSchemaHALMediaPlayerContext timeSinceLastMediaPlaybackInSeconds](self, "timeSinceLastMediaPlaybackInSeconds"));
    [v3 setObject:v7 forKeyedSubscript:@"timeSinceLastMediaPlaybackInSeconds"];

    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_14;
    }
LABEL_10:
    unsigned int v8 = [(HALSchemaHALMediaPlayerContext *)self type] - 1;
    if (v8 > 0x1B) {
      v9 = @"FLOWMEDIATYPE_UNKNOWN";
    }
    else {
      v9 = off_1E5EB0B20[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"type"];
    goto LABEL_14;
  }
  unsigned int v5 = [(HALSchemaHALMediaPlayerContext *)self state] - 1;
  if (v5 > 5) {
    v6 = @"HALMEDIAPLAYERSTATE_UNKNOWN";
  }
  else {
    v6 = off_1E5EB0AF0[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"state"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_3:
  if ((has & 2) != 0) {
    goto LABEL_10;
  }
LABEL_14:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_state;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_timeSinceLastMediaPlaybackInSeconds;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $38BB1AD574BD190F97100C1A7C8D0EDD has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int state = self->_state;
    if (state != [v4 state]) {
      goto LABEL_14;
    }
    $38BB1AD574BD190F97100C1A7C8D0EDD has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int type = self->_type;
    if (type == [v4 type])
    {
      $38BB1AD574BD190F97100C1A7C8D0EDD has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    unsigned int timeSinceLastMediaPlaybackInSeconds = self->_timeSinceLastMediaPlaybackInSeconds;
    if (timeSinceLastMediaPlaybackInSeconds != [v4 timeSinceLastMediaPlaybackInSeconds]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALMediaPlayerContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteTimeSinceLastMediaPlaybackInSeconds
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasTimeSinceLastMediaPlaybackInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimeSinceLastMediaPlaybackInSeconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimeSinceLastMediaPlaybackInSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int timeSinceLastMediaPlaybackInSeconds = a3;
}

- (void)deleteType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int type = a3;
}

- (void)deleteState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int state = a3;
}

@end