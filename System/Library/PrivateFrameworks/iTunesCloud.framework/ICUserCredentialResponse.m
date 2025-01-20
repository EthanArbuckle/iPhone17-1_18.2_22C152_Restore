@interface ICUserCredentialResponse
- (ICUserIdentityProperties)iCloudIdentityProperties;
- (ICUserIdentityProperties)identityProperties;
- (void)setICloudIdentityProperties:(id)a3;
- (void)setIdentityProperties:(id)a3;
@end

@implementation ICUserCredentialResponse

- (ICUserIdentityProperties)identityProperties
{
  return self->_identityProperties;
}

- (ICUserIdentityProperties)iCloudIdentityProperties
{
  return self->_iCloudIdentityProperties;
}

- (void)setIdentityProperties:(id)a3
{
}

- (void)setICloudIdentityProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudIdentityProperties, 0);

  objc_storeStrong((id *)&self->_identityProperties, 0);
}

@end