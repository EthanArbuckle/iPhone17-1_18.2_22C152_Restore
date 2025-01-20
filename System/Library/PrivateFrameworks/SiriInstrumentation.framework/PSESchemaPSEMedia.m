@interface PSESchemaPSEMedia
- (BOOL)hasLastMediaUserFollowupAction;
- (BOOL)hasMediaContentDurationBucket;
- (BOOL)hasPlayDurationInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PSESchemaPSEMedia)initWithDictionary:(id)a3;
- (PSESchemaPSEMedia)initWithJSON:(id)a3;
- (PSESchemaPSEMediaUserFollowupAction)lastMediaUserFollowupAction;
- (double)playDurationInSeconds;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mediaContentDurationBucket;
- (unint64_t)hash;
- (void)deleteLastMediaUserFollowupAction;
- (void)deleteMediaContentDurationBucket;
- (void)deletePlayDurationInSeconds;
- (void)setHasLastMediaUserFollowupAction:(BOOL)a3;
- (void)setHasMediaContentDurationBucket:(BOOL)a3;
- (void)setHasPlayDurationInSeconds:(BOOL)a3;
- (void)setLastMediaUserFollowupAction:(id)a3;
- (void)setMediaContentDurationBucket:(int)a3;
- (void)setPlayDurationInSeconds:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSESchemaPSEMedia

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSESchemaPSEMedia;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PSESchemaPSEMedia *)self lastMediaUserFollowupAction];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PSESchemaPSEMedia *)self deleteLastMediaUserFollowupAction];
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

- (void)setHasLastMediaUserFollowupAction:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLastMediaUserFollowupAction:(id)a3
{
}

- (PSESchemaPSEMediaUserFollowupAction)lastMediaUserFollowupAction
{
  return self->_lastMediaUserFollowupAction;
}

- (int)mediaContentDurationBucket
{
  return self->_mediaContentDurationBucket;
}

- (double)playDurationInSeconds
{
  return self->_playDurationInSeconds;
}

- (PSESchemaPSEMedia)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSESchemaPSEMedia;
  v5 = [(PSESchemaPSEMedia *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"playDurationInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[PSESchemaPSEMedia setPlayDurationInSeconds:](v5, "setPlayDurationInSeconds:");
    }
    v7 = [v4 objectForKeyedSubscript:@"mediaContentDurationBucket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEMedia setMediaContentDurationBucket:](v5, "setMediaContentDurationBucket:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"lastMediaUserFollowupAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[PSESchemaPSEMediaUserFollowupAction alloc] initWithDictionary:v8];
      [(PSESchemaPSEMedia *)v5 setLastMediaUserFollowupAction:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PSESchemaPSEMedia)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PSESchemaPSEMedia *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PSESchemaPSEMedia *)self dictionaryRepresentation];
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
  if (self->_lastMediaUserFollowupAction)
  {
    id v4 = [(PSESchemaPSEMedia *)self lastMediaUserFollowupAction];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"lastMediaUserFollowupAction"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"lastMediaUserFollowupAction"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v8 = [(PSESchemaPSEMedia *)self mediaContentDurationBucket] - 1;
    if (v8 > 0x10) {
      objc_super v9 = @"PSEMEDIACONTENTDURATIONBUCKET_UNKNOWN";
    }
    else {
      objc_super v9 = off_1E5EBB148[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"mediaContentDurationBucket"];
    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = NSNumber;
    [(PSESchemaPSEMedia *)self playDurationInSeconds];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v11 forKeyedSubscript:@"playDurationInSeconds"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double playDurationInSeconds = self->_playDurationInSeconds;
    double v6 = -playDurationInSeconds;
    if (playDurationInSeconds >= 0.0) {
      double v6 = self->_playDurationInSeconds;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_mediaContentDurationBucket;
  }
  else {
    uint64_t v9 = 0;
  }
  return v9 ^ v4 ^ [(PSESchemaPSEMediaUserFollowupAction *)self->_lastMediaUserFollowupAction hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $31CD8F6DA8113E2119A665221936E225 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    double playDurationInSeconds = self->_playDurationInSeconds;
    [v4 playDurationInSeconds];
    if (playDurationInSeconds != v8) {
      goto LABEL_14;
    }
    $31CD8F6DA8113E2119A665221936E225 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (!v9
      || (int mediaContentDurationBucket = self->_mediaContentDurationBucket,
          mediaContentDurationBucket == [v4 mediaContentDurationBucket]))
    {
      v11 = [(PSESchemaPSEMedia *)self lastMediaUserFollowupAction];
      objc_super v12 = [v4 lastMediaUserFollowupAction];
      v13 = v12;
      if ((v11 == 0) != (v12 != 0))
      {
        uint64_t v14 = [(PSESchemaPSEMedia *)self lastMediaUserFollowupAction];
        if (!v14)
        {

LABEL_17:
          BOOL v19 = 1;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        v16 = [(PSESchemaPSEMedia *)self lastMediaUserFollowupAction];
        v17 = [v4 lastMediaUserFollowupAction];
        char v18 = [v16 isEqual:v17];

        if (v18) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(PSESchemaPSEMedia *)self lastMediaUserFollowupAction];

  unsigned int v6 = v8;
  if (v5)
  {
    long double v7 = [(PSESchemaPSEMedia *)self lastMediaUserFollowupAction];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEMediaReadFrom(self, (uint64_t)a3);
}

- (void)deleteLastMediaUserFollowupAction
{
}

- (BOOL)hasLastMediaUserFollowupAction
{
  return self->_lastMediaUserFollowupAction != 0;
}

- (void)deleteMediaContentDurationBucket
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMediaContentDurationBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMediaContentDurationBucket
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMediaContentDurationBucket:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int mediaContentDurationBucket = a3;
}

- (void)deletePlayDurationInSeconds
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPlayDurationInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlayDurationInSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPlayDurationInSeconds:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double playDurationInSeconds = a3;
}

@end