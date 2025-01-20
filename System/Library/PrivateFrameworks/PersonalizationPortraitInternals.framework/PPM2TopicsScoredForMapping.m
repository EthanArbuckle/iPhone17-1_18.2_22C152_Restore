@interface PPM2TopicsScoredForMapping
- (BOOL)error;
- (BOOL)exclusionSpec;
- (BOOL)hasActiveTreatments;
- (BOOL)hasBundleId;
- (BOOL)hasError;
- (BOOL)hasExclusionSpec;
- (BOOL)hasLimitHit;
- (BOOL)hasMappingId;
- (BOOL)hasResultSizeLog10;
- (BOOL)hasTimeLimited;
- (BOOL)hasTimeSpec;
- (BOOL)isEqual:(id)a3;
- (BOOL)limitHit;
- (BOOL)readFrom:(id)a3;
- (BOOL)timeLimited;
- (BOOL)timeSpec;
- (NSString)activeTreatments;
- (NSString)bundleId;
- (NSString)mappingId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)resultSizeLog10;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setError:(BOOL)a3;
- (void)setExclusionSpec:(BOOL)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasExclusionSpec:(BOOL)a3;
- (void)setHasLimitHit:(BOOL)a3;
- (void)setHasResultSizeLog10:(BOOL)a3;
- (void)setHasTimeLimited:(BOOL)a3;
- (void)setHasTimeSpec:(BOOL)a3;
- (void)setLimitHit:(BOOL)a3;
- (void)setMappingId:(id)a3;
- (void)setResultSizeLog10:(unsigned int)a3;
- (void)setTimeLimited:(BOOL)a3;
- (void)setTimeSpec:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2TopicsScoredForMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (BOOL)limitHit
{
  return self->_limitHit;
}

- (BOOL)timeSpec
{
  return self->_timeSpec;
}

- (BOOL)error
{
  return self->_error;
}

- (BOOL)exclusionSpec
{
  return self->_exclusionSpec;
}

- (BOOL)timeLimited
{
  return self->_timeLimited;
}

- (unsigned)resultSizeLog10
{
  return self->_resultSizeLog10;
}

- (void)setMappingId:(id)a3
{
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[PPM2TopicsScoredForMapping setBundleId:](self, "setBundleId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[PPM2TopicsScoredForMapping setMappingId:](self, "setMappingId:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_resultSizeLog10 = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 0x10) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) == 0)
  {
    goto LABEL_7;
  }
  self->_timeLimited = *((unsigned char *)v4 + 39);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_exclusionSpec = *((unsigned char *)v4 + 37);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_error = *((unsigned char *)v4 + 36);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  self->_timeSpec = *((unsigned char *)v4 + 40);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
LABEL_11:
    self->_limitHit = *((unsigned char *)v4 + 38);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((void *)v4 + 1))
  {
    -[PPM2TopicsScoredForMapping setActiveTreatments:](self, "setActiveTreatments:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  NSUInteger v4 = [(NSString *)self->_mappingId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_resultSizeLog10;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_timeLimited;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_exclusionSpec;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_error;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSString *)self->_activeTreatments hash];
  }
LABEL_11:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_timeSpec;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v10 = 2654435761 * self->_limitHit;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSString *)self->_activeTreatments hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_47;
    }
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](mappingId, "isEqual:")) {
      goto LABEL_47;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_resultSizeLog10 != *((_DWORD *)v4 + 8)) {
      goto LABEL_47;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0) {
      goto LABEL_47;
    }
    if (self->_timeLimited)
    {
      if (!*((unsigned char *)v4 + 39)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 39))
    {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0) {
      goto LABEL_47;
    }
    if (self->_exclusionSpec)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0) {
      goto LABEL_47;
    }
    if (self->_error)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) == 0) {
      goto LABEL_47;
    }
    if (self->_timeSpec)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0) {
      goto LABEL_53;
    }
LABEL_47:
    char v7 = 0;
    goto LABEL_48;
  }
  if ((*((unsigned char *)v4 + 44) & 8) == 0) {
    goto LABEL_47;
  }
  if (!self->_limitHit)
  {
    if (!*((unsigned char *)v4 + 38)) {
      goto LABEL_53;
    }
    goto LABEL_47;
  }
  if (!*((unsigned char *)v4 + 38)) {
    goto LABEL_47;
  }
LABEL_53:
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](activeTreatments, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_48:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  char v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_mappingId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 32) = self->_resultSizeLog10;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 39) = self->_timeLimited;
  *(unsigned char *)(v5 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(unsigned char *)(v5 + 37) = self->_exclusionSpec;
  *(unsigned char *)(v5 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(unsigned char *)(v5 + 40) = self->_timeSpec;
    *(unsigned char *)(v5 + 44) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(unsigned char *)(v5 + 36) = self->_error;
  *(unsigned char *)(v5 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(unsigned char *)(v5 + 38) = self->_limitHit;
    *(unsigned char *)(v5 + 44) |= 8u;
  }
LABEL_8:
  uint64_t v11 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v12 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v11;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    id v4 = v6;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v6, "setMappingId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 8) = self->_resultSizeLog10;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 39) = self->_timeLimited;
  *((unsigned char *)v4 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)v4 + 37) = self->_exclusionSpec;
  *((unsigned char *)v4 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v4 + 36) = self->_error;
  *((unsigned char *)v4 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((unsigned char *)v4 + 40) = self->_timeSpec;
  *((unsigned char *)v4 + 44) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 38) = self->_limitHit;
    *((unsigned char *)v4 + 44) |= 8u;
  }
LABEL_12:
  if (self->_activeTreatments)
  {
    objc_msgSend(v6, "setActiveTreatments:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_mappingId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_12:
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2TopicsScoredForMappingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  mappingId = self->_mappingId;
  if (mappingId) {
    [v4 setObject:mappingId forKey:@"mappingId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInt:self->_resultSizeLog10];
    [v4 setObject:v11 forKey:@"resultSizeLog10"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  v12 = [NSNumber numberWithBool:self->_timeLimited];
  [v4 setObject:v12 forKey:@"timeLimited"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  v13 = [NSNumber numberWithBool:self->_exclusionSpec];
  [v4 setObject:v13 forKey:@"exclusionSpec"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  v14 = [NSNumber numberWithBool:self->_error];
  [v4 setObject:v14 forKey:@"error"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  v15 = [NSNumber numberWithBool:self->_timeSpec];
  [v4 setObject:v15 forKey:@"timeSpec"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    uint64_t v8 = [NSNumber numberWithBool:self->_limitHit];
    [v4 setObject:v8 forKey:@"limitHit"];
  }
LABEL_12:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v4 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2TopicsScoredForMapping;
  id v4 = [(PPM2TopicsScoredForMapping *)&v8 description];
  uint64_t v5 = [(PPM2TopicsScoredForMapping *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (BOOL)hasLimitHit
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasLimitHit:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setLimitHit:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_limitHit = a3;
}

- (BOOL)hasTimeSpec
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasTimeSpec:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setTimeSpec:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_timeSpec = a3;
}

- (BOOL)hasError
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasError:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setError:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_error = a3;
}

- (BOOL)hasExclusionSpec
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasExclusionSpec:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setExclusionSpec:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_exclusionSpec = a3;
}

- (BOOL)hasTimeLimited
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasTimeLimited:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setTimeLimited:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_timeLimited = a3;
}

- (BOOL)hasResultSizeLog10
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasResultSizeLog10:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setResultSizeLog10:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_resultSizeLog10 = a3;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

@end