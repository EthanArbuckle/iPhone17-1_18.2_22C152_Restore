@interface EQKitMathMLTernaryNode
- (BOOL)isBaseFontNameUsed;
- (EQKitMathMLTernaryNode)init;
- (EQKitMathMLTernaryNode)initWithFirst:(id)a3 second:(id)a4 third:(id)a5;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (void)dealloc;
@end

@implementation EQKitMathMLTernaryNode

- (EQKitMathMLTernaryNode)init
{
  return [(EQKitMathMLTernaryNode *)self initWithFirst:0 second:0 third:0];
}

- (EQKitMathMLTernaryNode)initWithFirst:(id)a3 second:(id)a4 third:(id)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_8:
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EQKitMathMLTernaryNode.mm", 24, @"inSecond should not be nil");
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EQKitMathMLTernaryNode.mm", 23, @"inFirst should not be nil");
  if (!a4) {
    goto LABEL_8;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_9:
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EQKitMathMLTernaryNode.mm", 25, @"inThird should not be nil");
LABEL_4:
  v12.receiver = self;
  v12.super_class = (Class)EQKitMathMLTernaryNode;
  v10 = [(EQKitMathMLTernaryNode *)&v12 init];
  if (v10)
  {
    v10->mFirst = (EQKitMathMLNode *)a3;
    v10->mSecond = (EQKitMathMLNode *)a4;
    v10->mThird = (EQKitMathMLNode *)a5;
    [(EQKitMathMLNode *)v10->mFirst setParent:v10];
    [(EQKitMathMLNode *)v10->mSecond setParent:v10];
    [(EQKitMathMLNode *)v10->mThird setParent:v10];
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLTernaryNode;
  [(EQKitMathMLTernaryNode *)&v3 dealloc];
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v7 = objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:");
  if ([v7 count] == 3)
  {
    uint64_t v8 = [v7 objectAtIndex:0];
    uint64_t v9 = [v7 objectAtIndex:1];
    uint64_t v10 = [v7 objectAtIndex:2];
    return [(EQKitMathMLTernaryNode *)self initWithFirst:v8 second:v9 third:v10];
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
  if ([(EQKitMathMLNode *)self->mFirst isBaseFontNameUsed]
    || [(EQKitMathMLNode *)self->mSecond isBaseFontNameUsed])
  {
    return 1;
  }
  mThird = self->mThird;

  return [(EQKitMathMLNode *)mThird isBaseFontNameUsed];
}

@end