@interface CCDRequestPayload
- (NSDictionary)dictionary;
- (NSString)action;
- (id)_deviceInfoDictionary;
@end

@implementation CCDRequestPayload

- (NSDictionary)dictionary
{
  v10[0] = @"device";
  v3 = [(CCDRequestPayload *)self _deviceInfoDictionary];
  v4 = v3;
  if (!v3) {
    v4 = objc_opt_new();
  }
  v10[1] = @"action";
  v11[0] = v4;
  uint64_t v5 = [(CCDRequestPayload *)self action];
  v6 = (void *)v5;
  CFStringRef v7 = &stru_10001DAB0;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  v11[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  if (!v3) {

  }
  return (NSDictionary *)v8;
}

- (id)_deviceInfoDictionary
{
  v2 = +[CCDDeviceUtilities serialNumber];
  v3 = +[CCDFeatures depDeviceSerialNumberWithValue:v2];

  if (v3) {
    CFStringRef v4 = v3;
  }
  else {
    CFStringRef v4 = &stru_10001DAB0;
  }
  v10[0] = @"serial_number";
  v10[1] = @"udid";
  v11[0] = v4;
  uint64_t v5 = +[CCDDeviceUtilities UDID];
  v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = &stru_10001DAB0;
  }
  v11[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (NSString)action
{
  return 0;
}

@end