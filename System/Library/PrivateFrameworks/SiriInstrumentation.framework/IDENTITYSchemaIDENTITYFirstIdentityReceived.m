@interface IDENTITYSchemaIDENTITYFirstIdentityReceived
- (BOOL)hasIdentityScoreCard;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDENTITYSchemaIDENTITYFirstIdentityReceived)initWithDictionary:(id)a3;
- (IDENTITYSchemaIDENTITYFirstIdentityReceived)initWithJSON:(id)a3;
- (IDENTITYSchemaIDENTITYIDScoreCard)identityScoreCard;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIdentityScoreCard;
- (void)setHasIdentityScoreCard:(BOOL)a3;
- (void)setIdentityScoreCard:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDENTITYSchemaIDENTITYFirstIdentityReceived

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDENTITYSchemaIDENTITYFirstIdentityReceived;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)self identityScoreCard];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)self deleteIdentityScoreCard];
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

- (void)setHasIdentityScoreCard:(BOOL)a3
{
  self->_hasIdentityScoreCard = a3;
}

- (void)setIdentityScoreCard:(id)a3
{
}

- (IDENTITYSchemaIDENTITYIDScoreCard)identityScoreCard
{
  return self->_identityScoreCard;
}

- (IDENTITYSchemaIDENTITYFirstIdentityReceived)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDENTITYSchemaIDENTITYFirstIdentityReceived;
  v5 = [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"identityScoreCard"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IDENTITYSchemaIDENTITYIDScoreCard alloc] initWithDictionary:v6];
      [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)v5 setIdentityScoreCard:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (IDENTITYSchemaIDENTITYFirstIdentityReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)self dictionaryRepresentation];
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
  if (self->_identityScoreCard)
  {
    id v4 = [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)self identityScoreCard];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"identityScoreCard"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"identityScoreCard"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(IDENTITYSchemaIDENTITYIDScoreCard *)self->_identityScoreCard hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)self identityScoreCard];
    v6 = [v4 identityScoreCard];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)self identityScoreCard];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)self identityScoreCard];
      v11 = [v4 identityScoreCard];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)self identityScoreCard];

  if (v4)
  {
    v5 = [(IDENTITYSchemaIDENTITYFirstIdentityReceived *)self identityScoreCard];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYFirstIdentityReceivedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIdentityScoreCard
{
}

- (BOOL)hasIdentityScoreCard
{
  return self->_identityScoreCard != 0;
}

@end