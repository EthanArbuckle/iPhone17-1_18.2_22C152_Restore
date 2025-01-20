@interface PLATFORMProvisionalConnectecedComponentIdentifier
- (BOOL)hasComponent;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)component;
- (PLATFORMProvisionalConnectecedComponentIdentifier)initWithDictionary:(id)a3;
- (PLATFORMProvisionalConnectecedComponentIdentifier)initWithJSON:(id)a3;
- (SISchemaUUID)uuid;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)deleteComponent;
- (void)deleteUuid;
- (void)setComponent:(id)a3;
- (void)setHasComponent:(BOOL)a3;
- (void)setHasUuid:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLATFORMProvisionalConnectecedComponentIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setHasComponent:(BOOL)a3
{
  self->_hasComponent = a3;
}

- (void)setHasUuid:(BOOL)a3
{
  self->_hasUuid = a3;
}

- (void)setComponent:(id)a3
{
}

- (NSString)component
{
  return self->_component;
}

- (void)setUuid:(id)a3
{
}

- (SISchemaUUID)uuid
{
  return self->_uuid;
}

- (PLATFORMProvisionalConnectecedComponentIdentifier)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLATFORMProvisionalConnectecedComponentIdentifier;
  v5 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"uuid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLATFORMProvisionalConnectecedComponentIdentifier *)v5 setUuid:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"component"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PLATFORMProvisionalConnectecedComponentIdentifier *)v5 setComponent:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PLATFORMProvisionalConnectecedComponentIdentifier)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self dictionaryRepresentation];
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
  if (self->_component)
  {
    id v4 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self component];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"component"];
  }
  if (self->_uuid)
  {
    v6 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self uuid];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"uuid"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"uuid"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_uuid hash];
  return [(NSString *)self->_component hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self uuid];
  v6 = [v4 uuid];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self uuid];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self uuid];
    v10 = [v4 uuid];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self component];
  v6 = [v4 component];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self component];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self component];
    v15 = [v4 component];
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
  id v7 = a3;
  id v4 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self uuid];

  if (v4)
  {
    v5 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self uuid];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PLATFORMProvisionalConnectecedComponentIdentifier *)self component];

  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLATFORMProvisionalConnectecedComponentIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)deleteComponent
{
}

- (BOOL)hasComponent
{
  return self->_component != 0;
}

- (void)deleteUuid
{
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

@end