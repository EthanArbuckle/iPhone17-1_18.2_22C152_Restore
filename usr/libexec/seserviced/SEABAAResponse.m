@interface SEABAAResponse
@end

@implementation SEABAAResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceCert, 0);

  objc_storeStrong((id *)&self->_authorityCert, 0);
}

@end