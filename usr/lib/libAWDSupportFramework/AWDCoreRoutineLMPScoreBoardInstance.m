@interface AWDCoreRoutineLMPScoreBoardInstance
- (BOOL)hasCorrects;
- (BOOL)hasIncorrects;
- (BOOL)hasInvalids;
- (BOOL)hasKeyword;
- (BOOL)hasUnknowns;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)keyword;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)corrects;
- (int)incorrects;
- (int)invalids;
- (int)unknowns;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCorrects:(int)a3;
- (void)setHasCorrects:(BOOL)a3;
- (void)setHasIncorrects:(BOOL)a3;
- (void)setHasInvalids:(BOOL)a3;
- (void)setHasUnknowns:(BOOL)a3;
- (void)setIncorrects:(int)a3;
- (void)setInvalids:(int)a3;
- (void)setKeyword:(id)a3;
- (void)setUnknowns:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLMPScoreBoardInstance

- (void)dealloc
{
  [(AWDCoreRoutineLMPScoreBoardInstance *)self setKeyword:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPScoreBoardInstance;
  [(AWDCoreRoutineLMPScoreBoardInstance *)&v3 dealloc];
}

- (BOOL)hasKeyword
{
  return self->_keyword != 0;
}

- (void)setCorrects:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_corrects = a3;
}

- (void)setHasCorrects:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCorrects
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIncorrects:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_incorrects = a3;
}

- (void)setHasIncorrects:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIncorrects
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUnknowns:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unknowns = a3;
}

- (void)setHasUnknowns:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUnknowns
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setInvalids:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_invalids = a3;
}

- (void)setHasInvalids:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInvalids
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPScoreBoardInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLMPScoreBoardInstance description](&v3, sel_description), -[AWDCoreRoutineLMPScoreBoardInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  keyword = self->_keyword;
  if (keyword) {
    [v3 setObject:keyword forKey:@"keyword"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v4 setObject:[NSNumber numberWithInt:self->_corrects] forKey:@"corrects"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      [v4 setObject:[NSNumber numberWithInt:self->_unknowns] forKey:@"unknowns"];
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return v4;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[NSNumber numberWithInt:self->_incorrects] forKey:@"incorrects"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 4) != 0) {
LABEL_7:
  }
    [v4 setObject:[NSNumber numberWithInt:self->_invalids] forKey:@"invalids"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPScoreBoardInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_keyword) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
LABEL_10:
      PBDataWriterWriteInt32Field();
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_10;
  }
LABEL_6:
  if ((has & 4) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if (self->_keyword) {
    [a3 setKeyword:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_corrects;
    *((unsigned char *)a3 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 3) = self->_incorrects;
  *((unsigned char *)a3 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
LABEL_11:
  *((_DWORD *)a3 + 8) = self->_unknowns;
  *((unsigned char *)a3 + 36) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_7:
  *((_DWORD *)a3 + 4) = self->_invalids;
  *((unsigned char *)a3 + 36) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 24) = [(NSString *)self->_keyword copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_corrects;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 32) = self->_unknowns;
      *(unsigned char *)(v5 + 36) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 12) = self->_incorrects;
  *(unsigned char *)(v5 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 16) = self->_invalids;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    keyword = self->_keyword;
    if (!((unint64_t)keyword | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](keyword, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_corrects != *((_DWORD *)a3 + 2)) {
          goto LABEL_23;
        }
      }
      else if (*((unsigned char *)a3 + 36))
      {
LABEL_23:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_incorrects != *((_DWORD *)a3 + 3)) {
          goto LABEL_23;
        }
      }
      else if ((*((unsigned char *)a3 + 36) & 2) != 0)
      {
        goto LABEL_23;
      }
      if ((*(unsigned char *)&self->_has & 8) != 0)
      {
        if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_unknowns != *((_DWORD *)a3 + 8)) {
          goto LABEL_23;
        }
      }
      else if ((*((unsigned char *)a3 + 36) & 8) != 0)
      {
        goto LABEL_23;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 4) == 0;
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_invalids != *((_DWORD *)a3 + 4)) {
          goto LABEL_23;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_keyword hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_corrects;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_incorrects;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_unknowns;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_invalids;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[AWDCoreRoutineLMPScoreBoardInstance setKeyword:](self, "setKeyword:");
  }
  char v5 = *((unsigned char *)a3 + 36);
  if (v5)
  {
    self->_corrects = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_incorrects = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
LABEL_11:
  self->_unknowns = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 36) & 4) == 0) {
    return;
  }
LABEL_7:
  self->_invalids = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 4u;
}

- (NSString)keyword
{
  return self->_keyword;
}

- (void)setKeyword:(id)a3
{
}

- (int)corrects
{
  return self->_corrects;
}

- (int)incorrects
{
  return self->_incorrects;
}

- (int)unknowns
{
  return self->_unknowns;
}

- (int)invalids
{
  return self->_invalids;
}

@end