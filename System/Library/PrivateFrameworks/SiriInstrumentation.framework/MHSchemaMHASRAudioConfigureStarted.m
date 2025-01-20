@interface MHSchemaMHASRAudioConfigureStarted
- (BOOL)hasAudioCodec;
- (BOOL)hasAudioSkippedNumSamples;
- (BOOL)hasAudioSkippedTimeInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHASRAudioConfigureStarted)initWithDictionary:(id)a3;
- (MHSchemaMHASRAudioConfigureStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioCodec;
- (unint64_t)audioSkippedNumSamples;
- (unint64_t)audioSkippedTimeInNs;
- (unint64_t)hash;
- (void)deleteAudioCodec;
- (void)deleteAudioSkippedNumSamples;
- (void)deleteAudioSkippedTimeInNs;
- (void)setAudioCodec:(int)a3;
- (void)setAudioSkippedNumSamples:(unint64_t)a3;
- (void)setAudioSkippedTimeInNs:(unint64_t)a3;
- (void)setHasAudioCodec:(BOOL)a3;
- (void)setHasAudioSkippedNumSamples:(BOOL)a3;
- (void)setHasAudioSkippedTimeInNs:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHASRAudioConfigureStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)audioSkippedNumSamples
{
  return self->_audioSkippedNumSamples;
}

- (unint64_t)audioSkippedTimeInNs
{
  return self->_audioSkippedTimeInNs;
}

- (int)audioCodec
{
  return self->_audioCodec;
}

- (MHSchemaMHASRAudioConfigureStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHASRAudioConfigureStarted;
  v5 = [(MHSchemaMHASRAudioConfigureStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioCodec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHASRAudioConfigureStarted setAudioCodec:](v5, "setAudioCodec:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"audioSkippedTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHASRAudioConfigureStarted setAudioSkippedTimeInNs:](v5, "setAudioSkippedTimeInNs:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"audioSkippedNumSamples"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHASRAudioConfigureStarted setAudioSkippedNumSamples:](v5, "setAudioSkippedNumSamples:", [v8 unsignedLongLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (MHSchemaMHASRAudioConfigureStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHASRAudioConfigureStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHASRAudioConfigureStarted *)self dictionaryRepresentation];
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
    unsigned int v5 = [(MHSchemaMHASRAudioConfigureStarted *)self audioCodec] - 1;
    if (v5 > 0xA) {
      v6 = @"MHASRAUDIOCODEC_UNKNOWN";
    }
    else {
      v6 = off_1E5EB10C8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"audioCodec"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHASRAudioConfigureStarted audioSkippedNumSamples](self, "audioSkippedNumSamples"));
    [v3 setObject:v7 forKeyedSubscript:@"audioSkippedNumSamples"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHASRAudioConfigureStarted audioSkippedTimeInNs](self, "audioSkippedTimeInNs"));
    [v3 setObject:v8 forKeyedSubscript:@"audioSkippedTimeInNs"];
  }
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
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_audioCodec;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_audioSkippedTimeInNs;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_audioSkippedNumSamples;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $FF46A8ECD1DC6D3A658563C8F87F134B has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int audioCodec = self->_audioCodec;
    if (audioCodec != [v4 audioCodec]) {
      goto LABEL_14;
    }
    $FF46A8ECD1DC6D3A658563C8F87F134B has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    unint64_t audioSkippedTimeInNs = self->_audioSkippedTimeInNs;
    if (audioSkippedTimeInNs == [v4 audioSkippedTimeInNs])
    {
      $FF46A8ECD1DC6D3A658563C8F87F134B has = self->_has;
      unsigned int v6 = v4[32];
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
    unint64_t audioSkippedNumSamples = self->_audioSkippedNumSamples;
    if (audioSkippedNumSamples != [v4 audioSkippedNumSamples]) {
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
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHASRAudioConfigureStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioSkippedNumSamples
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAudioSkippedNumSamples:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAudioSkippedNumSamples
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAudioSkippedNumSamples:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t audioSkippedNumSamples = a3;
}

- (void)deleteAudioSkippedTimeInNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAudioSkippedTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAudioSkippedTimeInNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAudioSkippedTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t audioSkippedTimeInNs = a3;
}

- (void)deleteAudioCodec
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioCodec:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioCodec
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioCodec:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int audioCodec = a3;
}

@end