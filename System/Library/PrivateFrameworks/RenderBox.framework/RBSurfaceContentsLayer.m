@interface RBSurfaceContentsLayer
+ (id)defaultValueForKey:(id)a3;
- (RBSurfaceContentsLayer)init;
- (id)actionForKey:(id)a3;
@end

@implementation RBSurfaceContentsLayer

- (id)actionForKey:(id)a3
{
  return 0;
}

+ (id)defaultValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"anchorPoint"])
  {
    long long v7 = *MEMORY[0x263F00148];
    return (id)[MEMORY[0x263F08D40] valueWithBytes:&v7 objCType:"{CGPoint=dd}"];
  }
  else if (([a3 isEqualToString:@"needsLayoutOnGeometryChange"] & 1) != 0 {
         || ([a3 isEqualToString:@"allowsEdgeAntialiasing"] & 1) != 0)
  }
  {
    return (id)MEMORY[0x263EFFA80];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RBSurfaceContentsLayer;
    return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
  }
}

- (RBSurfaceContentsLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)RBSurfaceContentsLayer;
  v2 = [(RBSurfaceContentsLayer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RBSurfaceContentsLayer *)v2 setContentsGravity:*MEMORY[0x263F15DF0]];
  }
  return v3;
}

@end