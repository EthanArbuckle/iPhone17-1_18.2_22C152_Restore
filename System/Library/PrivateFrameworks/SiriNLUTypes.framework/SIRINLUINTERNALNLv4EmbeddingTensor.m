@interface SIRINLUINTERNALNLv4EmbeddingTensor
- (BOOL)hasEmbedderId;
- (BOOL)hasEmbeddingDim;
- (BOOL)hasNumLayer;
- (BOOL)hasNumToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)embedderId;
- (float)values;
- (float)valuesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)embeddingDim;
- (unint64_t)hash;
- (unint64_t)numLayer;
- (unint64_t)numToken;
- (unint64_t)valuesCount;
- (void)addValues:(float)a3;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEmbedderId:(id)a3;
- (void)setEmbeddingDim:(unint64_t)a3;
- (void)setHasEmbeddingDim:(BOOL)a3;
- (void)setHasNumLayer:(BOOL)a3;
- (void)setHasNumToken:(BOOL)a3;
- (void)setNumLayer:(unint64_t)a3;
- (void)setNumToken:(unint64_t)a3;
- (void)setValues:(float *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALNLv4EmbeddingTensor

- (void).cxx_destruct
{
}

- (void)setEmbedderId:(id)a3
{
}

- (NSString)embedderId
{
  return self->_embedderId;
}

- (unint64_t)embeddingDim
{
  return self->_embeddingDim;
}

- (unint64_t)numLayer
{
  return self->_numLayer;
}

- (unint64_t)numToken
{
  return self->_numToken;
}

- (void)mergeFrom:(id)a3
{
  v9 = (unint64_t *)a3;
  uint64_t v4 = [v9 valuesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [v9 valuesAtIndex:i];
      -[SIRINLUINTERNALNLv4EmbeddingTensor addValues:](self, "addValues:");
    }
  }
  v7 = v9;
  char v8 = *((unsigned char *)v9 + 64);
  if ((v8 & 4) != 0)
  {
    self->_numToken = v9[6];
    *(unsigned char *)&self->_has |= 4u;
    char v8 = *((unsigned char *)v9 + 64);
    if ((v8 & 2) == 0)
    {
LABEL_6:
      if ((v8 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((v9[8] & 2) == 0)
  {
    goto LABEL_6;
  }
  self->_numLayer = v9[5];
  *(unsigned char *)&self->_has |= 2u;
  if (v9[8])
  {
LABEL_7:
    self->_embeddingDim = v9[4];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_8:
  if (v9[7])
  {
    -[SIRINLUINTERNALNLv4EmbeddingTensor setEmbedderId:](self, "setEmbedderId:");
    v7 = v9;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedFloatHash();
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_embedderId hash];
  }
  unint64_t v4 = 2654435761u * self->_numToken;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_numLayer;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v6 = 2654435761u * self->_embeddingDim;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_embedderId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedFloatIsEqual()) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_numToken != *((void *)v4 + 6)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
LABEL_20:
    char v6 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_numLayer != *((void *)v4 + 5)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_embeddingDim != *((void *)v4 + 4)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_20;
  }
  embedderId = self->_embedderId;
  if ((unint64_t)embedderId | *((void *)v4 + 7)) {
    char v6 = -[NSString isEqual:](embedderId, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_21:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedFloatCopy();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 40) = self->_numLayer;
    *(unsigned char *)(v5 + 64) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 48) = self->_numToken;
  *(unsigned char *)(v5 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(void *)(v5 + 32) = self->_embeddingDim;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
LABEL_5:
  uint64_t v7 = [(NSString *)self->_embedderId copyWithZone:a3];
  char v8 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v7;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(SIRINLUINTERNALNLv4EmbeddingTensor *)self valuesCount])
  {
    [v9 clearValues];
    unint64_t v4 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self valuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(SIRINLUINTERNALNLv4EmbeddingTensor *)self valuesAtIndex:i];
        objc_msgSend(v9, "addValues:");
      }
    }
  }
  char has = (char)self->_has;
  char v8 = v9;
  if ((has & 4) != 0)
  {
    *((void *)v9 + 6) = self->_numToken;
    *((unsigned char *)v9 + 64) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v9 + 5) = self->_numLayer;
  *((unsigned char *)v9 + 64) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    *((void *)v9 + 4) = self->_embeddingDim;
    *((unsigned char *)v9 + 64) |= 1u;
  }
LABEL_9:
  if (self->_embedderId)
  {
    objc_msgSend(v9, "setEmbedderId:");
    char v8 = v9;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_values.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_values.count);
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_6:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v7;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    PBDataWriterWriteUint64Field();
    id v4 = v7;
  }
LABEL_8:
  if (self->_embedderId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALNLv4EmbeddingTensorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = PBRepeatedFloatNSArray();
  [v3 setObject:v4 forKey:@"values"];

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    id v9 = [NSNumber numberWithUnsignedLongLong:self->_numToken];
    [v3 setObject:v9 forKey:@"num_token"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithUnsignedLongLong:self->_numLayer];
  [v3 setObject:v10 forKey:@"num_layer"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    char v6 = [NSNumber numberWithUnsignedLongLong:self->_embeddingDim];
    [v3 setObject:v6 forKey:@"embedding_dim"];
  }
LABEL_5:
  embedderId = self->_embedderId;
  if (embedderId) {
    [v3 setObject:embedderId forKey:@"embedder_id"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALNLv4EmbeddingTensor;
  id v4 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEmbedderId
{
  return self->_embedderId != 0;
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

- (BOOL)hasNumLayer
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNumLayer:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNumLayer:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numLayer = a3;
}

- (BOOL)hasNumToken
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNumToken:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNumToken:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numToken = a3;
}

- (void)setValues:(float *)a3 count:(unint64_t)a4
{
}

- (float)valuesAtIndex:(unint64_t)a3
{
  p_values = &self->_values;
  unint64_t count = self->_values.count;
  if (count <= a3)
  {
    char v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_values->list[a3];
}

- (void)addValues:(float)a3
{
}

- (void)clearValues
{
}

- (float)values
{
  return self->_values.list;
}

- (unint64_t)valuesCount
{
  return self->_values.count;
}

- (void)dealloc
{
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUINTERNALNLv4EmbeddingTensor;
  [(SIRINLUINTERNALNLv4EmbeddingTensor *)&v3 dealloc];
}

@end