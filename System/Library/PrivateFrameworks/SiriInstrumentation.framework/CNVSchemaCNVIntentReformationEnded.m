@interface CNVSchemaCNVIntentReformationEnded
- (BOOL)hasReformedIntent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVIntentReformationEnded)initWithDictionary:(id)a3;
- (CNVSchemaCNVIntentReformationEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (USOSchemaUSOGraph)reformedIntent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteReformedIntent;
- (void)setHasReformedIntent:(BOOL)a3;
- (void)setReformedIntent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVIntentReformationEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNVSchemaCNVIntentReformationEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CNVSchemaCNVIntentReformationEnded *)self reformedIntent];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(CNVSchemaCNVIntentReformationEnded *)self deleteReformedIntent];
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

- (void)setHasReformedIntent:(BOOL)a3
{
  self->_hasReformedIntent = a3;
}

- (void)setReformedIntent:(id)a3
{
}

- (USOSchemaUSOGraph)reformedIntent
{
  return self->_reformedIntent;
}

- (CNVSchemaCNVIntentReformationEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVSchemaCNVIntentReformationEnded;
  v5 = [(CNVSchemaCNVIntentReformationEnded *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reformedIntent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[USOSchemaUSOGraph alloc] initWithDictionary:v6];
      [(CNVSchemaCNVIntentReformationEnded *)v5 setReformedIntent:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (CNVSchemaCNVIntentReformationEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVIntentReformationEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVIntentReformationEnded *)self dictionaryRepresentation];
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
  if (self->_reformedIntent)
  {
    id v4 = [(CNVSchemaCNVIntentReformationEnded *)self reformedIntent];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"reformedIntent"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"reformedIntent"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(USOSchemaUSOGraph *)self->_reformedIntent hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(CNVSchemaCNVIntentReformationEnded *)self reformedIntent];
    v6 = [v4 reformedIntent];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(CNVSchemaCNVIntentReformationEnded *)self reformedIntent];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(CNVSchemaCNVIntentReformationEnded *)self reformedIntent];
      v11 = [v4 reformedIntent];
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
  id v4 = [(CNVSchemaCNVIntentReformationEnded *)self reformedIntent];

  if (v4)
  {
    v5 = [(CNVSchemaCNVIntentReformationEnded *)self reformedIntent];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVIntentReformationEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteReformedIntent
{
}

- (BOOL)hasReformedIntent
{
  return self->_reformedIntent != 0;
}

@end