@interface NFTrustSignOutputTable
@end

@implementation NFTrustSignOutputTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_counter, 0);

  objc_storeStrong((id *)&self->_localValidation, 0);
}

@end