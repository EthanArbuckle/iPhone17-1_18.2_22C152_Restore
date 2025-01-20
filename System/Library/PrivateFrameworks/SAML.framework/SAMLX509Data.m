@interface SAMLX509Data
+ (id)createElement:(id *)a3;
- (NSData)certificate;
- (NSData)crl;
- (NSData)ski;
- (NSNumber)serialNumber;
- (NSString)issuerName;
- (NSString)subjectName;
@end

@implementation SAMLX509Data

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLX509Data alloc] initWithTagName:@"X509Data" error:a3];
  return v3;
}

- (NSString)issuerName
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"ds:X509IssuerSerial"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 firstElementByTagName:@"ds:X509IssuerName"];
    v5 = [v4 textContent];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSNumber)serialNumber
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"ds:X509IssuerSerial"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 firstElementByTagName:@"dsSerialNumber"];
    v5 = [v4 textContent];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v6 setNumberStyle:1];
      v7 = [v6 numberFromString:v5];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return (NSNumber *)v7;
}

- (NSData)ski
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"ds:X509SKI"];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
    v4 = [v2 textContent];
    v5 = (void *)[v3 initWithBase64EncodedString:v4 options:1];
  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

- (NSString)subjectName
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"ds:X509SubjectName"];
  id v3 = v2;
  if (v2)
  {
    v4 = [v2 textContent];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSData)certificate
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"ds:X509Certificate"];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
    v4 = [v2 textContent];
    v5 = (void *)[v3 initWithBase64EncodedString:v4 options:1];
  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

- (NSData)crl
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"ds:X509CRL"];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
    v4 = [v2 textContent];
    v5 = (void *)[v3 initWithBase64EncodedString:v4 options:1];
  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

@end