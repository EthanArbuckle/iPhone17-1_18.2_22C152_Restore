@interface WFShortcutSigningCertificate
- (NSDate)expirationDate;
- (NSString)commonName;
- (WFShortcutSigningCertificate)initWithCertificate:(__SecCertificate *)a3;
- (WFShortcutSigningCertificate)initWithCertificateData:(id)a3;
- (__SecCertificate)certificate;
- (__SecKey)copyPublicKey;
- (id)generateAuthData;
- (void)dealloc;
- (void)setCertificate:(__SecCertificate *)a3;
@end

@implementation WFShortcutSigningCertificate

- (void).cxx_destruct
{
}

- (void)setCertificate:(__SecCertificate *)a3
{
  self->_certificate = a3;
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)dealloc
{
  CFRelease(self->_certificate);
  v3.receiver = self;
  v3.super_class = (Class)WFShortcutSigningCertificate;
  [(WFShortcutSigningCertificate *)&v3 dealloc];
}

- (WFShortcutSigningCertificate)initWithCertificateData:(id)a3
{
  SecCertificateRef v4 = SecCertificateCreateWithData(0, (CFDataRef)a3);
  if (v4)
  {
    self = [(WFShortcutSigningCertificate *)self initWithCertificate:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (WFShortcutSigningCertificate)initWithCertificate:(__SecCertificate *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFShortcutSigningCertificate;
  SecCertificateRef v4 = [(WFShortcutSigningCertificate *)&v7 init];
  if (v4)
  {
    v4->_certificate = (__SecCertificate *)CFRetain(a3);
    v5 = v4;
  }

  return v4;
}

- (id)generateAuthData
{
  CFDataRef v2 = SecCertificateCopyData([(WFShortcutSigningCertificate *)self certificate]);
  return v2;
}

- (__SecKey)copyPublicKey
{
  CFDataRef v2 = [(WFShortcutSigningCertificate *)self certificate];
  return SecCertificateCopyKey(v2);
}

- (NSString)commonName
{
  CFStringRef commonName = 0;
  if (SecCertificateCopyCommonName([(WFShortcutSigningCertificate *)self certificate], &commonName)) {
    CFDataRef v2 = 0;
  }
  else {
    CFDataRef v2 = (__CFString *)commonName;
  }
  return (NSString *)v2;
}

@end