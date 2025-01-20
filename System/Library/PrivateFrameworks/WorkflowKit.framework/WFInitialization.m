@interface WFInitialization
+ (int64_t)initializeProcessWithDatabase:(BOOL)a3;
+ (int64_t)initializeProcessWithDatabase:(BOOL)a3 skipDeletingTemporaryFiles:(BOOL)a4;
@end

@implementation WFInitialization

+ (int64_t)initializeProcessWithDatabase:(BOOL)a3
{
  return WFInitializeProcess(a3, 0);
}

+ (int64_t)initializeProcessWithDatabase:(BOOL)a3 skipDeletingTemporaryFiles:(BOOL)a4
{
  return WFInitializeProcess(a3, a4);
}

@end