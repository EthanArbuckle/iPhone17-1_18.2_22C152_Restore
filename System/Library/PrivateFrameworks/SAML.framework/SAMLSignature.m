@interface SAMLSignature
+ (id)createElement:(id *)a3;
- (BOOL)isValid;
- (NSData)signatureValue;
- (NSString)identifier;
- (NSString)signatureValueId;
- (SAMLKeyInfo)keyInfo;
- (SAMLSignedInfo)signedInfo;
@end

@implementation SAMLSignature

+ (id)createElement:(id *)a3
{
  v7[3] = *MEMORY[0x263EF8340];
  v3 = [(XMLWrapperElement *)[SAMLSignature alloc] initWithTagName:@"Signature" error:a3];
  if (v3)
  {
    v7[0] = @"SignedInfo";
    v7[1] = @"SignatureValue";
    v7[2] = @"KeyInfo";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
    [(XMLWrapperElement *)v3 setChildElementSequence:v4];

    v5 = SAMLSignatureNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v5];
  }
  return v3;
}

- (NSString)identifier
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"ID"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (SAMLSignedInfo)signedInfo
{
  return (SAMLSignedInfo *)[(XMLWrapperElement *)self firstElementByTagName:@"SignedInfo"];
}

- (NSData)signatureValue
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SignatureValue"];
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

- (NSString)signatureValueId
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SignatureValue"];
  id v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"ID"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (SAMLKeyInfo)keyInfo
{
  return (SAMLKeyInfo *)[(XMLWrapperElement *)self firstElementByTagName:@"KeyInfo"];
}

- (BOOL)isValid
{
  return 1;
}

@end