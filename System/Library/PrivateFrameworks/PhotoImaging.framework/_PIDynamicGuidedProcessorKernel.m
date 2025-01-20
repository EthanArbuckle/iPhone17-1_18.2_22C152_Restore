@interface _PIDynamicGuidedProcessorKernel
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation _PIDynamicGuidedProcessorKernel

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"imageExtents"];
  if (!v7) {
    __assert_rtn("+[_PIDynamicGuidedProcessorKernel roiForInput:arguments:outputRect:]", "PIParallaxStyleRecipe.m", 731, "arguments[@\"imageExtents\"]");
  }

  v8 = [v6 objectForKeyedSubscript:@"imageExtents"];
  if ((int)[v8 count] <= a3) {
    __assert_rtn("+[_PIDynamicGuidedProcessorKernel roiForInput:arguments:outputRect:]", "PIParallaxStyleRecipe.m", 732, "(int)[(NSArray *)arguments[@\"imageExtents\"] count] > input");
  }

  v9 = [v6 objectForKeyedSubscript:@"imageExtents"];
  v10 = [v9 objectAtIndexedSubscript:a3];
  [v10 CGRectValue];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3)
  {
    if (a3 != 1) {
      __assert_rtn("+[_PIDynamicGuidedProcessorKernel formatForInputAtIndex:]", "PIParallaxStyleRecipe.m", 720, "0");
    }
    v3 = (int *)MEMORY[0x1E4F1E280];
  }
  else
  {
    v3 = (int *)MEMORY[0x1E4F1E318];
  }
  return *v3;
}

+ (int)outputFormat
{
  return *MEMORY[0x1E4F1E318];
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v8 metalCommandBuffer];
  double v12 = [v11 device];
  double v13 = [v10 objectAtIndexedSubscript:0];
  double v14 = [v10 objectAtIndexedSubscript:1];

  [v13 region];
  unint64_t v16 = (unint64_t)v15;
  [v13 region];
  unint64_t v18 = (unint64_t)v17;
  double v19 = [v9 objectForKeyedSubscript:@"guidedFilterEpsilon"];

  [v19 floatValue];
  int v21 = v20;

  LOBYTE(v31) = 1;
  LODWORD(v22) = v21;
  v23 = [MEMORY[0x1E4F355D8] filterDescriptorWithWidth:v16 height:v18 arrayLength:1 kernelSpatialDiameter:3 kernelTemporalDiameter:1 epsilon:1 sourceChannels:v22 guideChannels:3 preallocateIntermediates:v31];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F355D0]) initWithDevice:v12 filterDescriptor:v23];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v27 = [v13 metalTexture];
  [v25 addObject:v27];

  v28 = [v8 metalTexture];

  [v26 addObject:v28];
  v29 = [v14 metalTexture];
  [v24 encodeToCommandBuffer:v11 sourceTextureArray:v25 guidanceTexture:v29 constraintsTextureArray:0 numberOfIterations:1 destinationTextureArray:v26];

  return 1;
}

@end