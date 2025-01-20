@interface SAMLKeyInfo
+ (id)createElement:(id *)a3;
- (NSData)spkiSexpData;
- (NSString)identifier;
- (NSString)keyName;
- (NSString)mgmtData;
- (SAMLKeyRetrievalMethod)retrievalMethod;
- (SAMLPGPData)pgpData;
- (SAMLSignatureKeyValue)keyValue;
- (SAMLX509Data)x509Data;
@end

@implementation SAMLKeyInfo

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLKeyInfo alloc] initWithTagName:@"KeyInfo" error:a3];
  if (v3)
  {
    v4 = SAMLSignatureNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (NSString)identifier
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"ID"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)keyName
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"KeyName"];
  v3 = v2;
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

- (SAMLSignatureKeyValue)keyValue
{
  return (SAMLSignatureKeyValue *)[(XMLWrapperElement *)self firstElementByTagName:@"KeyValue"];
}

- (SAMLKeyRetrievalMethod)retrievalMethod
{
  return (SAMLKeyRetrievalMethod *)[(XMLWrapperElement *)self firstElementByTagName:@"RetrievalMethod"];
}

- (SAMLX509Data)x509Data
{
  return (SAMLX509Data *)[(XMLWrapperElement *)self firstElementByTagName:@"X509Data"];
}

- (SAMLPGPData)pgpData
{
  return (SAMLPGPData *)[(XMLWrapperElement *)self firstElementByTagName:@"PGPData"];
}

- (NSData)spkiSexpData
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SPKIData"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 firstElementByTagName:@"ds:SPKISexp"];
    if (v4)
    {
      id v5 = objc_alloc(MEMORY[0x263EFF8F8]);
      v6 = [v4 textContent];
      v7 = (void *)[v5 initWithBase64EncodedString:v6 options:1];
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

  return (NSData *)v7;
}

- (NSString)mgmtData
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"MgmtData"];
  v3 = v2;
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

@end