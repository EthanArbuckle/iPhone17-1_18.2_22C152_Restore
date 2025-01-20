@interface MFMessageSignerEMMessageSignerTransformer
+ (id)messageSignerFromMFMessageSigner:(id)a3;
@end

@implementation MFMessageSignerEMMessageSignerTransformer

+ (id)messageSignerFromMFMessageSigner:(id)a3
{
  id v3 = a3;
  v4 = [v3 signingCertificateTrustInfo];
  v5 = +[MFCertificateTrustInfoEMCertificateTrustInformationTransformer certificateTrustInformationFromMFCertificateTrustInfo:v4];

  v6 = [v3 encryptionCertificateTrustInfo];
  if (v6)
  {
    v7 = +[MFCertificateTrustInfoEMCertificateTrustInformationTransformer certificateTrustInformationFromMFCertificateTrustInfo:v6];
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F603C8]) initWithSigningTrust:v5 encryptionTrust:v7];

  return v8;
}

@end