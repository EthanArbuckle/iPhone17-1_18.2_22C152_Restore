@interface _MRGroupSessionParticipantProtobuf
- (BOOL)connected;
- (BOOL)guest;
- (BOOL)hasConnected;
- (BOOL)hasGuest;
- (BOOL)hasHidden;
- (BOOL)hasIdentifier;
- (BOOL)hasIdentity;
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (_MRUserIdentityProtobuf)identity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setGuest:(BOOL)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setHasGuest:(BOOL)a3;
- (void)setHasHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionParticipantProtobuf

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasIdentity
{
  return self->_identity != 0;
}

- (void)setConnected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_connected = a3;
}

- (void)setHasConnected:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnected
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setGuest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_guest = a3;
}

- (void)setHasGuest:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGuest
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHidden:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_hidden = a3;
}

- (void)setHasHidden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHidden
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionParticipantProtobuf;
  v4 = [(_MRGroupSessionParticipantProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionParticipantProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  identity = self->_identity;
  if (identity)
  {
    v7 = [(_MRUserIdentityProtobuf *)identity dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"identity"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v11 = [NSNumber numberWithBool:self->_connected];
    [v4 setObject:v11 forKey:@"connected"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v12 = [NSNumber numberWithBool:self->_guest];
  [v4 setObject:v12 forKey:@"guest"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    v9 = [NSNumber numberWithBool:self->_hidden];
    [v4 setObject:v9 forKey:@"hidden"];
  }
LABEL_9:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionParticipantProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_identity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_9:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v6;
  }
  if (self->_identity)
  {
    objc_msgSend(v6, "setIdentity:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[24] = self->_connected;
    v4[28] |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v4[25] = self->_guest;
  v4[28] |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    v4[26] = self->_hidden;
    v4[28] |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  id v8 = [(_MRUserIdentityProtobuf *)self->_identity copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 25) = self->_guest;
    *(unsigned char *)(v5 + 28) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v5 + 24) = self->_connected;
  *(unsigned char *)(v5 + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 26) = self->_hidden;
    *(unsigned char *)(v5 + 28) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_24;
    }
  }
  identity = self->_identity;
  if ((unint64_t)identity | *((void *)v4 + 2))
  {
    if (!-[_MRUserIdentityProtobuf isEqual:](identity, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_24;
    }
    if (self->_connected)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_24;
    }
    if (self->_guest)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_24;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) != 0)
    {
      if (self->_hidden)
      {
        if (!*((unsigned char *)v4 + 26)) {
          goto LABEL_24;
        }
      }
      else if (*((unsigned char *)v4 + 26))
      {
        goto LABEL_24;
      }
      BOOL v7 = 1;
      goto LABEL_25;
    }
LABEL_24:
    BOOL v7 = 0;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(_MRUserIdentityProtobuf *)self->_identity hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_connected;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_guest;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_hidden;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (BOOL *)a3;
  id v8 = v4;
  if (*((void *)v4 + 1))
  {
    -[_MRGroupSessionParticipantProtobuf setIdentifier:](self, "setIdentifier:");
    unint64_t v4 = v8;
  }
  identity = self->_identity;
  uint64_t v6 = *((void *)v4 + 2);
  if (identity)
  {
    if (!v6) {
      goto LABEL_9;
    }
    identity = (_MRUserIdentityProtobuf *)-[_MRUserIdentityProtobuf mergeFrom:](identity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    identity = (_MRUserIdentityProtobuf *)-[_MRGroupSessionParticipantProtobuf setIdentity:](self, "setIdentity:");
  }
  unint64_t v4 = v8;
LABEL_9:
  BOOL v7 = v4[28];
  if (v7)
  {
    self->_connected = v4[24];
    *(unsigned char *)&self->_has |= 1u;
    BOOL v7 = v4[28];
    if ((v7 & 2) == 0)
    {
LABEL_11:
      if ((v7 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v4[28] & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_guest = v4[25];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[28] & 4) != 0)
  {
LABEL_12:
    self->_hidden = v4[26];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_13:

  MEMORY[0x1F41817F8](identity, v4);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (_MRUserIdentityProtobuf)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)guest
{
  return self->_guest;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end