@interface PerfPowerServicesReaderService
- (void)dataForRequest:(id)a3 withReply:(id)a4;
@end

@implementation PerfPowerServicesReaderService

- (void)dataForRequest:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v8 = PPSLogReaderService();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v9) {
      sub_1000032A8((uint64_t)v5, v8);
    }

    id v10 = [objc_alloc((Class)PPSRequestDispatcher) initWithFilepath:0];
    v13[0] = 0;
    v11 = [v10 dataForRequest:v5 withError:v13];
    id v12 = v13[0];
  }
  else
  {
    if (v9) {
      sub_1000031A0(v8);
    }

    id v12 = 0;
    v11 = 0;
  }
  v6[2](v6, v11, v12);
}

@end