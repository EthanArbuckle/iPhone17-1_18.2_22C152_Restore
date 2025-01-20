@interface TUIElementStyledBox
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementStyledBox

+ (id)supportedAttributes
{
  if (qword_2DF8D8 != -1) {
    dispatch_once(&qword_2DF8D8, &stru_256978);
  }
  v2 = (void *)qword_2DF8D0;

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

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v15 = a3;
  [v8 insetsForAttribute:112 node:var0];
  [v15 setInsets:];
  [v8 floatForAttribute:60 node:var0];
  [v15 setCornerRadius:];
  [v15 setContinuousCorners:[v8 BOOLForAttribute:59 withDefault:1 node:var0]];
  v9 = [v8 colorForAttribute:30 node:var0];
  [v15 setBackgroundColor:v9];

  [v8 floatForAttribute:188 node:var0];
  [v15 setShadowRadius:];
  [v8 sizeForAttribute:186 node:var0];
  [v15 setShadowOffset:];
  v10 = [v8 colorForAttribute:185 node:var0];
  [v15 setShadowColor:v10];

  [v8 floatForAttribute:187 node:var0];
  [v15 setShadowOpacity:];
  v11 = [v8 colorForAttribute:41 node:var0];
  [v15 setBorderColor:v11];

  [v8 floatForAttribute:42 node:var0];
  [v15 setBorderWidth:];
  [v15 setClipsToBounds:[v8 BOOLForAttribute:50 node:var0]];
  [v15 setAllowsGroupBlending:[v8 BOOLForAttribute:5 withDefault:0 node:var0]];
  v12 = [v8 stringForAttribute:37 node:var0];
  v13 = +[TUIBox blendModeFromString:v12];
  [v15 setBlendMode:v13];

  id v14 = [v8 BOOLForAttribute:93 node:var0];
  [v15 setGrouped:v14];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v5 = [a4 finalizeModelsWithParent:a3 box:a3 context:a5];
}

@end