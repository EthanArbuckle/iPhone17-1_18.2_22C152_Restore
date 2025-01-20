@interface MXItnAlignment
- (BOOL)hasFirstPostItnCharPos;
- (BOOL)hasFirstPreItnTokenIndex;
- (BOOL)hasLastPostItnCharPos;
- (BOOL)hasLastPreItnTokenIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)firstPostItnCharPos;
- (int)firstPreItnTokenIndex;
- (int)lastPostItnCharPos;
- (int)lastPreItnTokenIndex;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFirstPostItnCharPos:(int)a3;
- (void)setFirstPreItnTokenIndex:(int)a3;
- (void)setHasFirstPostItnCharPos:(BOOL)a3;
- (void)setHasFirstPreItnTokenIndex:(BOOL)a3;
- (void)setHasLastPostItnCharPos:(BOOL)a3;
- (void)setHasLastPreItnTokenIndex:(BOOL)a3;
- (void)setLastPostItnCharPos:(int)a3;
- (void)setLastPreItnTokenIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXItnAlignment

- (void)setFirstPreItnTokenIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_firstPreItnTokenIndex = a3;
}

- (void)setHasFirstPreItnTokenIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFirstPreItnTokenIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLastPreItnTokenIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_lastPreItnTokenIndex = a3;
}

- (void)setHasLastPreItnTokenIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLastPreItnTokenIndex
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFirstPostItnCharPos:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_firstPostItnCharPos = a3;
}

- (void)setHasFirstPostItnCharPos:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFirstPostItnCharPos
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLastPostItnCharPos:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_lastPostItnCharPos = a3;
}

- (void)setHasLastPostItnCharPos:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLastPostItnCharPos
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXItnAlignment;
  v4 = [(MXItnAlignment *)&v8 description];
  v5 = [(MXItnAlignment *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_firstPreItnTokenIndex];
    [v3 setObject:v7 forKey:@"first_pre_itn_token_index"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithInt:self->_lastPreItnTokenIndex];
  [v3 setObject:v8 forKey:@"last_pre_itn_token_index"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = [NSNumber numberWithInt:self->_firstPostItnCharPos];
  [v3 setObject:v9 forKey:@"first_post_itn_char_pos"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithInt:self->_lastPostItnCharPos];
    [v3 setObject:v5 forKey:@"last_post_itn_char_pos"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXItnAlignmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_firstPreItnTokenIndex;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_lastPreItnTokenIndex;
  *((unsigned char *)v4 + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[2] = self->_firstPostItnCharPos;
  *((unsigned char *)v4 + 24) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v4[4] = self->_lastPostItnCharPos;
    *((unsigned char *)v4 + 24) |= 4u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_firstPreItnTokenIndex;
    *((unsigned char *)result + 24) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_lastPreItnTokenIndex;
  *((unsigned char *)result + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 2) = self->_firstPostItnCharPos;
  *((unsigned char *)result + 24) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 4) = self->_lastPostItnCharPos;
  *((unsigned char *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_firstPreItnTokenIndex != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_lastPreItnTokenIndex != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_firstPostItnCharPos != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_lastPostItnCharPos != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_firstPreItnTokenIndex;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_lastPreItnTokenIndex;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_firstPostItnCharPos;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_lastPostItnCharPos;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_firstPreItnTokenIndex = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_lastPreItnTokenIndex = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_firstPostItnCharPos = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_5:
    self->_lastPostItnCharPos = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_6:
}

- (int)firstPreItnTokenIndex
{
  return self->_firstPreItnTokenIndex;
}

- (int)lastPreItnTokenIndex
{
  return self->_lastPreItnTokenIndex;
}

- (int)firstPostItnCharPos
{
  return self->_firstPostItnCharPos;
}

- (int)lastPostItnCharPos
{
  return self->_lastPostItnCharPos;
}

@end