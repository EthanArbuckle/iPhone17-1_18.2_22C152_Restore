@interface TUIElementTextLineStylingInstantiator
+ (BOOL)instantiateChildren;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementTextLineStylingInstantiator

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUITextModelBuilding;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___TUIElementTextLineStylingInstantiator;
  uint64_t var0 = a4.var0;
  id v9 = a5;
  id v10 = a3;
  [super configureObject:v10 withNode:var0 attributes:v9 context:a6];
  id v11 = [v9 integerForAttribute:123 withDefault:0x7FFFFFFFFFFFFFFFLL node:var0];

  [v10 setLines:v11];
  [v10 setRelativeToDropLines:0];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v12 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [v6 ensureParagraphBoundary];
  }
  if ([v12 lines] != (id)0x7FFFFFFFFFFFFFFFLL && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [v12 lines];
    id v8 = [v12 relativeToDropLines];
    id v9 = [v12 style];
    id v10 = [v12 color];
    id v11 = [v12 fontSpec];
    [v6 configureLineStylingForLines:v7 relativeToDropCapLines:v8 style:v9 color:v10 fontSpec:v11];
  }
}

@end