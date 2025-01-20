@interface TTSSchemaTTSVoiceContext
- (BOOL)hasResourceVersion;
- (BOOL)hasVoiceFootprint;
- (BOOL)hasVoiceName;
- (BOOL)hasVoiceType;
- (BOOL)hasVoiceVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (TTSSchemaTTSVoiceContext)initWithDictionary:(id)a3;
- (TTSSchemaTTSVoiceContext)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)voiceFootprint;
- (int)voiceName;
- (int)voiceType;
- (unint64_t)hash;
- (unsigned)resourceVersion;
- (unsigned)voiceVersion;
- (void)deleteResourceVersion;
- (void)deleteVoiceFootprint;
- (void)deleteVoiceName;
- (void)deleteVoiceType;
- (void)deleteVoiceVersion;
- (void)setHasResourceVersion:(BOOL)a3;
- (void)setHasVoiceFootprint:(BOOL)a3;
- (void)setHasVoiceName:(BOOL)a3;
- (void)setHasVoiceType:(BOOL)a3;
- (void)setHasVoiceVersion:(BOOL)a3;
- (void)setResourceVersion:(unsigned int)a3;
- (void)setVoiceFootprint:(int)a3;
- (void)setVoiceName:(int)a3;
- (void)setVoiceType:(int)a3;
- (void)setVoiceVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTSSchemaTTSVoiceContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)voiceName
{
  return self->_voiceName;
}

- (unsigned)resourceVersion
{
  return self->_resourceVersion;
}

- (unsigned)voiceVersion
{
  return self->_voiceVersion;
}

- (int)voiceFootprint
{
  return self->_voiceFootprint;
}

- (int)voiceType
{
  return self->_voiceType;
}

- (TTSSchemaTTSVoiceContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTSSchemaTTSVoiceContext;
  v5 = [(TTSSchemaTTSVoiceContext *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSVoiceContext setVoiceType:](v5, "setVoiceType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"voiceFootprint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSVoiceContext setVoiceFootprint:](v5, "setVoiceFootprint:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"voiceVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSVoiceContext setVoiceVersion:](v5, "setVoiceVersion:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"resourceVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSVoiceContext setResourceVersion:](v5, "setResourceVersion:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"voiceName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSVoiceContext setVoiceName:](v5, "setVoiceName:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (TTSSchemaTTSVoiceContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTSSchemaTTSVoiceContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTSSchemaTTSVoiceContext *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TTSSchemaTTSVoiceContext resourceVersion](self, "resourceVersion"));
    [v3 setObject:v7 forKeyedSubscript:@"resourceVersion"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v8 = [(TTSSchemaTTSVoiceContext *)self voiceFootprint] - 1;
  if (v8 > 3) {
    v9 = @"UNKNOWN";
  }
  else {
    v9 = off_1E5EB98A8[v8];
  }
  [v3 setObject:v9 forKeyedSubscript:@"voiceFootprint"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_15:
  unsigned int v10 = [(TTSSchemaTTSVoiceContext *)self voiceName] - 1;
  if (v10 > 0x5C) {
    v11 = @"VOICENAME_UNKNOWN";
  }
  else {
    v11 = off_1E5EB98C8[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"voiceName"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  unsigned int v12 = [(TTSSchemaTTSVoiceContext *)self voiceType] - 1;
  if (v12 > 4) {
    objc_super v13 = @"UNKNOWN";
  }
  else {
    objc_super v13 = off_1E5EB9BB0[v12];
  }
  [v3 setObject:v13 forKeyedSubscript:@"voiceType"];
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TTSSchemaTTSVoiceContext voiceVersion](self, "voiceVersion"));
  [v3 setObject:v5 forKeyedSubscript:@"voiceVersion"];

LABEL_7:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_voiceType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_voiceFootprint;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_voiceVersion;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_resourceVersion;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_voiceName;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $5501C8C9C290B9FE42F7871BD3F5DE51 has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    int voiceType = self->_voiceType;
    if (voiceType != [v4 voiceType]) {
      goto LABEL_22;
    }
    $5501C8C9C290B9FE42F7871BD3F5DE51 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    int voiceFootprint = self->_voiceFootprint;
    if (voiceFootprint != [v4 voiceFootprint]) {
      goto LABEL_22;
    }
    $5501C8C9C290B9FE42F7871BD3F5DE51 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    unsigned int voiceVersion = self->_voiceVersion;
    if (voiceVersion != [v4 voiceVersion]) {
      goto LABEL_22;
    }
    $5501C8C9C290B9FE42F7871BD3F5DE51 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    unsigned int resourceVersion = self->_resourceVersion;
    if (resourceVersion == [v4 resourceVersion])
    {
      $5501C8C9C290B9FE42F7871BD3F5DE51 has = self->_has;
      unsigned int v6 = v4[28];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    int voiceName = self->_voiceName;
    if (voiceName != [v4 voiceName]) {
      goto LABEL_22;
    }
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
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
      goto LABEL_12;
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
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSVoiceContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteVoiceName
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasVoiceName:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVoiceName
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setVoiceName:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int voiceName = a3;
}

- (void)deleteResourceVersion
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasResourceVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResourceVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setResourceVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int resourceVersion = a3;
}

- (void)deleteVoiceVersion
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasVoiceVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVoiceVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setVoiceVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int voiceVersion = a3;
}

- (void)deleteVoiceFootprint
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasVoiceFootprint:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVoiceFootprint
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVoiceFootprint:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int voiceFootprint = a3;
}

- (void)deleteVoiceType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasVoiceType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVoiceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVoiceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int voiceType = a3;
}

@end