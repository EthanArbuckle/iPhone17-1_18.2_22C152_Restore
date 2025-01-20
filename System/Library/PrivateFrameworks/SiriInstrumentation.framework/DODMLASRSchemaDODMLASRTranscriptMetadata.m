@interface DODMLASRSchemaDODMLASRTranscriptMetadata
- (BOOL)hasNumDocumentsAccepted;
- (BOOL)hasNumDocumentsDictated;
- (BOOL)hasNumDocumentsRejected;
- (BOOL)hasNumDocumentsTyped;
- (BOOL)hasNumSentencesAccepted;
- (BOOL)hasNumSentencesMungeChanged;
- (BOOL)hasNumSentencesMungeRejected;
- (BOOL)hasNumSentencesRejected;
- (BOOL)hasNumTokensAccepted;
- (BOOL)hasNumTokensDictated;
- (BOOL)hasNumTokensEstimatedExamined;
- (BOOL)hasNumTokensEstimatedRejected;
- (BOOL)hasNumTokensOutOfVocabularyAccepted;
- (BOOL)hasNumTokensTyped;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRTranscriptMetadata)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRTranscriptMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numDocumentsAccepted;
- (unsigned)numDocumentsDictated;
- (unsigned)numDocumentsRejected;
- (unsigned)numDocumentsTyped;
- (unsigned)numSentencesAccepted;
- (unsigned)numSentencesMungeChanged;
- (unsigned)numSentencesMungeRejected;
- (unsigned)numSentencesRejected;
- (unsigned)numTokensAccepted;
- (unsigned)numTokensDictated;
- (unsigned)numTokensEstimatedExamined;
- (unsigned)numTokensEstimatedRejected;
- (unsigned)numTokensOutOfVocabularyAccepted;
- (unsigned)numTokensTyped;
- (void)deleteNumDocumentsAccepted;
- (void)deleteNumDocumentsDictated;
- (void)deleteNumDocumentsRejected;
- (void)deleteNumDocumentsTyped;
- (void)deleteNumSentencesAccepted;
- (void)deleteNumSentencesMungeChanged;
- (void)deleteNumSentencesMungeRejected;
- (void)deleteNumSentencesRejected;
- (void)deleteNumTokensAccepted;
- (void)deleteNumTokensDictated;
- (void)deleteNumTokensEstimatedExamined;
- (void)deleteNumTokensEstimatedRejected;
- (void)deleteNumTokensOutOfVocabularyAccepted;
- (void)deleteNumTokensTyped;
- (void)setHasNumDocumentsAccepted:(BOOL)a3;
- (void)setHasNumDocumentsDictated:(BOOL)a3;
- (void)setHasNumDocumentsRejected:(BOOL)a3;
- (void)setHasNumDocumentsTyped:(BOOL)a3;
- (void)setHasNumSentencesAccepted:(BOOL)a3;
- (void)setHasNumSentencesMungeChanged:(BOOL)a3;
- (void)setHasNumSentencesMungeRejected:(BOOL)a3;
- (void)setHasNumSentencesRejected:(BOOL)a3;
- (void)setHasNumTokensAccepted:(BOOL)a3;
- (void)setHasNumTokensDictated:(BOOL)a3;
- (void)setHasNumTokensEstimatedExamined:(BOOL)a3;
- (void)setHasNumTokensEstimatedRejected:(BOOL)a3;
- (void)setHasNumTokensOutOfVocabularyAccepted:(BOOL)a3;
- (void)setHasNumTokensTyped:(BOOL)a3;
- (void)setNumDocumentsAccepted:(unsigned int)a3;
- (void)setNumDocumentsDictated:(unsigned int)a3;
- (void)setNumDocumentsRejected:(unsigned int)a3;
- (void)setNumDocumentsTyped:(unsigned int)a3;
- (void)setNumSentencesAccepted:(unsigned int)a3;
- (void)setNumSentencesMungeChanged:(unsigned int)a3;
- (void)setNumSentencesMungeRejected:(unsigned int)a3;
- (void)setNumSentencesRejected:(unsigned int)a3;
- (void)setNumTokensAccepted:(unsigned int)a3;
- (void)setNumTokensDictated:(unsigned int)a3;
- (void)setNumTokensEstimatedExamined:(unsigned int)a3;
- (void)setNumTokensEstimatedRejected:(unsigned int)a3;
- (void)setNumTokensOutOfVocabularyAccepted:(unsigned int)a3;
- (void)setNumTokensTyped:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRTranscriptMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)numTokensEstimatedExamined
{
  return self->_numTokensEstimatedExamined;
}

- (unsigned)numTokensEstimatedRejected
{
  return self->_numTokensEstimatedRejected;
}

- (unsigned)numSentencesMungeChanged
{
  return self->_numSentencesMungeChanged;
}

- (unsigned)numSentencesMungeRejected
{
  return self->_numSentencesMungeRejected;
}

- (unsigned)numTokensTyped
{
  return self->_numTokensTyped;
}

- (unsigned)numTokensDictated
{
  return self->_numTokensDictated;
}

- (unsigned)numDocumentsTyped
{
  return self->_numDocumentsTyped;
}

- (unsigned)numDocumentsDictated
{
  return self->_numDocumentsDictated;
}

- (unsigned)numTokensOutOfVocabularyAccepted
{
  return self->_numTokensOutOfVocabularyAccepted;
}

- (unsigned)numTokensAccepted
{
  return self->_numTokensAccepted;
}

- (unsigned)numSentencesAccepted
{
  return self->_numSentencesAccepted;
}

- (unsigned)numDocumentsAccepted
{
  return self->_numDocumentsAccepted;
}

- (unsigned)numSentencesRejected
{
  return self->_numSentencesRejected;
}

- (unsigned)numDocumentsRejected
{
  return self->_numDocumentsRejected;
}

- (DODMLASRSchemaDODMLASRTranscriptMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)DODMLASRSchemaDODMLASRTranscriptMetadata;
  v5 = [(DODMLASRSchemaDODMLASRTranscriptMetadata *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numDocumentsRejected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsRejected:](v5, "setNumDocumentsRejected:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numSentencesRejected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesRejected:](v5, "setNumSentencesRejected:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numDocumentsAccepted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsAccepted:](v5, "setNumDocumentsAccepted:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"numSentencesAccepted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesAccepted:](v5, "setNumSentencesAccepted:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numTokensAccepted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensAccepted:](v5, "setNumTokensAccepted:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"numTokensOutOfVocabularyAccepted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensOutOfVocabularyAccepted:](v5, "setNumTokensOutOfVocabularyAccepted:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"numDocumentsDictated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsDictated:](v5, "setNumDocumentsDictated:", [v12 unsignedIntValue]);
    }
    v29 = v6;
    v13 = [v4 objectForKeyedSubscript:@"numDocumentsTyped"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumDocumentsTyped:](v5, "setNumDocumentsTyped:", [v13 unsignedIntValue]);
    }
    v23 = v13;
    v28 = v7;
    v14 = [v4 objectForKeyedSubscript:@"numTokensDictated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensDictated:](v5, "setNumTokensDictated:", [v14 unsignedIntValue]);
    }
    v27 = v8;
    v15 = [v4 objectForKeyedSubscript:@"numTokensTyped"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensTyped:](v5, "setNumTokensTyped:", [v15 unsignedIntValue]);
    }
    v26 = v9;
    v16 = [v4 objectForKeyedSubscript:@"numSentencesMungeRejected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesMungeRejected:](v5, "setNumSentencesMungeRejected:", [v16 unsignedIntValue]);
    }
    v24 = v12;
    v25 = v10;
    v17 = [v4 objectForKeyedSubscript:@"numSentencesMungeChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumSentencesMungeChanged:](v5, "setNumSentencesMungeChanged:", [v17 unsignedIntValue]);
    }
    v18 = v11;
    v19 = [v4 objectForKeyedSubscript:@"numTokensEstimatedRejected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensEstimatedRejected:](v5, "setNumTokensEstimatedRejected:", [v19 unsignedIntValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"numTokensEstimatedExamined"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRTranscriptMetadata setNumTokensEstimatedExamined:](v5, "setNumTokensEstimatedExamined:", [v20 unsignedIntValue]);
    }
    v21 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRTranscriptMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRTranscriptMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRTranscriptMetadata *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numDocumentsAccepted](self, "numDocumentsAccepted"));
    [v3 setObject:v7 forKeyedSubscript:@"numDocumentsAccepted"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numDocumentsDictated](self, "numDocumentsDictated"));
  [v3 setObject:v8 forKeyedSubscript:@"numDocumentsDictated"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numDocumentsRejected](self, "numDocumentsRejected"));
  [v3 setObject:v9 forKeyedSubscript:@"numDocumentsRejected"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numDocumentsTyped](self, "numDocumentsTyped"));
  [v3 setObject:v10 forKeyedSubscript:@"numDocumentsTyped"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numSentencesAccepted](self, "numSentencesAccepted"));
  [v3 setObject:v11 forKeyedSubscript:@"numSentencesAccepted"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numSentencesMungeChanged](self, "numSentencesMungeChanged"));
  [v3 setObject:v12 forKeyedSubscript:@"numSentencesMungeChanged"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numSentencesMungeRejected](self, "numSentencesMungeRejected"));
  [v3 setObject:v13 forKeyedSubscript:@"numSentencesMungeRejected"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numSentencesRejected](self, "numSentencesRejected"));
  [v3 setObject:v14 forKeyedSubscript:@"numSentencesRejected"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensAccepted](self, "numTokensAccepted"));
  [v3 setObject:v15 forKeyedSubscript:@"numTokensAccepted"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensDictated](self, "numTokensDictated"));
  [v3 setObject:v16 forKeyedSubscript:@"numTokensDictated"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensEstimatedExamined](self, "numTokensEstimatedExamined"));
  [v3 setObject:v17 forKeyedSubscript:@"numTokensEstimatedExamined"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensEstimatedRejected](self, "numTokensEstimatedRejected"));
  [v3 setObject:v18 forKeyedSubscript:@"numTokensEstimatedRejected"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensOutOfVocabularyAccepted](self, "numTokensOutOfVocabularyAccepted"));
  [v3 setObject:v19 forKeyedSubscript:@"numTokensOutOfVocabularyAccepted"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_15:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRTranscriptMetadata numTokensTyped](self, "numTokensTyped"));
    [v3 setObject:v5 forKeyedSubscript:@"numTokensTyped"];
  }
LABEL_16:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v3 = 2654435761 * self->_numDocumentsRejected;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_numSentencesRejected;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_numDocumentsAccepted;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_numSentencesAccepted;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_numTokensAccepted;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_numTokensOutOfVocabularyAccepted;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_numDocumentsDictated;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_numDocumentsTyped;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_numTokensDictated;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_numTokensTyped;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_numSentencesMungeRejected;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_numSentencesMungeChanged;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_14;
    }
LABEL_28:
    uint64_t v15 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_15;
    }
LABEL_29:
    uint64_t v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_28;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_numTokensEstimatedRejected;
  if ((*(_WORD *)&self->_has & 0x2000) == 0) {
    goto LABEL_29;
  }
LABEL_15:
  uint64_t v16 = 2654435761 * self->_numTokensEstimatedExamined;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  $516878B6B6FDB779A67A404946CFD007 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_58;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numDocumentsRejected = self->_numDocumentsRejected;
    if (numDocumentsRejected != [v4 numDocumentsRejected]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_58;
  }
  if (v8)
  {
    unsigned int numSentencesRejected = self->_numSentencesRejected;
    if (numSentencesRejected != [v4 numSentencesRejected]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_58;
  }
  if (v10)
  {
    unsigned int numDocumentsAccepted = self->_numDocumentsAccepted;
    if (numDocumentsAccepted != [v4 numDocumentsAccepted]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_58;
  }
  if (v12)
  {
    unsigned int numSentencesAccepted = self->_numSentencesAccepted;
    if (numSentencesAccepted != [v4 numSentencesAccepted]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_58;
  }
  if (v14)
  {
    unsigned int numTokensAccepted = self->_numTokensAccepted;
    if (numTokensAccepted != [v4 numTokensAccepted]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_58;
  }
  if (v16)
  {
    unsigned int numTokensOutOfVocabularyAccepted = self->_numTokensOutOfVocabularyAccepted;
    if (numTokensOutOfVocabularyAccepted != [v4 numTokensOutOfVocabularyAccepted]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_58;
  }
  if (v18)
  {
    unsigned int numDocumentsDictated = self->_numDocumentsDictated;
    if (numDocumentsDictated != [v4 numDocumentsDictated]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_58;
  }
  if (v20)
  {
    unsigned int numDocumentsTyped = self->_numDocumentsTyped;
    if (numDocumentsTyped != [v4 numDocumentsTyped]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_58;
  }
  if (v22)
  {
    unsigned int numTokensDictated = self->_numTokensDictated;
    if (numTokensDictated != [v4 numTokensDictated]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_58;
  }
  if (v24)
  {
    unsigned int numTokensTyped = self->_numTokensTyped;
    if (numTokensTyped != [v4 numTokensTyped]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1)) {
    goto LABEL_58;
  }
  if (v26)
  {
    unsigned int numSentencesMungeRejected = self->_numSentencesMungeRejected;
    if (numSentencesMungeRejected != [v4 numSentencesMungeRejected]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1)) {
    goto LABEL_58;
  }
  if (v28)
  {
    unsigned int numSentencesMungeChanged = self->_numSentencesMungeChanged;
    if (numSentencesMungeChanged != [v4 numSentencesMungeChanged]) {
      goto LABEL_58;
    }
    $516878B6B6FDB779A67A404946CFD007 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1)) {
    goto LABEL_58;
  }
  if (v30)
  {
    unsigned int numTokensEstimatedRejected = self->_numTokensEstimatedRejected;
    if (numTokensEstimatedRejected == [v4 numTokensEstimatedRejected])
    {
      $516878B6B6FDB779A67A404946CFD007 has = self->_has;
      unsigned int v6 = v4[32];
      goto LABEL_54;
    }
LABEL_58:
    BOOL v34 = 0;
    goto LABEL_59;
  }
LABEL_54:
  int v32 = (*(unsigned int *)&has >> 13) & 1;
  if (v32 != ((v6 >> 13) & 1)) {
    goto LABEL_58;
  }
  if (v32)
  {
    unsigned int numTokensEstimatedExamined = self->_numTokensEstimatedExamined;
    if (numTokensEstimatedExamined != [v4 numTokensEstimatedExamined]) {
      goto LABEL_58;
    }
  }
  BOOL v34 = 1;
LABEL_59:

  return v34;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
LABEL_15:
  }
    PBDataWriterWriteUint32Field();
LABEL_16:
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRTranscriptMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumTokensEstimatedExamined
{
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (void)setHasNumTokensEstimatedExamined:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasNumTokensEstimatedExamined
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setNumTokensEstimatedExamined:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_unsigned int numTokensEstimatedExamined = a3;
}

- (void)deleteNumTokensEstimatedRejected
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasNumTokensEstimatedRejected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasNumTokensEstimatedRejected
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setNumTokensEstimatedRejected:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_unsigned int numTokensEstimatedRejected = a3;
}

- (void)deleteNumSentencesMungeChanged
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasNumSentencesMungeChanged:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasNumSentencesMungeChanged
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setNumSentencesMungeChanged:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unsigned int numSentencesMungeChanged = a3;
}

- (void)deleteNumSentencesMungeRejected
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasNumSentencesMungeRejected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasNumSentencesMungeRejected
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumSentencesMungeRejected:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unsigned int numSentencesMungeRejected = a3;
}

- (void)deleteNumTokensTyped
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasNumTokensTyped:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNumTokensTyped
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumTokensTyped:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unsigned int numTokensTyped = a3;
}

- (void)deleteNumTokensDictated
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasNumTokensDictated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumTokensDictated
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumTokensDictated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int numTokensDictated = a3;
}

- (void)deleteNumDocumentsTyped
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasNumDocumentsTyped:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumDocumentsTyped
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumDocumentsTyped:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int numDocumentsTyped = a3;
}

- (void)deleteNumDocumentsDictated
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasNumDocumentsDictated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumDocumentsDictated
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumDocumentsDictated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int numDocumentsDictated = a3;
}

- (void)deleteNumTokensOutOfVocabularyAccepted
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasNumTokensOutOfVocabularyAccepted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumTokensOutOfVocabularyAccepted
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumTokensOutOfVocabularyAccepted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int numTokensOutOfVocabularyAccepted = a3;
}

- (void)deleteNumTokensAccepted
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasNumTokensAccepted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumTokensAccepted
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumTokensAccepted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int numTokensAccepted = a3;
}

- (void)deleteNumSentencesAccepted
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasNumSentencesAccepted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumSentencesAccepted
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumSentencesAccepted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int numSentencesAccepted = a3;
}

- (void)deleteNumDocumentsAccepted
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasNumDocumentsAccepted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumDocumentsAccepted
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumDocumentsAccepted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int numDocumentsAccepted = a3;
}

- (void)deleteNumSentencesRejected
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasNumSentencesRejected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasNumSentencesRejected
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumSentencesRejected:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int numSentencesRejected = a3;
}

- (void)deleteNumDocumentsRejected
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasNumDocumentsRejected:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumDocumentsRejected
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumDocumentsRejected:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int numDocumentsRejected = a3;
}

@end