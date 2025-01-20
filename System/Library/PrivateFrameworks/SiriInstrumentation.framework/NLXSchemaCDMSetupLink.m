@interface NLXSchemaCDMSetupLink
- (BOOL)hasSiriClientSetupLink;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMSetupLink)initWithDictionary:(id)a3;
- (NLXSchemaCDMSetupLink)initWithJSON:(id)a3;
- (NLXSchemaCDMSiriClientSetupLink)siriClientSetupLink;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichNlxclients;
- (void)deleteSiriClientSetupLink;
- (void)setHasSiriClientSetupLink:(BOOL)a3;
- (void)setSiriClientSetupLink:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMSetupLink

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaCDMSetupLink;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMSetupLink *)self siriClientSetupLink];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NLXSchemaCDMSetupLink *)self deleteSiriClientSetupLink];
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

- (void)setHasSiriClientSetupLink:(BOOL)a3
{
  self->_hasSiriClientSetupLink = a3;
}

- (BOOL)hasSiriClientSetupLink
{
  return self->_hasSiriClientSetupLink;
}

- (unint64_t)whichNlxclients
{
  return self->_whichNlxclients;
}

- (NLXSchemaCDMSetupLink)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaCDMSetupLink;
  v5 = [(NLXSchemaCDMSetupLink *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriClientSetupLink"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[NLXSchemaCDMSiriClientSetupLink alloc] initWithDictionary:v6];
      [(NLXSchemaCDMSetupLink *)v5 setSiriClientSetupLink:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (NLXSchemaCDMSetupLink)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMSetupLink *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMSetupLink *)self dictionaryRepresentation];
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
  if (self->_siriClientSetupLink)
  {
    id v4 = [(NLXSchemaCDMSetupLink *)self siriClientSetupLink];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"siriClientSetupLink"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"siriClientSetupLink"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NLXSchemaCDMSiriClientSetupLink *)self->_siriClientSetupLink hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichNlxclients = self->_whichNlxclients;
    if (whichNlxclients == [v4 whichNlxclients])
    {
      v6 = [(NLXSchemaCDMSetupLink *)self siriClientSetupLink];
      uint64_t v7 = [v4 siriClientSetupLink];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(NLXSchemaCDMSetupLink *)self siriClientSetupLink];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(NLXSchemaCDMSetupLink *)self siriClientSetupLink];
        v12 = [v4 siriClientSetupLink];
        char v13 = [v11 isEqual:v12];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(NLXSchemaCDMSetupLink *)self siriClientSetupLink];

  if (v4)
  {
    v5 = [(NLXSchemaCDMSetupLink *)self siriClientSetupLink];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSetupLinkReadFrom(self, (uint64_t)a3);
}

- (void)deleteSiriClientSetupLink
{
  if (self->_whichNlxclients == 1)
  {
    self->_unint64_t whichNlxclients = 0;
    self->_siriClientSetupLink = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMSiriClientSetupLink)siriClientSetupLink
{
  if (self->_whichNlxclients == 1) {
    v2 = self->_siriClientSetupLink;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSiriClientSetupLink:(id)a3
{
  self->_unint64_t whichNlxclients = a3 != 0;
  objc_storeStrong((id *)&self->_siriClientSetupLink, a3);
}

@end