@interface KeySigningRequest
- (SEEndPoint)endpoint;
- (void)setEndpoint:(id)a3;
@end

@implementation KeySigningRequest

- (SEEndPoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_passcodeTlv, 0);
  objc_storeStrong((id *)&self->_signingRequestTlv, 0);
  objc_storeStrong((id *)&self->_encryptionKeyAttestationData, 0);
  objc_storeStrong((id *)&self->_endpointCertTlv, 0);
  objc_storeStrong((id *)&self->_instanceCACertTlv, 0);

  objc_storeStrong((id *)&self->_extCACertTlv, 0);
}

@end