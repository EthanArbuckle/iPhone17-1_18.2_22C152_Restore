@interface AWDNanoPhoneIncomingCallConnected
- (BOOL)hasCallProviderIdentifier;
- (BOOL)hasConnectingMs;
- (BOOL)hasIsHosted;
- (BOOL)hasIsVideo;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHosted;
- (BOOL)isVideo;
- (BOOL)readFrom:(id)a3;
- (NSString)callProviderIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)connectingMs;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCallProviderIdentifier:(id)a3;
- (void)setConnectingMs:(unint64_t)a3;
- (void)setHasConnectingMs:(BOOL)a3;
- (void)setHasIsHosted:(BOOL)a3;
- (void)setHasIsVideo:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsHosted:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNanoPhoneIncomingCallConnected

- (void)dealloc
{
  [(AWDNanoPhoneIncomingCallConnected *)self setCallProviderIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDNanoPhoneIncomingCallConnected;
  [(AWDNanoPhoneIncomingCallConnected *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConnectingMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_connectingMs = a3;
}

- (void)setHasConnectingMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnectingMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCallProviderIdentifier
{
  return self->_callProviderIdentifier != 0;
}

- (void)setIsVideo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isVideo = a3;
}

- (void)setHasIsVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsVideo
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsHosted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isHosted = a3;
}

- (void)setHasIsHosted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsHosted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNanoPhoneIncomingCallConnected;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNanoPhoneIncomingCallConnected description](&v3, sel_description), -[AWDNanoPhoneIncomingCallConnected dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectingMs] forKey:@"connectingMs"];
  }
  callProviderIdentifier = self->_callProviderIdentifier;
  if (callProviderIdentifier) {
    [v3 setObject:callProviderIdentifier forKey:@"callProviderIdentifier"];
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_isVideo] forKey:@"isVideo"];
    char v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_isHosted] forKey:@"isHosted"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNanoPhoneIncomingCallConnectedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_callProviderIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_connectingMs;
    *((unsigned char *)a3 + 36) |= 1u;
  }
  if (self->_callProviderIdentifier) {
    [a3 setCallProviderIdentifier:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((unsigned char *)a3 + 33) = self->_isVideo;
    *((unsigned char *)a3 + 36) |= 8u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    *((unsigned char *)a3 + 32) = self->_isHosted;
    *((unsigned char *)a3 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_connectingMs;
    *(unsigned char *)(v5 + 36) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_callProviderIdentifier copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 8) != 0)
  {
    *(unsigned char *)(v6 + 33) = self->_isVideo;
    *(unsigned char *)(v6 + 36) |= 8u;
    char v8 = (char)self->_has;
  }
  if ((v8 & 4) != 0)
  {
    *(unsigned char *)(v6 + 32) = self->_isHosted;
    *(unsigned char *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 2) != 0)
  {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_connectingMs != *((void *)a3 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)a3 + 36))
  {
    goto LABEL_25;
  }
  callProviderIdentifier = self->_callProviderIdentifier;
  if ((unint64_t)callProviderIdentifier | *((void *)a3 + 3))
  {
    int v5 = -[NSString isEqual:](callProviderIdentifier, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 36) & 8) != 0)
    {
      if (self->_isVideo)
      {
        if (!*((unsigned char *)a3 + 33)) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)a3 + 33)) {
        goto LABEL_23;
      }
    }
LABEL_25:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 36) & 8) != 0) {
    goto LABEL_25;
  }
LABEL_23:
  LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 36) & 4) == 0) {
      goto LABEL_25;
    }
    if (self->_isHosted)
    {
      if (!*((unsigned char *)a3 + 32)) {
        goto LABEL_25;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
      goto LABEL_25;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_connectingMs;
      goto LABEL_6;
    }
  }
  unint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_callProviderIdentifier hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_isVideo;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_isHosted;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 36);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 36);
  }
  if (v5)
  {
    self->_connectingMs = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDNanoPhoneIncomingCallConnected setCallProviderIdentifier:](self, "setCallProviderIdentifier:");
  }
  char v6 = *((unsigned char *)a3 + 36);
  if ((v6 & 8) != 0)
  {
    self->_isVideo = *((unsigned char *)a3 + 33);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)a3 + 36);
  }
  if ((v6 & 4) != 0)
  {
    self->_isHosted = *((unsigned char *)a3 + 32);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)connectingMs
{
  return self->_connectingMs;
}

- (NSString)callProviderIdentifier
{
  return self->_callProviderIdentifier;
}

- (void)setCallProviderIdentifier:(id)a3
{
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isHosted
{
  return self->_isHosted;
}

@end