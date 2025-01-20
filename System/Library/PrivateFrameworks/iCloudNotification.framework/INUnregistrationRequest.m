@interface INUnregistrationRequest
+ (Class)responseClass;
- (id)urlString;
@end

@implementation INUnregistrationRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 unregisterDeviceURL];

  return v3;
}

@end