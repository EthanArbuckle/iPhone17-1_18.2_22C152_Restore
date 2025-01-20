@interface WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences
- (BOOL)changedChannel;
- (BOOL)changedDNSPrimary;
- (BOOL)changedDNSSecondary;
- (BOOL)changedMAC;
- (BOOL)hasAdditionalInfo;
- (BOOL)hasChangedChannel;
- (BOOL)hasChangedDNSPrimary;
- (BOOL)hasChangedDNSSecondary;
- (BOOL)hasChangedMAC;
- (BOOL)hasEventType;
- (BOOL)hasNewBSSID;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)newBSSID;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (int)StringAsEventType:(id)a3;
- (int)eventType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)additionalInfo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdditionalInfo:(unsigned int)a3;
- (void)setChangedChannel:(BOOL)a3;
- (void)setChangedDNSPrimary:(BOOL)a3;
- (void)setChangedDNSSecondary:(BOOL)a3;
- (void)setChangedMAC:(BOOL)a3;
- (void)setEventType:(int)a3;
- (void)setHasAdditionalInfo:(BOOL)a3;
- (void)setHasChangedChannel:(BOOL)a3;
- (void)setHasChangedDNSPrimary:(BOOL)a3;
- (void)setHasChangedDNSSecondary:(BOOL)a3;
- (void)setHasChangedMAC:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasNewBSSID:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNewBSSID:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences

- (void)setNewBSSID:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_newBSSID = a3;
}

- (void)setHasNewBSSID:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasNewBSSID
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setChangedChannel:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_changedChannel = a3;
}

- (void)setHasChangedChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasChangedChannel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setChangedDNSPrimary:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_changedDNSPrimary = a3;
}

- (void)setHasChangedDNSPrimary:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasChangedDNSPrimary
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setChangedDNSSecondary:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_changedDNSSecondary = a3;
}

- (void)setHasChangedDNSSecondary:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasChangedDNSSecondary
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setChangedMAC:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_changedMAC = a3;
}

- (void)setHasChangedMAC:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasChangedMAC
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
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

- (int)eventType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_2644675B8[a3];
  }
  return v3;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kDiagnosisEventTypeMainDpsNotification"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"kDiagnosisEventTypePowerToggled"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"kDiagnosisEventTypeControlCenterToggled"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"kDiagnosisEventTypeLinkUp"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"kDiagnosisEventTypeRoamed"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"kDiagnosisEventTypeIPConfigured"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"kDiagnosisEventTypeLinkDown"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setAdditionalInfo:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_additionalInfo = a3;
}

- (void)setHasAdditionalInfo:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAdditionalInfo
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences;
  int v4 = [(WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has < 0)
  {
    v7 = [NSNumber numberWithBool:self->_newBSSID];
    [v3 setObject:v7 forKey:@"newBSSID"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithBool:self->_changedChannel];
  [v3 setObject:v8 forKey:@"changedChannel"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = [NSNumber numberWithBool:self->_changedDNSPrimary];
  [v3 setObject:v9 forKey:@"changedDNSPrimary"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = [NSNumber numberWithBool:self->_changedDNSSecondary];
  [v3 setObject:v10 forKey:@"changedDNSSecondary"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = [NSNumber numberWithBool:self->_changedMAC];
  [v3 setObject:v11 forKey:@"changedMAC"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  [v3 setObject:v12 forKey:@"timestamp"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  uint64_t eventType = self->_eventType;
  if (eventType >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_2644675B8[eventType];
  }
  [v3 setObject:v14 forKey:@"eventType"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_9:
  v5 = [NSNumber numberWithUnsignedInt:self->_additionalInfo];
  [v3 setObject:v5 forKey:@"additionalInfo"];

LABEL_10:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWADiagnosisActionAssociationDifferencesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has < 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has < 0)
  {
    v4[28] = self->_newBSSID;
    v4[32] |= 0x80u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[24] = self->_changedChannel;
  v4[32] |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[25] = self->_changedDNSPrimary;
  v4[32] |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[26] = self->_changedDNSSecondary;
  v4[32] |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[27] = self->_changedMAC;
  v4[32] |= 0x40u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)v4 + 1) = self->_timestamp;
  v4[32] |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  *((_DWORD *)v4 + 5) = self->_eventType;
  v4[32] |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 4) = self->_additionalInfo;
    v4[32] |= 2u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has < 0)
  {
    *((unsigned char *)result + 28) = self->_newBSSID;
    *((unsigned char *)result + 32) |= 0x80u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 24) = self->_changedChannel;
  *((unsigned char *)result + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 25) = self->_changedDNSPrimary;
  *((unsigned char *)result + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)result + 26) = self->_changedDNSSecondary;
  *((unsigned char *)result + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)result + 27) = self->_changedMAC;
  *((unsigned char *)result + 32) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 1) = self->_timestamp;
  *((unsigned char *)result + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_eventType;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_additionalInfo;
  *((unsigned char *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_56;
  }
  $26CDCC079C5A4B8C0C433C34490679B3 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x80) == 0) {
      goto LABEL_56;
    }
    if (self->_newBSSID)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_56;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x80) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0) {
      goto LABEL_56;
    }
    if (self->_changedChannel)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_56;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0) {
      goto LABEL_56;
    }
    if (self->_changedDNSPrimary)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_56;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) == 0) {
      goto LABEL_56;
    }
    if (self->_changedDNSSecondary)
    {
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_56;
      }
    }
    else if (*((unsigned char *)v4 + 26))
    {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x40) != 0)
    {
      if (self->_changedMAC)
      {
        if (!*((unsigned char *)v4 + 27)) {
          goto LABEL_56;
        }
        goto LABEL_42;
      }
      if (!*((unsigned char *)v4 + 27)) {
        goto LABEL_42;
      }
    }
LABEL_56:
    BOOL v6 = 0;
    goto LABEL_57;
  }
  if ((*((unsigned char *)v4 + 32) & 0x40) != 0) {
    goto LABEL_56;
  }
LABEL_42:
  if (*(unsigned char *)&has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_56;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_eventType != *((_DWORD *)v4 + 5)) {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_56;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_additionalInfo != *((_DWORD *)v4 + 4)) {
      goto LABEL_56;
    }
    BOOL v6 = 1;
  }
LABEL_57:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    uint64_t v2 = 2654435761 * self->_newBSSID;
    if ((*(unsigned char *)&self->_has & 8) == 0)
    {
LABEL_3:
      uint64_t v3 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 2654435761 * self->_changedChannel;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_changedDNSPrimary;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_changedDNSSecondary;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_changedMAC;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    unint64_t v7 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_eventType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_additionalInfo;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5 < 0)
  {
    self->_newBSSID = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 0x80u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_changedChannel = *((unsigned char *)v4 + 24);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_changedDNSPrimary = *((unsigned char *)v4 + 25);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_changedDNSSecondary = *((unsigned char *)v4 + 26);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_changedMAC = *((unsigned char *)v4 + 27);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_timestamp = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  self->_uint64_t eventType = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_9:
    self->_additionalInfo = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_10:
}

- (BOOL)newBSSID
{
  return self->_newBSSID;
}

- (BOOL)changedChannel
{
  return self->_changedChannel;
}

- (BOOL)changedDNSPrimary
{
  return self->_changedDNSPrimary;
}

- (BOOL)changedDNSSecondary
{
  return self->_changedDNSSecondary;
}

- (BOOL)changedMAC
{
  return self->_changedMAC;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)additionalInfo
{
  return self->_additionalInfo;
}

@end