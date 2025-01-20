@interface EQKitMathMLUnaryNode
- (BOOL)isBaseFontNameUsed;
- (EQKitMathMLUnaryNode)init;
- (EQKitMathMLUnaryNode)initWithChild:(id)a3;
- (EQKitMathMLUnaryNode)initWithChildren:(id)a3;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (void)dealloc;
@end

@implementation EQKitMathMLUnaryNode

- (EQKitMathMLUnaryNode)init
{
  return [(EQKitMathMLUnaryNode *)self initWithChild:0];
}

- (EQKitMathMLUnaryNode)initWithChild:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EQKitMathMLUnaryNode.mm", 22, @"child should not be nil");
  }
  v8.receiver = self;
  v8.super_class = (Class)EQKitMathMLUnaryNode;
  v5 = [(EQKitMathMLUnaryNode *)&v8 init];
  if (v5)
  {
    v6 = (EQKitMathMLNode *)a3;
    v5->mChild = v6;
    [(EQKitMathMLNode *)v6 setParent:v5];
  }
  return v5;
}

- (EQKitMathMLUnaryNode)initWithChildren:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EQKitMathMLUnaryNode;
  v4 = [(EQKitMathMLUnaryNode *)&v6 init];
  if (v4) {
    v4->mChild = (EQKitMathMLNode *)[[EQKitMathMLMRow alloc] initWithChildren:a3];
  }
  return v4;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v7 = objc_msgSend(a4, "parseChildrenAsNodeFromXMLNode:");
  if (v7)
  {
    return [(EQKitMathMLUnaryNode *)self initWithChild:v7];
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
  return [(EQKitMathMLNode *)self->mChild isBaseFontNameUsed];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLUnaryNode;
  [(EQKitMathMLUnaryNode *)&v3 dealloc];
}

@end