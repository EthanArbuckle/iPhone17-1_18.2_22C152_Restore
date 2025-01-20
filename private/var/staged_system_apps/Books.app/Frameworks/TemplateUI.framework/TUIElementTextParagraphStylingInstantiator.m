@interface TUIElementTextParagraphStylingInstantiator
+ (BOOL)instantiateChildren;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementTextParagraphStylingInstantiator

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
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___TUIElementTextParagraphStylingInstantiator;
  uint64_t var0 = a4.var0;
  id v9 = a5;
  id v10 = a3;
  [super configureObject:v10 withNode:var0 attributes:v9 context:a6];
  [v9 floatForAttribute:109 node:var0];
  [v10 setIndentFirstLine];
  [v9 floatForAttribute:110 node:var0];
  [v10 setIndentLeading:];
  [v9 floatForAttribute:111 node:var0];
  double v12 = v11;

  [v10 setIndentTrailing:v12];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [v6 ensureParagraphBoundary];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 configureParagraphStyle:v7];
  }
}

@end