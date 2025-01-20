@interface NRPBPairingModeRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBPairingModeRequest

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBPairingModeRequest;
  v3 = [(NRPBPairingModeRequest *)&v7 description];
  v4 = [(NRPBPairingModeRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithInt:self->_pairingMode];
  [v3 setObject:v4 forKey:@"pairingMode"];

  char has = (char)self->_has;
  if (has)
  {
    v8 = +[NSNumber numberWithInt:self->_phonePairingProtocolVersionMax];
    [v3 setObject:v8 forKey:@"phonePairingProtocolVersionMax"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v9 = +[NSNumber numberWithInt:self->_watchPairingProtocolVersion];
  [v3 setObject:v9 forKey:@"watchPairingProtocolVersion"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v6 = +[NSNumber numberWithInt:self->_phonePairingProtocolVersionMin];
    [v3 setObject:v6 forKey:@"phonePairingProtocolVersionMin"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10009A068((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 2) = self->_pairingMode;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 3) = self->_phonePairingProtocolVersionMax;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_watchPairingProtocolVersion;
  *((unsigned char *)result + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = self->_phonePairingProtocolVersionMin;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_pairingMode != *((_DWORD *)v4 + 2))
  {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_phonePairingProtocolVersionMax != *((_DWORD *)v4 + 3)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_17:
    BOOL v5 = 0;
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_watchPairingProtocolVersion != *((_DWORD *)v4 + 5)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_phonePairingProtocolVersionMin != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
    BOOL v5 = 1;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_phonePairingProtocolVersionMax;
  }
  else {
    uint64_t v2 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_watchPairingProtocolVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_phonePairingProtocolVersionMin;
  }
  else {
    uint64_t v4 = 0;
  }
  return v2 ^ v3 ^ v4 ^ (2654435761 * self->_pairingMode);
}

@end