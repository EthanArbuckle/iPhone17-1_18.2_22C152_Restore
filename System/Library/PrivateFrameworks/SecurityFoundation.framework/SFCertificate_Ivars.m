@interface SFCertificate_Ivars
@end

@implementation SFCertificate_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->serialNumber, 0);
  objc_storeStrong((id *)&self->issuerName, 0);
  objc_storeStrong((id *)&self->subject, 0);
}

@end