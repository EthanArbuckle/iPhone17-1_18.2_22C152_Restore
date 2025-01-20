@interface WFHotspotDetails
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualHotspotDetails:(id)a3;
- (NSNumber)batteryLife;
- (NSNumber)signalStrength;
- (NSString)cellularProtocolString;
- (id)description;
- (unint64_t)hash;
- (void)setBatteryLife:(id)a3;
- (void)setCellularProtocolString:(id)a3;
- (void)setSignalStrength:(id)a3;
@end

@implementation WFHotspotDetails

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(WFHotspotDetails *)self isEqualHotspotDetails:v4];

  return v5;
}

- (BOOL)isEqualHotspotDetails:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFHotspotDetails *)self batteryLife];
  v6 = [v4 batteryLife];
  if ([v5 isEqual:v6])
  {
    v7 = [(WFHotspotDetails *)self cellularProtocolString];
    v8 = [v4 cellularProtocolString];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(WFHotspotDetails *)self signalStrength];
      v10 = [v4 signalStrength];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(WFHotspotDetails *)self batteryLife];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(WFHotspotDetails *)self cellularProtocolString];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(WFHotspotDetails *)self signalStrength];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFHotspotDetails *)self batteryLife];
  v7 = [(WFHotspotDetails *)self cellularProtocolString];
  unint64_t v8 = [(WFHotspotDetails *)self signalStrength];
  v9 = [v3 stringWithFormat:@"(%@) batteryLife: %@ | cellularProtocolString: %@ | signalStrength: %@", v5, v6, v7, v8];

  return v9;
}

- (NSNumber)batteryLife
{
  return self->_batteryLife;
}

- (void)setBatteryLife:(id)a3
{
}

- (NSString)cellularProtocolString
{
  return self->_cellularProtocolString;
}

- (void)setCellularProtocolString:(id)a3
{
}

- (NSNumber)signalStrength
{
  return self->_signalStrength;
}

- (void)setSignalStrength:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalStrength, 0);
  objc_storeStrong((id *)&self->_cellularProtocolString, 0);
  objc_storeStrong((id *)&self->_batteryLife, 0);
}

@end