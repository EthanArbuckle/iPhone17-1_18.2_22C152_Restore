@interface PEGASUSSchemaPEGASUSVideoExecution
- (BOOL)hasVideoExperienceProperty;
- (BOOL)hasVideoInteraction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSVideoExecution)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSVideoExecution)initWithJSON:(id)a3;
- (PEGASUSSchemaPEGASUSVideoExperienceProperty)videoExperienceProperty;
- (PEGASUSSchemaPEGASUSVideoInteraction)videoInteraction;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteVideoExperienceProperty;
- (void)deleteVideoInteraction;
- (void)setHasVideoExperienceProperty:(BOOL)a3;
- (void)setHasVideoInteraction:(BOOL)a3;
- (void)setVideoExperienceProperty:(id)a3;
- (void)setVideoInteraction:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSVideoExecution

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PEGASUSSchemaPEGASUSVideoExecution;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoInteraction];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSVideoExecution *)self deleteVideoInteraction];
  }
  v9 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoExperienceProperty];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PEGASUSSchemaPEGASUSVideoExecution *)self deleteVideoExperienceProperty];
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
  objc_storeStrong((id *)&self->_videoExperienceProperty, 0);
  objc_storeStrong((id *)&self->_videoInteraction, 0);
}

- (void)setHasVideoExperienceProperty:(BOOL)a3
{
  self->_hasVideoExperienceProperty = a3;
}

- (void)setHasVideoInteraction:(BOOL)a3
{
  self->_hasVideoInteraction = a3;
}

- (void)setVideoExperienceProperty:(id)a3
{
}

- (PEGASUSSchemaPEGASUSVideoExperienceProperty)videoExperienceProperty
{
  return self->_videoExperienceProperty;
}

- (void)setVideoInteraction:(id)a3
{
}

- (PEGASUSSchemaPEGASUSVideoInteraction)videoInteraction
{
  return self->_videoInteraction;
}

- (PEGASUSSchemaPEGASUSVideoExecution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PEGASUSSchemaPEGASUSVideoExecution;
  v5 = [(PEGASUSSchemaPEGASUSVideoExecution *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"videoInteraction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PEGASUSSchemaPEGASUSVideoInteraction alloc] initWithDictionary:v6];
      [(PEGASUSSchemaPEGASUSVideoExecution *)v5 setVideoInteraction:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"videoExperienceProperty"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PEGASUSSchemaPEGASUSVideoExperienceProperty alloc] initWithDictionary:v8];
      [(PEGASUSSchemaPEGASUSVideoExecution *)v5 setVideoExperienceProperty:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSVideoExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSVideoExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSVideoExecution *)self dictionaryRepresentation];
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
  if (self->_videoExperienceProperty)
  {
    id v4 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoExperienceProperty];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"videoExperienceProperty"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"videoExperienceProperty"];
    }
  }
  if (self->_videoInteraction)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoInteraction];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"videoInteraction"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"videoInteraction"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PEGASUSSchemaPEGASUSVideoInteraction *)self->_videoInteraction hash];
  return [(PEGASUSSchemaPEGASUSVideoExperienceProperty *)self->_videoExperienceProperty hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoInteraction];
  v6 = [v4 videoInteraction];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoInteraction];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoInteraction];
    v10 = [v4 videoInteraction];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoExperienceProperty];
  v6 = [v4 videoExperienceProperty];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoExperienceProperty];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoExperienceProperty];
    v15 = [v4 videoExperienceProperty];
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
  id v4 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoInteraction];

  if (v4)
  {
    v5 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoInteraction];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoExperienceProperty];

  if (v6)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSVideoExecution *)self videoExperienceProperty];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSVideoExecutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteVideoExperienceProperty
{
}

- (BOOL)hasVideoExperienceProperty
{
  return self->_videoExperienceProperty != 0;
}

- (void)deleteVideoInteraction
{
}

- (BOOL)hasVideoInteraction
{
  return self->_videoInteraction != 0;
}

@end