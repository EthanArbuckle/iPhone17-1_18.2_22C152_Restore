@interface SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse
- (BOOL)hasSubwordTokenChain;
- (BOOL)hasSubwordTokenEmbedding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput)subwordTokenEmbedding;
- (SIRINLUINTERNALSubwordTokenChain)subwordTokenChain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSubwordTokenChain:(id)a3;
- (void)setSubwordTokenEmbedding:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subwordTokenEmbedding, 0);
  objc_storeStrong((id *)&self->_subwordTokenChain, 0);
}

- (void)setSubwordTokenEmbedding:(id)a3
{
}

- (SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput)subwordTokenEmbedding
{
  return self->_subwordTokenEmbedding;
}

- (void)setSubwordTokenChain:(id)a3
{
}

- (SIRINLUINTERNALSubwordTokenChain)subwordTokenChain
{
  return self->_subwordTokenChain;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  subwordTokenChain = self->_subwordTokenChain;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (subwordTokenChain)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALSubwordTokenChain mergeFrom:](subwordTokenChain, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse setSubwordTokenChain:](self, "setSubwordTokenChain:");
  }
  v4 = v9;
LABEL_7:
  subwordTokenEmbedding = self->_subwordTokenEmbedding;
  uint64_t v8 = v4[2];
  if (subwordTokenEmbedding)
  {
    if (v8) {
      -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput mergeFrom:](subwordTokenEmbedding, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse setSubwordTokenEmbedding:](self, "setSubwordTokenEmbedding:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALSubwordTokenChain *)self->_subwordTokenChain hash];
  return [(SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *)self->_subwordTokenEmbedding hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((subwordTokenChain = self->_subwordTokenChain, !((unint64_t)subwordTokenChain | v4[1]))
     || -[SIRINLUINTERNALSubwordTokenChain isEqual:](subwordTokenChain, "isEqual:")))
  {
    subwordTokenEmbedding = self->_subwordTokenEmbedding;
    if ((unint64_t)subwordTokenEmbedding | v4[2]) {
      char v7 = -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput isEqual:](subwordTokenEmbedding, "isEqual:");
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
  id v6 = [(SIRINLUINTERNALSubwordTokenChain *)self->_subwordTokenChain copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *)self->_subwordTokenEmbedding copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_subwordTokenChain)
  {
    objc_msgSend(v4, "setSubwordTokenChain:");
    id v4 = v5;
  }
  if (self->_subwordTokenEmbedding)
  {
    objc_msgSend(v5, "setSubwordTokenEmbedding:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_subwordTokenChain)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_subwordTokenEmbedding)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  subwordTokenChain = self->_subwordTokenChain;
  if (subwordTokenChain)
  {
    id v5 = [(SIRINLUINTERNALSubwordTokenChain *)subwordTokenChain dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"subword_token_chain"];
  }
  subwordTokenEmbedding = self->_subwordTokenEmbedding;
  if (subwordTokenEmbedding)
  {
    char v7 = [(SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *)subwordTokenEmbedding dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"subword_token_embedding"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse;
  id v4 = [(SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse *)&v8 description];
  id v5 = [(SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSubwordTokenEmbedding
{
  return self->_subwordTokenEmbedding != 0;
}

- (BOOL)hasSubwordTokenChain
{
  return self->_subwordTokenChain != 0;
}

@end