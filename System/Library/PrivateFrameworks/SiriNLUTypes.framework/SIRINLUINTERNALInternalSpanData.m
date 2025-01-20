@interface SIRINLUINTERNALInternalSpanData
- (BOOL)hasMentionDetectorSpanData;
- (BOOL)hasMentionResolverSpanData;
- (BOOL)hasOvertonKgSpanData;
- (BOOL)hasPlumSpanData;
- (BOOL)hasSiriVocabularySpanData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUINTERNALMentionDetectorSpanData)mentionDetectorSpanData;
- (SIRINLUINTERNALMentionResolverSpanData)mentionResolverSpanData;
- (SIRINLUINTERNALOvertonKGSpanData)overtonKgSpanData;
- (SIRINLUINTERNALPLUMSpanData)plumSpanData;
- (SIRINLUINTERNALSiriVocabularySpanData)siriVocabularySpanData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMentionDetectorSpanData:(id)a3;
- (void)setMentionResolverSpanData:(id)a3;
- (void)setOvertonKgSpanData:(id)a3;
- (void)setPlumSpanData:(id)a3;
- (void)setSiriVocabularySpanData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALInternalSpanData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriVocabularySpanData, 0);
  objc_storeStrong((id *)&self->_plumSpanData, 0);
  objc_storeStrong((id *)&self->_overtonKgSpanData, 0);
  objc_storeStrong((id *)&self->_mentionResolverSpanData, 0);
  objc_storeStrong((id *)&self->_mentionDetectorSpanData, 0);
}

- (void)setMentionResolverSpanData:(id)a3
{
}

- (SIRINLUINTERNALMentionResolverSpanData)mentionResolverSpanData
{
  return self->_mentionResolverSpanData;
}

- (void)setMentionDetectorSpanData:(id)a3
{
}

- (SIRINLUINTERNALMentionDetectorSpanData)mentionDetectorSpanData
{
  return self->_mentionDetectorSpanData;
}

- (void)setOvertonKgSpanData:(id)a3
{
}

- (SIRINLUINTERNALOvertonKGSpanData)overtonKgSpanData
{
  return self->_overtonKgSpanData;
}

- (void)setPlumSpanData:(id)a3
{
}

- (SIRINLUINTERNALPLUMSpanData)plumSpanData
{
  return self->_plumSpanData;
}

- (void)setSiriVocabularySpanData:(id)a3
{
}

- (SIRINLUINTERNALSiriVocabularySpanData)siriVocabularySpanData
{
  return self->_siriVocabularySpanData;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  siriVocabularySpanData = self->_siriVocabularySpanData;
  v15 = v4;
  uint64_t v6 = v4[5];
  if (siriVocabularySpanData)
  {
    if (v6) {
      -[SIRINLUINTERNALSiriVocabularySpanData mergeFrom:](siriVocabularySpanData, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALInternalSpanData setSiriVocabularySpanData:](self, "setSiriVocabularySpanData:");
  }
  plumSpanData = self->_plumSpanData;
  uint64_t v8 = v15[4];
  if (plumSpanData)
  {
    if (v8) {
      -[SIRINLUINTERNALPLUMSpanData mergeFrom:](plumSpanData, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUINTERNALInternalSpanData setPlumSpanData:](self, "setPlumSpanData:");
  }
  overtonKgSpanData = self->_overtonKgSpanData;
  uint64_t v10 = v15[3];
  if (overtonKgSpanData)
  {
    if (v10) {
      -[SIRINLUINTERNALOvertonKGSpanData mergeFrom:](overtonKgSpanData, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUINTERNALInternalSpanData setOvertonKgSpanData:](self, "setOvertonKgSpanData:");
  }
  mentionDetectorSpanData = self->_mentionDetectorSpanData;
  uint64_t v12 = v15[1];
  if (mentionDetectorSpanData)
  {
    if (v12) {
      -[SIRINLUINTERNALMentionDetectorSpanData mergeFrom:](mentionDetectorSpanData, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SIRINLUINTERNALInternalSpanData setMentionDetectorSpanData:](self, "setMentionDetectorSpanData:");
  }
  mentionResolverSpanData = self->_mentionResolverSpanData;
  uint64_t v14 = v15[2];
  if (mentionResolverSpanData)
  {
    if (v14) {
      -[SIRINLUINTERNALMentionResolverSpanData mergeFrom:](mentionResolverSpanData, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SIRINLUINTERNALInternalSpanData setMentionResolverSpanData:](self, "setMentionResolverSpanData:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALSiriVocabularySpanData *)self->_siriVocabularySpanData hash];
  unint64_t v4 = [(SIRINLUINTERNALPLUMSpanData *)self->_plumSpanData hash] ^ v3;
  unint64_t v5 = [(SIRINLUINTERNALOvertonKGSpanData *)self->_overtonKgSpanData hash];
  unint64_t v6 = v4 ^ v5 ^ [(SIRINLUINTERNALMentionDetectorSpanData *)self->_mentionDetectorSpanData hash];
  return v6 ^ [(SIRINLUINTERNALMentionResolverSpanData *)self->_mentionResolverSpanData hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((siriVocabularySpanData = self->_siriVocabularySpanData, !((unint64_t)siriVocabularySpanData | v4[5]))
     || -[SIRINLUINTERNALSiriVocabularySpanData isEqual:](siriVocabularySpanData, "isEqual:"))
    && ((plumSpanData = self->_plumSpanData, !((unint64_t)plumSpanData | v4[4]))
     || -[SIRINLUINTERNALPLUMSpanData isEqual:](plumSpanData, "isEqual:"))
    && ((overtonKgSpanData = self->_overtonKgSpanData, !((unint64_t)overtonKgSpanData | v4[3]))
     || -[SIRINLUINTERNALOvertonKGSpanData isEqual:](overtonKgSpanData, "isEqual:"))
    && ((mentionDetectorSpanData = self->_mentionDetectorSpanData, !((unint64_t)mentionDetectorSpanData | v4[1]))
     || -[SIRINLUINTERNALMentionDetectorSpanData isEqual:](mentionDetectorSpanData, "isEqual:")))
  {
    mentionResolverSpanData = self->_mentionResolverSpanData;
    if ((unint64_t)mentionResolverSpanData | v4[2]) {
      char v10 = -[SIRINLUINTERNALMentionResolverSpanData isEqual:](mentionResolverSpanData, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUINTERNALSiriVocabularySpanData *)self->_siriVocabularySpanData copyWithZone:a3];
  v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(SIRINLUINTERNALPLUMSpanData *)self->_plumSpanData copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(SIRINLUINTERNALOvertonKGSpanData *)self->_overtonKgSpanData copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(SIRINLUINTERNALMentionDetectorSpanData *)self->_mentionDetectorSpanData copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  id v14 = [(SIRINLUINTERNALMentionResolverSpanData *)self->_mentionResolverSpanData copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_siriVocabularySpanData)
  {
    objc_msgSend(v4, "setSiriVocabularySpanData:");
    id v4 = v5;
  }
  if (self->_plumSpanData)
  {
    objc_msgSend(v5, "setPlumSpanData:");
    id v4 = v5;
  }
  if (self->_overtonKgSpanData)
  {
    objc_msgSend(v5, "setOvertonKgSpanData:");
    id v4 = v5;
  }
  if (self->_mentionDetectorSpanData)
  {
    objc_msgSend(v5, "setMentionDetectorSpanData:");
    id v4 = v5;
  }
  if (self->_mentionResolverSpanData)
  {
    objc_msgSend(v5, "setMentionResolverSpanData:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_siriVocabularySpanData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_plumSpanData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_overtonKgSpanData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mentionDetectorSpanData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mentionResolverSpanData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALInternalSpanDataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  siriVocabularySpanData = self->_siriVocabularySpanData;
  if (siriVocabularySpanData)
  {
    id v5 = [(SIRINLUINTERNALSiriVocabularySpanData *)siriVocabularySpanData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"siri_vocabulary_span_data"];
  }
  plumSpanData = self->_plumSpanData;
  if (plumSpanData)
  {
    v7 = [(SIRINLUINTERNALPLUMSpanData *)plumSpanData dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"plum_span_data"];
  }
  overtonKgSpanData = self->_overtonKgSpanData;
  if (overtonKgSpanData)
  {
    v9 = [(SIRINLUINTERNALOvertonKGSpanData *)overtonKgSpanData dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"overton_kg_span_data"];
  }
  mentionDetectorSpanData = self->_mentionDetectorSpanData;
  if (mentionDetectorSpanData)
  {
    v11 = [(SIRINLUINTERNALMentionDetectorSpanData *)mentionDetectorSpanData dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"mention_detector_span_data"];
  }
  mentionResolverSpanData = self->_mentionResolverSpanData;
  if (mentionResolverSpanData)
  {
    v13 = [(SIRINLUINTERNALMentionResolverSpanData *)mentionResolverSpanData dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"mention_resolver_span_data"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALInternalSpanData;
  id v4 = [(SIRINLUINTERNALInternalSpanData *)&v8 description];
  id v5 = [(SIRINLUINTERNALInternalSpanData *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMentionResolverSpanData
{
  return self->_mentionResolverSpanData != 0;
}

- (BOOL)hasMentionDetectorSpanData
{
  return self->_mentionDetectorSpanData != 0;
}

- (BOOL)hasOvertonKgSpanData
{
  return self->_overtonKgSpanData != 0;
}

- (BOOL)hasPlumSpanData
{
  return self->_plumSpanData != 0;
}

- (BOOL)hasSiriVocabularySpanData
{
  return self->_siriVocabularySpanData != 0;
}

@end