@interface SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput
- (BOOL)hasEmbeddingDim;
- (BOOL)hasEmbeddingTensor;
- (BOOL)hasEmbeddingVersion;
- (BOOL)hasIsStableEmbeddingsVersion;
- (BOOL)hasSentenceEmbeddingTensor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStableEmbeddingsVersion;
- (BOOL)readFrom:(id)a3;
- (NSString)embeddingVersion;
- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor;
- (SIRINLUINTERNALNLv4EmbeddingTensor)sentenceEmbeddingTensor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)embeddingDim;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEmbeddingDim:(unint64_t)a3;
- (void)setEmbeddingTensor:(id)a3;
- (void)setEmbeddingVersion:(id)a3;
- (void)setHasEmbeddingDim:(BOOL)a3;
- (void)setHasIsStableEmbeddingsVersion:(BOOL)a3;
- (void)setIsStableEmbeddingsVersion:(BOOL)a3;
- (void)setSentenceEmbeddingTensor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentenceEmbeddingTensor, 0);
  objc_storeStrong((id *)&self->_embeddingVersion, 0);
  objc_storeStrong((id *)&self->_embeddingTensor, 0);
}

- (BOOL)isStableEmbeddingsVersion
{
  return self->_isStableEmbeddingsVersion;
}

- (unint64_t)embeddingDim
{
  return self->_embeddingDim;
}

- (void)setSentenceEmbeddingTensor:(id)a3
{
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)sentenceEmbeddingTensor
{
  return self->_sentenceEmbeddingTensor;
}

- (void)setEmbeddingTensor:(id)a3
{
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor
{
  return self->_embeddingTensor;
}

- (void)setEmbeddingVersion:(id)a3
{
}

- (NSString)embeddingVersion
{
  return self->_embeddingVersion;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (*((void *)v4 + 3))
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput setEmbeddingVersion:](self, "setEmbeddingVersion:");
    id v4 = v10;
  }
  embeddingTensor = self->_embeddingTensor;
  uint64_t v6 = *((void *)v4 + 2);
  if (embeddingTensor)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddingTensor, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput setEmbeddingTensor:](self, "setEmbeddingTensor:");
  }
  id v4 = v10;
LABEL_9:
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  uint64_t v8 = *((void *)v4 + 4);
  if (sentenceEmbeddingTensor)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](sentenceEmbeddingTensor, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput setSentenceEmbeddingTensor:](self, "setSentenceEmbeddingTensor:");
  }
  id v4 = v10;
LABEL_15:
  char v9 = *((unsigned char *)v4 + 44);
  if (v9)
  {
    self->_embeddingDim = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v9 = *((unsigned char *)v4 + 44);
  }
  if ((v9 & 2) != 0)
  {
    self->_isStableEmbeddingsVersion = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_embeddingVersion hash];
  unint64_t v4 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddingTensor hash];
  unint64_t v5 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_sentenceEmbeddingTensor hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v6 = 2654435761u * self->_embeddingDim;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_isStableEmbeddingsVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  embeddingVersion = self->_embeddingVersion;
  if ((unint64_t)embeddingVersion | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](embeddingVersion, "isEqual:")) {
      goto LABEL_15;
    }
  }
  embeddingTensor = self->_embeddingTensor;
  if ((unint64_t)embeddingTensor | *((void *)v4 + 2))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddingTensor, "isEqual:")) {
      goto LABEL_15;
    }
  }
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  if ((unint64_t)sentenceEmbeddingTensor | *((void *)v4 + 4))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](sentenceEmbeddingTensor, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_embeddingDim != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_15;
  }
  BOOL v8 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0)
    {
LABEL_15:
      BOOL v8 = 0;
      goto LABEL_16;
    }
    if (self->_isStableEmbeddingsVersion)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_15;
    }
    BOOL v8 = 1;
  }
LABEL_16:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_embeddingVersion copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddingTensor copyWithZone:a3];
  char v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  id v10 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_sentenceEmbeddingTensor copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_embeddingDim;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_isStableEmbeddingsVersion;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_embeddingVersion)
  {
    objc_msgSend(v4, "setEmbeddingVersion:");
    id v4 = v6;
  }
  if (self->_embeddingTensor)
  {
    objc_msgSend(v6, "setEmbeddingTensor:");
    id v4 = v6;
  }
  if (self->_sentenceEmbeddingTensor)
  {
    objc_msgSend(v6, "setSentenceEmbeddingTensor:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_embeddingDim;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_isStableEmbeddingsVersion;
    *((unsigned char *)v4 + 44) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_embeddingVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_embeddingTensor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sentenceEmbeddingTensor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutputReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  embeddingVersion = self->_embeddingVersion;
  if (embeddingVersion) {
    [v3 setObject:embeddingVersion forKey:@"embedding_version"];
  }
  embeddingTensor = self->_embeddingTensor;
  if (embeddingTensor)
  {
    uint64_t v7 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)embeddingTensor dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"embedding_tensor"];
  }
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  if (sentenceEmbeddingTensor)
  {
    char v9 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)sentenceEmbeddingTensor dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"sentence_embedding_tensor"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v11 = [NSNumber numberWithUnsignedLongLong:self->_embeddingDim];
    [v4 setObject:v11 forKey:@"embedding_dim"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_isStableEmbeddingsVersion];
    [v4 setObject:v12 forKey:@"is_stable_embeddings_version"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput;
  id v4 = [(SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsStableEmbeddingsVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasIsStableEmbeddingsVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setIsStableEmbeddingsVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isStableEmbeddingsVersion = a3;
}

- (BOOL)hasEmbeddingDim
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEmbeddingDim:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEmbeddingDim:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_embeddingDim = a3;
}

- (BOOL)hasSentenceEmbeddingTensor
{
  return self->_sentenceEmbeddingTensor != 0;
}

- (BOOL)hasEmbeddingTensor
{
  return self->_embeddingTensor != 0;
}

- (BOOL)hasEmbeddingVersion
{
  return self->_embeddingVersion != 0;
}

@end