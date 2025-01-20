@interface READSchemaREADPlaybackSessionStartedOrChanged
- (BOOL)hasAudioInterface;
- (BOOL)hasCustomerPerceivedLatency;
- (BOOL)hasPlaybackStateChange;
- (BOOL)hasVolume;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (READSchemaREADPlaybackSessionStartedOrChanged)initWithDictionary:(id)a3;
- (READSchemaREADPlaybackSessionStartedOrChanged)initWithJSON:(id)a3;
- (TTSSchemaTTSAudioInterface)audioInterface;
- (float)customerPerceivedLatency;
- (float)volume;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)playbackStateChange;
- (unint64_t)hash;
- (void)deleteAudioInterface;
- (void)deleteCustomerPerceivedLatency;
- (void)deletePlaybackStateChange;
- (void)deleteVolume;
- (void)setAudioInterface:(id)a3;
- (void)setCustomerPerceivedLatency:(float)a3;
- (void)setHasAudioInterface:(BOOL)a3;
- (void)setHasCustomerPerceivedLatency:(BOOL)a3;
- (void)setHasPlaybackStateChange:(BOOL)a3;
- (void)setHasVolume:(BOOL)a3;
- (void)setPlaybackStateChange:(int)a3;
- (void)setVolume:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation READSchemaREADPlaybackSessionStartedOrChanged

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)READSchemaREADPlaybackSessionStartedOrChanged;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(READSchemaREADPlaybackSessionStartedOrChanged *)self audioInterface];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(READSchemaREADPlaybackSessionStartedOrChanged *)self deleteAudioInterface];
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

- (void)setHasAudioInterface:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)playbackStateChange
{
  return self->_playbackStateChange;
}

- (float)volume
{
  return self->_volume;
}

- (void)setAudioInterface:(id)a3
{
}

- (TTSSchemaTTSAudioInterface)audioInterface
{
  return self->_audioInterface;
}

- (float)customerPerceivedLatency
{
  return self->_customerPerceivedLatency;
}

- (READSchemaREADPlaybackSessionStartedOrChanged)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)READSchemaREADPlaybackSessionStartedOrChanged;
  v5 = [(READSchemaREADPlaybackSessionStartedOrChanged *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"customerPerceivedLatency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[READSchemaREADPlaybackSessionStartedOrChanged setCustomerPerceivedLatency:](v5, "setCustomerPerceivedLatency:");
    }
    v7 = [v4 objectForKeyedSubscript:@"audioInterface"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[TTSSchemaTTSAudioInterface alloc] initWithDictionary:v7];
      [(READSchemaREADPlaybackSessionStartedOrChanged *)v5 setAudioInterface:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"volume"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[READSchemaREADPlaybackSessionStartedOrChanged setVolume:](v5, "setVolume:");
    }
    v10 = [v4 objectForKeyedSubscript:@"playbackStateChange"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[READSchemaREADPlaybackSessionStartedOrChanged setPlaybackStateChange:](v5, "setPlaybackStateChange:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (READSchemaREADPlaybackSessionStartedOrChanged)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(READSchemaREADPlaybackSessionStartedOrChanged *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(READSchemaREADPlaybackSessionStartedOrChanged *)self dictionaryRepresentation];
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
  if (self->_audioInterface)
  {
    id v4 = [(READSchemaREADPlaybackSessionStartedOrChanged *)self audioInterface];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"audioInterface"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"audioInterface"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    v11 = NSNumber;
    [(READSchemaREADPlaybackSessionStartedOrChanged *)self customerPerceivedLatency];
    v12 = objc_msgSend(v11, "numberWithFloat:");
    [v3 setObject:v12 forKeyedSubscript:@"customerPerceivedLatency"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_8:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_8;
  }
  unsigned int v13 = [(READSchemaREADPlaybackSessionStartedOrChanged *)self playbackStateChange] - 1;
  if (v13 > 3) {
    v14 = @"READPLAYBACKSTATE_UNKNOWN";
  }
  else {
    v14 = off_1E5EBBC60[v13];
  }
  [v3 setObject:v14 forKeyedSubscript:@"playbackStateChange"];
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_9:
  v8 = NSNumber;
  [(READSchemaREADPlaybackSessionStartedOrChanged *)self volume];
  objc_super v9 = objc_msgSend(v8, "numberWithFloat:");
  [v3 setObject:v9 forKeyedSubscript:@"volume"];

LABEL_10:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    float customerPerceivedLatency = self->_customerPerceivedLatency;
    double v5 = customerPerceivedLatency;
    if (customerPerceivedLatency < 0.0) {
      double v5 = -customerPerceivedLatency;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v8 = [(TTSSchemaTTSAudioInterface *)self->_audioInterface hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float volume = self->_volume;
    double v12 = volume;
    if (volume < 0.0) {
      double v12 = -volume;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_playbackStateChange;
  }
  else {
    uint64_t v15 = 0;
  }
  return v8 ^ v3 ^ v10 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    float customerPerceivedLatency = self->_customerPerceivedLatency;
    [v4 customerPerceivedLatency];
    if (customerPerceivedLatency != v6) {
      goto LABEL_19;
    }
  }
  double v7 = [(READSchemaREADPlaybackSessionStartedOrChanged *)self audioInterface];
  unint64_t v8 = [v4 audioInterface];
  objc_super v9 = v8;
  if ((v7 == 0) == (v8 != 0))
  {

    goto LABEL_19;
  }
  uint64_t v10 = [(READSchemaREADPlaybackSessionStartedOrChanged *)self audioInterface];
  if (v10)
  {
    v11 = (void *)v10;
    double v12 = [(READSchemaREADPlaybackSessionStartedOrChanged *)self audioInterface];
    long double v13 = [v4 audioInterface];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $63CC23D1A4492DA0C32E812D0FFCE95D has = self->_has;
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v17 = v4[32];
  if (v16 != ((v17 >> 1) & 1))
  {
LABEL_19:
    BOOL v22 = 0;
    goto LABEL_20;
  }
  if (v16)
  {
    float volume = self->_volume;
    [v4 volume];
    if (volume == v19)
    {
      $63CC23D1A4492DA0C32E812D0FFCE95D has = self->_has;
      unsigned int v17 = v4[32];
      goto LABEL_15;
    }
    goto LABEL_19;
  }
LABEL_15:
  int v20 = (*(unsigned int *)&has >> 2) & 1;
  if (v20 != ((v17 >> 2) & 1)) {
    goto LABEL_19;
  }
  if (v20)
  {
    int playbackStateChange = self->_playbackStateChange;
    if (playbackStateChange != [v4 playbackStateChange]) {
      goto LABEL_19;
    }
  }
  BOOL v22 = 1;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
  id v4 = [(READSchemaREADPlaybackSessionStartedOrChanged *)self audioInterface];

  if (v4)
  {
    double v5 = [(READSchemaREADPlaybackSessionStartedOrChanged *)self audioInterface];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return READSchemaREADPlaybackSessionStartedOrChangedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deletePlaybackStateChange
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPlaybackStateChange:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPlaybackStateChange
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPlaybackStateChange:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int playbackStateChange = a3;
}

- (void)deleteVolume
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasVolume:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVolume
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVolume:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float volume = a3;
}

- (void)deleteAudioInterface
{
}

- (BOOL)hasAudioInterface
{
  return self->_audioInterface != 0;
}

- (void)deleteCustomerPerceivedLatency
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCustomerPerceivedLatency:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCustomerPerceivedLatency
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCustomerPerceivedLatency:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float customerPerceivedLatency = a3;
}

@end