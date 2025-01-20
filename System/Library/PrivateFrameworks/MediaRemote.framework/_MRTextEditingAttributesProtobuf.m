@interface _MRTextEditingAttributesProtobuf
- (BOOL)hasInputTraits;
- (BOOL)hasPrompt;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)prompt;
- (NSString)title;
- (_MRTextInputTraitsProtobuf)inputTraits;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInputTraits:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRTextEditingAttributesProtobuf

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasPrompt
{
  return self->_prompt != 0;
}

- (BOOL)hasInputTraits
{
  return self->_inputTraits != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRTextEditingAttributesProtobuf;
  v4 = [(_MRTextEditingAttributesProtobuf *)&v8 description];
  v5 = [(_MRTextEditingAttributesProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  prompt = self->_prompt;
  if (prompt) {
    [v4 setObject:prompt forKey:@"prompt"];
  }
  inputTraits = self->_inputTraits;
  if (inputTraits)
  {
    objc_super v8 = [(_MRTextInputTraitsProtobuf *)inputTraits dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"inputTraits"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRTextEditingAttributesProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_prompt)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_inputTraits)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v5;
  }
  if (self->_prompt)
  {
    objc_msgSend(v5, "setPrompt:");
    id v4 = v5;
  }
  if (self->_inputTraits)
  {
    objc_msgSend(v5, "setInputTraits:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_prompt copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(_MRTextInputTraitsProtobuf *)self->_inputTraits copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((title = self->_title, !((unint64_t)title | v4[3]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((prompt = self->_prompt, !((unint64_t)prompt | v4[2]))
     || -[NSString isEqual:](prompt, "isEqual:")))
  {
    inputTraits = self->_inputTraits;
    if ((unint64_t)inputTraits | v4[1]) {
      char v8 = -[_MRTextInputTraitsProtobuf isEqual:](inputTraits, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_prompt hash] ^ v3;
  return v4 ^ [(_MRTextInputTraitsProtobuf *)self->_inputTraits hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[_MRTextEditingAttributesProtobuf setTitle:](self, "setTitle:");
    NSUInteger v4 = v7;
  }
  if (v4[2])
  {
    -[_MRTextEditingAttributesProtobuf setPrompt:](self, "setPrompt:");
    NSUInteger v4 = v7;
  }
  inputTraits = self->_inputTraits;
  uint64_t v6 = v4[1];
  if (inputTraits)
  {
    if (v6) {
      -[_MRTextInputTraitsProtobuf mergeFrom:](inputTraits, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRTextEditingAttributesProtobuf setInputTraits:](self, "setInputTraits:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (_MRTextInputTraitsProtobuf)inputTraits
{
  return self->_inputTraits;
}

- (void)setInputTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_storeStrong((id *)&self->_inputTraits, 0);
}

@end