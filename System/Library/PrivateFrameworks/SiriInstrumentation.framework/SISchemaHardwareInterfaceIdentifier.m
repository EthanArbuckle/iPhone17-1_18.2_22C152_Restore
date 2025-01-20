@interface SISchemaHardwareInterfaceIdentifier
- (BOOL)hasInterfaceProductID;
- (BOOL)hasInterfaceVendorID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)interfaceProductID;
- (NSString)interfaceVendorID;
- (SISchemaHardwareInterfaceIdentifier)initWithDictionary:(id)a3;
- (SISchemaHardwareInterfaceIdentifier)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteInterfaceProductID;
- (void)deleteInterfaceVendorID;
- (void)setHasInterfaceProductID:(BOOL)a3;
- (void)setHasInterfaceVendorID:(BOOL)a3;
- (void)setInterfaceProductID:(id)a3;
- (void)setInterfaceVendorID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaHardwareInterfaceIdentifier

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceProductID, 0);
  objc_storeStrong((id *)&self->_interfaceVendorID, 0);
}

- (void)setHasInterfaceProductID:(BOOL)a3
{
  self->_hasInterfaceProductID = a3;
}

- (void)setHasInterfaceVendorID:(BOOL)a3
{
  self->_hasInterfaceVendorID = a3;
}

- (void)setInterfaceProductID:(id)a3
{
}

- (NSString)interfaceProductID
{
  return self->_interfaceProductID;
}

- (void)setInterfaceVendorID:(id)a3
{
}

- (NSString)interfaceVendorID
{
  return self->_interfaceVendorID;
}

- (SISchemaHardwareInterfaceIdentifier)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaHardwareInterfaceIdentifier;
  v5 = [(SISchemaHardwareInterfaceIdentifier *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"interfaceVendorID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaHardwareInterfaceIdentifier *)v5 setInterfaceVendorID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"interfaceProductID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaHardwareInterfaceIdentifier *)v5 setInterfaceProductID:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaHardwareInterfaceIdentifier)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaHardwareInterfaceIdentifier *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaHardwareInterfaceIdentifier *)self dictionaryRepresentation];
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
  if (self->_interfaceProductID)
  {
    id v4 = [(SISchemaHardwareInterfaceIdentifier *)self interfaceProductID];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"interfaceProductID"];
  }
  if (self->_interfaceVendorID)
  {
    v6 = [(SISchemaHardwareInterfaceIdentifier *)self interfaceVendorID];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"interfaceVendorID"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_interfaceVendorID hash];
  return [(NSString *)self->_interfaceProductID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaHardwareInterfaceIdentifier *)self interfaceVendorID];
  v6 = [v4 interfaceVendorID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaHardwareInterfaceIdentifier *)self interfaceVendorID];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SISchemaHardwareInterfaceIdentifier *)self interfaceVendorID];
    v10 = [v4 interfaceVendorID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SISchemaHardwareInterfaceIdentifier *)self interfaceProductID];
  v6 = [v4 interfaceProductID];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SISchemaHardwareInterfaceIdentifier *)self interfaceProductID];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(SISchemaHardwareInterfaceIdentifier *)self interfaceProductID];
    v15 = [v4 interfaceProductID];
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
  id v6 = a3;
  id v4 = [(SISchemaHardwareInterfaceIdentifier *)self interfaceVendorID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(SISchemaHardwareInterfaceIdentifier *)self interfaceProductID];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaHardwareInterfaceIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)deleteInterfaceProductID
{
}

- (BOOL)hasInterfaceProductID
{
  return self->_interfaceProductID != 0;
}

- (void)deleteInterfaceVendorID
{
}

- (BOOL)hasInterfaceVendorID
{
  return self->_interfaceVendorID != 0;
}

@end