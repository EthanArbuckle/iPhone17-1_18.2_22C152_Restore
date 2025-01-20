@interface RGSiriSchemaRGRequestEnded
- (BOOL)hasCharacterCount;
- (BOOL)hasFallbackReason;
- (BOOL)hasLinkId;
- (BOOL)hasResponseSource;
- (BOOL)hasTranscriptEventId;
- (BOOL)hasWordCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RGSiriSchemaRGRequestEnded)initWithDictionary:(id)a3;
- (RGSiriSchemaRGRequestEnded)initWithJSON:(id)a3;
- (SISchemaUUID)linkId;
- (SISchemaUUID)transcriptEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)fallbackReason;
- (int)responseSource;
- (unint64_t)hash;
- (unsigned)characterCount;
- (unsigned)wordCount;
- (void)deleteCharacterCount;
- (void)deleteFallbackReason;
- (void)deleteLinkId;
- (void)deleteResponseSource;
- (void)deleteTranscriptEventId;
- (void)deleteWordCount;
- (void)setCharacterCount:(unsigned int)a3;
- (void)setFallbackReason:(int)a3;
- (void)setHasCharacterCount:(BOOL)a3;
- (void)setHasFallbackReason:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasResponseSource:(BOOL)a3;
- (void)setHasTranscriptEventId:(BOOL)a3;
- (void)setHasWordCount:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setResponseSource:(int)a3;
- (void)setTranscriptEventId:(id)a3;
- (void)setWordCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RGSiriSchemaRGRequestEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RGSiriSchemaRGRequestEnded;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(RGSiriSchemaRGRequestEnded *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(RGSiriSchemaRGRequestEnded *)self deleteLinkId];
  }
  v9 = [(RGSiriSchemaRGRequestEnded *)self transcriptEventId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(RGSiriSchemaRGRequestEnded *)self deleteTranscriptEventId];
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
  objc_storeStrong((id *)&self->_transcriptEventId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasTranscriptEventId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setTranscriptEventId:(id)a3
{
}

- (SISchemaUUID)transcriptEventId
{
  return self->_transcriptEventId;
}

- (int)fallbackReason
{
  return self->_fallbackReason;
}

- (unsigned)wordCount
{
  return self->_wordCount;
}

- (unsigned)characterCount
{
  return self->_characterCount;
}

- (int)responseSource
{
  return self->_responseSource;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (RGSiriSchemaRGRequestEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RGSiriSchemaRGRequestEnded;
  v5 = [(RGSiriSchemaRGRequestEnded *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(RGSiriSchemaRGRequestEnded *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"responseSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RGSiriSchemaRGRequestEnded setResponseSource:](v5, "setResponseSource:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"characterCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RGSiriSchemaRGRequestEnded setCharacterCount:](v5, "setCharacterCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"wordCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RGSiriSchemaRGRequestEnded setWordCount:](v5, "setWordCount:", [v10 unsignedIntValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"fallbackReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RGSiriSchemaRGRequestEnded setFallbackReason:](v5, "setFallbackReason:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"transcriptEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(RGSiriSchemaRGRequestEnded *)v5 setTranscriptEventId:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (RGSiriSchemaRGRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RGSiriSchemaRGRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RGSiriSchemaRGRequestEnded *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[RGSiriSchemaRGRequestEnded characterCount](self, "characterCount"));
    [v3 setObject:v5 forKeyedSubscript:@"characterCount"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    unsigned int v6 = [(RGSiriSchemaRGRequestEnded *)self fallbackReason] - 1;
    if (v6 > 9) {
      uint64_t v7 = @"RGFALLBACKREASON_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBF0E8[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"fallbackReason"];
  }
  if (self->_linkId)
  {
    int v8 = [(RGSiriSchemaRGRequestEnded *)self linkId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"linkId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v11 = [(RGSiriSchemaRGRequestEnded *)self responseSource] - 1;
    if (v11 > 7) {
      v12 = @"RGRESPONSESOURCE_UNKNOWN";
    }
    else {
      v12 = off_1E5EBF138[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"responseSource"];
  }
  if (self->_transcriptEventId)
  {
    objc_super v13 = [(RGSiriSchemaRGRequestEnded *)self transcriptEventId];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"transcriptEventId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"transcriptEventId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    objc_super v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[RGSiriSchemaRGRequestEnded wordCount](self, "wordCount"));
    [v3 setObject:v16 forKeyedSubscript:@"wordCount"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_responseSource;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_characterCount;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(SISchemaUUID *)self->_transcriptEventId hash];
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_wordCount;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_fallbackReason;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(SISchemaUUID *)self->_transcriptEventId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(RGSiriSchemaRGRequestEnded *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(RGSiriSchemaRGRequestEnded *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(RGSiriSchemaRGRequestEnded *)self linkId];
    v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  $D49F5C6C553453FE73735A0F5CD3A9C4 has = self->_has;
  unsigned int v13 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&has)
  {
    int responseSource = self->_responseSource;
    if (responseSource != [v4 responseSource]) {
      goto LABEL_27;
    }
    $D49F5C6C553453FE73735A0F5CD3A9C4 has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_27;
  }
  if (v15)
  {
    unsigned int characterCount = self->_characterCount;
    if (characterCount != [v4 characterCount]) {
      goto LABEL_27;
    }
    $D49F5C6C553453FE73735A0F5CD3A9C4 has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v17)
  {
    unsigned int wordCount = self->_wordCount;
    if (wordCount != [v4 wordCount]) {
      goto LABEL_27;
    }
    $D49F5C6C553453FE73735A0F5CD3A9C4 has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1)) {
    goto LABEL_27;
  }
  if (v19)
  {
    int fallbackReason = self->_fallbackReason;
    if (fallbackReason != [v4 fallbackReason]) {
      goto LABEL_27;
    }
  }
  uint64_t v5 = [(RGSiriSchemaRGRequestEnded *)self transcriptEventId];
  uint64_t v6 = [v4 transcriptEventId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v21 = [(RGSiriSchemaRGRequestEnded *)self transcriptEventId];
  if (!v21)
  {

LABEL_30:
    BOOL v26 = 1;
    goto LABEL_28;
  }
  v22 = (void *)v21;
  v23 = [(RGSiriSchemaRGRequestEnded *)self transcriptEventId];
  v24 = [v4 transcriptEventId];
  char v25 = [v23 isEqual:v24];

  if (v25) {
    goto LABEL_30;
  }
LABEL_27:
  BOOL v26 = 0;
LABEL_28:

  return v26;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(RGSiriSchemaRGRequestEnded *)self linkId];

  if (v4)
  {
    uint64_t v5 = [(RGSiriSchemaRGRequestEnded *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
  uint64_t v7 = [(RGSiriSchemaRGRequestEnded *)self transcriptEventId];

  int v8 = v10;
  if (v7)
  {
    v9 = [(RGSiriSchemaRGRequestEnded *)self transcriptEventId];
    PBDataWriterWriteSubmessage();

    int v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteTranscriptEventId
{
}

- (BOOL)hasTranscriptEventId
{
  return self->_transcriptEventId != 0;
}

- (void)deleteFallbackReason
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasFallbackReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFallbackReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFallbackReason:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int fallbackReason = a3;
}

- (void)deleteWordCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasWordCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWordCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWordCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int wordCount = a3;
}

- (void)deleteCharacterCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCharacterCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCharacterCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCharacterCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int characterCount = a3;
}

- (void)deleteResponseSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResponseSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResponseSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int responseSource = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end