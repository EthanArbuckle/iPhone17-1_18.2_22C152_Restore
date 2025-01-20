@interface CMDrawableStyle
- (void)addPositionProperties:(CGRect)a3;
- (void)addPositionUsingOffsets:(CGRect)a3;
@end

@implementation CMDrawableStyle

- (void)addPositionProperties:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)CMDrawableStyle;
  [(CMStyle *)&v9 appendPropertyForName:0x26EC07038 stringWithColons:@":absolute;"];
  v8.receiver = self;
  v8.super_class = (Class)CMDrawableStyle;
  -[CMStyle appendPositionInfoFromRect:](&v8, sel_appendPositionInfoFromRect_, x, y, width, height);
}

- (void)addPositionUsingOffsets:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)CMDrawableStyle;
  -[CMStyle appendSizeInfoFromRect:](&v9, sel_appendSizeInfoFromRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)CMDrawableStyle;
  [(CMStyle *)&v8 appendPropertyForName:0x26EC07B58 length:1 unit:x];
  v7.receiver = self;
  v7.super_class = (Class)CMDrawableStyle;
  [(CMStyle *)&v7 appendPropertyForName:0x26EC07B78 length:1 unit:y];
  v6.receiver = self;
  v6.super_class = (Class)CMDrawableStyle;
  [(CMStyle *)&v6 appendPropertyForName:0x26EC07038 stringWithColons:@":absolute;"];
}

- (void).cxx_destruct
{
}

@end