@interface TRIMLRuntimeSchedulingPolicy
+ (id)descriptor;
@end

@implementation TRIMLRuntimeSchedulingPolicy

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_44;
  if (!descriptor_descriptor_44)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 1;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITrishadowEvaluationRoot_FileDescriptor() fields:&descriptor_fields_45 fieldCount:5 storageSize:32 flags:v8];
    if (descriptor_descriptor_44) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TrishadowEvaluation.pbobjc.m", 277, @"Startup recursed!");
    }
    descriptor_descriptor_44 = (uint64_t)v2;
  }
  return v2;
}

@end