@interface TUIElementGrid
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementGrid

+ (id)supportedAttributes
{
  if (qword_2DF788 != -1) {
    dispatch_once(&qword_2DF788, &stru_2562D0);
  }
  v2 = (void *)qword_2DF780;

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

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v11 = a3;
  [v8 insetsForAttribute:112 node:var0];
  [v11 setInsets:];
  objc_msgSend(v11, "setColumns:", (unint64_t)fmax((double)(uint64_t)objc_msgSend(v8, "integerForAttribute:withDefault:node:", 52, 1, var0), 1.0));
  [v8 floatForAttribute:193 node:var0];
  double v10 = v9;

  [v11 setSpacing:v10];
}

@end