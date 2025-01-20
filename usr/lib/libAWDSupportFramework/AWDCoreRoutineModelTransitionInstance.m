@interface AWDCoreRoutineModelTransitionInstance
- (AWDCoreRoutineTransitionMotionType)transitionHistogram;
- (BOOL)hasDistance;
- (BOOL)hasDuration;
- (BOOL)hasTransitionHistogram;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)distance;
- (unsigned)duration;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDistance:(unsigned int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setTransitionHistogram:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineModelTransitionInstance

- (void)dealloc
{
  [(AWDCoreRoutineModelTransitionInstance *)self setTransitionHistogram:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineModelTransitionInstance;
  [(AWDCoreRoutineModelTransitionInstance *)&v3 dealloc];
}

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDistance:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDistance
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTransitionHistogram
{
  return self->_transitionHistogram != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineModelTransitionInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineModelTransitionInstance description](&v3, sel_description), -[AWDCoreRoutineModelTransitionInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_duration] forKey:@"duration"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_distance] forKey:@"distance"];
  }
  transitionHistogram = self->_transitionHistogram;
  if (transitionHistogram) {
    [v3 setObject:-[AWDCoreRoutineTransitionMotionType dictionaryRepresentation](transitionHistogram, "dictionaryRepresentation") forKey:@"transitionHistogram"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineModelTransitionInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_transitionHistogram)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_duration;
    *((unsigned char *)a3 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_distance;
    *((unsigned char *)a3 + 24) |= 1u;
  }
  transitionHistogram = self->_transitionHistogram;
  if (transitionHistogram) {
    [a3 setTransitionHistogram:transitionHistogram];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_duration;
    *(unsigned char *)(v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_distance;
    *(unsigned char *)(v5 + 24) |= 1u;
  }

  v6[2] = [(AWDCoreRoutineTransitionMotionType *)self->_transitionHistogram copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_duration != *((_DWORD *)a3 + 3)) {
        goto LABEL_14;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 2) != 0)
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_distance != *((_DWORD *)a3 + 2)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
      goto LABEL_14;
    }
    transitionHistogram = self->_transitionHistogram;
    if ((unint64_t)transitionHistogram | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[AWDCoreRoutineTransitionMotionType isEqual:](transitionHistogram, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_duration;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(AWDCoreRoutineTransitionMotionType *)self->_transitionHistogram hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_distance;
  return v3 ^ v2 ^ [(AWDCoreRoutineTransitionMotionType *)self->_transitionHistogram hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 24);
  if ((v3 & 2) != 0)
  {
    self->_duration = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 24);
  }
  if (v3)
  {
    self->_distance = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v4 = *((void *)a3 + 2);
  if (self->_transitionHistogram)
  {
    if (v4) {
      -[AWDCoreRoutineTransitionMotionType mergeFrom:](self->_transitionHistogram, "mergeFrom:");
    }
  }
  else if (v4)
  {
    -[AWDCoreRoutineModelTransitionInstance setTransitionHistogram:](self, "setTransitionHistogram:");
  }
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)distance
{
  return self->_distance;
}

- (AWDCoreRoutineTransitionMotionType)transitionHistogram
{
  return self->_transitionHistogram;
}

- (void)setTransitionHistogram:(id)a3
{
}

@end