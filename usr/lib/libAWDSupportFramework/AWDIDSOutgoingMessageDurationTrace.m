@interface AWDIDSOutgoingMessageDurationTrace
- (BOOL)hasAggregatedMessageSendCount;
- (BOOL)hasAvgAggregatedMessageSendDuration;
- (BOOL)hasAvgEncryptionDuration;
- (BOOL)hasCommand;
- (BOOL)hasCompressPayloadDuration;
- (BOOL)hasCompressPayloadStart;
- (BOOL)hasCompressedMessageSize;
- (BOOL)hasEncryptionCount;
- (BOOL)hasIDQueryDuration;
- (BOOL)hasIDQueryStart;
- (BOOL)hasMessageOnQueueDuration;
- (BOOL)hasMessageOnQueueStart;
- (BOOL)hasMessagesOnQueue;
- (BOOL)hasPriority;
- (BOOL)hasSendToDaemonDuration;
- (BOOL)hasSendToDaemonStart;
- (BOOL)hasService;
- (BOOL)hasStoreInDatabaseDuration;
- (BOOL)hasStoreInDatabaseStart;
- (BOOL)hasTimestamp;
- (BOOL)hasUncompressedMessageSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)compressedMessageSize;
- (unint64_t)hash;
- (unint64_t)messagesOnQueue;
- (unint64_t)timestamp;
- (unint64_t)uncompressedMessageSize;
- (unsigned)aggregatedMessageSendCount;
- (unsigned)avgAggregatedMessageSendDuration;
- (unsigned)avgEncryptionDuration;
- (unsigned)command;
- (unsigned)compressPayloadDuration;
- (unsigned)compressPayloadStart;
- (unsigned)encryptionCount;
- (unsigned)iDQueryDuration;
- (unsigned)iDQueryStart;
- (unsigned)messageOnQueueDuration;
- (unsigned)messageOnQueueStart;
- (unsigned)priority;
- (unsigned)sendToDaemonDuration;
- (unsigned)sendToDaemonStart;
- (unsigned)storeInDatabaseDuration;
- (unsigned)storeInDatabaseStart;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAggregatedMessageSendCount:(unsigned int)a3;
- (void)setAvgAggregatedMessageSendDuration:(unsigned int)a3;
- (void)setAvgEncryptionDuration:(unsigned int)a3;
- (void)setCommand:(unsigned int)a3;
- (void)setCompressPayloadDuration:(unsigned int)a3;
- (void)setCompressPayloadStart:(unsigned int)a3;
- (void)setCompressedMessageSize:(unint64_t)a3;
- (void)setEncryptionCount:(unsigned int)a3;
- (void)setHasAggregatedMessageSendCount:(BOOL)a3;
- (void)setHasAvgAggregatedMessageSendDuration:(BOOL)a3;
- (void)setHasAvgEncryptionDuration:(BOOL)a3;
- (void)setHasCommand:(BOOL)a3;
- (void)setHasCompressPayloadDuration:(BOOL)a3;
- (void)setHasCompressPayloadStart:(BOOL)a3;
- (void)setHasCompressedMessageSize:(BOOL)a3;
- (void)setHasEncryptionCount:(BOOL)a3;
- (void)setHasIDQueryDuration:(BOOL)a3;
- (void)setHasIDQueryStart:(BOOL)a3;
- (void)setHasMessageOnQueueDuration:(BOOL)a3;
- (void)setHasMessageOnQueueStart:(BOOL)a3;
- (void)setHasMessagesOnQueue:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasSendToDaemonDuration:(BOOL)a3;
- (void)setHasSendToDaemonStart:(BOOL)a3;
- (void)setHasStoreInDatabaseDuration:(BOOL)a3;
- (void)setHasStoreInDatabaseStart:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUncompressedMessageSize:(BOOL)a3;
- (void)setIDQueryDuration:(unsigned int)a3;
- (void)setIDQueryStart:(unsigned int)a3;
- (void)setMessageOnQueueDuration:(unsigned int)a3;
- (void)setMessageOnQueueStart:(unsigned int)a3;
- (void)setMessagesOnQueue:(unint64_t)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setSendToDaemonDuration:(unsigned int)a3;
- (void)setSendToDaemonStart:(unsigned int)a3;
- (void)setService:(id)a3;
- (void)setStoreInDatabaseDuration:(unsigned int)a3;
- (void)setStoreInDatabaseStart:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUncompressedMessageSize:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSOutgoingMessageDurationTrace

- (void)dealloc
{
  [(AWDIDSOutgoingMessageDurationTrace *)self setService:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSOutgoingMessageDurationTrace;
  [(AWDIDSOutgoingMessageDurationTrace *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSendToDaemonStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_sendToDaemonStart = a3;
}

- (void)setHasSendToDaemonStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSendToDaemonStart
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSendToDaemonDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_sendToDaemonDuration = a3;
}

- (void)setHasSendToDaemonDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSendToDaemonDuration
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setStoreInDatabaseStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_storeInDatabaseStart = a3;
}

- (void)setHasStoreInDatabaseStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasStoreInDatabaseStart
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setStoreInDatabaseDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_storeInDatabaseDuration = a3;
}

- (void)setHasStoreInDatabaseDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasStoreInDatabaseDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCompressPayloadStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_compressPayloadStart = a3;
}

- (void)setHasCompressPayloadStart:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasCompressPayloadStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCompressPayloadDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_compressPayloadDuration = a3;
}

- (void)setHasCompressPayloadDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCompressPayloadDuration
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setUncompressedMessageSize:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_uncompressedMessageSize = a3;
}

- (void)setHasUncompressedMessageSize:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasUncompressedMessageSize
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCompressedMessageSize:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_compressedMessageSize = a3;
}

- (void)setHasCompressedMessageSize:(BOOL)a3
{
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCompressedMessageSize
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIDQueryStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_iDQueryStart = a3;
}

- (void)setHasIDQueryStart:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIDQueryStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIDQueryDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_iDQueryDuration = a3;
}

- (void)setHasIDQueryDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIDQueryDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMessageOnQueueStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_messageOnQueueStart = a3;
}

- (void)setHasMessageOnQueueStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasMessageOnQueueStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMessageOnQueueDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_messageOnQueueDuration = a3;
}

- (void)setHasMessageOnQueueDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMessageOnQueueDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMessagesOnQueue:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_messagesOnQueue = a3;
}

- (void)setHasMessagesOnQueue:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasMessagesOnQueue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEncryptionCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_encryptionCount = a3;
}

- (void)setHasEncryptionCount:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasEncryptionCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAvgEncryptionDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_avgEncryptionDuration = a3;
}

- (void)setHasAvgEncryptionDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasAvgEncryptionDuration
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAggregatedMessageSendCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_aggregatedMessageSendCount = a3;
}

- (void)setHasAggregatedMessageSendCount:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAggregatedMessageSendCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAvgAggregatedMessageSendDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_avgAggregatedMessageSendDuration = a3;
}

- (void)setHasAvgAggregatedMessageSendDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAvgAggregatedMessageSendDuration
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setCommand:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_command = a3;
}

- (void)setHasCommand:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCommand
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setPriority:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($7F0D611AE92F61BCAF01D83A32E04512)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPriority
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSOutgoingMessageDurationTrace;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSOutgoingMessageDurationTrace description](&v3, sel_description), -[AWDIDSOutgoingMessageDurationTrace dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sendToDaemonStart] forKey:@"sendToDaemonStart"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sendToDaemonDuration] forKey:@"sendToDaemonDuration"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_storeInDatabaseStart] forKey:@"storeInDatabaseStart"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_storeInDatabaseDuration] forKey:@"storeInDatabaseDuration"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_compressPayloadStart] forKey:@"compressPayloadStart"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_compressPayloadDuration] forKey:@"compressPayloadDuration"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_uncompressedMessageSize] forKey:@"uncompressedMessageSize"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_compressedMessageSize] forKey:@"compressedMessageSize"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_iDQueryStart] forKey:@"IDQueryStart"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_iDQueryDuration] forKey:@"IDQueryDuration"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_messageOnQueueStart] forKey:@"messageOnQueueStart"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_messageOnQueueDuration] forKey:@"messageOnQueueDuration"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_messagesOnQueue] forKey:@"messagesOnQueue"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_encryptionCount] forKey:@"encryptionCount"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_avgEncryptionDuration] forKey:@"avgEncryptionDuration"];
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_aggregatedMessageSendCount] forKey:@"aggregatedMessageSendCount"];
  if ((*(_DWORD *)&self->_has & 0x20) != 0) {
LABEL_19:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_avgAggregatedMessageSendDuration] forKey:@"avgAggregatedMessageSendDuration"];
LABEL_20:
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  $7F0D611AE92F61BCAF01D83A32E04512 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_command] forKey:@"command"];
    $7F0D611AE92F61BCAF01D83A32E04512 v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x8000) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_priority] forKey:@"priority"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSOutgoingMessageDurationTraceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0) {
LABEL_19:
  }
    PBDataWriterWriteUint32Field();
LABEL_20:
  if (self->_service) {
    PBDataWriterWriteStringField();
  }
  $7F0D611AE92F61BCAF01D83A32E04512 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    $7F0D611AE92F61BCAF01D83A32E04512 v5 = self->_has;
  }
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((_DWORD *)a3 + 28) |= 4u;
    $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 23) = self->_sendToDaemonStart;
  *((_DWORD *)a3 + 28) |= 0x20000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 22) = self->_sendToDaemonDuration;
  *((_DWORD *)a3 + 28) |= 0x10000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 27) = self->_storeInDatabaseStart;
  *((_DWORD *)a3 + 28) |= 0x80000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 26) = self->_storeInDatabaseDuration;
  *((_DWORD *)a3 + 28) |= 0x40000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 15) = self->_compressPayloadStart;
  *((_DWORD *)a3 + 28) |= 0x200u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 14) = self->_compressPayloadDuration;
  *((_DWORD *)a3 + 28) |= 0x100u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)a3 + 4) = self->_uncompressedMessageSize;
  *((_DWORD *)a3 + 28) |= 8u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)a3 + 1) = self->_compressedMessageSize;
  *((_DWORD *)a3 + 28) |= 1u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 18) = self->_iDQueryStart;
  *((_DWORD *)a3 + 28) |= 0x1000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 17) = self->_iDQueryDuration;
  *((_DWORD *)a3 + 28) |= 0x800u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 20) = self->_messageOnQueueStart;
  *((_DWORD *)a3 + 28) |= 0x4000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 19) = self->_messageOnQueueDuration;
  *((_DWORD *)a3 + 28) |= 0x2000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)a3 + 2) = self->_messagesOnQueue;
  *((_DWORD *)a3 + 28) |= 2u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 16) = self->_encryptionCount;
  *((_DWORD *)a3 + 28) |= 0x400u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 12) = self->_avgEncryptionDuration;
  *((_DWORD *)a3 + 28) |= 0x40u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_43:
  *((_DWORD *)a3 + 10) = self->_aggregatedMessageSendCount;
  *((_DWORD *)a3 + 28) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_19:
    *((_DWORD *)a3 + 11) = self->_avgAggregatedMessageSendDuration;
    *((_DWORD *)a3 + 28) |= 0x20u;
  }
LABEL_20:
  if (self->_service) {
    [a3 setService:];
  }
  $7F0D611AE92F61BCAF01D83A32E04512 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_command;
    *((_DWORD *)a3 + 28) |= 0x80u;
    $7F0D611AE92F61BCAF01D83A32E04512 v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
    *((_DWORD *)a3 + 21) = self->_priority;
    *((_DWORD *)a3 + 28) |= 0x8000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(_DWORD *)(v5 + 112) |= 4u;
    $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 92) = self->_sendToDaemonStart;
  *(_DWORD *)(v5 + 112) |= 0x20000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 88) = self->_sendToDaemonDuration;
  *(_DWORD *)(v5 + 112) |= 0x10000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 108) = self->_storeInDatabaseStart;
  *(_DWORD *)(v5 + 112) |= 0x80000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 104) = self->_storeInDatabaseDuration;
  *(_DWORD *)(v5 + 112) |= 0x40000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 60) = self->_compressPayloadStart;
  *(_DWORD *)(v5 + 112) |= 0x200u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 56) = self->_compressPayloadDuration;
  *(_DWORD *)(v5 + 112) |= 0x100u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(void *)(v5 + 32) = self->_uncompressedMessageSize;
  *(_DWORD *)(v5 + 112) |= 8u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(void *)(v5 + 8) = self->_compressedMessageSize;
  *(_DWORD *)(v5 + 112) |= 1u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v5 + 72) = self->_iDQueryStart;
  *(_DWORD *)(v5 + 112) |= 0x1000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 68) = self->_iDQueryDuration;
  *(_DWORD *)(v5 + 112) |= 0x800u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 80) = self->_messageOnQueueStart;
  *(_DWORD *)(v5 + 112) |= 0x4000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 76) = self->_messageOnQueueDuration;
  *(_DWORD *)(v5 + 112) |= 0x2000u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(void *)(v5 + 16) = self->_messagesOnQueue;
  *(_DWORD *)(v5 + 112) |= 2u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 64) = self->_encryptionCount;
  *(_DWORD *)(v5 + 112) |= 0x400u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 48) = self->_avgEncryptionDuration;
  *(_DWORD *)(v5 + 112) |= 0x40u;
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_41:
  *(_DWORD *)(v5 + 40) = self->_aggregatedMessageSendCount;
  *(_DWORD *)(v5 + 112) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_19:
    *(_DWORD *)(v5 + 44) = self->_avgAggregatedMessageSendDuration;
    *(_DWORD *)(v5 + 112) |= 0x20u;
  }
LABEL_20:

  *(void *)(v6 + 96) = [(NSString *)self->_service copyWithZone:a3];
  $7F0D611AE92F61BCAF01D83A32E04512 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_command;
    *(_DWORD *)(v6 + 112) |= 0x80u;
    $7F0D611AE92F61BCAF01D83A32E04512 v8 = self->_has;
  }
  if ((*(_WORD *)&v8 & 0x8000) != 0)
  {
    *(_DWORD *)(v6 + 84) = self->_priority;
    *(_DWORD *)(v6 + 112) |= 0x8000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
    int v7 = *((_DWORD *)a3 + 28);
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 4) != 0)
    {
LABEL_104:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_sendToDaemonStart != *((_DWORD *)a3 + 23)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_sendToDaemonDuration != *((_DWORD *)a3 + 22)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_storeInDatabaseStart != *((_DWORD *)a3 + 27)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_storeInDatabaseDuration != *((_DWORD *)a3 + 26)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_compressPayloadStart != *((_DWORD *)a3 + 15)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_compressPayloadDuration != *((_DWORD *)a3 + 14)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_104;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_uncompressedMessageSize != *((void *)a3 + 4)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_104;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_compressedMessageSize != *((void *)a3 + 1)) {
        goto LABEL_104;
      }
    }
    else if (v7)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_iDQueryStart != *((_DWORD *)a3 + 18)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_iDQueryDuration != *((_DWORD *)a3 + 17)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_messageOnQueueStart != *((_DWORD *)a3 + 20)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_messageOnQueueDuration != *((_DWORD *)a3 + 19)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_104;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_messagesOnQueue != *((void *)a3 + 2)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_104;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_encryptionCount != *((_DWORD *)a3 + 16)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_104;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_avgEncryptionDuration != *((_DWORD *)a3 + 12)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_104;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_aggregatedMessageSendCount != *((_DWORD *)a3 + 10)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_104;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_avgAggregatedMessageSendDuration != *((_DWORD *)a3 + 11)) {
        goto LABEL_104;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_104;
    }
    service = self->_service;
    if ((unint64_t)service | *((void *)a3 + 12))
    {
      int v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5) {
        return v5;
      }
      $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
    }
    int v9 = *((_DWORD *)a3 + 28);
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_command != *((_DWORD *)a3 + 13)) {
        goto LABEL_104;
      }
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_104;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 28) & 0x8000) == 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v9 & 0x8000) == 0 || self->_priority != *((_DWORD *)a3 + 21)) {
        goto LABEL_104;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $7F0D611AE92F61BCAF01D83A32E04512 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    unint64_t v26 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
LABEL_3:
      uint64_t v25 = 2654435761 * self->_sendToDaemonStart;
      if ((*(_DWORD *)&has & 0x10000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t v26 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_4:
    uint64_t v24 = 2654435761 * self->_sendToDaemonDuration;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_5:
    uint64_t v23 = 2654435761 * self->_storeInDatabaseStart;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_6:
    uint64_t v22 = 2654435761 * self->_storeInDatabaseDuration;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v22 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v21 = 2654435761 * self->_compressPayloadStart;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v21 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_8:
    uint64_t v20 = 2654435761 * self->_compressPayloadDuration;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_9:
    unint64_t v19 = 2654435761u * self->_uncompressedMessageSize;
    if (*(unsigned char *)&has) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  unint64_t v19 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_10:
    unint64_t v18 = 2654435761u * self->_compressedMessageSize;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    uint64_t v17 = 2654435761 * self->_iDQueryStart;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_12:
    uint64_t v4 = 2654435761 * self->_iDQueryDuration;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    uint64_t v5 = 2654435761 * self->_messageOnQueueStart;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_14:
    uint64_t v6 = 2654435761 * self->_messageOnQueueDuration;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_15:
    unint64_t v7 = 2654435761u * self->_messagesOnQueue;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  unint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_16:
    uint64_t v8 = 2654435761 * self->_encryptionCount;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_17:
    uint64_t v9 = 2654435761 * self->_avgEncryptionDuration;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_18;
    }
LABEL_36:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
LABEL_35:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 0x10) == 0) {
    goto LABEL_36;
  }
LABEL_18:
  uint64_t v10 = 2654435761 * self->_aggregatedMessageSendCount;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_19:
    uint64_t v11 = 2654435761 * self->_avgAggregatedMessageSendDuration;
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v11 = 0;
LABEL_38:
  NSUInteger v12 = [(NSString *)self->_service hash];
  $7F0D611AE92F61BCAF01D83A32E04512 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x80) != 0)
  {
    uint64_t v14 = 2654435761 * self->_command;
    if ((*(_WORD *)&v13 & 0x8000) != 0) {
      goto LABEL_40;
    }
LABEL_42:
    uint64_t v15 = 0;
    return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v14 ^ v15 ^ v12;
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&v13 & 0x8000) == 0) {
    goto LABEL_42;
  }
LABEL_40:
  uint64_t v15 = 2654435761 * self->_priority;
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v14 ^ v15 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
    int v5 = *((_DWORD *)a3 + 28);
    if ((v5 & 0x20000) == 0)
    {
LABEL_3:
      if ((v5 & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  self->_sendToDaemonStart = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x10000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_sendToDaemonDuration = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x80000) == 0)
  {
LABEL_5:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_storeInDatabaseStart = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x40000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_storeInDatabaseDuration = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_compressPayloadStart = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_compressPayloadDuration = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_uncompressedMessageSize = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_compressedMessageSize = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_iDQueryStart = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_iDQueryDuration = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_messageOnQueueStart = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x2000) == 0)
  {
LABEL_14:
    if ((v5 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_messageOnQueueDuration = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_15:
    if ((v5 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_messagesOnQueue = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x400) == 0)
  {
LABEL_16:
    if ((v5 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_encryptionCount = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x40) == 0)
  {
LABEL_17:
    if ((v5 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_avgEncryptionDuration = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_18:
    if ((v5 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_43:
  self->_aggregatedMessageSendCount = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)a3 + 28) & 0x20) != 0)
  {
LABEL_19:
    self->_avgAggregatedMessageSendDuration = *((_DWORD *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_20:
  if (*((void *)a3 + 12)) {
    -[AWDIDSOutgoingMessageDurationTrace setService:](self, "setService:");
  }
  int v6 = *((_DWORD *)a3 + 28);
  if ((v6 & 0x80) != 0)
  {
    self->_command = *((_DWORD *)a3 + 13);
    *(_DWORD *)&self->_has |= 0x80u;
    int v6 = *((_DWORD *)a3 + 28);
  }
  if ((v6 & 0x8000) != 0)
  {
    self->_priority = *((_DWORD *)a3 + 21);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)sendToDaemonStart
{
  return self->_sendToDaemonStart;
}

- (unsigned)sendToDaemonDuration
{
  return self->_sendToDaemonDuration;
}

- (unsigned)storeInDatabaseStart
{
  return self->_storeInDatabaseStart;
}

- (unsigned)storeInDatabaseDuration
{
  return self->_storeInDatabaseDuration;
}

- (unsigned)compressPayloadStart
{
  return self->_compressPayloadStart;
}

- (unsigned)compressPayloadDuration
{
  return self->_compressPayloadDuration;
}

- (unint64_t)uncompressedMessageSize
{
  return self->_uncompressedMessageSize;
}

- (unint64_t)compressedMessageSize
{
  return self->_compressedMessageSize;
}

- (unsigned)iDQueryStart
{
  return self->_iDQueryStart;
}

- (unsigned)iDQueryDuration
{
  return self->_iDQueryDuration;
}

- (unsigned)messageOnQueueStart
{
  return self->_messageOnQueueStart;
}

- (unsigned)messageOnQueueDuration
{
  return self->_messageOnQueueDuration;
}

- (unint64_t)messagesOnQueue
{
  return self->_messagesOnQueue;
}

- (unsigned)encryptionCount
{
  return self->_encryptionCount;
}

- (unsigned)avgEncryptionDuration
{
  return self->_avgEncryptionDuration;
}

- (unsigned)aggregatedMessageSendCount
{
  return self->_aggregatedMessageSendCount;
}

- (unsigned)avgAggregatedMessageSendDuration
{
  return self->_avgAggregatedMessageSendDuration;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (unsigned)command
{
  return self->_command;
}

- (unsigned)priority
{
  return self->_priority;
}

@end