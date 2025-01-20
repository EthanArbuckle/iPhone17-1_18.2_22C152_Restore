@interface TSDDefaultHint
+ (BOOL)supportsSecureCoding;
+ (Class)archivedHintClass;
- (BOOL)isLastPartitionHorizontally:(BOOL)a3;
- (BOOL)overlapsWithSelection:(id)a3;
- (CGRect)bounds;
- (TSDDefaultHint)initWithBounds:(CGRect)a3 edges:(unint64_t)a4;
- (TSDDefaultHint)initWithCoder:(id)a3;
- (id)copyForArchiving;
- (id)firstChildHint;
- (id)lastChildHint;
- (unint64_t)edges;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TSDDefaultHint

- (TSDDefaultHint)initWithBounds:(CGRect)a3 edges:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)TSDDefaultHint;
  result = [(TSDDefaultHint *)&v10 init];
  if (result)
  {
    result->mBounds.origin.CGFloat x = x;
    result->mBounds.origin.CGFloat y = y;
    result->mBounds.size.CGFloat width = width;
    result->mBounds.size.CGFloat height = height;
    result->mEdges = a4;
  }
  return result;
}

- (id)copyForArchiving
{
  v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDDefaultHint copyForArchiving]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultHint.m"), 36, @"Should not be copying default hints.");
  id v5 = objc_alloc((Class)objc_opt_class());
  unint64_t mEdges = self->mEdges;
  double x = self->mBounds.origin.x;
  double y = self->mBounds.origin.y;
  double width = self->mBounds.size.width;
  double height = self->mBounds.size.height;

  return (id)objc_msgSend(v5, "initWithBounds:edges:", mEdges, x, y, width, height);
}

- (BOOL)isLastPartitionHorizontally:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = [(TSDDefaultHint *)self edges];
  uint64_t v5 = 4;
  if (v3) {
    uint64_t v5 = 8;
  }
  return (v4 & v5) != 0;
}

- (BOOL)overlapsWithSelection:(id)a3
{
  return 0;
}

- (id)firstChildHint
{
  return 0;
}

- (id)lastChildHint
{
  return 0;
}

+ (Class)archivedHintClass
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"+[TSDDefaultHint archivedHintClass]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultHint.m"), 70, @"Can't archive default hints.");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TSDDefaultHint)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TSDDefaultHint;
  unint64_t v4 = [(TSDDefaultHint *)&v12 init];
  if (v4)
  {
    uint64_t v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bounds"];
    if (v5)
    {
      [v5 CGRectValue];
      *((void *)v4 + 1) = v6;
      *((void *)v4 + 2) = v7;
      *((void *)v4 + 3) = v8;
      *((void *)v4 + 4) = v9;
    }
    else
    {
      long long v10 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      *(_OWORD *)(v4 + 8) = *MEMORY[0x263F001A8];
      *(_OWORD *)(v4 + 24) = v10;
    }
    *((void *)v4 + 5) = [a3 decodeIntegerForKey:@"edges"];
  }
  return (TSDDefaultHint *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x263F08D40];
  [(TSDDefaultHint *)self bounds];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v5, "valueWithCGRect:"), @"bounds");
  unint64_t v6 = [(TSDDefaultHint *)self edges];

  [a3 encodeInteger:v6 forKey:@"edges"];
}

- (CGRect)bounds
{
  double x = self->mBounds.origin.x;
  double y = self->mBounds.origin.y;
  double width = self->mBounds.size.width;
  double height = self->mBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)edges
{
  return self->mEdges;
}

@end