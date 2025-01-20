@interface TUIElementAnimationGroupPhase
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementAnimationGroupPhase

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAnimationPhaseBuilding;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF6E0 != -1) {
    dispatch_once(&qword_2DF6E0, &stru_255558);
  }
  v2 = (void *)qword_2DF6D8;

  return v2;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  [v9 setRunList:[v8 animationReferenceForAttribute:180 node:var0]];
  [v8 floatForAttribute:66 withDefault:var0 node:NAN];
  [v9 setDelay:];
  [v8 floatForAttribute:69 withDefault:var0 node:NAN];
  [v9 setDuration:];
  [v9 setOptions:[v8 animationCalculationModeAndCurveForNode:var0]];
  id v10 = [v8 stringForAttribute:138 node:var0];

  [v9 setName:v10];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 instantiateAnimationReference:[v12 runList]];

  if ([v9 count])
  {
    id v10 = objc_alloc_init(TUIAnimationGroupPhase);
    [v12 delay];
    -[TUIAnimationGroupPhase setDelay:](v10, "setDelay:");
    [v12 duration];
    -[TUIAnimationGroupPhase setDuration:](v10, "setDuration:");
    -[TUIAnimationGroupPhase setOptions:](v10, "setOptions:", -[TUIAnimationGroupPhase options](v10, "options") | (unint64_t)[v12 options]);
    [(TUIAnimationGroupPhase *)v10 setAnimations:v9];
    v11 = [v12 name];
    [v7 addAnimationGroupPhase:v10 withName:v11];
  }
}

@end