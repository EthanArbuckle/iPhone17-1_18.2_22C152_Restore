@interface SISchemaUUID
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)value;
- (SISchemaUUID)initWithBytesAsData:(id)a3;
- (SISchemaUUID)initWithDictionary:(id)a3;
- (SISchemaUUID)initWithJSON:(id)a3;
- (SISchemaUUID)initWithNSUUID:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)toNSUUID;
- (id)toSafeNSUUID;
- (unint64_t)hash;
- (void)deleteValue;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)willProduceDictionaryRepresentation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUUID

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  v4 = [(SISchemaUUID *)self value];

  if (v4) {
    PBDataWriterWriteDataField();
  }
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (SISchemaUUID)initWithNSUUID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SISchemaUUID;
  id v5 = [(SISchemaUUID *)&v8 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "si_uuidBytes");
    [(SISchemaUUID *)v5 setValue:v6];
  }
  return v5;
}

- (id)toSafeNSUUID
{
  v2 = [(SISchemaUUID *)self value];
  v3 = objc_msgSend(v2, "si_asNSUUID");

  return v3;
}

- (id)toNSUUID
{
  v2 = [(SISchemaUUID *)self value];
  v3 = objc_msgSend(v2, "si_asNSUUID");

  return v3;
}

- (SISchemaUUID)initWithBytesAsData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SISchemaUUID;
  id v5 = [(SISchemaUUID *)&v8 init];
  v6 = v5;
  if (v4 && v5 && [v4 length] == 16) {
    [(SISchemaUUID *)v6 setValue:v4];
  }

  return v6;
}

- (void)willProduceDictionaryRepresentation:(id)a3
{
  id v7 = a3;
  id v4 = [(SISchemaUUID *)self toSafeNSUUID];
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 UUIDString];
    [v7 setObject:v6 forKeyedSubscript:@"value"];
  }
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (SISchemaUUID)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaUUID;
  id v5 = [(SISchemaUUID *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      [(SISchemaUUID *)v5 setValue:v7];
    }
    objc_super v8 = v5;
  }
  return v5;
}

- (SISchemaUUID)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(SISchemaUUID *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUUID *)self dictionaryRepresentation];
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
  if (self->_value)
  {
    id v4 = [(SISchemaUUID *)self value];
    id v5 = [v4 base64EncodedStringWithOptions:0];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"value"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"value"];
    }
  }
  [(SISchemaUUID *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSData *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [(SISchemaUUID *)self value];
    v6 = [v4 value];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(SISchemaUUID *)self value];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(SISchemaUUID *)self value];
      v11 = [v4 value];
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

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUIDReadFrom(self, (uint64_t)a3);
}

- (void)deleteValue
{
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

@end