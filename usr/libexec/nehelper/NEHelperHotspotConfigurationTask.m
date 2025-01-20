@interface NEHelperHotspotConfigurationTask
@end

@implementation NEHelperHotspotConfigurationTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_requestMessage, 0);

  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

@end