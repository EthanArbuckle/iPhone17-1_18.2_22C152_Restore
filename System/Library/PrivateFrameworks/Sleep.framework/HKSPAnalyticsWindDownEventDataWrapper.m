@interface HKSPAnalyticsWindDownEventDataWrapper
+ (BOOL)supportsSecureCoding;
- (HKSPAnalyticsWindDownEventDataWrapper)initWithCoder:(id)a3;
- (HKSPAnalyticsWindDownEventDataWrapper)initWithEventDatums:(id)a3;
- (NSArray)eventDatums;
- (void)encodeWithCoder:(id)a3;
- (void)setEventDatums:(id)a3;
@end

@implementation HKSPAnalyticsWindDownEventDataWrapper

- (HKSPAnalyticsWindDownEventDataWrapper)initWithEventDatums:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSPAnalyticsWindDownEventDataWrapper;
  v6 = [(HKSPAnalyticsWindDownEventDataWrapper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventDatums, a3);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKSPAnalyticsWindDownEventDataWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"WindDownEvents"];

  v6 = [(HKSPAnalyticsWindDownEventDataWrapper *)self initWithEventDatums:v5];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)eventDatums
{
  return self->_eventDatums;
}

- (void)setEventDatums:(id)a3
{
}

- (void).cxx_destruct
{
}

@end