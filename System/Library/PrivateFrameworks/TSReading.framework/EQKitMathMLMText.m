@interface EQKitMathMLMText
- (BOOL)isBaseFontNameUsed;
- (BOOL)schemataIsQuoted;
- (EQKitMathMLMText)initWithContent:(id)a3;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)schemataChildren;
- (int)scriptContext;
- (int)scriptVariant;
- (void)dealloc;
@end

@implementation EQKitMathMLMText

- (EQKitMathMLMText)initWithContent:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)EQKitMathMLMText;
    v4 = [(EQKitMathMLMText *)&v6 init];
    if (v4) {
      v4->mContent = (EQKitMathMLTokenContent *)a3;
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMText;
  [(EQKitMathMLMText *)&v3 dealloc];
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v5 = [a4 parseChildrenAsTokenContentFromXMLNode:a3];

  return [(EQKitMathMLMText *)self initWithContent:v5];
}

- (const)mathMLAttributes
{
  return 0;
}

- (BOOL)schemataIsQuoted
{
  return 0;
}

- (id)schemataChildren
{
  return [(EQKitMathMLTokenContent *)self->mContent children];
}

- (BOOL)isBaseFontNameUsed
{
  return 1;
}

- (int)scriptVariant
{
  return 0;
}

- (int)scriptContext
{
  return 1;
}

@end