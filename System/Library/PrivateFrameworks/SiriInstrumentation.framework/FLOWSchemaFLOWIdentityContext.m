@interface FLOWSchemaFLOWIdentityContext
- (BOOL)hasProfileSwitchContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWIdentityContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWIdentityContext)initWithJSON:(id)a3;
- (FLOWSchemaFLOWProfileSwitchContext)profileSwitchContext;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteProfileSwitchContext;
- (void)setHasProfileSwitchContext:(BOOL)a3;
- (void)setProfileSwitchContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWIdentityContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FLOWSchemaFLOWIdentityContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWIdentityContext *)self profileSwitchContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(FLOWSchemaFLOWIdentityContext *)self deleteProfileSwitchContext];
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

- (void)setHasProfileSwitchContext:(BOOL)a3
{
  self->_hasProfileSwitchContext = a3;
}

- (void)setProfileSwitchContext:(id)a3
{
}

- (FLOWSchemaFLOWProfileSwitchContext)profileSwitchContext
{
  return self->_profileSwitchContext;
}

- (FLOWSchemaFLOWIdentityContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FLOWSchemaFLOWIdentityContext;
  v5 = [(FLOWSchemaFLOWIdentityContext *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"profileSwitchContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLOWSchemaFLOWProfileSwitchContext alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWIdentityContext *)v5 setProfileSwitchContext:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWIdentityContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWIdentityContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWIdentityContext *)self dictionaryRepresentation];
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
  if (self->_profileSwitchContext)
  {
    id v4 = [(FLOWSchemaFLOWIdentityContext *)self profileSwitchContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"profileSwitchContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"profileSwitchContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(FLOWSchemaFLOWProfileSwitchContext *)self->_profileSwitchContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(FLOWSchemaFLOWIdentityContext *)self profileSwitchContext];
    v6 = [v4 profileSwitchContext];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(FLOWSchemaFLOWIdentityContext *)self profileSwitchContext];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(FLOWSchemaFLOWIdentityContext *)self profileSwitchContext];
      v11 = [v4 profileSwitchContext];
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
  id v4 = [(FLOWSchemaFLOWIdentityContext *)self profileSwitchContext];

  if (v4)
  {
    v5 = [(FLOWSchemaFLOWIdentityContext *)self profileSwitchContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWIdentityContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteProfileSwitchContext
{
}

- (BOOL)hasProfileSwitchContext
{
  return self->_profileSwitchContext != 0;
}

@end