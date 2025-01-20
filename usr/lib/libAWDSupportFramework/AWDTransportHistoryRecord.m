@interface AWDTransportHistoryRecord
+ (Class)connectionInfoType;
- (BOOL)hasConnectionMethod;
- (BOOL)hasTimestampFailure;
- (BOOL)hasTransport;
- (BOOL)hasTransportSwitchReasonErrorCode;
- (BOOL)hasTransportSwitchReasonErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)connectionInfos;
- (id)connectionInfoAtIndex:(unint64_t)a3;
- (id)connectionMethodAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)transportAsString:(int)a3;
- (id)transportSwitchReasonErrorDomainAsString:(int)a3;
- (int)StringAsConnectionMethod:(id)a3;
- (int)StringAsTransport:(id)a3;
- (int)StringAsTransportSwitchReasonErrorDomain:(id)a3;
- (int)connectionMethod;
- (int)transport;
- (int)transportSwitchReasonErrorDomain;
- (unint64_t)connectionInfosCount;
- (unint64_t)hash;
- (unint64_t)timestampFailure;
- (unsigned)transportSwitchReasonErrorCode;
- (void)addConnectionInfo:(id)a3;
- (void)clearConnectionInfos;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionInfos:(id)a3;
- (void)setConnectionMethod:(int)a3;
- (void)setHasConnectionMethod:(BOOL)a3;
- (void)setHasTimestampFailure:(BOOL)a3;
- (void)setHasTransport:(BOOL)a3;
- (void)setHasTransportSwitchReasonErrorCode:(BOOL)a3;
- (void)setHasTransportSwitchReasonErrorDomain:(BOOL)a3;
- (void)setTimestampFailure:(unint64_t)a3;
- (void)setTransport:(int)a3;
- (void)setTransportSwitchReasonErrorCode:(unsigned int)a3;
- (void)setTransportSwitchReasonErrorDomain:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDTransportHistoryRecord

- (void)dealloc
{
  [(AWDTransportHistoryRecord *)self setConnectionInfos:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDTransportHistoryRecord;
  [(AWDTransportHistoryRecord *)&v3 dealloc];
}

- (int)transport
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_transport;
  }
  else {
    return 1;
  }
}

- (void)setTransport:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_transport = a3;
}

- (void)setHasTransport:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTransport
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)transportAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA118[a3 - 1];
  }
}

- (int)StringAsTransport:(id)a3
{
  if ([a3 isEqualToString:@"None"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"WiFi"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"BT"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"Cellular"]) {
    return 4;
  }
  return 1;
}

- (int)connectionMethod
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_connectionMethod;
  }
  else {
    return 1;
  }
}

- (void)setConnectionMethod:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_connectionMethod = a3;
}

- (void)setHasConnectionMethod:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionMethod
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)connectionMethodAsString:(int)a3
{
  if ((a3 - 1) >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA138[a3 - 1];
  }
}

- (int)StringAsConnectionMethod:(id)a3
{
  if ([a3 isEqualToString:@"Peer"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"TCP"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"MPTCP"]) {
    return 3;
  }
  return 1;
}

- (void)clearConnectionInfos
{
}

- (void)addConnectionInfo:(id)a3
{
  connectionInfos = self->_connectionInfos;
  if (!connectionInfos)
  {
    connectionInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_connectionInfos = connectionInfos;
  }

  [(NSMutableArray *)connectionInfos addObject:a3];
}

- (unint64_t)connectionInfosCount
{
  return [(NSMutableArray *)self->_connectionInfos count];
}

- (id)connectionInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_connectionInfos objectAtIndex:a3];
}

+ (Class)connectionInfoType
{
  return (Class)objc_opt_class();
}

- (int)transportSwitchReasonErrorDomain
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_transportSwitchReasonErrorDomain;
  }
  else {
    return 1;
  }
}

- (void)setTransportSwitchReasonErrorDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_transportSwitchReasonErrorDomain = a3;
}

- (void)setHasTransportSwitchReasonErrorDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTransportSwitchReasonErrorDomain
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)transportSwitchReasonErrorDomainAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA150[a3 - 1];
  }
}

- (int)StringAsTransportSwitchReasonErrorDomain:(id)a3
{
  if ([a3 isEqualToString:@"assistantErrorDomain"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"connectionErrorDomain"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"posixErrorDomain"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"peerErrorDomain"]) {
    return 4;
  }
  return 1;
}

- (void)setTransportSwitchReasonErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_transportSwitchReasonErrorCode = a3;
}

- (void)setHasTransportSwitchReasonErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTransportSwitchReasonErrorCode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTimestampFailure:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestampFailure = a3;
}

- (void)setHasTimestampFailure:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampFailure
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDTransportHistoryRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDTransportHistoryRecord description](&v3, sel_description), -[AWDTransportHistoryRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    unsigned int v5 = self->_transport - 1;
    if (v5 >= 4) {
      v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_transport];
    }
    else {
      v6 = off_2641BA118[v5];
    }
    [v3 setObject:v6 forKey:@"transport"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = self->_connectionMethod - 1;
    if (v7 >= 3) {
      v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_connectionMethod];
    }
    else {
      v8 = off_2641BA138[v7];
    }
    [v3 setObject:v8 forKey:@"connectionMethod"];
  }
  if ([(NSMutableArray *)self->_connectionInfos count])
  {
    v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_connectionInfos, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    connectionInfos = self->_connectionInfos;
    uint64_t v11 = [(NSMutableArray *)connectionInfos countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(connectionInfos);
          }
          [v9 addObject:[*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v12 = [(NSMutableArray *)connectionInfos countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
    [v3 setObject:v9 forKey:@"connectionInfo"];
  }
  char v15 = (char)self->_has;
  if ((v15 & 0x10) != 0)
  {
    unsigned int v16 = self->_transportSwitchReasonErrorDomain - 1;
    if (v16 >= 4) {
      v17 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_transportSwitchReasonErrorDomain];
    }
    else {
      v17 = off_2641BA150[v16];
    }
    [v3 setObject:v17 forKey:@"transportSwitchReasonErrorDomain"];
    char v15 = (char)self->_has;
  }
  if ((v15 & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_transportSwitchReasonErrorCode] forKey:@"transportSwitchReasonErrorCode"];
    char v15 = (char)self->_has;
  }
  if (v15) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestampFailure] forKey:@"timestampFailure"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDTransportHistoryRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  connectionInfos = self->_connectionInfos;
  uint64_t v6 = [(NSMutableArray *)connectionInfos countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(connectionInfos);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)connectionInfos countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  char v10 = (char)self->_has;
  if ((v10 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_14:
      if ((v10 & 1) == 0) {
        return;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_transport;
    *((unsigned char *)a3 + 40) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_connectionMethod;
    *((unsigned char *)a3 + 40) |= 2u;
  }
  if ([(AWDTransportHistoryRecord *)self connectionInfosCount])
  {
    [a3 clearConnectionInfos];
    unint64_t v6 = [(AWDTransportHistoryRecord *)self connectionInfosCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addConnectionInfo:-[AWDTransportHistoryRecord connectionInfoAtIndex:](self, "connectionInfoAtIndex:", i)];
    }
  }
  char v9 = (char)self->_has;
  if ((v9 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_transportSwitchReasonErrorDomain;
    *((unsigned char *)a3 + 40) |= 0x10u;
    char v9 = (char)self->_has;
    if ((v9 & 8) == 0)
    {
LABEL_11:
      if ((v9 & 1) == 0) {
        return;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)a3 + 8) = self->_transportSwitchReasonErrorCode;
  *((unsigned char *)a3 + 40) |= 8u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return;
  }
LABEL_12:
  *((void *)a3 + 1) = self->_timestampFailure;
  *((unsigned char *)a3 + 40) |= 1u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_transport;
    *(unsigned char *)(v5 + 40) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_connectionMethod;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  connectionInfos = self->_connectionInfos;
  uint64_t v9 = [(NSMutableArray *)connectionInfos countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(connectionInfos);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v16 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addConnectionInfo:v13];
      }
      uint64_t v10 = [(NSMutableArray *)connectionInfos countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  char v14 = (char)self->_has;
  if ((v14 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_14;
    }
LABEL_18:
    *(_DWORD *)(v6 + 32) = self->_transportSwitchReasonErrorCode;
    *(unsigned char *)(v6 + 40) |= 8u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v6;
    }
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 36) = self->_transportSwitchReasonErrorDomain;
  *(unsigned char *)(v6 + 40) |= 0x10u;
  char v14 = (char)self->_has;
  if ((v14 & 8) != 0) {
    goto LABEL_18;
  }
LABEL_14:
  if (v14)
  {
LABEL_15:
    *(void *)(v6 + 8) = self->_timestampFailure;
    *(unsigned char *)(v6 + 40) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_transport != *((_DWORD *)a3 + 7)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_connectionMethod != *((_DWORD *)a3 + 6)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
      goto LABEL_29;
    }
    connectionInfos = self->_connectionInfos;
    if ((unint64_t)connectionInfos | *((void *)a3 + 2))
    {
      int v5 = -[NSMutableArray isEqual:](connectionInfos, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x10) == 0 || self->_transportSwitchReasonErrorDomain != *((_DWORD *)a3 + 9)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 0x10) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_transportSwitchReasonErrorCode != *((_DWORD *)a3 + 8)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 8) != 0)
    {
      goto LABEL_29;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 1) == 0;
    if (has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestampFailure != *((void *)a3 + 1)) {
        goto LABEL_29;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_transport;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_connectionMethod;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSMutableArray *)self->_connectionInfos hash];
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
LABEL_12:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  }
  uint64_t v6 = 2654435761 * self->_transportSwitchReasonErrorDomain;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_transportSwitchReasonErrorCode;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  unint64_t v8 = 2654435761u * self->_timestampFailure;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 4) != 0)
  {
    self->_transport = *((_DWORD *)a3 + 7);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_connectionMethod = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDTransportHistoryRecord *)self addConnectionInfo:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  char v11 = *((unsigned char *)a3 + 40);
  if ((v11 & 0x10) != 0)
  {
    self->_transportSwitchReasonErrorDomain = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 0x10u;
    char v11 = *((unsigned char *)a3 + 40);
    if ((v11 & 8) == 0)
    {
LABEL_14:
      if ((v11 & 1) == 0) {
        return;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 8) == 0)
  {
    goto LABEL_14;
  }
  self->_transportSwitchReasonErrorCode = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 40) & 1) == 0) {
    return;
  }
LABEL_15:
  self->_timestampFailure = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
}

- (NSMutableArray)connectionInfos
{
  return self->_connectionInfos;
}

- (void)setConnectionInfos:(id)a3
{
}

- (unsigned)transportSwitchReasonErrorCode
{
  return self->_transportSwitchReasonErrorCode;
}

- (unint64_t)timestampFailure
{
  return self->_timestampFailure;
}

@end