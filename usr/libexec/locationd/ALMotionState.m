@interface ALMotionState
- (ALCLNatalieFeatures)natalieFeatures;
- (ALCMMotionContextMotionState)motion;
- (BOOL)hasNatalieFeatures;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)regularEntry;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMotion:(id)a3;
- (void)setNatalieFeatures:(id)a3;
- (void)setRegularEntry:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALMotionState

- (void)dealloc
{
  [(ALMotionState *)self setMotion:0];
  [(ALMotionState *)self setNatalieFeatures:0];
  v3.receiver = self;
  v3.super_class = (Class)ALMotionState;
  [(ALMotionState *)&v3 dealloc];
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasNatalieFeatures
{
  return self->_natalieFeatures != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALMotionState;
  return +[NSString stringWithFormat:@"%@ %@", [(ALMotionState *)&v3 description], [(ALMotionState *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp)] forKey:@"timestamp"];
  }
  motion = self->_motion;
  if (motion) {
    [v3 setObject:[[motion dictionaryRepresentation] forKey:@"motion"];
  }
  natalieFeatures = self->_natalieFeatures;
  if (natalieFeatures) {
    [v3 setObject:natalieFeatures dictionaryRepresentation] forKey:@"natalieFeatures"];
  }
  [v3 setObject:[NSNumber numberWithBool:self->_regularEntry] forKey:@"regularEntry"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10045BB88((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (!self->_motion) {
    sub_101A60BD8();
  }
  PBDataWriterWriteSubmessage();
  if (self->_natalieFeatures) {
    PBDataWriterWriteSubmessage();
  }

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)a3 + 36) |= 1u;
  }
  [a3 setMotion:self->_motion];
  if (self->_natalieFeatures) {
    [a3 setNatalieFeatures:];
  }
  *((unsigned char *)a3 + 32) = self->_regularEntry;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(id *)&self->_timestamp;
    *((unsigned char *)v5 + 36) |= 1u;
  }

  v6[2] = [(ALCMMotionContextMotionState *)self->_motion copyWithZone:a3];
  v6[3] = [(ALCLNatalieFeatures *)self->_natalieFeatures copyWithZone:a3];
  *((unsigned char *)v6 + 32) = self->_regularEntry;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_timestamp != *((double *)a3 + 1)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    motion = self->_motion;
    if (!((unint64_t)motion | *((void *)a3 + 2))
      || (unsigned int v5 = -[ALCMMotionContextMotionState isEqual:](motion, "isEqual:")) != 0)
    {
      natalieFeatures = self->_natalieFeatures;
      if (!((unint64_t)natalieFeatures | *((void *)a3 + 3))
        || (unsigned int v5 = -[ALCLNatalieFeatures isEqual:](natalieFeatures, "isEqual:")) != 0)
      {
        int v8 = *((unsigned __int8 *)a3 + 32);
        if (self->_regularEntry) {
          LOBYTE(v5) = v8 != 0;
        }
        else {
          LOBYTE(v5) = v8 == 0;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v5 = -timestamp;
    if (timestamp >= 0.0) {
      double v5 = self->_timestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v8 = [(ALCMMotionContextMotionState *)self->_motion hash] ^ v3;
  return v8 ^ [(ALCLNatalieFeatures *)self->_natalieFeatures hash] ^ (2654435761 * self->_regularEntry);
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 36))
  {
    self->_double timestamp = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  motion = self->_motion;
  uint64_t v6 = *((void *)a3 + 2);
  if (motion)
  {
    if (v6) {
      -[ALCMMotionContextMotionState mergeFrom:](motion, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ALMotionState setMotion:](self, "setMotion:");
  }
  natalieFeatures = self->_natalieFeatures;
  uint64_t v8 = *((void *)a3 + 3);
  if (natalieFeatures)
  {
    if (v8) {
      -[ALCLNatalieFeatures mergeFrom:](natalieFeatures, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ALMotionState setNatalieFeatures:](self, "setNatalieFeatures:");
  }
  self->_regularEntry = *((unsigned char *)a3 + 32);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (ALCMMotionContextMotionState)motion
{
  return self->_motion;
}

- (void)setMotion:(id)a3
{
}

- (ALCLNatalieFeatures)natalieFeatures
{
  return self->_natalieFeatures;
}

- (void)setNatalieFeatures:(id)a3
{
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

- (void)setRegularEntry:(BOOL)a3
{
  self->_regularEntry = a3;
}

@end