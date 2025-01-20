@interface EQKitMathMLBinaryNode
- (BOOL)isBaseFontNameUsed;
- (EQKitMathMLBinaryNode)init;
- (EQKitMathMLBinaryNode)initWithFirst:(id)a3 second:(id)a4;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (void)dealloc;
@end

@implementation EQKitMathMLBinaryNode

- (EQKitMathMLBinaryNode)init
{
  return [(EQKitMathMLBinaryNode *)self initWithFirst:0 second:0];
}

- (EQKitMathMLBinaryNode)initWithFirst:(id)a3 second:(id)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EQKitMathMLBinaryNode.mm", 22, @"inFirst should not be nil");
    if (a4) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EQKitMathMLBinaryNode.mm", 23, @"inSecond should not be nil");
LABEL_3:
  v10.receiver = self;
  v10.super_class = (Class)EQKitMathMLBinaryNode;
  v8 = [(EQKitMathMLBinaryNode *)&v10 init];
  if (v8)
  {
    v8->mFirst = (EQKitMathMLNode *)a3;
    v8->mSecond = (EQKitMathMLNode *)a4;
    [(EQKitMathMLNode *)v8->mFirst setParent:v8];
    [(EQKitMathMLNode *)v8->mSecond setParent:v8];
  }
  return v8;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v7 = objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:");
  if ([v7 count] == 2)
  {
    uint64_t v8 = [v7 objectAtIndex:0];
    uint64_t v9 = [v7 objectAtIndex:1];
    return [(EQKitMathMLBinaryNode *)self initWithFirst:v8 second:v9];
  }
  else
  {
    [a4 reportError:5 withNode:a3];

    return 0;
  }
}

- (const)mathMLAttributes
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  if ([(EQKitMathMLNode *)self->mFirst isBaseFontNameUsed]) {
    return 1;
  }
  mSecond = self->mSecond;

  return [(EQKitMathMLNode *)mSecond isBaseFontNameUsed];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLBinaryNode;
  [(EQKitMathMLBinaryNode *)&v3 dealloc];
}

@end