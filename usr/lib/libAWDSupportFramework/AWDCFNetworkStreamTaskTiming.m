@interface AWDCFNetworkStreamTaskTiming
- (BOOL)hasConnectEnd;
- (BOOL)hasConnectStart;
- (BOOL)hasConnected;
- (BOOL)hasConnectionInit;
- (BOOL)hasDomainLookupEnd;
- (BOOL)hasDomainLookupStart;
- (BOOL)hasFirstRead;
- (BOOL)hasFirstWrite;
- (BOOL)hasIsCellular;
- (BOOL)hasProcname;
- (BOOL)hasResumeStart;
- (BOOL)hasSecureConnectionStart;
- (BOOL)hasTaskCreationStart;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)procname;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)isCellular;
- (unint64_t)connectEnd;
- (unint64_t)connectStart;
- (unint64_t)connected;
- (unint64_t)connectionInit;
- (unint64_t)domainLookupEnd;
- (unint64_t)domainLookupStart;
- (unint64_t)firstRead;
- (unint64_t)firstWrite;
- (unint64_t)hash;
- (unint64_t)resumeStart;
- (unint64_t)secureConnectionStart;
- (unint64_t)taskCreationStart;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectEnd:(unint64_t)a3;
- (void)setConnectStart:(unint64_t)a3;
- (void)setConnected:(unint64_t)a3;
- (void)setConnectionInit:(unint64_t)a3;
- (void)setDomainLookupEnd:(unint64_t)a3;
- (void)setDomainLookupStart:(unint64_t)a3;
- (void)setFirstRead:(unint64_t)a3;
- (void)setFirstWrite:(unint64_t)a3;
- (void)setHasConnectEnd:(BOOL)a3;
- (void)setHasConnectStart:(BOOL)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setHasConnectionInit:(BOOL)a3;
- (void)setHasDomainLookupEnd:(BOOL)a3;
- (void)setHasDomainLookupStart:(BOOL)a3;
- (void)setHasFirstRead:(BOOL)a3;
- (void)setHasFirstWrite:(BOOL)a3;
- (void)setHasIsCellular:(BOOL)a3;
- (void)setHasResumeStart:(BOOL)a3;
- (void)setHasSecureConnectionStart:(BOOL)a3;
- (void)setHasTaskCreationStart:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsCellular:(int64_t)a3;
- (void)setProcname:(id)a3;
- (void)setResumeStart:(unint64_t)a3;
- (void)setSecureConnectionStart:(unint64_t)a3;
- (void)setTaskCreationStart:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCFNetworkStreamTaskTiming

- (void)dealloc
{
  [(AWDCFNetworkStreamTaskTiming *)self setProcname:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkStreamTaskTiming;
  [(AWDCFNetworkStreamTaskTiming *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setTaskCreationStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_taskCreationStart = a3;
}

- (void)setHasTaskCreationStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTaskCreationStart
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setResumeStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_resumeStart = a3;
}

- (void)setHasResumeStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasResumeStart
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setConnectionInit:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_connectionInit = a3;
}

- (void)setHasConnectionInit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConnectionInit
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDomainLookupStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_domainLookupStart = a3;
}

- (void)setHasDomainLookupStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDomainLookupStart
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDomainLookupEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_domainLookupEnd = a3;
}

- (void)setHasDomainLookupEnd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDomainLookupEnd
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setConnectStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectStart = a3;
}

- (void)setHasConnectStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectStart
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSecureConnectionStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_secureConnectionStart = a3;
}

- (void)setHasSecureConnectionStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSecureConnectionStart
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setConnectEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_connectEnd = a3;
}

- (void)setHasConnectEnd:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasConnectEnd
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setConnected:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_connected = a3;
}

- (void)setHasConnected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConnected
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFirstWrite:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_firstWrite = a3;
}

- (void)setHasFirstWrite:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFirstWrite
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setFirstRead:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_firstRead = a3;
}

- (void)setHasFirstRead:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFirstRead
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsCellular:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isCellular = a3;
}

- (void)setHasIsCellular:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsCellular
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasProcname
{
  return self->_procname != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkStreamTaskTiming;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCFNetworkStreamTaskTiming description](&v3, sel_description), -[AWDCFNetworkStreamTaskTiming dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_taskCreationStart] forKey:@"taskCreationStart"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resumeStart] forKey:@"resumeStart"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectionInit] forKey:@"connectionInit"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_domainLookupStart] forKey:@"domainLookupStart"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_domainLookupEnd] forKey:@"domainLookupEnd"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectStart] forKey:@"connectStart"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_secureConnectionStart] forKey:@"secureConnectionStart"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectEnd] forKey:@"connectEnd"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connected] forKey:@"connected"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_firstWrite] forKey:@"firstWrite"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_firstRead] forKey:@"firstRead"];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_14:
  }
    [v3 setObject:[NSNumber numberWithLongLong:self->_isCellular] forKey:@"isCellular"];
LABEL_15:
  procname = self->_procname;
  if (procname) {
    [v3 setObject:procname forKey:@"procname"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCFNetworkStreamTaskTimingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_14:
  }
    PBDataWriterWriteInt64Field();
LABEL_15:
  if (self->_procname)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((void *)a3 + 13) = self->_timestamp;
    *((_WORD *)a3 + 60) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 12) = self->_taskCreationStart;
  *((_WORD *)a3 + 60) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 10) = self->_resumeStart;
  *((_WORD *)a3 + 60) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 4) = self->_connectionInit;
  *((_WORD *)a3 + 60) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 6) = self->_domainLookupStart;
  *((_WORD *)a3 + 60) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 5) = self->_domainLookupEnd;
  *((_WORD *)a3 + 60) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 2) = self->_connectStart;
  *((_WORD *)a3 + 60) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)a3 + 11) = self->_secureConnectionStart;
  *((_WORD *)a3 + 60) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)a3 + 1) = self->_connectEnd;
  *((_WORD *)a3 + 60) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)a3 + 3) = self->_connected;
  *((_WORD *)a3 + 60) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)a3 + 8) = self->_firstWrite;
  *((_WORD *)a3 + 60) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_28:
  *((void *)a3 + 7) = self->_firstRead;
  *((_WORD *)a3 + 60) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_14:
    *((void *)a3 + 9) = self->_isCellular;
    *((_WORD *)a3 + 60) |= 0x100u;
  }
LABEL_15:
  procname = self->_procname;
  if (procname) {
    [a3 setProcname:procname];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = (void *)v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *(void *)(v5 + 104) = self->_timestamp;
    *(_WORD *)(v5 + 120) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 96) = self->_taskCreationStart;
  *(_WORD *)(v5 + 120) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(void *)(v5 + 80) = self->_resumeStart;
  *(_WORD *)(v5 + 120) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(void *)(v5 + 32) = self->_connectionInit;
  *(_WORD *)(v5 + 120) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(void *)(v5 + 48) = self->_domainLookupStart;
  *(_WORD *)(v5 + 120) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(void *)(v5 + 40) = self->_domainLookupEnd;
  *(_WORD *)(v5 + 120) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(void *)(v5 + 16) = self->_connectStart;
  *(_WORD *)(v5 + 120) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(void *)(v5 + 88) = self->_secureConnectionStart;
  *(_WORD *)(v5 + 120) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(void *)(v5 + 8) = self->_connectEnd;
  *(_WORD *)(v5 + 120) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(void *)(v5 + 24) = self->_connected;
  *(_WORD *)(v5 + 120) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
LABEL_27:
    *(void *)(v5 + 56) = self->_firstRead;
    *(_WORD *)(v5 + 120) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_26:
  *(void *)(v5 + 64) = self->_firstWrite;
  *(_WORD *)(v5 + 120) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_27;
  }
LABEL_13:
  if ((has & 0x100) != 0)
  {
LABEL_14:
    *(void *)(v5 + 72) = self->_isCellular;
    *(_WORD *)(v5 + 120) |= 0x100u;
  }
LABEL_15:

  v6[14] = [(NSString *)self->_procname copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 60);
    if ((has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x1000) == 0 || self->_timestamp != *((void *)a3 + 13)) {
        goto LABEL_69;
      }
    }
    else if ((*((_WORD *)a3 + 60) & 0x1000) != 0)
    {
LABEL_69:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x800) == 0 || self->_taskCreationStart != *((void *)a3 + 12)) {
        goto LABEL_69;
      }
    }
    else if ((*((_WORD *)a3 + 60) & 0x800) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x200) == 0 || self->_resumeStart != *((void *)a3 + 10)) {
        goto LABEL_69;
      }
    }
    else if ((*((_WORD *)a3 + 60) & 0x200) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_connectionInit != *((void *)a3 + 4)) {
        goto LABEL_69;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_domainLookupStart != *((void *)a3 + 6)) {
        goto LABEL_69;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_domainLookupEnd != *((void *)a3 + 5)) {
        goto LABEL_69;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_connectStart != *((void *)a3 + 2)) {
        goto LABEL_69;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x400) == 0 || self->_secureConnectionStart != *((void *)a3 + 11)) {
        goto LABEL_69;
      }
    }
    else if ((*((_WORD *)a3 + 60) & 0x400) != 0)
    {
      goto LABEL_69;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_connectEnd != *((void *)a3 + 1)) {
        goto LABEL_69;
      }
    }
    else if (v7)
    {
      goto LABEL_69;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_connected != *((void *)a3 + 3)) {
        goto LABEL_69;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_firstWrite != *((void *)a3 + 8)) {
        goto LABEL_69;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_firstRead != *((void *)a3 + 7)) {
        goto LABEL_69;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x100) == 0 || self->_isCellular != *((void *)a3 + 9)) {
        goto LABEL_69;
      }
    }
    else if ((*((_WORD *)a3 + 60) & 0x100) != 0)
    {
      goto LABEL_69;
    }
    procname = self->_procname;
    if ((unint64_t)procname | *((void *)a3 + 14))
    {
      LOBYTE(v5) = -[NSString isEqual:](procname, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_taskCreationStart;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_resumeStart;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_connectionInit;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_domainLookupStart;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  unint64_t v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_domainLookupEnd;
    if ((has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  unint64_t v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_connectStart;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_secureConnectionStart;
    if (has) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v10 = 0;
  if (has)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_connectEnd;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_connected;
    if ((has & 0x80) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v12 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_12:
    unint64_t v13 = 2654435761u * self->_firstWrite;
    if ((has & 0x40) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    unint64_t v14 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_14;
    }
LABEL_27:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(NSString *)self->_procname hash];
  }
LABEL_25:
  unint64_t v13 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  unint64_t v14 = 2654435761u * self->_firstRead;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_27;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_isCellular;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(NSString *)self->_procname hash];
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x1000) != 0)
  {
    self->_timestamp = *((void *)a3 + 13);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v3 = *((_WORD *)a3 + 60);
    if ((v3 & 0x800) == 0)
    {
LABEL_3:
      if ((v3 & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)a3 + 60) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_taskCreationStart = *((void *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x200) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_resumeStart = *((void *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_connectionInit = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_domainLookupStart = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_domainLookupEnd = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_connectStart = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x400) == 0)
  {
LABEL_9:
    if ((v3 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_secureConnectionStart = *((void *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    if ((v3 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_connectEnd = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 4) == 0)
  {
LABEL_11:
    if ((v3 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_connected = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x80) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_firstWrite = *((void *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_28:
  self->_firstRead = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 60) & 0x100) != 0)
  {
LABEL_14:
    self->_isCellular = *((void *)a3 + 9);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_15:
  if (*((void *)a3 + 14)) {
    -[AWDCFNetworkStreamTaskTiming setProcname:](self, "setProcname:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)taskCreationStart
{
  return self->_taskCreationStart;
}

- (unint64_t)resumeStart
{
  return self->_resumeStart;
}

- (unint64_t)connectionInit
{
  return self->_connectionInit;
}

- (unint64_t)domainLookupStart
{
  return self->_domainLookupStart;
}

- (unint64_t)domainLookupEnd
{
  return self->_domainLookupEnd;
}

- (unint64_t)connectStart
{
  return self->_connectStart;
}

- (unint64_t)secureConnectionStart
{
  return self->_secureConnectionStart;
}

- (unint64_t)connectEnd
{
  return self->_connectEnd;
}

- (unint64_t)connected
{
  return self->_connected;
}

- (unint64_t)firstWrite
{
  return self->_firstWrite;
}

- (unint64_t)firstRead
{
  return self->_firstRead;
}

- (int64_t)isCellular
{
  return self->_isCellular;
}

- (NSString)procname
{
  return self->_procname;
}

- (void)setProcname:(id)a3
{
}

@end