@interface WFVariablePillLayoutMetrics
- (WFVariablePillLayoutMetrics)init;
- (WFVariablePillLayoutMetrics)initWithName:(id)a3 icon:(id)a4 font:(id)a5 height:(double)a6;
- (double)totalWidth;
@end

@implementation WFVariablePillLayoutMetrics

- (WFVariablePillLayoutMetrics)initWithName:(id)a3 icon:(id)a4 font:(id)a5 height:(double)a6
{
  uint64_t v9 = sub_2353FD4F8();
  uint64_t v11 = v10;
  id v12 = a4;
  id v13 = a5;
  return (WFVariablePillLayoutMetrics *)VariablePillLayoutMetrics.init(name:icon:font:height:)(a6, v9, v11, a4, a5);
}

- (double)totalWidth
{
  return sub_23536C718();
}

- (WFVariablePillLayoutMetrics)init
{
}

- (void).cxx_destruct
{
}

@end