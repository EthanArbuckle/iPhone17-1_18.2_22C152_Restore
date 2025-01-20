@interface TRIPersistedExperimentFactorsState
+ (id)descriptor;
@end

@implementation TRIPersistedExperimentFactorsState

+ (id)descriptor
{
  v2 = (void *)descriptor_descriptor_27;
  if (!descriptor_descriptor_27)
  {
    v5 = (void *)MEMORY[0x1E4FB05D0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    LODWORD(v9) = 0;
    v2 = (void *)[v5 allocDescriptorForClass:v6 rootClass:v7 file:TRITripersistedEvaluationStatusRoot_FileDescriptor() fields:&descriptor_fields_28 fieldCount:3 storageSize:24 flags:v9];
    if (descriptor_descriptor_27) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TripersistedEvaluationStatus.pbobjc.m", 180, @"Startup recursed!");
    }
    descriptor_descriptor_27 = (uint64_t)v2;
  }
  return v2;
}

@end