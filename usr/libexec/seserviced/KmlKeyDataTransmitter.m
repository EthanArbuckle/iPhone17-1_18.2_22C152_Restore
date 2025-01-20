@interface KmlKeyDataTransmitter
@end

@implementation KmlKeyDataTransmitter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseToSend, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_keyAttestation, 0);
  objc_storeStrong((id *)&self->_instanceAttestation, 0);

  objc_storeStrong((id *)&self->_deviceCertificate, 0);
}

@end