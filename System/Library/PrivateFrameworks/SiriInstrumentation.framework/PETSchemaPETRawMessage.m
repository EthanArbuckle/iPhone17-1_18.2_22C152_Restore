@interface PETSchemaPETRawMessage
- (BOOL)hasName;
- (BOOL)hasRaw_bytes;
- (BOOL)hasType_id;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)raw_bytes;
- (NSString)name;
- (PETSchemaPETRawMessage)initWithDictionary:(id)a3;
- (PETSchemaPETRawMessage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)type_id;
- (void)deleteName;
- (void)deleteRaw_bytes;
- (void)deleteType_id;
- (void)setHasName:(BOOL)a3;
- (void)setHasRaw_bytes:(BOOL)a3;
- (void)setHasType_id:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setRaw_bytes:(id)a3;
- (void)setType_id:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETSchemaPETRawMessage

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_raw_bytes, 0);
}

- (void)setHasName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasRaw_bytes:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setRaw_bytes:(id)a3
{
}

- (NSData)raw_bytes
{
  return self->_raw_bytes;
}

- (unsigned)type_id
{
  return self->_type_id;
}

- (PETSchemaPETRawMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PETSchemaPETRawMessage;
  v5 = [(PETSchemaPETRawMessage *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"typeId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETRawMessage setType_id:](v5, "setType_id:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"rawBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
      [(PETSchemaPETRawMessage *)v5 setRaw_bytes:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(PETSchemaPETRawMessage *)v5 setName:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (PETSchemaPETRawMessage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PETSchemaPETRawMessage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PETSchemaPETRawMessage *)self dictionaryRepresentation];
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
  if (self->_name)
  {
    id v4 = [(PETSchemaPETRawMessage *)self name];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }
  if (self->_raw_bytes)
  {
    v6 = [(PETSchemaPETRawMessage *)self raw_bytes];
    uint64_t v7 = [v6 base64EncodedStringWithOptions:0];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"rawBytes"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"rawBytes"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PETSchemaPETRawMessage type_id](self, "type_id"));
    [v3 setObject:v9 forKeyedSubscript:@"typeId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type_id;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_raw_bytes hash] ^ v3;
  return v4 ^ [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int type_id = self->_type_id;
    if (type_id != objc_msgSend(v4, "type_id")) {
      goto LABEL_15;
    }
  }
  v6 = [(PETSchemaPETRawMessage *)self raw_bytes];
  uint64_t v7 = objc_msgSend(v4, "raw_bytes");
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(PETSchemaPETRawMessage *)self raw_bytes];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(PETSchemaPETRawMessage *)self raw_bytes];
    v11 = objc_msgSend(v4, "raw_bytes");
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(PETSchemaPETRawMessage *)self name];
  uint64_t v7 = [v4 name];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(PETSchemaPETRawMessage *)self name];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(PETSchemaPETRawMessage *)self name];
    v16 = [v4 name];
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
    PBDataWriterWriteUint32Field();
  }
  uint64_t v4 = [(PETSchemaPETRawMessage *)self raw_bytes];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  v5 = [(PETSchemaPETRawMessage *)self name];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PETSchemaPETRawMessageReadFrom(self, (uint64_t)a3);
}

- (void)deleteName
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)deleteRaw_bytes
{
}

- (BOOL)hasRaw_bytes
{
  return self->_raw_bytes != 0;
}

- (void)deleteType_id
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasType_id:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType_id
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType_id:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int type_id = a3;
}

@end