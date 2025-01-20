@interface PEGASUSSchemaPEGASUSAudioQueueStateInfo
- (BOOL)hasAudioEntitySource;
- (BOOL)hasAudioNowPlayingQueueCount;
- (BOOL)hasAudioNowPlayingQueueIndex;
- (BOOL)hasAudioQueueStateItem;
- (BOOL)hasAudioState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSAudioQueueStateInfo)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSAudioQueueStateInfo)initWithJSON:(id)a3;
- (PEGASUSSchemaPEGASUSAudioQueueStateItem)audioQueueStateItem;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioEntitySource;
- (int)audioNowPlayingQueueCount;
- (int)audioNowPlayingQueueIndex;
- (int)audioState;
- (unint64_t)hash;
- (void)deleteAudioEntitySource;
- (void)deleteAudioNowPlayingQueueCount;
- (void)deleteAudioNowPlayingQueueIndex;
- (void)deleteAudioQueueStateItem;
- (void)deleteAudioState;
- (void)setAudioEntitySource:(int)a3;
- (void)setAudioNowPlayingQueueCount:(int)a3;
- (void)setAudioNowPlayingQueueIndex:(int)a3;
- (void)setAudioQueueStateItem:(id)a3;
- (void)setAudioState:(int)a3;
- (void)setHasAudioEntitySource:(BOOL)a3;
- (void)setHasAudioNowPlayingQueueCount:(BOOL)a3;
- (void)setHasAudioNowPlayingQueueIndex:(BOOL)a3;
- (void)setHasAudioQueueStateItem:(BOOL)a3;
- (void)setHasAudioState:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSAudioQueueStateInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PEGASUSSchemaPEGASUSAudioQueueStateInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self audioQueueStateItem];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self deleteAudioQueueStateItem];
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

- (void)setHasAudioQueueStateItem:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAudioQueueStateItem:(id)a3
{
}

- (PEGASUSSchemaPEGASUSAudioQueueStateItem)audioQueueStateItem
{
  return self->_audioQueueStateItem;
}

- (int)audioNowPlayingQueueCount
{
  return self->_audioNowPlayingQueueCount;
}

- (int)audioNowPlayingQueueIndex
{
  return self->_audioNowPlayingQueueIndex;
}

- (int)audioEntitySource
{
  return self->_audioEntitySource;
}

- (int)audioState
{
  return self->_audioState;
}

- (PEGASUSSchemaPEGASUSAudioQueueStateInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PEGASUSSchemaPEGASUSAudioQueueStateInfo;
  v5 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioState:](v5, "setAudioState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"audioEntitySource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioEntitySource:](v5, "setAudioEntitySource:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"audioNowPlayingQueueIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioNowPlayingQueueIndex:](v5, "setAudioNowPlayingQueueIndex:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"audioNowPlayingQueueCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAudioQueueStateInfo setAudioNowPlayingQueueCount:](v5, "setAudioNowPlayingQueueCount:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"audioQueueStateItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[PEGASUSSchemaPEGASUSAudioQueueStateItem alloc] initWithDictionary:v10];
      [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)v5 setAudioQueueStateItem:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSAudioQueueStateInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self dictionaryRepresentation];
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
    int v5 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self audioEntitySource];
    v6 = @"PEGASUSAUDIOENTITYSOURCE_UNKNOWN";
    if (v5 == 1) {
      v6 = @"PEGASUSAUDIOENTITYSOURCE_RADIO";
    }
    if (v5 == 2) {
      uint64_t v7 = @"PEGASUSAUDIOENTITYSOURCE_LOCAL";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"audioEntitySource"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioNowPlayingQueueCount](self, "audioNowPlayingQueueCount"));
    [v3 setObject:v8 forKeyedSubscript:@"audioNowPlayingQueueCount"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithInt:", -[PEGASUSSchemaPEGASUSAudioQueueStateInfo audioNowPlayingQueueIndex](self, "audioNowPlayingQueueIndex"));
    [v3 setObject:v9 forKeyedSubscript:@"audioNowPlayingQueueIndex"];
  }
  if (self->_audioQueueStateItem)
  {
    v10 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self audioQueueStateItem];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"audioQueueStateItem"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"audioQueueStateItem"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v13 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self audioState] - 1;
    if (v13 > 5) {
      objc_super v14 = @"MEDIAPLAYBACKSTATE_UNKNOWN";
    }
    else {
      objc_super v14 = off_1E5EBC920[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"audioState"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_audioState;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_audioEntitySource;
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
      return v3 ^ v2 ^ v4 ^ v5 ^ [(PEGASUSSchemaPEGASUSAudioQueueStateItem *)self->_audioQueueStateItem hash];
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
  uint64_t v4 = 2654435761 * self->_audioNowPlayingQueueIndex;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_audioNowPlayingQueueCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ [(PEGASUSSchemaPEGASUSAudioQueueStateItem *)self->_audioQueueStateItem hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $3336B05F162A59F79082772B46FF372A has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    int audioState = self->_audioState;
    if (audioState != [v4 audioState]) {
      goto LABEL_22;
    }
    $3336B05F162A59F79082772B46FF372A has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int audioEntitySource = self->_audioEntitySource;
      if (audioEntitySource != [v4 audioEntitySource]) {
        goto LABEL_22;
      }
      $3336B05F162A59F79082772B46FF372A has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int audioNowPlayingQueueIndex = self->_audioNowPlayingQueueIndex;
        if (audioNowPlayingQueueIndex != [v4 audioNowPlayingQueueIndex]) {
          goto LABEL_22;
        }
        $3336B05F162A59F79082772B46FF372A has = self->_has;
        unsigned int v6 = v4[32];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (!v12
          || (int audioNowPlayingQueueCount = self->_audioNowPlayingQueueCount,
              audioNowPlayingQueueCount == [v4 audioNowPlayingQueueCount]))
        {
          objc_super v14 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self audioQueueStateItem];
          v15 = [v4 audioQueueStateItem];
          v16 = v15;
          if ((v14 == 0) != (v15 != 0))
          {
            uint64_t v17 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self audioQueueStateItem];
            if (!v17)
            {

LABEL_25:
              BOOL v22 = 1;
              goto LABEL_23;
            }
            v18 = (void *)v17;
            v19 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self audioQueueStateItem];
            v20 = [v4 audioQueueStateItem];
            char v21 = [v19 isEqual:v20];

            if (v21) {
              goto LABEL_25;
            }
          }
          else
          {
          }
        }
      }
    }
  }
LABEL_22:
  BOOL v22 = 0;
LABEL_23:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
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
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  uint64_t v5 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self audioQueueStateItem];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSAudioQueueStateInfo *)self audioQueueStateItem];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioQueueStateInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioQueueStateItem
{
}

- (BOOL)hasAudioQueueStateItem
{
  return self->_audioQueueStateItem != 0;
}

- (void)deleteAudioNowPlayingQueueCount
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAudioNowPlayingQueueCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAudioNowPlayingQueueCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAudioNowPlayingQueueCount:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int audioNowPlayingQueueCount = a3;
}

- (void)deleteAudioNowPlayingQueueIndex
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAudioNowPlayingQueueIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAudioNowPlayingQueueIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAudioNowPlayingQueueIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int audioNowPlayingQueueIndex = a3;
}

- (void)deleteAudioEntitySource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAudioEntitySource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAudioEntitySource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAudioEntitySource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int audioEntitySource = a3;
}

- (void)deleteAudioState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int audioState = a3;
}

@end