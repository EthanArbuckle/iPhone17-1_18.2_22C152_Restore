@interface TTSSchemaTTSSpeechStarted
- (BOOL)hasAssetSelectionLatencyInSecond;
- (BOOL)hasAudioInterface;
- (BOOL)hasAudioOutputRoute;
- (BOOL)hasCustomerPerceivedLatencyInSecond;
- (BOOL)hasSynthesisEffect;
- (BOOL)hasSynthesisSource;
- (BOOL)hasThermalState;
- (BOOL)hasVoiceContext;
- (BOOL)hasVolume;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (TTSSchemaTTSAudioInterface)audioInterface;
- (TTSSchemaTTSSpeechStarted)initWithDictionary:(id)a3;
- (TTSSchemaTTSSpeechStarted)initWithJSON:(id)a3;
- (TTSSchemaTTSVoiceContext)voiceContext;
- (float)assetSelectionLatencyInSecond;
- (float)customerPerceivedLatencyInSecond;
- (float)volume;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioOutputRoute;
- (int)synthesisEffect;
- (int)synthesisSource;
- (int)thermalState;
- (unint64_t)hash;
- (void)deleteAssetSelectionLatencyInSecond;
- (void)deleteAudioInterface;
- (void)deleteAudioOutputRoute;
- (void)deleteCustomerPerceivedLatencyInSecond;
- (void)deleteSynthesisEffect;
- (void)deleteSynthesisSource;
- (void)deleteThermalState;
- (void)deleteVoiceContext;
- (void)deleteVolume;
- (void)setAssetSelectionLatencyInSecond:(float)a3;
- (void)setAudioInterface:(id)a3;
- (void)setAudioOutputRoute:(int)a3;
- (void)setCustomerPerceivedLatencyInSecond:(float)a3;
- (void)setHasAssetSelectionLatencyInSecond:(BOOL)a3;
- (void)setHasAudioInterface:(BOOL)a3;
- (void)setHasAudioOutputRoute:(BOOL)a3;
- (void)setHasCustomerPerceivedLatencyInSecond:(BOOL)a3;
- (void)setHasSynthesisEffect:(BOOL)a3;
- (void)setHasSynthesisSource:(BOOL)a3;
- (void)setHasThermalState:(BOOL)a3;
- (void)setHasVoiceContext:(BOOL)a3;
- (void)setHasVolume:(BOOL)a3;
- (void)setSynthesisEffect:(int)a3;
- (void)setSynthesisSource:(int)a3;
- (void)setThermalState:(int)a3;
- (void)setVoiceContext:(id)a3;
- (void)setVolume:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTSSchemaTTSSpeechStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTSSchemaTTSSpeechStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(TTSSchemaTTSSpeechStarted *)self voiceContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(TTSSchemaTTSSpeechStarted *)self deleteVoiceContext];
  }
  v9 = [(TTSSchemaTTSSpeechStarted *)self audioInterface];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(TTSSchemaTTSSpeechStarted *)self deleteAudioInterface];
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
  objc_storeStrong((id *)&self->_audioInterface, 0);
  objc_storeStrong((id *)&self->_voiceContext, 0);
}

- (void)setHasAudioInterface:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasVoiceContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)assetSelectionLatencyInSecond
{
  return self->_assetSelectionLatencyInSecond;
}

- (int)thermalState
{
  return self->_thermalState;
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

- (float)customerPerceivedLatencyInSecond
{
  return self->_customerPerceivedLatencyInSecond;
}

- (int)audioOutputRoute
{
  return self->_audioOutputRoute;
}

- (TTSSchemaTTSSpeechStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TTSSchemaTTSSpeechStarted;
  v5 = [(TTSSchemaTTSSpeechStarted *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioOutputRoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSSpeechStarted setAudioOutputRoute:](v5, "setAudioOutputRoute:", [v6 intValue]);
    }
    v20 = v6;
    v7 = [v4 objectForKeyedSubscript:@"customerPerceivedLatencyInSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[TTSSchemaTTSSpeechStarted setCustomerPerceivedLatencyInSecond:](v5, "setCustomerPerceivedLatencyInSecond:");
    }
    int v8 = objc_msgSend(v4, "objectForKeyedSubscript:", @"synthesisSource", v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSSpeechStarted setSynthesisSource:](v5, "setSynthesisSource:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"voiceContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[TTSSchemaTTSVoiceContext alloc] initWithDictionary:v9];
      [(TTSSchemaTTSSpeechStarted *)v5 setVoiceContext:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"synthesisEffect"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSSpeechStarted setSynthesisEffect:](v5, "setSynthesisEffect:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"audioInterface"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = [[TTSSchemaTTSAudioInterface alloc] initWithDictionary:v12];
      [(TTSSchemaTTSSpeechStarted *)v5 setAudioInterface:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"volume"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[TTSSchemaTTSSpeechStarted setVolume:](v5, "setVolume:");
    }
    v15 = [v4 objectForKeyedSubscript:@"thermalState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSSpeechStarted setThermalState:](v5, "setThermalState:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"assetSelectionLatencyInSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 floatValue];
      -[TTSSchemaTTSSpeechStarted setAssetSelectionLatencyInSecond:](v5, "setAssetSelectionLatencyInSecond:");
    }
    v17 = v5;
  }
  return v5;
}

- (TTSSchemaTTSSpeechStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTSSchemaTTSSpeechStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTSSchemaTTSSpeechStarted *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    id v4 = NSNumber;
    [(TTSSchemaTTSSpeechStarted *)self assetSelectionLatencyInSecond];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"assetSelectionLatencyInSecond"];
  }
  if (self->_audioInterface)
  {
    v6 = [(TTSSchemaTTSSpeechStarted *)self audioInterface];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"audioInterface"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"audioInterface"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v10 = [(TTSSchemaTTSSpeechStarted *)self audioOutputRoute] - 1;
    if (v10 > 7) {
      int v11 = @"UNKNOWN";
    }
    else {
      int v11 = off_1E5EB97F8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"audioOutputRoute"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  v12 = NSNumber;
  [(TTSSchemaTTSSpeechStarted *)self customerPerceivedLatencyInSecond];
  objc_super v13 = objc_msgSend(v12, "numberWithFloat:");
  [v3 setObject:v13 forKeyedSubscript:@"customerPerceivedLatencyInSecond"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_19:
  unsigned int v14 = [(TTSSchemaTTSSpeechStarted *)self synthesisEffect] - 1;
  if (v14 > 2) {
    v15 = @"UNKNOWN";
  }
  else {
    v15 = off_1E5EB9838[v14];
  }
  [v3 setObject:v15 forKeyedSubscript:@"synthesisEffect"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_31;
    }
    goto LABEL_27;
  }
LABEL_23:
  unsigned int v16 = [(TTSSchemaTTSSpeechStarted *)self synthesisSource] - 1;
  if (v16 > 6) {
    v17 = @"UNKNOWN";
  }
  else {
    v17 = off_1E5EB9850[v16];
  }
  [v3 setObject:v17 forKeyedSubscript:@"synthesisSource"];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_27:
    unsigned int v18 = [(TTSSchemaTTSSpeechStarted *)self thermalState] - 1;
    if (v18 > 3) {
      v19 = @"DEVICETHERMALSTATE_UNKNOWN";
    }
    else {
      v19 = off_1E5EB9888[v18];
    }
    [v3 setObject:v19 forKeyedSubscript:@"thermalState"];
  }
LABEL_31:
  if (self->_voiceContext)
  {
    v20 = [(TTSSchemaTTSSpeechStarted *)self voiceContext];
    objc_super v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"voiceContext"];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"voiceContext"];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v23 = NSNumber;
    [(TTSSchemaTTSSpeechStarted *)self volume];
    v24 = objc_msgSend(v23, "numberWithFloat:");
    [v3 setObject:v24 forKeyedSubscript:@"volume"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v26 = 2654435761 * self->_audioOutputRoute;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v26 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float customerPerceivedLatencyInSecond = self->_customerPerceivedLatencyInSecond;
  double v5 = customerPerceivedLatencyInSecond;
  if (customerPerceivedLatencyInSecond < 0.0) {
    double v5 = -customerPerceivedLatencyInSecond;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((has & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_synthesisSource;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(TTSSchemaTTSVoiceContext *)self->_voiceContext hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_synthesisEffect;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = [(TTSSchemaTTSAudioInterface *)self->_audioInterface hash];
  char v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    float volume = self->_volume;
    double v16 = volume;
    if (volume < 0.0) {
      double v16 = -volume;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((v13 & 0x20) != 0)
  {
    uint64_t v19 = 2654435761 * self->_thermalState;
    if ((v13 & 0x40) != 0) {
      goto LABEL_27;
    }
LABEL_32:
    unint64_t v24 = 0;
    return v8 ^ v26 ^ v9 ^ v11 ^ v10 ^ v12 ^ v14 ^ v19 ^ v24;
  }
  uint64_t v19 = 0;
  if ((v13 & 0x40) == 0) {
    goto LABEL_32;
  }
LABEL_27:
  float assetSelectionLatencyInSecond = self->_assetSelectionLatencyInSecond;
  double v21 = assetSelectionLatencyInSecond;
  if (assetSelectionLatencyInSecond < 0.0) {
    double v21 = -assetSelectionLatencyInSecond;
  }
  long double v22 = floor(v21 + 0.5);
  double v23 = (v21 - v22) * 1.84467441e19;
  unint64_t v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0) {
      v24 += (unint64_t)v23;
    }
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
  return v8 ^ v26 ^ v9 ^ v11 ^ v10 ^ v12 ^ v14 ^ v19 ^ v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $C0554B60F74CC19DAE9F4AE205FD9552 has = self->_has;
  unsigned int v6 = v4[60];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    int audioOutputRoute = self->_audioOutputRoute;
    if (audioOutputRoute != [v4 audioOutputRoute]) {
      goto LABEL_26;
    }
    $C0554B60F74CC19DAE9F4AE205FD9552 has = self->_has;
    unsigned int v6 = v4[60];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      float customerPerceivedLatencyInSecond = self->_customerPerceivedLatencyInSecond;
      [v4 customerPerceivedLatencyInSecond];
      if (customerPerceivedLatencyInSecond != v10) {
        goto LABEL_26;
      }
      $C0554B60F74CC19DAE9F4AE205FD9552 has = self->_has;
      unsigned int v6 = v4[60];
    }
    int v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 != ((v6 >> 2) & 1)) {
      goto LABEL_26;
    }
    if (v11)
    {
      int synthesisSource = self->_synthesisSource;
      if (synthesisSource != [v4 synthesisSource]) {
        goto LABEL_26;
      }
    }
    char v13 = [(TTSSchemaTTSSpeechStarted *)self voiceContext];
    unint64_t v14 = [v4 voiceContext];
    if ((v13 == 0) == (v14 != 0)) {
      goto LABEL_25;
    }
    uint64_t v15 = [(TTSSchemaTTSSpeechStarted *)self voiceContext];
    if (v15)
    {
      double v16 = (void *)v15;
      long double v17 = [(TTSSchemaTTSSpeechStarted *)self voiceContext];
      double v18 = [v4 voiceContext];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    int v20 = (*(unsigned char *)&self->_has >> 3) & 1;
    if (v20 != ((v4[60] >> 3) & 1)) {
      goto LABEL_26;
    }
    if (v20)
    {
      int synthesisEffect = self->_synthesisEffect;
      if (synthesisEffect != [v4 synthesisEffect]) {
        goto LABEL_26;
      }
    }
    char v13 = [(TTSSchemaTTSSpeechStarted *)self audioInterface];
    unint64_t v14 = [v4 audioInterface];
    if ((v13 == 0) == (v14 != 0))
    {
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v22 = [(TTSSchemaTTSSpeechStarted *)self audioInterface];
    if (v22)
    {
      double v23 = (void *)v22;
      unint64_t v24 = [(TTSSchemaTTSSpeechStarted *)self audioInterface];
      v25 = [v4 audioInterface];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    $C0554B60F74CC19DAE9F4AE205FD9552 v29 = self->_has;
    int v30 = (*(unsigned int *)&v29 >> 4) & 1;
    unsigned int v31 = v4[60];
    if (v30 == ((v31 >> 4) & 1))
    {
      if (v30)
      {
        float volume = self->_volume;
        [v4 volume];
        if (volume != v33) {
          goto LABEL_26;
        }
        $C0554B60F74CC19DAE9F4AE205FD9552 v29 = self->_has;
        unsigned int v31 = v4[60];
      }
      int v34 = (*(unsigned int *)&v29 >> 5) & 1;
      if (v34 == ((v31 >> 5) & 1))
      {
        if (v34)
        {
          int thermalState = self->_thermalState;
          if (thermalState != [v4 thermalState]) {
            goto LABEL_26;
          }
          $C0554B60F74CC19DAE9F4AE205FD9552 v29 = self->_has;
          unsigned int v31 = v4[60];
        }
        int v36 = (*(unsigned int *)&v29 >> 6) & 1;
        if (v36 == ((v31 >> 6) & 1))
        {
          if (!v36
            || (float assetSelectionLatencyInSecond = self->_assetSelectionLatencyInSecond,
                [v4 assetSelectionLatencyInSecond],
                assetSelectionLatencyInSecond == v38))
          {
            BOOL v27 = 1;
            goto LABEL_27;
          }
        }
      }
    }
  }
LABEL_26:
  BOOL v27 = 0;
LABEL_27:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  double v5 = [(TTSSchemaTTSSpeechStarted *)self voiceContext];

  if (v5)
  {
    unsigned int v6 = [(TTSSchemaTTSSpeechStarted *)self voiceContext];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  double v7 = [(TTSSchemaTTSSpeechStarted *)self audioInterface];

  if (v7)
  {
    int v8 = [(TTSSchemaTTSSpeechStarted *)self audioInterface];
    PBDataWriterWriteSubmessage();
  }
  char v9 = (char)self->_has;
  if ((v9 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    char v9 = (char)self->_has;
    if ((v9 & 0x20) == 0)
    {
LABEL_13:
      if ((v9 & 0x40) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_14:
  }
    PBDataWriterWriteFloatField();
LABEL_15:
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSSpeechStartedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteAssetSelectionLatencyInSecond
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasAssetSelectionLatencyInSecond:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasAssetSelectionLatencyInSecond
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAssetSelectionLatencyInSecond:(float)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_float assetSelectionLatencyInSecond = a3;
}

- (void)deleteThermalState
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasThermalState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasThermalState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setThermalState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int thermalState = a3;
}

- (void)deleteVolume
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasVolume:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVolume
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setVolume:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_float volume = a3;
}

- (void)deleteAudioInterface
{
}

- (BOOL)hasAudioInterface
{
  return self->_audioInterface != 0;
}

- (void)deleteSynthesisEffect
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasSynthesisEffect:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSynthesisEffect
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSynthesisEffect:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
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
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSynthesisSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSynthesisSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSynthesisSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int synthesisSource = a3;
}

- (void)deleteCustomerPerceivedLatencyInSecond
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCustomerPerceivedLatencyInSecond:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCustomerPerceivedLatencyInSecond
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCustomerPerceivedLatencyInSecond:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float customerPerceivedLatencyInSecond = a3;
}

- (void)deleteAudioOutputRoute
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioOutputRoute:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioOutputRoute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioOutputRoute:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int audioOutputRoute = a3;
}

@end