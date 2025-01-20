@interface COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo
- (BOOL)hasContentRating;
- (BOOL)hasRelevanceRating;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)contentRatingAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)relevanceRatingAsString:(int)a3;
- (int)StringAsContentRating:(id)a3;
- (int)StringAsRelevanceRating:(id)a3;
- (int)contentRating;
- (int)relevanceRating;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentRating:(int)a3;
- (void)setHasContentRating:(BOOL)a3;
- (void)setHasRelevanceRating:(BOOL)a3;
- (void)setRelevanceRating:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo

- (int)contentRating
{
  if (*(unsigned char *)&self->_has) {
    return self->_contentRating;
  }
  else {
    return 0;
  }
}

- (void)setContentRating:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contentRating = a3;
}

- (void)setHasContentRating:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentRating
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)contentRatingAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264448690[a3];
  }

  return v3;
}

- (int)StringAsContentRating:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONTENT_RATING"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EXCELLENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GREAT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GOOD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"OK"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ADEQUATE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)relevanceRating
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_relevanceRating;
  }
  else {
    return 0;
  }
}

- (void)setRelevanceRating:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_relevanceRating = a3;
}

- (void)setHasRelevanceRating:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRelevanceRating
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)relevanceRatingAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_2644486C0[a3];
  }

  return v3;
}

- (int)StringAsRelevanceRating:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_RELEVANCE_RATING"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNIVERSAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BROAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NATIONAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPECIAL_INTEREST"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"REGIONAL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NICHE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LOCAL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AVAILABLE"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo;
  int v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t contentRating = self->_contentRating;
    if (contentRating >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_contentRating);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_264448690[contentRating];
    }
    [v3 setObject:v6 forKey:@"content_rating"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t relevanceRating = self->_relevanceRating;
    if (relevanceRating >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_relevanceRating);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_2644486C0[relevanceRating];
    }
    [v3 setObject:v8 forKey:@"relevance_rating"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_contentRating;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_relevanceRating;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_contentRating;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_relevanceRating;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_contentRating != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_relevanceRating != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_contentRating;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_relevanceRating;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_uint64_t contentRating = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_uint64_t relevanceRating = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

@end