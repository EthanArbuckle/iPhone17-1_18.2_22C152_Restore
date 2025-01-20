@interface PPM2EngagementRatio
- (BOOL)hasActiveTreatments;
- (BOOL)hasDomain;
- (BOOL)hasEngagedCount;
- (BOOL)hasEvaluatedCount;
- (BOOL)hasK;
- (BOOL)hasMappingId;
- (BOOL)hasOfferedCount;
- (BOOL)hasRejectedCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (NSString)mappingId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)domainAsString:(int)a3;
- (int)StringAsDomain:(id)a3;
- (int)domain;
- (unint64_t)hash;
- (unsigned)engagedCount;
- (unsigned)evaluatedCount;
- (unsigned)k;
- (unsigned)offeredCount;
- (unsigned)rejectedCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setDomain:(int)a3;
- (void)setEngagedCount:(unsigned int)a3;
- (void)setEvaluatedCount:(unsigned int)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasEngagedCount:(BOOL)a3;
- (void)setHasEvaluatedCount:(BOOL)a3;
- (void)setHasK:(BOOL)a3;
- (void)setHasOfferedCount:(BOOL)a3;
- (void)setHasRejectedCount:(BOOL)a3;
- (void)setK:(unsigned int)a3;
- (void)setMappingId:(id)a3;
- (void)setOfferedCount:(unsigned int)a3;
- (void)setRejectedCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2EngagementRatio

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

- (void)setMappingId:(id)a3
{
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (unsigned)offeredCount
{
  return self->_offeredCount;
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (unsigned)rejectedCount
{
  return self->_rejectedCount;
}

- (unsigned)engagedCount
{
  return self->_engagedCount;
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
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 8) != 0)
  {
    self->_k = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_evaluatedCount = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_engagedCount = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  self->_rejectedCount = *((_DWORD *)v4 + 11);
  *(unsigned char *)&self->_has |= 0x20u;
  if (*((unsigned char *)v4 + 48))
  {
LABEL_6:
    self->_domain = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[PPM2EngagementRatio setActiveTreatments:](self, "setActiveTreatments:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
    self->_offeredCount = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 4))
  {
    -[PPM2EngagementRatio setMappingId:](self, "setMappingId:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_k;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_evaluatedCount;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_engagedCount;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_rejectedCount;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_domain;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v7 = 0;
LABEL_12:
  NSUInteger v8 = [(NSString *)self->_activeTreatments hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v9 = 2654435761 * self->_offeredCount;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v8 ^ [(NSString *)self->_mappingId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 48);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_k != *((_DWORD *)v4 + 7)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_evaluatedCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_engagedCount != *((_DWORD *)v4 + 5)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x20) == 0 || self->_rejectedCount != *((_DWORD *)v4 + 11)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x20) != 0)
  {
    goto LABEL_37;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_domain != *((_DWORD *)v4 + 4)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_37;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](activeTreatments, "isEqual:"))
    {
LABEL_37:
      char v9 = 0;
      goto LABEL_38;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 48);
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_offeredCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_37;
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((void *)v4 + 4)) {
    char v9 = -[NSString isEqual:](mappingId, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_38:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_k;
    *(unsigned char *)(v5 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_evaluatedCount;
  *(unsigned char *)(v5 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v5 + 20) = self->_engagedCount;
  *(unsigned char *)(v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *(_DWORD *)(v5 + 44) = self->_rejectedCount;
  *(unsigned char *)(v5 + 48) |= 0x20u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *(_DWORD *)(v5 + 16) = self->_domain;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
LABEL_7:
  uint64_t v8 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  char v9 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v8;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_offeredCount;
    *(unsigned char *)(v6 + 48) |= 0x10u;
  }
  uint64_t v10 = [(NSString *)self->_mappingId copyWithZone:a3];
  v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[7] = self->_k;
    *((unsigned char *)v4 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_evaluatedCount;
  *((unsigned char *)v4 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[5] = self->_engagedCount;
  *((unsigned char *)v4 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  v4[11] = self->_rejectedCount;
  *((unsigned char *)v4 + 48) |= 0x20u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v4[4] = self->_domain;
    *((unsigned char *)v4 + 48) |= 1u;
  }
LABEL_7:
  uint64_t v6 = v4;
  if (self->_activeTreatments)
  {
    objc_msgSend(v4, "setActiveTreatments:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[10] = self->_offeredCount;
    *((unsigned char *)v4 + 48) |= 0x10u;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v6, "setMappingId:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_7:
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_mappingId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2EngagementRatioReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInt:self->_k];
    [v3 setObject:v5 forKey:@"k"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  id v6 = [NSNumber numberWithUnsignedInt:self->_evaluatedCount];
  [v3 setObject:v6 forKey:@"evaluatedCount"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_engagedCount];
  [v3 setObject:v7 forKey:@"engagedCount"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_rejectedCount];
  [v3 setObject:v8 forKey:@"rejectedCount"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t domain = self->_domain;
  if (domain >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_domain);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = off_1E65D99A0[domain];
  }
  [v3 setObject:v10 forKey:@"domain"];

LABEL_15:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v3 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_offeredCount];
    [v3 setObject:v12 forKey:@"offeredCount"];
  }
  mappingId = self->_mappingId;
  if (mappingId) {
    [v3 setObject:mappingId forKey:@"mappingId"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2EngagementRatio;
  id v4 = [(PPM2EngagementRatio *)&v8 description];
  uint64_t v5 = [(PPM2EngagementRatio *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (BOOL)hasOfferedCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasOfferedCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setOfferedCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_offeredCount = a3;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
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
    id v3 = off_1E65D99A0[a3];
  }
  return v3;
}

- (BOOL)hasDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDomain:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t domain = a3;
}

- (int)domain
{
  if (*(unsigned char *)&self->_has) {
    return self->_domain;
  }
  else {
    return 0;
  }
}

- (BOOL)hasRejectedCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasRejectedCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setRejectedCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_rejectedCount = a3;
}

- (BOOL)hasEngagedCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEngagedCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEngagedCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_engagedCount = a3;
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
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasK:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setK:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_k = a3;
}

@end