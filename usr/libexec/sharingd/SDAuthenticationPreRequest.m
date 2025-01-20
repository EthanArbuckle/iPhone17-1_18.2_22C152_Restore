@interface SDAuthenticationPreRequest
- (BOOL)hasSessionID;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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
- (void)setSessionID:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationPreRequest

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
  v7.super_class = (Class)SDAuthenticationPreRequest;
  char v3 = [(SDAuthenticationPreRequest *)&v7 description];
  v4 = [(SDAuthenticationPreRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if (has)
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
  return SDAuthenticationPreRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_sessionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_version;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = self->_type;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_sessionID)
  {
    id v6 = v4;
    [v4 setSessionID:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = self->_version;
    *((unsigned char *)v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 4) = self->_type;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  id v8 = [(NSString *)self->_sessionID copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_version != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    unsigned __int8 v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NSString isEqual:](sessionID, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_sessionID hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_type;
  return v3 ^ v2 ^ [(NSString *)self->_sessionID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if (v5)
  {
    self->_type = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[SDAuthenticationPreRequest setSessionID:](self, "setSessionID:");
    id v4 = v6;
  }
}

- (unsigned)version
{
  return self->_version;
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
}

@end