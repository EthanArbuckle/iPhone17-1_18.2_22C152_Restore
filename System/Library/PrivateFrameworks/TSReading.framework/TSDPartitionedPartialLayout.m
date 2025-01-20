@interface TSDPartitionedPartialLayout
- (CGRect)bounds;
- (Class)repClassOverride;
- (TSDDefaultPartitioner)partitioner;
- (TSDPartitionedPartialLayout)initWithInfo:(id)a3 bounds:(CGRect)a4 partitioner:(id)a5;
- (id)computeLayoutGeometry;
@end

@implementation TSDPartitionedPartialLayout

- (TSDPartitionedPartialLayout)initWithInfo:(id)a3 bounds:(CGRect)a4 partitioner:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)TSDPartitionedPartialLayout;
  result = [(TSDLayout *)&v11 initWithInfo:a3];
  if (result)
  {
    result->mBounds.origin.CGFloat x = x;
    result->mBounds.origin.CGFloat y = y;
    result->mBounds.size.CGFloat width = width;
    result->mBounds.size.CGFloat height = height;
    result->mPartitioner = (TSDDefaultPartitioner *)a5;
  }
  return result;
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)computeLayoutGeometry
{
  v3 = [TSDLayoutGeometry alloc];
  double width = self->mBounds.size.width;
  double height = self->mBounds.size.height;
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v8[0] = *MEMORY[0x263F000D0];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return -[TSDLayoutGeometry initWithSize:transform:](v3, "initWithSize:transform:", v8, width, height);
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

- (TSDDefaultPartitioner)partitioner
{
  return self->mPartitioner;
}

@end