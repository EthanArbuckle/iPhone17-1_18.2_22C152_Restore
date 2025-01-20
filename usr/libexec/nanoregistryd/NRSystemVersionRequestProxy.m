@interface NRSystemVersionRequestProxy
+ (id)machServiceName;
+ (id)serverExportedInterface;
- (id)registryDelegate;
- (void)sendVersionRequestToCompanion;
@end

@implementation NRSystemVersionRequestProxy

+ (id)machServiceName
{
  return @"com.apple.nanoregistry.versionrequest";
}

- (id)registryDelegate
{
  return [(NRSystemVersionRequestProxy *)self target];
}

+ (id)serverExportedInterface
{
  if (qword_1001A1498 != -1) {
    dispatch_once(&qword_1001A1498, &stru_100169940);
  }
  v2 = (void *)qword_1001A1490;

  return v2;
}

- (void)sendVersionRequestToCompanion
{
  id v2 = [(NRSystemVersionRequestProxy *)self registryDelegate];
  [v2 sendVersionRequestToCompanion];
}

@end