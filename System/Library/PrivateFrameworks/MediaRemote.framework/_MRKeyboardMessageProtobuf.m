@interface _MRKeyboardMessageProtobuf
- (BOOL)hasAttributes;
- (BOOL)hasEncryptedTextCyphertext;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedTextCyphertext;
- (_MRTextEditingAttributesProtobuf)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stateAsString:(int)a3;
- (int)StringAsState:(id)a3;
- (int)state;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setEncryptedTextCyphertext:(id)a3;
- (void)setHasState:(BOOL)a3;
- (void)setState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRKeyboardMessageProtobuf

- (int)state
{
  if (*(unsigned char *)&self->_has) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D98B0[a3];
  }

  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NotEditing"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DidBeginEditing"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Editing"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TextDidChange"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DidEndEditing"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Response"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAttributes
{
  return self->_attributes != 0;
}

- (BOOL)hasEncryptedTextCyphertext
{
  return self->_encryptedTextCyphertext != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRKeyboardMessageProtobuf;
  int v4 = [(_MRKeyboardMessageProtobuf *)&v8 description];
  v5 = [(_MRKeyboardMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t state = self->_state;
    if (state >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_state);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E57D98B0[state];
    }
    [v3 setObject:v5 forKey:@"state"];
  }
  attributes = self->_attributes;
  if (attributes)
  {
    v7 = [(_MRTextEditingAttributesProtobuf *)attributes dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"attributes"];
  }
  encryptedTextCyphertext = self->_encryptedTextCyphertext;
  if (encryptedTextCyphertext) {
    [v3 setObject:encryptedTextCyphertext forKey:@"encryptedTextCyphertext"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRKeyboardMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_attributes)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_encryptedTextCyphertext)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_state;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v5 = v4;
  if (self->_attributes)
  {
    objc_msgSend(v4, "setAttributes:");
    id v4 = v5;
  }
  if (self->_encryptedTextCyphertext)
  {
    objc_msgSend(v5, "setEncryptedTextCyphertext:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_state;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(_MRTextEditingAttributesProtobuf *)self->_attributes copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSData *)self->_encryptedTextCyphertext copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_state != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  attributes = self->_attributes;
  if ((unint64_t)attributes | *((void *)v4 + 1)
    && !-[_MRTextEditingAttributesProtobuf isEqual:](attributes, "isEqual:"))
  {
    goto LABEL_11;
  }
  encryptedTextCyphertext = self->_encryptedTextCyphertext;
  if ((unint64_t)encryptedTextCyphertext | *((void *)v4 + 2)) {
    char v7 = -[NSData isEqual:](encryptedTextCyphertext, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_state;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_MRTextEditingAttributesProtobuf *)self->_attributes hash] ^ v3;
  return v4 ^ [(NSData *)self->_encryptedTextCyphertext hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[7])
  {
    self->_uint64_t state = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  attributes = self->_attributes;
  uint64_t v7 = *((void *)v5 + 1);
  objc_super v8 = v5;
  if (attributes)
  {
    if (!v7) {
      goto LABEL_9;
    }
    attributes = (_MRTextEditingAttributesProtobuf *)-[_MRTextEditingAttributesProtobuf mergeFrom:](attributes, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    attributes = (_MRTextEditingAttributesProtobuf *)-[_MRKeyboardMessageProtobuf setAttributes:](self, "setAttributes:");
  }
  uint64_t v5 = v8;
LABEL_9:
  if (*((void *)v5 + 2))
  {
    attributes = (_MRTextEditingAttributesProtobuf *)-[_MRKeyboardMessageProtobuf setEncryptedTextCyphertext:](self, "setEncryptedTextCyphertext:");
    uint64_t v5 = v8;
  }

  MEMORY[0x1F41817F8](attributes, v5);
}

- (_MRTextEditingAttributesProtobuf)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSData)encryptedTextCyphertext
{
  return self->_encryptedTextCyphertext;
}

- (void)setEncryptedTextCyphertext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedTextCyphertext, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end