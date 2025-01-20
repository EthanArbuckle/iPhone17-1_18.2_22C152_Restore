@interface ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ContactEmbeddingAnalysisPETNeuralNetEmbedding)embeddingsAfterActivation;
- (ContactEmbeddingAnalysisPETNeuralNetEmbedding)embeddingsBeforeActivation;
- (NSString)contactId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContactId:(id)a3;
- (void)setEmbeddingsAfterActivation:(id)a3;
- (void)setEmbeddingsBeforeActivation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent;
  v4 = [(ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent *)&v8 description];
  v5 = [(ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  embeddingsBeforeActivation = self->_embeddingsBeforeActivation;
  if (embeddingsBeforeActivation)
  {
    v5 = [(ContactEmbeddingAnalysisPETNeuralNetEmbedding *)embeddingsBeforeActivation dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"embeddingsBeforeActivation"];
  }
  embeddingsAfterActivation = self->_embeddingsAfterActivation;
  if (embeddingsAfterActivation)
  {
    v7 = [(ContactEmbeddingAnalysisPETNeuralNetEmbedding *)embeddingsAfterActivation dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"embeddingsAfterActivation"];
  }
  contactId = self->_contactId;
  if (contactId) {
    [v3 setObject:contactId forKey:@"contactId"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_embeddingsBeforeActivation) {
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_embeddingsAfterActivation) {
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_contactId) {
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  embeddingsBeforeActivation = self->_embeddingsBeforeActivation;
  id v5 = a3;
  [v5 setEmbeddingsBeforeActivation:embeddingsBeforeActivation];
  [v5 setEmbeddingsAfterActivation:self->_embeddingsAfterActivation];
  [v5 setContactId:self->_contactId];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ContactEmbeddingAnalysisPETNeuralNetEmbedding *)self->_embeddingsBeforeActivation copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(ContactEmbeddingAnalysisPETNeuralNetEmbedding *)self->_embeddingsAfterActivation copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_contactId copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((embeddingsBeforeActivation = self->_embeddingsBeforeActivation,
         !((unint64_t)embeddingsBeforeActivation | v4[3]))
     || -[ContactEmbeddingAnalysisPETNeuralNetEmbedding isEqual:](embeddingsBeforeActivation, "isEqual:"))
    && ((embeddingsAfterActivation = self->_embeddingsAfterActivation,
         !((unint64_t)embeddingsAfterActivation | v4[2]))
     || -[ContactEmbeddingAnalysisPETNeuralNetEmbedding isEqual:](embeddingsAfterActivation, "isEqual:")))
  {
    contactId = self->_contactId;
    if ((unint64_t)contactId | v4[1]) {
      char v8 = -[NSString isEqual:](contactId, "isEqual:");
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

- (unint64_t)hash
{
  unint64_t v3 = [(ContactEmbeddingAnalysisPETNeuralNetEmbedding *)self->_embeddingsBeforeActivation hash];
  unint64_t v4 = [(ContactEmbeddingAnalysisPETNeuralNetEmbedding *)self->_embeddingsAfterActivation hash] ^ v3;
  return v4 ^ [(NSString *)self->_contactId hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  embeddingsBeforeActivation = self->_embeddingsBeforeActivation;
  uint64_t v6 = v4[3];
  v9 = v4;
  if (embeddingsBeforeActivation)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ContactEmbeddingAnalysisPETNeuralNetEmbedding mergeFrom:](embeddingsBeforeActivation, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent setEmbeddingsBeforeActivation:](self, "setEmbeddingsBeforeActivation:");
  }
  unint64_t v4 = v9;
LABEL_7:
  embeddingsAfterActivation = self->_embeddingsAfterActivation;
  uint64_t v8 = v4[2];
  if (embeddingsAfterActivation)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[ContactEmbeddingAnalysisPETNeuralNetEmbedding mergeFrom:](embeddingsAfterActivation, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent setEmbeddingsAfterActivation:](self, "setEmbeddingsAfterActivation:");
  }
  unint64_t v4 = v9;
LABEL_13:
  if (v4[1]) {
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent setContactId:](self, "setContactId:");
  }

  MEMORY[0x1F41817F8]();
}

- (ContactEmbeddingAnalysisPETNeuralNetEmbedding)embeddingsBeforeActivation
{
  return self->_embeddingsBeforeActivation;
}

- (void)setEmbeddingsBeforeActivation:(id)a3
{
}

- (ContactEmbeddingAnalysisPETNeuralNetEmbedding)embeddingsAfterActivation
{
  return self->_embeddingsAfterActivation;
}

- (void)setEmbeddingsAfterActivation:(id)a3
{
}

- (NSString)contactId
{
  return self->_contactId;
}

- (void)setContactId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingsBeforeActivation, 0);
  objc_storeStrong((id *)&self->_embeddingsAfterActivation, 0);

  objc_storeStrong((id *)&self->_contactId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:]", "ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent.m", 120, "self->_embeddingsBeforeActivation != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:]", "ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent.m", 125, "self->_embeddingsAfterActivation != nil");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:]", "ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent.m", 130, "nil != self->_contactId");
}

@end