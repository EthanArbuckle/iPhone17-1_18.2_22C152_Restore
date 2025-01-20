@interface WFThreeWayMergingObjectGraphComponentEnumerationStackItem
+ (void)initialItemWithVertex:(uint64_t)a1;
- (void)initWithVertex:(uint64_t)a3 step:(uint64_t)a4 predecessorIndex:;
@end

@implementation WFThreeWayMergingObjectGraphComponentEnumerationStackItem

- (void).cxx_destruct
{
}

- (void)initWithVertex:(uint64_t)a3 step:(uint64_t)a4 predecessorIndex:
{
  id v8 = a2;
  v9 = v8;
  if (a1)
  {
    if (!v8)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel_initWithVertex_step_predecessorIndex_, a1, @"WFThreeWayMergingObjectGraph.m", 33, @"Invalid parameter not satisfying: %@", @"vertex" object file lineNumber description];
    }
    v13.receiver = a1;
    v13.super_class = (Class)WFThreeWayMergingObjectGraphComponentEnumerationStackItem;
    id v10 = objc_msgSendSuper2(&v13, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong((id *)v10 + 1, a2);
      a1[2] = a3;
      a1[3] = a4;
    }
  }

  return a1;
}

+ (void)initialItemWithVertex:(uint64_t)a1
{
  id v2 = a2;
  v3 = objc_alloc((Class)self);
  v4 = -[WFThreeWayMergingObjectGraphComponentEnumerationStackItem initWithVertex:step:predecessorIndex:](v3, v2, 0, 0);

  return v4;
}

@end