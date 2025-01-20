@interface EndpointConfigForSharing
@end

@implementation EndpointConfigForSharing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_keyCreationConfig, 0);
  objc_storeStrong((id *)&self->_deviceConfigTlvs, 0);
  objc_storeStrong((id *)&self->_endpointConfigTlvForSiaC, 0);

  objc_storeStrong((id *)&self->_endpointConfigTlv, 0);
}

@end