@interface PLUSSchemaPLUSInferencePluginCompleted
- (BOOL)hasNumberOfContactSuggestionsGenerated;
- (BOOL)hasNumberOfContactSuggestionsRemoved;
- (BOOL)hasNumberOfContactSuggestionsUpdated;
- (BOOL)hasNumberOfConversationsReviewed;
- (BOOL)hasNumberOfGroundTruthsGenerated;
- (BOOL)hasNumberOfTurnsReviewed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSInferencePluginCompleted)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSInferencePluginCompleted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numberOfContactSuggestionsGenerated;
- (unsigned)numberOfContactSuggestionsRemoved;
- (unsigned)numberOfContactSuggestionsUpdated;
- (unsigned)numberOfConversationsReviewed;
- (unsigned)numberOfGroundTruthsGenerated;
- (unsigned)numberOfTurnsReviewed;
- (void)deleteNumberOfContactSuggestionsGenerated;
- (void)deleteNumberOfContactSuggestionsRemoved;
- (void)deleteNumberOfContactSuggestionsUpdated;
- (void)deleteNumberOfConversationsReviewed;
- (void)deleteNumberOfGroundTruthsGenerated;
- (void)deleteNumberOfTurnsReviewed;
- (void)setHasNumberOfContactSuggestionsGenerated:(BOOL)a3;
- (void)setHasNumberOfContactSuggestionsRemoved:(BOOL)a3;
- (void)setHasNumberOfContactSuggestionsUpdated:(BOOL)a3;
- (void)setHasNumberOfConversationsReviewed:(BOOL)a3;
- (void)setHasNumberOfGroundTruthsGenerated:(BOOL)a3;
- (void)setHasNumberOfTurnsReviewed:(BOOL)a3;
- (void)setNumberOfContactSuggestionsGenerated:(unsigned int)a3;
- (void)setNumberOfContactSuggestionsRemoved:(unsigned int)a3;
- (void)setNumberOfContactSuggestionsUpdated:(unsigned int)a3;
- (void)setNumberOfConversationsReviewed:(unsigned int)a3;
- (void)setNumberOfGroundTruthsGenerated:(unsigned int)a3;
- (void)setNumberOfTurnsReviewed:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSInferencePluginCompleted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)numberOfTurnsReviewed
{
  return self->_numberOfTurnsReviewed;
}

- (unsigned)numberOfContactSuggestionsRemoved
{
  return self->_numberOfContactSuggestionsRemoved;
}

- (unsigned)numberOfContactSuggestionsUpdated
{
  return self->_numberOfContactSuggestionsUpdated;
}

- (unsigned)numberOfContactSuggestionsGenerated
{
  return self->_numberOfContactSuggestionsGenerated;
}

- (unsigned)numberOfGroundTruthsGenerated
{
  return self->_numberOfGroundTruthsGenerated;
}

- (unsigned)numberOfConversationsReviewed
{
  return self->_numberOfConversationsReviewed;
}

- (PLUSSchemaPLUSInferencePluginCompleted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSInferencePluginCompleted;
  v5 = [(PLUSSchemaPLUSInferencePluginCompleted *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numberOfConversationsReviewed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfConversationsReviewed:](v5, "setNumberOfConversationsReviewed:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numberOfGroundTruthsGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfGroundTruthsGenerated:](v5, "setNumberOfGroundTruthsGenerated:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numberOfContactSuggestionsGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfContactSuggestionsGenerated:](v5, "setNumberOfContactSuggestionsGenerated:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"numberOfContactSuggestionsUpdated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfContactSuggestionsUpdated:](v5, "setNumberOfContactSuggestionsUpdated:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numberOfContactSuggestionsRemoved"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfContactSuggestionsRemoved:](v5, "setNumberOfContactSuggestionsRemoved:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"numberOfTurnsReviewed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSInferencePluginCompleted setNumberOfTurnsReviewed:](v5, "setNumberOfTurnsReviewed:", [v11 unsignedIntValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSInferencePluginCompleted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSInferencePluginCompleted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSInferencePluginCompleted *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfContactSuggestionsGenerated](self, "numberOfContactSuggestionsGenerated"));
    [v3 setObject:v7 forKeyedSubscript:@"numberOfContactSuggestionsGenerated"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfContactSuggestionsRemoved](self, "numberOfContactSuggestionsRemoved"));
  [v3 setObject:v8 forKeyedSubscript:@"numberOfContactSuggestionsRemoved"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfContactSuggestionsUpdated](self, "numberOfContactSuggestionsUpdated"));
  [v3 setObject:v9 forKeyedSubscript:@"numberOfContactSuggestionsUpdated"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfConversationsReviewed](self, "numberOfConversationsReviewed"));
  [v3 setObject:v10 forKeyedSubscript:@"numberOfConversationsReviewed"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfGroundTruthsGenerated](self, "numberOfGroundTruthsGenerated"));
  [v3 setObject:v11 forKeyedSubscript:@"numberOfGroundTruthsGenerated"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSInferencePluginCompleted numberOfTurnsReviewed](self, "numberOfTurnsReviewed"));
    [v3 setObject:v5 forKeyedSubscript:@"numberOfTurnsReviewed"];
  }
LABEL_8:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_numberOfConversationsReviewed;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_numberOfGroundTruthsGenerated;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
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
    uint64_t v4 = 2654435761 * self->_numberOfContactSuggestionsGenerated;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_numberOfContactSuggestionsUpdated;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_numberOfContactSuggestionsRemoved;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_numberOfTurnsReviewed;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $1BAE7CEF085383C47556127327B3B1C0 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numberOfConversationsReviewed = self->_numberOfConversationsReviewed;
    if (numberOfConversationsReviewed != [v4 numberOfConversationsReviewed]) {
      goto LABEL_26;
    }
    $1BAE7CEF085383C47556127327B3B1C0 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v8)
  {
    unsigned int numberOfGroundTruthsGenerated = self->_numberOfGroundTruthsGenerated;
    if (numberOfGroundTruthsGenerated != [v4 numberOfGroundTruthsGenerated]) {
      goto LABEL_26;
    }
    $1BAE7CEF085383C47556127327B3B1C0 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v10)
  {
    unsigned int numberOfContactSuggestionsGenerated = self->_numberOfContactSuggestionsGenerated;
    if (numberOfContactSuggestionsGenerated != [v4 numberOfContactSuggestionsGenerated]) {
      goto LABEL_26;
    }
    $1BAE7CEF085383C47556127327B3B1C0 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v12)
  {
    unsigned int numberOfContactSuggestionsUpdated = self->_numberOfContactSuggestionsUpdated;
    if (numberOfContactSuggestionsUpdated != [v4 numberOfContactSuggestionsUpdated]) {
      goto LABEL_26;
    }
    $1BAE7CEF085383C47556127327B3B1C0 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_26;
  }
  if (v14)
  {
    unsigned int numberOfContactSuggestionsRemoved = self->_numberOfContactSuggestionsRemoved;
    if (numberOfContactSuggestionsRemoved == [v4 numberOfContactSuggestionsRemoved])
    {
      $1BAE7CEF085383C47556127327B3B1C0 has = self->_has;
      unsigned int v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    BOOL v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_26;
  }
  if (v16)
  {
    unsigned int numberOfTurnsReviewed = self->_numberOfTurnsReviewed;
    if (numberOfTurnsReviewed != [v4 numberOfTurnsReviewed]) {
      goto LABEL_26;
    }
  }
  BOOL v18 = 1;
LABEL_27:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSInferencePluginCompletedReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumberOfTurnsReviewed
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasNumberOfTurnsReviewed:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumberOfTurnsReviewed
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNumberOfTurnsReviewed:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int numberOfTurnsReviewed = a3;
}

- (void)deleteNumberOfContactSuggestionsRemoved
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasNumberOfContactSuggestionsRemoved:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumberOfContactSuggestionsRemoved
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setNumberOfContactSuggestionsRemoved:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int numberOfContactSuggestionsRemoved = a3;
}

- (void)deleteNumberOfContactSuggestionsUpdated
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasNumberOfContactSuggestionsUpdated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfContactSuggestionsUpdated
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumberOfContactSuggestionsUpdated:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int numberOfContactSuggestionsUpdated = a3;
}

- (void)deleteNumberOfContactSuggestionsGenerated
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumberOfContactSuggestionsGenerated:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfContactSuggestionsGenerated
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumberOfContactSuggestionsGenerated:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int numberOfContactSuggestionsGenerated = a3;
}

- (void)deleteNumberOfGroundTruthsGenerated
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumberOfGroundTruthsGenerated:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfGroundTruthsGenerated
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumberOfGroundTruthsGenerated:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numberOfGroundTruthsGenerated = a3;
}

- (void)deleteNumberOfConversationsReviewed
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumberOfConversationsReviewed:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfConversationsReviewed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumberOfConversationsReviewed:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numberOfConversationsReviewed = a3;
}

@end