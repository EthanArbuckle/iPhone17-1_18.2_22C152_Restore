@interface MXLatnnMitigatorResult
- (BOOL)hasProcessed;
- (BOOL)hasScore;
- (BOOL)hasThreshold;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)processed;
- (BOOL)readFrom:(id)a3;
- (NSString)version;
- (double)score;
- (double)threshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasProcessed:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasThreshold:(BOOL)a3;
- (void)setProcessed:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)setThreshold:(double)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXLatnnMitigatorResult

- (void)setProcessed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_processed = a3;
}

- (void)setHasProcessed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProcessed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (void)setThreshold:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_threshold = a3;
}

- (void)setHasThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasThreshold
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXLatnnMitigatorResult;
  v4 = [(MXLatnnMitigatorResult *)&v8 description];
  v5 = [(MXLatnnMitigatorResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_processed];
    [v3 setObject:v4 forKey:@"processed"];
  }
  version = self->_version;
  if (version) {
    [v3 setObject:version forKey:@"version"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_threshold];
    [v3 setObject:v7 forKey:@"threshold"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_score];
    [v3 setObject:v8 forKey:@"score"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXLatnnMitigatorResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_version) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[32] = self->_processed;
    v4[36] |= 4u;
  }
  if (self->_version)
  {
    v6 = v4;
    objc_msgSend(v4, "setVersion:");
    v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_threshold;
    v4[36] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_score;
    v4[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_processed;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_version copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_threshold;
    *(unsigned char *)(v6 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v6 + 8) = self->_score;
    *(unsigned char *)(v6 + 36) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0) {
      goto LABEL_22;
    }
    if (self->_processed)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_22;
  }
  version = self->_version;
  if (!((unint64_t)version | *((void *)v4 + 3))) {
    goto LABEL_13;
  }
  if (!-[NSString isEqual:](version, "isEqual:"))
  {
LABEL_22:
    BOOL v7 = 0;
    goto LABEL_23;
  }
  char has = (char)self->_has;
LABEL_13:
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_threshold != *((double *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_22;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_score != *((double *)v4 + 1)) {
      goto LABEL_22;
    }
    BOOL v7 = 1;
  }
LABEL_23:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_processed;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_version hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double threshold = self->_threshold;
    double v8 = -threshold;
    if (threshold >= 0.0) {
      double v8 = self->_threshold;
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
  if (has)
  {
    double score = self->_score;
    double v13 = -score;
    if (score >= 0.0) {
      double v13 = self->_score;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    self->_processed = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[MXLatnnMitigatorResult setVersion:](self, "setVersion:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_double threshold = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_double score = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)processed
{
  return self->_processed;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (double)threshold
{
  return self->_threshold;
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

@end