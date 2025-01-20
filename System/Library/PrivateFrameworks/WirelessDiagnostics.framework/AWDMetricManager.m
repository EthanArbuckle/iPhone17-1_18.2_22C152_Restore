@interface AWDMetricManager
+ (void)postMetricWithId:(unint64_t)a3;
+ (void)postMetricWithId:(unint64_t)a3 BOOLValue:(BOOL)a4;
+ (void)postMetricWithId:(unint64_t)a3 integerValue:(int64_t)a4;
+ (void)postMetricWithId:(unint64_t)a3 numberValue:(id)a4;
+ (void)postMetricWithId:(unint64_t)a3 object:(id)a4;
+ (void)postMetricWithId:(unint64_t)a3 stringValue:(id)a4;
+ (void)postMetricWithId:(unint64_t)a3 unsignedIntegerValue:(unint64_t)a4;
@end

@implementation AWDMetricManager

+ (void)postMetricWithId:(unint64_t)a3
{
}

+ (void)postMetricWithId:(unint64_t)a3 BOOLValue:(BOOL)a4
{
}

+ (void)postMetricWithId:(unint64_t)a3 integerValue:(int64_t)a4
{
}

+ (void)postMetricWithId:(unint64_t)a3 unsignedIntegerValue:(unint64_t)a4
{
}

+ (void)postMetricWithId:(unint64_t)a3 stringValue:(id)a4
{
}

+ (void)postMetricWithId:(unint64_t)a3 numberValue:(id)a4
{
}

+ (void)postMetricWithId:(unint64_t)a3 object:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 longLongValue];
    AWDPostSimpleMetricWithInteger();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 UTF8String];
    AWDPostSimpleMetricWithString();
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(id)objc_opt_class() description];
    int v7 = 134218242;
    unint64_t v8 = a3;
    __int16 v9 = 2080;
    uint64_t v10 = [v6 UTF8String];
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric:#E In postMetricWithId:object: for mid 0x%lx: unsupported NSObject type! (Got '%s')", (uint8_t *)&v7, 0x16u);
  }
}

@end