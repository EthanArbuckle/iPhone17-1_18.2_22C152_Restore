@interface AWDWiFiMetricsManagerSoftError
+ (Class)chipCountersPerSliceType;
- (AWDWiFiMetricsManagerBTCoexModeChange)btCoexModeChange;
- (AWDWiFiMetricsManagerBTCoexStats)btCoexStats;
- (AWDWiFiMetricsManagerChipCounters)chipCounters;
- (BOOL)hasApOUI;
- (BOOL)hasAppId;
- (BOOL)hasBatteryChargeLevel;
- (BOOL)hasBtCoexModeChange;
- (BOOL)hasBtCoexStats;
- (BOOL)hasChannel;
- (BOOL)hasChipCounters;
- (BOOL)hasInCar;
- (BOOL)hasLastSoftErrorUserFeedbk;
- (BOOL)hasLowPowerMode;
- (BOOL)hasMotionState;
- (BOOL)hasSample1Cca;
- (BOOL)hasSample1Rssi;
- (BOOL)hasSample1Snr;
- (BOOL)hasSample1TimeStamp;
- (BOOL)hasSample2Cca;
- (BOOL)hasSample2Rssi;
- (BOOL)hasSample2Snr;
- (BOOL)hasSample2TimeStamp;
- (BOOL)hasSoftErrorType;
- (BOOL)hasTimestamp;
- (BOOL)inCar;
- (BOOL)isEqual:(id)a3;
- (BOOL)lowPowerMode;
- (BOOL)readFrom:(id)a3;
- (NSData)apOUI;
- (NSMutableArray)chipCountersPerSlices;
- (NSString)appId;
- (id)chipCountersPerSliceAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sample1Cca;
- (int)sample1Rssi;
- (int)sample1Snr;
- (int)sample2Cca;
- (int)sample2Rssi;
- (int)sample2Snr;
- (unint64_t)chipCountersPerSlicesCount;
- (unint64_t)hash;
- (unint64_t)sample1TimeStamp;
- (unint64_t)sample2TimeStamp;
- (unint64_t)timestamp;
- (unsigned)batteryChargeLevel;
- (unsigned)channel;
- (unsigned)lastSoftErrorUserFeedbk;
- (unsigned)motionState;
- (unsigned)softErrorType;
- (void)addChipCountersPerSlice:(id)a3;
- (void)clearChipCountersPerSlices;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setApOUI:(id)a3;
- (void)setAppId:(id)a3;
- (void)setBatteryChargeLevel:(unsigned int)a3;
- (void)setBtCoexModeChange:(id)a3;
- (void)setBtCoexStats:(id)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setChipCounters:(id)a3;
- (void)setChipCountersPerSlices:(id)a3;
- (void)setHasBatteryChargeLevel:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasInCar:(BOOL)a3;
- (void)setHasLastSoftErrorUserFeedbk:(BOOL)a3;
- (void)setHasLowPowerMode:(BOOL)a3;
- (void)setHasMotionState:(BOOL)a3;
- (void)setHasSample1Cca:(BOOL)a3;
- (void)setHasSample1Rssi:(BOOL)a3;
- (void)setHasSample1Snr:(BOOL)a3;
- (void)setHasSample1TimeStamp:(BOOL)a3;
- (void)setHasSample2Cca:(BOOL)a3;
- (void)setHasSample2Rssi:(BOOL)a3;
- (void)setHasSample2Snr:(BOOL)a3;
- (void)setHasSample2TimeStamp:(BOOL)a3;
- (void)setHasSoftErrorType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInCar:(BOOL)a3;
- (void)setLastSoftErrorUserFeedbk:(unsigned int)a3;
- (void)setLowPowerMode:(BOOL)a3;
- (void)setMotionState:(unsigned int)a3;
- (void)setSample1Cca:(int)a3;
- (void)setSample1Rssi:(int)a3;
- (void)setSample1Snr:(int)a3;
- (void)setSample1TimeStamp:(unint64_t)a3;
- (void)setSample2Cca:(int)a3;
- (void)setSample2Rssi:(int)a3;
- (void)setSample2Snr:(int)a3;
- (void)setSample2TimeStamp:(unint64_t)a3;
- (void)setSoftErrorType:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerSoftError

- (void)dealloc
{
  [(AWDWiFiMetricsManagerSoftError *)self setAppId:0];
  [(AWDWiFiMetricsManagerSoftError *)self setApOUI:0];
  [(AWDWiFiMetricsManagerSoftError *)self setChipCounters:0];
  [(AWDWiFiMetricsManagerSoftError *)self setBtCoexStats:0];
  [(AWDWiFiMetricsManagerSoftError *)self setBtCoexModeChange:0];
  [(AWDWiFiMetricsManagerSoftError *)self setChipCountersPerSlices:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerSoftError;
  [(AWDWiFiMetricsManagerSoftError *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSoftErrorType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_softErrorType = a3;
}

- (void)setHasSoftErrorType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSoftErrorType
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setSample1TimeStamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_sample1TimeStamp = a3;
}

- (void)setHasSample1TimeStamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSample1TimeStamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSample2TimeStamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_sample2TimeStamp = a3;
}

- (void)setHasSample2TimeStamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasSample2TimeStamp
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSample1Rssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sample1Rssi = a3;
}

- (void)setHasSample1Rssi:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSample1Rssi
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSample2Rssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_sample2Rssi = a3;
}

- (void)setHasSample2Rssi:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSample2Rssi
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSample1Cca:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sample1Cca = a3;
}

- (void)setHasSample1Cca:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSample1Cca
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSample2Cca:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sample2Cca = a3;
}

- (void)setHasSample2Cca:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSample2Cca
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSample1Snr:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_sample1Snr = a3;
}

- (void)setHasSample1Snr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSample1Snr
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSample2Snr:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_sample2Snr = a3;
}

- (void)setHasSample2Snr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSample2Snr
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (void)setInCar:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_inCar = a3;
}

- (void)setHasInCar:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasInCar
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setMotionState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMotionState
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasApOUI
{
  return self->_apOUI != 0;
}

- (void)setBatteryChargeLevel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_batteryChargeLevel = a3;
}

- (void)setHasBatteryChargeLevel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBatteryChargeLevel
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLowPowerMode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_lowPowerMode = a3;
}

- (void)setHasLowPowerMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasLowPowerMode
{
  return *(_WORD *)&self->_has >> 15;
}

- (BOOL)hasChipCounters
{
  return self->_chipCounters != 0;
}

- (BOOL)hasBtCoexStats
{
  return self->_btCoexStats != 0;
}

- (BOOL)hasBtCoexModeChange
{
  return self->_btCoexModeChange != 0;
}

- (void)setLastSoftErrorUserFeedbk:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_lastSoftErrorUserFeedbk = a3;
}

- (void)setHasLastSoftErrorUserFeedbk:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLastSoftErrorUserFeedbk
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)clearChipCountersPerSlices
{
}

- (void)addChipCountersPerSlice:(id)a3
{
  chipCountersPerSlices = self->_chipCountersPerSlices;
  if (!chipCountersPerSlices)
  {
    chipCountersPerSlices = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_chipCountersPerSlices = chipCountersPerSlices;
  }

  [(NSMutableArray *)chipCountersPerSlices addObject:a3];
}

- (unint64_t)chipCountersPerSlicesCount
{
  return [(NSMutableArray *)self->_chipCountersPerSlices count];
}

- (id)chipCountersPerSliceAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_chipCountersPerSlices objectAtIndex:a3];
}

+ (Class)chipCountersPerSliceType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerSoftError;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerSoftError description](&v3, sel_description), -[AWDWiFiMetricsManagerSoftError dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_softErrorType] forKey:@"softErrorType"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sample1TimeStamp] forKey:@"sample1TimeStamp"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sample2TimeStamp] forKey:@"sample2TimeStamp"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithInt:self->_sample1Rssi] forKey:@"sample1Rssi"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithInt:self->_sample2Rssi] forKey:@"sample2Rssi"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithInt:self->_sample1Cca] forKey:@"sample1Cca"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithInt:self->_sample2Cca] forKey:@"sample2Cca"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithInt:self->_sample1Snr] forKey:@"sample1Snr"];
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_sample2Snr] forKey:@"sample2Snr"];
LABEL_12:
  appId = self->_appId;
  if (appId) {
    [v3 setObject:appId forKey:@"appId"];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_inCar] forKey:@"inCar"];
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_16:
      if ((v6 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_motionState] forKey:@"motionState"];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_17:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channel] forKey:@"channel"];
LABEL_18:
  apOUI = self->_apOUI;
  if (apOUI) {
    [v3 setObject:apOUI forKey:@"apOUI"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_batteryChargeLevel] forKey:@"batteryChargeLevel"];
    __int16 v8 = (__int16)self->_has;
  }
  if (v8 < 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_lowPowerMode] forKey:@"lowPowerMode"];
  }
  chipCounters = self->_chipCounters;
  if (chipCounters) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerChipCounters dictionaryRepresentation](chipCounters, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"chipCounters"];
  }
  btCoexStats = self->_btCoexStats;
  if (btCoexStats) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerBTCoexStats dictionaryRepresentation](btCoexStats, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"btCoexStats"];
  }
  btCoexModeChange = self->_btCoexModeChange;
  if (btCoexModeChange) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerBTCoexModeChange dictionaryRepresentation](btCoexModeChange, "dictionaryRepresentation")] forKey:@"btCoexModeChange"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_lastSoftErrorUserFeedbk] forKey:@"lastSoftErrorUserFeedbk"];
  }
  if ([(NSMutableArray *)self->_chipCountersPerSlices count])
  {
    v12 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_chipCountersPerSlices, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    chipCountersPerSlices = self->_chipCountersPerSlices;
    uint64_t v14 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(chipCountersPerSlices);
          }
          [v12 addObject:[*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v15 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
    [v3 setObject:v12 forKey:@"chipCountersPerSlice"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerSoftErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
  if (self->_appId) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_16:
      if ((v5 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
  if (self->_apOUI) {
    PBDataWriterWriteDataField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_has;
  }
  if (v6 < 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_chipCounters) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_btCoexStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_btCoexModeChange) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  chipCountersPerSlices = self->_chipCountersPerSlices;
  uint64_t v8 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(chipCountersPerSlices);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((_WORD *)a3 + 68) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 32) = self->_softErrorType;
  *((_WORD *)a3 + 68) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)a3 + 1) = self->_sample1TimeStamp;
  *((_WORD *)a3 + 68) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)a3 + 2) = self->_sample2TimeStamp;
  *((_WORD *)a3 + 68) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 27) = self->_sample1Rssi;
  *((_WORD *)a3 + 68) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 30) = self->_sample2Rssi;
  *((_WORD *)a3 + 68) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 26) = self->_sample1Cca;
  *((_WORD *)a3 + 68) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 29) = self->_sample2Cca;
  *((_WORD *)a3 + 68) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_45:
  *((_DWORD *)a3 + 28) = self->_sample1Snr;
  *((_WORD *)a3 + 68) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_11:
    *((_DWORD *)a3 + 31) = self->_sample2Snr;
    *((_WORD *)a3 + 68) |= 0x1000u;
  }
LABEL_12:
  if (self->_appId) {
    [a3 setAppId:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) != 0)
  {
    *((unsigned char *)a3 + 132) = self->_inCar;
    *((_WORD *)a3 + 68) |= 0x4000u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_16:
      if ((v6 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)a3 + 25) = self->_motionState;
  *((_WORD *)a3 + 68) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_17:
    *((_DWORD *)a3 + 18) = self->_channel;
    *((_WORD *)a3 + 68) |= 0x10u;
  }
LABEL_18:
  if (self->_apOUI) {
    [a3 setApOUI:];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_batteryChargeLevel;
    *((_WORD *)a3 + 68) |= 8u;
    __int16 v7 = (__int16)self->_has;
  }
  if (v7 < 0)
  {
    *((unsigned char *)a3 + 133) = self->_lowPowerMode;
    *((_WORD *)a3 + 68) |= 0x8000u;
  }
  if (self->_chipCounters) {
    [a3 setChipCounters:];
  }
  if (self->_btCoexStats) {
    [a3 setBtCoexStats:];
  }
  if (self->_btCoexModeChange) {
    [a3 setBtCoexModeChange:];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 24) = self->_lastSoftErrorUserFeedbk;
    *((_WORD *)a3 + 68) |= 0x20u;
  }
  if ([(AWDWiFiMetricsManagerSoftError *)self chipCountersPerSlicesCount])
  {
    [a3 clearChipCountersPerSlices];
    unint64_t v8 = [(AWDWiFiMetricsManagerSoftError *)self chipCountersPerSlicesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
        [a3 addChipCountersPerSlice:-[AWDWiFiMetricsManagerSoftError chipCountersPerSliceAtIndex:](self, "chipCountersPerSliceAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(_WORD *)(v5 + 136) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 128) = self->_softErrorType;
  *(_WORD *)(v5 + 136) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(void *)(v5 + 8) = self->_sample1TimeStamp;
  *(_WORD *)(v5 + 136) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(void *)(v5 + 16) = self->_sample2TimeStamp;
  *(_WORD *)(v5 + 136) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v5 + 108) = self->_sample1Rssi;
  *(_WORD *)(v5 + 136) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 120) = self->_sample2Rssi;
  *(_WORD *)(v5 + 136) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 104) = self->_sample1Cca;
  *(_WORD *)(v5 + 136) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 116) = self->_sample2Cca;
  *(_WORD *)(v5 + 136) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_38:
  *(_DWORD *)(v5 + 112) = self->_sample1Snr;
  *(_WORD *)(v5 + 136) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 124) = self->_sample2Snr;
    *(_WORD *)(v5 + 136) |= 0x1000u;
  }
LABEL_12:

  *(void *)(v6 + 40) = [(NSString *)self->_appId copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x4000) != 0)
  {
    *(unsigned char *)(v6 + 132) = self->_inCar;
    *(_WORD *)(v6 + 136) |= 0x4000u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x40) == 0)
    {
LABEL_14:
      if ((v8 & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v8 & 0x40) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v6 + 100) = self->_motionState;
  *(_WORD *)(v6 + 136) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 72) = self->_channel;
    *(_WORD *)(v6 + 136) |= 0x10u;
  }
LABEL_16:

  *(void *)(v6 + 32) = [(NSData *)self->_apOUI copyWithZone:a3];
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_batteryChargeLevel;
    *(_WORD *)(v6 + 136) |= 8u;
    __int16 v9 = (__int16)self->_has;
  }
  if (v9 < 0)
  {
    *(unsigned char *)(v6 + 133) = self->_lowPowerMode;
    *(_WORD *)(v6 + 136) |= 0x8000u;
  }

  *(void *)(v6 + 80) = [(AWDWiFiMetricsManagerChipCounters *)self->_chipCounters copyWithZone:a3];
  *(void *)(v6 + 64) = [(AWDWiFiMetricsManagerBTCoexStats *)self->_btCoexStats copyWithZone:a3];

  *(void *)(v6 + 56) = [(AWDWiFiMetricsManagerBTCoexModeChange *)self->_btCoexModeChange copyWithZone:a3];
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_lastSoftErrorUserFeedbk;
    *(_WORD *)(v6 + 136) |= 0x20u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  chipCountersPerSlices = self->_chipCountersPerSlices;
  uint64_t v11 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(chipCountersPerSlices);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v17 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addChipCountersPerSlice:v15];
      }
      uint64_t v12 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 68);
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
      goto LABEL_93;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)a3 + 68) & 0x2000) == 0 || self->_softErrorType != *((_DWORD *)a3 + 32)) {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)a3 + 68) & 0x2000) != 0)
  {
    goto LABEL_93;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_sample1TimeStamp != *((void *)a3 + 1)) {
      goto LABEL_93;
    }
  }
  else if (v7)
  {
    goto LABEL_93;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_sample2TimeStamp != *((void *)a3 + 2)) {
      goto LABEL_93;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 68) & 0x100) == 0 || self->_sample1Rssi != *((_DWORD *)a3 + 27)) {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)a3 + 68) & 0x100) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 68) & 0x800) == 0 || self->_sample2Rssi != *((_DWORD *)a3 + 30)) {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)a3 + 68) & 0x800) != 0)
  {
    goto LABEL_93;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_sample1Cca != *((_DWORD *)a3 + 26)) {
      goto LABEL_93;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 68) & 0x400) == 0 || self->_sample2Cca != *((_DWORD *)a3 + 29)) {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)a3 + 68) & 0x400) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 68) & 0x200) == 0 || self->_sample1Snr != *((_DWORD *)a3 + 28)) {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)a3 + 68) & 0x200) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 68) & 0x1000) == 0 || self->_sample2Snr != *((_DWORD *)a3 + 31)) {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)a3 + 68) & 0x1000) != 0)
  {
    goto LABEL_93;
  }
  appId = self->_appId;
  if ((unint64_t)appId | *((void *)a3 + 5))
  {
    int v5 = -[NSString isEqual:](appId, "isEqual:");
    if (!v5) {
      return v5;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)a3 + 68);
  if ((has & 0x4000) != 0)
  {
    if ((*((_WORD *)a3 + 68) & 0x4000) == 0) {
      goto LABEL_93;
    }
    if (self->_inCar)
    {
      if (!*((unsigned char *)a3 + 132)) {
        goto LABEL_93;
      }
    }
    else if (*((unsigned char *)a3 + 132))
    {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)a3 + 68) & 0x4000) != 0)
  {
    goto LABEL_93;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_motionState != *((_DWORD *)a3 + 25)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_93;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_channel != *((_DWORD *)a3 + 18)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_93;
  }
  apOUI = self->_apOUI;
  if ((unint64_t)apOUI | *((void *)a3 + 4))
  {
    int v5 = -[NSData isEqual:](apOUI, "isEqual:");
    if (!v5) {
      return v5;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v11 = *((_WORD *)a3 + 68);
  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_batteryChargeLevel != *((_DWORD *)a3 + 12)) {
      goto LABEL_93;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_93;
  }
  if (has < 0)
  {
    if ((*((_WORD *)a3 + 68) & 0x8000) == 0) {
      goto LABEL_93;
    }
    if (self->_lowPowerMode)
    {
      if (!*((unsigned char *)a3 + 133)) {
        goto LABEL_93;
      }
    }
    else if (*((unsigned char *)a3 + 133))
    {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)a3 + 68) & 0x8000) != 0)
  {
    goto LABEL_93;
  }
  chipCounters = self->_chipCounters;
  if ((unint64_t)chipCounters | *((void *)a3 + 10))
  {
    int v5 = -[AWDWiFiMetricsManagerChipCounters isEqual:](chipCounters, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  btCoexStats = self->_btCoexStats;
  if ((unint64_t)btCoexStats | *((void *)a3 + 8))
  {
    int v5 = -[AWDWiFiMetricsManagerBTCoexStats isEqual:](btCoexStats, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  btCoexModeChange = self->_btCoexModeChange;
  if ((unint64_t)btCoexModeChange | *((void *)a3 + 7))
  {
    int v5 = -[AWDWiFiMetricsManagerBTCoexModeChange isEqual:](btCoexModeChange, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  __int16 v15 = *((_WORD *)a3 + 68);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_lastSoftErrorUserFeedbk != *((_DWORD *)a3 + 24)) {
      goto LABEL_93;
    }
    goto LABEL_100;
  }
  if ((v15 & 0x20) != 0)
  {
LABEL_93:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_100:
  chipCountersPerSlices = self->_chipCountersPerSlices;
  if ((unint64_t)chipCountersPerSlices | *((void *)a3 + 11))
  {
    LOBYTE(v5) = -[NSMutableArray isEqual:](chipCountersPerSlices, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0) {
    unint64_t v4 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v4 = 0;
  }
  unint64_t v38 = v4;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    uint64_t v5 = 2654435761 * self->_softErrorType;
    if (has)
    {
LABEL_6:
      unint64_t v6 = 2654435761u * self->_sample1TimeStamp;
      if ((has & 2) != 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (has) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    unint64_t v7 = 2654435761u * self->_sample2TimeStamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_sample1Rssi;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    uint64_t v9 = 2654435761 * self->_sample2Rssi;
    if ((has & 0x80) != 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    uint64_t v10 = 2654435761 * self->_sample1Cca;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_11;
    }
LABEL_19:
    uint64_t v11 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_19;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_sample2Cca;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_12:
    uint64_t v12 = 2654435761 * self->_sample1Snr;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v12 = 0;
LABEL_21:
  unint64_t v36 = v6;
  uint64_t v37 = v5;
  uint64_t v34 = v8;
  unint64_t v35 = v7;
  uint64_t v32 = v10;
  uint64_t v33 = v9;
  uint64_t v30 = v12;
  uint64_t v31 = v11;
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    NSUInteger v13 = [(NSString *)self->_appId hash];
  }
  else {
    NSUInteger v13 = [(NSString *)self->_appId hash];
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x4000) != 0)
  {
    uint64_t v15 = 2654435761 * self->_inCar;
    if ((v14 & 0x40) != 0) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((v14 & 0x40) != 0)
    {
LABEL_26:
      uint64_t v16 = 2654435761 * self->_motionState;
      goto LABEL_29;
    }
  }
  uint64_t v16 = 0;
LABEL_29:
  uint64_t v28 = v16;
  uint64_t v29 = v15;
  NSUInteger v17 = v13;
  if ((v14 & 0x10) != 0) {
    uint64_t v18 = 2654435761 * self->_channel;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [(NSData *)self->_apOUI hash];
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    uint64_t v20 = 2654435761 * self->_batteryChargeLevel;
    if ((*(_WORD *)&self->_has & 0x8000) != 0) {
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
    {
LABEL_34:
      uint64_t v21 = 2654435761 * self->_lowPowerMode;
      goto LABEL_37;
    }
  }
  uint64_t v21 = 0;
LABEL_37:
  unint64_t v22 = [(AWDWiFiMetricsManagerChipCounters *)self->_chipCounters hash];
  unint64_t v23 = [(AWDWiFiMetricsManagerBTCoexStats *)self->_btCoexStats hash];
  unint64_t v24 = [(AWDWiFiMetricsManagerBTCoexModeChange *)self->_btCoexModeChange hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v25 = 2654435761 * self->_lastSoftErrorUserFeedbk;
  }
  else {
    uint64_t v25 = 0;
  }
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v27 ^ v29 ^ v28 ^ v18 ^ v17 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ [(NSMutableArray *)self->_chipCountersPerSlices hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  __int16 v5 = *((_WORD *)a3 + 68);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    __int16 v5 = *((_WORD *)a3 + 68);
    if ((v5 & 0x2000) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*((_WORD *)a3 + 68) & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_softErrorType = *((_DWORD *)a3 + 32);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)a3 + 68);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_sample1TimeStamp = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)a3 + 68);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_sample2TimeStamp = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_sample1Rssuint64_t i = *((_DWORD *)a3 + 27);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_sample2Rssuint64_t i = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_sample1Cca = *((_DWORD *)a3 + 26);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_sample2Cca = *((_DWORD *)a3 + 29);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_35:
  self->_sample1Snr = *((_DWORD *)a3 + 28);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 68) & 0x1000) != 0)
  {
LABEL_11:
    self->_sample2Snr = *((_DWORD *)a3 + 31);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_12:
  if (*((void *)a3 + 5)) {
    -[AWDWiFiMetricsManagerSoftError setAppId:](self, "setAppId:");
  }
  __int16 v6 = *((_WORD *)a3 + 68);
  if ((v6 & 0x4000) != 0)
  {
    self->_inCar = *((unsigned char *)a3 + 132);
    *(_WORD *)&self->_has |= 0x4000u;
    __int16 v6 = *((_WORD *)a3 + 68);
    if ((v6 & 0x40) == 0)
    {
LABEL_16:
      if ((v6 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  self->_motionState = *((_DWORD *)a3 + 25);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 68) & 0x10) != 0)
  {
LABEL_17:
    self->_channel = *((_DWORD *)a3 + 18);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_18:
  if (*((void *)a3 + 4)) {
    -[AWDWiFiMetricsManagerSoftError setApOUI:](self, "setApOUI:");
  }
  __int16 v7 = *((_WORD *)a3 + 68);
  if ((v7 & 8) != 0)
  {
    self->_batteryChargeLevel = *((_DWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 8u;
    __int16 v7 = *((_WORD *)a3 + 68);
  }
  if (v7 < 0)
  {
    self->_lowPowerMode = *((unsigned char *)a3 + 133);
    *(_WORD *)&self->_has |= 0x8000u;
  }
  chipCounters = self->_chipCounters;
  uint64_t v9 = *((void *)a3 + 10);
  if (chipCounters)
  {
    if (v9) {
      -[AWDWiFiMetricsManagerChipCounters mergeFrom:](chipCounters, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDWiFiMetricsManagerSoftError setChipCounters:](self, "setChipCounters:");
  }
  btCoexStats = self->_btCoexStats;
  uint64_t v11 = *((void *)a3 + 8);
  if (btCoexStats)
  {
    if (v11) {
      -[AWDWiFiMetricsManagerBTCoexStats mergeFrom:](btCoexStats, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDWiFiMetricsManagerSoftError setBtCoexStats:](self, "setBtCoexStats:");
  }
  btCoexModeChange = self->_btCoexModeChange;
  uint64_t v13 = *((void *)a3 + 7);
  if (btCoexModeChange)
  {
    if (v13) {
      -[AWDWiFiMetricsManagerBTCoexModeChange mergeFrom:](btCoexModeChange, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[AWDWiFiMetricsManagerSoftError setBtCoexModeChange:](self, "setBtCoexModeChange:");
  }
  if ((*((_WORD *)a3 + 68) & 0x20) != 0)
  {
    self->_lastSoftErrorUserFeedbk = *((_DWORD *)a3 + 24);
    *(_WORD *)&self->_has |= 0x20u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  __int16 v14 = (void *)*((void *)a3 + 11);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [(AWDWiFiMetricsManagerSoftError *)self addChipCountersPerSlice:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)softErrorType
{
  return self->_softErrorType;
}

- (unint64_t)sample1TimeStamp
{
  return self->_sample1TimeStamp;
}

- (unint64_t)sample2TimeStamp
{
  return self->_sample2TimeStamp;
}

- (int)sample1Rssi
{
  return self->_sample1Rssi;
}

- (int)sample2Rssi
{
  return self->_sample2Rssi;
}

- (int)sample1Cca
{
  return self->_sample1Cca;
}

- (int)sample2Cca
{
  return self->_sample2Cca;
}

- (int)sample1Snr
{
  return self->_sample1Snr;
}

- (int)sample2Snr
{
  return self->_sample2Snr;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (BOOL)inCar
{
  return self->_inCar;
}

- (unsigned)motionState
{
  return self->_motionState;
}

- (unsigned)channel
{
  return self->_channel;
}

- (NSData)apOUI
{
  return self->_apOUI;
}

- (void)setApOUI:(id)a3
{
}

- (unsigned)batteryChargeLevel
{
  return self->_batteryChargeLevel;
}

- (BOOL)lowPowerMode
{
  return self->_lowPowerMode;
}

- (AWDWiFiMetricsManagerChipCounters)chipCounters
{
  return self->_chipCounters;
}

- (void)setChipCounters:(id)a3
{
}

- (AWDWiFiMetricsManagerBTCoexStats)btCoexStats
{
  return self->_btCoexStats;
}

- (void)setBtCoexStats:(id)a3
{
}

- (AWDWiFiMetricsManagerBTCoexModeChange)btCoexModeChange
{
  return self->_btCoexModeChange;
}

- (void)setBtCoexModeChange:(id)a3
{
}

- (unsigned)lastSoftErrorUserFeedbk
{
  return self->_lastSoftErrorUserFeedbk;
}

- (NSMutableArray)chipCountersPerSlices
{
  return self->_chipCountersPerSlices;
}

- (void)setChipCountersPerSlices:(id)a3
{
}

@end