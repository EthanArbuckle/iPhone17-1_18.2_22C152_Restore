@interface NTPBTagRecommendation
- (BOOL)hasScore;
- (BOOL)hasTagId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tagId;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)setTagId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTagRecommendation

- (BOOL)hasTagId
{
  return self->_tagId != 0;
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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTagRecommendation;
  v4 = [(NTPBTagRecommendation *)&v8 description];
  v5 = [(NTPBTagRecommendation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  tagId = self->_tagId;
  if (tagId) {
    [v3 setObject:tagId forKey:@"tag_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_score];
    [v4 setObject:v6 forKey:@"score"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTagRecommendationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tagId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_tagId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_score;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  tagId = self->_tagId;
  if ((unint64_t)tagId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](tagId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_score == *((double *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tagId hash];
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
  unint64_t v4 = (double *)a3;
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[NTPBTagRecommendation setTagId:](self, "setTagId:");
    unint64_t v4 = v5;
  }
  if ((_BYTE)v4[3])
  {
    self->_double score = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

@end