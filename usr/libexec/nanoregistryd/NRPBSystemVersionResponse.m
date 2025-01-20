@interface NRPBSystemVersionResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBSystemVersionResponse

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBSystemVersionResponse;
  v3 = [(NRPBSystemVersionResponse *)&v7 description];
  v4 = [(NRPBSystemVersionResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v8 = +[NSNumber numberWithInt:self->_pairingCompatibilityVersion];
    [v3 setObject:v8 forKey:@"pairingCompatibilityVersion"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v9 = +[NSNumber numberWithInt:self->_maxPairingCompatibilityVersion];
  [v3 setObject:v9 forKey:@"maxPairingCompatibilityVersion"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = +[NSNumber numberWithInt:self->_minPairingCompatibilityVersion];
  [v3 setObject:v10 forKey:@"minPairingCompatibilityVersion"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  v11 = +[NSNumber numberWithInt:self->_minQuickSwitchCompatibilityVersion];
  [v3 setObject:v11 forKey:@"minQuickSwitchCompatibilityVersion"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v5 = +[NSNumber numberWithBool:self->_isOverrideActive];
    [v3 setObject:v5 forKey:@"isOverrideActive"];
  }
LABEL_7:
  osVersion = self->_osVersion;
  if (osVersion) {
    [v3 setObject:osVersion forKey:@"osVersion"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100061110((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_7:
  if (self->_osVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_pairingCompatibilityVersion;
    *((unsigned char *)v5 + 40) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 2) = self->_maxPairingCompatibilityVersion;
  *((unsigned char *)v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *((_DWORD *)v5 + 4) = self->_minQuickSwitchCompatibilityVersion;
    *((unsigned char *)v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *((_DWORD *)v5 + 3) = self->_minPairingCompatibilityVersion;
  *((unsigned char *)v5 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)v5 + 36) = self->_isOverrideActive;
    *((unsigned char *)v5 + 40) |= 0x10u;
  }
LABEL_7:
  id v8 = [(NSString *)self->_osVersion copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_pairingCompatibilityVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_maxPairingCompatibilityVersion != *((_DWORD *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_minPairingCompatibilityVersion != *((_DWORD *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_minQuickSwitchCompatibilityVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0) {
      goto LABEL_32;
    }
LABEL_26:
    unsigned __int8 v5 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 40) & 0x10) == 0) {
    goto LABEL_26;
  }
  if (!self->_isOverrideActive)
  {
    if (!*((unsigned char *)v4 + 36)) {
      goto LABEL_32;
    }
    goto LABEL_26;
  }
  if (!*((unsigned char *)v4 + 36)) {
    goto LABEL_26;
  }
LABEL_32:
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((void *)v4 + 3)) {
    unsigned __int8 v5 = -[NSString isEqual:](osVersion, "isEqual:");
  }
  else {
    unsigned __int8 v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_pairingCompatibilityVersion;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_maxPairingCompatibilityVersion;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_minPairingCompatibilityVersion;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ [(NSString *)self->_osVersion hash];
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_minQuickSwitchCompatibilityVersion;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_isOverrideActive;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ [(NSString *)self->_osVersion hash];
}

- (void).cxx_destruct
{
}

@end