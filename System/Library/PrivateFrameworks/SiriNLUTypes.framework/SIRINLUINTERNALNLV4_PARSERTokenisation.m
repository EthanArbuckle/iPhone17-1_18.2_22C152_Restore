@interface SIRINLUINTERNALNLV4_PARSERTokenisation
- (BOOL)hasNormalisedUtterance;
- (BOOL)hasOriginalUtterance;
- (BOOL)hasTokenChain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)normalisedUtterance;
- (NSString)originalUtterance;
- (SIRINLUINTERNALTokenChain)tokenChain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNormalisedUtterance:(id)a3;
- (void)setOriginalUtterance:(id)a3;
- (void)setTokenChain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALNLV4_PARSERTokenisation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_originalUtterance, 0);
  objc_storeStrong((id *)&self->_normalisedUtterance, 0);
}

- (void)setTokenChain:(id)a3
{
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setNormalisedUtterance:(id)a3
{
}

- (NSString)normalisedUtterance
{
  return self->_normalisedUtterance;
}

- (void)setOriginalUtterance:(id)a3
{
}

- (NSString)originalUtterance
{
  return self->_originalUtterance;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[SIRINLUINTERNALNLV4_PARSERTokenisation setOriginalUtterance:](self, "setOriginalUtterance:");
    v4 = v7;
  }
  if (v4[1])
  {
    -[SIRINLUINTERNALNLV4_PARSERTokenisation setNormalisedUtterance:](self, "setNormalisedUtterance:");
    v4 = v7;
  }
  tokenChain = self->_tokenChain;
  uint64_t v6 = v4[3];
  if (tokenChain)
  {
    if (v6) {
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALNLV4_PARSERTokenisation setTokenChain:](self, "setTokenChain:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_originalUtterance hash];
  NSUInteger v4 = [(NSString *)self->_normalisedUtterance hash] ^ v3;
  return v4 ^ [(SIRINLUINTERNALTokenChain *)self->_tokenChain hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((originalUtterance = self->_originalUtterance, !((unint64_t)originalUtterance | v4[2]))
     || -[NSString isEqual:](originalUtterance, "isEqual:"))
    && ((normalisedUtterance = self->_normalisedUtterance, !((unint64_t)normalisedUtterance | v4[1]))
     || -[NSString isEqual:](normalisedUtterance, "isEqual:")))
  {
    tokenChain = self->_tokenChain;
    if ((unint64_t)tokenChain | v4[3]) {
      char v8 = -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_originalUtterance copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_normalisedUtterance copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_originalUtterance)
  {
    objc_msgSend(v4, "setOriginalUtterance:");
    id v4 = v5;
  }
  if (self->_normalisedUtterance)
  {
    objc_msgSend(v5, "setNormalisedUtterance:");
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
  if (self->_originalUtterance)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_normalisedUtterance)
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
  return SIRINLUINTERNALNLV4_PARSERTokenisationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  originalUtterance = self->_originalUtterance;
  if (originalUtterance) {
    [v3 setObject:originalUtterance forKey:@"original_utterance"];
  }
  normalisedUtterance = self->_normalisedUtterance;
  if (normalisedUtterance) {
    [v4 setObject:normalisedUtterance forKey:@"normalised_utterance"];
  }
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    uint64_t v8 = [(SIRINLUINTERNALTokenChain *)tokenChain dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"token_chain"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALNLV4_PARSERTokenisation;
  id v4 = [(SIRINLUINTERNALNLV4_PARSERTokenisation *)&v8 description];
  id v5 = [(SIRINLUINTERNALNLV4_PARSERTokenisation *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasNormalisedUtterance
{
  return self->_normalisedUtterance != 0;
}

- (BOOL)hasOriginalUtterance
{
  return self->_originalUtterance != 0;
}

@end