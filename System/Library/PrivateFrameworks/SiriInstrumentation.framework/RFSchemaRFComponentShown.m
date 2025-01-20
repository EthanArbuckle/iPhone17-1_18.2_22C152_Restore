@interface RFSchemaRFComponentShown
- (BOOL)hasComponent;
- (BOOL)hasComponentIndex;
- (BOOL)hasComponentName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)componentIndex;
- (NSString)componentName;
- (RFSchemaRFComponentShown)initWithDictionary:(id)a3;
- (RFSchemaRFComponentShown)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)component;
- (unint64_t)hash;
- (void)deleteComponent;
- (void)deleteComponentIndex;
- (void)deleteComponentName;
- (void)setComponent:(int)a3;
- (void)setComponentIndex:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setHasComponent:(BOOL)a3;
- (void)setHasComponentIndex:(BOOL)a3;
- (void)setHasComponentName:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation RFSchemaRFComponentShown

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentIndex, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
}

- (void)setHasComponentIndex:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasComponentName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setComponentIndex:(id)a3
{
}

- (NSString)componentIndex
{
  return self->_componentIndex;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentName
{
  return self->_componentName;
}

- (int)component
{
  return self->_component;
}

- (RFSchemaRFComponentShown)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RFSchemaRFComponentShown;
  v5 = [(RFSchemaRFComponentShown *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"component"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RFSchemaRFComponentShown setComponent:](v5, "setComponent:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"componentName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(RFSchemaRFComponentShown *)v5 setComponentName:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"componentIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(RFSchemaRFComponentShown *)v5 setComponentIndex:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (RFSchemaRFComponentShown)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RFSchemaRFComponentShown *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RFSchemaRFComponentShown *)self dictionaryRepresentation];
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
    unsigned int v4 = [(RFSchemaRFComponentShown *)self component] - 1;
    if (v4 > 0x43) {
      v5 = @"RFCOMPONENT_UNKNOWN";
    }
    else {
      v5 = off_1E5EB4418[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"component"];
  }
  if (self->_componentIndex)
  {
    v6 = [(RFSchemaRFComponentShown *)self componentIndex];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"componentIndex"];
  }
  if (self->_componentName)
  {
    v8 = [(RFSchemaRFComponentShown *)self componentName];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"componentName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_component;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_componentName hash] ^ v3;
  return v4 ^ [(NSString *)self->_componentIndex hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int component = self->_component;
    if (component != [v4 component]) {
      goto LABEL_15;
    }
  }
  v6 = [(RFSchemaRFComponentShown *)self componentName];
  uint64_t v7 = [v4 componentName];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(RFSchemaRFComponentShown *)self componentName];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RFSchemaRFComponentShown *)self componentName];
    v11 = [v4 componentName];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(RFSchemaRFComponentShown *)self componentIndex];
  uint64_t v7 = [v4 componentIndex];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(RFSchemaRFComponentShown *)self componentIndex];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(RFSchemaRFComponentShown *)self componentIndex];
    v16 = [v4 componentIndex];
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
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v4 = [(RFSchemaRFComponentShown *)self componentName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(RFSchemaRFComponentShown *)self componentIndex];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFComponentShownReadFrom(self, (uint64_t)a3);
}

- (void)deleteComponentIndex
{
}

- (BOOL)hasComponentIndex
{
  return self->_componentIndex != 0;
}

- (void)deleteComponentName
{
}

- (BOOL)hasComponentName
{
  return self->_componentName != 0;
}

- (void)deleteComponent
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasComponent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComponent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setComponent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int component = a3;
}

@end