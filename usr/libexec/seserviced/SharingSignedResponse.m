@interface SharingSignedResponse
- (SEEndPointAuthorizeResponse)epAuthResponse;
- (void)setEpAuthResponse:(id)a3;
@end

@implementation SharingSignedResponse

- (SEEndPointAuthorizeResponse)epAuthResponse
{
  return self->_epAuthResponse;
}

- (void)setEpAuthResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_epAuthResponse, 0);
  objc_storeStrong((id *)&self->_additionalAttestationsDict, 0);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_refreshedInstanceCAData, 0);
  objc_storeStrong((id *)&self->_supportedRadiosData, 0);
  objc_storeStrong((id *)&self->_mailboxMappingData, 0);
  objc_storeStrong((id *)&self->_ownerSignatureTlv, 0);
  objc_storeStrong((id *)&self->_signedResponseTLV, 0);
  objc_storeStrong((id *)&self->_ktsReceiptTlv, 0);
  objc_storeStrong((id *)&self->_ownerEncryptionkeyTlv, 0);
  objc_storeStrong((id *)&self->_encConfidentialMailboxTlv, 0);

  objc_storeStrong((id *)&self->_keyAttestationTlv, 0);
}

@end