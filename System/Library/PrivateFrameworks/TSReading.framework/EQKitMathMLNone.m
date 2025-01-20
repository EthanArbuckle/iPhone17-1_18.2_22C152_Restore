@interface EQKitMathMLNone
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
@end

@implementation EQKitMathMLNone

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLNone;
  return [(EQKitMathMLNone *)&v5 init];
}

- (const)mathMLAttributes
{
  return 0;
}

@end