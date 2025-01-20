@interface SFTrustEvaluator_Ivars
@end

@implementation SFTrustEvaluator_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->applicationAnchorCertificates, 0);
  objc_storeStrong((id *)&self->revocationPolicy, 0);
  objc_storeStrong((id *)&self->trustPolicy, 0);
}

@end