@interface _SFPBRFPreview
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)text;
- (_SFPBCommandReference)command_reference;
- (_SFPBRFPreview)initWithDictionary:(id)a3;
- (_SFPBRFPreview)initWithFacade:(id)a3;
- (_SFPBRFPreview)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setCommand_reference:(id)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFPreview

- (_SFPBRFPreview)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFPreview *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [v4 text];
      [(_SFPBRFPreview *)v5 setText:v7];
    }
    v8 = objc_msgSend(v4, "command_reference");

    if (v8)
    {
      v9 = [_SFPBCommandReference alloc];
      v10 = objc_msgSend(v4, "command_reference");
      v11 = [(_SFPBCommandReference *)v9 initWithFacade:v10];
      [(_SFPBRFPreview *)v5 setCommand_reference:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command_reference, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (_SFPBCommandReference)command_reference
{
  return self->_command_reference;
}

- (NSString)text
{
  return self->_text;
}

- (_SFPBRFPreview)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFPreview;
  v5 = [(_SFPBRFPreview *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBRFPreview *)v5 setText:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"commandReference"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBCommandReference alloc] initWithDictionary:v8];
      [(_SFPBRFPreview *)v5 setCommand_reference:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBRFPreview)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFPreview *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFPreview *)self dictionaryRepresentation];
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
  if (self->_command_reference)
  {
    id v4 = [(_SFPBRFPreview *)self command_reference];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"commandReference"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"commandReference"];
    }
  }
  if (self->_text)
  {
    uint64_t v7 = [(_SFPBRFPreview *)self text];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"text"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  return [(_SFPBCommandReference *)self->_command_reference hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBRFPreview *)self text];
  v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBRFPreview *)self text];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFPreview *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFPreview *)self command_reference];
  v6 = objc_msgSend(v4, "command_reference");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBRFPreview *)self command_reference];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBRFPreview *)self command_reference];
    v15 = objc_msgSend(v4, "command_reference");
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
  id v4 = [(_SFPBRFPreview *)self text];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBRFPreview *)self command_reference];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFPreviewReadFrom(self, (uint64_t)a3);
}

- (void)setCommand_reference:(id)a3
{
}

- (void)setText:(id)a3
{
  self->_text = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end