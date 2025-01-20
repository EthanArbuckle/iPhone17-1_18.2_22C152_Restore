@interface EXPSchemaEXPTrialRolloutNamespace
- (BOOL)hasCompatibilityVersion;
- (BOOL)hasFactorPackId;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EXPSchemaEXPTrialRolloutNamespace)initWithDictionary:(id)a3;
- (EXPSchemaEXPTrialRolloutNamespace)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)factorPackId;
- (NSString)name;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)compatibilityVersion;
- (void)deleteCompatibilityVersion;
- (void)deleteFactorPackId;
- (void)deleteName;
- (void)setCompatibilityVersion:(unsigned int)a3;
- (void)setFactorPackId:(id)a3;
- (void)setHasCompatibilityVersion:(BOOL)a3;
- (void)setHasFactorPackId:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation EXPSchemaEXPTrialRolloutNamespace

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setHasFactorPackId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setFactorPackId:(id)a3
{
}

- (NSString)factorPackId
{
  return self->_factorPackId;
}

- (unsigned)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (EXPSchemaEXPTrialRolloutNamespace)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EXPSchemaEXPTrialRolloutNamespace;
  v5 = [(EXPSchemaEXPTrialRolloutNamespace *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(EXPSchemaEXPTrialRolloutNamespace *)v5 setName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"compatibilityVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSchemaEXPTrialRolloutNamespace setCompatibilityVersion:](v5, "setCompatibilityVersion:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"factorPackId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(EXPSchemaEXPTrialRolloutNamespace *)v5 setFactorPackId:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (EXPSchemaEXPTrialRolloutNamespace)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(EXPSchemaEXPTrialRolloutNamespace *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(EXPSchemaEXPTrialRolloutNamespace *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[EXPSchemaEXPTrialRolloutNamespace compatibilityVersion](self, "compatibilityVersion"));
    [v3 setObject:v4 forKeyedSubscript:@"compatibilityVersion"];
  }
  if (self->_factorPackId)
  {
    v5 = [(EXPSchemaEXPTrialRolloutNamespace *)self factorPackId];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"factorPackId"];
  }
  if (self->_name)
  {
    uint64_t v7 = [(EXPSchemaEXPTrialRolloutNamespace *)self name];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"name"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_compatibilityVersion;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_factorPackId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(EXPSchemaEXPTrialRolloutNamespace *)self name];
  v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(EXPSchemaEXPTrialRolloutNamespace *)self name];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(EXPSchemaEXPTrialRolloutNamespace *)self name];
    v10 = [v4 name];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int compatibilityVersion = self->_compatibilityVersion;
    if (compatibilityVersion != [v4 compatibilityVersion]) {
      goto LABEL_15;
    }
  }
  v5 = [(EXPSchemaEXPTrialRolloutNamespace *)self factorPackId];
  v6 = [v4 factorPackId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(EXPSchemaEXPTrialRolloutNamespace *)self factorPackId];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(EXPSchemaEXPTrialRolloutNamespace *)self factorPackId];
    v16 = [v4 factorPackId];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(EXPSchemaEXPTrialRolloutNamespace *)self name];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  v5 = [(EXPSchemaEXPTrialRolloutNamespace *)self factorPackId];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return EXPSchemaEXPTrialRolloutNamespaceReadFrom(self, (uint64_t)a3);
}

- (void)deleteFactorPackId
{
}

- (BOOL)hasFactorPackId
{
  return self->_factorPackId != 0;
}

- (void)deleteCompatibilityVersion
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCompatibilityVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompatibilityVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCompatibilityVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int compatibilityVersion = a3;
}

- (void)deleteName
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end