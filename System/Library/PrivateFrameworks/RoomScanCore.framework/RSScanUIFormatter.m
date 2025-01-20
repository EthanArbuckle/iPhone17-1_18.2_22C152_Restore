@interface RSScanUIFormatter
- (RSScanUIFormatter)init;
@end

@implementation RSScanUIFormatter

- (void).cxx_destruct
{
}

- (RSScanUIFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)RSScanUIFormatter;
  v2 = [(RSScanUIFormatter *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(RSFloorPlan);
    prevFloorPlan = v2->_prevFloorPlan;
    v2->_prevFloorPlan = v3;
  }
  return v2;
}

@end