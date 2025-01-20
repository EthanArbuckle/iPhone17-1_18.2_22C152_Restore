@interface TUIElementGradient
+ (BOOL)instantiateChildren;
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementGradient

+ (id)supportedAttributes
{
  if (qword_2DF168 != -1) {
    dispatch_once(&qword_2DF168, &stru_251868);
  }
  v2 = (void *)qword_2DF160;

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
  id v20 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = [v9 colorForAttribute:196 node:a4.var0];
  [v20 setGradientStartColor:v11];

  v12 = [v9 colorForAttribute:75 node:a4.var0];
  [v20 setGradientEndColor:v12];

  [v9 floatForAttribute:197 withDefault:a4.var0 node:0.0];
  [v20 setGradientStartPosition:];
  [v9 floatForAttribute:76 withDefault:a4.var0 node:1.0];
  [v20 setGradientEndPosition:];
  v13 = [v9 stringForAttribute:68 node:a4.var0];
  [v20 setGradientDirection:[TUIGradient directionFromString:v13]];

  v14 = [v9 stringForAttribute:37 node:a4.var0];
  v15 = +[TUIBox blendModeFromString:v14];
  [v20 setBlendMode:v15];

  [v20 setContinuousCorners:[v9 BOOLForAttribute:59 withDefault:1 node:a4.var0]];
  [v9 floatForAttribute:38 withDefault:a4.var0 node:0.0];
  [v20 setGradientBlurOffset:];
  [v9 floatForAttribute:39 withDefault:a4.var0 node:0.0];
  [v20 setGradientBlurRadius:];
  v16 = [v20 gradientStartColor];

  if (!v16) {
    [v10 reportError:1022];
  }
  v17 = [v20 gradientEndColor];

  if (!v17) {
    [v10 reportError:1023];
  }
  [v9 floatForAttribute:146 withDefault:a4.var0 node:1.0];
  double v19 = fmin(v18, 1.0);
  if (v19 < 0.0) {
    double v19 = 0.0;
  }
  [v20 setOpacity:v19];
}

+ (BOOL)instantiateChildren
{
  return 0;
}

@end