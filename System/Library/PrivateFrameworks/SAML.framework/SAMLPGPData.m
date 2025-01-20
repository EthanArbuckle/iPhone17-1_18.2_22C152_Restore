@interface SAMLPGPData
+ (id)createElement:(id *)a3;
- (NSData)keyId;
- (NSData)packet;
@end

@implementation SAMLPGPData

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLPGPData alloc] initWithTagName:@"PGPData" error:a3];
  return v3;
}

- (NSData)keyId
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"ds:PGPKeyID"];
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

- (NSData)packet
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"ds:PGPKeyPacket"];
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