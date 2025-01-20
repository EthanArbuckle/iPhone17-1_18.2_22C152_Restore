@interface BSUIElementProfileImage
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation BSUIElementProfileImage

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_3D4168 != -1) {
    dispatch_once(&qword_3D4168, &stru_38F158);
  }
  v2 = (void *)qword_3D4160;

  return v2;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  [v8 floatForAttribute:60 node:var0];
  [v9 setCornerRadius:];
  id v10 = [v8 colorForAttribute:126 node:var0];

  [v9 setMaskColor:v10];
}

@end