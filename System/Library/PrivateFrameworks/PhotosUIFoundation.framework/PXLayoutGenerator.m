@interface PXLayoutGenerator
- (CGSize)estimatedSize;
- (CGSize)size;
- (NSIndexSet)geometryKinds;
- (NSString)diagnosticDescription;
- (PXLayoutGenerator)init;
- (PXLayoutGenerator)initWithMetrics:(id)a3;
- (PXLayoutMetrics)metrics;
- (id)copyWithZone:(_NSZone *)a3;
- (id)itemLayoutInfoBlock;
- (unint64_t)itemCount;
- (unint64_t)keyItemIndex;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
- (void)setItemCount:(unint64_t)a3;
- (void)setItemLayoutInfoBlock:(id)a3;
- (void)setKeyItemIndex:(unint64_t)a3;
- (void)setMetrics:(id)a3;
@end

@implementation PXLayoutGenerator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemLayoutInfoBlock, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

- (id)itemLayoutInfoBlock
{
  return self->_itemLayoutInfoBlock;
}

- (unint64_t)keyItemIndex
{
  return self->_keyItemIndex;
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (PXLayoutMetrics)metrics
{
  return self->_metrics;
}

- (NSString)diagnosticDescription
{
  unint64_t v3 = [(PXLayoutGenerator *)self itemCount];
  id v4 = objc_alloc(MEMORY[0x263F089D8]);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = objc_msgSend(v4, "initWithFormat:", @"<%@: %p; count=%lu, key=%lu\n",
                 v6,
                 self,
                 v3,
                 [(PXLayoutGenerator *)self keyItemIndex]);

  v8 = [(PXLayoutGenerator *)self metrics];
  v9 = [v8 diagnosticDescription];
  [v7 appendFormat:@"\tmetrics={%@}\n", v9];

  v10 = [(PXLayoutGenerator *)self itemLayoutInfoBlock];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      v12 = v10[2](v10, i);
      [v12 size];
      v13 = NSStringFromCGSize(v17);
      [v12 weight];
      [v7 appendFormat:@"\t%li size=%@ weight=%f\n", i, v13, v14];
    }
  }
  [v7 appendString:@">"];

  return (NSString *)v7;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4.location, a4.length, a5);
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXLayoutGenerator.m", 128, @"Method %s is a responsibility of subclass %@", "-[PXLayoutGenerator getGeometries:inRange:withKind:]", v9 object file lineNumber description];

  abort();
}

- (NSIndexSet)geometryKinds
{
  if (geometryKinds_onceToken != -1) {
    dispatch_once(&geometryKinds_onceToken, &__block_literal_global_354);
  }
  v2 = (void *)geometryKinds_kinds;

  return (NSIndexSet *)v2;
}

uint64_t __34__PXLayoutGenerator_geometryKinds__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
  uint64_t v1 = geometryKinds_kinds;
  geometryKinds_kinds = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (CGSize)size
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXLayoutGenerator.m", 111, @"Method %s is a responsibility of subclass %@", "-[PXLayoutGenerator size]", v6 object file lineNumber description];

  abort();
}

- (CGSize)estimatedSize
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXLayoutGenerator.m", 107, @"Method %s is a responsibility of subclass %@", "-[PXLayoutGenerator estimatedSize]", v6 object file lineNumber description];

  abort();
}

- (void)setItemLayoutInfoBlock:(id)a3
{
  if (self->_itemLayoutInfoBlock != a3)
  {
    id v4 = (void *)[a3 copy];
    id itemLayoutInfoBlock = self->_itemLayoutInfoBlock;
    self->_id itemLayoutInfoBlock = v4;

    [(PXLayoutGenerator *)self invalidate];
  }
}

- (void)setKeyItemIndex:(unint64_t)a3
{
  if (self->_keyItemIndex != a3)
  {
    self->_keyItemIndex = a3;
    [(PXLayoutGenerator *)self invalidate];
  }
}

- (void)setItemCount:(unint64_t)a3
{
  if (self->_itemCount != a3)
  {
    self->_itemCount = a3;
    [(PXLayoutGenerator *)self invalidate];
  }
}

- (void)setMetrics:(id)a3
{
  v8 = (PXLayoutMetrics *)a3;
  id v4 = self->_metrics;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXLayoutMetrics *)v8 isEqual:v4];

    if (!v5)
    {
      v6 = (PXLayoutMetrics *)[(PXLayoutMetrics *)v8 copy];
      metrics = self->_metrics;
      self->_metrics = v6;

      [(PXLayoutGenerator *)self invalidate];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMetrics:self->_metrics];
  v4[2] = self->_itemCount;
  uint64_t v5 = [self->_itemLayoutInfoBlock copy];
  v6 = (void *)v4[4];
  v4[4] = v5;

  v4[3] = self->_keyItemIndex;
  return v4;
}

- (PXLayoutGenerator)initWithMetrics:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXLayoutGenerator;
  uint64_t v5 = [(PXLayoutGenerator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    metrics = v5->_metrics;
    v5->_metrics = (PXLayoutMetrics *)v6;

    v5->_keyItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (PXLayoutGenerator)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXLayoutGenerator.m", 50, @"%s is not available as initializer", "-[PXLayoutGenerator init]");

  abort();
}

@end