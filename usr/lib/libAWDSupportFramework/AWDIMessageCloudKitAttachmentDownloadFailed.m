@interface AWDIMessageCloudKitAttachmentDownloadFailed
- (BOOL)hasAttachmentGuid;
- (BOOL)hasAttachmentSize;
- (BOOL)hasConnectionType;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasLinkQuality;
- (BOOL)hasMessageGuid;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)attachmentGuid;
- (NSString)errorDomain;
- (NSString)messageGuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)errorCode;
- (int)linkQuality;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)attachmentSize;
- (unsigned)connectionType;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAttachmentGuid:(id)a3;
- (void)setAttachmentSize:(unsigned int)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasAttachmentSize:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasLinkQuality:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLinkQuality:(int)a3;
- (void)setMessageGuid:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIMessageCloudKitAttachmentDownloadFailed

- (void)dealloc
{
  [(AWDIMessageCloudKitAttachmentDownloadFailed *)self setMessageGuid:0];
  [(AWDIMessageCloudKitAttachmentDownloadFailed *)self setAttachmentGuid:0];
  [(AWDIMessageCloudKitAttachmentDownloadFailed *)self setErrorDomain:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitAttachmentDownloadFailed;
  [(AWDIMessageCloudKitAttachmentDownloadFailed *)&v3 dealloc];
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

- (BOOL)hasMessageGuid
{
  return self->_messageGuid != 0;
}

- (BOOL)hasAttachmentGuid
{
  return self->_attachmentGuid != 0;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitAttachmentDownloadFailed;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIMessageCloudKitAttachmentDownloadFailed description](&v3, sel_description), -[AWDIMessageCloudKitAttachmentDownloadFailed dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  messageGuid = self->_messageGuid;
  if (messageGuid) {
    [v3 setObject:messageGuid forKey:@"messageGuid"];
  }
  attachmentGuid = self->_attachmentGuid;
  if (attachmentGuid) {
    [v3 setObject:attachmentGuid forKey:@"attachmentGuid"];
  }
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"errorDomain"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_errorCode] forKey:@"errorCode"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
LABEL_17:
      [v3 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        return v3;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_linkQuality] forKey:@"linkQuality"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_17;
  }
LABEL_12:
  if ((has & 2) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_attachmentSize] forKey:@"attachmentSize"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageCloudKitAttachmentDownloadFailedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_messageGuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_attachmentGuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_errorDomain) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
LABEL_16:
      PBDataWriterWriteUint32Field();
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        return;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if ((has & 2) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 1u;
  }
  if (self->_messageGuid) {
    [a3 setMessageGuid:];
  }
  if (self->_attachmentGuid) {
    [a3 setAttachmentGuid:];
  }
  if (self->_errorDomain) {
    [a3 setErrorDomain:];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_errorCode;
    *((unsigned char *)a3 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)a3 + 12) = self->_linkQuality;
  *((unsigned char *)a3 + 64) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_17:
  *((_DWORD *)a3 + 7) = self->_connectionType;
  *((unsigned char *)a3 + 64) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return;
  }
LABEL_13:
  *((_DWORD *)a3 + 6) = self->_attachmentSize;
  *((unsigned char *)a3 + 64) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
  }

  *(void *)(v6 + 56) = [(NSString *)self->_messageGuid copyWithZone:a3];
  *(void *)(v6 + 16) = [(NSString *)self->_attachmentGuid copyWithZone:a3];

  *(void *)(v6 + 40) = [(NSString *)self->_errorDomain copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_errorCode;
    *(unsigned char *)(v6 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(_DWORD *)(v6 + 28) = self->_connectionType;
      *(unsigned char *)(v6 + 64) |= 4u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        return (id)v6;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 48) = self->_linkQuality;
  *(unsigned char *)(v6 + 64) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 2) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 24) = self->_attachmentSize;
    *(unsigned char *)(v6 + 64) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
LABEL_32:
      LOBYTE(v5) = 0;
      return v5;
    }
    messageGuid = self->_messageGuid;
    if (!((unint64_t)messageGuid | *((void *)a3 + 7))
      || (int v5 = -[NSString isEqual:](messageGuid, "isEqual:")) != 0)
    {
      attachmentGuid = self->_attachmentGuid;
      if (!((unint64_t)attachmentGuid | *((void *)a3 + 2))
        || (int v5 = -[NSString isEqual:](attachmentGuid, "isEqual:")) != 0)
      {
        errorDomain = self->_errorDomain;
        if (!((unint64_t)errorDomain | *((void *)a3 + 5))
          || (int v5 = -[NSString isEqual:](errorDomain, "isEqual:")) != 0)
        {
          if ((*(unsigned char *)&self->_has & 8) != 0)
          {
            if ((*((unsigned char *)a3 + 64) & 8) == 0 || self->_errorCode != *((_DWORD *)a3 + 8)) {
              goto LABEL_32;
            }
          }
          else if ((*((unsigned char *)a3 + 64) & 8) != 0)
          {
            goto LABEL_32;
          }
          if ((*(unsigned char *)&self->_has & 0x10) != 0)
          {
            if ((*((unsigned char *)a3 + 64) & 0x10) == 0 || self->_linkQuality != *((_DWORD *)a3 + 12)) {
              goto LABEL_32;
            }
          }
          else if ((*((unsigned char *)a3 + 64) & 0x10) != 0)
          {
            goto LABEL_32;
          }
          if ((*(unsigned char *)&self->_has & 4) != 0)
          {
            if ((*((unsigned char *)a3 + 64) & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 7)) {
              goto LABEL_32;
            }
          }
          else if ((*((unsigned char *)a3 + 64) & 4) != 0)
          {
            goto LABEL_32;
          }
          LOBYTE(v5) = (*((unsigned char *)a3 + 64) & 2) == 0;
          if ((*(unsigned char *)&self->_has & 2) != 0)
          {
            if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_attachmentSize != *((_DWORD *)a3 + 6)) {
              goto LABEL_32;
            }
            LOBYTE(v5) = 1;
          }
        }
      }
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
  NSUInteger v4 = [(NSString *)self->_messageGuid hash];
  NSUInteger v5 = [(NSString *)self->_attachmentGuid hash];
  NSUInteger v6 = [(NSString *)self->_errorDomain hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_errorCode;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_linkQuality;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v9 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v10 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_connectionType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_attachmentSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 64))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 7)) {
    -[AWDIMessageCloudKitAttachmentDownloadFailed setMessageGuid:](self, "setMessageGuid:");
  }
  if (*((void *)a3 + 2)) {
    -[AWDIMessageCloudKitAttachmentDownloadFailed setAttachmentGuid:](self, "setAttachmentGuid:");
  }
  if (*((void *)a3 + 5)) {
    -[AWDIMessageCloudKitAttachmentDownloadFailed setErrorDomain:](self, "setErrorDomain:");
  }
  char v5 = *((unsigned char *)a3 + 64);
  if ((v5 & 8) != 0)
  {
    self->_errorCode = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)a3 + 64);
    if ((v5 & 0x10) == 0)
    {
LABEL_11:
      if ((v5 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 0x10) == 0)
  {
    goto LABEL_11;
  }
  self->_linkQuality = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 64);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_17:
  self->_connectionType = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 64) & 2) == 0) {
    return;
  }
LABEL_13:
  self->_attachmentSize = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)messageGuid
{
  return self->_messageGuid;
}

- (void)setMessageGuid:(id)a3
{
}

- (NSString)attachmentGuid
{
  return self->_attachmentGuid;
}

- (void)setAttachmentGuid:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)attachmentSize
{
  return self->_attachmentSize;
}

@end