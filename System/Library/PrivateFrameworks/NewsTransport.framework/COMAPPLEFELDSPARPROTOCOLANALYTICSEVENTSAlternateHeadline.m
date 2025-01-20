@interface COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline
- (BOOL)hasArticleHeadlineTreatmentId;
- (BOOL)hasArticleHeadlineTreatmentState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)articleHeadlineTreatmentStateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsArticleHeadlineTreatmentState:(id)a3;
- (int)articleHeadlineTreatmentId;
- (int)articleHeadlineTreatmentState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArticleHeadlineTreatmentId:(int)a3;
- (void)setArticleHeadlineTreatmentState:(int)a3;
- (void)setHasArticleHeadlineTreatmentId:(BOOL)a3;
- (void)setHasArticleHeadlineTreatmentState:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline

- (int)articleHeadlineTreatmentState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_articleHeadlineTreatmentState;
  }
  else {
    return 0;
  }
}

- (void)setArticleHeadlineTreatmentState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_articleHeadlineTreatmentState = a3;
}

- (void)setHasArticleHeadlineTreatmentState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasArticleHeadlineTreatmentState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)articleHeadlineTreatmentStateAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444F3E0[a3];
  }

  return v3;
}

- (int)StringAsArticleHeadlineTreatmentState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ARTICLE_HEADLINE_TREATMENT_STATE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEFAULT_ARTICLE_HEADLINE_TREATMENT_STATE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONTROL_ARTICLE_HEADLINE_TREATMENT_STATE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TEST_ARTICLE_HEADLINE_TREATMENT_STATE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WINNER_ARTICLE_HEADLINE_TREATMENT_STATE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WINNER_DEFAULT_ARTICLE_HEADLINE_TREATMENT_STATE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"WINNER_ALTERNATE_ARTICLE_HEADLINE_TREATMENT_STATE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setArticleHeadlineTreatmentId:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_articleHeadlineTreatmentId = a3;
}

- (void)setHasArticleHeadlineTreatmentId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleHeadlineTreatmentId
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline;
  int v4 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t articleHeadlineTreatmentState = self->_articleHeadlineTreatmentState;
    if (articleHeadlineTreatmentState >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleHeadlineTreatmentState);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_26444F3E0[articleHeadlineTreatmentState];
    }
    [v3 setObject:v6 forKey:@"article_headline_treatment_state"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v7 = [NSNumber numberWithInt:self->_articleHeadlineTreatmentId];
    [v3 setObject:v7 forKey:@"article_headline_treatment_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadlineReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_articleHeadlineTreatmentState;
    *((unsigned char *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_articleHeadlineTreatmentId;
    *((unsigned char *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_articleHeadlineTreatmentState;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_articleHeadlineTreatmentId;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_articleHeadlineTreatmentState != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_articleHeadlineTreatmentId != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_articleHeadlineTreatmentState;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_articleHeadlineTreatmentId;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t articleHeadlineTreatmentState = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_articleHeadlineTreatmentId = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int)articleHeadlineTreatmentId
{
  return self->_articleHeadlineTreatmentId;
}

@end