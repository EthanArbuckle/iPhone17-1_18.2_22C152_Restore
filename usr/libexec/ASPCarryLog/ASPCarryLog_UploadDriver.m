@interface ASPCarryLog_UploadDriver
- (int)_DRResponseConversion:(unsigned __int8)a3;
- (int)allowToParticipateTaskingId:(id)a3 DeviceId:(id)a4;
- (int)uploadFile:(id)a3 TaskingId:(id)a4 DeviceId:(id)a5 LogType:(id)a6;
@end

@implementation ASPCarryLog_UploadDriver

- (int)_DRResponseConversion:(unsigned __int8)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (int)uploadFile:(id)a3 TaskingId:(id)a4 DeviceId:(id)a5 LogType:(id)a6
{
  CFStringRef v15 = @"DeviceID";
  id v16 = a5;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  ASPCarryLog_UploadFileToDP(v12, @"com.apple.coreos.nand", v11, @"com.apple.nand.iolog", v13, v9);
  return 1;
}

- (int)allowToParticipateTaskingId:(id)a3 DeviceId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v18 = @"DeviceID";
  id v19 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  if (&_DRShouldEnableLogGathering)
  {
    uint64_t v9 = DRShouldEnableLogGathering();
    id v10 = 0;
    if (!v10)
    {
      int v16 = [(ASPCarryLog_UploadDriver *)self _DRResponseConversion:v9];
      goto LABEL_9;
    }
    id v11 = v10;
    id v12 = [v10 localizedDescription];
    id v13 = [v12 UTF8String];

    v14 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100045E34((uint64_t)v13, v14);
    }
  }
  else
  {
    CFStringRef v15 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100045DF0(v15);
    }
  }
  int v16 = 0;
LABEL_9:

  return v16;
}

@end