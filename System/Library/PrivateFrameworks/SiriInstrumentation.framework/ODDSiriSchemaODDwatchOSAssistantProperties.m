@interface ODDSiriSchemaODDwatchOSAssistantProperties
- (BOOL)hasHeadGestures;
- (BOOL)hasIsRaiseToSpeakEnabled;
- (BOOL)hasIsSiriTryItCompleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRaiseToSpeakEnabled;
- (BOOL)isSiriTryItCompleted;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDHeadGestureProperties)headGestures;
- (ODDSiriSchemaODDwatchOSAssistantProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDwatchOSAssistantProperties)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHeadGestures;
- (void)deleteIsRaiseToSpeakEnabled;
- (void)deleteIsSiriTryItCompleted;
- (void)setHasHeadGestures:(BOOL)a3;
- (void)setHasIsRaiseToSpeakEnabled:(BOOL)a3;
- (void)setHasIsSiriTryItCompleted:(BOOL)a3;
- (void)setHeadGestures:(id)a3;
- (void)setIsRaiseToSpeakEnabled:(BOOL)a3;
- (void)setIsSiriTryItCompleted:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDwatchOSAssistantProperties

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDwatchOSAssistantProperties;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDwatchOSAssistantProperties *)self headGestures];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDwatchOSAssistantProperties *)self deleteHeadGestures];
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

- (void)setHasHeadGestures:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHeadGestures:(id)a3
{
}

- (ODDSiriSchemaODDHeadGestureProperties)headGestures
{
  return self->_headGestures;
}

- (BOOL)isSiriTryItCompleted
{
  return self->_isSiriTryItCompleted;
}

- (BOOL)isRaiseToSpeakEnabled
{
  return self->_isRaiseToSpeakEnabled;
}

- (ODDSiriSchemaODDwatchOSAssistantProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDwatchOSAssistantProperties;
  v5 = [(ODDSiriSchemaODDwatchOSAssistantProperties *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isRaiseToSpeakEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDwatchOSAssistantProperties setIsRaiseToSpeakEnabled:](v5, "setIsRaiseToSpeakEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isSiriTryItCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDwatchOSAssistantProperties setIsSiriTryItCompleted:](v5, "setIsSiriTryItCompleted:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"headGestures"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[ODDSiriSchemaODDHeadGestureProperties alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDwatchOSAssistantProperties *)v5 setHeadGestures:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDwatchOSAssistantProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDwatchOSAssistantProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDwatchOSAssistantProperties *)self dictionaryRepresentation];
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
  if (self->_headGestures)
  {
    id v4 = [(ODDSiriSchemaODDwatchOSAssistantProperties *)self headGestures];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"headGestures"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"headGestures"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDwatchOSAssistantProperties isRaiseToSpeakEnabled](self, "isRaiseToSpeakEnabled"));
    [v3 setObject:v8 forKeyedSubscript:@"isRaiseToSpeakEnabled"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDwatchOSAssistantProperties isSiriTryItCompleted](self, "isSiriTryItCompleted"));
    [v3 setObject:v9 forKeyedSubscript:@"isSiriTryItCompleted"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isRaiseToSpeakEnabled;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(ODDSiriSchemaODDHeadGestureProperties *)self->_headGestures hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isSiriTryItCompleted;
  return v3 ^ v2 ^ [(ODDSiriSchemaODDHeadGestureProperties *)self->_headGestures hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $086211C476374C210918F87F91E06018 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int isRaiseToSpeakEnabled = self->_isRaiseToSpeakEnabled;
    if (isRaiseToSpeakEnabled != [v4 isRaiseToSpeakEnabled]) {
      goto LABEL_14;
    }
    $086211C476374C210918F87F91E06018 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (int isSiriTryItCompleted = self->_isSiriTryItCompleted,
          isSiriTryItCompleted == [v4 isSiriTryItCompleted]))
    {
      v10 = [(ODDSiriSchemaODDwatchOSAssistantProperties *)self headGestures];
      v11 = [v4 headGestures];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(ODDSiriSchemaODDwatchOSAssistantProperties *)self headGestures];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(ODDSiriSchemaODDwatchOSAssistantProperties *)self headGestures];
        v16 = [v4 headGestures];
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
  v5 = [(ODDSiriSchemaODDwatchOSAssistantProperties *)self headGestures];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(ODDSiriSchemaODDwatchOSAssistantProperties *)self headGestures];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDwatchOSAssistantPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteHeadGestures
{
}

- (BOOL)hasHeadGestures
{
  return self->_headGestures != 0;
}

- (void)deleteIsSiriTryItCompleted
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsSiriTryItCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsSiriTryItCompleted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsSiriTryItCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isSiriTryItCompleted = a3;
}

- (void)deleteIsRaiseToSpeakEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsRaiseToSpeakEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsRaiseToSpeakEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsRaiseToSpeakEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isRaiseToSpeakEnabled = a3;
}

@end