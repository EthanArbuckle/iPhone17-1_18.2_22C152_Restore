@interface PDSharingManagementRequest
- (NSString)regionIdentifier;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setRegionIdentifier:(id)a3;
@end

@implementation PDSharingManagementRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  return 0;
}

- (NSString)regionIdentifier
{
  return self->_regionIdentifier;
}

- (void)setRegionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end