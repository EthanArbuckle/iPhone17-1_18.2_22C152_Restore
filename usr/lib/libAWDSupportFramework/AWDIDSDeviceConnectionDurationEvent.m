@interface AWDIDSDeviceConnectionDurationEvent
- (BOOL)hasClientInitToClientOpenSocketHandler;
- (BOOL)hasClientInitToDaemonOpenSocket;
- (BOOL)hasClientOpenSocketHandlerToIncomingFirstPacket;
- (BOOL)hasConnectionInitToIncomingFirstPacket;
- (BOOL)hasDaemonCompletionHandlerToClientOpenSocketCompletion;
- (BOOL)hasDaemonCompletionHandlerToIncomingFirstPacket;
- (BOOL)hasDaemonOpenSocketToDaemonCompletionHandler;
- (BOOL)hasServiceName;
- (BOOL)hasSuccess;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)clientInitToClientOpenSocketHandler;
- (unint64_t)clientInitToDaemonOpenSocket;
- (unint64_t)clientOpenSocketHandlerToIncomingFirstPacket;
- (unint64_t)connectionInitToIncomingFirstPacket;
- (unint64_t)daemonCompletionHandlerToClientOpenSocketCompletion;
- (unint64_t)daemonCompletionHandlerToIncomingFirstPacket;
- (unint64_t)daemonOpenSocketToDaemonCompletionHandler;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClientInitToClientOpenSocketHandler:(unint64_t)a3;
- (void)setClientInitToDaemonOpenSocket:(unint64_t)a3;
- (void)setClientOpenSocketHandlerToIncomingFirstPacket:(unint64_t)a3;
- (void)setConnectionInitToIncomingFirstPacket:(unint64_t)a3;
- (void)setDaemonCompletionHandlerToClientOpenSocketCompletion:(unint64_t)a3;
- (void)setDaemonCompletionHandlerToIncomingFirstPacket:(unint64_t)a3;
- (void)setDaemonOpenSocketToDaemonCompletionHandler:(unint64_t)a3;
- (void)setHasClientInitToClientOpenSocketHandler:(BOOL)a3;
- (void)setHasClientInitToDaemonOpenSocket:(BOOL)a3;
- (void)setHasClientOpenSocketHandlerToIncomingFirstPacket:(BOOL)a3;
- (void)setHasConnectionInitToIncomingFirstPacket:(BOOL)a3;
- (void)setHasDaemonCompletionHandlerToClientOpenSocketCompletion:(BOOL)a3;
- (void)setHasDaemonCompletionHandlerToIncomingFirstPacket:(BOOL)a3;
- (void)setHasDaemonOpenSocketToDaemonCompletionHandler:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setServiceName:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSDeviceConnectionDurationEvent

- (void)dealloc
{
  [(AWDIDSDeviceConnectionDurationEvent *)self setServiceName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSDeviceConnectionDurationEvent;
  [(AWDIDSDeviceConnectionDurationEvent *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (void)setSuccess:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSuccess
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setClientInitToDaemonOpenSocket:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_clientInitToDaemonOpenSocket = a3;
}

- (void)setHasClientInitToDaemonOpenSocket:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasClientInitToDaemonOpenSocket
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setClientInitToClientOpenSocketHandler:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_clientInitToClientOpenSocketHandler = a3;
}

- (void)setHasClientInitToClientOpenSocketHandler:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasClientInitToClientOpenSocketHandler
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setClientOpenSocketHandlerToIncomingFirstPacket:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clientOpenSocketHandlerToIncomingFirstPacket = a3;
}

- (void)setHasClientOpenSocketHandlerToIncomingFirstPacket:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClientOpenSocketHandlerToIncomingFirstPacket
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDaemonOpenSocketToDaemonCompletionHandler:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_daemonOpenSocketToDaemonCompletionHandler = a3;
}

- (void)setHasDaemonOpenSocketToDaemonCompletionHandler:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDaemonOpenSocketToDaemonCompletionHandler
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDaemonCompletionHandlerToClientOpenSocketCompletion:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_daemonCompletionHandlerToClientOpenSocketCompletion = a3;
}

- (void)setHasDaemonCompletionHandlerToClientOpenSocketCompletion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDaemonCompletionHandlerToClientOpenSocketCompletion
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDaemonCompletionHandlerToIncomingFirstPacket:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_daemonCompletionHandlerToIncomingFirstPacket = a3;
}

- (void)setHasDaemonCompletionHandlerToIncomingFirstPacket:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDaemonCompletionHandlerToIncomingFirstPacket
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setConnectionInitToIncomingFirstPacket:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_connectionInitToIncomingFirstPacket = a3;
}

- (void)setHasConnectionInitToIncomingFirstPacket:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConnectionInitToIncomingFirstPacket
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSDeviceConnectionDurationEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSDeviceConnectionDurationEvent description](&v3, sel_description), -[AWDIDSDeviceConnectionDurationEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  serviceName = self->_serviceName;
  if (serviceName) {
    [v3 setObject:serviceName forKey:@"serviceName"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_success] forKey:@"success"];
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_clientInitToDaemonOpenSocket] forKey:@"clientInitToDaemonOpenSocket"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_clientInitToClientOpenSocketHandler] forKey:@"clientInitToClientOpenSocketHandler"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_clientOpenSocketHandlerToIncomingFirstPacket] forKey:@"clientOpenSocketHandlerToIncomingFirstPacket"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_daemonOpenSocketToDaemonCompletionHandler] forKey:@"daemonOpenSocketToDaemonCompletionHandler"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
LABEL_21:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_daemonCompletionHandlerToIncomingFirstPacket] forKey:@"daemonCompletionHandlerToIncomingFirstPacket"];
    if ((*(_WORD *)&self->_has & 8) == 0) {
      return v3;
    }
    goto LABEL_13;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_daemonCompletionHandlerToClientOpenSocketCompletion] forKey:@"daemonCompletionHandlerToClientOpenSocketCompletion"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_21;
  }
LABEL_12:
  if ((has & 8) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectionInitToIncomingFirstPacket] forKey:@"connectionInitToIncomingFirstPacket"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSDeviceConnectionDurationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_serviceName) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
LABEL_20:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 8) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_20;
  }
LABEL_12:
  if ((has & 8) == 0) {
    return;
  }
LABEL_21:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((void *)a3 + 8) = self->_timestamp;
    *((_WORD *)a3 + 42) |= 0x80u;
  }
  if (self->_serviceName) {
    [a3 setServiceName:];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((unsigned char *)a3 + 80) = self->_success;
    *((_WORD *)a3 + 42) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)a3 + 2) = self->_clientInitToDaemonOpenSocket;
  *((_WORD *)a3 + 42) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 1) = self->_clientInitToClientOpenSocketHandler;
  *((_WORD *)a3 + 42) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)a3 + 3) = self->_clientOpenSocketHandlerToIncomingFirstPacket;
  *((_WORD *)a3 + 42) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 7) = self->_daemonOpenSocketToDaemonCompletionHandler;
  *((_WORD *)a3 + 42) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 5) = self->_daemonCompletionHandlerToClientOpenSocketCompletion;
  *((_WORD *)a3 + 42) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_21:
  *((void *)a3 + 6) = self->_daemonCompletionHandlerToIncomingFirstPacket;
  *((_WORD *)a3 + 42) |= 0x20u;
  if ((*(_WORD *)&self->_has & 8) == 0) {
    return;
  }
LABEL_13:
  *((void *)a3 + 4) = self->_connectionInitToIncomingFirstPacket;
  *((_WORD *)a3 + 42) |= 8u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(void *)(v5 + 64) = self->_timestamp;
    *(_WORD *)(v5 + 84) |= 0x80u;
  }

  *(void *)(v6 + 72) = [(NSString *)self->_serviceName copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(unsigned char *)(v6 + 80) = self->_success;
    *(_WORD *)(v6 + 84) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 16) = self->_clientInitToDaemonOpenSocket;
  *(_WORD *)(v6 + 84) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(void *)(v6 + 8) = self->_clientInitToClientOpenSocketHandler;
  *(_WORD *)(v6 + 84) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(void *)(v6 + 24) = self->_clientOpenSocketHandlerToIncomingFirstPacket;
  *(_WORD *)(v6 + 84) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(void *)(v6 + 56) = self->_daemonOpenSocketToDaemonCompletionHandler;
  *(_WORD *)(v6 + 84) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
LABEL_19:
    *(void *)(v6 + 48) = self->_daemonCompletionHandlerToIncomingFirstPacket;
    *(_WORD *)(v6 + 84) |= 0x20u;
    if ((*(_WORD *)&self->_has & 8) == 0) {
      return (id)v6;
    }
    goto LABEL_11;
  }
LABEL_18:
  *(void *)(v6 + 40) = self->_daemonCompletionHandlerToClientOpenSocketCompletion;
  *(_WORD *)(v6 + 84) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_19;
  }
LABEL_10:
  if ((has & 8) != 0)
  {
LABEL_11:
    *(void *)(v6 + 32) = self->_connectionInitToIncomingFirstPacket;
    *(_WORD *)(v6 + 84) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 42);
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_timestamp != *((void *)a3 + 8)) {
      goto LABEL_52;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  serviceName = self->_serviceName;
  if ((unint64_t)serviceName | *((void *)a3 + 9))
  {
    int v5 = -[NSString isEqual:](serviceName, "isEqual:");
    if (!v5) {
      return v5;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)a3 + 42);
  if ((has & 0x100) == 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x100) != 0) {
      goto LABEL_52;
    }
    goto LABEL_18;
  }
  if ((*((_WORD *)a3 + 42) & 0x100) == 0) {
    goto LABEL_52;
  }
  if (self->_success)
  {
    if (!*((unsigned char *)a3 + 80)) {
      goto LABEL_52;
    }
    goto LABEL_18;
  }
  if (*((unsigned char *)a3 + 80))
  {
LABEL_52:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_clientInitToDaemonOpenSocket != *((void *)a3 + 2)) {
      goto LABEL_52;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_52;
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_clientInitToClientOpenSocketHandler != *((void *)a3 + 1)) {
      goto LABEL_52;
    }
  }
  else if (v9)
  {
    goto LABEL_52;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_clientOpenSocketHandlerToIncomingFirstPacket != *((void *)a3 + 3)) {
      goto LABEL_52;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_daemonOpenSocketToDaemonCompletionHandler != *((void *)a3 + 7)) {
      goto LABEL_52;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_daemonCompletionHandlerToClientOpenSocketCompletion != *((void *)a3 + 5)) {
      goto LABEL_52;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_daemonCompletionHandlerToIncomingFirstPacket != *((void *)a3 + 6)) {
      goto LABEL_52;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  LOBYTE(v5) = (v9 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_connectionInitToIncomingFirstPacket != *((void *)a3 + 4)) {
      goto LABEL_52;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_serviceName hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v6 = 2654435761 * self->_success;
    if ((has & 2) != 0)
    {
LABEL_6:
      unint64_t v7 = 2654435761u * self->_clientInitToDaemonOpenSocket;
      if (has) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((has & 2) != 0) {
      goto LABEL_6;
    }
  }
  unint64_t v7 = 0;
  if (has)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_clientInitToClientOpenSocketHandler;
    if ((has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_clientOpenSocketHandlerToIncomingFirstPacket;
    if ((has & 0x40) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v9 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_daemonOpenSocketToDaemonCompletionHandler;
    if ((has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_daemonCompletionHandlerToClientOpenSocketCompletion;
    if ((has & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_19:
    unint64_t v12 = 0;
    if ((has & 8) != 0) {
      goto LABEL_12;
    }
LABEL_20:
    unint64_t v13 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_18:
  unint64_t v11 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_19;
  }
LABEL_11:
  unint64_t v12 = 2654435761u * self->_daemonCompletionHandlerToIncomingFirstPacket;
  if ((has & 8) == 0) {
    goto LABEL_20;
  }
LABEL_12:
  unint64_t v13 = 2654435761u * self->_connectionInitToIncomingFirstPacket;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_WORD *)a3 + 42) & 0x80) != 0)
  {
    self->_timestamp = *((void *)a3 + 8);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)a3 + 9)) {
    -[AWDIDSDeviceConnectionDurationEvent setServiceName:](self, "setServiceName:");
  }
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x100) != 0)
  {
    self->_success = *((unsigned char *)a3 + 80);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)a3 + 42);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_clientInitToDaemonOpenSocket = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_clientInitToClientOpenSocketHandler = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_clientOpenSocketHandlerToIncomingFirstPacket = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_daemonOpenSocketToDaemonCompletionHandler = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x10) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_daemonCompletionHandlerToClientOpenSocketCompletion = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 8) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_21:
  self->_daemonCompletionHandlerToIncomingFirstPacket = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 42) & 8) == 0) {
    return;
  }
LABEL_13:
  self->_connectionInitToIncomingFirstPacket = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (unint64_t)clientInitToDaemonOpenSocket
{
  return self->_clientInitToDaemonOpenSocket;
}

- (unint64_t)clientInitToClientOpenSocketHandler
{
  return self->_clientInitToClientOpenSocketHandler;
}

- (unint64_t)clientOpenSocketHandlerToIncomingFirstPacket
{
  return self->_clientOpenSocketHandlerToIncomingFirstPacket;
}

- (unint64_t)daemonOpenSocketToDaemonCompletionHandler
{
  return self->_daemonOpenSocketToDaemonCompletionHandler;
}

- (unint64_t)daemonCompletionHandlerToClientOpenSocketCompletion
{
  return self->_daemonCompletionHandlerToClientOpenSocketCompletion;
}

- (unint64_t)daemonCompletionHandlerToIncomingFirstPacket
{
  return self->_daemonCompletionHandlerToIncomingFirstPacket;
}

- (unint64_t)connectionInitToIncomingFirstPacket
{
  return self->_connectionInitToIncomingFirstPacket;
}

@end