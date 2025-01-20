@interface NTPBCohortMembership
- (BOOL)hasScore;
- (BOOL)hasTagID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tagID;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)setTagID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBCohortMembership

- (void)dealloc
{
  [(NTPBCohortMembership *)self setTagID:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBCohortMembership;
  [(NTPBCohortMembership *)&v3 dealloc];
}

- (BOOL)hasTagID
{
  return self->_tagID != 0;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBCohortMembership;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBCohortMembership description](&v3, sel_description), -[NTPBCohortMembership dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  tagID = self->_tagID;
  if (tagID) {
    [v3 setObject:tagID forKey:@"tag_ID"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_score), @"score");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCohortMembershipReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_tagID) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 16) = [(NSString *)self->_tagID copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_score;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    tagID = self->_tagID;
    if (!((unint64_t)tagID | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](tagID, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_score == *((double *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tagID hash];
  if (*(unsigned char *)&self->_has)
  {
    double score = self->_score;
    double v6 = -score;
    if (score >= 0.0) {
      double v6 = self->_score;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[NTPBCohortMembership setTagID:](self, "setTagID:");
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_double score = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
}

- (double)score
{
  return self->_score;
}

@end