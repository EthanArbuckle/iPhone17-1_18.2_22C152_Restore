@interface NLXSchemaCDMDelegatedUserDialogAct
- (BOOL)hasAsrHypothesisIndex;
- (BOOL)hasContextMatcherSpanCount;
- (BOOL)hasExternalParserId;
- (BOOL)hasLinkId;
- (BOOL)hasMentionResolverSpanCount;
- (BOOL)hasRewriteType;
- (BOOL)hasSiriVocabularySpanCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMDelegatedUserDialogAct)initWithDictionary:(id)a3;
- (NLXSchemaCDMDelegatedUserDialogAct)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)externalParserId;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)rewriteType;
- (unint64_t)hash;
- (unsigned)asrHypothesisIndex;
- (unsigned)contextMatcherSpanCount;
- (unsigned)mentionResolverSpanCount;
- (unsigned)siriVocabularySpanCount;
- (void)deleteAsrHypothesisIndex;
- (void)deleteContextMatcherSpanCount;
- (void)deleteExternalParserId;
- (void)deleteLinkId;
- (void)deleteMentionResolverSpanCount;
- (void)deleteRewriteType;
- (void)deleteSiriVocabularySpanCount;
- (void)setAsrHypothesisIndex:(unsigned int)a3;
- (void)setContextMatcherSpanCount:(unsigned int)a3;
- (void)setExternalParserId:(id)a3;
- (void)setHasAsrHypothesisIndex:(BOOL)a3;
- (void)setHasContextMatcherSpanCount:(BOOL)a3;
- (void)setHasExternalParserId:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasMentionResolverSpanCount:(BOOL)a3;
- (void)setHasRewriteType:(BOOL)a3;
- (void)setHasSiriVocabularySpanCount:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setMentionResolverSpanCount:(unsigned int)a3;
- (void)setRewriteType:(int)a3;
- (void)setSiriVocabularySpanCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMDelegatedUserDialogAct

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaCDMDelegatedUserDialogAct;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMDelegatedUserDialogAct *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NLXSchemaCDMDelegatedUserDialogAct *)self deleteLinkId];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalParserId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasExternalParserId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)contextMatcherSpanCount
{
  return self->_contextMatcherSpanCount;
}

- (int)rewriteType
{
  return self->_rewriteType;
}

- (unsigned)mentionResolverSpanCount
{
  return self->_mentionResolverSpanCount;
}

- (unsigned)siriVocabularySpanCount
{
  return self->_siriVocabularySpanCount;
}

- (void)setExternalParserId:(id)a3
{
}

- (NSString)externalParserId
{
  return self->_externalParserId;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (NLXSchemaCDMDelegatedUserDialogAct)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NLXSchemaCDMDelegatedUserDialogAct;
  v5 = [(NLXSchemaCDMDelegatedUserDialogAct *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"asrHypothesisIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMDelegatedUserDialogAct setAsrHypothesisIndex:](v5, "setAsrHypothesisIndex:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[SISchemaUUID alloc] initWithDictionary:v7];
      [(NLXSchemaCDMDelegatedUserDialogAct *)v5 setLinkId:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"externalParserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(NLXSchemaCDMDelegatedUserDialogAct *)v5 setExternalParserId:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"siriVocabularySpanCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMDelegatedUserDialogAct setSiriVocabularySpanCount:](v5, "setSiriVocabularySpanCount:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"mentionResolverSpanCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMDelegatedUserDialogAct setMentionResolverSpanCount:](v5, "setMentionResolverSpanCount:", [v12 unsignedIntValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"rewriteType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMDelegatedUserDialogAct setRewriteType:](v5, "setRewriteType:", [v13 intValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"contextMatcherSpanCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMDelegatedUserDialogAct setContextMatcherSpanCount:](v5, "setContextMatcherSpanCount:", [v14 unsignedIntValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (NLXSchemaCDMDelegatedUserDialogAct)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMDelegatedUserDialogAct *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMDelegatedUserDialogAct *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMDelegatedUserDialogAct asrHypothesisIndex](self, "asrHypothesisIndex"));
    [v3 setObject:v5 forKeyedSubscript:@"asrHypothesisIndex"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMDelegatedUserDialogAct contextMatcherSpanCount](self, "contextMatcherSpanCount"));
    [v3 setObject:v6 forKeyedSubscript:@"contextMatcherSpanCount"];
  }
  if (self->_externalParserId)
  {
    uint64_t v7 = [(NLXSchemaCDMDelegatedUserDialogAct *)self externalParserId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"externalParserId"];
  }
  if (self->_linkId)
  {
    objc_super v9 = [(NLXSchemaCDMDelegatedUserDialogAct *)self linkId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"linkId"];
    }
  }
  char v12 = (char)self->_has;
  if ((v12 & 4) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMDelegatedUserDialogAct mentionResolverSpanCount](self, "mentionResolverSpanCount"));
    [v3 setObject:v15 forKeyedSubscript:@"mentionResolverSpanCount"];

    char v12 = (char)self->_has;
    if ((v12 & 8) == 0)
    {
LABEL_14:
      if ((v12 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  unsigned int v16 = [(NLXSchemaCDMDelegatedUserDialogAct *)self rewriteType] - 1;
  if (v16 > 3) {
    objc_super v17 = @"CDMREWRITETYPE_UNKNOWN";
  }
  else {
    objc_super v17 = off_1E5EB2C80[v16];
  }
  [v3 setObject:v17 forKeyedSubscript:@"rewriteType"];
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_15:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMDelegatedUserDialogAct siriVocabularySpanCount](self, "siriVocabularySpanCount"));
  [v3 setObject:v13 forKeyedSubscript:@"siriVocabularySpanCount"];

LABEL_16:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_asrHypothesisIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SISchemaUUID *)self->_linkId hash];
  NSUInteger v5 = [(NSString *)self->_externalParserId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_siriVocabularySpanCount;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_mentionResolverSpanCount;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_rewriteType;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_contextMatcherSpanCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int asrHypothesisIndex = self->_asrHypothesisIndex;
    if (asrHypothesisIndex != [v4 asrHypothesisIndex]) {
      goto LABEL_15;
    }
  }
  uint64_t v6 = [(NLXSchemaCDMDelegatedUserDialogAct *)self linkId];
  uint64_t v7 = [v4 linkId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(NLXSchemaCDMDelegatedUserDialogAct *)self linkId];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [(NLXSchemaCDMDelegatedUserDialogAct *)self linkId];
    v11 = [v4 linkId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v6 = [(NLXSchemaCDMDelegatedUserDialogAct *)self externalParserId];
  uint64_t v7 = [v4 externalParserId];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = [(NLXSchemaCDMDelegatedUserDialogAct *)self externalParserId];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(NLXSchemaCDMDelegatedUserDialogAct *)self externalParserId];
    unsigned int v16 = [v4 externalParserId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  $D7DD38554503B5E0302E971278F53D02 has = self->_has;
  int v21 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v22 = v4[48];
  if (v21 == ((v22 >> 1) & 1))
  {
    if (v21)
    {
      unsigned int siriVocabularySpanCount = self->_siriVocabularySpanCount;
      if (siriVocabularySpanCount != [v4 siriVocabularySpanCount]) {
        goto LABEL_15;
      }
      $D7DD38554503B5E0302E971278F53D02 has = self->_has;
      unsigned int v22 = v4[48];
    }
    int v24 = (*(unsigned int *)&has >> 2) & 1;
    if (v24 == ((v22 >> 2) & 1))
    {
      if (v24)
      {
        unsigned int mentionResolverSpanCount = self->_mentionResolverSpanCount;
        if (mentionResolverSpanCount != [v4 mentionResolverSpanCount]) {
          goto LABEL_15;
        }
        $D7DD38554503B5E0302E971278F53D02 has = self->_has;
        unsigned int v22 = v4[48];
      }
      int v26 = (*(unsigned int *)&has >> 3) & 1;
      if (v26 == ((v22 >> 3) & 1))
      {
        if (v26)
        {
          int rewriteType = self->_rewriteType;
          if (rewriteType != [v4 rewriteType]) {
            goto LABEL_15;
          }
          $D7DD38554503B5E0302E971278F53D02 has = self->_has;
          unsigned int v22 = v4[48];
        }
        int v28 = (*(unsigned int *)&has >> 4) & 1;
        if (v28 == ((v22 >> 4) & 1))
        {
          if (!v28
            || (unsigned int contextMatcherSpanCount = self->_contextMatcherSpanCount,
                contextMatcherSpanCount == [v4 contextMatcherSpanCount]))
          {
            BOOL v18 = 1;
            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  unint64_t v4 = [(NLXSchemaCDMDelegatedUserDialogAct *)self linkId];

  if (v4)
  {
    NSUInteger v5 = [(NLXSchemaCDMDelegatedUserDialogAct *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(NLXSchemaCDMDelegatedUserDialogAct *)self externalParserId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMDelegatedUserDialogActReadFrom(self, (uint64_t)a3);
}

- (void)deleteContextMatcherSpanCount
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasContextMatcherSpanCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasContextMatcherSpanCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setContextMatcherSpanCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int contextMatcherSpanCount = a3;
}

- (void)deleteRewriteType
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasRewriteType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRewriteType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRewriteType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int rewriteType = a3;
}

- (void)deleteMentionResolverSpanCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMentionResolverSpanCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMentionResolverSpanCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMentionResolverSpanCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int mentionResolverSpanCount = a3;
}

- (void)deleteSiriVocabularySpanCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSiriVocabularySpanCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSiriVocabularySpanCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSiriVocabularySpanCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int siriVocabularySpanCount = a3;
}

- (void)deleteExternalParserId
{
}

- (BOOL)hasExternalParserId
{
  return self->_externalParserId != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteAsrHypothesisIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAsrHypothesisIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAsrHypothesisIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int asrHypothesisIndex = a3;
}

@end