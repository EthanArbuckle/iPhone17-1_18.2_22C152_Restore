@interface SIRINLUINTERNALPreprocessingWrapper
- (BOOL)hasEmbeddingResponse;
- (BOOL)hasMentionResolverResponse;
- (BOOL)hasSpanMatchResponse;
- (BOOL)hasTokenizerResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUINTERNALEMBEDDINGEmbeddingResponse)embeddingResponse;
- (SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse)mentionResolverResponse;
- (SIRINLUINTERNALSPANMATCHSpanMatchResponse)spanMatchResponse;
- (SIRINLUINTERNALTOKENIZERTokenizerResponse)tokenizerResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEmbeddingResponse:(id)a3;
- (void)setMentionResolverResponse:(id)a3;
- (void)setSpanMatchResponse:(id)a3;
- (void)setTokenizerResponse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALPreprocessingWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizerResponse, 0);
  objc_storeStrong((id *)&self->_spanMatchResponse, 0);
  objc_storeStrong((id *)&self->_mentionResolverResponse, 0);
  objc_storeStrong((id *)&self->_embeddingResponse, 0);
}

- (void)setMentionResolverResponse:(id)a3
{
}

- (SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse)mentionResolverResponse
{
  return self->_mentionResolverResponse;
}

- (void)setEmbeddingResponse:(id)a3
{
}

- (SIRINLUINTERNALEMBEDDINGEmbeddingResponse)embeddingResponse
{
  return self->_embeddingResponse;
}

- (void)setSpanMatchResponse:(id)a3
{
}

- (SIRINLUINTERNALSPANMATCHSpanMatchResponse)spanMatchResponse
{
  return self->_spanMatchResponse;
}

- (void)setTokenizerResponse:(id)a3
{
}

- (SIRINLUINTERNALTOKENIZERTokenizerResponse)tokenizerResponse
{
  return self->_tokenizerResponse;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  tokenizerResponse = self->_tokenizerResponse;
  uint64_t v6 = v4[4];
  v13 = v4;
  if (tokenizerResponse)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALTOKENIZERTokenizerResponse mergeFrom:](tokenizerResponse, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALPreprocessingWrapper setTokenizerResponse:](self, "setTokenizerResponse:");
  }
  v4 = v13;
LABEL_7:
  spanMatchResponse = self->_spanMatchResponse;
  uint64_t v8 = v4[3];
  if (spanMatchResponse)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUINTERNALSPANMATCHSpanMatchResponse mergeFrom:](spanMatchResponse, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUINTERNALPreprocessingWrapper setSpanMatchResponse:](self, "setSpanMatchResponse:");
  }
  v4 = v13;
LABEL_13:
  embeddingResponse = self->_embeddingResponse;
  uint64_t v10 = v4[1];
  if (embeddingResponse)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse mergeFrom:](embeddingResponse, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[SIRINLUINTERNALPreprocessingWrapper setEmbeddingResponse:](self, "setEmbeddingResponse:");
  }
  v4 = v13;
LABEL_19:
  mentionResolverResponse = self->_mentionResolverResponse;
  uint64_t v12 = v4[2];
  if (mentionResolverResponse)
  {
    if (v12) {
      -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse mergeFrom:](mentionResolverResponse, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SIRINLUINTERNALPreprocessingWrapper setMentionResolverResponse:](self, "setMentionResolverResponse:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALTOKENIZERTokenizerResponse *)self->_tokenizerResponse hash];
  unint64_t v4 = [(SIRINLUINTERNALSPANMATCHSpanMatchResponse *)self->_spanMatchResponse hash] ^ v3;
  unint64_t v5 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self->_embeddingResponse hash];
  return v4 ^ v5 ^ [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *)self->_mentionResolverResponse hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((tokenizerResponse = self->_tokenizerResponse, !((unint64_t)tokenizerResponse | v4[4]))
     || -[SIRINLUINTERNALTOKENIZERTokenizerResponse isEqual:](tokenizerResponse, "isEqual:"))
    && ((spanMatchResponse = self->_spanMatchResponse, !((unint64_t)spanMatchResponse | v4[3]))
     || -[SIRINLUINTERNALSPANMATCHSpanMatchResponse isEqual:](spanMatchResponse, "isEqual:"))
    && ((embeddingResponse = self->_embeddingResponse, !((unint64_t)embeddingResponse | v4[1]))
     || -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse isEqual:](embeddingResponse, "isEqual:")))
  {
    mentionResolverResponse = self->_mentionResolverResponse;
    if ((unint64_t)mentionResolverResponse | v4[2]) {
      char v9 = -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse isEqual:](mentionResolverResponse, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUINTERNALTOKENIZERTokenizerResponse *)self->_tokenizerResponse copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(SIRINLUINTERNALSPANMATCHSpanMatchResponse *)self->_spanMatchResponse copyWithZone:a3];
  char v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)self->_embeddingResponse copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *)self->_mentionResolverResponse copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tokenizerResponse)
  {
    objc_msgSend(v4, "setTokenizerResponse:");
    id v4 = v5;
  }
  if (self->_spanMatchResponse)
  {
    objc_msgSend(v5, "setSpanMatchResponse:");
    id v4 = v5;
  }
  if (self->_embeddingResponse)
  {
    objc_msgSend(v5, "setEmbeddingResponse:");
    id v4 = v5;
  }
  if (self->_mentionResolverResponse)
  {
    objc_msgSend(v5, "setMentionResolverResponse:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tokenizerResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_spanMatchResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_embeddingResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mentionResolverResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALPreprocessingWrapperReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  tokenizerResponse = self->_tokenizerResponse;
  if (tokenizerResponse)
  {
    id v5 = [(SIRINLUINTERNALTOKENIZERTokenizerResponse *)tokenizerResponse dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"tokenizer_response"];
  }
  spanMatchResponse = self->_spanMatchResponse;
  if (spanMatchResponse)
  {
    v7 = [(SIRINLUINTERNALSPANMATCHSpanMatchResponse *)spanMatchResponse dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"span_match_response"];
  }
  embeddingResponse = self->_embeddingResponse;
  if (embeddingResponse)
  {
    char v9 = [(SIRINLUINTERNALEMBEDDINGEmbeddingResponse *)embeddingResponse dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"embedding_response"];
  }
  mentionResolverResponse = self->_mentionResolverResponse;
  if (mentionResolverResponse)
  {
    v11 = [(SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *)mentionResolverResponse dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"mention_resolver_response"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALPreprocessingWrapper;
  id v4 = [(SIRINLUINTERNALPreprocessingWrapper *)&v8 description];
  id v5 = [(SIRINLUINTERNALPreprocessingWrapper *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMentionResolverResponse
{
  return self->_mentionResolverResponse != 0;
}

- (BOOL)hasEmbeddingResponse
{
  return self->_embeddingResponse != 0;
}

- (BOOL)hasSpanMatchResponse
{
  return self->_spanMatchResponse != 0;
}

- (BOOL)hasTokenizerResponse
{
  return self->_tokenizerResponse != 0;
}

@end