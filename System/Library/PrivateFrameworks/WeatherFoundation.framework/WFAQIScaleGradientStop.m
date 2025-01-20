@interface WFAQIScaleGradientStop
+ (BOOL)supportsSecureCoding;
- (NSString)color;
- (WFAQIScaleGradientStop)initWithCoder:(id)a3;
- (WFAQIScaleGradientStop)initWithLocation:(float)a3 color:(id)a4;
- (float)location;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAQIScaleGradientStop

- (WFAQIScaleGradientStop)initWithLocation:(float)a3 color:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFAQIScaleGradientStop;
  v7 = [(WFAQIScaleGradientStop *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_location = a3;
    uint64_t v9 = [v6 copy];
    color = v8->_color;
    v8->_color = (NSString *)v9;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [WFAQIScaleGradientStop alloc];
  [(WFAQIScaleGradientStop *)self location];
  int v6 = v5;
  v7 = [(WFAQIScaleGradientStop *)self color];
  LODWORD(v8) = v6;
  uint64_t v9 = [(WFAQIScaleGradientStop *)v4 initWithLocation:v7 color:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(WFAQIScaleGradientStop *)self location];
  objc_msgSend(v4, "encodeFloat:forKey:", @"WFAQIScaleGradientLocationKey");
  id v5 = [(WFAQIScaleGradientStop *)self color];
  [v4 encodeObject:v5 forKey:@"WFAQIScaleGradientColorKey"];
}

- (WFAQIScaleGradientStop)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"WFAQIScaleGradientLocationKey"];
  int v6 = v5;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAQIScaleGradientColorKey"];

  LODWORD(v8) = v6;
  uint64_t v9 = [(WFAQIScaleGradientStop *)self initWithLocation:v7 color:v8];

  return v9;
}

- (id)description
{
  v3 = NSString;
  [(WFAQIScaleGradientStop *)self location];
  double v5 = v4;
  int v6 = [(WFAQIScaleGradientStop *)self color];
  v7 = [v3 stringWithFormat:@"<WFAQIScaleGradient location: %f, color: %@", *(void *)&v5, v6];

  return v7;
}

- (float)location
{
  return self->_location;
}

- (NSString)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end