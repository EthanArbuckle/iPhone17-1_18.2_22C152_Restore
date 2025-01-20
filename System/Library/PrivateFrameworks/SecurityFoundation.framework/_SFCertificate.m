@interface _SFCertificate
+ (BOOL)supportsSecureCoding;
- (NSData)serialNumber;
- (NSString)issuerName;
- (NSString)subject;
- (_SFCertificate)initWithSecCertificate:(__SecCertificate *)a3;
- (__SecCertificate)secCertificate;
- (int64_t)certificateType;
- (void)dealloc;
@end

@implementation _SFCertificate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFCertificate)initWithSecCertificate:(__SecCertificate *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFCertificate;
  v4 = [(_SFCertificate *)&v8 init];
  if (v4)
  {
    v5 = objc_alloc_init(SFCertificate_Ivars);
    id certificateInternal = v4->_certificateInternal;
    v4->_id certificateInternal = v5;

    *((void *)v4->_certificateInternal + 5) = a3;
    CFRetain(*((CFTypeRef *)v4->_certificateInternal + 5));
  }
  return v4;
}

- (int64_t)certificateType
{
  return *((void *)self->_certificateInternal + 1);
}

- (NSString)subject
{
  v2 = (void *)[*((id *)self->_certificateInternal + 2) copy];
  return (NSString *)v2;
}

- (NSString)issuerName
{
  v2 = (void *)[*((id *)self->_certificateInternal + 3) copy];
  return (NSString *)v2;
}

- (NSData)serialNumber
{
  return (NSData *)*((id *)self->_certificateInternal + 4);
}

- (__SecCertificate)secCertificate
{
  return (__SecCertificate *)*((void *)self->_certificateInternal + 5);
}

- (void)dealloc
{
  v3 = (const void *)*((void *)self->_certificateInternal + 5);
  if (v3)
  {
    CFRelease(v3);
    *((void *)self->_certificateInternal + 5) = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SFCertificate;
  [(_SFCertificate *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end