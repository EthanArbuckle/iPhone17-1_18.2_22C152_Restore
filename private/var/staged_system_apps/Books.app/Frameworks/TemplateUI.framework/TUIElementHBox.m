@interface TUIElementHBox
+ (Class)objectClass;
+ (id)containerAttributes;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7;
@end

@implementation TUIElementHBox

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)supportedAttributes
{
  if (qword_2DF2F0 != -1) {
    dispatch_once(&qword_2DF2F0, &stru_252C10);
  }
  v2 = (void *)qword_2DF2E8;

  return v2;
}

+ (id)containerAttributes
{
  if (qword_2DF300 != -1) {
    dispatch_once(&qword_2DF300, &stru_252C30);
  }
  v2 = (void *)qword_2DF2F8;

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
  v10 = [v8 stringForAttribute:96 node:var0];
  [v9 setHalign:[TUIBox halignFromString:v10]];

  id v11 = [v8 stringForAttribute:120 node:var0];

  [v9 setLayoutMode:[TUIBox layoutModeFromString:v11]];
}

+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7
{
  id v14 = a5;
  id v9 = a3;
  v10 = [v14 stringForAttribute:97 node:a4.var0];
  [v9 setHcompressed:[TUIBox compressedFromString:v10]];

  id v11 = [v14 lengthForAttribute:166 node:a4.var0];
  [v9 setRelativeWidth:v11, v12];
  v13 = [v9 dynamicArrayWindowingBox];

  if (v13)
  {
    [v14 floatForAttribute:79 node:a4.var0];
    [v13 setEstimatedWidth];
    [v14 floatForAttribute:77 node:a4.var0];
    [v13 setEstimatedHeight:];
    [v13 estimatedHeight];
    [v14 floatForAttribute:78 withDefault:a4.var0 node:];
    [v13 setEstimatedHeightAbovePivot:];
  }
}

@end