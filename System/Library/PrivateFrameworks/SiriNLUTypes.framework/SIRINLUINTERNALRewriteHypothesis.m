@interface SIRINLUINTERNALRewriteHypothesis
- (BOOL)hasAsrId;
- (BOOL)hasConfidence;
- (BOOL)hasRewriteType;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)utterance;
- (SIRINLUEXTERNALUUID)asrId;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rewriteTypeAsString:(int)a3;
- (int)StringAsRewriteType:(id)a3;
- (int)rewriteType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrId:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasRewriteType:(BOOL)a3;
- (void)setRewriteType:(int)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALRewriteHypothesis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setAsrId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  asrId = self->_asrId;
  uint64_t v6 = *((void *)v4 + 2);
  id v8 = v4;
  if (asrId)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALRewriteHypothesis setAsrId:](self, "setAsrId:");
  }
  id v4 = v8;
LABEL_7:
  if (*((void *)v4 + 4))
  {
    -[SIRINLUINTERNALRewriteHypothesis setUtterance:](self, "setUtterance:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 40);
  if (v7)
  {
    self->_confidence = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 40);
  }
  if ((v7 & 2) != 0)
  {
    self->_rewriteType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_asrId hash];
  NSUInteger v4 = [(NSString *)self->_utterance hash];
  char has = (char)self->_has;
  if (has)
  {
    double confidence = self->_confidence;
    double v8 = -confidence;
    if (confidence >= 0.0) {
      double v8 = self->_confidence;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_rewriteType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  asrId = self->_asrId;
  if ((unint64_t)asrId | *((void *)v4 + 2))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  utterance = self->_utterance;
  if ((unint64_t)utterance | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](utterance, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_confidence != *((double *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_rewriteType != *((_DWORD *)v4 + 6)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_asrId copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_utterance copyWithZone:a3];
  long double v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_rewriteType;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_asrId)
  {
    objc_msgSend(v4, "setAsrId:");
    id v4 = v6;
  }
  if (self->_utterance)
  {
    objc_msgSend(v6, "setUtterance:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_confidence;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_rewriteType;
    *((unsigned char *)v4 + 40) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_asrId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_utterance)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALRewriteHypothesisReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  asrId = self->_asrId;
  if (asrId)
  {
    uint64_t v5 = [(SIRINLUEXTERNALUUID *)asrId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"asr_id"];
  }
  utterance = self->_utterance;
  if (utterance) {
    [v3 setObject:utterance forKey:@"utterance"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v8 = [NSNumber numberWithDouble:self->_confidence];
    [v3 setObject:v8 forKey:@"confidence"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int rewriteType = self->_rewriteType;
    if (rewriteType)
    {
      if (rewriteType == 1)
      {
        double v10 = @"REFERENCE_RESOLUTION";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_rewriteType);
        double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      double v10 = @"CORRECTION";
    }
    [v3 setObject:v10 forKey:@"rewrite_type"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALRewriteHypothesis;
  id v4 = [(SIRINLUINTERNALRewriteHypothesis *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALRewriteHypothesis *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsRewriteType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CORRECTION"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"REFERENCE_RESOLUTION"];
  }

  return v4;
}

- (id)rewriteTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"REFERENCE_RESOLUTION";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"CORRECTION";
  }
  return v4;
}

- (BOOL)hasRewriteType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasRewriteType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setRewriteType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int rewriteType = a3;
}

- (int)rewriteType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_rewriteType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double confidence = a3;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

@end