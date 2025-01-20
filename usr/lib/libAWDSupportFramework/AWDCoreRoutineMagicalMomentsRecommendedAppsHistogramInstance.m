@interface AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance
- (BOOL)hasBundleId;
- (BOOL)hasConfidence;
- (BOOL)hasRank;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)confidence;
- (int)rank;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setRank:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance

- (void)dealloc
{
  [(AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance *)self setBundleId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance;
  [(AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance *)&v3 dealloc];
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setRank:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRank
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v4 setObject:[NSNumber numberWithInt:self->_rank] forKey:@"rank"];
    char has = (char)self->_has;
  }
  if (has) {
    [v4 setObject:[NSNumber numberWithInt:self->_confidence] forKey:@"confidence"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_bundleId) {
    [a3 setBundleId:];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_rank;
    *((unsigned char *)a3 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)a3 + 4) = self->_confidence;
    *((unsigned char *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 8) = [(NSString *)self->_bundleId copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_rank;
    *(unsigned char *)(v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_confidence;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    bundleId = self->_bundleId;
    if (!((unint64_t)bundleId | *((void *)a3 + 1)) || (int v5 = -[NSString isEqual:](bundleId, "isEqual:")) != 0)
    {
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_rank != *((_DWORD *)a3 + 5)) {
          goto LABEL_13;
        }
      }
      else if ((*((unsigned char *)a3 + 24) & 2) != 0)
      {
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_confidence != *((_DWORD *)a3 + 4)) {
          goto LABEL_13;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_rank;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_confidence;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance setBundleId:](self, "setBundleId:");
  }
  char v5 = *((unsigned char *)a3 + 24);
  if ((v5 & 2) != 0)
  {
    self->_rank = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 24);
  }
  if (v5)
  {
    self->_confidence = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (int)rank
{
  return self->_rank;
}

- (int)confidence
{
  return self->_confidence;
}

@end