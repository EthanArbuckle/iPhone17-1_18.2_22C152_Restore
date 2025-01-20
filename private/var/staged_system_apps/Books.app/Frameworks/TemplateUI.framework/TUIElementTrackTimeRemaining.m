@interface TUIElementTrackTimeRemaining
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementTrackTimeRemaining

+ (id)supportedAttributes
{
  if (qword_2DF9D0 != -1) {
    dispatch_once(&qword_2DF9D0, &stru_256BA8);
  }
  v2 = (void *)qword_2DF9C8;

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
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v22 = [v10 fontSpecForNode:var0];
  v12 = [v10 objectForAttribute:113 node:var0];
  v13 = [v10 objectForAttribute:150 node:var0];
  v14 = objc_alloc_init(TUITextContentStyler);
  v15 = [v10 colorForAttribute:30 node:var0];
  [(TUIBackgroundColorStyler *)v14 setBackgroundColor:v15];

  v16 = [v10 colorForAttribute:51 node:var0];

  [(TUITextContentStyler *)v14 setTextColor:v16];
  v17 = [v22 font];
  [(TUITextContentStyler *)v14 setFont:v17];

  v18 = [v9 manager];

  v19 = [v18 dynamicRegistry];
  v20 = [v19 progressProviderForKind:@"audiobookProgress"];

  v21 = [v20 dynamicProgressForKind:@"timeRemaining" instance:v12 parameters:v13];
  [v11 setDynamicProgress:v21];
  [v11 setStyle:v14];
}

@end