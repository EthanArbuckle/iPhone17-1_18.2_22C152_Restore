@interface NFTrustSignInputTable
@end

@implementation NFTrustSignInputTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

@end