@interface UAMockActivityScanner
- (SFActivityScannerDelegate)delegate;
- (UAActivityReplay)controller;
- (UAMockActivityScanner)initWithController:(id)a3;
- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation UAMockActivityScanner

- (UAMockActivityScanner)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UAMockActivityScanner;
  v6 = [(UAMockActivityScanner *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controller, a3);
  }

  return v7;
}

- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = sub_10000BA18(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138544130;
    id v19 = v12;
    __int16 v20 = 2114;
    id v21 = v13;
    __int16 v22 = 2114;
    id v23 = v14;
    __int16 v24 = 2048;
    int64_t v25 = a6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "activityPayloadFromDevice:%{public}@ forAdvertisementPayload:%{public}@ command:%{public}@ timeout:%ld", (uint8_t *)&v18, 0x2Au);
  }

  v17 = [(UAMockActivityScanner *)self controller];
  [v17 activityPayloadFromDevice:v12 forAdvertisementPayload:v13 command:v14 timeout:a6 withCompletionHandler:v15];
}

- (SFActivityScannerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFActivityScannerDelegate *)a3;
}

- (UAActivityReplay)controller
{
  return (UAActivityReplay *)objc_getProperty(self, a2, 16, 1);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end