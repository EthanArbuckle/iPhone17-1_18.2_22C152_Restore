@interface NACVolumeControlAvailabilityMessage
- (BOOL)hasCategory;
- (BOOL)hasOriginIdentifier;
- (BOOL)hasVolumeControlAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)volumeControlAvailable;
- (NSString)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(id)a3;
- (void)setHasOriginIdentifier:(BOOL)a3;
- (void)setHasVolumeControlAvailable:(BOOL)a3;
- (void)setOriginIdentifier:(int)a3;
- (void)setVolumeControlAvailable:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NACVolumeControlAvailabilityMessage

- (void)setVolumeControlAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_volumeControlAvailable = a3;
}

- (void)setHasVolumeControlAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVolumeControlAvailable
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NACVolumeControlAvailabilityMessage;
  v4 = [(NACVolumeControlAvailabilityMessage *)&v8 description];
  v5 = [(NACVolumeControlAvailabilityMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_volumeControlAvailable];
    [v3 setObject:v4 forKey:@"volumeControlAvailable"];
  }
  category = self->_category;
  if (category) {
    [v3 setObject:category forKey:@"category"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_originIdentifier];
    [v3 setObject:v6 forKey:@"originIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NACVolumeControlAvailabilityMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_category)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[20] = self->_volumeControlAvailable;
    v4[24] |= 2u;
  }
  if (self->_category)
  {
    id v5 = v4;
    objc_msgSend(v4, "setCategory:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_originIdentifier;
    v4[24] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 20) = self->_volumeControlAvailable;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_category copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 16) = self->_originIdentifier;
    *(unsigned char *)(v6 + 24) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0) {
      goto LABEL_17;
    }
    if (self->_volumeControlAvailable)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_17;
  }
  category = self->_category;
  if (!((unint64_t)category | *((void *)v4 + 1))) {
    goto LABEL_13;
  }
  if (!-[NSString isEqual:](category, "isEqual:"))
  {
LABEL_17:
    BOOL v7 = 0;
    goto LABEL_18;
  }
  char has = (char)self->_has;
LABEL_13:
  BOOL v7 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_originIdentifier != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
    BOOL v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_volumeControlAvailable;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_category hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_originIdentifier;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    self->_volumeControlAvailable = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[NACVolumeControlAvailabilityMessage setCategory:](self, "setCategory:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 24))
  {
    self->_originIdentifier = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)volumeControlAvailable
{
  return self->_volumeControlAvailable;
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

- (void).cxx_destruct
{
}

@end