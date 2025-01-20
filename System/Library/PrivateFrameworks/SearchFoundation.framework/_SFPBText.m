@interface _SFPBText
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)text;
- (_SFPBText)initWithDictionary:(id)a3;
- (_SFPBText)initWithFacade:(id)a3;
- (_SFPBText)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)maxLines;
- (void)setMaxLines:(unsigned int)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBText

- (_SFPBText)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBText *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [v4 text];
      [(_SFPBText *)v5 setText:v7];
    }
    if ([v4 hasMaxLines]) {
      -[_SFPBText setMaxLines:](v5, "setMaxLines:", [v4 maxLines]);
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (unsigned)maxLines
{
  return self->_maxLines;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (_SFPBText)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBText;
  v5 = [(_SFPBText *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBText *)v5 setText:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"maxLines"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBText setMaxLines:](v5, "setMaxLines:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBText)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBText *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBText *)self dictionaryRepresentation];
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
  if (self->_maxLines)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_SFPBText maxLines](self, "maxLines"));
    [v3 setObject:v4 forKeyedSubscript:@"maxLines"];
  }
  if (self->_text)
  {
    v5 = [(_SFPBText *)self text];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"text"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_maxLines) ^ [(NSString *)self->_text hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBText *)self text];
    v6 = [v4 text];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBText *)self text];
      if (!v8)
      {

LABEL_10:
        unsigned int maxLines = self->_maxLines;
        BOOL v13 = maxLines == [v4 maxLines];
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_SFPBText *)self text];
      objc_super v11 = [v4 text];
      int v12 = [v10 isEqual:v11];

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
  id v5 = a3;
  id v4 = [(_SFPBText *)self text];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBText *)self maxLines]) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTextReadFrom(self, (uint64_t)a3);
}

- (void)setMaxLines:(unsigned int)a3
{
  self->_unsigned int maxLines = a3;
}

- (void)setText:(id)a3
{
  self->_text = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end