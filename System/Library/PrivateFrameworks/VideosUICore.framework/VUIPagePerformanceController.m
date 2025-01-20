@interface VUIPagePerformanceController
+ (void)postNotificationForImageProxy:(id)a3 withLoadingStatus:(BOOL)a4 withError:(id)a5;
@end

@implementation VUIPagePerformanceController

void __90__VUIPagePerformanceController_postNotificationForImageProxy_withLoadingStatus_withError___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:a1[4] object:a1[5] userInfo:a1[6]];
}

+ (void)postNotificationForImageProxy:(id)a3 withLoadingStatus:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = mach_absolute_time();
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v11 = [NSNumber numberWithUnsignedLongLong:v9];
  [v10 setObject:v11 forKeyedSubscript:@"VUIPagePerformanceImageProxyNotificationTimestamp"];

  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:@"VUIPagePerformanceImageProxyNotificationError"];
  }
  v12 = @"VUIPagePerformanceImageProxyDidLoadNotification";
  if (v6) {
    v12 = @"VUIPagePerformanceImageProxyWillLoadNotification";
  }
  v13 = v12;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__VUIPagePerformanceController_postNotificationForImageProxy_withLoadingStatus_withError___block_invoke;
  v18[3] = &unk_1E6DDD510;
  v19 = v13;
  id v20 = v7;
  id v21 = v10;
  id v14 = v10;
  id v15 = v7;
  v16 = v13;
  v17 = (void *)MEMORY[0x1E4E604D0](v18);
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

@end