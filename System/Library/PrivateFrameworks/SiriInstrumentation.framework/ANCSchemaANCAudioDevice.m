@interface ANCSchemaANCAudioDevice
- (ANCSchemaANCAudioDevice)initWithDictionary:(id)a3;
- (ANCSchemaANCAudioDevice)initWithJSON:(id)a3;
- (BOOL)hasProductIdentifier;
- (BOOL)hasVendorIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)productIdentifier;
- (NSString)vendorIdentifier;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteProductIdentifier;
- (void)deleteVendorIdentifier;
- (void)setHasProductIdentifier:(BOOL)a3;
- (void)setHasVendorIdentifier:(BOOL)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setVendorIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ANCSchemaANCAudioDevice

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
}

- (void)setHasProductIdentifier:(BOOL)a3
{
  self->_hasProductIdentifier = a3;
}

- (void)setHasVendorIdentifier:(BOOL)a3
{
  self->_hasVendorIdentifier = a3;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (ANCSchemaANCAudioDevice)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ANCSchemaANCAudioDevice;
  v5 = [(ANCSchemaANCAudioDevice *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"vendorIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ANCSchemaANCAudioDevice *)v5 setVendorIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"productIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ANCSchemaANCAudioDevice *)v5 setProductIdentifier:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ANCSchemaANCAudioDevice)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ANCSchemaANCAudioDevice *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ANCSchemaANCAudioDevice *)self dictionaryRepresentation];
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
  if (self->_productIdentifier)
  {
    id v4 = [(ANCSchemaANCAudioDevice *)self productIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"productIdentifier"];
  }
  if (self->_vendorIdentifier)
  {
    v6 = [(ANCSchemaANCAudioDevice *)self vendorIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"vendorIdentifier"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_vendorIdentifier hash];
  return [(NSString *)self->_productIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ANCSchemaANCAudioDevice *)self vendorIdentifier];
  v6 = [v4 vendorIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ANCSchemaANCAudioDevice *)self vendorIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(ANCSchemaANCAudioDevice *)self vendorIdentifier];
    v10 = [v4 vendorIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ANCSchemaANCAudioDevice *)self productIdentifier];
  v6 = [v4 productIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ANCSchemaANCAudioDevice *)self productIdentifier];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(ANCSchemaANCAudioDevice *)self productIdentifier];
    v15 = [v4 productIdentifier];
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
  id v4 = [(ANCSchemaANCAudioDevice *)self vendorIdentifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(ANCSchemaANCAudioDevice *)self productIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ANCSchemaANCAudioDeviceReadFrom(self, (uint64_t)a3);
}

- (void)deleteProductIdentifier
{
}

- (BOOL)hasProductIdentifier
{
  return self->_productIdentifier != 0;
}

- (void)deleteVendorIdentifier
{
}

- (BOOL)hasVendorIdentifier
{
  return self->_vendorIdentifier != 0;
}

@end