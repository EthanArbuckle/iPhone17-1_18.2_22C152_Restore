@interface KmlApduResponse
@end

@implementation KmlApduResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedResponse, 0);
  objc_storeStrong((id *)&self->_tlvs, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end