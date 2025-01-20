@interface TUIElementHFlow
+ (Class)objectClass;
+ (id)containerAttributes;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementHFlow

+ (id)supportedAttributes
{
  if (qword_2DF4C0 != -1) {
    dispatch_once(&qword_2DF4C0, &stru_254170);
  }
  v2 = (void *)qword_2DF4B8;

  return v2;
}

+ (id)containerAttributes
{
  if (qword_2DF4D0 != -1) {
    dispatch_once(&qword_2DF4D0, &stru_254190);
  }
  v2 = (void *)qword_2DF4C8;

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
  id v9 = a3;
  v10 = [v8 stringForAttribute:96 node:var0];
  [v9 setHalign:[TUIBox halignFromString:v10]];

  id v11 = [v8 lengthForAttribute:101 node:var0];
  [v9 setHspacing:v11, v12];
  id v13 = [v8 lengthForAttribute:221 node:var0];
  [v9 setVspacing:v13, v14];
  id v15 = [v8 stringForAttribute:120 node:var0];

  [v9 setLayoutMode:[TUIBox layoutModeFromString:v15]];
}

@end