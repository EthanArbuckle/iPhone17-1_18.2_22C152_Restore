@interface EDProcessors
- (BOOL)hasProcessors;
- (EDProcessors)initWithWorkbook:(id)a3;
- (void)addProcessorClass:(Class)a3;
- (void)applyProcessorsWithSheet:(id)a3;
- (void)markObject:(id)a3 processor:(Class)a4;
- (void)removeAllObjects;
- (void)removeProcessorClass:(Class)a3;
@end

@implementation EDProcessors

- (EDProcessors)initWithWorkbook:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDProcessors;
  v5 = [(EDProcessors *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mWorkbook, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mProcessors = v6->mProcessors;
    v6->mProcessors = v7;
  }
  return v6;
}

- (void)removeAllObjects
{
}

- (void)addProcessorClass:(Class)a3
{
  id v4 = [a3 alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
  id v6 = (id)[v4 initWithWorkbook:WeakRetained];

  [(NSMutableArray *)self->mProcessors addObject:v6];
}

- (void)markObject:(id)a3 processor:(Class)a4
{
  id v9 = a3;
  uint64_t v6 = [(NSMutableArray *)self->mProcessors count];
  if (v6)
  {
    uint64_t v7 = 0;
    while (1)
    {
      v8 = [(NSMutableArray *)self->mProcessors objectAtIndex:v7];
      if (v8)
      {
        if ((Class)objc_opt_class() == a4 && [v8 isObjectSupported:v9]) {
          break;
        }
      }

      if (v6 == ++v7) {
        goto LABEL_7;
      }
    }
    [v8 markObjectForPostProcessing:v9];
  }
LABEL_7:
}

- (void)applyProcessorsWithSheet:(id)a3
{
  id v8 = a3;
  id v4 = (void *)MEMORY[0x23EC9A170]();
  unint64_t v5 = [(NSMutableArray *)self->mProcessors count];
  +[TCProgressContext createStageWithSteps:(double)v5 takingSteps:1.0];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v7 = [(NSMutableArray *)self->mProcessors objectAtIndex:i];
      [v7 applyProcessorWithSheet:v8];

      +[TCProgressContext advanceProgress:1.0];
    }
  }
  [(EDProcessors *)self removeAllObjects];
  +[TCProgressContext endStage];
}

- (BOOL)hasProcessors
{
  return [(NSMutableArray *)self->mProcessors count] != 0;
}

- (void)removeProcessorClass:(Class)a3
{
  uint64_t v5 = [(NSMutableArray *)self->mProcessors count];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [(NSMutableArray *)self->mProcessors objectAtIndex:v7];
      id v9 = (objc_class *)objc_opt_class();

      if (v9 == a3) {
        break;
      }
      if (v6 == ++v7) {
        return;
      }
    }
    mProcessors = self->mProcessors;
    [(NSMutableArray *)mProcessors removeObjectAtIndex:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProcessors, 0);
  objc_destroyWeak((id *)&self->mWorkbook);
}

@end