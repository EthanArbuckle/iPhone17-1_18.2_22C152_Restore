@interface PDDeviceRegistrationTask
@end

@implementation PDDeviceRegistrationTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_brokerURL, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end