@interface SIRINLUINTERNALTOKENIZERTokenizerResponse
- (BOOL)hasAsrId;
- (BOOL)hasText;
- (BOOL)hasTokenChain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)text;
- (SIRINLUEXTERNALUUID)asrId;
- (SIRINLUINTERNALTokenChain)tokenChain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrId:(id)a3;
- (void)setText:(id)a3;
- (void)setTokenChain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALTOKENIZERTokenizerResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

- (void)setAsrId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setTokenChain:(id)a3
{
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  tokenChain = self->_tokenChain;
  uint64_t v6 = v4[3];
  v9 = v4;
  if (tokenChain)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALTOKENIZERTokenizerResponse setTokenChain:](self, "setTokenChain:");
  }
  v4 = v9;
LABEL_7:
  if (v4[2])
  {
    -[SIRINLUINTERNALTOKENIZERTokenizerResponse setText:](self, "setText:");
    v4 = v9;
  }
  asrId = self->_asrId;
  uint64_t v8 = v4[1];
  if (asrId)
  {
    if (v8) {
      -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUINTERNALTOKENIZERTokenizerResponse setAsrId:](self, "setAsrId:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain hash];
  NSUInteger v4 = [(NSString *)self->_text hash] ^ v3;
  return v4 ^ [(SIRINLUEXTERNALUUID *)self->_asrId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((tokenChain = self->_tokenChain, !((unint64_t)tokenChain | v4[3]))
     || -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
    && ((text = self->_text, !((unint64_t)text | v4[2])) || -[NSString isEqual:](text, "isEqual:")))
  {
    asrId = self->_asrId;
    if ((unint64_t)asrId | v4[1]) {
      char v8 = -[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_text copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(SIRINLUEXTERNALUUID *)self->_asrId copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tokenChain)
  {
    objc_msgSend(v4, "setTokenChain:");
    id v4 = v5;
  }
  if (self->_text)
  {
    objc_msgSend(v5, "setText:");
    id v4 = v5;
  }
  if (self->_asrId)
  {
    objc_msgSend(v5, "setAsrId:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tokenChain)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_asrId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALTOKENIZERTokenizerResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    id v5 = [(SIRINLUINTERNALTokenChain *)tokenChain dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"token_chain"];
  }
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  asrId = self->_asrId;
  if (asrId)
  {
    uint64_t v8 = [(SIRINLUEXTERNALUUID *)asrId dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"asrId"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALTOKENIZERTokenizerResponse;
  id v4 = [(SIRINLUINTERNALTOKENIZERTokenizerResponse *)&v8 description];
  id v5 = [(SIRINLUINTERNALTOKENIZERTokenizerResponse *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

@end