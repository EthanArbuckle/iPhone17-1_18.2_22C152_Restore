@interface UWLSectionInfo
- (BOOL)hasIsDone;
- (BOOL)hasLengthInMilliseconds;
- (BOOL)hasPassThrough;
- (BOOL)hasPlayheadInMilliseconds;
- (BOOL)isDone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)passThrough;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)lengthInMilliseconds;
- (int64_t)playheadInMilliseconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsDone:(BOOL)a3;
- (void)setHasLengthInMilliseconds:(BOOL)a3;
- (void)setHasPlayheadInMilliseconds:(BOOL)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setLengthInMilliseconds:(int64_t)a3;
- (void)setPassThrough:(id)a3;
- (void)setPlayheadInMilliseconds:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLSectionInfo

- (void)setIsDone:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isDone = a3;
}

- (void)setHasIsDone:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsDone
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPlayheadInMilliseconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_playheadInMilliseconds = a3;
}

- (void)setHasPlayheadInMilliseconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlayheadInMilliseconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLengthInMilliseconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lengthInMilliseconds = a3;
}

- (void)setHasLengthInMilliseconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLengthInMilliseconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPassThrough
{
  return self->_passThrough != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UWLSectionInfo;
  char v3 = [(UWLSectionInfo *)&v7 description];
  v4 = [(UWLSectionInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_isDone];
    [v3 setObject:v8 forKey:@"is_done"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v9 = +[NSNumber numberWithLongLong:self->_playheadInMilliseconds];
  [v3 setObject:v9 forKey:@"playhead_in_milliseconds"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = +[NSNumber numberWithLongLong:self->_lengthInMilliseconds];
    [v3 setObject:v5 forKey:@"length_in_milliseconds"];
  }
LABEL_5:
  passThrough = self->_passThrough;
  if (passThrough) {
    [v3 setObject:passThrough forKey:@"pass_through"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return UWLSectionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_passThrough)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[32] = self->_isDone;
    v4[36] |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 2) = self->_playheadInMilliseconds;
  v4[36] |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)v4 + 1) = self->_lengthInMilliseconds;
    v4[36] |= 1u;
  }
LABEL_5:
  if (self->_passThrough)
  {
    id v6 = v4;
    objc_msgSend(v4, "setPassThrough:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    v5[2] = self->_playheadInMilliseconds;
    *((unsigned char *)v5 + 36) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((unsigned char *)v5 + 32) = self->_isDone;
  *((unsigned char *)v5 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    v5[1] = self->_lengthInMilliseconds;
    *((unsigned char *)v5 + 36) |= 1u;
  }
LABEL_5:
  id v8 = [(NSString *)self->_passThrough copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) != 0)
    {
      if (self->_isDone)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_22;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
LABEL_22:
    unsigned __int8 v6 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 36) & 4) != 0) {
    goto LABEL_22;
  }
LABEL_10:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_playheadInMilliseconds != *((void *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_lengthInMilliseconds != *((void *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_22;
  }
  passThrough = self->_passThrough;
  if ((unint64_t)passThrough | *((void *)v4 + 3)) {
    unsigned __int8 v6 = -[NSString isEqual:](passThrough, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSString *)self->_passThrough hash];
  }
  uint64_t v2 = 2654435761 * self->_isDone;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_playheadInMilliseconds;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_lengthInMilliseconds;
  return v3 ^ v2 ^ v4 ^ [(NSString *)self->_passThrough hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_isDone = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_playheadInMilliseconds = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 36))
  {
LABEL_4:
    self->_lengthInMilliseconds = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[UWLSectionInfo setPassThrough:](self, "setPassThrough:");
    id v4 = v6;
  }
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (int64_t)playheadInMilliseconds
{
  return self->_playheadInMilliseconds;
}

- (int64_t)lengthInMilliseconds
{
  return self->_lengthInMilliseconds;
}

- (NSString)passThrough
{
  return self->_passThrough;
}

- (void)setPassThrough:(id)a3
{
}

- (void).cxx_destruct
{
}

@end