@interface READSchemaREADPlaybackSessionEnded
- (BOOL)hasPlayedAudioDuration;
- (BOOL)hasTotalDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (READSchemaREADPlaybackSessionEnded)initWithDictionary:(id)a3;
- (READSchemaREADPlaybackSessionEnded)initWithJSON:(id)a3;
- (float)playedAudioDuration;
- (float)totalDuration;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deletePlayedAudioDuration;
- (void)deleteTotalDuration;
- (void)setHasPlayedAudioDuration:(BOOL)a3;
- (void)setHasTotalDuration:(BOOL)a3;
- (void)setPlayedAudioDuration:(float)a3;
- (void)setTotalDuration:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation READSchemaREADPlaybackSessionEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)totalDuration
{
  return self->_totalDuration;
}

- (float)playedAudioDuration
{
  return self->_playedAudioDuration;
}

- (READSchemaREADPlaybackSessionEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)READSchemaREADPlaybackSessionEnded;
  v5 = [(READSchemaREADPlaybackSessionEnded *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"playedAudioDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[READSchemaREADPlaybackSessionEnded setPlayedAudioDuration:](v5, "setPlayedAudioDuration:");
    }
    v7 = [v4 objectForKeyedSubscript:@"totalDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[READSchemaREADPlaybackSessionEnded setTotalDuration:](v5, "setTotalDuration:");
    }
    v8 = v5;
  }
  return v5;
}

- (READSchemaREADPlaybackSessionEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(READSchemaREADPlaybackSessionEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(READSchemaREADPlaybackSessionEnded *)self dictionaryRepresentation];
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
    v5 = NSNumber;
    [(READSchemaREADPlaybackSessionEnded *)self playedAudioDuration];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"playedAudioDuration"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v7 = NSNumber;
    [(READSchemaREADPlaybackSessionEnded *)self totalDuration];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"totalDuration"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float playedAudioDuration = self->_playedAudioDuration;
    double v6 = playedAudioDuration;
    if (playedAudioDuration < 0.0) {
      double v6 = -playedAudioDuration;
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
  if ((has & 2) != 0)
  {
    float totalDuration = self->_totalDuration;
    double v11 = totalDuration;
    if (totalDuration < 0.0) {
      double v11 = -totalDuration;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  return v9 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  $4B2B0BBA220A41DCC22103D5698184C9 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    float playedAudioDuration = self->_playedAudioDuration;
    [v4 playedAudioDuration];
    if (playedAudioDuration != v8) {
      goto LABEL_9;
    }
    $4B2B0BBA220A41DCC22103D5698184C9 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (!v9 || (float totalDuration = self->_totalDuration, [v4 totalDuration], totalDuration == v11))
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v12 = 0;
LABEL_10:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return READSchemaREADPlaybackSessionEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteTotalDuration
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTotalDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalDuration:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float totalDuration = a3;
}

- (void)deletePlayedAudioDuration
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPlayedAudioDuration:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlayedAudioDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPlayedAudioDuration:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float playedAudioDuration = a3;
}

@end