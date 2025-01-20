@interface TTSSchemaTTSSynthesisStarted
- (BOOL)hasSynthesisEffect;
- (BOOL)hasSynthesisSource;
- (BOOL)hasThermalState;
- (BOOL)hasVoiceContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (TTSSchemaTTSSynthesisStarted)initWithDictionary:(id)a3;
- (TTSSchemaTTSSynthesisStarted)initWithJSON:(id)a3;
- (TTSSchemaTTSVoiceContext)voiceContext;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)synthesisEffect;
- (int)synthesisSource;
- (int)thermalState;
- (unint64_t)hash;
- (void)deleteSynthesisEffect;
- (void)deleteSynthesisSource;
- (void)deleteThermalState;
- (void)deleteVoiceContext;
- (void)setHasSynthesisEffect:(BOOL)a3;
- (void)setHasSynthesisSource:(BOOL)a3;
- (void)setHasThermalState:(BOOL)a3;
- (void)setHasVoiceContext:(BOOL)a3;
- (void)setSynthesisEffect:(int)a3;
- (void)setSynthesisSource:(int)a3;
- (void)setThermalState:(int)a3;
- (void)setVoiceContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTSSchemaTTSSynthesisStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TTSSchemaTTSSynthesisStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(TTSSchemaTTSSynthesisStarted *)self voiceContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(TTSSchemaTTSSynthesisStarted *)self deleteVoiceContext];
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

- (void)setHasVoiceContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)thermalState
{
  return self->_thermalState;
}

- (int)synthesisEffect
{
  return self->_synthesisEffect;
}

- (void)setVoiceContext:(id)a3
{
}

- (TTSSchemaTTSVoiceContext)voiceContext
{
  return self->_voiceContext;
}

- (int)synthesisSource
{
  return self->_synthesisSource;
}

- (TTSSchemaTTSSynthesisStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTSSchemaTTSSynthesisStarted;
  v5 = [(TTSSchemaTTSSynthesisStarted *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"synthesisSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSSynthesisStarted setSynthesisSource:](v5, "setSynthesisSource:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"voiceContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[TTSSchemaTTSVoiceContext alloc] initWithDictionary:v7];
      [(TTSSchemaTTSSynthesisStarted *)v5 setVoiceContext:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"synthesisEffect"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSSynthesisStarted setSynthesisEffect:](v5, "setSynthesisEffect:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"thermalState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSSynthesisStarted setThermalState:](v5, "setThermalState:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (TTSSchemaTTSSynthesisStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTSSchemaTTSSynthesisStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTSSchemaTTSSynthesisStarted *)self dictionaryRepresentation];
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
    unsigned int v5 = [(TTSSchemaTTSSynthesisStarted *)self synthesisEffect] - 1;
    if (v5 > 2) {
      v6 = @"UNKNOWN";
    }
    else {
      v6 = off_1E5EBBC80[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"synthesisEffect"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v7 = [(TTSSchemaTTSSynthesisStarted *)self synthesisSource] - 1;
  if (v7 > 6) {
    v8 = @"UNKNOWN";
  }
  else {
    v8 = off_1E5EBBC98[v7];
  }
  [v3 setObject:v8 forKeyedSubscript:@"synthesisSource"];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_13:
    unsigned int v9 = [(TTSSchemaTTSSynthesisStarted *)self thermalState] - 1;
    if (v9 > 3) {
      v10 = @"DEVICETHERMALSTATE_UNKNOWN";
    }
    else {
      v10 = off_1E5EBBCD0[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"thermalState"];
  }
LABEL_17:
  if (self->_voiceContext)
  {
    v11 = [(TTSSchemaTTSSynthesisStarted *)self voiceContext];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"voiceContext"];
    }
    else
    {
      objc_super v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"voiceContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_synthesisSource;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(TTSSchemaTTSVoiceContext *)self->_voiceContext hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_synthesisEffect;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_thermalState;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    int synthesisSource = self->_synthesisSource;
    if (synthesisSource != [v4 synthesisSource]) {
      goto LABEL_19;
    }
  }
  uint64_t v6 = [(TTSSchemaTTSSynthesisStarted *)self voiceContext];
  unsigned int v7 = [v4 voiceContext];
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_19;
  }
  uint64_t v9 = [(TTSSchemaTTSSynthesisStarted *)self voiceContext];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(TTSSchemaTTSSynthesisStarted *)self voiceContext];
    v12 = [v4 voiceContext];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $A6BBCD0F7CB61668BE900102C8285281 has = self->_has;
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v16 = v4[32];
  if (v15 != ((v16 >> 1) & 1))
  {
LABEL_19:
    BOOL v20 = 0;
    goto LABEL_20;
  }
  if (v15)
  {
    int synthesisEffect = self->_synthesisEffect;
    if (synthesisEffect == [v4 synthesisEffect])
    {
      $A6BBCD0F7CB61668BE900102C8285281 has = self->_has;
      unsigned int v16 = v4[32];
      goto LABEL_15;
    }
    goto LABEL_19;
  }
LABEL_15:
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v16 >> 2) & 1)) {
    goto LABEL_19;
  }
  if (v18)
  {
    int thermalState = self->_thermalState;
    if (thermalState != [v4 thermalState]) {
      goto LABEL_19;
    }
  }
  BOOL v20 = 1;
LABEL_20:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v4 = [(TTSSchemaTTSSynthesisStarted *)self voiceContext];

  if (v4)
  {
    uint64_t v5 = [(TTSSchemaTTSSynthesisStarted *)self voiceContext];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSSynthesisStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteThermalState
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasThermalState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasThermalState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setThermalState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int thermalState = a3;
}

- (void)deleteSynthesisEffect
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSynthesisEffect:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSynthesisEffect
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSynthesisEffect:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int synthesisEffect = a3;
}

- (void)deleteVoiceContext
{
}

- (BOOL)hasVoiceContext
{
  return self->_voiceContext != 0;
}

- (void)deleteSynthesisSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSynthesisSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSynthesisSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSynthesisSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int synthesisSource = a3;
}

@end