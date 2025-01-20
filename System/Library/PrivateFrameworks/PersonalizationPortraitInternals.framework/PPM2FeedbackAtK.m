@interface PPM2FeedbackAtK
- (BOOL)hasActiveTreatments;
- (BOOL)hasBucket;
- (BOOL)hasDomain;
- (BOOL)hasEvaluatedCount;
- (BOOL)hasFeedbackType;
- (BOOL)hasK;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)domainAsString:(int)a3;
- (id)feedbackTypeAsString:(int)a3;
- (int)StringAsDomain:(id)a3;
- (int)StringAsFeedbackType:(id)a3;
- (int)domain;
- (int)feedbackType;
- (unint64_t)hash;
- (unsigned)bucket;
- (unsigned)evaluatedCount;
- (unsigned)k;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setBucket:(unsigned int)a3;
- (void)setDomain:(int)a3;
- (void)setEvaluatedCount:(unsigned int)a3;
- (void)setFeedbackType:(int)a3;
- (void)setHasBucket:(BOOL)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasEvaluatedCount:(BOOL)a3;
- (void)setHasFeedbackType:(BOOL)a3;
- (void)setHasK:(BOOL)a3;
- (void)setK:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2FeedbackAtK

- (void).cxx_destruct
{
}

- (unsigned)bucket
{
  return self->_bucket;
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (unsigned)evaluatedCount
{
  return self->_evaluatedCount;
}

- (unsigned)k
{
  return self->_k;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) != 0)
  {
    self->_k = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_evaluatedCount = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  self->_domain = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_5:
    self->_feedbackType = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[PPM2FeedbackAtK setActiveTreatments:](self, "setActiveTreatments:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_bucket = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_k;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_evaluatedCount;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_domain;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_feedbackType;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  NSUInteger v7 = [(NSString *)self->_activeTreatments hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_bucket;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 36);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_k != *((_DWORD *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_evaluatedCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_domain != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_feedbackType != *((_DWORD *)v4 + 7)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_29;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](activeTreatments, "isEqual:"))
    {
LABEL_29:
      BOOL v8 = 0;
      goto LABEL_30;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 36);
  }
  BOOL v8 = (v6 & 1) == 0;
  if (has)
  {
    if ((v6 & 1) == 0 || self->_bucket != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
    BOOL v8 = 1;
  }
LABEL_30:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_k;
    *(unsigned char *)(v5 + 36) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_evaluatedCount;
  *(unsigned char *)(v5 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *(_DWORD *)(v5 + 20) = self->_domain;
  *(unsigned char *)(v5 + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 28) = self->_feedbackType;
    *(unsigned char *)(v5 + 36) |= 8u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v9 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 16) = self->_bucket;
    *(unsigned char *)(v6 + 36) |= 1u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[8] = self->_k;
    *((unsigned char *)v4 + 36) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_evaluatedCount;
  *((unsigned char *)v4 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  v4[5] = self->_domain;
  *((unsigned char *)v4 + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v4[7] = self->_feedbackType;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_6:
  if (self->_activeTreatments)
  {
    uint64_t v6 = v4;
    objc_msgSend(v4, "setActiveTreatments:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_bucket;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_activeTreatments) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2FeedbackAtKReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    id v5 = [NSNumber numberWithUnsignedInt:self->_k];
    [v3 setObject:v5 forKey:@"k"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v6 = [NSNumber numberWithUnsignedInt:self->_evaluatedCount];
  [v3 setObject:v6 forKey:@"evaluatedCount"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
LABEL_8:
  uint64_t domain = self->_domain;
  if (domain >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_domain);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = off_1E65D6E90[domain];
  }
  [v3 setObject:v8 forKey:@"domain"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    uint64_t feedbackType = self->_feedbackType;
    if (feedbackType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedbackType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E65D6ED0[feedbackType];
    }
    [v3 setObject:v10 forKey:@"feedbackType"];
  }
LABEL_16:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v3 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_bucket];
    [v3 setObject:v12 forKey:@"bucket"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2FeedbackAtK;
  id v4 = [(PPM2FeedbackAtK *)&v8 description];
  id v5 = [(PPM2FeedbackAtK *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBucket
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasBucket:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setBucket:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bucket = a3;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (int)StringAsFeedbackType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Invalid"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EngagedExplicit"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EngagedImplicit"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RejectedExplicit"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RejectedImplicit"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Offered"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)feedbackTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D6ED0[a3];
  }
  return v3;
}

- (BOOL)hasFeedbackType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setFeedbackType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t feedbackType = a3;
}

- (int)feedbackType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_feedbackType;
  }
  else {
    return 0;
  }
}

- (int)StringAsDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Topics"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NamedEntities"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Locations"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Events"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ContactsDomain"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Connections"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"QuickTypeBroker"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"UniversalSearchSpotlightTopics"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)domainAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D6E90[a3];
  }
  return v3;
}

- (BOOL)hasDomain
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t domain = a3;
}

- (int)domain
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_domain;
  }
  else {
    return 0;
  }
}

- (BOOL)hasEvaluatedCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasEvaluatedCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setEvaluatedCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_evaluatedCount = a3;
}

- (BOOL)hasK
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasK:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setK:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_k = a3;
}

@end