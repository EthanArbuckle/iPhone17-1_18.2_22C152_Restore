@interface SIRINLUINTERNALSNLCSNLCParserResponse
- (BOOL)hasClassificationLabel;
- (BOOL)hasClassificationProbability;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)classificationProbability;
- (id)classificationLabelAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsClassificationLabel:(id)a3;
- (int)classificationLabel;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassificationLabel:(int)a3;
- (void)setClassificationProbability:(float)a3;
- (void)setHasClassificationLabel:(BOOL)a3;
- (void)setHasClassificationProbability:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSNLCSNLCParserResponse

- (float)classificationProbability
{
  return self->_classificationProbability;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_classificationLabel = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_classificationProbability = *((float *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_classificationLabel;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float classificationProbability = self->_classificationProbability;
  float v4 = -classificationProbability;
  if (classificationProbability >= 0.0) {
    float v4 = self->_classificationProbability;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmodf(v5, 1.8447e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabsf(v6);
  }
  return v7 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_classificationLabel != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_classificationProbability != *((float *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_classificationLabel;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = LODWORD(self->_classificationProbability);
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_classificationLabel;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = LODWORD(self->_classificationProbability);
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLCSNLCParserResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    int classificationLabel = self->_classificationLabel;
    if (classificationLabel)
    {
      if (classificationLabel == 1)
      {
        unint64_t v7 = @"SNLC_CLASS_DEVICE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_classificationLabel);
        unint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      unint64_t v7 = @"SNLC_CLASS_SERVER";
    }
    [v3 setObject:v7 forKey:@"classification_label"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_classificationProbability;
    v8 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"classification_probability"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSNLCSNLCParserResponse;
  double v4 = [(SIRINLUINTERNALSNLCSNLCParserResponse *)&v8 description];
  BOOL v5 = [(SIRINLUINTERNALSNLCSNLCParserResponse *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasClassificationProbability
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasClassificationProbability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setClassificationProbability:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float classificationProbability = a3;
}

- (int)StringAsClassificationLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SNLC_CLASS_SERVER"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"SNLC_CLASS_DEVICE"];
  }

  return v4;
}

- (id)classificationLabelAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"SNLC_CLASS_DEVICE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"SNLC_CLASS_SERVER";
  }
  return v4;
}

- (BOOL)hasClassificationLabel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasClassificationLabel:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setClassificationLabel:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int classificationLabel = a3;
}

- (int)classificationLabel
{
  if (*(unsigned char *)&self->_has) {
    return self->_classificationLabel;
  }
  else {
    return 0;
  }
}

@end