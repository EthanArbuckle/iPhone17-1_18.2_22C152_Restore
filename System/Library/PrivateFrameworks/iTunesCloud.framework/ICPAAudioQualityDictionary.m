@interface ICPAAudioQualityDictionary
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setChannelLayoutDescription:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ICPAAudioQualityDictionary

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_bitRate;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_bitDepth;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_channelLayoutDescription hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  }
  uint64_t v6 = 2654435761 * self->_codec;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_sampleRate;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_isSpatialized;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_bitRate != *((void *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_bitDepth != *((void *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_27;
  }
  channelLayoutDescription = self->_channelLayoutDescription;
  if ((unint64_t)channelLayoutDescription | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](channelLayoutDescription, "isEqual:")) {
      goto LABEL_27;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 48);
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_codec != *((_DWORD *)v4 + 10)) {
      goto LABEL_27;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_sampleRate != *((void *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_27;
  }
  BOOL v8 = (v6 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_isSpatialized)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_27;
        }
      }
      else if (*((unsigned char *)v4 + 44))
      {
        goto LABEL_27;
      }
      BOOL v8 = 1;
      goto LABEL_28;
    }
LABEL_27:
    BOOL v8 = 0;
  }
LABEL_28:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_bitRate;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_bitDepth;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_channelLayoutDescription copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *(void *)(v6 + 24) = self->_sampleRate;
    *(unsigned char *)(v6 + 48) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 40) = self->_codec;
  *(unsigned char *)(v6 + 48) |= 8u;
  char v10 = (char)self->_has;
  if ((v10 & 4) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((v10 & 0x10) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 44) = self->_isSpatialized;
    *(unsigned char *)(v6 + 48) |= 0x10u;
  }
  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_channelLayoutDescription) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return ICPAAudioQualityDictionaryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    char v5 = [NSNumber numberWithLongLong:self->_bitRate];
    [v3 setObject:v5 forKey:@"bitRate"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v6 = [NSNumber numberWithLongLong:self->_bitDepth];
    [v3 setObject:v6 forKey:@"bitDepth"];
  }
  channelLayoutDescription = self->_channelLayoutDescription;
  if (channelLayoutDescription) {
    [v3 setObject:channelLayoutDescription forKey:@"channelLayoutDescription"];
  }
  char v8 = (char)self->_has;
  if ((v8 & 8) != 0)
  {
    v11 = [NSNumber numberWithUnsignedInt:self->_codec];
    [v3 setObject:v11 forKey:@"codec"];

    char v8 = (char)self->_has;
    if ((v8 & 4) == 0)
    {
LABEL_9:
      if ((v8 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  v12 = [NSNumber numberWithLongLong:self->_sampleRate];
  [v3 setObject:v12 forKey:@"sampleRate"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    v9 = [NSNumber numberWithBool:self->_isSpatialized];
    [v3 setObject:v9 forKey:@"isSpatialized"];
  }
LABEL_11:

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICPAAudioQualityDictionary;
  id v4 = [(ICPAAudioQualityDictionary *)&v8 description];
  char v5 = [(ICPAAudioQualityDictionary *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setChannelLayoutDescription:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

@end