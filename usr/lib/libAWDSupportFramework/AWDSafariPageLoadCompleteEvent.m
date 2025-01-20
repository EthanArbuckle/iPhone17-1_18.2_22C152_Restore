@interface AWDSafariPageLoadCompleteEvent
- (BOOL)hasConfigurationID;
- (BOOL)hasErrorCode;
- (BOOL)hasPageID;
- (BOOL)hasPageLoadTime;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)errorCode;
- (unint64_t)configurationID;
- (unint64_t)hash;
- (unint64_t)pageID;
- (unint64_t)pageLoadTime;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfigurationID:(unint64_t)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setHasConfigurationID:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasPageID:(BOOL)a3;
- (void)setHasPageLoadTime:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPageID:(unint64_t)a3;
- (void)setPageLoadTime:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariPageLoadCompleteEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setConfigurationID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_configurationID = a3;
}

- (void)setHasConfigurationID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfigurationID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPageID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_pageID = a3;
}

- (void)setHasPageID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPageID
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPageLoadTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_pageLoadTime = a3;
}

- (void)setHasPageLoadTime:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPageLoadTime
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariPageLoadCompleteEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariPageLoadCompleteEvent description](&v3, sel_description), -[AWDSafariPageLoadCompleteEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_configurationID] forKey:@"configurationID"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_pageLoadTime] forKey:@"pageLoadTime"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_pageID] forKey:@"pageID"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithLongLong:self->_errorCode] forKey:@"errorCode"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariPageLoadCompleteEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 2) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)a3 + 5) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = self->_configurationID;
  *((unsigned char *)a3 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((void *)a3 + 3) = self->_pageID;
  *((unsigned char *)a3 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return;
    }
LABEL_11:
    *((void *)a3 + 2) = self->_errorCode;
    *((unsigned char *)a3 + 48) |= 2u;
    return;
  }
LABEL_10:
  *((void *)a3 + 4) = self->_pageLoadTime;
  *((unsigned char *)a3 + 48) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)result + 5) = self->_timestamp;
    *((unsigned char *)result + 48) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_configurationID;
  *((unsigned char *)result + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 3) = self->_pageID;
  *((unsigned char *)result + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 4) = self->_pageLoadTime;
  *((unsigned char *)result + 48) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 2) = self->_errorCode;
  *((unsigned char *)result + 48) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x10) == 0 || self->_timestamp != *((void *)a3 + 5)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 0x10) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_configurationID != *((void *)a3 + 1)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_pageID != *((void *)a3 + 3)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 4) != 0)
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_pageLoadTime != *((void *)a3 + 4)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_errorCode != *((void *)a3 + 2)) {
        goto LABEL_26;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_configurationID;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_pageID;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_pageLoadTime;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_errorCode;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 0x10) != 0)
  {
    self->_timestamp = *((void *)a3 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
    char v3 = *((unsigned char *)a3 + 48);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_configurationID = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_pageID = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_11:
    self->_errorCode = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_10:
  self->_pageLoadTime = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 48) & 2) != 0) {
    goto LABEL_11;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)configurationID
{
  return self->_configurationID;
}

- (unint64_t)pageID
{
  return self->_pageID;
}

- (unint64_t)pageLoadTime
{
  return self->_pageLoadTime;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

@end