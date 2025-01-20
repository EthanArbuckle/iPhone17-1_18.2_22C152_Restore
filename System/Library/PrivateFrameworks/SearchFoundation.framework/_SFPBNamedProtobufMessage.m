@interface _SFPBNamedProtobufMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)protobufMessageData;
- (NSString)protobufMessageName;
- (_SFPBNamedProtobufMessage)initWithDictionary:(id)a3;
- (_SFPBNamedProtobufMessage)initWithFacade:(id)a3;
- (_SFPBNamedProtobufMessage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setProtobufMessageData:(id)a3;
- (void)setProtobufMessageName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBNamedProtobufMessage

- (_SFPBNamedProtobufMessage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBNamedProtobufMessage *)self init];
  if (v5)
  {
    v6 = [v4 protobufMessageData];

    if (v6)
    {
      v7 = [v4 protobufMessageData];
      [(_SFPBNamedProtobufMessage *)v5 setProtobufMessageData:v7];
    }
    v8 = [v4 protobufMessageName];

    if (v8)
    {
      v9 = [v4 protobufMessageName];
      [(_SFPBNamedProtobufMessage *)v5 setProtobufMessageName:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protobufMessageName, 0);
  objc_storeStrong((id *)&self->_protobufMessageData, 0);
}

- (NSString)protobufMessageName
{
  return self->_protobufMessageName;
}

- (NSData)protobufMessageData
{
  return self->_protobufMessageData;
}

- (_SFPBNamedProtobufMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBNamedProtobufMessage;
  v5 = [(_SFPBNamedProtobufMessage *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"protobufMessageData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      [(_SFPBNamedProtobufMessage *)v5 setProtobufMessageData:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"protobufMessageName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBNamedProtobufMessage *)v5 setProtobufMessageName:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBNamedProtobufMessage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBNamedProtobufMessage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBNamedProtobufMessage *)self dictionaryRepresentation];
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
  if (self->_protobufMessageData)
  {
    id v4 = [(_SFPBNamedProtobufMessage *)self protobufMessageData];
    v5 = [v4 base64EncodedStringWithOptions:0];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"protobufMessageData"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"protobufMessageData"];
    }
  }
  if (self->_protobufMessageName)
  {
    uint64_t v7 = [(_SFPBNamedProtobufMessage *)self protobufMessageName];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"protobufMessageName"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_protobufMessageData hash];
  return [(NSString *)self->_protobufMessageName hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBNamedProtobufMessage *)self protobufMessageData];
  v6 = [v4 protobufMessageData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBNamedProtobufMessage *)self protobufMessageData];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBNamedProtobufMessage *)self protobufMessageData];
    v10 = [v4 protobufMessageData];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBNamedProtobufMessage *)self protobufMessageName];
  v6 = [v4 protobufMessageName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBNamedProtobufMessage *)self protobufMessageName];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBNamedProtobufMessage *)self protobufMessageName];
    v15 = [v4 protobufMessageName];
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
  id v4 = [(_SFPBNamedProtobufMessage *)self protobufMessageData];
  if (v4) {
    PBDataWriterWriteDataField();
  }

  v5 = [(_SFPBNamedProtobufMessage *)self protobufMessageName];
  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBNamedProtobufMessageReadFrom(self, (uint64_t)a3);
}

- (void)setProtobufMessageName:(id)a3
{
  self->_protobufMessageName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setProtobufMessageData:(id)a3
{
  self->_protobufMessageData = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end