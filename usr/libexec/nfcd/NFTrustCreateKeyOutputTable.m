@interface NFTrustCreateKeyOutputTable
@end

@implementation NFTrustCreateKeyOutputTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAttestationSignature, 0);
  objc_storeStrong((id *)&self->_keyDeviceNonce, 0);
  objc_storeStrong((id *)&self->_keyPublicKey, 0);
  objc_storeStrong((id *)&self->_keyPlatformIdentifier, 0);

  objc_storeStrong((id *)&self->_keyVersion, 0);
}

@end