@interface OIXMLTextNode
+ (id)textNodeWithStringValue:(id)a3;
- (OIXMLTextNode)initWithStringValue:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)name;
- (id)stringValue;
- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4;
- (void)setStringValue:(id)a3;
@end

@implementation OIXMLTextNode

- (id)name
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"OIXMLNode.m" lineNumber:216 description:@"This should never be reached"];

  return 0;
}

+ (id)textNodeWithStringValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithStringValue:v4];

  return v5;
}

- (OIXMLTextNode)initWithStringValue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OIXMLTextNode;
  v5 = [(OIXMLTextNode *)&v8 init];
  v6 = v5;
  if (v5) {
    [(OIXMLTextNode *)v5 setStringValue:v4];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(OIXMLTextNode *)self stringValue];
  v6 = (void *)[v4 initWithStringValue:v5];

  return v6;
}

- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  LOWORD(v7) = -3913;
  v5 = [(OIXMLTextNode *)self stringValue];
  +[OIXMLNode _escapeCharacters:&v6 amount:9 escapeWhiteSpaces:1 inString:v5 appendingToString:a3];
}

- (id)stringValue
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setStringValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end