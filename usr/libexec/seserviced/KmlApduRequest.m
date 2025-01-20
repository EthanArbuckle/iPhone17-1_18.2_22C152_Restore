@interface KmlApduRequest
@end

@implementation KmlApduRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptedData, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_channel, 0);

  objc_storeStrong((id *)&self->_header, 0);
}

@end