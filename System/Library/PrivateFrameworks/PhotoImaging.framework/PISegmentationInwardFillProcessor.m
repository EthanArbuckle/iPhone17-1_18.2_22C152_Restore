@interface PISegmentationInwardFillProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (int)formatForInputAtIndex:(int)a3;
@end

@implementation PISegmentationInwardFillProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8 = a5;
  v9 = [a3 objectAtIndexedSubscript:0];
  v10 = [v8 metalCommandBuffer];
  v11 = [v9 metalTexture];
  v12 = [v8 metalTexture];

  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = v13 || v12 == 0;
  char v15 = v14;
  if (v14)
  {
    if (a6)
    {
      *a6 = [MEMORY[0x1E4F7A438] invalidError:@"Metal unavailable" object:0];
    }
  }
  else
  {
    +[PIParallaxInwardFillKernel fillSourceTexture:v11 intoDestinationTexture:v12 withCommandBuffer:v10];
  }

  return v15 ^ 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E4F1E300];
}

@end