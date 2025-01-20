@interface TPPBPolicyRedaction
- (BOOL)hasCiphertext;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (TPPBPolicyRedactionAuthenticatedCiphertext)ciphertext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCiphertext:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyRedaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ciphertext, 0);
}

- (void)setCiphertext:(id)a3
{
}

- (TPPBPolicyRedactionAuthenticatedCiphertext)ciphertext
{
  return self->_ciphertext;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[TPPBPolicyRedaction setName:](self, "setName:");
    v4 = v7;
  }
  ciphertext = self->_ciphertext;
  uint64_t v6 = v4[1];
  if (ciphertext)
  {
    if (v6) {
      -[TPPBPolicyRedactionAuthenticatedCiphertext mergeFrom:](ciphertext, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[TPPBPolicyRedaction setCiphertext:](self, "setCiphertext:");
  }
  MEMORY[0x270F9A758]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(TPPBPolicyRedactionAuthenticatedCiphertext *)self->_ciphertext hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:")))
  {
    ciphertext = self->_ciphertext;
    if ((unint64_t)ciphertext | v4[1]) {
      char v7 = -[TPPBPolicyRedactionAuthenticatedCiphertext isEqual:](ciphertext, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(TPPBPolicyRedactionAuthenticatedCiphertext *)self->_ciphertext copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_ciphertext)
  {
    objc_msgSend(v5, "setCiphertext:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_ciphertext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyRedactionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  ciphertext = self->_ciphertext;
  if (ciphertext)
  {
    char v7 = [(TPPBPolicyRedactionAuthenticatedCiphertext *)ciphertext dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"ciphertext"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPolicyRedaction;
  id v4 = [(TPPBPolicyRedaction *)&v8 description];
  id v5 = [(TPPBPolicyRedaction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCiphertext
{
  return self->_ciphertext != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end