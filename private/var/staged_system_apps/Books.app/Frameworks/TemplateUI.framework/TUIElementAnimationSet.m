@interface TUIElementAnimationSet
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementAnimationSet

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAnimationValueBuilding;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  uint64_t var0 = a4.var0;
  v11 = [v9 stringForAttribute:137 node:a4.var0];
  unsigned int v12 = +[TUIAttributeRegistry lookupAttributeWithName:v11];
  if (v12 == 8)
  {
    [v9 floatForAttribute:215 node:var0];
    uint64_t v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
LABEL_10:
    v13 = (void *)v14;
    if (v14) {
      [v8 addAnimationValue:v14 forAttributeName:v11];
    }
    goto LABEL_12;
  }
  if (v12 == 208)
  {
    if (v9) {
      [v9 transformForAttribute:215 node:var0];
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    uint64_t v14 = +[NSValue valueWithCGAffineTransform:v15];
    goto LABEL_10;
  }
  if (v12 != 0xFFFF)
  {
    v13 = 0;
LABEL_12:
  }
}

@end