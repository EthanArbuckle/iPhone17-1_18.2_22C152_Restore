@interface CLGpsSignalQuality
+ (BOOL)supportsSecureCoding;
- (CLGpsSignalQuality)init;
- (CLGpsSignalQuality)initWithCoder:(id)a3;
- (CLGpsSignalQuality)initWithSignalQuality:(int)a3;
- (int)quality;
- (void)encodeWithCoder:(id)a3;
- (void)setQuality:(int)a3;
@end

@implementation CLGpsSignalQuality

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLGpsSignalQuality)init
{
  return 0;
}

- (CLGpsSignalQuality)initWithSignalQuality:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLGpsSignalQuality;
  v4 = [(CLGpsSignalQuality *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_quality = a3;
    v6 = v4;
  }

  return v5;
}

- (CLGpsSignalQuality)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLGpsSignalQuality;
  v5 = [(CLGpsSignalQuality *)&v8 init];
  if (v5)
  {
    v5->_quality = [v4 decodeIntForKey:@"signalQuality"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (int)quality
{
  return self->_quality;
}

- (void)setQuality:(int)a3
{
  self->_quality = a3;
}

@end