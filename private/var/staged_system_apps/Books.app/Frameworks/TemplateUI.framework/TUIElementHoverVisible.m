@interface TUIElementHoverVisible
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementHoverVisible

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
  id v16 = a3;
  id v8 = a5;
  v9 = [v8 stringForAttribute:138 node:a4.var0];
  [v16 setRegionName:v9];

  v10 = [v8 stringForAttribute:225 node:a4.var0];

  id v11 = v10;
  v12 = v11;
  if (qword_2DF6C0 == -1)
  {
    if (!v11) {
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_2DF6C0, &stru_255510);
    if (!v12) {
      goto LABEL_6;
    }
  }
  v13 = [(id)qword_2DF6B8 objectForKeyedSubscript:v12];
  if (v13)
  {
    v14 = v13;
    id v15 = [v13 unsignedIntegerValue];

    goto LABEL_7;
  }
LABEL_6:
  id v15 = 0;
LABEL_7:

  [v16 setWhenUnavailable:v15];
}

@end