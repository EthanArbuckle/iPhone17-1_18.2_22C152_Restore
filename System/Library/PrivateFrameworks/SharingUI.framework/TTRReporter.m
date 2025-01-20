@interface TTRReporter
- (TTRReporter)init;
- (TTRReporter)initWithReport:(id)a3;
- (void)openReport;
@end

@implementation TTRReporter

- (TTRReporter)initWithReport:(id)a3
{
  id v3 = a3;
  return (TTRReporter *)sub_21DB76F5C(a3);
}

- (void)openReport
{
  v2 = self;
  sub_21DB77070();
}

- (TTRReporter)init
{
  return (TTRReporter *)sub_21DB79BC8();
}

- (void).cxx_destruct
{
}

@end