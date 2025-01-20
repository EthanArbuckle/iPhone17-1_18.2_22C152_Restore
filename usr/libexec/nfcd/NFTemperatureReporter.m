@interface NFTemperatureReporter
- (void)dealloc;
@end

@implementation NFTemperatureReporter

- (void)dealloc
{
  id v3 = (id)sub_1001E6DA4((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)NFTemperatureReporter;
  [(NFTemperatureReporter *)&v4 dealloc];
}

@end