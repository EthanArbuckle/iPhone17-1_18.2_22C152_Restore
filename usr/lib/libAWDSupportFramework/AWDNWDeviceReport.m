@interface AWDNWDeviceReport
- (AWDNWAccumulator)batteryAccumulator;
- (BOOL)batteryAtCriticalLevel;
- (BOOL)batteryAtWarnLevel;
- (BOOL)batteryExternalPowerIsConnected;
- (BOOL)batteryFullyCharged;
- (BOOL)batteryIsCharging;
- (BOOL)devicePluggedIn;
- (BOOL)deviceScreenOn;
- (BOOL)hasBatteryAbsoluteCapacity;
- (BOOL)hasBatteryAccumulator;
- (BOOL)hasBatteryAtCriticalLevel;
- (BOOL)hasBatteryAtWarnLevel;
- (BOOL)hasBatteryCurrentCapacity;
- (BOOL)hasBatteryDesignCapacity;
- (BOOL)hasBatteryExternalPowerIsConnected;
- (BOOL)hasBatteryFullyCharged;
- (BOOL)hasBatteryIsCharging;
- (BOOL)hasBatteryMaximumCapacity;
- (BOOL)hasBatteryPercentage;
- (BOOL)hasBatteryTimeRemaining;
- (BOOL)hasBatteryVoltage;
- (BOOL)hasCellularMode;
- (BOOL)hasDevicePluggedIn;
- (BOOL)hasDeviceScreenOn;
- (BOOL)hasMotionState;
- (BOOL)hasThermalPressure;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)cellularModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)motionStateAsString:(int)a3;
- (id)thermalPressureAsString:(int)a3;
- (int)StringAsCellularMode:(id)a3;
- (int)StringAsMotionState:(id)a3;
- (int)StringAsThermalPressure:(id)a3;
- (int)cellularMode;
- (int)motionState;
- (int)thermalPressure;
- (unint64_t)hash;
- (unsigned)batteryAbsoluteCapacity;
- (unsigned)batteryCurrentCapacity;
- (unsigned)batteryDesignCapacity;
- (unsigned)batteryMaximumCapacity;
- (unsigned)batteryPercentage;
- (unsigned)batteryTimeRemaining;
- (unsigned)batteryVoltage;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBatteryAbsoluteCapacity:(unsigned int)a3;
- (void)setBatteryAccumulator:(id)a3;
- (void)setBatteryAtCriticalLevel:(BOOL)a3;
- (void)setBatteryAtWarnLevel:(BOOL)a3;
- (void)setBatteryCurrentCapacity:(unsigned int)a3;
- (void)setBatteryDesignCapacity:(unsigned int)a3;
- (void)setBatteryExternalPowerIsConnected:(BOOL)a3;
- (void)setBatteryFullyCharged:(BOOL)a3;
- (void)setBatteryIsCharging:(BOOL)a3;
- (void)setBatteryMaximumCapacity:(unsigned int)a3;
- (void)setBatteryPercentage:(unsigned int)a3;
- (void)setBatteryTimeRemaining:(unsigned int)a3;
- (void)setBatteryVoltage:(unsigned int)a3;
- (void)setCellularMode:(int)a3;
- (void)setDevicePluggedIn:(BOOL)a3;
- (void)setDeviceScreenOn:(BOOL)a3;
- (void)setHasBatteryAbsoluteCapacity:(BOOL)a3;
- (void)setHasBatteryAtCriticalLevel:(BOOL)a3;
- (void)setHasBatteryAtWarnLevel:(BOOL)a3;
- (void)setHasBatteryCurrentCapacity:(BOOL)a3;
- (void)setHasBatteryDesignCapacity:(BOOL)a3;
- (void)setHasBatteryExternalPowerIsConnected:(BOOL)a3;
- (void)setHasBatteryFullyCharged:(BOOL)a3;
- (void)setHasBatteryIsCharging:(BOOL)a3;
- (void)setHasBatteryMaximumCapacity:(BOOL)a3;
- (void)setHasBatteryPercentage:(BOOL)a3;
- (void)setHasBatteryTimeRemaining:(BOOL)a3;
- (void)setHasBatteryVoltage:(BOOL)a3;
- (void)setHasCellularMode:(BOOL)a3;
- (void)setHasDevicePluggedIn:(BOOL)a3;
- (void)setHasDeviceScreenOn:(BOOL)a3;
- (void)setHasMotionState:(BOOL)a3;
- (void)setHasThermalPressure:(BOOL)a3;
- (void)setMotionState:(int)a3;
- (void)setThermalPressure:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNWDeviceReport

- (void)dealloc
{
  [(AWDNWDeviceReport *)self setBatteryAccumulator:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDNWDeviceReport;
  [(AWDNWDeviceReport *)&v3 dealloc];
}

- (void)setBatteryPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_batteryPercentage = a3;
}

- (void)setHasBatteryPercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBatteryPercentage
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBatteryCurrentCapacity:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_batteryCurrentCapacity = a3;
}

- (void)setHasBatteryCurrentCapacity:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBatteryCurrentCapacity
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBatteryMaximumCapacity:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_batteryMaximumCapacity = a3;
}

- (void)setHasBatteryMaximumCapacity:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBatteryMaximumCapacity
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBatteryDesignCapacity:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_batteryDesignCapacity = a3;
}

- (void)setHasBatteryDesignCapacity:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBatteryDesignCapacity
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBatteryAbsoluteCapacity:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_batteryAbsoluteCapacity = a3;
}

- (void)setHasBatteryAbsoluteCapacity:(BOOL)a3
{
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBatteryAbsoluteCapacity
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBatteryVoltage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_batteryVoltage = a3;
}

- (void)setHasBatteryVoltage:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBatteryVoltage
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setBatteryTimeRemaining:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_batteryTimeRemaining = a3;
}

- (void)setHasBatteryTimeRemaining:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBatteryTimeRemaining
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBatteryExternalPowerIsConnected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_batteryExternalPowerIsConnected = a3;
}

- (void)setHasBatteryExternalPowerIsConnected:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasBatteryExternalPowerIsConnected
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setBatteryIsCharging:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_batteryIsCharging = a3;
}

- (void)setHasBatteryIsCharging:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasBatteryIsCharging
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setBatteryFullyCharged:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_batteryFullyCharged = a3;
}

- (void)setHasBatteryFullyCharged:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasBatteryFullyCharged
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setBatteryAtWarnLevel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_batteryAtWarnLevel = a3;
}

- (void)setHasBatteryAtWarnLevel:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasBatteryAtWarnLevel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setBatteryAtCriticalLevel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_batteryAtCriticalLevel = a3;
}

- (void)setHasBatteryAtCriticalLevel:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasBatteryAtCriticalLevel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDevicePluggedIn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_devicePluggedIn = a3;
}

- (void)setHasDevicePluggedIn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasDevicePluggedIn
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setDeviceScreenOn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_deviceScreenOn = a3;
}

- (void)setHasDeviceScreenOn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasDeviceScreenOn
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (int)motionState
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_motionState;
  }
  else {
    return 0;
  }
}

- (void)setMotionState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMotionState
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)motionStateAsString:(int)a3
{
  if (a3 >= 6) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9A18[a3];
  }
}

- (int)StringAsMotionState:(id)a3
{
  if ([a3 isEqualToString:@"NW_DEVICE_MOTION_STATE_UNKNOWN"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_MOTION_STATE_STATIONARY"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_MOTION_STATE_MOVING"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_MOTION_STATE_WALKING"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_MOTION_STATE_RUNNING"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_MOTION_STATE_VEHICULAR"]) {
    return 5;
  }
  return 0;
}

- (int)thermalPressure
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_thermalPressure;
  }
  else {
    return 0;
  }
}

- (void)setThermalPressure:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_thermalPressure = a3;
}

- (void)setHasThermalPressure:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasThermalPressure
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)thermalPressureAsString:(int)a3
{
  if (a3 > 19)
  {
    if (a3 > 39)
    {
      if (a3 == 40) {
        return @"NW_DEVICE_THERMAL_PRESSURE_TRAPPING";
      }
      if (a3 == 50) {
        return @"NW_DEVICE_THERMAL_PRESSURE_SLEEPING";
      }
    }
    else
    {
      if (a3 == 20) {
        return @"NW_DEVICE_THERMAL_PRESSURE_MODERATE";
      }
      if (a3 == 30) {
        return @"NW_DEVICE_THERMAL_PRESSURE_HEAVY";
      }
    }
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id result = @"NW_DEVICE_THERMAL_PRESSURE_NOMINAL";
    switch(a3)
    {
      case 0:
        return result;
      case 1:
        id result = @"NW_DEVICE_THERMAL_PRESSURE_MODERATE_MAC";
        break;
      case 2:
        id result = @"NW_DEVICE_THERMAL_PRESSURE_HEAVY_MAC";
        break;
      case 3:
        id result = @"NW_DEVICE_THERMAL_PRESSURE_TRAPPING_MAC";
        break;
      case 4:
        id result = @"NW_DEVICE_THERMAL_PRESSURE_SLEEPING_MAC";
        break;
      case 10:
        id result = @"NW_DEVICE_THERMAL_PRESSURE_LIGHT";
        break;
      default:
        return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  return result;
}

- (int)StringAsThermalPressure:(id)a3
{
  if ([a3 isEqualToString:@"NW_DEVICE_THERMAL_PRESSURE_NOMINAL"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_THERMAL_PRESSURE_MODERATE_MAC"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_THERMAL_PRESSURE_HEAVY_MAC"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_THERMAL_PRESSURE_TRAPPING_MAC"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_THERMAL_PRESSURE_SLEEPING_MAC"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_THERMAL_PRESSURE_LIGHT"]) {
    return 10;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_THERMAL_PRESSURE_MODERATE"]) {
    return 20;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_THERMAL_PRESSURE_HEAVY"]) {
    return 30;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_THERMAL_PRESSURE_TRAPPING"]) {
    return 40;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_THERMAL_PRESSURE_SLEEPING"]) {
    return 50;
  }
  return 0;
}

- (int)cellularMode
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_cellularMode;
  }
  else {
    return 0;
  }
}

- (void)setCellularMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_cellularMode = a3;
}

- (void)setHasCellularMode:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($076F708C0EA769010F5C0656953AFB31)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCellularMode
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)cellularModeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9A48[a3];
  }
}

- (int)StringAsCellularMode:(id)a3
{
  if ([a3 isEqualToString:@"NW_DEVICE_CELLULAR_MODE_UNKNOWN"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_CELLULAR_MODE_OFF"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_CELLULAR_MODE_AUTO"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_DEVICE_CELLULAR_MODE_ON"]) {
    return 3;
  }
  return 0;
}

- (BOOL)hasBatteryAccumulator
{
  return self->_batteryAccumulator != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNWDeviceReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNWDeviceReport description](&v3, sel_description), -[AWDNWDeviceReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_batteryPercentage] forKey:@"batteryPercentage"];
    $076F708C0EA769010F5C0656953AFB31 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_batteryCurrentCapacity] forKey:@"batteryCurrentCapacity"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_batteryMaximumCapacity] forKey:@"batteryMaximumCapacity"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_batteryDesignCapacity] forKey:@"batteryDesignCapacity"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_batteryAbsoluteCapacity] forKey:@"batteryAbsoluteCapacity"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_batteryVoltage] forKey:@"batteryVoltage"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_batteryTimeRemaining] forKey:@"batteryTimeRemaining"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithBool:self->_batteryExternalPowerIsConnected] forKey:@"batteryExternalPowerIsConnected"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithBool:self->_batteryIsCharging] forKey:@"batteryIsCharging"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithBool:self->_batteryFullyCharged] forKey:@"batteryFullyCharged"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithBool:self->_batteryAtWarnLevel] forKey:@"batteryAtWarnLevel"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithBool:self->_batteryAtCriticalLevel] forKey:@"batteryAtCriticalLevel"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithBool:self->_devicePluggedIn] forKey:@"devicePluggedIn"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithBool:self->_deviceScreenOn] forKey:@"deviceScreenOn"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
LABEL_37:
    int thermalPressure = self->_thermalPressure;
    if (thermalPressure > 19)
    {
      if (thermalPressure > 39)
      {
        if (thermalPressure == 40)
        {
          v8 = @"NW_DEVICE_THERMAL_PRESSURE_TRAPPING";
          goto LABEL_54;
        }
        if (thermalPressure == 50)
        {
          v8 = @"NW_DEVICE_THERMAL_PRESSURE_SLEEPING";
          goto LABEL_54;
        }
      }
      else
      {
        if (thermalPressure == 20)
        {
          v8 = @"NW_DEVICE_THERMAL_PRESSURE_MODERATE";
          goto LABEL_54;
        }
        if (thermalPressure == 30)
        {
          v8 = @"NW_DEVICE_THERMAL_PRESSURE_HEAVY";
          goto LABEL_54;
        }
      }
LABEL_53:
      v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_thermalPressure];
    }
    else
    {
      v8 = @"NW_DEVICE_THERMAL_PRESSURE_NOMINAL";
      switch(thermalPressure)
      {
        case 0:
          break;
        case 1:
          v8 = @"NW_DEVICE_THERMAL_PRESSURE_MODERATE_MAC";
          break;
        case 2:
          v8 = @"NW_DEVICE_THERMAL_PRESSURE_HEAVY_MAC";
          break;
        case 3:
          v8 = @"NW_DEVICE_THERMAL_PRESSURE_TRAPPING_MAC";
          break;
        case 4:
          v8 = @"NW_DEVICE_THERMAL_PRESSURE_SLEEPING_MAC";
          break;
        case 10:
          v8 = @"NW_DEVICE_THERMAL_PRESSURE_LIGHT";
          break;
        default:
          goto LABEL_53;
      }
    }
LABEL_54:
    [v3 setObject:v8 forKey:@"thermalPressure"];
    if ((*(_DWORD *)&self->_has & 0x80) == 0) {
      goto LABEL_59;
    }
LABEL_55:
    uint64_t cellularMode = self->_cellularMode;
    if (cellularMode >= 4) {
      v10 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_cellularMode];
    }
    else {
      v10 = off_2641B9A48[cellularMode];
    }
    [v3 setObject:v10 forKey:@"cellularMode"];
    goto LABEL_59;
  }
LABEL_33:
  uint64_t motionState = self->_motionState;
  if (motionState >= 6) {
    v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_motionState];
  }
  else {
    v6 = off_2641B9A18[motionState];
  }
  [v3 setObject:v6 forKey:@"motionState"];
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0) {
    goto LABEL_37;
  }
LABEL_17:
  if ((*(unsigned char *)&has & 0x80) != 0) {
    goto LABEL_55;
  }
LABEL_59:
  batteryAccumulator = self->_batteryAccumulator;
  if (batteryAccumulator) {
    [v3 setObject:[[-[AWDNWAccumulator dictionaryRepresentation](batteryAccumulator, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"batteryAccumulator"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWDeviceReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    $076F708C0EA769010F5C0656953AFB31 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0) {
LABEL_18:
  }
    PBDataWriterWriteInt32Field();
LABEL_19:
  if (self->_batteryAccumulator)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_batteryPercentage;
    *((_DWORD *)a3 + 17) |= 0x10u;
    $076F708C0EA769010F5C0656953AFB31 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_batteryCurrentCapacity;
  *((_DWORD *)a3 + 17) |= 2u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 8) = self->_batteryMaximumCapacity;
  *((_DWORD *)a3 + 17) |= 8u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 7) = self->_batteryDesignCapacity;
  *((_DWORD *)a3 + 17) |= 4u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 2) = self->_batteryAbsoluteCapacity;
  *((_DWORD *)a3 + 17) |= 1u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 11) = self->_batteryVoltage;
  *((_DWORD *)a3 + 17) |= 0x40u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 10) = self->_batteryTimeRemaining;
  *((_DWORD *)a3 + 17) |= 0x20u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((unsigned char *)a3 + 62) = self->_batteryExternalPowerIsConnected;
  *((_DWORD *)a3 + 17) |= 0x1000u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((unsigned char *)a3 + 64) = self->_batteryIsCharging;
  *((_DWORD *)a3 + 17) |= 0x4000u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((unsigned char *)a3 + 63) = self->_batteryFullyCharged;
  *((_DWORD *)a3 + 17) |= 0x2000u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((unsigned char *)a3 + 61) = self->_batteryAtWarnLevel;
  *((_DWORD *)a3 + 17) |= 0x800u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((unsigned char *)a3 + 60) = self->_batteryAtCriticalLevel;
  *((_DWORD *)a3 + 17) |= 0x400u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((unsigned char *)a3 + 65) = self->_devicePluggedIn;
  *((_DWORD *)a3 + 17) |= 0x8000u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((unsigned char *)a3 + 66) = self->_deviceScreenOn;
  *((_DWORD *)a3 + 17) |= 0x10000u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 13) = self->_motionState;
  *((_DWORD *)a3 + 17) |= 0x100u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_36:
  *((_DWORD *)a3 + 14) = self->_thermalPressure;
  *((_DWORD *)a3 + 17) |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_18:
    *((_DWORD *)a3 + 12) = self->_cellularMode;
    *((_DWORD *)a3 + 17) |= 0x80u;
  }
LABEL_19:
  batteryAccumulator = self->_batteryAccumulator;
  if (batteryAccumulator) {
    [a3 setBatteryAccumulator:batteryAccumulator];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  v6 = (void *)v5;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_batteryPercentage;
    *(_DWORD *)(v5 + 68) |= 0x10u;
    $076F708C0EA769010F5C0656953AFB31 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_batteryCurrentCapacity;
  *(_DWORD *)(v5 + 68) |= 2u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 32) = self->_batteryMaximumCapacity;
  *(_DWORD *)(v5 + 68) |= 8u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 28) = self->_batteryDesignCapacity;
  *(_DWORD *)(v5 + 68) |= 4u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 8) = self->_batteryAbsoluteCapacity;
  *(_DWORD *)(v5 + 68) |= 1u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 44) = self->_batteryVoltage;
  *(_DWORD *)(v5 + 68) |= 0x40u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 40) = self->_batteryTimeRemaining;
  *(_DWORD *)(v5 + 68) |= 0x20u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(unsigned char *)(v5 + 62) = self->_batteryExternalPowerIsConnected;
  *(_DWORD *)(v5 + 68) |= 0x1000u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(unsigned char *)(v5 + 64) = self->_batteryIsCharging;
  *(_DWORD *)(v5 + 68) |= 0x4000u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(unsigned char *)(v5 + 63) = self->_batteryFullyCharged;
  *(_DWORD *)(v5 + 68) |= 0x2000u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(unsigned char *)(v5 + 61) = self->_batteryAtWarnLevel;
  *(_DWORD *)(v5 + 68) |= 0x800u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(unsigned char *)(v5 + 60) = self->_batteryAtCriticalLevel;
  *(_DWORD *)(v5 + 68) |= 0x400u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(unsigned char *)(v5 + 65) = self->_devicePluggedIn;
  *(_DWORD *)(v5 + 68) |= 0x8000u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(unsigned char *)(v5 + 66) = self->_deviceScreenOn;
  *(_DWORD *)(v5 + 68) |= 0x10000u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
LABEL_35:
    *(_DWORD *)(v5 + 56) = self->_thermalPressure;
    *(_DWORD *)(v5 + 68) |= 0x200u;
    if ((*(_DWORD *)&self->_has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_34:
  *(_DWORD *)(v5 + 52) = self->_motionState;
  *(_DWORD *)(v5 + 68) |= 0x100u;
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0) {
    goto LABEL_35;
  }
LABEL_17:
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_18:
    *(_DWORD *)(v5 + 48) = self->_cellularMode;
    *(_DWORD *)(v5 + 68) |= 0x80u;
  }
LABEL_19:

  v6[2] = [(AWDNWAccumulator *)self->_batteryAccumulator copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  int v7 = *((_DWORD *)a3 + 17);
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_batteryPercentage != *((_DWORD *)a3 + 9)) {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_batteryCurrentCapacity != *((_DWORD *)a3 + 6)) {
      goto LABEL_110;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_batteryMaximumCapacity != *((_DWORD *)a3 + 8)) {
      goto LABEL_110;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_batteryDesignCapacity != *((_DWORD *)a3 + 7)) {
      goto LABEL_110;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_110;
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_batteryAbsoluteCapacity != *((_DWORD *)a3 + 2)) {
      goto LABEL_110;
    }
  }
  else if (v7)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_batteryVoltage != *((_DWORD *)a3 + 11)) {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_batteryTimeRemaining != *((_DWORD *)a3 + 10)) {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0) {
      goto LABEL_110;
    }
    if (self->_batteryExternalPowerIsConnected)
    {
      if (!*((unsigned char *)a3 + 62)) {
        goto LABEL_110;
      }
    }
    else if (*((unsigned char *)a3 + 62))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0) {
      goto LABEL_110;
    }
    if (self->_batteryIsCharging)
    {
      if (!*((unsigned char *)a3 + 64)) {
        goto LABEL_110;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0) {
      goto LABEL_110;
    }
    if (self->_batteryFullyCharged)
    {
      if (!*((unsigned char *)a3 + 63)) {
        goto LABEL_110;
      }
    }
    else if (*((unsigned char *)a3 + 63))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0) {
      goto LABEL_110;
    }
    if (self->_batteryAtWarnLevel)
    {
      if (!*((unsigned char *)a3 + 61)) {
        goto LABEL_110;
      }
    }
    else if (*((unsigned char *)a3 + 61))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0) {
      goto LABEL_110;
    }
    if (self->_batteryAtCriticalLevel)
    {
      if (!*((unsigned char *)a3 + 60)) {
        goto LABEL_110;
      }
    }
    else if (*((unsigned char *)a3 + 60))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0) {
      goto LABEL_110;
    }
    if (self->_devicePluggedIn)
    {
      if (!*((unsigned char *)a3 + 65)) {
        goto LABEL_110;
      }
    }
    else if (*((unsigned char *)a3 + 65))
    {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    if ((v7 & 0x10000) != 0) {
      goto LABEL_110;
    }
    goto LABEL_93;
  }
  if ((v7 & 0x10000) == 0) {
    goto LABEL_110;
  }
  if (self->_deviceScreenOn)
  {
    if (!*((unsigned char *)a3 + 66)) {
      goto LABEL_110;
    }
    goto LABEL_93;
  }
  if (*((unsigned char *)a3 + 66))
  {
LABEL_110:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_93:
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_motionState != *((_DWORD *)a3 + 13)) {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_thermalPressure != *((_DWORD *)a3 + 14)) {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_110;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_cellularMode != *((_DWORD *)a3 + 12)) {
      goto LABEL_110;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_110;
  }
  batteryAccumulator = self->_batteryAccumulator;
  if ((unint64_t)batteryAccumulator | *((void *)a3 + 2))
  {
    LOBYTE(v5) = -[AWDNWAccumulator isEqual:](batteryAccumulator, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $076F708C0EA769010F5C0656953AFB31 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_batteryPercentage;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_batteryCurrentCapacity;
      if ((*(unsigned char *)&has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_batteryMaximumCapacity;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_batteryDesignCapacity;
    if (*(unsigned char *)&has) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v6 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_batteryAbsoluteCapacity;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_batteryVoltage;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_batteryTimeRemaining;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_batteryExternalPowerIsConnected;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_batteryIsCharging;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_batteryFullyCharged;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_batteryAtWarnLevel;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_batteryAtCriticalLevel;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_devicePluggedIn;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_deviceScreenOn;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v16 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_motionState;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_17;
    }
LABEL_34:
    uint64_t v18 = 0;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_18;
    }
LABEL_35:
    uint64_t v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(AWDNWAccumulator *)self->_batteryAccumulator hash];
  }
LABEL_33:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x200) == 0) {
    goto LABEL_34;
  }
LABEL_17:
  uint64_t v18 = 2654435761 * self->_thermalPressure;
  if ((*(unsigned char *)&has & 0x80) == 0) {
    goto LABEL_35;
  }
LABEL_18:
  uint64_t v19 = 2654435761 * self->_cellularMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(AWDNWAccumulator *)self->_batteryAccumulator hash];
}

- (void)mergeFrom:(id)a3
{
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x10) != 0)
  {
    self->_batteryPercentage = *((_DWORD *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x10u;
    int v3 = *((_DWORD *)a3 + 17);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_batteryCurrentCapacity = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 2u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_batteryMaximumCapacity = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 8u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_batteryDesignCapacity = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 4u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 1) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_batteryAbsoluteCapacity = *((_DWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 1u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_batteryVoltage = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x40u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_batteryTimeRemaining = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x20u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x1000) == 0)
  {
LABEL_9:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_batteryExternalPowerIsConnected = *((unsigned char *)a3 + 62);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x4000) == 0)
  {
LABEL_10:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_batteryIsCharging = *((unsigned char *)a3 + 64);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x2000) == 0)
  {
LABEL_11:
    if ((v3 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_batteryFullyCharged = *((unsigned char *)a3 + 63);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x800) == 0)
  {
LABEL_12:
    if ((v3 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_batteryAtWarnLevel = *((unsigned char *)a3 + 61);
  *(_DWORD *)&self->_has |= 0x800u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x400) == 0)
  {
LABEL_13:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_batteryAtCriticalLevel = *((unsigned char *)a3 + 60);
  *(_DWORD *)&self->_has |= 0x400u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x8000) == 0)
  {
LABEL_14:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_devicePluggedIn = *((unsigned char *)a3 + 65);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x10000) == 0)
  {
LABEL_15:
    if ((v3 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_deviceScreenOn = *((unsigned char *)a3 + 66);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x100) == 0)
  {
LABEL_16:
    if ((v3 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_uint64_t motionState = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x100u;
  int v3 = *((_DWORD *)a3 + 17);
  if ((v3 & 0x200) == 0)
  {
LABEL_17:
    if ((v3 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  self->_int thermalPressure = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x200u;
  if ((*((_DWORD *)a3 + 17) & 0x80) != 0)
  {
LABEL_18:
    self->_uint64_t cellularMode = *((_DWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_19:
  uint64_t v4 = *((void *)a3 + 2);
  if (self->_batteryAccumulator)
  {
    if (v4) {
      -[AWDNWAccumulator mergeFrom:](self->_batteryAccumulator, "mergeFrom:");
    }
  }
  else if (v4)
  {
    -[AWDNWDeviceReport setBatteryAccumulator:](self, "setBatteryAccumulator:");
  }
}

- (unsigned)batteryPercentage
{
  return self->_batteryPercentage;
}

- (unsigned)batteryCurrentCapacity
{
  return self->_batteryCurrentCapacity;
}

- (unsigned)batteryMaximumCapacity
{
  return self->_batteryMaximumCapacity;
}

- (unsigned)batteryDesignCapacity
{
  return self->_batteryDesignCapacity;
}

- (unsigned)batteryAbsoluteCapacity
{
  return self->_batteryAbsoluteCapacity;
}

- (unsigned)batteryVoltage
{
  return self->_batteryVoltage;
}

- (unsigned)batteryTimeRemaining
{
  return self->_batteryTimeRemaining;
}

- (BOOL)batteryExternalPowerIsConnected
{
  return self->_batteryExternalPowerIsConnected;
}

- (BOOL)batteryIsCharging
{
  return self->_batteryIsCharging;
}

- (BOOL)batteryFullyCharged
{
  return self->_batteryFullyCharged;
}

- (BOOL)batteryAtWarnLevel
{
  return self->_batteryAtWarnLevel;
}

- (BOOL)batteryAtCriticalLevel
{
  return self->_batteryAtCriticalLevel;
}

- (BOOL)devicePluggedIn
{
  return self->_devicePluggedIn;
}

- (BOOL)deviceScreenOn
{
  return self->_deviceScreenOn;
}

- (AWDNWAccumulator)batteryAccumulator
{
  return self->_batteryAccumulator;
}

- (void)setBatteryAccumulator:(id)a3
{
}

@end