@interface PPPBExtractedDonationRecord
- (BOOL)hasAlgorithm;
- (BOOL)hasNamedEntity;
- (BOOL)hasScore;
- (BOOL)hasSourceBundleId;
- (BOOL)hasTopicId;
- (BOOL)hasUnixTimestampSec;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)algorithm;
- (NSString)namedEntity;
- (NSString)sourceBundleId;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)topicId;
- (unint64_t)unixTimestampSec;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithm:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasTopicId:(BOOL)a3;
- (void)setHasUnixTimestampSec:(BOOL)a3;
- (void)setNamedEntity:(id)a3;
- (void)setScore:(double)a3;
- (void)setSourceBundleId:(id)a3;
- (void)setTopicId:(unint64_t)a3;
- (void)setUnixTimestampSec:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBExtractedDonationRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_namedEntity, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

- (unint64_t)unixTimestampSec
{
  return self->_unixTimestampSec;
}

- (void)setNamedEntity:(id)a3
{
}

- (NSString)namedEntity
{
  return self->_namedEntity;
}

- (unint64_t)topicId
{
  return self->_topicId;
}

- (double)score
{
  return self->_score;
}

- (void)setAlgorithm:(id)a3
{
}

- (NSString)algorithm
{
  return self->_algorithm;
}

- (void)setSourceBundleId:(id)a3
{
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[PPPBExtractedDonationRecord setSourceBundleId:](self, "setSourceBundleId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[PPPBExtractedDonationRecord setAlgorithm:](self, "setAlgorithm:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if (v5)
  {
    self->_score = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_topicId = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 5))
  {
    -[PPPBExtractedDonationRecord setNamedEntity:](self, "setNamedEntity:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    self->_unixTimestampSec = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourceBundleId hash];
  NSUInteger v4 = [(NSString *)self->_algorithm hash];
  char has = (char)self->_has;
  if (has)
  {
    double score = self->_score;
    double v8 = -score;
    if (score >= 0.0) {
      double v8 = self->_score;
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
    unint64_t v11 = 2654435761u * self->_topicId;
  }
  else {
    unint64_t v11 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_namedEntity hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v13 = 2654435761u * self->_unixTimestampSec;
  }
  else {
    unint64_t v13 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](sourceBundleId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  algorithm = self->_algorithm;
  if ((unint64_t)algorithm | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](algorithm, "isEqual:")) {
      goto LABEL_23;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 56);
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_score != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_topicId != *((void *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  namedEntity = self->_namedEntity;
  if ((unint64_t)namedEntity | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](namedEntity, "isEqual:"))
    {
LABEL_23:
      BOOL v10 = 0;
      goto LABEL_24;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 56);
  }
  BOOL v10 = (v8 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_unixTimestampSec != *((void *)v4 + 3)) {
      goto LABEL_23;
    }
    BOOL v10 = 1;
  }
LABEL_24:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sourceBundleId copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_algorithm copyWithZone:a3];
  long double v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_score;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_topicId;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v11 = [(NSString *)self->_namedEntity copyWithZone:a3];
  NSUInteger v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_unixTimestampSec;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sourceBundleId)
  {
    objc_msgSend(v4, "setSourceBundleId:");
    id v4 = v6;
  }
  if (self->_algorithm)
  {
    objc_msgSend(v6, "setAlgorithm:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_score;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_topicId;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  if (self->_namedEntity)
  {
    objc_msgSend(v6, "setNamedEntity:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_unixTimestampSec;
    *((unsigned char *)v4 + 56) |= 4u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sourceBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_algorithm)
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
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_namedEntity)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBExtractedDonationRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId) {
    [v3 setObject:sourceBundleId forKey:@"sourceBundleId"];
  }
  algorithm = self->_algorithm;
  if (algorithm) {
    [v4 setObject:algorithm forKey:@"algorithm"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v8 = [NSNumber numberWithDouble:self->_score];
    [v4 setObject:v8 forKey:@"score"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    long double v9 = [NSNumber numberWithUnsignedLongLong:self->_topicId];
    [v4 setObject:v9 forKey:@"topicId"];
  }
  namedEntity = self->_namedEntity;
  if (namedEntity) {
    [v4 setObject:namedEntity forKey:@"namedEntity"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:self->_unixTimestampSec];
    [v4 setObject:v11 forKey:@"unixTimestampSec"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBExtractedDonationRecord;
  id v4 = [(PPPBExtractedDonationRecord *)&v8 description];
  uint64_t v5 = [(PPPBExtractedDonationRecord *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasUnixTimestampSec
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasUnixTimestampSec:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setUnixTimestampSec:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unixTimestampSec = a3;
}

- (BOOL)hasNamedEntity
{
  return self->_namedEntity != 0;
}

- (BOOL)hasTopicId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTopicId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTopicId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_topicId = a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double score = a3;
}

- (BOOL)hasAlgorithm
{
  return self->_algorithm != 0;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

@end