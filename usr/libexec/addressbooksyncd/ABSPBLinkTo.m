@interface ABSPBLinkTo
- (BOOL)hasIsImage;
- (BOOL)hasIsName;
- (BOOL)hasToGuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImage;
- (BOOL)isName;
- (BOOL)readFrom:(id)a3;
- (NSString)toGuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsImage:(BOOL)a3;
- (void)setHasIsName:(BOOL)a3;
- (void)setIsImage:(BOOL)a3;
- (void)setIsName:(BOOL)a3;
- (void)setToGuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBLinkTo

- (BOOL)hasToGuid
{
  return self->_toGuid != 0;
}

- (void)setIsImage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isImage = a3;
}

- (void)setHasIsImage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsImage
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsName:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isName = a3;
}

- (void)setHasIsName:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsName
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBLinkTo;
  char v3 = [(ABSPBLinkTo *)&v7 description];
  v4 = [(ABSPBLinkTo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  toGuid = self->_toGuid;
  if (toGuid) {
    [v3 setObject:toGuid forKey:@"toGuid"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_isImage];
    [v4 setObject:v7 forKey:@"isImage"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_isName];
    [v4 setObject:v8 forKey:@"isName"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBLinkToReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_toGuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_toGuid)
  {
    id v6 = v4;
    [v4 setToGuid:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[16] = self->_isImage;
    v4[20] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[17] = self->_isName;
    v4[20] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_toGuid copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  char has = (char)self->_has;
  if (has)
  {
    *((unsigned char *)v5 + 16) = self->_isImage;
    *((unsigned char *)v5 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 17) = self->_isName;
    *((unsigned char *)v5 + 20) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  toGuid = self->_toGuid;
  if ((unint64_t)toGuid | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](toGuid, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0) {
      goto LABEL_14;
    }
    if (self->_isImage)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) != 0)
    {
      if (self->_isName)
      {
        if (!*((unsigned char *)v4 + 17)) {
          goto LABEL_14;
        }
      }
      else if (*((unsigned char *)v4 + 17))
      {
        goto LABEL_14;
      }
      BOOL v6 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v6 = 0;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_toGuid hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_isImage;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isName;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    BOOL v6 = v4;
    -[ABSPBLinkTo setToGuid:](self, "setToGuid:");
    uint64_t v4 = v6;
  }
  BOOL v5 = v4[20];
  if (v5)
  {
    self->_isImage = v4[16];
    *(unsigned char *)&self->_has |= 1u;
    BOOL v5 = v4[20];
  }
  if ((v5 & 2) != 0)
  {
    self->_isName = v4[17];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)toGuid
{
  return self->_toGuid;
}

- (void)setToGuid:(id)a3
{
}

- (BOOL)isImage
{
  return self->_isImage;
}

- (BOOL)isName
{
  return self->_isName;
}

- (void).cxx_destruct
{
}

@end