@interface FLSchemaFLCandidateInteraction
- (BOOL)hasAlignment;
- (BOOL)hasIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLSchemaFLCandidateIdentifier)identifier;
- (FLSchemaFLCandidateInteraction)initWithDictionary:(id)a3;
- (FLSchemaFLCandidateInteraction)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)alignment;
- (unint64_t)hash;
- (void)deleteAlignment;
- (void)deleteIdentifier;
- (void)setAlignment:(int)a3;
- (void)setHasAlignment:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLSchemaFLCandidateInteraction

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FLSchemaFLCandidateInteraction;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(FLSchemaFLCandidateInteraction *)self identifier];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(FLSchemaFLCandidateInteraction *)self deleteIdentifier];
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

- (void)setHasIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)alignment
{
  return self->_alignment;
}

- (void)setIdentifier:(id)a3
{
}

- (FLSchemaFLCandidateIdentifier)identifier
{
  return self->_identifier;
}

- (FLSchemaFLCandidateInteraction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLSchemaFLCandidateInteraction;
  v5 = [(FLSchemaFLCandidateInteraction *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLSchemaFLCandidateIdentifier alloc] initWithDictionary:v6];
      [(FLSchemaFLCandidateInteraction *)v5 setIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"alignment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLCandidateInteraction setAlignment:](v5, "setAlignment:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (FLSchemaFLCandidateInteraction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLSchemaFLCandidateInteraction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLSchemaFLCandidateInteraction *)self dictionaryRepresentation];
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
    unsigned int v4 = [(FLSchemaFLCandidateInteraction *)self alignment] - 1;
    if (v4 > 7) {
      v5 = @"FLUSERALIGNMENTCATEGORY_UNKNOWN";
    }
    else {
      v5 = off_1E5EC0480[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"alignment"];
  }
  if (self->_identifier)
  {
    v6 = [(FLSchemaFLCandidateInteraction *)self identifier];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"identifier"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"identifier"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FLSchemaFLCandidateIdentifier *)self->_identifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_alignment;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(FLSchemaFLCandidateInteraction *)self identifier];
  v6 = [v4 identifier];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(FLSchemaFLCandidateInteraction *)self identifier];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(FLSchemaFLCandidateInteraction *)self identifier];
    objc_super v11 = [v4 identifier];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int alignment = self->_alignment;
    if (alignment != [v4 alignment]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(FLSchemaFLCandidateInteraction *)self identifier];

  if (v4)
  {
    v5 = [(FLSchemaFLCandidateInteraction *)self identifier];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLCandidateInteractionReadFrom(self, (uint64_t)a3);
}

- (void)deleteAlignment
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAlignment:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlignment
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAlignment:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int alignment = a3;
}

- (void)deleteIdentifier
{
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

@end