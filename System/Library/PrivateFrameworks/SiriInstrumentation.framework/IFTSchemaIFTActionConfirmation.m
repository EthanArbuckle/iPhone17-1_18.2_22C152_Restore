@interface IFTSchemaIFTActionConfirmation
- (BOOL)confirmed;
- (BOOL)denied;
- (BOOL)exists;
- (BOOL)hasConfirmed;
- (BOOL)hasDenied;
- (BOOL)hasExists;
- (BOOL)hasSelectedInDisambiguation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTActionConfirmation)initWithDictionary:(id)a3;
- (IFTSchemaIFTActionConfirmation)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)selectedInDisambiguation;
- (unint64_t)hash;
- (unint64_t)whichOneof_Promptselection;
- (void)deleteConfirmed;
- (void)deleteDenied;
- (void)deleteExists;
- (void)deleteSelectedInDisambiguation;
- (void)setConfirmed:(BOOL)a3;
- (void)setDenied:(BOOL)a3;
- (void)setExists:(BOOL)a3;
- (void)setHasConfirmed:(BOOL)a3;
- (void)setHasDenied:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasSelectedInDisambiguation:(BOOL)a3;
- (void)setSelectedInDisambiguation:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTActionConfirmation

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)setHasDenied:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (BOOL)hasDenied
{
  return (BOOL)self->_has;
}

- (void)setHasSelectedInDisambiguation:(BOOL)a3
{
  *(&self->_denied + 3) = a3;
}

- (BOOL)hasSelectedInDisambiguation
{
  return *(&self->_denied + 3);
}

- (void)setHasConfirmed:(BOOL)a3
{
  *(&self->_denied + 2) = a3;
}

- (BOOL)hasConfirmed
{
  return *(&self->_denied + 2);
}

- (BOOL)exists
{
  return self->_exists;
}

- (unint64_t)whichOneof_Promptselection
{
  return *(void *)&self->_hasConfirmed;
}

- (IFTSchemaIFTActionConfirmation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTActionConfirmation;
  v5 = [(IFTSchemaIFTActionConfirmation *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionConfirmation setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"confirmed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionConfirmation setConfirmed:](v5, "setConfirmed:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"selectedInDisambiguation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionConfirmation setSelectedInDisambiguation:](v5, "setSelectedInDisambiguation:", [v8 longLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"denied"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionConfirmation setDenied:](v5, "setDenied:", [v9 BOOLValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (IFTSchemaIFTActionConfirmation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTActionConfirmation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTActionConfirmation *)self dictionaryRepresentation];
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
  uint64_t v4 = *(void *)&self->_hasConfirmed;
  if (v4 == 2)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionConfirmation confirmed](self, "confirmed"));
    [v3 setObject:v5 forKeyedSubscript:@"confirmed"];

    uint64_t v4 = *(void *)&self->_hasConfirmed;
  }
  if (v4 == 4)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionConfirmation denied](self, "denied"));
    [v3 setObject:v6 forKeyedSubscript:@"denied"];
  }
  if (*(&self->_denied + 1))
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionConfirmation exists](self, "exists"));
    [v3 setObject:v7 forKeyedSubscript:@"exists"];
  }
  if (*(void *)&self->_hasConfirmed == 3)
  {
    v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaIFTActionConfirmation selectedInDisambiguation](self, "selectedInDisambiguation"));
    [v3 setObject:v8 forKeyedSubscript:@"selectedInDisambiguation"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_denied + 1)) {
    uint64_t v2 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void *)&self->_hasConfirmed;
  switch(v3)
  {
    case 4:
      uint64_t v4 = 0;
      uint64_t v6 = 0;
      uint64_t v5 = 2654435761 * self->_denied;
      break;
    case 3:
      uint64_t v6 = 0;
      uint64_t v5 = 0;
      uint64_t v4 = 2654435761 * self->_selectedInDisambiguation;
      break;
    case 2:
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 2654435761 * self->_confirmed;
      break;
    default:
      uint64_t v4 = 0;
      uint64_t v6 = 0;
      uint64_t v5 = 0;
      break;
  }
  return v4 ^ v2 ^ v6 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (uint64_t v5 = *(void *)&self->_hasConfirmed, v5 == objc_msgSend(v4, "whichOneof_Promptselection"))
    && *(&self->_denied + 1) == (v4[25] & 1)
    && (!*(&self->_denied + 1) || (int exists = self->_exists, exists == [v4 exists]))
    && (int confirmed = self->_confirmed, confirmed == [v4 confirmed])
    && (int64_t selectedInDisambiguation = self->_selectedInDisambiguation,
        selectedInDisambiguation == [v4 selectedInDisambiguation]))
  {
    int denied = self->_denied;
    BOOL v10 = denied == [v4 denied];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(&self->_denied + 1)) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v4 = *(void *)&self->_hasConfirmed;
  if (v4 == 2)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v4 = *(void *)&self->_hasConfirmed;
  }
  if (v4 == 3)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v4 = *(void *)&self->_hasConfirmed;
  }
  if (v4 == 4) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionConfirmationReadFrom(self, (uint64_t)a3);
}

- (void)deleteDenied
{
  if (*(void *)&self->_hasConfirmed == 4)
  {
    *(void *)&self->_hasConfirmed = 0;
    self->_int denied = 0;
  }
}

- (BOOL)denied
{
  return *(void *)&self->_hasConfirmed == 4 && self->_denied;
}

- (void)setDenied:(BOOL)a3
{
  self->_int confirmed = 0;
  self->_int64_t selectedInDisambiguation = 0;
  *(void *)&self->_hasConfirmed = 4;
  self->_int denied = a3;
}

- (void)deleteSelectedInDisambiguation
{
  if (*(void *)&self->_hasConfirmed == 3)
  {
    *(void *)&self->_hasConfirmed = 0;
    self->_int64_t selectedInDisambiguation = 0;
  }
}

- (int64_t)selectedInDisambiguation
{
  if (*(void *)&self->_hasConfirmed == 3) {
    return self->_selectedInDisambiguation;
  }
  else {
    return 0;
  }
}

- (void)setSelectedInDisambiguation:(int64_t)a3
{
  self->_int confirmed = 0;
  self->_int denied = 0;
  *(void *)&self->_hasConfirmed = 3;
  self->_int64_t selectedInDisambiguation = a3;
}

- (void)deleteConfirmed
{
  if (*(void *)&self->_hasConfirmed == 2)
  {
    *(void *)&self->_hasConfirmed = 0;
    self->_int confirmed = 0;
  }
}

- (BOOL)confirmed
{
  return *(void *)&self->_hasConfirmed == 2 && self->_confirmed;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_int64_t selectedInDisambiguation = 0;
  self->_int denied = 0;
  *(void *)&self->_hasConfirmed = 2;
  self->_int confirmed = a3;
}

- (void)deleteExists
{
  *(&self->_denied + 1) &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(&self->_denied + 1) = *(&self->_denied + 1) & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(&self->_denied + 1);
}

- (void)setExists:(BOOL)a3
{
  *(&self->_denied + 1) |= 1u;
  self->_int exists = a3;
}

@end