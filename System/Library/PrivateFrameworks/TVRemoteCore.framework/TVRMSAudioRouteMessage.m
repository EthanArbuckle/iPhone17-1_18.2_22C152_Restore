@interface TVRMSAudioRouteMessage
- (BOOL)hasDisplayName;
- (BOOL)hasMacAddress;
- (BOOL)hasSelected;
- (BOOL)hasSupportsVideo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)selected;
- (BOOL)supportsVideo;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)macAddress;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasMacAddress:(BOOL)a3;
- (void)setHasSelected:(BOOL)a3;
- (void)setHasSupportsVideo:(BOOL)a3;
- (void)setMacAddress:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSupportsVideo:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation TVRMSAudioRouteMessage

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setMacAddress:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_macAddress = a3;
}

- (void)setHasMacAddress:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMacAddress
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSupportsVideo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportsVideo = a3;
}

- (void)setHasSupportsVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsVideo
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSelected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_selected = a3;
}

- (void)setHasSelected:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSelected
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVRMSAudioRouteMessage;
  v4 = [(TVRMSAudioRouteMessage *)&v8 description];
  v5 = [(TVRMSAudioRouteMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"displayName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithLongLong:self->_macAddress];
    [v4 setObject:v9 forKey:@"macAddress"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithBool:self->_supportsVideo];
  [v4 setObject:v10 forKey:@"supportsVideo"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithBool:self->_selected];
    [v4 setObject:v7 forKey:@"selected"];
  }
LABEL_7:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSAudioRouteMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_displayName)
  {
    id v6 = v4;
    objc_msgSend(v4, "setDisplayName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_macAddress;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 25) = self->_supportsVideo;
  *((unsigned char *)v4 + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 24) = self->_selected;
    *((unsigned char *)v4 + 28) |= 2u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_displayName copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 25) = self->_supportsVideo;
    *(unsigned char *)(v5 + 28) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 8) = self->_macAddress;
  *(unsigned char *)(v5 + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 24) = self->_selected;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[28] & 1) == 0 || self->_macAddress != *((void *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (v4[28])
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[28] & 4) == 0 || self->_supportsVideo != v4[25]) {
      goto LABEL_18;
    }
  }
  else if ((v4[28] & 4) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (v4[28] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[28] & 2) == 0 || self->_selected != v4[24]) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_macAddress;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_supportsVideo;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_selected;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[TVRMSAudioRouteMessage setDisplayName:](self, "setDisplayName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_macAddress = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_supportsVideo = *((unsigned char *)v4 + 25);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_6:
    self->_selected = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (int64_t)macAddress
{
  return self->_macAddress;
}

- (BOOL)supportsVideo
{
  return self->_supportsVideo;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void).cxx_destruct
{
}

@end