@interface SISchemaCasinoRelationship
- (BOOL)hasCasinoFromType;
- (BOOL)hasViewIDFrom;
- (BOOL)hasViewIDTo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)viewIDFrom;
- (NSString)viewIDTo;
- (SISchemaCasinoRelationship)initWithDictionary:(id)a3;
- (SISchemaCasinoRelationship)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)casinoFromType;
- (unint64_t)hash;
- (void)deleteCasinoFromType;
- (void)deleteViewIDFrom;
- (void)deleteViewIDTo;
- (void)setCasinoFromType:(int)a3;
- (void)setHasCasinoFromType:(BOOL)a3;
- (void)setHasViewIDFrom:(BOOL)a3;
- (void)setHasViewIDTo:(BOOL)a3;
- (void)setViewIDFrom:(id)a3;
- (void)setViewIDTo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaCasinoRelationship

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewIDTo, 0);
  objc_storeStrong((id *)&self->_viewIDFrom, 0);
}

- (void)setHasViewIDTo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasViewIDFrom:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)casinoFromType
{
  return self->_casinoFromType;
}

- (void)setViewIDTo:(id)a3
{
}

- (NSString)viewIDTo
{
  return self->_viewIDTo;
}

- (void)setViewIDFrom:(id)a3
{
}

- (NSString)viewIDFrom
{
  return self->_viewIDFrom;
}

- (SISchemaCasinoRelationship)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaCasinoRelationship;
  v5 = [(SISchemaCasinoRelationship *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"viewIDFrom"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaCasinoRelationship *)v5 setViewIDFrom:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"viewIDTo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaCasinoRelationship *)v5 setViewIDTo:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"casinoFromType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaCasinoRelationship setCasinoFromType:](v5, "setCasinoFromType:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaCasinoRelationship)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaCasinoRelationship *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaCasinoRelationship *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [(SISchemaCasinoRelationship *)self casinoFromType];
    v5 = @"CASINO_UNKNOWN_CASINO_TYPE";
    if (v4 == 1) {
      v5 = @"CASINO_COMPACT";
    }
    if (v4 == 2) {
      v6 = @"CASINO_FULL";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"casinoFromType"];
  }
  if (self->_viewIDFrom)
  {
    uint64_t v7 = [(SISchemaCasinoRelationship *)self viewIDFrom];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"viewIDFrom"];
  }
  if (self->_viewIDTo)
  {
    v9 = [(SISchemaCasinoRelationship *)self viewIDTo];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"viewIDTo"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_viewIDFrom hash];
  NSUInteger v4 = [(NSString *)self->_viewIDTo hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_casinoFromType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(SISchemaCasinoRelationship *)self viewIDFrom];
  v6 = [v4 viewIDFrom];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaCasinoRelationship *)self viewIDFrom];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SISchemaCasinoRelationship *)self viewIDFrom];
    v10 = [v4 viewIDFrom];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SISchemaCasinoRelationship *)self viewIDTo];
  v6 = [v4 viewIDTo];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SISchemaCasinoRelationship *)self viewIDTo];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaCasinoRelationship *)self viewIDTo];
    v15 = [v4 viewIDTo];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int casinoFromType = self->_casinoFromType, casinoFromType == [v4 casinoFromType]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  NSUInteger v4 = [(SISchemaCasinoRelationship *)self viewIDFrom];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(SISchemaCasinoRelationship *)self viewIDTo];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = v7;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCasinoRelationshipReadFrom(self, (uint64_t)a3);
}

- (void)deleteCasinoFromType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCasinoFromType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCasinoFromType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCasinoFromType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int casinoFromType = a3;
}

- (void)deleteViewIDTo
{
}

- (BOOL)hasViewIDTo
{
  return self->_viewIDTo != 0;
}

- (void)deleteViewIDFrom
{
}

- (BOOL)hasViewIDFrom
{
  return self->_viewIDFrom != 0;
}

@end