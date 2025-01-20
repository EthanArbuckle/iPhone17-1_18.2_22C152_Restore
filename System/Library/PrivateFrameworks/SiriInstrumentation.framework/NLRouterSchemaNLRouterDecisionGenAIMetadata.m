@interface NLRouterSchemaNLRouterDecisionGenAIMetadata
- (BOOL)hasCorrectionOutcome;
- (BOOL)hasGenAIAppIntent;
- (BOOL)hasIsExplicit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicit;
- (BOOL)readFrom:(id)a3;
- (NLRouterSchemaNLRouterDecisionGenAIMetadata)initWithDictionary:(id)a3;
- (NLRouterSchemaNLRouterDecisionGenAIMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)correctionOutcome;
- (int)genAIAppIntent;
- (unint64_t)hash;
- (void)deleteCorrectionOutcome;
- (void)deleteGenAIAppIntent;
- (void)deleteIsExplicit;
- (void)setCorrectionOutcome:(int)a3;
- (void)setGenAIAppIntent:(int)a3;
- (void)setHasCorrectionOutcome:(BOOL)a3;
- (void)setHasGenAIAppIntent:(BOOL)a3;
- (void)setHasIsExplicit:(BOOL)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLRouterSchemaNLRouterDecisionGenAIMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)correctionOutcome
{
  return self->_correctionOutcome;
}

- (int)genAIAppIntent
{
  return self->_genAIAppIntent;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (NLRouterSchemaNLRouterDecisionGenAIMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLRouterSchemaNLRouterDecisionGenAIMetadata;
  v5 = [(NLRouterSchemaNLRouterDecisionGenAIMetadata *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isExplicit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterDecisionGenAIMetadata setIsExplicit:](v5, "setIsExplicit:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"genAIAppIntent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterDecisionGenAIMetadata setGenAIAppIntent:](v5, "setGenAIAppIntent:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"correctionOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLRouterSchemaNLRouterDecisionGenAIMetadata setCorrectionOutcome:](v5, "setCorrectionOutcome:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (NLRouterSchemaNLRouterDecisionGenAIMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLRouterSchemaNLRouterDecisionGenAIMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLRouterSchemaNLRouterDecisionGenAIMetadata *)self dictionaryRepresentation];
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
    int v7 = [(NLRouterSchemaNLRouterDecisionGenAIMetadata *)self correctionOutcome];
    v8 = @"NLROUTERCORRECTIONOUTCOME_UNKNOWN";
    if (v7 == 1) {
      v8 = @"NLROUTERCORRECTIONOUTCOME_NONE";
    }
    if (v7 == 2) {
      v9 = @"NLROUTERCORRECTIONOUTCOME_UNDO";
    }
    else {
      v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"correctionOutcome"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v10 = [(NLRouterSchemaNLRouterDecisionGenAIMetadata *)self genAIAppIntent] - 1;
  if (v10 > 2) {
    objc_super v11 = @"NLROUTERDECISIONGENAIAPPINTENT_UNKNOWN";
  }
  else {
    objc_super v11 = off_1E5EC1B58[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"genAIAppIntent"];
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[NLRouterSchemaNLRouterDecisionGenAIMetadata isExplicit](self, "isExplicit"));
  [v3 setObject:v5 forKeyedSubscript:@"isExplicit"];

LABEL_5:
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
  uint64_t v2 = 2654435761 * self->_isExplicit;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_genAIAppIntent;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_correctionOutcome;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $0A6373F09670DD93430646D6221A40D6 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int isExplicit = self->_isExplicit;
    if (isExplicit != [v4 isExplicit]) {
      goto LABEL_14;
    }
    $0A6373F09670DD93430646D6221A40D6 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int genAIAppIntent = self->_genAIAppIntent;
    if (genAIAppIntent == [v4 genAIAppIntent])
    {
      $0A6373F09670DD93430646D6221A40D6 has = self->_has;
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
    int correctionOutcome = self->_correctionOutcome;
    if (correctionOutcome != [v4 correctionOutcome]) {
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
    PBDataWriterWriteBOOLField();
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
  return NLRouterSchemaNLRouterDecisionGenAIMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteCorrectionOutcome
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCorrectionOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCorrectionOutcome
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCorrectionOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int correctionOutcome = a3;
}

- (void)deleteGenAIAppIntent
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasGenAIAppIntent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenAIAppIntent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setGenAIAppIntent:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int genAIAppIntent = a3;
}

- (void)deleteIsExplicit
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsExplicit:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsExplicit
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsExplicit:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isExplicit = a3;
}

@end