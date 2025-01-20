@interface SIRINLUINTERNALEMBEDDINGEmbeddingRequest
- (BOOL)hasText;
- (BOOL)hasTokenChain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)text;
- (SIRINLUINTERNALTokenChain)tokenChain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setText:(id)a3;
- (void)setTokenChain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALEMBEDDINGEmbeddingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setTokenChain:(id)a3
{
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingRequest setText:](self, "setText:");
    v4 = v7;
  }
  tokenChain = self->_tokenChain;
  uint64_t v6 = v4[2];
  if (tokenChain)
  {
    if (v6) {
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingRequest setTokenChain:](self, "setTokenChain:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  return [(SIRINLUINTERNALTokenChain *)self->_tokenChain hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((text = self->_text, !((unint64_t)text | v4[1])) || -[NSString isEqual:](text, "isEqual:")))
  {
    tokenChain = self->_tokenChain;
    if ((unint64_t)tokenChain | v4[2]) {
      char v7 = -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_text copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_text)
  {
    objc_msgSend(v4, "setText:");
    id v4 = v5;
  }
  if (self->_tokenChain)
  {
    objc_msgSend(v5, "setTokenChain:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_tokenChain)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALEMBEDDINGEmbeddingRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    char v7 = [(SIRINLUINTERNALTokenChain *)tokenChain dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"token_chain"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALEMBEDDINGEmbeddingRequest;
  id v4 = [(SIRINLUINTERNALEMBEDDINGEmbeddingRequest *)&v8 description];
  id v5 = [(SIRINLUINTERNALEMBEDDINGEmbeddingRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

@end