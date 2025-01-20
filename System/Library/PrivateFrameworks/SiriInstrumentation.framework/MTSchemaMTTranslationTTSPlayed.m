@interface MTSchemaMTTranslationTTSPlayed
- (BOOL)hasAudioChannel;
- (BOOL)hasIsAutoplayTranslation;
- (BOOL)hasPlaybackSpeed;
- (BOOL)hasSourceOrTarget;
- (BOOL)isAutoplayTranslation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTTranslationTTSPlayed)initWithDictionary:(id)a3;
- (MTSchemaMTTranslationTTSPlayed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioChannel;
- (int)playbackSpeed;
- (int)sourceOrTarget;
- (unint64_t)hash;
- (void)deleteAudioChannel;
- (void)deleteIsAutoplayTranslation;
- (void)deletePlaybackSpeed;
- (void)deleteSourceOrTarget;
- (void)setAudioChannel:(int)a3;
- (void)setHasAudioChannel:(BOOL)a3;
- (void)setHasIsAutoplayTranslation:(BOOL)a3;
- (void)setHasPlaybackSpeed:(BOOL)a3;
- (void)setHasSourceOrTarget:(BOOL)a3;
- (void)setIsAutoplayTranslation:(BOOL)a3;
- (void)setPlaybackSpeed:(int)a3;
- (void)setSourceOrTarget:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTTranslationTTSPlayed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)audioChannel
{
  return self->_audioChannel;
}

- (int)playbackSpeed
{
  return self->_playbackSpeed;
}

- (BOOL)isAutoplayTranslation
{
  return self->_isAutoplayTranslation;
}

- (int)sourceOrTarget
{
  return self->_sourceOrTarget;
}

- (MTSchemaMTTranslationTTSPlayed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTSchemaMTTranslationTTSPlayed;
  v5 = [(MTSchemaMTTranslationTTSPlayed *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sourceOrTarget"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTTranslationTTSPlayed setSourceOrTarget:](v5, "setSourceOrTarget:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isAutoplayTranslation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTTranslationTTSPlayed setIsAutoplayTranslation:](v5, "setIsAutoplayTranslation:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"playbackSpeed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTTranslationTTSPlayed setPlaybackSpeed:](v5, "setPlaybackSpeed:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"audioChannel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTTranslationTTSPlayed setAudioChannel:](v5, "setAudioChannel:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (MTSchemaMTTranslationTTSPlayed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTTranslationTTSPlayed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTTranslationTTSPlayed *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    unsigned int v9 = [(MTSchemaMTTranslationTTSPlayed *)self audioChannel] - 1;
    if (v9 > 4) {
      v10 = @"MTAPPAUDIOCHANNEL_UNKNOWN";
    }
    else {
      v10 = off_1E5EBEF40[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"audioChannel"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[MTSchemaMTTranslationTTSPlayed isAutoplayTranslation](self, "isAutoplayTranslation"));
  [v3 setObject:v11 forKeyedSubscript:@"isAutoplayTranslation"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_5;
  }
LABEL_19:
  unsigned int v12 = [(MTSchemaMTTranslationTTSPlayed *)self playbackSpeed] - 1;
  if (v12 > 3) {
    v13 = @"MTTTSPLAYBACKSPEED_UNKNOWN";
  }
  else {
    v13 = off_1E5EBEF68[v12];
  }
  [v3 setObject:v13 forKeyedSubscript:@"playbackSpeed"];
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_5:
  int v5 = [(MTSchemaMTTranslationTTSPlayed *)self sourceOrTarget];
  v6 = @"MTSOURCEORTARGETLANGUAGE_UNKNOWN";
  if (v5 == 1) {
    v6 = @"MTSOURCEORTARGETLANGUAGE_SOURCE";
  }
  if (v5 == 2) {
    uint64_t v7 = @"MTSOURCEORTARGETLANGUAGE_TARGET";
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"sourceOrTarget"];
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_sourceOrTarget;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isAutoplayTranslation;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_playbackSpeed;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_audioChannel;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $9110518B41D4E7E4CE2BC12E3A3FBD4E has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int sourceOrTarget = self->_sourceOrTarget;
    if (sourceOrTarget != [v4 sourceOrTarget]) {
      goto LABEL_18;
    }
    $9110518B41D4E7E4CE2BC12E3A3FBD4E has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    int isAutoplayTranslation = self->_isAutoplayTranslation;
    if (isAutoplayTranslation != [v4 isAutoplayTranslation]) {
      goto LABEL_18;
    }
    $9110518B41D4E7E4CE2BC12E3A3FBD4E has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    int playbackSpeed = self->_playbackSpeed;
    if (playbackSpeed == [v4 playbackSpeed])
    {
      $9110518B41D4E7E4CE2BC12E3A3FBD4E has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    int audioChannel = self->_audioChannel;
    if (audioChannel != [v4 audioChannel]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTTranslationTTSPlayedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioChannel
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAudioChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAudioChannel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAudioChannel:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int audioChannel = a3;
}

- (void)deletePlaybackSpeed
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPlaybackSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPlaybackSpeed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPlaybackSpeed:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int playbackSpeed = a3;
}

- (void)deleteIsAutoplayTranslation
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsAutoplayTranslation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsAutoplayTranslation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsAutoplayTranslation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isAutoplayTranslation = a3;
}

- (void)deleteSourceOrTarget
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSourceOrTarget:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSourceOrTarget
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSourceOrTarget:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int sourceOrTarget = a3;
}

@end