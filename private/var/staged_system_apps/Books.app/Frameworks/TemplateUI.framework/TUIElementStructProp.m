@interface TUIElementStructProp
+ (BOOL)resolveAttributes;
+ (id)attributesToEvaluate;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementStructProp

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIStructBuilding;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (id)attributesToEvaluate
{
  if (qword_2DF490 != -1) {
    dispatch_once(&qword_2DF490, &stru_253EE8);
  }
  v2 = (void *)qword_2DF488;

  return v2;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v8 = a5;
  [v9 setValue:[v8 unresolvedValueForAttribute:215 node:a4.var0] forKey:[v8 propertyNameForAttribute:137 node:a4.var0]];
}

@end