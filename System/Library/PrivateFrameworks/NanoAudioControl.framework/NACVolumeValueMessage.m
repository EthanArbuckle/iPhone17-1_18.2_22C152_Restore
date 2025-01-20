@interface NACVolumeValueMessage
- (BOOL)hasCategory;
- (BOOL)hasOriginIdentifier;
- (BOOL)hasVolumeValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)category;
- (float)volumeValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(id)a3;
- (void)setHasOriginIdentifier:(BOOL)a3;
- (void)setHasVolumeValue:(BOOL)a3;
- (void)setOriginIdentifier:(int)a3;
- (void)setVolumeValue:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation NACVolumeValueMessage

- (void)setVolumeValue:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_volumeValue = a3;
}

- (void)setHasVolumeValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVolumeValue
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
  v8.super_class = (Class)NACVolumeValueMessage;
  v4 = [(NACVolumeValueMessage *)&v8 description];
  v5 = [(NACVolumeValueMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(float *)&double v4 = self->_volumeValue;
    v5 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v5 forKey:@"volumeValue"];
  }
  category = self->_category;
  if (category) {
    [v3 setObject:category forKey:@"category"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithInt:self->_originIdentifier];
    [v3 setObject:v7 forKey:@"originIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NACVolumeValueMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
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
    v4[5] = LODWORD(self->_volumeValue);
    *((unsigned char *)v4 + 24) |= 2u;
  }
  if (self->_category)
  {
    id v5 = v4;
    objc_msgSend(v4, "setCategory:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_originIdentifier;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(float *)(v5 + 20) = self->_volumeValue;
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
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_volumeValue != *((float *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  category = self->_category;
  if ((unint64_t)category | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](category, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_originIdentifier != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    float volumeValue = self->_volumeValue;
    float v5 = -volumeValue;
    if (volumeValue >= 0.0) {
      float v5 = self->_volumeValue;
    }
    float v6 = floorf(v5 + 0.5);
    float v7 = (float)(v5 - v6) * 1.8447e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabsf(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_category hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_originIdentifier;
  }
  else {
    uint64_t v9 = 0;
  }
  return v8 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    self->_float volumeValue = *((float *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[NACVolumeValueMessage setCategory:](self, "setCategory:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 24))
  {
    self->_originIdentifier = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (float)volumeValue
{
  return self->_volumeValue;
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