@interface DMFCertificate
- (id)initWithCertificateRef:(__SecCertificate *)a3 isIdentity:(BOOL)a4;
@end

@implementation DMFCertificate

- (id)initWithCertificateRef:(__SecCertificate *)a3 isIdentity:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void *)SecCertificateCopyCommonNames();
  CFDataRef v8 = SecCertificateCopyData(a3);
  if (v7)
  {
    v9 = [v7 firstObject];
  }
  else
  {
    v9 = 0;
  }
  v10 = [(DMFCertificate *)self initWithCommonName:v9 data:v8 isIdentity:v4];

  return v10;
}

@end