@interface SPRServiceXPC
+ (NSString)machServiceName;
+ (NSXPCInterface)interface;
@end

@implementation SPRServiceXPC

+ (NSString)machServiceName
{
  return (NSString *)@"com.apple.softposreaderd";
}

+ (NSXPCInterface)interface
{
  if (qword_267F494F0 != -1) {
    dispatch_once(&qword_267F494F0, &unk_26D31D808);
  }
  v2 = (void *)qword_267F494F8;
  return (NSXPCInterface *)v2;
}

@end