@interface SharingInitiatorCertChain
- (KmlTlv)sharingInitiatorCertChainTlv;
- (SharingInitiatorCertChain)init;
- (void)setSharingInitiatorCertChainTlv:(id)a3;
@end

@implementation SharingInitiatorCertChain

- (SharingInitiatorCertChain)init
{
  v10.receiver = self;
  v10.super_class = (Class)SharingInitiatorCertChain;
  v2 = [(SharingInitiatorCertChain *)&v10 init];
  v3 = v2;
  if (v2)
  {
    endpointCertData = v2->_endpointCertData;
    v2->_endpointCertData = 0;

    intermediateCertData = v3->_intermediateCertData;
    v3->_intermediateCertData = 0;

    extCACertData = v3->_extCACertData;
    v3->_extCACertData = 0;

    sharingInitiatorCertChainTlv = v3->_sharingInitiatorCertChainTlv;
    v3->_sharingInitiatorCertChainTlv = 0;

    versionInformation = v3->_versionInformation;
    v3->_versionInformation = 0;
  }
  return v3;
}

- (KmlTlv)sharingInitiatorCertChainTlv
{
  return self->_sharingInitiatorCertChainTlv;
}

- (void)setSharingInitiatorCertChainTlv:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInitiatorCertChainTlv, 0);
  objc_storeStrong((id *)&self->_endpointCertData, 0);
  objc_storeStrong((id *)&self->_intermediateCertData, 0);
  objc_storeStrong((id *)&self->_extCACertData, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);

  objc_storeStrong((id *)&self->_versionInformation, 0);
}

@end