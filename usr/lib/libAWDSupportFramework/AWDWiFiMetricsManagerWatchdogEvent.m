@interface AWDWiFiMetricsManagerWatchdogEvent
- (AWDWiFiMetricExtendedTrapInfo)trapInfo;
- (AWDWiFiMetricJoinTimeout)joinTimeoutInfo;
- (BOOL)hasAvailable;
- (BOOL)hasDeviceIdentifierMap;
- (BOOL)hasEventId;
- (BOOL)hasFileName;
- (BOOL)hasFlags;
- (BOOL)hasFunction;
- (BOOL)hasJoinTimeoutInfo;
- (BOOL)hasLineNumber;
- (BOOL)hasLinkRegister;
- (BOOL)hasMinorReason;
- (BOOL)hasOui;
- (BOOL)hasProgramCounter;
- (BOOL)hasReason;
- (BOOL)hasReasonString;
- (BOOL)hasRecoveryLatency;
- (BOOL)hasSubreason;
- (BOOL)hasTimestamp;
- (BOOL)hasTrapInfo;
- (BOOL)hasVersion;
- (BOOL)hasWpsConfigMethods;
- (BOOL)hasWpsDeviceNameData;
- (BOOL)hasWpsDeviceNameElement;
- (BOOL)hasWpsManufacturerElement;
- (BOOL)hasWpsModelName;
- (BOOL)hasWpsModelNumber;
- (BOOL)hasWpsPrimaryDeviceTypeCategory;
- (BOOL)hasWpsPrimaryDeviceTypeSubCategory;
- (BOOL)hasWpsResponseType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)oui;
- (NSString)fileName;
- (NSString)function;
- (NSString)reasonString;
- (NSString)wpsConfigMethods;
- (NSString)wpsDeviceNameData;
- (NSString)wpsDeviceNameElement;
- (NSString)wpsManufacturerElement;
- (NSString)wpsModelName;
- (NSString)wpsModelNumber;
- (NSString)wpsPrimaryDeviceTypeCategory;
- (NSString)wpsPrimaryDeviceTypeSubCategory;
- (NSString)wpsResponseType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)available;
- (int)reason;
- (unint64_t)backTraceAtIndex:(unint64_t)a3;
- (unint64_t)backTraces;
- (unint64_t)backTracesCount;
- (unint64_t)hash;
- (unint64_t)linkRegister;
- (unint64_t)programCounter;
- (unint64_t)timestamp;
- (unsigned)deviceIdentifierMap;
- (unsigned)eventId;
- (unsigned)flags;
- (unsigned)lineNumber;
- (unsigned)minorReason;
- (unsigned)recoveryLatency;
- (unsigned)subreason;
- (unsigned)version;
- (void)addBackTrace:(unint64_t)a3;
- (void)clearBackTraces;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAvailable:(int)a3;
- (void)setBackTraces:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setDeviceIdentifierMap:(unsigned int)a3;
- (void)setEventId:(unsigned int)a3;
- (void)setFileName:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFunction:(id)a3;
- (void)setHasAvailable:(BOOL)a3;
- (void)setHasDeviceIdentifierMap:(BOOL)a3;
- (void)setHasEventId:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasLineNumber:(BOOL)a3;
- (void)setHasLinkRegister:(BOOL)a3;
- (void)setHasMinorReason:(BOOL)a3;
- (void)setHasProgramCounter:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasRecoveryLatency:(BOOL)a3;
- (void)setHasSubreason:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setJoinTimeoutInfo:(id)a3;
- (void)setLineNumber:(unsigned int)a3;
- (void)setLinkRegister:(unint64_t)a3;
- (void)setMinorReason:(unsigned int)a3;
- (void)setOui:(id)a3;
- (void)setProgramCounter:(unint64_t)a3;
- (void)setReason:(int)a3;
- (void)setReasonString:(id)a3;
- (void)setRecoveryLatency:(unsigned int)a3;
- (void)setSubreason:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrapInfo:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWpsConfigMethods:(id)a3;
- (void)setWpsDeviceNameData:(id)a3;
- (void)setWpsDeviceNameElement:(id)a3;
- (void)setWpsManufacturerElement:(id)a3;
- (void)setWpsModelName:(id)a3;
- (void)setWpsModelNumber:(id)a3;
- (void)setWpsPrimaryDeviceTypeCategory:(id)a3;
- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3;
- (void)setWpsResponseType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerWatchdogEvent

- (void)dealloc
{
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setReasonString:0];
  PBRepeatedUInt64Clear();
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setFileName:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setFunction:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setTrapInfo:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setJoinTimeoutInfo:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setWpsResponseType:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setWpsManufacturerElement:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setWpsModelName:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setWpsModelNumber:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setWpsPrimaryDeviceTypeCategory:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setWpsPrimaryDeviceTypeSubCategory:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setWpsDeviceNameElement:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setWpsDeviceNameData:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setWpsConfigMethods:0];
  [(AWDWiFiMetricsManagerWatchdogEvent *)self setOui:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerWatchdogEvent;
  [(AWDWiFiMetricsManagerWatchdogEvent *)&v3 dealloc];
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

- (void)setVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasVersion
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFlags
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAvailable:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_available = a3;
}

- (void)setHasAvailable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAvailable
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasReason
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSubreason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_subreason = a3;
}

- (void)setHasSubreason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSubreason
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setDeviceIdentifierMap:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_deviceIdentifierMap = a3;
}

- (void)setHasDeviceIdentifierMap:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDeviceIdentifierMap
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setEventId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_eventId = a3;
}

- (void)setHasEventId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEventId
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMinorReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_minorReason = a3;
}

- (void)setHasMinorReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMinorReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasReasonString
{
  return self->_reasonString != 0;
}

- (void)setProgramCounter:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_programCounter = a3;
}

- (void)setHasProgramCounter:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasProgramCounter
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLinkRegister:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_linkRegister = a3;
}

- (void)setHasLinkRegister:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLinkRegister
{
  return *(_WORD *)&self->_has & 1;
}

- (unint64_t)backTracesCount
{
  return self->_backTraces.count;
}

- (unint64_t)backTraces
{
  return self->_backTraces.list;
}

- (void)clearBackTraces
{
}

- (void)addBackTrace:(unint64_t)a3
{
}

- (unint64_t)backTraceAtIndex:(unint64_t)a3
{
  p_backTraces = &self->_backTraces;
  unint64_t count = self->_backTraces.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_backTraces->list[a3];
}

- (void)setBackTraces:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (BOOL)hasFunction
{
  return self->_function != 0;
}

- (void)setLineNumber:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_lineNumber = a3;
}

- (void)setHasLineNumber:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLineNumber
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasTrapInfo
{
  return self->_trapInfo != 0;
}

- (BOOL)hasJoinTimeoutInfo
{
  return self->_joinTimeoutInfo != 0;
}

- (BOOL)hasWpsResponseType
{
  return self->_wpsResponseType != 0;
}

- (BOOL)hasWpsManufacturerElement
{
  return self->_wpsManufacturerElement != 0;
}

- (BOOL)hasWpsModelName
{
  return self->_wpsModelName != 0;
}

- (BOOL)hasWpsModelNumber
{
  return self->_wpsModelNumber != 0;
}

- (BOOL)hasWpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory != 0;
}

- (BOOL)hasWpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory != 0;
}

- (BOOL)hasWpsDeviceNameElement
{
  return self->_wpsDeviceNameElement != 0;
}

- (BOOL)hasWpsDeviceNameData
{
  return self->_wpsDeviceNameData != 0;
}

- (BOOL)hasWpsConfigMethods
{
  return self->_wpsConfigMethods != 0;
}

- (void)setRecoveryLatency:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_recoveryLatency = a3;
}

- (void)setHasRecoveryLatency:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRecoveryLatency
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerWatchdogEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerWatchdogEvent description](&v3, sel_description), -[AWDWiFiMetricsManagerWatchdogEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_version] forKey:@"version"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_flags] forKey:@"flags"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithInt:self->_available] forKey:@"available"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithInt:self->_reason] forKey:@"reason"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_subreason] forKey:@"subreason"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_deviceIdentifierMap) forKey:@"deviceIdentifierMap"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_eventId] forKey:@"eventId"];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_minorReason] forKey:@"minorReason"];
LABEL_11:
  reasonString = self->_reasonString;
  if (reasonString) {
    [v3 setObject:reasonString forKey:@"reasonString"];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_programCounter] forKey:@"programCounter"];
    __int16 v6 = (__int16)self->_has;
  }
  if (v6) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_linkRegister] forKey:@"linkRegister"];
  }
  [v3 setObject:PBRepeatedUInt64NSArray() forKey:@"backTrace"];
  fileName = self->_fileName;
  if (fileName) {
    [v3 setObject:fileName forKey:@"fileName"];
  }
  function = self->_function;
  if (function) {
    [v3 setObject:function forKey:@"function"];
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_lineNumber] forKey:@"lineNumber"];
  }
  trapInfo = self->_trapInfo;
  if (trapInfo) {
    [v3 setObject:[[-[AWDWiFiMetricExtendedTrapInfo dictionaryRepresentation](trapInfo, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"trapInfo"];
  }
  joinTimeoutInfo = self->_joinTimeoutInfo;
  if (joinTimeoutInfo) {
    [v3 setObject:[[-[AWDWiFiMetricJoinTimeout dictionaryRepresentation](joinTimeoutInfo, "dictionaryRepresentation")] forKey:@"joinTimeoutInfo"];
  }
  wpsResponseType = self->_wpsResponseType;
  if (wpsResponseType) {
    [v3 setObject:wpsResponseType forKey:@"wpsResponseType"];
  }
  wpsManufacturerElement = self->_wpsManufacturerElement;
  if (wpsManufacturerElement) {
    [v3 setObject:wpsManufacturerElement forKey:@"wpsManufacturerElement"];
  }
  wpsModelName = self->_wpsModelName;
  if (wpsModelName) {
    [v3 setObject:wpsModelName forKey:@"wpsModelName"];
  }
  wpsModelNumber = self->_wpsModelNumber;
  if (wpsModelNumber) {
    [v3 setObject:wpsModelNumber forKey:@"wpsModelNumber"];
  }
  wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
  if (wpsPrimaryDeviceTypeCategory) {
    [v3 setObject:wpsPrimaryDeviceTypeCategory forKey:@"wpsPrimaryDeviceTypeCategory"];
  }
  wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
  if (wpsPrimaryDeviceTypeSubCategory) {
    [v3 setObject:wpsPrimaryDeviceTypeSubCategory forKey:@"wpsPrimaryDeviceTypeSubCategory"];
  }
  wpsDeviceNameElement = self->_wpsDeviceNameElement;
  if (wpsDeviceNameElement) {
    [v3 setObject:wpsDeviceNameElement forKey:@"wpsDeviceNameElement"];
  }
  wpsDeviceNameData = self->_wpsDeviceNameData;
  if (wpsDeviceNameData) {
    [v3 setObject:wpsDeviceNameData forKey:@"wpsDeviceNameData"];
  }
  wpsConfigMethods = self->_wpsConfigMethods;
  if (wpsConfigMethods) {
    [v3 setObject:wpsConfigMethods forKey:@"wpsConfigMethods"];
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_recoveryLatency] forKey:@"recoveryLatency"];
  }
  oui = self->_oui;
  if (oui) {
    [v3 setObject:oui forKey:@"oui"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerWatchdogEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
  if (self->_reasonString) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 v5 = (__int16)self->_has;
  }
  if (v5) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_backTraces.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_backTraces.count);
  }
  if (self->_fileName) {
    PBDataWriterWriteStringField();
  }
  if (self->_function) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_trapInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_joinTimeoutInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_wpsResponseType) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsManufacturerElement) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsModelName) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsModelNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsPrimaryDeviceTypeCategory) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsPrimaryDeviceTypeSubCategory) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsDeviceNameElement) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsDeviceNameData) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsConfigMethods) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_oui)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 6) = self->_timestamp;
    *((_WORD *)a3 + 116) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 38) = self->_version;
  *((_WORD *)a3 + 116) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 20) = self->_flags;
  *((_WORD *)a3 + 116) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 14) = self->_available;
  *((_WORD *)a3 + 116) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 30) = self->_reason;
  *((_WORD *)a3 + 116) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 35) = self->_subreason;
  *((_WORD *)a3 + 116) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 15) = self->_deviceIdentifierMap;
  *((_WORD *)a3 + 116) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_62:
  *((_DWORD *)a3 + 16) = self->_eventId;
  *((_WORD *)a3 + 116) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *((_DWORD *)a3 + 27) = self->_minorReason;
    *((_WORD *)a3 + 116) |= 0x100u;
  }
LABEL_11:
  if (self->_reasonString) {
    [a3 setReasonString:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    *((void *)a3 + 5) = self->_programCounter;
    *((_WORD *)a3 + 116) |= 2u;
    __int16 v6 = (__int16)self->_has;
  }
  if (v6)
  {
    *((void *)a3 + 4) = self->_linkRegister;
    *((_WORD *)a3 + 116) |= 1u;
  }
  if ([(AWDWiFiMetricsManagerWatchdogEvent *)self backTracesCount])
  {
    [a3 clearBackTraces];
    unint64_t v7 = [(AWDWiFiMetricsManagerWatchdogEvent *)self backTracesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        [a3 addBackTrace:-[AWDWiFiMetricsManagerWatchdogEvent backTraceAtIndex:](self, "backTraceAtIndex:", i)];
    }
  }
  if (self->_fileName) {
    [a3 setFileName:];
  }
  if (self->_function) {
    [a3 setFunction:];
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)a3 + 26) = self->_lineNumber;
    *((_WORD *)a3 + 116) |= 0x80u;
  }
  if (self->_trapInfo) {
    [a3 setTrapInfo:];
  }
  if (self->_joinTimeoutInfo) {
    [a3 setJoinTimeoutInfo:];
  }
  if (self->_wpsResponseType) {
    [a3 setWpsResponseType:];
  }
  if (self->_wpsManufacturerElement) {
    [a3 setWpsManufacturerElement:];
  }
  if (self->_wpsModelName) {
    [a3 setWpsModelName:];
  }
  if (self->_wpsModelNumber) {
    [a3 setWpsModelNumber:];
  }
  if (self->_wpsPrimaryDeviceTypeCategory) {
    [a3 setWpsPrimaryDeviceTypeCategory:];
  }
  if (self->_wpsPrimaryDeviceTypeSubCategory) {
    [a3 setWpsPrimaryDeviceTypeSubCategory:];
  }
  if (self->_wpsDeviceNameElement) {
    [a3 setWpsDeviceNameElement:];
  }
  if (self->_wpsDeviceNameData) {
    [a3 setWpsDeviceNameData:];
  }
  if (self->_wpsConfigMethods) {
    [a3 setWpsConfigMethods:];
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)a3 + 34) = self->_recoveryLatency;
    *((_WORD *)a3 + 116) |= 0x400u;
  }
  if (self->_oui)
  {
    [a3 setOui:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 48) = self->_timestamp;
    *(_WORD *)(v5 + 232) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 152) = self->_version;
  *(_WORD *)(v5 + 232) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 80) = self->_flags;
  *(_WORD *)(v5 + 232) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 56) = self->_available;
  *(_WORD *)(v5 + 232) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 120) = self->_reason;
  *(_WORD *)(v5 + 232) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 140) = self->_subreason;
  *(_WORD *)(v5 + 232) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 60) = self->_deviceIdentifierMap;
  *(_WORD *)(v5 + 232) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_27:
  *(_DWORD *)(v5 + 64) = self->_eventId;
  *(_WORD *)(v5 + 232) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 108) = self->_minorReason;
    *(_WORD *)(v5 + 232) |= 0x100u;
  }
LABEL_11:

  *(void *)(v6 + 128) = [(NSString *)self->_reasonString copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
  {
    *(void *)(v6 + 40) = self->_programCounter;
    *(_WORD *)(v6 + 232) |= 2u;
    __int16 v8 = (__int16)self->_has;
  }
  if (v8)
  {
    *(void *)(v6 + 32) = self->_linkRegister;
    *(_WORD *)(v6 + 232) |= 1u;
  }
  PBRepeatedUInt64Copy();

  *(void *)(v6 + 72) = [(NSString *)self->_fileName copyWithZone:a3];
  *(void *)(v6 + 88) = [(NSString *)self->_function copyWithZone:a3];
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_lineNumber;
    *(_WORD *)(v6 + 232) |= 0x80u;
  }

  *(void *)(v6 + 144) = [(AWDWiFiMetricExtendedTrapInfo *)self->_trapInfo copyWithZone:a3];
  *(void *)(v6 + 96) = [(AWDWiFiMetricJoinTimeout *)self->_joinTimeoutInfo copyWithZone:a3];

  *(void *)(v6 + 224) = [(NSString *)self->_wpsResponseType copyWithZone:a3];
  *(void *)(v6 + 184) = [(NSString *)self->_wpsManufacturerElement copyWithZone:a3];

  *(void *)(v6 + 192) = [(NSString *)self->_wpsModelName copyWithZone:a3];
  *(void *)(v6 + 200) = [(NSString *)self->_wpsModelNumber copyWithZone:a3];

  *(void *)(v6 + 208) = [(NSString *)self->_wpsPrimaryDeviceTypeCategory copyWithZone:a3];
  *(void *)(v6 + 216) = [(NSString *)self->_wpsPrimaryDeviceTypeSubCategory copyWithZone:a3];

  *(void *)(v6 + 176) = [(NSString *)self->_wpsDeviceNameElement copyWithZone:a3];
  *(void *)(v6 + 168) = [(NSString *)self->_wpsDeviceNameData copyWithZone:a3];

  *(void *)(v6 + 160) = [(NSString *)self->_wpsConfigMethods copyWithZone:a3];
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_recoveryLatency;
    *(_WORD *)(v6 + 232) |= 0x400u;
  }

  *(void *)(v6 + 112) = [(NSData *)self->_oui copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 116);
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((void *)a3 + 6)) {
        goto LABEL_99;
      }
    }
    else if ((v7 & 4) != 0)
    {
LABEL_99:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 116) & 0x1000) == 0 || self->_version != *((_DWORD *)a3 + 38)) {
        goto LABEL_99;
      }
    }
    else if ((*((_WORD *)a3 + 116) & 0x1000) != 0)
    {
      goto LABEL_99;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_flags != *((_DWORD *)a3 + 20)) {
        goto LABEL_99;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_99;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_available != *((_DWORD *)a3 + 14)) {
        goto LABEL_99;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 116) & 0x200) == 0 || self->_reason != *((_DWORD *)a3 + 30)) {
        goto LABEL_99;
      }
    }
    else if ((*((_WORD *)a3 + 116) & 0x200) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 116) & 0x800) == 0 || self->_subreason != *((_DWORD *)a3 + 35)) {
        goto LABEL_99;
      }
    }
    else if ((*((_WORD *)a3 + 116) & 0x800) != 0)
    {
      goto LABEL_99;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_deviceIdentifierMap != *((_DWORD *)a3 + 15)) {
        goto LABEL_99;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_99;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_eventId != *((_DWORD *)a3 + 16)) {
        goto LABEL_99;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 116) & 0x100) == 0 || self->_minorReason != *((_DWORD *)a3 + 27)) {
        goto LABEL_99;
      }
    }
    else if ((*((_WORD *)a3 + 116) & 0x100) != 0)
    {
      goto LABEL_99;
    }
    reasonString = self->_reasonString;
    if ((unint64_t)reasonString | *((void *)a3 + 16))
    {
      int IsEqual = -[NSString isEqual:](reasonString, "isEqual:");
      if (!IsEqual) {
        return IsEqual;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v9 = *((_WORD *)a3 + 116);
    if ((has & 2) != 0)
    {
      if ((v9 & 2) == 0 || self->_programCounter != *((void *)a3 + 5)) {
        goto LABEL_99;
      }
    }
    else if ((v9 & 2) != 0)
    {
      goto LABEL_99;
    }
    if (has)
    {
      if ((v9 & 1) == 0 || self->_linkRegister != *((void *)a3 + 4)) {
        goto LABEL_99;
      }
    }
    else if (v9)
    {
      goto LABEL_99;
    }
    int IsEqual = PBRepeatedUInt64IsEqual();
    if (IsEqual)
    {
      fileName = self->_fileName;
      if (!((unint64_t)fileName | *((void *)a3 + 9))
        || (int IsEqual = -[NSString isEqual:](fileName, "isEqual:")) != 0)
      {
        function = self->_function;
        if (!((unint64_t)function | *((void *)a3 + 11))
          || (int IsEqual = -[NSString isEqual:](function, "isEqual:")) != 0)
        {
          __int16 v12 = *((_WORD *)a3 + 116);
          if ((*(_WORD *)&self->_has & 0x80) != 0)
          {
            if ((v12 & 0x80) == 0 || self->_lineNumber != *((_DWORD *)a3 + 26)) {
              goto LABEL_99;
            }
          }
          else if ((v12 & 0x80) != 0)
          {
            goto LABEL_99;
          }
          trapInfo = self->_trapInfo;
          if (!((unint64_t)trapInfo | *((void *)a3 + 18))
            || (int IsEqual = -[AWDWiFiMetricExtendedTrapInfo isEqual:](trapInfo, "isEqual:")) != 0)
          {
            joinTimeoutInfo = self->_joinTimeoutInfo;
            if (!((unint64_t)joinTimeoutInfo | *((void *)a3 + 12))
              || (int IsEqual = -[AWDWiFiMetricJoinTimeout isEqual:](joinTimeoutInfo, "isEqual:")) != 0)
            {
              wpsResponseType = self->_wpsResponseType;
              if (!((unint64_t)wpsResponseType | *((void *)a3 + 28))
                || (int IsEqual = -[NSString isEqual:](wpsResponseType, "isEqual:")) != 0)
              {
                wpsManufacturerElement = self->_wpsManufacturerElement;
                if (!((unint64_t)wpsManufacturerElement | *((void *)a3 + 23))
                  || (int IsEqual = -[NSString isEqual:](wpsManufacturerElement, "isEqual:")) != 0)
                {
                  wpsModelName = self->_wpsModelName;
                  if (!((unint64_t)wpsModelName | *((void *)a3 + 24))
                    || (int IsEqual = -[NSString isEqual:](wpsModelName, "isEqual:")) != 0)
                  {
                    wpsModelNumber = self->_wpsModelNumber;
                    if (!((unint64_t)wpsModelNumber | *((void *)a3 + 25))
                      || (int IsEqual = -[NSString isEqual:](wpsModelNumber, "isEqual:")) != 0)
                    {
                      wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
                      if (!((unint64_t)wpsPrimaryDeviceTypeCategory | *((void *)a3 + 26))
                        || (int IsEqual = -[NSString isEqual:](wpsPrimaryDeviceTypeCategory, "isEqual:")) != 0)
                      {
                        wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
                        if (!((unint64_t)wpsPrimaryDeviceTypeSubCategory | *((void *)a3 + 27))
                          || (int IsEqual = -[NSString isEqual:](wpsPrimaryDeviceTypeSubCategory, "isEqual:")) != 0)
                        {
                          wpsDeviceNameElement = self->_wpsDeviceNameElement;
                          if (!((unint64_t)wpsDeviceNameElement | *((void *)a3 + 22))
                            || (int IsEqual = -[NSString isEqual:](wpsDeviceNameElement, "isEqual:")) != 0)
                          {
                            wpsDeviceNameData = self->_wpsDeviceNameData;
                            if (!((unint64_t)wpsDeviceNameData | *((void *)a3 + 21))
                              || (int IsEqual = -[NSString isEqual:](wpsDeviceNameData, "isEqual:")) != 0)
                            {
                              wpsConfigMethods = self->_wpsConfigMethods;
                              if (!((unint64_t)wpsConfigMethods | *((void *)a3 + 20))
                                || (int IsEqual = -[NSString isEqual:](wpsConfigMethods, "isEqual:")) != 0)
                              {
                                if ((*(_WORD *)&self->_has & 0x400) != 0)
                                {
                                  if ((*((_WORD *)a3 + 116) & 0x400) == 0
                                    || self->_recoveryLatency != *((_DWORD *)a3 + 34))
                                  {
                                    goto LABEL_99;
                                  }
                                }
                                else if ((*((_WORD *)a3 + 116) & 0x400) != 0)
                                {
                                  goto LABEL_99;
                                }
                                ouuint64_t i = self->_oui;
                                if ((unint64_t)oui | *((void *)a3 + 14))
                                {
                                  LOBYTE(IsEqual) = -[NSData isEqual:](oui, "isEqual:");
                                }
                                else
                                {
                                  LOBYTE(IsEqual) = 1;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    unint64_t v33 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_3:
      uint64_t v32 = 2654435761 * self->_version;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v33 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v32 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v31 = 2654435761 * self->_flags;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v31 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v30 = 2654435761 * self->_available;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v30 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    uint64_t v29 = 2654435761 * self->_reason;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v29 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_7:
    uint64_t v28 = 2654435761 * self->_subreason;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v28 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v27 = 2654435761 * self->_deviceIdentifierMap;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v26 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v27 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v26 = 2654435761 * self->_eventId;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v25 = 2654435761 * self->_minorReason;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v25 = 0;
LABEL_20:
  NSUInteger v24 = [(NSString *)self->_reasonString hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 2) != 0)
  {
    unint64_t v23 = 2654435761u * self->_programCounter;
    if (v4) {
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t v23 = 0;
    if (v4)
    {
LABEL_22:
      unint64_t v22 = 2654435761u * self->_linkRegister;
      goto LABEL_25;
    }
  }
  unint64_t v22 = 0;
LABEL_25:
  uint64_t v21 = PBRepeatedUInt64Hash();
  NSUInteger v20 = [(NSString *)self->_fileName hash];
  NSUInteger v19 = [(NSString *)self->_function hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v18 = 2654435761 * self->_lineNumber;
  }
  else {
    uint64_t v18 = 0;
  }
  unint64_t v17 = [(AWDWiFiMetricExtendedTrapInfo *)self->_trapInfo hash];
  unint64_t v16 = [(AWDWiFiMetricJoinTimeout *)self->_joinTimeoutInfo hash];
  NSUInteger v5 = [(NSString *)self->_wpsResponseType hash];
  NSUInteger v6 = [(NSString *)self->_wpsManufacturerElement hash];
  NSUInteger v7 = [(NSString *)self->_wpsModelName hash];
  NSUInteger v8 = [(NSString *)self->_wpsModelNumber hash];
  NSUInteger v9 = [(NSString *)self->_wpsPrimaryDeviceTypeCategory hash];
  NSUInteger v10 = [(NSString *)self->_wpsPrimaryDeviceTypeSubCategory hash];
  NSUInteger v11 = [(NSString *)self->_wpsDeviceNameElement hash];
  NSUInteger v12 = [(NSString *)self->_wpsDeviceNameData hash];
  NSUInteger v13 = [(NSString *)self->_wpsConfigMethods hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v14 = 2654435761 * self->_recoveryLatency;
  }
  else {
    uint64_t v14 = 0;
  }
  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v23 ^ v22 ^ v21 ^ v24 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(NSData *)self->_oui hash];
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 116);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 6);
    *(_WORD *)&self->_has |= 4u;
    __int16 v5 = *((_WORD *)a3 + 116);
    if ((v5 & 0x1000) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else if ((*((_WORD *)a3 + 116) & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((_DWORD *)a3 + 38);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)a3 + 116);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_flags = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 116);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_available = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 116);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_reason = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 116);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_subreason = *((_DWORD *)a3 + 35);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)a3 + 116);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_deviceIdentifierMap = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 116);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_36:
  self->_eventId = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 116) & 0x100) != 0)
  {
LABEL_10:
    self->_minorReason = *((_DWORD *)a3 + 27);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_11:
  if (*((void *)a3 + 16)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setReasonString:](self, "setReasonString:");
  }
  __int16 v6 = *((_WORD *)a3 + 116);
  if ((v6 & 2) != 0)
  {
    self->_programCounter = *((void *)a3 + 5);
    *(_WORD *)&self->_has |= 2u;
    __int16 v6 = *((_WORD *)a3 + 116);
  }
  if (v6)
  {
    self->_linkRegister = *((void *)a3 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
  uint64_t v7 = [a3 backTracesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[AWDWiFiMetricsManagerWatchdogEvent addBackTrace:](self, "addBackTrace:", [a3 backTraceAtIndex:i]);
  }
  if (*((void *)a3 + 9)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setFileName:](self, "setFileName:");
  }
  if (*((void *)a3 + 11)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setFunction:](self, "setFunction:");
  }
  if ((*((_WORD *)a3 + 116) & 0x80) != 0)
  {
    self->_lineNumber = *((_DWORD *)a3 + 26);
    *(_WORD *)&self->_has |= 0x80u;
  }
  trapInfo = self->_trapInfo;
  uint64_t v11 = *((void *)a3 + 18);
  if (trapInfo)
  {
    if (v11) {
      -[AWDWiFiMetricExtendedTrapInfo mergeFrom:](trapInfo, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDWiFiMetricsManagerWatchdogEvent setTrapInfo:](self, "setTrapInfo:");
  }
  joinTimeoutInfo = self->_joinTimeoutInfo;
  uint64_t v13 = *((void *)a3 + 12);
  if (joinTimeoutInfo)
  {
    if (v13) {
      -[AWDWiFiMetricJoinTimeout mergeFrom:](joinTimeoutInfo, "mergeFrom:");
    }
  }
  else if (v13)
  {
    [(AWDWiFiMetricsManagerWatchdogEvent *)self setJoinTimeoutInfo:"setJoinTimeoutInfo:"];
  }
  if (*((void *)a3 + 28)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsResponseType:](self, "setWpsResponseType:");
  }
  if (*((void *)a3 + 23)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsManufacturerElement:](self, "setWpsManufacturerElement:");
  }
  if (*((void *)a3 + 24)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsModelName:](self, "setWpsModelName:");
  }
  if (*((void *)a3 + 25)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsModelNumber:](self, "setWpsModelNumber:");
  }
  if (*((void *)a3 + 26)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:");
  }
  if (*((void *)a3 + 27)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:");
  }
  if (*((void *)a3 + 22)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:");
  }
  if (*((void *)a3 + 21)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsDeviceNameData:](self, "setWpsDeviceNameData:");
  }
  if (*((void *)a3 + 20)) {
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsConfigMethods:](self, "setWpsConfigMethods:");
  }
  if ((*((_WORD *)a3 + 116) & 0x400) != 0)
  {
    self->_recoveryLatency = *((_DWORD *)a3 + 34);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((void *)a3 + 14))
  {
    -[AWDWiFiMetricsManagerWatchdogEvent setOui:](self, "setOui:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)flags
{
  return self->_flags;
}

- (int)available
{
  return self->_available;
}

- (int)reason
{
  return self->_reason;
}

- (unsigned)subreason
{
  return self->_subreason;
}

- (unsigned)deviceIdentifierMap
{
  return self->_deviceIdentifierMap;
}

- (unsigned)eventId
{
  return self->_eventId;
}

- (unsigned)minorReason
{
  return self->_minorReason;
}

- (NSString)reasonString
{
  return self->_reasonString;
}

- (void)setReasonString:(id)a3
{
}

- (unint64_t)programCounter
{
  return self->_programCounter;
}

- (unint64_t)linkRegister
{
  return self->_linkRegister;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSString)function
{
  return self->_function;
}

- (void)setFunction:(id)a3
{
}

- (unsigned)lineNumber
{
  return self->_lineNumber;
}

- (AWDWiFiMetricExtendedTrapInfo)trapInfo
{
  return self->_trapInfo;
}

- (void)setTrapInfo:(id)a3
{
}

- (AWDWiFiMetricJoinTimeout)joinTimeoutInfo
{
  return self->_joinTimeoutInfo;
}

- (void)setJoinTimeoutInfo:(id)a3
{
}

- (NSString)wpsResponseType
{
  return self->_wpsResponseType;
}

- (void)setWpsResponseType:(id)a3
{
}

- (NSString)wpsManufacturerElement
{
  return self->_wpsManufacturerElement;
}

- (void)setWpsManufacturerElement:(id)a3
{
}

- (NSString)wpsModelName
{
  return self->_wpsModelName;
}

- (void)setWpsModelName:(id)a3
{
}

- (NSString)wpsModelNumber
{
  return self->_wpsModelNumber;
}

- (void)setWpsModelNumber:(id)a3
{
}

- (NSString)wpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory;
}

- (void)setWpsPrimaryDeviceTypeCategory:(id)a3
{
}

- (NSString)wpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory;
}

- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3
{
}

- (NSString)wpsDeviceNameElement
{
  return self->_wpsDeviceNameElement;
}

- (void)setWpsDeviceNameElement:(id)a3
{
}

- (NSString)wpsDeviceNameData
{
  return self->_wpsDeviceNameData;
}

- (void)setWpsDeviceNameData:(id)a3
{
}

- (NSString)wpsConfigMethods
{
  return self->_wpsConfigMethods;
}

- (void)setWpsConfigMethods:(id)a3
{
}

- (unsigned)recoveryLatency
{
  return self->_recoveryLatency;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
}

@end