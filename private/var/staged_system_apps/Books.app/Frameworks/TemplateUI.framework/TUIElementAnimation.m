@interface TUIElementAnimation
+ (BOOL)instantiateChildren;
+ (BOOL)resolveAttributes;
+ (id)attributesToIgnoreWhenResolvingInvocation;
+ (id)requiredBuilderProtocol;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementAnimation

+ (id)supportedAttributes
{
  if (qword_2DF848 != -1) {
    dispatch_once(&qword_2DF848, &stru_2564B8);
  }
  v2 = (void *)qword_2DF840;

  return v2;
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (id)attributesToIgnoreWhenResolvingInvocation
{
  if (qword_2DF858 != -1) {
    dispatch_once(&qword_2DF858, &stru_2564D8);
  }
  v2 = (void *)qword_2DF850;

  return v2;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9 = a5;
  id v8 = a6;
  [v8 defineAnimation:[v9 animationDefinitonWithNode:a4.var0 nameAttribute:138] closure:[v9 closureForNode:a4.var0]];
}

@end