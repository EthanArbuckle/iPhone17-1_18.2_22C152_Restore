@interface SIRINLUINTERNALITFMITFMHypothesis
- (BOOL)hasLabel;
- (BOOL)hasProbability;
- (BOOL)hasStringLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)stringLabel;
- (float)probability;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)label;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLabel:(BOOL)a3;
- (void)setHasProbability:(BOOL)a3;
- (void)setLabel:(int)a3;
- (void)setProbability:(float)a3;
- (void)setStringLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALITFMITFMHypothesis

- (void).cxx_destruct
{
}

- (void)setStringLabel:(id)a3
{
}

- (NSString)stringLabel
{
  return self->_stringLabel;
}

- (float)probability
{
  return self->_probability;
}

- (int)label
{
  return self->_label;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_label = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_probability = *((float *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[SIRINLUINTERNALITFMITFMHypothesis setStringLabel:](self, "setStringLabel:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_label;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3 ^ [(NSString *)self->_stringLabel hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float probability = self->_probability;
  float v5 = -probability;
  if (probability >= 0.0) {
    float v5 = self->_probability;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
  return v8 ^ v3 ^ [(NSString *)self->_stringLabel hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_label != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_probability != *((float *)v4 + 3)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  stringLabel = self->_stringLabel;
  if ((unint64_t)stringLabel | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](stringLabel, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_label;
    *(unsigned char *)(v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)(v5 + 12) = self->_probability;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_stringLabel copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_label;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = LODWORD(self->_probability);
    *((unsigned char *)v4 + 24) |= 2u;
  }
  if (self->_stringLabel)
  {
    char v6 = v4;
    objc_msgSend(v4, "setStringLabel:");
    id v4 = v6;
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
  if (self->_stringLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALITFMITFMHypothesisReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    id v6 = [NSNumber numberWithInt:self->_label];
    [v3 setObject:v6 forKey:@"label"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_probability;
    float v7 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v7 forKey:@"probability"];
  }
  stringLabel = self->_stringLabel;
  if (stringLabel) {
    [v3 setObject:stringLabel forKey:@"string_label"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALITFMITFMHypothesis;
  double v4 = [(SIRINLUINTERNALITFMITFMHypothesis *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALITFMITFMHypothesis *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasStringLabel
{
  return self->_stringLabel != 0;
}

- (BOOL)hasProbability
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasProbability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setProbability:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float probability = a3;
}

- (BOOL)hasLabel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLabel:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLabel:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_label = a3;
}

@end