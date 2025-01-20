@interface POXSBase64BinaryDefinition
- (id)stringFromValue:(id)a3;
- (id)valueFromString:(id)a3;
@end

@implementation POXSBase64BinaryDefinition

- (id)valueFromString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF8F8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:1];

  return v5;
}

- (id)stringFromValue:(id)a3
{
  return (id)[a3 base64EncodedStringWithOptions:0];
}

@end