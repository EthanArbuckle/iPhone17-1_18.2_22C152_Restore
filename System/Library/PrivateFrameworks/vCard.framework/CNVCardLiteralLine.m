@interface CNVCardLiteralLine
+ (id)lineWithLiteralValue:(id)a3;
- (CNVCardLiteralLine)initWithLiteralValue:(id)a3;
- (void)serializeWithStrategy:(id)a3;
@end

@implementation CNVCardLiteralLine

+ (id)lineWithLiteralValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithLiteralValue:v4];

  return v5;
}

- (CNVCardLiteralLine)initWithLiteralValue:(id)a3
{
  id v4 = a3;
  v5 = [(CNVCardLiteralLine *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    literalValue = v5->_literalValue;
    v5->_literalValue = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)serializeWithStrategy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end