@interface EQKitMathMLMLabeledTr
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
@end

@implementation EQKitMathMLMLabeledTr

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  [a4 pushState:3];
  v7 = (void *)[a4 parseChildrenAsArrayFromXMLNode:a3];
  [a4 popState];
  if ([v7 count])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v7];
    [v8 removeObjectAtIndex:0];
    v11.receiver = self;
    v11.super_class = (Class)EQKitMathMLMLabeledTr;
    v9 = [(EQKitMathMLMTr *)&v11 initWithChildren:v8 node:a3];
  }
  else
  {

    return 0;
  }
  return v9;
}

@end