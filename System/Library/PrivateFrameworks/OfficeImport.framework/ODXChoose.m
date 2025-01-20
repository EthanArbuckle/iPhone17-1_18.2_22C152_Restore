@interface ODXChoose
+ (void)readElseNode:(_xmlNode *)a3 toChoose:(id)a4 state:(id)a5;
+ (void)readIfNode:(_xmlNode *)a3 toChoose:(id)a4 state:(id)a5;
+ (void)readNode:(_xmlNode *)a3 toChoose:(id)a4 state:(id)a5;
@end

@implementation ODXChoose

+ (void)readNode:(_xmlNode *)a3 toChoose:(id)a4 state:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  for (i = OCXFirstChild(a3); ; i = OCXNextSibling(i))
  {
    v10 = [v8 ODXDiagramNamespace];
    BOOL HasName = CXNodeHasName(i, v10, (xmlChar *)"if");

    if (!HasName) {
      break;
    }
    [a1 readIfNode:i toChoose:v14 state:v8];
  }
  v12 = [v8 ODXDiagramNamespace];
  BOOL v13 = CXNodeHasName(i, v12, (xmlChar *)"else");

  if (v13)
  {
    [a1 readElseNode:i toChoose:v14 state:v8];
    i = OCXNextSibling(i);
  }
  if (i) {
    [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Unexpected choose node child."];
  }
}

+ (void)readIfNode:(_xmlNode *)a3 toChoose:(id)a4 state:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = objc_alloc_init(ODDWhen);
  [v10 addWhen:v8];
  v9 = [(ODDWhen *)v8 iteratorSpecification];
  +[ODXIteratorSpecification readFromNode:a3 toSpecification:v9 state:v7];

  +[ODXLayoutObjectList readNode:a3 toList:v8 state:v7];
}

+ (void)readElseNode:(_xmlNode *)a3 toChoose:(id)a4 state:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = objc_alloc_init(ODDOtherwise);
  [v9 setOtherwise:v8];
  +[ODXLayoutObjectList readNode:a3 toList:v8 state:v7];
}

@end