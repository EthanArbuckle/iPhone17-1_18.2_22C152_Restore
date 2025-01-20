@interface KmlBindingAttestation
@end

@implementation KmlBindingAttestation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_sharingToken, 0);
  objc_storeStrong((id *)&self->_anonymizedDsid, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_leafCertificate, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_extensionsData, 0);
  objc_storeStrong((id *)&self->_attestationDataSequence, 0);

  objc_storeStrong((id *)&self->_bindingAttestation, 0);
}

@end