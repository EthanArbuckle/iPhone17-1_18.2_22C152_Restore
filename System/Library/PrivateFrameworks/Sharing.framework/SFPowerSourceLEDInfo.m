@interface SFPowerSourceLEDInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SFPowerSourceLEDInfo)initWithCoder:(id)a3;
- (id)description;
- (int)LEDColor;
- (int)LEDState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLEDColor:(int)a3;
- (void)setLEDState:(int)a3;
@end

@implementation SFPowerSourceLEDInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPowerSourceLEDInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFPowerSourceLEDInfo;
  v5 = [(SFPowerSourceLEDInfo *)&v8 init];
  if (v5)
  {
    uint64_t v9 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_LEDState = v9;
    }
    uint64_t v9 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_LEDColor = v9;
    }
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t LEDState = self->_LEDState;
  id v7 = v4;
  if (LEDState)
  {
    [v4 encodeInteger:LEDState forKey:@"state"];
    id v4 = v7;
  }
  uint64_t LEDColor = self->_LEDColor;
  if (LEDColor)
  {
    [v7 encodeInteger:LEDColor forKey:@"color"];
    id v4 = v7;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int LEDState = self->_LEDState;
    if (LEDState == [v5 LEDState])
    {
      int LEDColor = self->_LEDColor;
      BOOL v8 = LEDColor == [v5 LEDColor];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_LEDColor ^ self->_LEDState;
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;
  NSAppendPrintF();
  id v3 = v2;

  NSAppendPrintF();
  id v4 = v3;

  return v4;
}

- (int)LEDColor
{
  return self->_LEDColor;
}

- (void)setLEDColor:(int)a3
{
  self->_int LEDColor = a3;
}

- (int)LEDState
{
  return self->_LEDState;
}

- (void)setLEDState:(int)a3
{
  self->_int LEDState = a3;
}

@end