@interface PLCIFilterUtilities
+ (id)filterCopiesFromFilters:(id)a3;
+ (id)outputImageFromFilters:(id)a3 inputImage:(id)a4 orientation:(int)a5 copyFiltersFirst:(BOOL)a6;
@end

@implementation PLCIFilterUtilities

+ (id)outputImageFromFilters:(id)a3 inputImage:(id)a4 orientation:(int)a5 copyFiltersFirst:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  if (v6)
  {
    uint64_t v12 = [a1 filterCopiesFromFilters:v10];

    id v10 = (id)v12;
  }
  if ([v10 count])
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __86__PLCIFilterUtilities_outputImageFromFilters_inputImage_orientation_copyFiltersFirst___block_invoke;
    v21 = &unk_1E589F3C0;
    id v22 = v11;
    id v13 = v10;
    id v23 = v13;
    [v13 enumerateObjectsUsingBlock:&v18];
    v14 = objc_msgSend(v13, "lastObject", v18, v19, v20, v21);
    id v15 = [v14 valueForKey:@"outputImage"];
  }
  else
  {
    id v15 = v11;
  }
  if ((int)v7 >= 2)
  {
    uint64_t v16 = [v15 imageByApplyingOrientation:v7];

    id v15 = (id)v16;
  }
  [v10 enumerateObjectsUsingBlock:&__block_literal_global_1992];

  return v15;
}

void __86__PLCIFilterUtilities_outputImageFromFilters_inputImage_orientation_copyFiltersFirst___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = a3 - 1;
    id v5 = a2;
    id v8 = [v3 objectAtIndex:v4];
    BOOL v6 = [v8 valueForKey:@"outputImage"];
    [v5 setValue:v6 forKey:@"inputImage"];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = a2;
    [v8 setValue:v7 forKey:@"inputImage"];
  }
}

uint64_t __86__PLCIFilterUtilities_outputImageFromFilters_inputImage_orientation_copyFiltersFirst___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:0 forKey:@"inputImage"];
}

+ (id)filterCopiesFromFilters:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v4 = a3;
    id v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__PLCIFilterUtilities_filterCopiesFromFilters___block_invoke;
    v8[3] = &unk_1E589F398;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

void __47__PLCIFilterUtilities_filterCopiesFromFilters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id)[a2 copy];
  [*(id *)(a1 + 32) addObject:v3];
}

@end