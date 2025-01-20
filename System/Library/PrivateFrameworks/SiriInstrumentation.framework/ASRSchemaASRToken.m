@interface ASRSchemaASRToken
- (ASRSchemaASREntityMetadata)entityMetadata;
- (ASRSchemaASRToken)initWithDictionary:(id)a3;
- (ASRSchemaASRToken)initWithJSON:(id)a3;
- (BOOL)appendSpaceAfter;
- (BOOL)hasAcousticCost;
- (BOOL)hasAppendSpaceAfter;
- (BOOL)hasConfidence;
- (BOOL)hasEndTimeInNs;
- (BOOL)hasEntityMetadata;
- (BOOL)hasGraphCost;
- (BOOL)hasIsAutoPunctuation;
- (BOOL)hasIsModifiedByAutoPunctuation;
- (BOOL)hasLinkIndex;
- (BOOL)hasPunctuationText;
- (BOOL)hasSilenceStartTimeInNs;
- (BOOL)hasStartTimeInNs;
- (BOOL)isAutoPunctuation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isModifiedByAutoPunctuation;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)punctuationText;
- (double)acousticCost;
- (double)graphCost;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)confidence;
- (unint64_t)endTimeInNs;
- (unint64_t)hash;
- (unint64_t)silenceStartTimeInNs;
- (unint64_t)startTimeInNs;
- (unsigned)linkIndex;
- (void)deleteAcousticCost;
- (void)deleteAppendSpaceAfter;
- (void)deleteConfidence;
- (void)deleteEndTimeInNs;
- (void)deleteEntityMetadata;
- (void)deleteGraphCost;
- (void)deleteIsAutoPunctuation;
- (void)deleteIsModifiedByAutoPunctuation;
- (void)deleteLinkIndex;
- (void)deletePunctuationText;
- (void)deleteSilenceStartTimeInNs;
- (void)deleteStartTimeInNs;
- (void)setAcousticCost:(double)a3;
- (void)setAppendSpaceAfter:(BOOL)a3;
- (void)setConfidence:(int)a3;
- (void)setEndTimeInNs:(unint64_t)a3;
- (void)setEntityMetadata:(id)a3;
- (void)setGraphCost:(double)a3;
- (void)setHasAcousticCost:(BOOL)a3;
- (void)setHasAppendSpaceAfter:(BOOL)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasEndTimeInNs:(BOOL)a3;
- (void)setHasEntityMetadata:(BOOL)a3;
- (void)setHasGraphCost:(BOOL)a3;
- (void)setHasIsAutoPunctuation:(BOOL)a3;
- (void)setHasIsModifiedByAutoPunctuation:(BOOL)a3;
- (void)setHasLinkIndex:(BOOL)a3;
- (void)setHasPunctuationText:(BOOL)a3;
- (void)setHasSilenceStartTimeInNs:(BOOL)a3;
- (void)setHasStartTimeInNs:(BOOL)a3;
- (void)setIsAutoPunctuation:(BOOL)a3;
- (void)setIsModifiedByAutoPunctuation:(BOOL)a3;
- (void)setLinkIndex:(unsigned int)a3;
- (void)setPunctuationText:(id)a3;
- (void)setSilenceStartTimeInNs:(unint64_t)a3;
- (void)setStartTimeInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRToken

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASRSchemaASRToken;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ASRSchemaASRToken *)self entityMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ASRSchemaASRToken *)self deleteEntityMetadata];
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
  objc_storeStrong((id *)&self->_entityMetadata, 0);
  objc_storeStrong((id *)&self->_punctuationText, 0);
}

- (void)setHasEntityMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasPunctuationText:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setEntityMetadata:(id)a3
{
}

- (ASRSchemaASREntityMetadata)entityMetadata
{
  return self->_entityMetadata;
}

- (double)acousticCost
{
  return self->_acousticCost;
}

- (double)graphCost
{
  return self->_graphCost;
}

- (BOOL)isModifiedByAutoPunctuation
{
  return self->_isModifiedByAutoPunctuation;
}

- (BOOL)isAutoPunctuation
{
  return self->_isAutoPunctuation;
}

- (void)setPunctuationText:(id)a3
{
}

- (NSString)punctuationText
{
  return self->_punctuationText;
}

- (int)confidence
{
  return self->_confidence;
}

- (unint64_t)silenceStartTimeInNs
{
  return self->_silenceStartTimeInNs;
}

- (BOOL)appendSpaceAfter
{
  return self->_appendSpaceAfter;
}

- (unint64_t)endTimeInNs
{
  return self->_endTimeInNs;
}

- (unint64_t)startTimeInNs
{
  return self->_startTimeInNs;
}

- (unsigned)linkIndex
{
  return self->_linkIndex;
}

- (ASRSchemaASRToken)initWithDictionary:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ASRSchemaASRToken;
  v5 = [(ASRSchemaASRToken *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkIndex"];
    objc_opt_class();
    v32 = v6;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRToken setLinkIndex:](v5, "setLinkIndex:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"startTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRToken setStartTimeInNs:](v5, "setStartTimeInNs:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"endTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRToken setEndTimeInNs:](v5, "setEndTimeInNs:", [v8 unsignedLongLongValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"appendSpaceAfter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRToken setAppendSpaceAfter:](v5, "setAppendSpaceAfter:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"silenceStartTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRToken setSilenceStartTimeInNs:](v5, "setSilenceStartTimeInNs:", [v10 unsignedLongLongValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"confidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRToken setConfidence:](v5, "setConfidence:", [v11 intValue]);
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"punctuationText"];
    objc_opt_class();
    v34 = (void *)v12;
    if (objc_opt_isKindOfClass())
    {
      v13 = v5;
      v14 = v11;
      v15 = v10;
      v16 = (void *)[v34 copy];
      [(ASRSchemaASRToken *)v13 setPunctuationText:v16];

      v10 = v15;
      v11 = v14;
      v5 = v13;
    }
    v17 = [v4 objectForKeyedSubscript:@"isAutoPunctuation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRToken setIsAutoPunctuation:](v5, "setIsAutoPunctuation:", [v17 BOOLValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"isModifiedByAutoPunctuation"];
    objc_opt_class();
    v33 = v18;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRToken setIsModifiedByAutoPunctuation:](v5, "setIsModifiedByAutoPunctuation:", [v18 BOOLValue]);
    }
    v31 = v17;
    v19 = [v4 objectForKeyedSubscript:@"graphCost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v19 doubleValue];
      -[ASRSchemaASRToken setGraphCost:](v5, "setGraphCost:");
    }
    v20 = [v4 objectForKeyedSubscript:@"acousticCost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 doubleValue];
      -[ASRSchemaASRToken setAcousticCost:](v5, "setAcousticCost:");
    }
    v21 = [v4 objectForKeyedSubscript:@"entityMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = v11;
      v22 = v10;
      v23 = v9;
      v24 = v8;
      v25 = v7;
      v26 = v19;
      v27 = [[ASRSchemaASREntityMetadata alloc] initWithDictionary:v21];
      [(ASRSchemaASRToken *)v5 setEntityMetadata:v27];

      v19 = v26;
      v7 = v25;
      v8 = v24;
      objc_super v9 = v23;
      v10 = v22;
      v11 = v30;
    }
    v28 = v5;
  }
  return v5;
}

- (ASRSchemaASRToken)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRToken *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRToken *)self dictionaryRepresentation];
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
  if ((has & 0x200) != 0)
  {
    v8 = NSNumber;
    [(ASRSchemaASRToken *)self acousticCost];
    objc_super v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"acousticCost"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRToken appendSpaceAfter](self, "appendSpaceAfter"));
  [v3 setObject:v10 forKeyedSubscript:@"appendSpaceAfter"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[ASRSchemaASRToken confidence](self, "confidence"));
  [v3 setObject:v11 forKeyedSubscript:@"confidence"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRToken endTimeInNs](self, "endTimeInNs"));
    [v3 setObject:v5 forKeyedSubscript:@"endTimeInNs"];
  }
LABEL_6:
  if (self->_entityMetadata)
  {
    v6 = [(ASRSchemaASRToken *)self entityMetadata];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"entityMetadata"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"entityMetadata"];
    }
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x100) != 0)
  {
    v21 = NSNumber;
    [(ASRSchemaASRToken *)self graphCost];
    v22 = objc_msgSend(v21, "numberWithDouble:");
    [v3 setObject:v22 forKeyedSubscript:@"graphCost"];

    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x40) == 0)
    {
LABEL_17:
      if ((v13 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_31;
    }
  }
  else if ((v13 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRToken isAutoPunctuation](self, "isAutoPunctuation"));
  [v3 setObject:v23 forKeyedSubscript:@"isAutoPunctuation"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_18:
    if ((v13 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_31:
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRToken isModifiedByAutoPunctuation](self, "isModifiedByAutoPunctuation"));
  [v3 setObject:v24 forKeyedSubscript:@"isModifiedByAutoPunctuation"];

  if (*(_WORD *)&self->_has)
  {
LABEL_19:
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ASRSchemaASRToken linkIndex](self, "linkIndex"));
    [v3 setObject:v14 forKeyedSubscript:@"linkIndex"];
  }
LABEL_20:
  if (self->_punctuationText)
  {
    v15 = [(ASRSchemaASRToken *)self punctuationText];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"punctuationText"];
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x10) != 0)
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRToken silenceStartTimeInNs](self, "silenceStartTimeInNs"));
    [v3 setObject:v18 forKeyedSubscript:@"silenceStartTimeInNs"];

    __int16 v17 = (__int16)self->_has;
  }
  if ((v17 & 2) != 0)
  {
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRToken startTimeInNs](self, "startTimeInNs"));
    [v3 setObject:v19 forKeyedSubscript:@"startTimeInNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v24 = 2654435761 * self->_linkIndex;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v23 = 2654435761u * self->_startTimeInNs;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v23 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    unint64_t v22 = 2654435761u * self->_endTimeInNs;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  unint64_t v22 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_appendSpaceAfter;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    unint64_t v5 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  unint64_t v5 = 2654435761u * self->_silenceStartTimeInNs;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_confidence;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
LABEL_14:
  NSUInteger v7 = [(NSString *)self->_punctuationText hash];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x40) == 0)
  {
    uint64_t v9 = 0;
    if ((v8 & 0x80) != 0) {
      goto LABEL_16;
    }
LABEL_22:
    uint64_t v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_17;
    }
LABEL_23:
    unint64_t v15 = 0;
    goto LABEL_26;
  }
  uint64_t v9 = 2654435761 * self->_isAutoPunctuation;
  if ((v8 & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_16:
  uint64_t v10 = 2654435761 * self->_isModifiedByAutoPunctuation;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_23;
  }
LABEL_17:
  double graphCost = self->_graphCost;
  double v12 = -graphCost;
  if (graphCost >= 0.0) {
    double v12 = self->_graphCost;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_26:
  if ((v8 & 0x200) != 0)
  {
    double acousticCost = self->_acousticCost;
    double v18 = -acousticCost;
    if (acousticCost >= 0.0) {
      double v18 = self->_acousticCost;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  return v23 ^ v24 ^ v22 ^ v4 ^ v5 ^ v6 ^ v9 ^ v10 ^ v15 ^ v16 ^ v7 ^ [(ASRSchemaASREntityMetadata *)self->_entityMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  $0D13DF4C2F2FBFA317151103AD3C5AF0 has = self->_has;
  unsigned int v6 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_50;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int linkIndex = self->_linkIndex;
    if (linkIndex != [v4 linkIndex]) {
      goto LABEL_50;
    }
    $0D13DF4C2F2FBFA317151103AD3C5AF0 has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_50;
  }
  if (v8)
  {
    unint64_t startTimeInNs = self->_startTimeInNs;
    if (startTimeInNs != [v4 startTimeInNs]) {
      goto LABEL_50;
    }
    $0D13DF4C2F2FBFA317151103AD3C5AF0 has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_50;
  }
  if (v10)
  {
    unint64_t endTimeInNs = self->_endTimeInNs;
    if (endTimeInNs != [v4 endTimeInNs]) {
      goto LABEL_50;
    }
    $0D13DF4C2F2FBFA317151103AD3C5AF0 has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_50;
  }
  if (v12)
  {
    int appendSpaceAfter = self->_appendSpaceAfter;
    if (appendSpaceAfter != [v4 appendSpaceAfter]) {
      goto LABEL_50;
    }
    $0D13DF4C2F2FBFA317151103AD3C5AF0 has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_50;
  }
  if (v14)
  {
    unint64_t silenceStartTimeInNs = self->_silenceStartTimeInNs;
    if (silenceStartTimeInNs != [v4 silenceStartTimeInNs]) {
      goto LABEL_50;
    }
    $0D13DF4C2F2FBFA317151103AD3C5AF0 has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_50;
  }
  if (v16)
  {
    int confidence = self->_confidence;
    if (confidence != [v4 confidence]) {
      goto LABEL_50;
    }
  }
  double v18 = [(ASRSchemaASRToken *)self punctuationText];
  long double v19 = [v4 punctuationText];
  if ((v18 == 0) == (v19 != 0)) {
    goto LABEL_49;
  }
  uint64_t v20 = [(ASRSchemaASRToken *)self punctuationText];
  if (v20)
  {
    v21 = (void *)v20;
    unint64_t v22 = [(ASRSchemaASRToken *)self punctuationText];
    unint64_t v23 = [v4 punctuationText];
    int v24 = [v22 isEqual:v23];

    if (!v24) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  $0D13DF4C2F2FBFA317151103AD3C5AF0 v25 = self->_has;
  int v26 = (*(unsigned int *)&v25 >> 6) & 1;
  unsigned int v27 = v4[48];
  if (v26 != ((v27 >> 6) & 1)) {
    goto LABEL_50;
  }
  if (v26)
  {
    int isAutoPunctuation = self->_isAutoPunctuation;
    if (isAutoPunctuation != [v4 isAutoPunctuation]) {
      goto LABEL_50;
    }
    $0D13DF4C2F2FBFA317151103AD3C5AF0 v25 = self->_has;
    unsigned int v27 = v4[48];
  }
  int v29 = (*(unsigned int *)&v25 >> 7) & 1;
  if (v29 != ((v27 >> 7) & 1)) {
    goto LABEL_50;
  }
  if (v29)
  {
    int isModifiedByAutoPunctuation = self->_isModifiedByAutoPunctuation;
    if (isModifiedByAutoPunctuation != [v4 isModifiedByAutoPunctuation]) {
      goto LABEL_50;
    }
    $0D13DF4C2F2FBFA317151103AD3C5AF0 v25 = self->_has;
    unsigned int v27 = v4[48];
  }
  int v31 = (*(unsigned int *)&v25 >> 8) & 1;
  if (v31 != ((v27 >> 8) & 1)) {
    goto LABEL_50;
  }
  if (v31)
  {
    double graphCost = self->_graphCost;
    [v4 graphCost];
    if (graphCost != v33) {
      goto LABEL_50;
    }
    $0D13DF4C2F2FBFA317151103AD3C5AF0 v25 = self->_has;
    unsigned int v27 = v4[48];
  }
  int v34 = (*(unsigned int *)&v25 >> 9) & 1;
  if (v34 != ((v27 >> 9) & 1)) {
    goto LABEL_50;
  }
  if (v34)
  {
    double acousticCost = self->_acousticCost;
    [v4 acousticCost];
    if (acousticCost != v36) {
      goto LABEL_50;
    }
  }
  double v18 = [(ASRSchemaASRToken *)self entityMetadata];
  long double v19 = [v4 entityMetadata];
  if ((v18 == 0) == (v19 != 0))
  {
LABEL_49:

    goto LABEL_50;
  }
  uint64_t v37 = [(ASRSchemaASRToken *)self entityMetadata];
  if (!v37)
  {

LABEL_53:
    BOOL v42 = 1;
    goto LABEL_51;
  }
  v38 = (void *)v37;
  v39 = [(ASRSchemaASRToken *)self entityMetadata];
  v40 = [v4 entityMetadata];
  char v41 = [v39 isEqual:v40];

  if (v41) {
    goto LABEL_53;
  }
LABEL_50:
  BOOL v42 = 0;
LABEL_51:

  return v42;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
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
      goto LABEL_22;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
  unint64_t v5 = [(ASRSchemaASRToken *)self punctuationText];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_12:
      if ((v6 & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_28;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_13:
    if ((v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_14:
  }
    PBDataWriterWriteDoubleField();
LABEL_15:
  NSUInteger v7 = [(ASRSchemaASRToken *)self entityMetadata];

  int v8 = v10;
  if (v7)
  {
    uint64_t v9 = [(ASRSchemaASRToken *)self entityMetadata];
    PBDataWriterWriteSubmessage();

    int v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRTokenReadFrom(self, (uint64_t)a3);
}

- (void)deleteEntityMetadata
{
}

- (BOOL)hasEntityMetadata
{
  return self->_entityMetadata != 0;
}

- (void)deleteAcousticCost
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasAcousticCost:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasAcousticCost
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAcousticCost:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_double acousticCost = a3;
}

- (void)deleteGraphCost
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasGraphCost:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasGraphCost
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setGraphCost:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_double graphCost = a3;
}

- (void)deleteIsModifiedByAutoPunctuation
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasIsModifiedByAutoPunctuation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsModifiedByAutoPunctuation
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsModifiedByAutoPunctuation:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int isModifiedByAutoPunctuation = a3;
}

- (void)deleteIsAutoPunctuation
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasIsAutoPunctuation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsAutoPunctuation
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsAutoPunctuation:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int isAutoPunctuation = a3;
}

- (void)deletePunctuationText
{
}

- (BOOL)hasPunctuationText
{
  return self->_punctuationText != 0;
}

- (void)deleteConfidence
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasConfidence
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setConfidence:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int confidence = a3;
}

- (void)deleteSilenceStartTimeInNs
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasSilenceStartTimeInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSilenceStartTimeInNs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSilenceStartTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unint64_t silenceStartTimeInNs = a3;
}

- (void)deleteAppendSpaceAfter
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasAppendSpaceAfter:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAppendSpaceAfter
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAppendSpaceAfter:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int appendSpaceAfter = a3;
}

- (void)deleteEndTimeInNs
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasEndTimeInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEndTimeInNs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setEndTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unint64_t endTimeInNs = a3;
}

- (void)deleteStartTimeInNs
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasStartTimeInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasStartTimeInNs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setStartTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unint64_t startTimeInNs = a3;
}

- (void)deleteLinkIndex
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasLinkIndex:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLinkIndex
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLinkIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int linkIndex = a3;
}

@end