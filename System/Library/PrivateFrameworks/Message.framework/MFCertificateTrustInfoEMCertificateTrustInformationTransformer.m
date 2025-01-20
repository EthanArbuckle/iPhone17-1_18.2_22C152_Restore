@interface MFCertificateTrustInfoEMCertificateTrustInformationTransformer
+ (id)certificateTrustInformationFromMFCertificateTrustInfo:(id)a3;
@end

@implementation MFCertificateTrustInfoEMCertificateTrustInformationTransformer

+ (id)certificateTrustInformationFromMFCertificateTrustInfo:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"MFCertificateTrustInfoEMCertificateTrustInformationTransformer.m", 18, @"Invalid parameter not satisfying: %@", @"certificateTrustInfo" object file lineNumber description];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F60238]);
  uint64_t v7 = [v5 trust];
  uint64_t v8 = [v5 certificateType];
  v9 = [v5 sender];
  v10 = (void *)[v6 initWithTrust:v7 certificateType:v8 sender:v9];

  return v10;
}

@end