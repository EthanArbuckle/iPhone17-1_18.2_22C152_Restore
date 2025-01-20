@interface SUSUIFakeDocumentation
- (id)licenseAgreement;
@end

@implementation SUSUIFakeDocumentation

- (id)licenseAgreement
{
  return (id)objc_msgSend(@"hello, here's a fake terms and conditions sheet", "dataUsingEncoding:", 4, a2, self);
}

@end