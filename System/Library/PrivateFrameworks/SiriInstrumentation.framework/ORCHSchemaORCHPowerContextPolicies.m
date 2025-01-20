@interface ORCHSchemaORCHPowerContextPolicies
- (BOOL)hasAsrAssistantPolicy;
- (BOOL)hasAsrDictationPolicy;
- (BOOL)hasTtsPolicy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHPowerContextPolicies)initWithDictionary:(id)a3;
- (ORCHSchemaORCHPowerContextPolicies)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)asrAssistantPolicy;
- (int)asrDictationPolicy;
- (int)ttsPolicy;
- (unint64_t)hash;
- (void)deleteAsrAssistantPolicy;
- (void)deleteAsrDictationPolicy;
- (void)deleteTtsPolicy;
- (void)setAsrAssistantPolicy:(int)a3;
- (void)setAsrDictationPolicy:(int)a3;
- (void)setHasAsrAssistantPolicy:(BOOL)a3;
- (void)setHasAsrDictationPolicy:(BOOL)a3;
- (void)setHasTtsPolicy:(BOOL)a3;
- (void)setTtsPolicy:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHPowerContextPolicies

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)ttsPolicy
{
  return self->_ttsPolicy;
}

- (int)asrDictationPolicy
{
  return self->_asrDictationPolicy;
}

- (int)asrAssistantPolicy
{
  return self->_asrAssistantPolicy;
}

- (ORCHSchemaORCHPowerContextPolicies)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHPowerContextPolicies;
  v5 = [(ORCHSchemaORCHPowerContextPolicies *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"asrAssistantPolicy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHPowerContextPolicies setAsrAssistantPolicy:](v5, "setAsrAssistantPolicy:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"asrDictationPolicy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHPowerContextPolicies setAsrDictationPolicy:](v5, "setAsrDictationPolicy:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"ttsPolicy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHPowerContextPolicies setTtsPolicy:](v5, "setTtsPolicy:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHPowerContextPolicies)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHPowerContextPolicies *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHPowerContextPolicies *)self dictionaryRepresentation];
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
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    unsigned int v7 = [(ORCHSchemaORCHPowerContextPolicies *)self asrDictationPolicy] - 1;
    if (v7 > 3) {
      v8 = @"ORCHASRPOWERCONTEXTPOLICY_UNKNOWN";
    }
    else {
      v8 = off_1E5EBCD28[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"asrDictationPolicy"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  unsigned int v5 = [(ORCHSchemaORCHPowerContextPolicies *)self asrAssistantPolicy] - 1;
  if (v5 > 3) {
    v6 = @"ORCHASRPOWERCONTEXTPOLICY_UNKNOWN";
  }
  else {
    v6 = off_1E5EBCD28[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"asrAssistantPolicy"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_13:
    unsigned int v9 = [(ORCHSchemaORCHPowerContextPolicies *)self ttsPolicy] - 1;
    if (v9 > 2) {
      v10 = @"ORCHTTSPOWERCONTEXTPOLICY_UNKNOWN";
    }
    else {
      v10 = off_1E5EBCD48[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"ttsPolicy"];
  }
LABEL_17:
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
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_asrAssistantPolicy;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_asrDictationPolicy;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_ttsPolicy;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $6296049F541958650971E0097E4B7BB4 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int asrAssistantPolicy = self->_asrAssistantPolicy;
    if (asrAssistantPolicy != [v4 asrAssistantPolicy]) {
      goto LABEL_14;
    }
    $6296049F541958650971E0097E4B7BB4 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int asrDictationPolicy = self->_asrDictationPolicy;
    if (asrDictationPolicy == [v4 asrDictationPolicy])
    {
      $6296049F541958650971E0097E4B7BB4 has = self->_has;
      unsigned int v6 = v4[20];
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
    int ttsPolicy = self->_ttsPolicy;
    if (ttsPolicy != [v4 ttsPolicy]) {
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
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHPowerContextPoliciesReadFrom(self, (uint64_t)a3);
}

- (void)deleteTtsPolicy
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasTtsPolicy:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTtsPolicy
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTtsPolicy:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int ttsPolicy = a3;
}

- (void)deleteAsrDictationPolicy
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAsrDictationPolicy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAsrDictationPolicy
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAsrDictationPolicy:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int asrDictationPolicy = a3;
}

- (void)deleteAsrAssistantPolicy
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAsrAssistantPolicy:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAsrAssistantPolicy
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAsrAssistantPolicy:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int asrAssistantPolicy = a3;
}

@end