@interface SIRINLUINTERNALEMBEDDINGEmbeddingResponse
+ (Class)embeddingTensorOutputsType;
+ (Class)subwordEmbeddingTensorOutputsType;
- (BOOL)hasEmbeddingDim;
- (BOOL)hasEmbeddingTensor;
- (BOOL)hasNumLayer;
- (BOOL)hasNumSubwordToken;
- (BOOL)hasNumToken;
- (BOOL)hasSentenceEmbeddingTensor;
- (BOOL)hasSubwordTokenChain;
- (BOOL)hasTokenChain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)embeddingTensorOutputs;
- (NSMutableArray)subwordEmbeddingTensorOutputs;
- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor;
- (SIRINLUINTERNALNLv4EmbeddingTensor)sentenceEmbeddingTensor;
- (SIRINLUINTERNALSubwordTokenChain)subwordTokenChain;
- (SIRINLUINTERNALTokenChain)tokenChain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)embeddingTensorOutputsAtIndex:(unint64_t)a3;
- (id)subwordEmbeddingTensorOutputsAtIndex:(unint64_t)a3;
- (unint64_t)embeddingDim;
- (unint64_t)embeddingTensorOutputsCount;
- (unint64_t)hash;
- (unint64_t)numLayer;
- (unint64_t)numSubwordToken;
- (unint64_t)numToken;
- (unint64_t)subwordEmbeddingTensorOutputsCount;
- (void)addEmbeddingTensorOutputs:(id)a3;
- (void)addSubwordEmbeddingTensorOutputs:(id)a3;
- (void)clearEmbeddingTensorOutputs;
- (void)clearSubwordEmbeddingTensorOutputs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEmbeddingDim:(unint64_t)a3;
- (void)setEmbeddingTensor:(id)a3;
- (void)setEmbeddingTensorOutputs:(id)a3;
- (void)setHasEmbeddingDim:(BOOL)a3;
- (void)setHasNumLayer:(BOOL)a3;
- (void)setHasNumSubwordToken:(BOOL)a3;
- (void)setHasNumToken:(BOOL)a3;
- (void)setNumLayer:(unint64_t)a3;
- (void)setNumSubwordToken:(unint64_t)a3;
- (void)setNumToken:(unint64_t)a3;
- (void)setSentenceEmbeddingTensor:(id)a3;
- (void)setSubwordEmbeddingTensorOutputs:(id)a3;
- (void)setSubwordTokenChain:(id)a3;
- (void)setTokenChain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALEMBEDDINGEmbeddingResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_subwordTokenChain, 0);
  objc_storeStrong((id *)&self->_subwordEmbeddingTensorOutputs, 0);
  objc_storeStrong((id *)&self->_sentenceEmbeddingTensor, 0);
  objc_storeStrong((id *)&self->_embeddingTensorOutputs, 0);
  objc_storeStrong((id *)&self->_embeddingTensor, 0);
}

- (void)setSubwordEmbeddingTensorOutputs:(id)a3
{
}

- (NSMutableArray)subwordEmbeddingTensorOutputs
{
  return self->_subwordEmbeddingTensorOutputs;
}

- (unint64_t)numSubwordToken
{
  return self->_numSubwordToken;
}

- (void)setSubwordTokenChain:(id)a3
{
}

- (SIRINLUINTERNALSubwordTokenChain)subwordTokenChain
{
  return self->_subwordTokenChain;
}

- (void)setEmbeddingTensorOutputs:(id)a3
{
}

- (NSMutableArray)embeddingTensorOutputs
{
  return self->_embeddingTensorOutputs;
}

- (void)setSentenceEmbeddingTensor:(id)a3
{
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)sentenceEmbeddingTensor
{
  return self->_sentenceEmbeddingTensor;
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

- (void)setTokenChain:(id)a3
{
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setEmbeddingTensor:(id)a3
{
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor
{
  return self->_embeddingTensor;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  embeddingTensor = self->_embeddingTensor;
  uint64_t v6 = *((void *)v4 + 5);
  if (embeddingTensor)
  {
    if (v6) {
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddingTensor, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse setEmbeddingTensor:](self, "setEmbeddingTensor:");
  }
  tokenChain = self->_tokenChain;
  uint64_t v8 = *((void *)v4 + 10);
  if (tokenChain)
  {
    if (v8) {
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse setTokenChain:](self, "setTokenChain:");
  }
  char v9 = *((unsigned char *)v4 + 88);
  if ((v9 & 8) != 0)
  {
    self->_numToken = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v9 = *((unsigned char *)v4 + 88);
    if ((v9 & 2) == 0)
    {
LABEL_13:
      if ((v9 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_numLayer = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 88))
  {
LABEL_14:
    self->_embeddingDim = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_15:
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  uint64_t v11 = *((void *)v4 + 7);
  if (sentenceEmbeddingTensor)
  {
    if (v11) {
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](sentenceEmbeddingTensor, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse setSentenceEmbeddingTensor:](self, "setSentenceEmbeddingTensor:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = *((id *)v4 + 6);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self addEmbeddingTensorOutputs:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v14);
  }

  subwordTokenChain = self->_subwordTokenChain;
  uint64_t v18 = *((void *)v4 + 9);
  if (subwordTokenChain)
  {
    if (v18) {
      -[SIRINLUINTERNALSubwordTokenChain mergeFrom:](subwordTokenChain, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse setSubwordTokenChain:](self, "setSubwordTokenChain:");
  }
  if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    self->_numSubwordToken = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = *((id *)v4 + 8);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse addSubwordEmbeddingTensorOutputs:](self, "addSubwordEmbeddingTensorOutputs:", *(void *)(*((void *)&v24 + 1) + 8 * j), (void)v24);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v21);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddingTensor hash];
  unint64_t v4 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v5 = 2654435761u * self->_numToken;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v6 = 2654435761u * self->_numLayer;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    unint64_t v7 = 2654435761u * self->_embeddingDim;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v7 = 0;
LABEL_8:
  unint64_t v8 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_sentenceEmbeddingTensor hash];
  uint64_t v9 = [(NSMutableArray *)self->_embeddingTensorOutputs hash];
  unint64_t v10 = [(SIRINLUINTERNALSubwordTokenChain *)self->_subwordTokenChain hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v11 = 2654435761u * self->_numSubwordToken;
  }
  else {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSMutableArray *)self->_subwordEmbeddingTensorOutputs hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  embeddingTensor = self->_embeddingTensor;
  if ((unint64_t)embeddingTensor | *((void *)v4 + 5))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddingTensor, "isEqual:")) {
      goto LABEL_34;
    }
  }
  tokenChain = self->_tokenChain;
  if ((unint64_t)tokenChain | *((void *)v4 + 10))
  {
    if (!-[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:")) {
      goto LABEL_34;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 8) == 0 || self->_numToken != *((void *)v4 + 4)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 8) != 0)
  {
LABEL_34:
    char v11 = 0;
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_numLayer != *((void *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_embeddingDim != *((void *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_34;
  }
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  if ((unint64_t)sentenceEmbeddingTensor | *((void *)v4 + 7)
    && !-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](sentenceEmbeddingTensor, "isEqual:"))
  {
    goto LABEL_34;
  }
  embeddingTensorOutputs = self->_embeddingTensorOutputs;
  if ((unint64_t)embeddingTensorOutputs | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](embeddingTensorOutputs, "isEqual:")) {
      goto LABEL_34;
    }
  }
  subwordTokenChain = self->_subwordTokenChain;
  if ((unint64_t)subwordTokenChain | *((void *)v4 + 9))
  {
    if (!-[SIRINLUINTERNALSubwordTokenChain isEqual:](subwordTokenChain, "isEqual:")) {
      goto LABEL_34;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 4) == 0 || self->_numSubwordToken != *((void *)v4 + 3)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    goto LABEL_34;
  }
  subwordEmbeddingTensorOutputs = self->_subwordEmbeddingTensorOutputs;
  if ((unint64_t)subwordEmbeddingTensorOutputs | *((void *)v4 + 8)) {
    char v11 = -[NSMutableArray isEqual:](subwordEmbeddingTensorOutputs, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_35:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddingTensor copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v8;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_numToken;
    *(unsigned char *)(v5 + 88) |= 8u;
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
  *(void *)(v5 + 16) = self->_numLayer;
  *(unsigned char *)(v5 + 88) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_embeddingDim;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
LABEL_5:
  id v11 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_sentenceEmbeddingTensor copyWithZone:a3];
  id v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v13 = self->_embeddingTensorOutputs;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addEmbeddingTensorOutputs:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v15);
  }

  id v19 = [(SIRINLUINTERNALSubwordTokenChain *)self->_subwordTokenChain copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v19;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_numSubwordToken;
    *(unsigned char *)(v5 + 88) |= 4u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v21 = self->_subwordEmbeddingTensorOutputs;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (void)v28);
        [(id)v5 addSubwordEmbeddingTensorOutputs:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v23);
  }

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (self->_embeddingTensor)
  {
    objc_msgSend(v4, "setEmbeddingTensor:");
    id v4 = v14;
  }
  if (self->_tokenChain)
  {
    objc_msgSend(v14, "setTokenChain:");
    id v4 = v14;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)v4 + 4) = self->_numToken;
    *((unsigned char *)v4 + 88) |= 8u;
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
  *((void *)v4 + 2) = self->_numLayer;
  *((unsigned char *)v4 + 88) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    *((void *)v4 + 1) = self->_embeddingDim;
    *((unsigned char *)v4 + 88) |= 1u;
  }
LABEL_9:
  if (self->_sentenceEmbeddingTensor) {
    objc_msgSend(v14, "setSentenceEmbeddingTensor:");
  }
  if ([(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self embeddingTensorOutputsCount])
  {
    [v14 clearEmbeddingTensorOutputs];
    unint64_t v6 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self embeddingTensorOutputsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self embeddingTensorOutputsAtIndex:i];
        [v14 addEmbeddingTensorOutputs:v9];
      }
    }
  }
  if (self->_subwordTokenChain) {
    objc_msgSend(v14, "setSubwordTokenChain:");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v14 + 3) = self->_numSubwordToken;
    *((unsigned char *)v14 + 88) |= 4u;
  }
  if ([(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self subwordEmbeddingTensorOutputsCount])
  {
    [v14 clearSubwordEmbeddingTensorOutputs];
    unint64_t v10 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self subwordEmbeddingTensorOutputsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self subwordEmbeddingTensorOutputsAtIndex:j];
        [v14 addSubwordEmbeddingTensorOutputs:v13];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_embeddingTensor) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_tokenChain) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
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
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_8:
  }
    PBDataWriterWriteUint64Field();
LABEL_9:
  if (self->_sentenceEmbeddingTensor) {
    PBDataWriterWriteSubmessage();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v6 = self->_embeddingTensorOutputs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  if (self->_subwordTokenChain) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v11 = self->_subwordEmbeddingTensorOutputs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALEMBEDDINGEmbeddingResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  embeddingTensor = self->_embeddingTensor;
  if (embeddingTensor)
  {
    uint64_t v5 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)embeddingTensor dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"embedding_tensor"];
  }
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    uint64_t v7 = [(SIRINLUINTERNALTokenChain *)tokenChain dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"token_chain"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    long long v30 = [NSNumber numberWithUnsignedLongLong:self->_numToken];
    [v3 setObject:v30 forKey:@"num_token"];

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
  long long v31 = [NSNumber numberWithUnsignedLongLong:self->_numLayer];
  [v3 setObject:v31 forKey:@"num_layer"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    uint64_t v9 = [NSNumber numberWithUnsignedLongLong:self->_embeddingDim];
    [v3 setObject:v9 forKey:@"embedding_dim"];
  }
LABEL_9:
  sentenceEmbeddingTensor = self->_sentenceEmbeddingTensor;
  if (sentenceEmbeddingTensor)
  {
    unint64_t v11 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)sentenceEmbeddingTensor dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"sentence_embedding_tensor"];
  }
  if ([(NSMutableArray *)self->_embeddingTensorOutputs count])
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_embeddingTensorOutputs, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v13 = self->_embeddingTensorOutputs;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"embedding_tensor_outputs"];
  }
  subwordTokenChain = self->_subwordTokenChain;
  if (subwordTokenChain)
  {
    long long v20 = [(SIRINLUINTERNALSubwordTokenChain *)subwordTokenChain dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"subword_token_chain"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    long long v21 = [NSNumber numberWithUnsignedLongLong:self->_numSubwordToken];
    [v3 setObject:v21 forKey:@"num_subword_token"];
  }
  if ([(NSMutableArray *)self->_subwordEmbeddingTensorOutputs count])
  {
    long long v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_subwordEmbeddingTensorOutputs, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v23 = self->_subwordEmbeddingTensorOutputs;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "dictionaryRepresentation", (void)v32);
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKey:@"subword_embedding_tensor_outputs"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALEMBEDDINGEmbeddingResponse;
  id v4 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)subwordEmbeddingTensorOutputsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subwordEmbeddingTensorOutputs objectAtIndex:a3];
}

- (unint64_t)subwordEmbeddingTensorOutputsCount
{
  return [(NSMutableArray *)self->_subwordEmbeddingTensorOutputs count];
}

- (void)addSubwordEmbeddingTensorOutputs:(id)a3
{
  id v4 = a3;
  subwordEmbeddingTensorOutputs = self->_subwordEmbeddingTensorOutputs;
  id v8 = v4;
  if (!subwordEmbeddingTensorOutputs)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_subwordEmbeddingTensorOutputs;
    self->_subwordEmbeddingTensorOutputs = v6;

    id v4 = v8;
    subwordEmbeddingTensorOutputs = self->_subwordEmbeddingTensorOutputs;
  }
  [(NSMutableArray *)subwordEmbeddingTensorOutputs addObject:v4];
}

- (void)clearSubwordEmbeddingTensorOutputs
{
}

- (BOOL)hasNumSubwordToken
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNumSubwordToken:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNumSubwordToken:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numSubwordToken = a3;
}

- (BOOL)hasSubwordTokenChain
{
  return self->_subwordTokenChain != 0;
}

- (id)embeddingTensorOutputsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_embeddingTensorOutputs objectAtIndex:a3];
}

- (unint64_t)embeddingTensorOutputsCount
{
  return [(NSMutableArray *)self->_embeddingTensorOutputs count];
}

- (void)addEmbeddingTensorOutputs:(id)a3
{
  id v4 = a3;
  embeddingTensorOutputs = self->_embeddingTensorOutputs;
  id v8 = v4;
  if (!embeddingTensorOutputs)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_embeddingTensorOutputs;
    self->_embeddingTensorOutputs = v6;

    id v4 = v8;
    embeddingTensorOutputs = self->_embeddingTensorOutputs;
  }
  [(NSMutableArray *)embeddingTensorOutputs addObject:v4];
}

- (void)clearEmbeddingTensorOutputs
{
}

- (BOOL)hasSentenceEmbeddingTensor
{
  return self->_sentenceEmbeddingTensor != 0;
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
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasNumToken:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setNumToken:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numToken = a3;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasEmbeddingTensor
{
  return self->_embeddingTensor != 0;
}

+ (Class)subwordEmbeddingTensorOutputsType
{
  return (Class)objc_opt_class();
}

+ (Class)embeddingTensorOutputsType
{
  return (Class)objc_opt_class();
}

@end