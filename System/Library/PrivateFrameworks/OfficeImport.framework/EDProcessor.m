@interface EDProcessor
- (BOOL)isObjectSupported:(id)a3;
- (EDProcessor)initWithWorkbook:(id)a3;
- (void)applyProcessorWithSheet:(id)a3;
- (void)markObjectForPostProcessing:(id)a3;
@end

@implementation EDProcessor

- (EDProcessor)initWithWorkbook:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDProcessor;
  v5 = [(EDProcessor *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mWorkbook, v4);
    v7 = [v4 resources];
    objc_storeWeak((id *)&v6->mResources, v7);

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mObjects = v6->mObjects;
    v6->mObjects = v8;
  }
  return v6;
}

- (void)markObjectForPostProcessing:(id)a3
{
}

- (void)applyProcessorWithSheet:(id)a3
{
  id v6 = a3;
  for (unsigned int i = 0; [(NSMutableArray *)self->mObjects count] > (unint64_t)i; ++i)
  {
    v5 = [(NSMutableArray *)self->mObjects objectAtIndex:i];
    if (v5)
    {
      if ([(EDProcessor *)self isObjectSupported:v5]) {
        [(EDProcessor *)self applyProcessorToObject:v5 sheet:v6];
      }
    }
  }
}

- (BOOL)isObjectSupported:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mObjects, 0);
  objc_destroyWeak((id *)&self->mResources);
  objc_destroyWeak((id *)&self->mWorkbook);
}

@end