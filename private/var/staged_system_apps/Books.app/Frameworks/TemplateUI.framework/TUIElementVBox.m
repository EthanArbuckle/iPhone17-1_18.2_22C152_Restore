@interface TUIElementVBox
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)containerAttributes;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementVBox

+ (id)supportedAttributes
{
  return +[TUIAttributeSet supportedAttributesSize];
}

+ (id)containerAttributes
{
  if (qword_2DF2E0 != -1) {
    dispatch_once(&qword_2DF2E0, &stru_252BF0);
  }
  v2 = (void *)qword_2DF2D8;

  return v2;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7
{
  id v16 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t var0 = a4.var0;
  v13 = [v10 stringForAttribute:219 node:a4.var0];
  if ([v13 isEqualToString:@"baseline"]) {
    [v11 setPivotChild:v16];
  }
  v14 = [v10 stringForAttribute:217 node:var0];
  [v16 setVcompressed:[TUIBox compressedFromString:v14]];

  v15 = [v16 dynamicArrayWindowingBox];
  if (v15)
  {
    [v10 floatForAttribute:79 node:var0];
    [v15 setEstimatedWidth:];
    [v10 floatForAttribute:77 node:var0];
    [v15 setEstimatedHeight:];
  }
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a3;
  [v8 setGrouped:[a5 BOOLForAttribute:93 node:var0]];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 finalizeModelsWithParent:v8 box:v8 context:a5];
  id v10 = [v7 pivotChild];

  [v8 setPivotChild:v10];
}

@end