@interface SSMetricsMutableEvent
+ (id)Topic;
- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4;
@end

@implementation SSMetricsMutableEvent

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_6226F0(a3, v8, (void (**)(void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

+ (id)Topic
{
  NSString v2 = sub_AB64D0();

  return v2;
}

@end