@interface SISchemaPersonalization
- (BOOL)appleMusicSubscriber;
- (BOOL)hasAppleMusicSubscriber;
- (BOOL)hasPersonalDomainsSetup;
- (BOOL)hasVoiceSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)personalDomainsSetup;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaPersonalization)initWithDictionary:(id)a3;
- (SISchemaPersonalization)initWithJSON:(id)a3;
- (SISchemaVoiceSettings)voiceSettings;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAppleMusicSubscriber;
- (void)deletePersonalDomainsSetup;
- (void)deleteVoiceSettings;
- (void)setAppleMusicSubscriber:(BOOL)a3;
- (void)setHasAppleMusicSubscriber:(BOOL)a3;
- (void)setHasPersonalDomainsSetup:(BOOL)a3;
- (void)setHasVoiceSettings:(BOOL)a3;
- (void)setPersonalDomainsSetup:(BOOL)a3;
- (void)setVoiceSettings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaPersonalization

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaPersonalization;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaPersonalization *)self voiceSettings];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaPersonalization *)self deleteVoiceSettings];
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

- (void)setHasVoiceSettings:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setVoiceSettings:(id)a3
{
}

- (SISchemaVoiceSettings)voiceSettings
{
  return self->_voiceSettings;
}

- (BOOL)appleMusicSubscriber
{
  return self->_appleMusicSubscriber;
}

- (BOOL)personalDomainsSetup
{
  return self->_personalDomainsSetup;
}

- (SISchemaPersonalization)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaPersonalization;
  v5 = [(SISchemaPersonalization *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"personalDomainsSetup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaPersonalization setPersonalDomainsSetup:](v5, "setPersonalDomainsSetup:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"appleMusicSubscriber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaPersonalization setAppleMusicSubscriber:](v5, "setAppleMusicSubscriber:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"voiceSettings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaVoiceSettings alloc] initWithDictionary:v8];
      [(SISchemaPersonalization *)v5 setVoiceSettings:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaPersonalization)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaPersonalization *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaPersonalization *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaPersonalization appleMusicSubscriber](self, "appleMusicSubscriber"));
    [v3 setObject:v5 forKeyedSubscript:@"appleMusicSubscriber"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaPersonalization personalDomainsSetup](self, "personalDomainsSetup"));
    [v3 setObject:v6 forKeyedSubscript:@"personalDomainsSetup"];
  }
  if (self->_voiceSettings)
  {
    uint64_t v7 = [(SISchemaPersonalization *)self voiceSettings];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"voiceSettings"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"voiceSettings"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_personalDomainsSetup;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(SISchemaVoiceSettings *)self->_voiceSettings hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_appleMusicSubscriber;
  return v3 ^ v2 ^ [(SISchemaVoiceSettings *)self->_voiceSettings hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $4142FBF9193150CF46D88E01D576423E has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int personalDomainsSetup = self->_personalDomainsSetup;
    if (personalDomainsSetup != [v4 personalDomainsSetup]) {
      goto LABEL_14;
    }
    $4142FBF9193150CF46D88E01D576423E has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (int appleMusicSubscriber = self->_appleMusicSubscriber,
          appleMusicSubscriber == [v4 appleMusicSubscriber]))
    {
      v10 = [(SISchemaPersonalization *)self voiceSettings];
      v11 = [v4 voiceSettings];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(SISchemaPersonalization *)self voiceSettings];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(SISchemaPersonalization *)self voiceSettings];
        v16 = [v4 voiceSettings];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  v5 = [(SISchemaPersonalization *)self voiceSettings];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(SISchemaPersonalization *)self voiceSettings];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaPersonalizationReadFrom(self, (uint64_t)a3);
}

- (void)deleteVoiceSettings
{
}

- (BOOL)hasVoiceSettings
{
  return self->_voiceSettings != 0;
}

- (void)deleteAppleMusicSubscriber
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAppleMusicSubscriber:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAppleMusicSubscriber
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppleMusicSubscriber:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int appleMusicSubscriber = a3;
}

- (void)deletePersonalDomainsSetup
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPersonalDomainsSetup:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPersonalDomainsSetup
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPersonalDomainsSetup:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int personalDomainsSetup = a3;
}

@end