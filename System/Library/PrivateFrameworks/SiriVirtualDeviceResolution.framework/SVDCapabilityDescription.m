@interface SVDCapabilityDescription
+ (BOOL)supportsSecureCoding;
- (NSNumber)valueRangeLowerBound;
- (NSNumber)valueRangeUpperBound;
- (NSSet)valueSet;
- (NSString)capabilityKey;
- (NSString)key;
- (SVDCapabilityDescription)initWithBacking:(id)a3;
- (SVDCapabilityDescription)initWithCoder:(id)a3;
- (SVDCapabilityDescription)initWithKey:(id)a3 valueRangeWithLowerBound:(double)a4 upperBound:(double)a5;
- (SVDCapabilityDescription)initWithKey:(id)a3 valueSet:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDCapabilityDescription

- (void).cxx_destruct
{
}

- (SVDCapabilityDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDCapabilityDescription;
  v5 = [(SVDCapabilityDescription *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDCapabilityDescriptionBacking"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution21CapabilityDescription *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSNumber)valueRangeUpperBound
{
  return [(CapabilityDescription *)self->_backing valueRangeUpperBound];
}

- (NSNumber)valueRangeLowerBound
{
  return [(CapabilityDescription *)self->_backing valueRangeLowerBound];
}

- (NSSet)valueSet
{
  return [(CapabilityDescription *)self->_backing valueSet];
}

- (NSString)capabilityKey
{
  return [(CapabilityDescription *)self->_backing capabilityKey];
}

- (NSString)key
{
  return [(CapabilityDescription *)self->_backing key];
}

- (SVDCapabilityDescription)initWithBacking:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDCapabilityDescription;
  uint64_t v6 = [(SVDCapabilityDescription *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backing, a3);
  }

  return v7;
}

- (SVDCapabilityDescription)initWithKey:(id)a3 valueRangeWithLowerBound:(double)a4 upperBound:(double)a5
{
  id v8 = a3;
  objc_super v9 = [[_TtC27SiriVirtualDeviceResolution21CapabilityDescription alloc] initWithKey:v8 lowerbound:a4 upperbound:a5];

  v10 = [(SVDCapabilityDescription *)self initWithBacking:v9];
  return v10;
}

- (SVDCapabilityDescription)initWithKey:(id)a3 valueSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_TtC27SiriVirtualDeviceResolution21CapabilityDescription alloc] initWithKey:v7 valueSet:v6];

  objc_super v9 = [(SVDCapabilityDescription *)self initWithBacking:v8];
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end