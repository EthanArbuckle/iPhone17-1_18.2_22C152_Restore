@interface ULWiFiScanChannel
- (ULWiFiScanChannel)initWithBand:(unint64_t)a3 andChannelNumber:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)band;
- (unint64_t)channelNumber;
- (void)setBand:(unint64_t)a3;
- (void)setChannelNumber:(unint64_t)a3;
@end

@implementation ULWiFiScanChannel

- (ULWiFiScanChannel)initWithBand:(unint64_t)a3 andChannelNumber:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ULWiFiScanChannel;
  v6 = [(ULWiFiScanChannel *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(ULWiFiScanChannel *)v6 setBand:a3];
    [(ULWiFiScanChannel *)v7 setChannelNumber:a4];
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ULWiFiScanChannel alloc];
  unint64_t v5 = [(ULWiFiScanChannel *)self band];
  unint64_t v6 = [(ULWiFiScanChannel *)self channelNumber];
  return [(ULWiFiScanChannel *)v4 initWithBand:v5 andChannelNumber:v6];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  unint64_t v7 = [(ULWiFiScanChannel *)self band];
  if (v7 > 3) {
    v8 = @"Invalid";
  }
  else {
    v8 = off_2653F94C8[v7];
  }
  [v6 appendFormat:@", band: %@", v8];
  objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ULWiFiScanChannel channelNumber](self, "channelNumber"));
  [v6 appendFormat:@", channelNumber: %@", v9];

  [v6 appendString:@">"];
  return v6;
}

- (unint64_t)band
{
  return self->_band;
}

- (void)setBand:(unint64_t)a3
{
  self->_band = a3;
}

- (unint64_t)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(unint64_t)a3
{
  self->_channelNumber = a3;
}

@end