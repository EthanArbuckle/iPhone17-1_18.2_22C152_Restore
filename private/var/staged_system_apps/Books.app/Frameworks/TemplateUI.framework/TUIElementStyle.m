@interface TUIElementStyle
+ (BOOL)needsAttributesEvaluated;
+ (BOOL)resolveAttributes;
+ (id)attributesToEvaluate;
+ (id)requiredBuilderProtocol;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementStyle

+ (id)supportedAttributes
{
  return +[TUIAttributeSet supportedAttributesStyling];
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)needsAttributesEvaluated
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (id)attributesToEvaluate
{
  if (qword_2DF2D0 != -1) {
    dispatch_once(&qword_2DF2D0, &stru_252B98);
  }
  v2 = (void *)qword_2DF2C8;

  return v2;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  if (v8) {
    [v8 styleDefinitionWithNode:a4.var0 nameAttribute:137 inheritAttribute:106];
  }
  unsigned int v10 = [v8 closureForNode:a4.var0];
  long long v11 = v13;
  uint64_t v12 = v14;
  [v9 defineStyle:&v11 closure:v10];
}

@end