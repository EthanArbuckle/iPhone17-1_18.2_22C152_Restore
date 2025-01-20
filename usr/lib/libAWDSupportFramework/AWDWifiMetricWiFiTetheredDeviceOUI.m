@interface AWDWifiMetricWiFiTetheredDeviceOUI
- (BOOL)hasTetheredOUI;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)tetheredOUI;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTetheredOUI:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWifiMetricWiFiTetheredDeviceOUI

- (void)dealloc
{
  [(AWDWifiMetricWiFiTetheredDeviceOUI *)self setTetheredOUI:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiMetricWiFiTetheredDeviceOUI;
  [(AWDWifiMetricWiFiTetheredDeviceOUI *)&v3 dealloc];
}

- (BOOL)hasTetheredOUI
{
  return self->_tetheredOUI != 0;
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiMetricWiFiTetheredDeviceOUI;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWifiMetricWiFiTetheredDeviceOUI description](&v3, sel_description), -[AWDWifiMetricWiFiTetheredDeviceOUI dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  tetheredOUI = self->_tetheredOUI;
  if (tetheredOUI) {
    [v3 setObject:tetheredOUI forKey:@"tetheredOUI"];
  }
  if (*(unsigned char *)&self->_has) {
    [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiMetricWiFiTetheredDeviceOUIReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_tetheredOUI) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_tetheredOUI) {
    [a3 setTetheredOUI:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 16) = [(NSData *)self->_tetheredOUI copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    tetheredOUI = self->_tetheredOUI;
    if (!((unint64_t)tetheredOUI | *((void *)a3 + 2))
      || (int v5 = -[NSData isEqual:](tetheredOUI, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_timestamp == *((void *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_tetheredOUI hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[AWDWifiMetricWiFiTetheredDeviceOUI setTetheredOUI:](self, "setTetheredOUI:");
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)tetheredOUI
{
  return self->_tetheredOUI;
}

- (void)setTetheredOUI:(id)a3
{
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end