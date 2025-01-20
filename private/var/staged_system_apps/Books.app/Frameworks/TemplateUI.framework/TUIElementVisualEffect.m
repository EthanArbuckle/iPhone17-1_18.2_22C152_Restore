@interface TUIElementVisualEffect
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementVisualEffect

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_2DF5D8 != -1) {
    dispatch_once(&qword_2DF5D8, &stru_254EF0);
  }
  v2 = (void *)qword_2DF5D0;

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

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a3;
  id v9 = [a5 stringForAttribute:40 node:var0];
  [v8 setBlurStyle:[TUIVisualEffectBox blurEffectStyleFromString:v9]];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v5 = [a4 finalizeModelsWithParent:a3 box:a3 context:a5];
}

@end