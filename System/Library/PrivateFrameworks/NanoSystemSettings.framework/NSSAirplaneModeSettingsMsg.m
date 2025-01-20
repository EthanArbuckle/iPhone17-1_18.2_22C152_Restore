@interface NSSAirplaneModeSettingsMsg
- (BOOL)bluetoothOn;
- (BOOL)cellularOn;
- (BOOL)hasCellularOn;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wifiOn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBluetoothOn:(BOOL)a3;
- (void)setCellularOn:(BOOL)a3;
- (void)setHasCellularOn:(BOOL)a3;
- (void)setWifiOn:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSAirplaneModeSettingsMsg

- (void)setCellularOn:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cellularOn = a3;
}

- (void)setHasCellularOn:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCellularOn
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSAirplaneModeSettingsMsg;
  v4 = [(NSSAirplaneModeSettingsMsg *)&v8 description];
  v5 = [(NSSAirplaneModeSettingsMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_cellularOn];
    [v3 setObject:v4 forKey:@"cellularOn"];
  }
  v5 = [NSNumber numberWithBool:self->_wifiOn];
  [v3 setObject:v5 forKey:@"wifiOn"];

  v6 = [NSNumber numberWithBool:self->_bluetoothOn];
  [v3 setObject:v6 forKey:@"bluetoothOn"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSAirplaneModeSettingsMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)a3 + 9) = self->_cellularOn;
    *((unsigned char *)a3 + 12) |= 1u;
  }
  *((unsigned char *)a3 + 10) = self->_wifiOn;
  *((unsigned char *)a3 + 8) = self->_bluetoothOn;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)result + 9) = self->_cellularOn;
    *((unsigned char *)result + 12) |= 1u;
  }
  *((unsigned char *)result + 10) = self->_wifiOn;
  *((unsigned char *)result + 8) = self->_bluetoothOn;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_16;
    }
    if (self->_cellularOn)
    {
      if (!v4[9]) {
        goto LABEL_16;
      }
    }
    else if (v4[9])
    {
      goto LABEL_16;
    }
  }
  else if (v4[12])
  {
    goto LABEL_16;
  }
  if (self->_wifiOn)
  {
    if (v4[10]) {
      goto LABEL_12;
    }
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (v4[10]) {
    goto LABEL_16;
  }
LABEL_12:
  if (self->_bluetoothOn) {
    BOOL v5 = v4[8] != 0;
  }
  else {
    BOOL v5 = v4[8] == 0;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_cellularOn;
  }
  else {
    uint64_t v2 = 0;
  }
  return (2654435761 * self->_wifiOn) ^ v2 ^ (2654435761 * self->_bluetoothOn);
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_cellularOn = *((unsigned char *)a3 + 9);
    *(unsigned char *)&self->_has |= 1u;
  }
  self->_wifiOn = *((unsigned char *)a3 + 10);
  self->_bluetoothOn = *((unsigned char *)a3 + 8);
}

- (BOOL)cellularOn
{
  return self->_cellularOn;
}

- (BOOL)wifiOn
{
  return self->_wifiOn;
}

- (void)setWifiOn:(BOOL)a3
{
  self->_wifiOn = a3;
}

- (BOOL)bluetoothOn
{
  return self->_bluetoothOn;
}

- (void)setBluetoothOn:(BOOL)a3
{
  self->_bluetoothOn = a3;
}

@end