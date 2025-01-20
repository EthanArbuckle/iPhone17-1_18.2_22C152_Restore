@interface AWDMPTCPConnectionInterfaceReport
- (BOOL)hasDataInKB;
- (BOOL)hasDataOutKB;
- (BOOL)hasInterfaceName;
- (BOOL)hasPostConnectTcpFallbackCount;
- (BOOL)hasSecondaryFlowFailureCount;
- (BOOL)hasSecondaryFlowSuccessCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)postConnectTcpFallbackCount;
- (BOOL)readFrom:(id)a3;
- (NSString)interfaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)postConnectSubflowFailureErrors;
- (int)postConnectSubflowFailureErrorsAtIndex:(unint64_t)a3;
- (int)secondaryFlowFailureCount;
- (int)secondaryFlowSuccessCount;
- (int64_t)dataInKB;
- (int64_t)dataOutKB;
- (unint64_t)hash;
- (unint64_t)postConnectSubflowFailureErrorsCount;
- (unint64_t)timestamp;
- (void)addPostConnectSubflowFailureErrors:(int)a3;
- (void)clearPostConnectSubflowFailureErrors;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDataInKB:(int64_t)a3;
- (void)setDataOutKB:(int64_t)a3;
- (void)setHasDataInKB:(BOOL)a3;
- (void)setHasDataOutKB:(BOOL)a3;
- (void)setHasPostConnectTcpFallbackCount:(BOOL)a3;
- (void)setHasSecondaryFlowFailureCount:(BOOL)a3;
- (void)setHasSecondaryFlowSuccessCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInterfaceName:(id)a3;
- (void)setPostConnectSubflowFailureErrors:(int *)a3 count:(unint64_t)a4;
- (void)setPostConnectTcpFallbackCount:(BOOL)a3;
- (void)setSecondaryFlowFailureCount:(int)a3;
- (void)setSecondaryFlowSuccessCount:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMPTCPConnectionInterfaceReport

- (void)dealloc
{
  [(AWDMPTCPConnectionInterfaceReport *)self setInterfaceName:0];
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPConnectionInterfaceReport;
  [(AWDMPTCPConnectionInterfaceReport *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasInterfaceName
{
  return self->_interfaceName != 0;
}

- (unint64_t)postConnectSubflowFailureErrorsCount
{
  return self->_postConnectSubflowFailureErrors.count;
}

- (int)postConnectSubflowFailureErrors
{
  return self->_postConnectSubflowFailureErrors.list;
}

- (void)clearPostConnectSubflowFailureErrors
{
}

- (void)addPostConnectSubflowFailureErrors:(int)a3
{
}

- (int)postConnectSubflowFailureErrorsAtIndex:(unint64_t)a3
{
  p_postConnectSubflowFailureErrors = &self->_postConnectSubflowFailureErrors;
  unint64_t count = self->_postConnectSubflowFailureErrors.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count) 0], "raise" reason userInfo];
  }
  return p_postConnectSubflowFailureErrors->list[a3];
}

- (void)setPostConnectSubflowFailureErrors:(int *)a3 count:(unint64_t)a4
{
}

- (void)setDataInKB:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dataInKB = a3;
}

- (void)setHasDataInKB:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataInKB
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDataOutKB:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dataOutKB = a3;
}

- (void)setHasDataOutKB:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataOutKB
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSecondaryFlowSuccessCount:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_secondaryFlowSuccessCount = a3;
}

- (void)setHasSecondaryFlowSuccessCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSecondaryFlowSuccessCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSecondaryFlowFailureCount:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_secondaryFlowFailureCount = a3;
}

- (void)setHasSecondaryFlowFailureCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSecondaryFlowFailureCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPostConnectTcpFallbackCount:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_postConnectTcpFallbackCount = a3;
}

- (void)setHasPostConnectTcpFallbackCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPostConnectTcpFallbackCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPConnectionInterfaceReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMPTCPConnectionInterfaceReport description](&v3, sel_description), -[AWDMPTCPConnectionInterfaceReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  interfaceName = self->_interfaceName;
  if (interfaceName) {
    [v3 setObject:interfaceName forKey:@"interface_name"];
  }
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"post_connect_subflow_failure_errors"];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithLongLong:self->_dataInKB] forKey:@"data_in_KB"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithLongLong:self->_dataOutKB] forKey:@"data_out_KB"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithInt:self->_secondaryFlowFailureCount] forKey:@"secondary_flow_failure_count"];
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_10;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithInt:self->_secondaryFlowSuccessCount] forKey:@"secondary_flow_success_count"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if ((has & 0x20) != 0) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_postConnectTcpFallbackCount] forKey:@"post_connect_tcp_fallback_count"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMPTCPConnectionInterfaceReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_interfaceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_postConnectSubflowFailureErrors.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_postConnectSubflowFailureErrors.count);
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
LABEL_17:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return;
    }
    goto LABEL_18;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_17;
  }
LABEL_12:
  if ((has & 0x20) == 0) {
    return;
  }
LABEL_18:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)a3 + 6) = self->_timestamp;
    *((unsigned char *)a3 + 76) |= 4u;
  }
  if (self->_interfaceName) {
    [a3 setInterfaceName:];
  }
  if ([(AWDMPTCPConnectionInterfaceReport *)self postConnectSubflowFailureErrorsCount])
  {
    [a3 clearPostConnectSubflowFailureErrors];
    unint64_t v5 = [(AWDMPTCPConnectionInterfaceReport *)self postConnectSubflowFailureErrorsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addPostConnectSubflowFailureErrors:[[self postConnectSubflowFailureErrorsAtIndex:i]];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 4) = self->_dataInKB;
    *((unsigned char *)a3 + 76) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  *((void *)a3 + 5) = self->_dataOutKB;
  *((unsigned char *)a3 + 76) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 17) = self->_secondaryFlowSuccessCount;
  *((unsigned char *)a3 + 76) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      return;
    }
    goto LABEL_14;
  }
LABEL_19:
  *((_DWORD *)a3 + 16) = self->_secondaryFlowFailureCount;
  *((unsigned char *)a3 + 76) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return;
  }
LABEL_14:
  *((unsigned char *)a3 + 72) = self->_postConnectTcpFallbackCount;
  *((unsigned char *)a3 + 76) |= 0x20u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 48) = self->_timestamp;
    *(unsigned char *)(v5 + 76) |= 4u;
  }

  *(void *)(v6 + 56) = [(NSString *)self->_interfaceName copyWithZone:a3];
  PBRepeatedInt32Copy();
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v6 + 32) = self->_dataInKB;
    *(unsigned char *)(v6 + 76) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 40) = self->_dataOutKB;
  *(unsigned char *)(v6 + 76) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(_DWORD *)(v6 + 64) = self->_secondaryFlowFailureCount;
    *(unsigned char *)(v6 + 76) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 68) = self->_secondaryFlowSuccessCount;
  *(unsigned char *)(v6 + 76) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 72) = self->_postConnectTcpFallbackCount;
    *(unsigned char *)(v6 + 76) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 76) & 4) == 0 || self->_timestamp != *((void *)a3 + 6)) {
        goto LABEL_32;
      }
    }
    else if ((*((unsigned char *)a3 + 76) & 4) != 0)
    {
      goto LABEL_32;
    }
    interfaceName = self->_interfaceName;
    if (!((unint64_t)interfaceName | *((void *)a3 + 7))
      || (int IsEqual = -[NSString isEqual:](interfaceName, "isEqual:")) != 0)
    {
      int IsEqual = PBRepeatedInt32IsEqual();
      if (IsEqual)
      {
        if (*(unsigned char *)&self->_has)
        {
          if ((*((unsigned char *)a3 + 76) & 1) == 0 || self->_dataInKB != *((void *)a3 + 4)) {
            goto LABEL_32;
          }
        }
        else if (*((unsigned char *)a3 + 76))
        {
          goto LABEL_32;
        }
        if ((*(unsigned char *)&self->_has & 2) != 0)
        {
          if ((*((unsigned char *)a3 + 76) & 2) == 0 || self->_dataOutKB != *((void *)a3 + 5)) {
            goto LABEL_32;
          }
        }
        else if ((*((unsigned char *)a3 + 76) & 2) != 0)
        {
          goto LABEL_32;
        }
        if ((*(unsigned char *)&self->_has & 0x10) != 0)
        {
          if ((*((unsigned char *)a3 + 76) & 0x10) == 0 || self->_secondaryFlowSuccessCount != *((_DWORD *)a3 + 17)) {
            goto LABEL_32;
          }
        }
        else if ((*((unsigned char *)a3 + 76) & 0x10) != 0)
        {
          goto LABEL_32;
        }
        if ((*(unsigned char *)&self->_has & 8) != 0)
        {
          if ((*((unsigned char *)a3 + 76) & 8) == 0 || self->_secondaryFlowFailureCount != *((_DWORD *)a3 + 16)) {
            goto LABEL_32;
          }
        }
        else if ((*((unsigned char *)a3 + 76) & 8) != 0)
        {
          goto LABEL_32;
        }
        LOBYTE(IsEqual) = (*((unsigned char *)a3 + 76) & 0x20) == 0;
        if ((*(unsigned char *)&self->_has & 0x20) != 0)
        {
          if ((*((unsigned char *)a3 + 76) & 0x20) == 0)
          {
LABEL_32:
            LOBYTE(IsEqual) = 0;
            return IsEqual;
          }
          if (self->_postConnectTcpFallbackCount)
          {
            if (!*((unsigned char *)a3 + 72)) {
              goto LABEL_32;
            }
          }
          else if (*((unsigned char *)a3 + 72))
          {
            goto LABEL_32;
          }
          LOBYTE(IsEqual) = 1;
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_interfaceName hash];
  uint64_t v5 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_dataInKB;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_dataOutKB;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_secondaryFlowSuccessCount;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_12:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_secondaryFlowFailureCount;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_postConnectTcpFallbackCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 76) & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 7)) {
    -[AWDMPTCPConnectionInterfaceReport setInterfaceName:](self, "setInterfaceName:");
  }
  uint64_t v5 = [a3 postConnectSubflowFailureErrorsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDMPTCPConnectionInterfaceReport addPostConnectSubflowFailureErrors:](self, "addPostConnectSubflowFailureErrors:", [a3 postConnectSubflowFailureErrorsAtIndex:i]);
  }
  char v8 = *((unsigned char *)a3 + 76);
  if (v8)
  {
    self->_dataInKB = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v8 = *((unsigned char *)a3 + 76);
    if ((v8 & 2) == 0)
    {
LABEL_10:
      if ((v8 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)a3 + 76) & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_dataOutKB = *((void *)a3 + 5);
  *(unsigned char *)&self->_has |= 2u;
  char v8 = *((unsigned char *)a3 + 76);
  if ((v8 & 0x10) == 0)
  {
LABEL_11:
    if ((v8 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_secondaryFlowSuccessCount = *((_DWORD *)a3 + 17);
  *(unsigned char *)&self->_has |= 0x10u;
  char v8 = *((unsigned char *)a3 + 76);
  if ((v8 & 8) == 0)
  {
LABEL_12:
    if ((v8 & 0x20) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_18:
  self->_secondaryFlowFailureCount = *((_DWORD *)a3 + 16);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 76) & 0x20) == 0) {
    return;
  }
LABEL_13:
  self->_postConnectTcpFallbackCount = *((unsigned char *)a3 + 72);
  *(unsigned char *)&self->_has |= 0x20u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (int64_t)dataInKB
{
  return self->_dataInKB;
}

- (int64_t)dataOutKB
{
  return self->_dataOutKB;
}

- (int)secondaryFlowSuccessCount
{
  return self->_secondaryFlowSuccessCount;
}

- (int)secondaryFlowFailureCount
{
  return self->_secondaryFlowFailureCount;
}

- (BOOL)postConnectTcpFallbackCount
{
  return self->_postConnectTcpFallbackCount;
}

@end