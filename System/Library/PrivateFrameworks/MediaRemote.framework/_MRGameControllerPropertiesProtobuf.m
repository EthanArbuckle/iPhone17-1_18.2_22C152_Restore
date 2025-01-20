@interface _MRGameControllerPropertiesProtobuf
- (BOOL)hasButtonAUpDelay;
- (BOOL)hasPlayerIndex;
- (BOOL)hasProfile;
- (BOOL)hasSupportsExtendedMotion;
- (BOOL)hasVendorName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsExtendedMotion;
- (NSString)vendorName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)profileAsString:(int)a3;
- (int)StringAsProfile:(id)a3;
- (int)buttonAUpDelay;
- (int)profile;
- (unint64_t)hash;
- (unsigned)playerIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setButtonAUpDelay:(int)a3;
- (void)setHasButtonAUpDelay:(BOOL)a3;
- (void)setHasPlayerIndex:(BOOL)a3;
- (void)setHasProfile:(BOOL)a3;
- (void)setHasSupportsExtendedMotion:(BOOL)a3;
- (void)setPlayerIndex:(unsigned int)a3;
- (void)setProfile:(int)a3;
- (void)setSupportsExtendedMotion:(BOOL)a3;
- (void)setVendorName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGameControllerPropertiesProtobuf

- (void)setPlayerIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_playerIndex = a3;
}

- (void)setHasPlayerIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlayerIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasVendorName
{
  return self->_vendorName != 0;
}

- (void)setButtonAUpDelay:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_buttonAUpDelay = a3;
}

- (void)setHasButtonAUpDelay:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasButtonAUpDelay
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)profile
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_profile;
  }
  else {
    return 0;
  }
}

- (void)setProfile:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_profile = a3;
}

- (void)setHasProfile:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProfile
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)profileAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E57DA550[a3];
  }

  return v3;
}

- (int)StringAsProfile:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"B239"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Extended"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSupportsExtendedMotion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_supportsExtendedMotion = a3;
}

- (void)setHasSupportsExtendedMotion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsExtendedMotion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGameControllerPropertiesProtobuf;
  int v4 = [(_MRGameControllerPropertiesProtobuf *)&v8 description];
  v5 = [(_MRGameControllerPropertiesProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v4 = [NSNumber numberWithUnsignedInt:self->_playerIndex];
    [v3 setObject:v4 forKey:@"playerIndex"];
  }
  vendorName = self->_vendorName;
  if (vendorName) {
    [v3 setObject:vendorName forKey:@"vendorName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithInt:self->_buttonAUpDelay];
    [v3 setObject:v9 forKey:@"buttonAUpDelay"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  uint64_t profile = self->_profile;
  if (profile >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_profile);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E57DA550[profile];
  }
  [v3 setObject:v11 forKey:@"profile"];

  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_8:
  v7 = [NSNumber numberWithBool:self->_supportsExtendedMotion];
  [v3 setObject:v7 forKey:@"supportsExtendedMotion"];

LABEL_9:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerPropertiesProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_vendorName) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[3] = self->_playerIndex;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  if (self->_vendorName)
  {
    v6 = v4;
    objc_msgSend(v4, "setVendorName:");
    int v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_buttonAUpDelay;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v4[4] = self->_profile;
  *((unsigned char *)v4 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 32) = self->_supportsExtendedMotion;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_playerIndex;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_vendorName copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 16) = self->_profile;
    *(unsigned char *)(v6 + 36) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 8) = self->_buttonAUpDelay;
  *(unsigned char *)(v6 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(unsigned char *)(v6 + 32) = self->_supportsExtendedMotion;
    *(unsigned char *)(v6 + 36) |= 8u;
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
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_playerIndex != *((_DWORD *)v4 + 3)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_22;
  }
  vendorName = self->_vendorName;
  if ((unint64_t)vendorName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](vendorName, "isEqual:")) {
      goto LABEL_22;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_buttonAUpDelay != *((_DWORD *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_22;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_profile != *((_DWORD *)v4 + 4)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_22;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) != 0)
    {
      if (self->_supportsExtendedMotion)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_22;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_22;
      }
      BOOL v7 = 1;
      goto LABEL_23;
    }
LABEL_22:
    BOOL v7 = 0;
  }
LABEL_23:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_playerIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_vendorName hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_buttonAUpDelay;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_profile;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_supportsExtendedMotion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    self->_playerIndex = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[_MRGameControllerPropertiesProtobuf setVendorName:](self, "setVendorName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_buttonAUpDelay = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_uint64_t profile = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_8:
    self->_supportsExtendedMotion = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_9:
}

- (unsigned)playerIndex
{
  return self->_playerIndex;
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
}

- (int)buttonAUpDelay
{
  return self->_buttonAUpDelay;
}

- (BOOL)supportsExtendedMotion
{
  return self->_supportsExtendedMotion;
}

- (void).cxx_destruct
{
}

@end