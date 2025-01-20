@interface IDENTITYSchemaIDENTITYScoreCardsGenerated
- (BOOL)hasIdentityScoreCard;
- (BOOL)hasVoiceScoreCard;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDENTITYSchemaIDENTITYIDScoreCard)identityScoreCard;
- (IDENTITYSchemaIDENTITYScoreCardsGenerated)initWithDictionary:(id)a3;
- (IDENTITYSchemaIDENTITYScoreCardsGenerated)initWithJSON:(id)a3;
- (IDENTITYSchemaIDENTITYVoiceScoreCard)voiceScoreCard;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIdentityScoreCard;
- (void)deleteVoiceScoreCard;
- (void)setHasIdentityScoreCard:(BOOL)a3;
- (void)setHasVoiceScoreCard:(BOOL)a3;
- (void)setIdentityScoreCard:(id)a3;
- (void)setVoiceScoreCard:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDENTITYSchemaIDENTITYScoreCardsGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDENTITYSchemaIDENTITYScoreCardsGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self voiceScoreCard];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self deleteVoiceScoreCard];
  }
  v9 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self identityScoreCard];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self deleteIdentityScoreCard];
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
  objc_storeStrong((id *)&self->_identityScoreCard, 0);
  objc_storeStrong((id *)&self->_voiceScoreCard, 0);
}

- (void)setHasIdentityScoreCard:(BOOL)a3
{
  self->_hasIdentityScoreCard = a3;
}

- (void)setHasVoiceScoreCard:(BOOL)a3
{
  self->_hasVoiceScoreCard = a3;
}

- (void)setIdentityScoreCard:(id)a3
{
}

- (IDENTITYSchemaIDENTITYIDScoreCard)identityScoreCard
{
  return self->_identityScoreCard;
}

- (void)setVoiceScoreCard:(id)a3
{
}

- (IDENTITYSchemaIDENTITYVoiceScoreCard)voiceScoreCard
{
  return self->_voiceScoreCard;
}

- (IDENTITYSchemaIDENTITYScoreCardsGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDENTITYSchemaIDENTITYScoreCardsGenerated;
  v5 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceScoreCard"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IDENTITYSchemaIDENTITYVoiceScoreCard alloc] initWithDictionary:v6];
      [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)v5 setVoiceScoreCard:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"identityScoreCard"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IDENTITYSchemaIDENTITYIDScoreCard alloc] initWithDictionary:v8];
      [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)v5 setIdentityScoreCard:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (IDENTITYSchemaIDENTITYScoreCardsGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self dictionaryRepresentation];
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
    id v4 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self identityScoreCard];
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
  if (self->_voiceScoreCard)
  {
    uint64_t v7 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self voiceScoreCard];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"voiceScoreCard"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"voiceScoreCard"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IDENTITYSchemaIDENTITYVoiceScoreCard *)self->_voiceScoreCard hash];
  return [(IDENTITYSchemaIDENTITYIDScoreCard *)self->_identityScoreCard hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self voiceScoreCard];
  v6 = [v4 voiceScoreCard];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self voiceScoreCard];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self voiceScoreCard];
    v10 = [v4 voiceScoreCard];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self identityScoreCard];
  v6 = [v4 identityScoreCard];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self identityScoreCard];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self identityScoreCard];
    v15 = [v4 identityScoreCard];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self voiceScoreCard];

  if (v4)
  {
    v5 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self voiceScoreCard];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self identityScoreCard];

  if (v6)
  {
    uint64_t v7 = [(IDENTITYSchemaIDENTITYScoreCardsGenerated *)self identityScoreCard];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYScoreCardsGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIdentityScoreCard
{
}

- (BOOL)hasIdentityScoreCard
{
  return self->_identityScoreCard != 0;
}

- (void)deleteVoiceScoreCard
{
}

- (BOOL)hasVoiceScoreCard
{
  return self->_voiceScoreCard != 0;
}

@end