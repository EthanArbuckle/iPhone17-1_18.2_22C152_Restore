@interface TRIMLRuntimeEvaluation
+ (id)descriptor;
@end

@implementation TRIMLRuntimeEvaluation

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_21;
  if (!descriptor_descriptor_21)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITrishadowEvaluationRoot_FileDescriptor() fields:&descriptor_fields_22 fieldCount:4 storageSize:32 flags:v8];
    if (descriptor_descriptor_21) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TrishadowEvaluation.pbobjc.m", 185, @"Startup recursed!");
    }
    descriptor_descriptor_21 = (uint64_t)v2;
  }
  return v2;
}

@end