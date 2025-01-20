@interface AWDNWActivity
- (AWDNWDeviceReport)deviceReport;
- (AWDNWL2Report)l2Report;
- (BOOL)hasActivityDomain;
- (BOOL)hasActivityLabel;
- (BOOL)hasActivityUUID;
- (BOOL)hasBundleID;
- (BOOL)hasDeviceReport;
- (BOOL)hasInvestigationID;
- (BOOL)hasIsRetry;
- (BOOL)hasL2Report;
- (BOOL)hasParentActivityUUID;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRetry;
- (BOOL)readFrom:(id)a3;
- (NSString)activityUUID;
- (NSString)bundleID;
- (NSString)parentActivityUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)activityDomain;
- (unint64_t)activityLabel;
- (unint64_t)hash;
- (unint64_t)investigationID;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivityDomain:(unint64_t)a3;
- (void)setActivityLabel:(unint64_t)a3;
- (void)setActivityUUID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDeviceReport:(id)a3;
- (void)setHasActivityDomain:(BOOL)a3;
- (void)setHasActivityLabel:(BOOL)a3;
- (void)setHasInvestigationID:(BOOL)a3;
- (void)setHasIsRetry:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInvestigationID:(unint64_t)a3;
- (void)setIsRetry:(BOOL)a3;
- (void)setL2Report:(id)a3;
- (void)setParentActivityUUID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNWActivity

- (void)dealloc
{
  [(AWDNWActivity *)self setActivityUUID:0];
  [(AWDNWActivity *)self setParentActivityUUID:0];
  [(AWDNWActivity *)self setL2Report:0];
  [(AWDNWActivity *)self setDeviceReport:0];
  [(AWDNWActivity *)self setBundleID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDNWActivity;
  [(AWDNWActivity *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setActivityDomain:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_activityDomain = a3;
}

- (void)setHasActivityDomain:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivityDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setActivityLabel:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_activityLabel = a3;
}

- (void)setHasActivityLabel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasActivityLabel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasActivityUUID
{
  return self->_activityUUID != 0;
}

- (BOOL)hasParentActivityUUID
{
  return self->_parentActivityUUID != 0;
}

- (void)setIsRetry:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isRetry = a3;
}

- (void)setHasIsRetry:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsRetry
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasL2Report
{
  return self->_l2Report != 0;
}

- (BOOL)hasDeviceReport
{
  return self->_deviceReport != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setInvestigationID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_investigationID = a3;
}

- (void)setHasInvestigationID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInvestigationID
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNWActivity;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNWActivity description](&v3, sel_description), -[AWDNWActivity dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_activityDomain] forKey:@"activityDomain"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_activityLabel] forKey:@"activityLabel"];
LABEL_5:
  activityUUID = self->_activityUUID;
  if (activityUUID) {
    [v3 setObject:activityUUID forKey:@"activityUUID"];
  }
  parentActivityUUID = self->_parentActivityUUID;
  if (parentActivityUUID) {
    [v3 setObject:parentActivityUUID forKey:@"parentActivityUUID"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_isRetry] forKey:@"isRetry"];
  }
  l2Report = self->_l2Report;
  if (l2Report) {
    [v3 setObject:-[AWDNWL2Report dictionaryRepresentation](l2Report, "dictionaryRepresentation") forKey:@"l2Report"];
  }
  deviceReport = self->_deviceReport;
  if (deviceReport) {
    [v3 setObject: -[AWDNWDeviceReport dictionaryRepresentation](deviceReport, "dictionaryRepresentation") forKey:@"deviceReport"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_investigationID] forKey:@"investigationID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_activityUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentActivityUUID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_l2Report) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceReport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 84) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = self->_activityDomain;
  *((unsigned char *)a3 + 84) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((void *)a3 + 2) = self->_activityLabel;
    *((unsigned char *)a3 + 84) |= 2u;
  }
LABEL_5:
  if (self->_activityUUID) {
    [a3 setActivityUUID:];
  }
  if (self->_parentActivityUUID) {
    [a3 setParentActivityUUID:];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)a3 + 80) = self->_isRetry;
    *((unsigned char *)a3 + 84) |= 0x10u;
  }
  if (self->_l2Report) {
    [a3 setL2Report:];
  }
  if (self->_deviceReport) {
    [a3 setDeviceReport:];
  }
  if (self->_bundleID) {
    [a3 setBundleID:];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_investigationID;
    *((unsigned char *)a3 + 84) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 84) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_activityDomain;
  *(unsigned char *)(v5 + 84) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(void *)(v5 + 16) = self->_activityLabel;
    *(unsigned char *)(v5 + 84) |= 2u;
  }
LABEL_5:

  *(void *)(v6 + 40) = [(NSString *)self->_activityUUID copyWithZone:a3];
  *(void *)(v6 + 72) = [(NSString *)self->_parentActivityUUID copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 80) = self->_isRetry;
    *(unsigned char *)(v6 + 84) |= 0x10u;
  }

  *(void *)(v6 + 64) = [(AWDNWL2Report *)self->_l2Report copyWithZone:a3];
  *(void *)(v6 + 56) = [(AWDNWDeviceReport *)self->_deviceReport copyWithZone:a3];

  *(void *)(v6 + 48) = [(NSString *)self->_bundleID copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_investigationID;
    *(unsigned char *)(v6 + 84) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 84) & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
        goto LABEL_25;
      }
    }
    else if ((*((unsigned char *)a3 + 84) & 8) != 0)
    {
      goto LABEL_25;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 84) & 1) == 0 || self->_activityDomain != *((void *)a3 + 1)) {
        goto LABEL_25;
      }
    }
    else if (*((unsigned char *)a3 + 84))
    {
      goto LABEL_25;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 84) & 2) == 0 || self->_activityLabel != *((void *)a3 + 2)) {
        goto LABEL_25;
      }
    }
    else if ((*((unsigned char *)a3 + 84) & 2) != 0)
    {
      goto LABEL_25;
    }
    activityUUID = self->_activityUUID;
    if (!((unint64_t)activityUUID | *((void *)a3 + 5))
      || (int v5 = -[NSString isEqual:](activityUUID, "isEqual:")) != 0)
    {
      parentActivityUUID = self->_parentActivityUUID;
      if (!((unint64_t)parentActivityUUID | *((void *)a3 + 9))
        || (int v5 = -[NSString isEqual:](parentActivityUUID, "isEqual:")) != 0)
      {
        if ((*(unsigned char *)&self->_has & 0x10) != 0)
        {
          if ((*((unsigned char *)a3 + 84) & 0x10) != 0)
          {
            if (self->_isRetry)
            {
              if (!*((unsigned char *)a3 + 80)) {
                goto LABEL_25;
              }
              goto LABEL_31;
            }
            if (!*((unsigned char *)a3 + 80))
            {
LABEL_31:
              l2Report = self->_l2Report;
              if (!((unint64_t)l2Report | *((void *)a3 + 8))
                || (int v5 = -[AWDNWL2Report isEqual:](l2Report, "isEqual:")) != 0)
              {
                deviceReport = self->_deviceReport;
                if (!((unint64_t)deviceReport | *((void *)a3 + 7))
                  || (int v5 = -[AWDNWDeviceReport isEqual:](deviceReport, "isEqual:")) != 0)
                {
                  bundleID = self->_bundleID;
                  if (!((unint64_t)bundleID | *((void *)a3 + 6))
                    || (int v5 = -[NSString isEqual:](bundleID, "isEqual:")) != 0)
                  {
                    LOBYTE(v5) = (*((unsigned char *)a3 + 84) & 4) == 0;
                    if ((*(unsigned char *)&self->_has & 4) != 0)
                    {
                      if ((*((unsigned char *)a3 + 84) & 4) == 0 || self->_investigationID != *((void *)a3 + 3)) {
                        goto LABEL_25;
                      }
                      LOBYTE(v5) = 1;
                    }
                  }
                }
              }
              return v5;
            }
          }
        }
        else if ((*((unsigned char *)a3 + 84) & 0x10) == 0)
        {
          goto LABEL_31;
        }
LABEL_25:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    unint64_t v13 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v13 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_activityDomain;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_activityLabel;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v4 = 0;
LABEL_8:
  NSUInteger v5 = [(NSString *)self->_activityUUID hash];
  NSUInteger v6 = [(NSString *)self->_parentActivityUUID hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v7 = 2654435761 * self->_isRetry;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(AWDNWL2Report *)self->_l2Report hash];
  unint64_t v9 = [(AWDNWDeviceReport *)self->_deviceReport hash];
  NSUInteger v10 = [(NSString *)self->_bundleID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v11 = 2654435761u * self->_investigationID;
  }
  else {
    unint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 84);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)a3 + 84);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 84) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_activityDomain = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 84) & 2) != 0)
  {
LABEL_4:
    self->_activityLabel = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((void *)a3 + 5)) {
    -[AWDNWActivity setActivityUUID:](self, "setActivityUUID:");
  }
  if (*((void *)a3 + 9)) {
    -[AWDNWActivity setParentActivityUUID:](self, "setParentActivityUUID:");
  }
  if ((*((unsigned char *)a3 + 84) & 0x10) != 0)
  {
    self->_isRetry = *((unsigned char *)a3 + 80);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  l2Report = self->_l2Report;
  uint64_t v7 = *((void *)a3 + 8);
  if (l2Report)
  {
    if (v7) {
      -[AWDNWL2Report mergeFrom:](l2Report, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDNWActivity setL2Report:](self, "setL2Report:");
  }
  deviceReport = self->_deviceReport;
  uint64_t v9 = *((void *)a3 + 7);
  if (deviceReport)
  {
    if (v9) {
      -[AWDNWDeviceReport mergeFrom:](deviceReport, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDNWActivity setDeviceReport:](self, "setDeviceReport:");
  }
  if (*((void *)a3 + 6)) {
    -[AWDNWActivity setBundleID:](self, "setBundleID:");
  }
  if ((*((unsigned char *)a3 + 84) & 4) != 0)
  {
    self->_investigationID = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)activityDomain
{
  return self->_activityDomain;
}

- (unint64_t)activityLabel
{
  return self->_activityLabel;
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
}

- (NSString)parentActivityUUID
{
  return self->_parentActivityUUID;
}

- (void)setParentActivityUUID:(id)a3
{
}

- (BOOL)isRetry
{
  return self->_isRetry;
}

- (AWDNWL2Report)l2Report
{
  return self->_l2Report;
}

- (void)setL2Report:(id)a3
{
}

- (AWDNWDeviceReport)deviceReport
{
  return self->_deviceReport;
}

- (void)setDeviceReport:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (unint64_t)investigationID
{
  return self->_investigationID;
}

@end