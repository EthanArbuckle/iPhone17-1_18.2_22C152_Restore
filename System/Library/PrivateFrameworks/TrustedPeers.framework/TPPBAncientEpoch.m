@interface TPPBAncientEpoch
- (BOOL)hasCandidateEpoch;
- (BOOL)hasMyEpoch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)candidateEpoch;
- (unint64_t)hash;
- (unint64_t)myEpoch;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCandidateEpoch:(unint64_t)a3;
- (void)setHasCandidateEpoch:(BOOL)a3;
- (void)setHasMyEpoch:(BOOL)a3;
- (void)setMyEpoch:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBAncientEpoch

- (unint64_t)candidateEpoch
{
  return self->_candidateEpoch;
}

- (unint64_t)myEpoch
{
  return self->_myEpoch;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_myEpoch = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if (v5)
  {
    self->_candidateEpoch = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v2 = 2654435761u * self->_myEpoch;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_candidateEpoch;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_myEpoch != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_candidateEpoch != *((void *)v4 + 1)) {
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
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_myEpoch;
    *((unsigned char *)result + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)result + 1) = self->_candidateEpoch;
    *((unsigned char *)result + 24) |= 1u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_myEpoch;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[1] = self->_candidateEpoch;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBAncientEpochReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    BOOL v5 = [NSNumber numberWithUnsignedLongLong:self->_myEpoch];
    [v3 setObject:v5 forKey:@"my_epoch"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v6 = [NSNumber numberWithUnsignedLongLong:self->_candidateEpoch];
    [v3 setObject:v6 forKey:@"candidate_epoch"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBAncientEpoch;
  id v4 = [(TPPBAncientEpoch *)&v8 description];
  BOOL v5 = [(TPPBAncientEpoch *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCandidateEpoch
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCandidateEpoch:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCandidateEpoch:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_candidateEpoch = a3;
}

- (BOOL)hasMyEpoch
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMyEpoch:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMyEpoch:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_myEpoch = a3;
}

@end