@interface APPBAdSize
+ (id)options;
- (BOOL)hasHeightInset;
- (BOOL)hasLockAspectRatio;
- (BOOL)hasWidthInset;
- (BOOL)isEqual:(id)a3;
- (BOOL)lockAspectRatio;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)height;
- (int)heightInset;
- (int)width;
- (int)widthInset;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeightInset:(BOOL)a3;
- (void)setHasLockAspectRatio:(BOOL)a3;
- (void)setHasWidthInset:(BOOL)a3;
- (void)setHeight:(int)a3;
- (void)setHeightInset:(int)a3;
- (void)setLockAspectRatio:(BOOL)a3;
- (void)setWidth:(int)a3;
- (void)setWidthInset:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdSize

+ (id)options
{
  if (qword_100289798 != -1) {
    dispatch_once(&qword_100289798, &stru_100234E90);
  }
  v2 = (void *)qword_100289790;

  return v2;
}

- (void)setWidthInset:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_widthInset = a3;
}

- (void)setHasWidthInset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidthInset
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHeightInset:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_heightInset = a3;
}

- (void)setHasHeightInset:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeightInset
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLockAspectRatio:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_lockAspectRatio = a3;
}

- (void)setHasLockAspectRatio:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLockAspectRatio
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdSize;
  char v3 = [(APPBAdSize *)&v7 description];
  v4 = [(APPBAdSize *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithInt:self->_width];
  [v3 setObject:v4 forKey:@"width"];

  v5 = +[NSNumber numberWithInt:self->_height];
  [v3 setObject:v5 forKey:@"height"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = +[NSNumber numberWithInt:self->_widthInset];
    [v3 setObject:v9 forKey:@"widthInset"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v10 = +[NSNumber numberWithInt:self->_heightInset];
  [v3 setObject:v10 forKey:@"heightInset"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_super v7 = +[NSNumber numberWithBool:self->_lockAspectRatio];
    [v3 setObject:v7 forKey:@"lockAspectRatio"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdSizeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[4] = self->_width;
  v4[2] = self->_height;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_widthInset;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_heightInset;
  *((unsigned char *)v4 + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 24) = self->_lockAspectRatio;
    *((unsigned char *)v4 + 28) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 4) = self->_width;
  *((_DWORD *)result + 2) = self->_height;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 5) = self->_widthInset;
    *((unsigned char *)result + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_heightInset;
  *((unsigned char *)result + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 24) = self->_lockAspectRatio;
  *((unsigned char *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_width != *((_DWORD *)v4 + 4)
    || self->_height != *((_DWORD *)v4 + 2))
  {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_widthInset != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_heightInset != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0)
    {
LABEL_16:
      BOOL v5 = 0;
      goto LABEL_17;
    }
    if (self->_lockAspectRatio)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v2 = 2654435761 * self->_widthInset;
  }
  else {
    uint64_t v2 = 0;
  }
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_heightInset;
  }
  else {
    uint64_t v3 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_lockAspectRatio;
  }
  else {
    uint64_t v4 = 0;
  }
  return (2654435761 * self->_height) ^ (2654435761 * self->_width) ^ v2 ^ v3 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_width = *((_DWORD *)v4 + 4);
  self->_height = *((_DWORD *)v4 + 2);
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_widthInset = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_heightInset = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_4:
    self->_lockAspectRatio = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)widthInset
{
  return self->_widthInset;
}

- (int)heightInset
{
  return self->_heightInset;
}

- (BOOL)lockAspectRatio
{
  return self->_lockAspectRatio;
}

@end