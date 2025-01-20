@interface AWDIDSRegistrationPhoneNumberReceivedSMS
- (BOOL)hasGuid;
- (BOOL)hasSmsRoundTripDuration;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)smsRoundTripDuration;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHasSmsRoundTripDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSmsRoundTripDuration:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSRegistrationPhoneNumberReceivedSMS

- (void)dealloc
{
  [(AWDIDSRegistrationPhoneNumberReceivedSMS *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationPhoneNumberReceivedSMS;
  [(AWDIDSRegistrationPhoneNumberReceivedSMS *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setSmsRoundTripDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_smsRoundTripDuration = a3;
}

- (void)setHasSmsRoundTripDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSmsRoundTripDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRegistrationPhoneNumberReceivedSMS;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSRegistrationPhoneNumberReceivedSMS description](&v3, sel_description), -[AWDIDSRegistrationPhoneNumberReceivedSMS dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_smsRoundTripDuration] forKey:@"smsRoundTripDuration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRegistrationPhoneNumberReceivedSMSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
  }
  if (self->_guid) {
    [a3 setGuid:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_smsRoundTripDuration;
    *((unsigned char *)a3 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 28) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_guid copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_smsRoundTripDuration;
    *(unsigned char *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    guid = self->_guid;
    if ((unint64_t)guid | *((void *)a3 + 2))
    {
      int v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_smsRoundTripDuration != *((_DWORD *)a3 + 6)) {
        goto LABEL_14;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_guid hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_smsRoundTripDuration;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 28))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDIDSRegistrationPhoneNumberReceivedSMS setGuid:](self, "setGuid:");
  }
  if ((*((unsigned char *)a3 + 28) & 2) != 0)
  {
    self->_smsRoundTripDuration = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (unsigned)smsRoundTripDuration
{
  return self->_smsRoundTripDuration;
}

@end