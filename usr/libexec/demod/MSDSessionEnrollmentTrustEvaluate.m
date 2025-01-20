@interface MSDSessionEnrollmentTrustEvaluate
- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4;
@end

@implementation MSDSessionEnrollmentTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MSDSessionEnrollmentTrustEvaluate;
  if ([(MSDSessionBaseTrustEvaluate *)&v7 trustServer:a3 isRedirect:a4]
    || [(MSDSessionBaseTrustEvaluate *)self isDone]
    || (BOOL v5 = [(MSDSessionBaseTrustEvaluate *)self saveHubCertificateIdentifer:[(MSDSessionBaseTrustEvaluate *)self leafCertificate] applePKI:[(MSDSessionBaseTrustEvaluate *)self applePKI]]))
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

@end