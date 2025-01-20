@interface NACVolumeWarningMessage
- (BOOL)hasCategory;
- (BOOL)hasOriginIdentifier;
- (BOOL)hasVolumeWarningEnabled;
- (BOOL)hasVolumeWarningState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)volumeWarningEnabled;
- (NSString)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originIdentifier;
- (int)volumeWarningState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(id)a3;
- (void)setHasOriginIdentifier:(BOOL)a3;
- (void)setHasVolumeWarningEnabled:(BOOL)a3;
- (void)setHasVolumeWarningState:(BOOL)a3;
- (void)setOriginIdentifier:(int)a3;
- (void)setVolumeWarningEnabled:(BOOL)a3;
- (void)setVolumeWarningState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NACVolumeWarningMessage

- (void)setVolumeWarningEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_volumeWarningEnabled = a3;
}

- (void)setHasVolumeWarningEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVolumeWarningEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (void)setOriginIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_originIdentifier = a3;
}

- (void)setHasOriginIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVolumeWarningState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_volumeWarningState = a3;
}

- (void)setHasVolumeWarningState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVolumeWarningState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NACVolumeWarningMessage;
  v4 = [(NACVolumeWarningMessage *)&v8 description];
  v5 = [(NACVolumeWarningMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_volumeWarningEnabled];
    [v3 setObject:v4 forKey:@"volumeWarningEnabled"];
  }
  category = self->_category;
  if (category) {
    [v3 setObject:category forKey:@"category"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithInt:self->_originIdentifier];
    [v3 setObject:v7 forKey:@"originIdentifier"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_volumeWarningState];
    [v3 setObject:v8 forKey:@"volumeWarningState"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NACVolumeWarningMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_category) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[24] = self->_volumeWarningEnabled;
    v4[28] |= 4u;
  }
  if (self->_category)
  {
    v6 = v4;
    objc_msgSend(v4, "setCategory:");
    v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_originIdentifier;
    v4[28] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_volumeWarningState;
    v4[28] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_volumeWarningEnabled;
    *(unsigned char *)(v5 + 28) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_category copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v6 + 16) = self->_originIdentifier;
    *(unsigned char *)(v6 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_volumeWarningState;
    *(unsigned char *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0) {
      goto LABEL_22;
    }
    if (self->_volumeWarningEnabled)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_22;
  }
  category = self->_category;
  if (!((unint64_t)category | *((void *)v4 + 1))) {
    goto LABEL_13;
  }
  if (!-[NSString isEqual:](category, "isEqual:"))
  {
LABEL_22:
    BOOL v7 = 0;
    goto LABEL_23;
  }
  char has = (char)self->_has;
LABEL_13:
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_originIdentifier != *((_DWORD *)v4 + 4)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_22;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_volumeWarningState != *((_DWORD *)v4 + 5)) {
      goto LABEL_22;
    }
    BOOL v7 = 1;
  }
LABEL_23:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_volumeWarningEnabled;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_category hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_originIdentifier;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_volumeWarningState;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    self->_volumeWarningEnabled = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[NACVolumeWarningMessage setCategory:](self, "setCategory:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_originIdentifier = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if ((v5 & 2) != 0)
  {
    self->_volumeWarningState = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (BOOL)volumeWarningEnabled
{
  return self->_volumeWarningEnabled;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (int)originIdentifier
{
  return self->_originIdentifier;
}

- (int)volumeWarningState
{
  return self->_volumeWarningState;
}

- (void).cxx_destruct
{
}

@end