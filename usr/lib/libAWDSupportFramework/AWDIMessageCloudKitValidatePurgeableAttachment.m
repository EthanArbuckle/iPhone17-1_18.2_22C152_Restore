@interface AWDIMessageCloudKitValidatePurgeableAttachment
- (BOOL)hasAttachmentSize;
- (BOOL)hasConnectionType;
- (BOOL)hasLinkQuality;
- (BOOL)hasOperationalErrorCode;
- (BOOL)hasOperationalErrorDomain;
- (BOOL)hasTimestamp;
- (BOOL)hasValidatedAttachment;
- (BOOL)hasValidationErrorCode;
- (BOOL)hasValidationErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)operationalErrorDomain;
- (NSString)validationErrorDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)linkQuality;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)attachmentSize;
- (unsigned)connectionType;
- (unsigned)operationalErrorCode;
- (unsigned)validatedAttachment;
- (unsigned)validationErrorCode;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAttachmentSize:(unsigned int)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setHasAttachmentSize:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasLinkQuality:(BOOL)a3;
- (void)setHasOperationalErrorCode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasValidatedAttachment:(BOOL)a3;
- (void)setHasValidationErrorCode:(BOOL)a3;
- (void)setLinkQuality:(int)a3;
- (void)setOperationalErrorCode:(unsigned int)a3;
- (void)setOperationalErrorDomain:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setValidatedAttachment:(unsigned int)a3;
- (void)setValidationErrorCode:(unsigned int)a3;
- (void)setValidationErrorDomain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIMessageCloudKitValidatePurgeableAttachment

- (void)dealloc
{
  [(AWDIMessageCloudKitValidatePurgeableAttachment *)self setOperationalErrorDomain:0];
  [(AWDIMessageCloudKitValidatePurgeableAttachment *)self setValidationErrorDomain:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitValidatePurgeableAttachment;
  [(AWDIMessageCloudKitValidatePurgeableAttachment *)&v3 dealloc];
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

- (void)setValidatedAttachment:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_validatedAttachment = a3;
}

- (void)setHasValidatedAttachment:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasValidatedAttachment
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAttachmentSize:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_attachmentSize = a3;
}

- (void)setHasAttachmentSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAttachmentSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasOperationalErrorDomain
{
  return self->_operationalErrorDomain != 0;
}

- (void)setOperationalErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_operationalErrorCode = a3;
}

- (void)setHasOperationalErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOperationalErrorCode
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasValidationErrorDomain
{
  return self->_validationErrorDomain != 0;
}

- (void)setValidationErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_validationErrorCode = a3;
}

- (void)setHasValidationErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasValidationErrorCode
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasConnectionType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitValidatePurgeableAttachment;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIMessageCloudKitValidatePurgeableAttachment description](&v3, sel_description), -[AWDIMessageCloudKitValidatePurgeableAttachment dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_validatedAttachment] forKey:@"validatedAttachment"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_attachmentSize] forKey:@"attachmentSize"];
LABEL_5:
  operationalErrorDomain = self->_operationalErrorDomain;
  if (operationalErrorDomain) {
    [v3 setObject:operationalErrorDomain forKey:@"operationalErrorDomain"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_operationalErrorCode] forKey:@"operationalErrorCode"];
  }
  validationErrorDomain = self->_validationErrorDomain;
  if (validationErrorDomain) {
    [v3 setObject:validationErrorDomain forKey:@"validationErrorDomain"];
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x40) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_13;
    }
LABEL_20:
    [v3 setObject:[NSNumber numberWithInt:self->_linkQuality] forKey:@"linkQuality"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_14;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_validationErrorCode] forKey:@"validationErrorCode"];
  char v7 = (char)self->_has;
  if ((v7 & 8) != 0) {
    goto LABEL_20;
  }
LABEL_13:
  if ((v7 & 4) != 0) {
LABEL_14:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageCloudKitValidatePurgeableAttachmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  if (self->_operationalErrorDomain) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_validationErrorDomain) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x40) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_13;
    }
LABEL_19:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_20;
  }
  PBDataWriterWriteUint32Field();
  char v5 = (char)self->_has;
  if ((v5 & 8) != 0) {
    goto LABEL_19;
  }
LABEL_13:
  if ((v5 & 4) == 0) {
    return;
  }
LABEL_20:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_validatedAttachment;
  *((unsigned char *)a3 + 56) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 4) = self->_attachmentSize;
    *((unsigned char *)a3 + 56) |= 2u;
  }
LABEL_5:
  if (self->_operationalErrorDomain) {
    [a3 setOperationalErrorDomain:];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_operationalErrorCode;
    *((unsigned char *)a3 + 56) |= 0x10u;
  }
  if (self->_validationErrorDomain) {
    [a3 setValidationErrorDomain:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_validationErrorCode;
    *((unsigned char *)a3 + 56) |= 0x40u;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 4) == 0) {
        return;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)a3 + 6) = self->_linkQuality;
  *((unsigned char *)a3 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_connectionType;
  *((unsigned char *)a3 + 56) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_validatedAttachment;
  *(unsigned char *)(v5 + 56) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_attachmentSize;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
LABEL_5:

  *(void *)(v6 + 32) = [(NSString *)self->_operationalErrorDomain copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_operationalErrorCode;
    *(unsigned char *)(v6 + 56) |= 0x10u;
  }

  *(void *)(v6 + 48) = [(NSString *)self->_validationErrorDomain copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 0x40) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_16:
    *(_DWORD *)(v6 + 24) = self->_linkQuality;
    *(unsigned char *)(v6 + 56) |= 8u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v6;
    }
    goto LABEL_10;
  }
  *(_DWORD *)(v6 + 44) = self->_validationErrorCode;
  *(unsigned char *)(v6 + 56) |= 0x40u;
  char v8 = (char)self->_has;
  if ((v8 & 8) != 0) {
    goto LABEL_16;
  }
LABEL_9:
  if ((v8 & 4) != 0)
  {
LABEL_10:
    *(_DWORD *)(v6 + 20) = self->_connectionType;
    *(unsigned char *)(v6 + 56) |= 4u;
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
      if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
LABEL_42:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x20) == 0 || self->_validatedAttachment != *((_DWORD *)a3 + 10)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x20) != 0)
    {
      goto LABEL_42;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_attachmentSize != *((_DWORD *)a3 + 4)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 2) != 0)
    {
      goto LABEL_42;
    }
    operationalErrorDomain = self->_operationalErrorDomain;
    if ((unint64_t)operationalErrorDomain | *((void *)a3 + 4))
    {
      int v5 = -[NSString isEqual:](operationalErrorDomain, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x10) == 0 || self->_operationalErrorCode != *((_DWORD *)a3 + 7)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_42;
    }
    validationErrorDomain = self->_validationErrorDomain;
    if ((unint64_t)validationErrorDomain | *((void *)a3 + 6))
    {
      int v5 = -[NSString isEqual:](validationErrorDomain, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x40) == 0 || self->_validationErrorCode != *((_DWORD *)a3 + 11)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x40) != 0)
    {
      goto LABEL_42;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_linkQuality != *((_DWORD *)a3 + 6)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 8) != 0)
    {
      goto LABEL_42;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 56) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 5)) {
        goto LABEL_42;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v3 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_validatedAttachment;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_attachmentSize;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_operationalErrorDomain hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v7 = 2654435761 * self->_operationalErrorCode;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_validationErrorDomain hash];
  if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v9 = 2654435761 * self->_validationErrorCode;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v10 = 2654435761 * self->_linkQuality;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v11 = 2654435761 * self->_connectionType;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 56);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 56);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_validatedAttachment = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 56) & 2) != 0)
  {
LABEL_4:
    self->_attachmentSize = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((void *)a3 + 4)) {
    -[AWDIMessageCloudKitValidatePurgeableAttachment setOperationalErrorDomain:](self, "setOperationalErrorDomain:");
  }
  if ((*((unsigned char *)a3 + 56) & 0x10) != 0)
  {
    self->_operationalErrorCode = *((_DWORD *)a3 + 7);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 6)) {
    -[AWDIMessageCloudKitValidatePurgeableAttachment setValidationErrorDomain:](self, "setValidationErrorDomain:");
  }
  char v6 = *((unsigned char *)a3 + 56);
  if ((v6 & 0x40) != 0)
  {
    self->_validationErrorCode = *((_DWORD *)a3 + 11);
    *(unsigned char *)&self->_has |= 0x40u;
    char v6 = *((unsigned char *)a3 + 56);
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 4) == 0) {
        return;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_linkQuality = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 56) & 4) == 0) {
    return;
  }
LABEL_14:
  self->_connectionType = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)validatedAttachment
{
  return self->_validatedAttachment;
}

- (unsigned)attachmentSize
{
  return self->_attachmentSize;
}

- (NSString)operationalErrorDomain
{
  return self->_operationalErrorDomain;
}

- (void)setOperationalErrorDomain:(id)a3
{
}

- (unsigned)operationalErrorCode
{
  return self->_operationalErrorCode;
}

- (NSString)validationErrorDomain
{
  return self->_validationErrorDomain;
}

- (void)setValidationErrorDomain:(id)a3
{
}

- (unsigned)validationErrorCode
{
  return self->_validationErrorCode;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

@end