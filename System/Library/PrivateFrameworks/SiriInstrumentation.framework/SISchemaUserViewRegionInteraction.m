@interface SISchemaUserViewRegionInteraction
- (BOOL)hasUserViewInteraction;
- (BOOL)hasViewRegionDesignation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUserViewRegionInteraction)initWithDictionary:(id)a3;
- (SISchemaUserViewRegionInteraction)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)userViewInteraction;
- (int)viewRegionDesignation;
- (unint64_t)hash;
- (void)deleteUserViewInteraction;
- (void)deleteViewRegionDesignation;
- (void)setHasUserViewInteraction:(BOOL)a3;
- (void)setHasViewRegionDesignation:(BOOL)a3;
- (void)setUserViewInteraction:(int)a3;
- (void)setViewRegionDesignation:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUserViewRegionInteraction

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)userViewInteraction
{
  return self->_userViewInteraction;
}

- (int)viewRegionDesignation
{
  return self->_viewRegionDesignation;
}

- (SISchemaUserViewRegionInteraction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaUserViewRegionInteraction;
  v5 = [(SISchemaUserViewRegionInteraction *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"viewRegionDesignation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUserViewRegionInteraction setViewRegionDesignation:](v5, "setViewRegionDesignation:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"userViewInteraction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUserViewRegionInteraction setUserViewInteraction:](v5, "setUserViewInteraction:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (SISchemaUserViewRegionInteraction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUserViewRegionInteraction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUserViewRegionInteraction *)self dictionaryRepresentation];
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
    unsigned int v5 = [(SISchemaUserViewRegionInteraction *)self userViewInteraction] - 1;
    if (v5 > 2) {
      v6 = @"USERVIEWINTERACTION_UNKNOWN_INTERACTION";
    }
    else {
      v6 = off_1E5EB8D70[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"userViewInteraction"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(SISchemaUserViewRegionInteraction *)self viewRegionDesignation] - 1;
    if (v7 > 2) {
      v8 = @"VIEWREGIONDESIGNATION_UNKNOWN_VIEW_REGION";
    }
    else {
      v8 = off_1E5EB8D88[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"viewRegionDesignation"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_viewRegionDesignation;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_userViewInteraction;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $817474A48D065C4587A3D2F4DD8C18A5 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int viewRegionDesignation = self->_viewRegionDesignation;
    if (viewRegionDesignation != [v4 viewRegionDesignation])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $817474A48D065C4587A3D2F4DD8C18A5 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int userViewInteraction = self->_userViewInteraction;
    if (userViewInteraction != [v4 userViewInteraction]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
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
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUserViewRegionInteractionReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserViewInteraction
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUserViewInteraction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserViewInteraction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUserViewInteraction:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int userViewInteraction = a3;
}

- (void)deleteViewRegionDesignation
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasViewRegionDesignation:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasViewRegionDesignation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setViewRegionDesignation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int viewRegionDesignation = a3;
}

@end