@interface CLPCReportingInterface
+ (id)createClient:(id *)a3;
@end

@implementation CLPCReportingInterface

+ (id)createClient:(id *)a3
{
  id v3 = [[CLPCReportingClient alloc] init:a3];
  return v3;
}

@end