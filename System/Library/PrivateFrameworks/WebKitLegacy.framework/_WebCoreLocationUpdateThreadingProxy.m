@interface _WebCoreLocationUpdateThreadingProxy
- (_WebCoreLocationUpdateThreadingProxy)initWithProvider:(id)a3;
- (void)errorOccurred:(id)a3;
- (void)geolocationAuthorizationDenied;
- (void)geolocationAuthorizationGranted;
- (void)positionChanged:(void *)a3;
- (void)resetGeolocation;
@end

@implementation _WebCoreLocationUpdateThreadingProxy

- (_WebCoreLocationUpdateThreadingProxy)initWithProvider:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_WebCoreLocationUpdateThreadingProxy;
  result = [(_WebCoreLocationUpdateThreadingProxy *)&v5 init];
  if (result) {
    result->_provider = (WebGeolocationProviderIOS *)a3;
  }
  return result;
}

- (void)geolocationAuthorizationGranted
{
}

- (void)geolocationAuthorizationDenied
{
}

- (void)positionChanged:(void *)a3
{
  v3 = [[WebGeolocationPosition alloc] initWithGeolocationPosition:a3];
  v4 = v3;
  cf = v3;
  if (v3) {
    CFRetain(v3);
  }
  WebThreadRun();
  if (cf) {
    CFRelease(cf);
  }
  if (v4) {
    CFRelease(v4);
  }
}

- (void)errorOccurred:(id)a3
{
}

- (void)resetGeolocation
{
}

@end