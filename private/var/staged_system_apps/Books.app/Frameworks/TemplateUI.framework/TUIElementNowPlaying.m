@interface TUIElementNowPlaying
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementNowPlaying

+ (id)supportedAttributes
{
  if (qword_2DF230 != -1) {
    dispatch_once(&qword_2DF230, &stru_251EA8);
  }
  v2 = (void *)qword_2DF228;

  return v2;
}

+ (unint64_t)definesScopes
{
  return 0;
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
  v10 = [v8 stringForAttribute:151 node:var0];
  id v13 = v10;
  if (v10) {
    BOOL v11 = [v10 caseInsensitiveCompare:@"playing"] == 0;
  }
  else {
    BOOL v11 = 0;
  }
  [v9 setPlaying:v11];
  v12 = [v8 colorForAttribute:51 node:var0];

  [v9 setColor:v12];
}

@end