@interface TUIElementAspectBox
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7;
@end

@implementation TUIElementAspectBox

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
  id v8 = a3;
  [a5 floatForAttribute:13 withDefault:var0 node:1.0];
  [v8 setAspectRatio:];
}

+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7
{
  uint64_t var0 = a4.var0;
  id v9 = a5;
  id v10 = a3;
  v11 = [v9 stringForAttribute:96 node:var0];
  [v10 setHalign:[TUIBox halignFromString:v11]];

  id v12 = [v9 stringForAttribute:216 node:var0];

  [v10 setValign:[TUIBox valignFromString:v12]];
}

@end