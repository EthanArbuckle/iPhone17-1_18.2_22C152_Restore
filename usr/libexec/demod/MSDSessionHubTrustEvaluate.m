@interface MSDSessionHubTrustEvaluate
- (BOOL)isHubCertificatePinnedTo:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4;
@end

@implementation MSDSessionHubTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MSDSessionHubTrustEvaluate;
  if ([(MSDSessionBaseTrustEvaluate *)&v7 trustServer:a3 isRedirect:a4]
    || [(MSDSessionBaseTrustEvaluate *)self isDone]
    || (BOOL v5 = [(MSDSessionHubTrustEvaluate *)self isHubCertificatePinnedTo:[(MSDSessionBaseTrustEvaluate *)self leafCertificate] applePKI:[(MSDSessionBaseTrustEvaluate *)self applePKI]]))
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isHubCertificatePinnedTo:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v7 = +[MSDTargetDevice sharedInstance];
  v8 = [v7 hubCertificateIdentifier];

  v9 = [(MSDSessionBaseTrustEvaluate *)self identifierFor:a3 applePKI:v4];
  if (v9) {
    unsigned __int8 v10 = [v8 isEqualToString:v9];
  }
  else {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

@end