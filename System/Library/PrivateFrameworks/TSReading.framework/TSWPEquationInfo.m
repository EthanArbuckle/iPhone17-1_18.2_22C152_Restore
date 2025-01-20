@interface TSWPEquationInfo
- (Class)layoutClass;
- (Class)repClass;
- (EQKitEquation)equation;
- (TSWPEquationInfo)initWithContext:(id)a3 mathMLNode:(_xmlNode *)a4 fromXMLDoc:(_xmlDoc *)a5;
- (id)copyWithContext:(id)a3;
- (void)dealloc;
- (void)setEquation:(id)a3;
@end

@implementation TSWPEquationInfo

- (TSWPEquationInfo)initWithContext:(id)a3 mathMLNode:(_xmlNode *)a4 fromXMLDoc:(_xmlDoc *)a5
{
  if (a4)
  {
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v20 = [NSString stringWithUTF8String:"-[TSWPEquationInfo initWithContext:mathMLNode:fromXMLDoc:]"];
  objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationInfo.m"), 36, @"invalid nil value for '%s'", "mathMLNode");
  if (!a5)
  {
LABEL_3:
    v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPEquationInfo initWithContext:mathMLNode:fromXMLDoc:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationInfo.m"), 37, @"invalid nil value for '%s'", "xmlDoc");
  }
LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)TSWPEquationInfo;
  v11 = [(TSDDrawableInfo *)&v22 initWithContext:a3 geometry:0];
  if (v11)
  {
    uint64_t v21 = 0;
    v12 = (void *)[a3 documentRoot];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (id v13 = (id)[v12 performSelector:sel_equationEnvironment]) == 0)
    {
      id v13 = +[EQKitEnvironment defaultEnvironment];
    }
    v14 = +[EQKitEquation equationWithXMLDoc:a5 node:a4 environment:v13 error:&v21];
    v11->_equation = v14;
    if (!v14)
    {
      v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPEquationInfo initWithContext:mathMLNode:fromXMLDoc:]"];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationInfo.m"];
      [v15 handleFailureInFunction:v16, v17, 58, @"failed to create equation with error: %@", v21 file lineNumber description];
      if (!v11->_equation)
      {

        return 0;
      }
    }
  }
  return v11;
}

- (id)copyWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPEquationInfo;
  v4 = [(TSDDrawableInfo *)&v6 copyWithContext:a3];
  if (v4) {
    v4[18] = self->_equation;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPEquationInfo;
  [(TSDDrawableInfo *)&v3 dealloc];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (EQKitEquation)equation
{
  return self->_equation;
}

- (void)setEquation:(id)a3
{
}

@end