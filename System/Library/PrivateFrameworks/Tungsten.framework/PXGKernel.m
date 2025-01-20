@interface PXGKernel
+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)gridSizeForThreadGroupSize:(SEL)a3 imageSize:(id *)a4;
+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)groupSizeForImageSize:(SEL)a3 pipelineState:(id *)a4;
+ (id)pipelineStateForFunctionWithName:(id)a3 constants:(id)a4 key:(id)a5 device:(id)a6;
- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6;
@end

@implementation PXGKernel

+ (id)pipelineStateForFunctionWithName:(id)a3 constants:(id)a4 key:(id)a5 device:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a1;
  objc_sync_enter(v15);
  objc_getAssociatedObject(v14, a2);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_setAssociatedObject(v14, a2, v16, (void *)0x301);
  }
  v17 = [v16 objectForKey:v13];
  if (!v17)
  {
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v27 = 0;
    v19 = (void *)[v14 newDefaultLibraryWithBundle:v18 error:&v27];
    id v20 = v27;

    if (v19)
    {
      id v26 = v20;
      id v24 = v12;
      v21 = (void *)[v19 newFunctionWithName:v11 constantValues:v12 error:&v26];
      id v22 = v26;

      if (v21)
      {
        id v25 = v22;
        v17 = (void *)[v14 newComputePipelineStateWithFunction:v21 error:&v25];
        id v20 = v25;

        if (v17)
        {
          [v16 setObject:v17 forKey:v13];
        }
        else
        {
          NSLog(&cfstr_CouldNotLoadMe.isa, v20);
          v17 = 0;
        }
      }
      else
      {
        NSLog(&cfstr_CouldNotLoadMe_1.isa, v11, v22);
        v17 = 0;
        id v20 = v22;
      }

      id v12 = v24;
    }
    else
    {
      NSLog(&cfstr_CouldNotLoadMe.isa, v20);
      v17 = 0;
    }
  }
  objc_sync_exit(v15);

  return v17;
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)gridSizeForThreadGroupSize:(SEL)a3 imageSize:(id *)a4
{
  unint64_t v5 = (a5->var1 + a4->var1 - 1) / a4->var1;
  retstr->var0 = (a5->var0 + a4->var0 - 1) / a4->var0;
  retstr->var1 = v5;
  retstr->var2 = 1;
  return result;
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)groupSizeForImageSize:(SEL)a3 pipelineState:(id *)a4
{
  id v21 = a5;
  unint64_t v7 = [v21 threadExecutionWidth];
  unint64_t v8 = [v21 maxTotalThreadsPerThreadgroup];
  unint64_t v9 = v8 / v7;
  retstr->var0 = v7;
  retstr->unint64_t var1 = v8 / v7;
  retstr->var2 = 1;
  if (v7 <= v8)
  {
    uint64_t v10 = 0;
    unint64_t var1 = a4->var1;
    unint64_t v12 = v7 + a4->var0;
    unint64_t v13 = -1;
    unint64_t v14 = -(uint64_t)(var1 * a4->var0);
    unint64_t v15 = -1;
    do
    {
      if (v7 + v10 <= v9) {
        unint64_t v16 = v9;
      }
      else {
        unint64_t v16 = v7 + v10;
      }
      if (v7 + v10 >= v9) {
        unint64_t v17 = v9;
      }
      else {
        unint64_t v17 = v7 + v10;
      }
      if (v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10) <= v13)
      {
        unint64_t v18 = v16 / v17;
        if (v18 <= v15)
        {
          retstr->var0 = v7 + v10;
          retstr->unint64_t var1 = v9;
          unint64_t v15 = v18;
          unint64_t v13 = v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10);
          retstr->var2 = 1;
        }
      }
      unint64_t v19 = 2 * v7 + v10;
      v10 += v7;
      unint64_t v9 = v8 / v19;
    }
    while (v7 + v10 <= v8);
  }

  return result;
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = [MEMORY[0x263F08690] currentHandler];
  unint64_t v14 = (objc_class *)objc_opt_class();
  unint64_t v15 = NSStringFromClass(v14);
  [v13 handleFailureInMethod:a2, self, @"PXGKernel.m", 91, @"Method %s is a responsibility of subclass %@", "-[PXGKernel encodeToCommandBuffer:sourceTexture:destinationTexture:targetScale:]", v15 object file lineNumber description];

  abort();
}

@end