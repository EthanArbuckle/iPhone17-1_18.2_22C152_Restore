@interface SDAuthenticationPairingDisable
- (BOOL)hasPairingID;
- (BOOL)hasSessionID;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pairingID;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)type;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPairingID:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationPairingDisable

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPairingID
{
  return self->_pairingID != 0;
}

- (void)setType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAuthenticationPairingDisable;
  char v3 = [(SDAuthenticationPairingDisable *)&v7 description];
  v4 = [(SDAuthenticationPairingDisable *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  pairingID = self->_pairingID;
  if (pairingID) {
    [v3 setObject:pairingID forKey:@"pairingID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_type];
    [v3 setObject:v6 forKey:@"type"];
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationPairingDisableReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_pairingID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_sessionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[7] = self->_version;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  id v5 = v4;
  if (self->_pairingID)
  {
    [v4 setPairingID:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_type;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_sessionID)
  {
    [v5 setSessionID:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[7] = self->_version;
    *((unsigned char *)v5 + 32) |= 2u;
  }
  id v7 = [(NSString *)self->_pairingID copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 6) = self->_type;
    *((unsigned char *)v6 + 32) |= 1u;
  }
  id v9 = [(NSString *)self->_sessionID copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
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
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_version != *((_DWORD *)v4 + 7)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_17;
  }
  pairingID = self->_pairingID;
  if ((unint64_t)pairingID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](pairingID, "isEqual:"))
    {
LABEL_17:
      unsigned __int8 v8 = 0;
      goto LABEL_18;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_17;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 2)) {
    unsigned __int8 v8 = -[NSString isEqual:](sessionID, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_pairingID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_sessionID hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[8] & 2) != 0)
  {
    self->_version = v4[7];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[SDAuthenticationPairingDisable setPairingID:](self, "setPairingID:");
    NSUInteger v4 = v5;
  }
  if (v4[8])
  {
    self->_type = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationPairingDisable setSessionID:](self, "setSessionID:");
    NSUInteger v4 = v5;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_pairingID, 0);
}

@end