@interface VGVehicleStateStorage
- (BOOL)hasActiveConnector;
- (BOOL)hasBatteryPercentage;
- (BOOL)hasChargingArguments;
- (BOOL)hasConsumptionArguments;
- (BOOL)hasCurrentBatteryCapacity;
- (BOOL)hasCurrentEVRange;
- (BOOL)hasDateOfUpdate;
- (BOOL)hasIsCharging;
- (BOOL)hasMaxBatteryCapacity;
- (BOOL)hasMaxEVRange;
- (BOOL)hasMinBatteryCapacity;
- (BOOL)hasOrigin;
- (BOOL)hasPairedAppInstallDeviceIdentifier;
- (BOOL)hasPairedAppInstallSessionIdentifier;
- (BOOL)isCharging;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)pairedAppInstallSessionIdentifier;
- (NSString)chargingArguments;
- (NSString)consumptionArguments;
- (NSString)identifier;
- (NSString)pairedAppInstallDeviceIdentifier;
- (double)batteryPercentage;
- (double)currentBatteryCapacity;
- (double)currentEVRange;
- (double)dateOfUpdate;
- (double)maxBatteryCapacity;
- (double)maxEVRange;
- (double)minBatteryCapacity;
- (id)activeConnectorAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)originAsString:(int)a3;
- (int)StringAsActiveConnector:(id)a3;
- (int)StringAsOrigin:(id)a3;
- (int)activeConnector;
- (int)origin;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveConnector:(int)a3;
- (void)setBatteryPercentage:(double)a3;
- (void)setChargingArguments:(id)a3;
- (void)setConsumptionArguments:(id)a3;
- (void)setCurrentBatteryCapacity:(double)a3;
- (void)setCurrentEVRange:(double)a3;
- (void)setDateOfUpdate:(double)a3;
- (void)setHasActiveConnector:(BOOL)a3;
- (void)setHasBatteryPercentage:(BOOL)a3;
- (void)setHasCurrentBatteryCapacity:(BOOL)a3;
- (void)setHasCurrentEVRange:(BOOL)a3;
- (void)setHasDateOfUpdate:(BOOL)a3;
- (void)setHasIsCharging:(BOOL)a3;
- (void)setHasMaxBatteryCapacity:(BOOL)a3;
- (void)setHasMaxEVRange:(BOOL)a3;
- (void)setHasMinBatteryCapacity:(BOOL)a3;
- (void)setHasOrigin:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsCharging:(BOOL)a3;
- (void)setMaxBatteryCapacity:(double)a3;
- (void)setMaxEVRange:(double)a3;
- (void)setMinBatteryCapacity:(double)a3;
- (void)setOrigin:(int)a3;
- (void)setPairedAppInstallDeviceIdentifier:(id)a3;
- (void)setPairedAppInstallSessionIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VGVehicleStateStorage

- (void)setDateOfUpdate:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dateOfUpdate = a3;
}

- (void)setHasDateOfUpdate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDateOfUpdate
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)origin
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_origin;
  }
  else {
    return 0;
  }
}

- (void)setOrigin:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasOrigin
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264226030[a3];
  }

  return v3;
}

- (int)StringAsOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IAP2"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SIRIINTENTS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setBatteryPercentage:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_batteryPercentage = a3;
}

- (void)setHasBatteryPercentage:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBatteryPercentage
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCurrentEVRange:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_currentEVRange = a3;
}

- (void)setHasCurrentEVRange:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCurrentEVRange
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMaxEVRange:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_maxEVRange = a3;
}

- (void)setHasMaxEVRange:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMaxEVRange
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMinBatteryCapacity:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_minBatteryCapacity = a3;
}

- (void)setHasMinBatteryCapacity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMinBatteryCapacity
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCurrentBatteryCapacity:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_currentBatteryCapacity = a3;
}

- (void)setHasCurrentBatteryCapacity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCurrentBatteryCapacity
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMaxBatteryCapacity:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_maxBatteryCapacity = a3;
}

- (void)setHasMaxBatteryCapacity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMaxBatteryCapacity
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasConsumptionArguments
{
  return self->_consumptionArguments != 0;
}

- (BOOL)hasChargingArguments
{
  return self->_chargingArguments != 0;
}

- (void)setIsCharging:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isCharging = a3;
}

- (void)setHasIsCharging:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsCharging
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)activeConnector
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_activeConnector;
  }
  else {
    return 0;
  }
}

- (void)setActiveConnector:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_activeConnector = a3;
}

- (void)setHasActiveConnector:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasActiveConnector
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)activeConnectorAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264226048[a3];
  }

  return v3;
}

- (int)StringAsActiveConnector:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"J1772"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CCS1"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CCS2"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CHADEMO"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GBT_AC"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GBT_DC"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NACS_DC"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MENNEKES"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"NACS_AC"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPairedAppInstallSessionIdentifier
{
  return self->_pairedAppInstallSessionIdentifier != 0;
}

- (BOOL)hasPairedAppInstallDeviceIdentifier
{
  return self->_pairedAppInstallDeviceIdentifier != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VGVehicleStateStorage;
  int v4 = [(VGVehicleStateStorage *)&v8 description];
  v5 = [(VGVehicleStateStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v14 = [NSNumber numberWithDouble:self->_dateOfUpdate];
    [v4 setObject:v14 forKey:@"dateOfUpdate"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  uint64_t origin = self->_origin;
  if (origin >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_origin);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_264226030[origin];
  }
  [v4 setObject:v16 forKey:@"origin"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  v20 = [NSNumber numberWithDouble:self->_batteryPercentage];
  [v4 setObject:v20 forKey:@"batteryPercentage"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_36:
  v21 = [NSNumber numberWithDouble:self->_currentEVRange];
  [v4 setObject:v21 forKey:@"currentEVRange"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  v22 = [NSNumber numberWithDouble:self->_maxEVRange];
  [v4 setObject:v22 forKey:@"maxEVRange"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  v23 = [NSNumber numberWithDouble:self->_minBatteryCapacity];
  [v4 setObject:v23 forKey:@"minBatteryCapacity"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_39:
  v24 = [NSNumber numberWithDouble:self->_currentBatteryCapacity];
  [v4 setObject:v24 forKey:@"currentBatteryCapacity"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    v7 = [NSNumber numberWithDouble:self->_maxBatteryCapacity];
    [v4 setObject:v7 forKey:@"maxBatteryCapacity"];
  }
LABEL_12:
  consumptionArguments = self->_consumptionArguments;
  if (consumptionArguments) {
    [v4 setObject:consumptionArguments forKey:@"consumptionArguments"];
  }
  chargingArguments = self->_chargingArguments;
  if (chargingArguments) {
    [v4 setObject:chargingArguments forKey:@"chargingArguments"];
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_isCharging];
    [v4 setObject:v11 forKey:@"isCharging"];

    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x80) != 0)
  {
    uint64_t activeConnector = self->_activeConnector;
    if (activeConnector >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_activeConnector);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_264226048[activeConnector];
    }
    [v4 setObject:v13 forKey:@"activeConnector"];
  }
  pairedAppInstallSessionIdentifier = self->_pairedAppInstallSessionIdentifier;
  if (pairedAppInstallSessionIdentifier) {
    [v4 setObject:pairedAppInstallSessionIdentifier forKey:@"pairedAppInstallSessionIdentifier"];
  }
  pairedAppInstallDeviceIdentifier = self->_pairedAppInstallDeviceIdentifier;
  if (pairedAppInstallDeviceIdentifier) {
    [v4 setObject:pairedAppInstallDeviceIdentifier forKey:@"pairedAppInstallDeviceIdentifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return VGVehicleStateStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  PBDataWriterWriteStringField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  v5 = v7;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    v5 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_29;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  v5 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  v5 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  v5 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  v5 = v7;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    PBDataWriterWriteDoubleField();
    v5 = v7;
  }
LABEL_12:
  if (self->_consumptionArguments)
  {
    PBDataWriterWriteStringField();
    v5 = v7;
  }
  if (self->_chargingArguments)
  {
    PBDataWriterWriteStringField();
    v5 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v7;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v7;
  }
  if (self->_pairedAppInstallSessionIdentifier)
  {
    PBDataWriterWriteDataField();
    v5 = v7;
  }
  if (self->_pairedAppInstallDeviceIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [v7 setIdentifier:self->_identifier];
  int v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)v7 + 4) = *(void *)&self->_dateOfUpdate;
    *((_WORD *)v7 + 62) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v7 + 24) = self->_origin;
  *((_WORD *)v7 + 62) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)v7 + 1) = *(void *)&self->_batteryPercentage;
  *((_WORD *)v7 + 62) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)v7 + 3) = *(void *)&self->_currentEVRange;
  *((_WORD *)v7 + 62) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)v7 + 6) = *(void *)&self->_maxEVRange;
  *((_WORD *)v7 + 62) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)v7 + 7) = *(void *)&self->_minBatteryCapacity;
  *((_WORD *)v7 + 62) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_31:
  *((void *)v7 + 2) = *(void *)&self->_currentBatteryCapacity;
  *((_WORD *)v7 + 62) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    *((void *)v7 + 5) = *(void *)&self->_maxBatteryCapacity;
    *((_WORD *)v7 + 62) |= 0x10u;
  }
LABEL_10:
  if (self->_consumptionArguments)
  {
    objc_msgSend(v7, "setConsumptionArguments:");
    int v4 = v7;
  }
  if (self->_chargingArguments)
  {
    objc_msgSend(v7, "setChargingArguments:");
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    v4[120] = self->_isCharging;
    *((_WORD *)v4 + 62) |= 0x200u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_activeConnector;
    *((_WORD *)v4 + 62) |= 0x80u;
  }
  if (self->_pairedAppInstallSessionIdentifier)
  {
    objc_msgSend(v7, "setPairedAppInstallSessionIdentifier:");
    int v4 = v7;
  }
  if (self->_pairedAppInstallDeviceIdentifier)
  {
    objc_msgSend(v7, "setPairedAppInstallDeviceIdentifier:");
    int v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  id v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_dateOfUpdate;
    *(_WORD *)(v5 + 124) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 96) = self->_origin;
  *(_WORD *)(v5 + 124) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(double *)(v5 + 8) = self->_batteryPercentage;
  *(_WORD *)(v5 + 124) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(double *)(v5 + 24) = self->_currentEVRange;
  *(_WORD *)(v5 + 124) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v5 + 48) = self->_maxEVRange;
  *(_WORD *)(v5 + 124) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 56) = self->_minBatteryCapacity;
  *(_WORD *)(v5 + 124) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_21:
  *(double *)(v5 + 16) = self->_currentBatteryCapacity;
  *(_WORD *)(v5 + 124) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    *(double *)(v5 + 40) = self->_maxBatteryCapacity;
    *(_WORD *)(v5 + 124) |= 0x10u;
  }
LABEL_10:
  uint64_t v9 = [(NSString *)self->_consumptionArguments copyWithZone:a3];
  __int16 v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  uint64_t v11 = [(NSString *)self->_chargingArguments copyWithZone:a3];
  v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 120) = self->_isCharging;
    *(_WORD *)(v5 + 124) |= 0x200u;
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_activeConnector;
    *(_WORD *)(v5 + 124) |= 0x80u;
  }
  uint64_t v14 = [(NSData *)self->_pairedAppInstallSessionIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v14;

  uint64_t v16 = [(NSString *)self->_pairedAppInstallDeviceIdentifier copyWithZone:a3];
  v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_65;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 62);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_dateOfUpdate != *((double *)v4 + 4)) {
      goto LABEL_65;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0 || self->_origin != *((_DWORD *)v4 + 24)) {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_batteryPercentage != *((double *)v4 + 1)) {
      goto LABEL_65;
    }
  }
  else if (v7)
  {
    goto LABEL_65;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_currentEVRange != *((double *)v4 + 3)) {
      goto LABEL_65;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_maxEVRange != *((double *)v4 + 6)) {
      goto LABEL_65;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_minBatteryCapacity != *((double *)v4 + 7)) {
      goto LABEL_65;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_currentBatteryCapacity != *((double *)v4 + 2)) {
      goto LABEL_65;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_maxBatteryCapacity != *((double *)v4 + 5)) {
      goto LABEL_65;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  consumptionArguments = self->_consumptionArguments;
  if ((unint64_t)consumptionArguments | *((void *)v4 + 10)
    && !-[NSString isEqual:](consumptionArguments, "isEqual:"))
  {
    goto LABEL_65;
  }
  chargingArguments = self->_chargingArguments;
  if ((unint64_t)chargingArguments | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](chargingArguments, "isEqual:")) {
      goto LABEL_65;
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 62);
  if ((v10 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) != 0)
    {
      if (self->_isCharging)
      {
        if (!*((unsigned char *)v4 + 120)) {
          goto LABEL_65;
        }
        goto LABEL_56;
      }
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_56;
      }
    }
LABEL_65:
    char v14 = 0;
    goto LABEL_66;
  }
  if ((*((_WORD *)v4 + 62) & 0x200) != 0) {
    goto LABEL_65;
  }
LABEL_56:
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_activeConnector != *((_DWORD *)v4 + 16)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  pairedAppInstallSessionIdentifier = self->_pairedAppInstallSessionIdentifier;
  if ((unint64_t)pairedAppInstallSessionIdentifier | *((void *)v4 + 14)
    && !-[NSData isEqual:](pairedAppInstallSessionIdentifier, "isEqual:"))
  {
    goto LABEL_65;
  }
  pairedAppInstallDeviceIdentifier = self->_pairedAppInstallDeviceIdentifier;
  if ((unint64_t)pairedAppInstallDeviceIdentifier | *((void *)v4 + 13)) {
    char v14 = -[NSString isEqual:](pairedAppInstallDeviceIdentifier, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_66:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v48 = [(NSString *)self->_identifier hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    double dateOfUpdate = self->_dateOfUpdate;
    double v6 = -dateOfUpdate;
    if (dateOfUpdate >= 0.0) {
      double v6 = self->_dateOfUpdate;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 0x100) != 0)
  {
    uint64_t v47 = 2654435761 * self->_origin;
    if (has) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v13 = 0;
    goto LABEL_19;
  }
  uint64_t v47 = 0;
  if ((has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double batteryPercentage = self->_batteryPercentage;
  double v10 = -batteryPercentage;
  if (batteryPercentage >= 0.0) {
    double v10 = self->_batteryPercentage;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_19:
  if ((has & 4) != 0)
  {
    double currentEVRange = self->_currentEVRange;
    double v16 = -currentEVRange;
    if (currentEVRange >= 0.0) {
      double v16 = self->_currentEVRange;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 0x20) != 0)
  {
    double maxEVRange = self->_maxEVRange;
    double v21 = -maxEVRange;
    if (maxEVRange >= 0.0) {
      double v21 = self->_maxEVRange;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x40) != 0)
  {
    double minBatteryCapacity = self->_minBatteryCapacity;
    double v26 = -minBatteryCapacity;
    if (minBatteryCapacity >= 0.0) {
      double v26 = self->_minBatteryCapacity;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 2) != 0)
  {
    double currentBatteryCapacity = self->_currentBatteryCapacity;
    double v31 = -currentBatteryCapacity;
    if (currentBatteryCapacity >= 0.0) {
      double v31 = self->_currentBatteryCapacity;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 0x10) != 0)
  {
    double maxBatteryCapacity = self->_maxBatteryCapacity;
    double v36 = -maxBatteryCapacity;
    if (maxBatteryCapacity >= 0.0) {
      double v36 = self->_maxBatteryCapacity;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  NSUInteger v39 = [(NSString *)self->_consumptionArguments hash];
  NSUInteger v40 = [(NSString *)self->_chargingArguments hash];
  __int16 v41 = (__int16)self->_has;
  if ((v41 & 0x200) != 0)
  {
    uint64_t v42 = 2654435761 * self->_isCharging;
    if ((v41 & 0x80) != 0) {
      goto LABEL_61;
    }
LABEL_63:
    uint64_t v43 = 0;
    goto LABEL_64;
  }
  uint64_t v42 = 0;
  if ((v41 & 0x80) == 0) {
    goto LABEL_63;
  }
LABEL_61:
  uint64_t v43 = 2654435761 * self->_activeConnector;
LABEL_64:
  unint64_t v44 = v4 ^ v48 ^ v47 ^ v13 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v40 ^ v42 ^ v43;
  uint64_t v45 = [(NSData *)self->_pairedAppInstallSessionIdentifier hash];
  return v44 ^ v45 ^ [(NSString *)self->_pairedAppInstallDeviceIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 11))
  {
    -[VGVehicleStateStorage setIdentifier:](self, "setIdentifier:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 8) != 0)
  {
    self->_double dateOfUpdate = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)v4 + 62);
    if ((v5 & 0x100) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_29;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) == 0)
  {
    goto LABEL_5;
  }
  self->_uint64_t origin = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double batteryPercentage = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double currentEVRange = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_double maxEVRange = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_double minBatteryCapacity = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_33:
  self->_double currentBatteryCapacity = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 62) & 0x10) != 0)
  {
LABEL_11:
    self->_double maxBatteryCapacity = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_12:
  if (*((void *)v4 + 10))
  {
    -[VGVehicleStateStorage setConsumptionArguments:](self, "setConsumptionArguments:");
    id v4 = v7;
  }
  if (*((void *)v4 + 9))
  {
    -[VGVehicleStateStorage setChargingArguments:](self, "setChargingArguments:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x200) != 0)
  {
    self->_isCharging = *((unsigned char *)v4 + 120);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v6 = *((_WORD *)v4 + 62);
  }
  if ((v6 & 0x80) != 0)
  {
    self->_uint64_t activeConnector = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 14))
  {
    -[VGVehicleStateStorage setPairedAppInstallSessionIdentifier:](self, "setPairedAppInstallSessionIdentifier:");
    id v4 = v7;
  }
  if (*((void *)v4 + 13))
  {
    -[VGVehicleStateStorage setPairedAppInstallDeviceIdentifier:](self, "setPairedAppInstallDeviceIdentifier:");
    id v4 = v7;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)dateOfUpdate
{
  return self->_dateOfUpdate;
}

- (double)batteryPercentage
{
  return self->_batteryPercentage;
}

- (double)currentEVRange
{
  return self->_currentEVRange;
}

- (double)maxEVRange
{
  return self->_maxEVRange;
}

- (double)minBatteryCapacity
{
  return self->_minBatteryCapacity;
}

- (double)currentBatteryCapacity
{
  return self->_currentBatteryCapacity;
}

- (double)maxBatteryCapacity
{
  return self->_maxBatteryCapacity;
}

- (NSString)consumptionArguments
{
  return self->_consumptionArguments;
}

- (void)setConsumptionArguments:(id)a3
{
}

- (NSString)chargingArguments
{
  return self->_chargingArguments;
}

- (void)setChargingArguments:(id)a3
{
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (NSData)pairedAppInstallSessionIdentifier
{
  return self->_pairedAppInstallSessionIdentifier;
}

- (void)setPairedAppInstallSessionIdentifier:(id)a3
{
}

- (NSString)pairedAppInstallDeviceIdentifier
{
  return self->_pairedAppInstallDeviceIdentifier;
}

- (void)setPairedAppInstallDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedAppInstallSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedAppInstallDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_consumptionArguments, 0);

  objc_storeStrong((id *)&self->_chargingArguments, 0);
}

@end