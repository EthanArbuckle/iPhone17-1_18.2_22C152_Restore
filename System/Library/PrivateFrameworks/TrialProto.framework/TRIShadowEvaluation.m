@interface TRIShadowEvaluation
+ (id)descriptor;
@end

@implementation TRIShadowEvaluation

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor;
  if (!descriptor_descriptor)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITrishadowEvaluationRoot_FileDescriptor() fields:off_1EB3EDF60 fieldCount:2 storageSize:24 flags:v8];
    [v2 setupOneofs:_MergedGlobals count:1 firstHasIndex:0xFFFFFFFFLL];
    if (descriptor_descriptor) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TrishadowEvaluation.pbobjc.m", 104, @"Startup recursed!");
    }
    descriptor_descriptor = (uint64_t)v2;
  }
  return v2;
}

@end