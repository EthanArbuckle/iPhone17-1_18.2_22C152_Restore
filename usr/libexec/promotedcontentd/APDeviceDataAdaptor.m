@interface APDeviceDataAdaptor
+ (id)identifier;
+ (id)validClassInputs;
- (BOOL)_validateParameters:(id *)a3;
- (id)deviceClass;
- (void)_run:(id)a3;
@end

@implementation APDeviceDataAdaptor

+ (id)identifier
{
  return @"com.apple.ap.device";
}

+ (id)validClassInputs
{
  if (qword_100288910 != -1) {
    dispatch_once(&qword_100288910, &stru_100233F58);
  }
  v2 = (void *)qword_100288908;

  return v2;
}

- (void)_run:(id)a3
{
  v4 = (void (**)(id, void *, void, void *))a3;
  v5 = [(APDataAdaptor *)self parameters];
  v6 = [v5 objectForKeyedSubscript:@"class"];

  if (v6)
  {
    v7 = [(APDataAdaptor *)self parameters];
    v8 = [v7 objectForKeyedSubscript:@"class"];

    v9 = [(APDeviceDataAdaptor *)self deviceClass];
    if (v9)
    {
      uint64_t v10 = (uint64_t)[v8 containsObject:v9];
      v6 = 0;
    }
    else
    {
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      CFStringRef v14 = @"Unable to determine device class";
      uint64_t v10 = 1;
      v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      v6 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5207 userInfo:v11];
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
  v12 = +[NSNumber numberWithBool:v10];
  v4[2](v4, v12, 0, v6);
}

- (BOOL)_validateParameters:(id *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)APDeviceDataAdaptor;
  if (!-[APDataAdaptor _validateParameters:](&v14, "_validateParameters:")) {
    return 0;
  }
  v5 = [(APDataAdaptor *)self parameters];
  v6 = [v5 objectForKeyedSubscript:@"class"];
  unsigned int v7 = [(APDataAdaptor *)self _checkClassType:v6 name:@"class" expectedClass:objc_opt_class() error:a3];

  if (!v7) {
    return 0;
  }
  v8 = [(APDataAdaptor *)self parameters];
  v9 = [v8 objectForKeyedSubscript:@"class"];
  uint64_t v10 = +[NSSet setWithArray:v9];

  v11 = +[APDeviceDataAdaptor validClassInputs];
  unsigned __int8 v12 = [v10 isSubsetOfSet:v11];

  return v12;
}

- (id)deviceClass
{
  v2 = +[APDeviceInfo current];
  v3 = [v2 deviceModel];

  if ([v3 hasPrefix:@"iPhone"])
  {
    CFStringRef v4 = @"IPHONE";
  }
  else if ([v3 hasPrefix:@"iPad"])
  {
    CFStringRef v4 = @"IPAD";
  }
  else if (([v3 hasPrefix:@"Mac"] & 1) != 0 {
         || ([v3 hasPrefix:@"iMac"] & 1) != 0)
  }
  {
    CFStringRef v4 = @"MAC";
  }
  else if ([v3 hasPrefix:@"iPod"])
  {
    CFStringRef v4 = @"IPOD";
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return (id)v4;
}

@end