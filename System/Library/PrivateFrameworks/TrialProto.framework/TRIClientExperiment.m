@interface TRIClientExperiment
+ (id)descriptor;
@end

@implementation TRIClientExperiment

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_5;
  if (!descriptor_descriptor_5)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITriclientExperimentRoot_FileDescriptor() fields:&descriptor_fields_16 fieldCount:15 storageSize:96 flags:v8];
    if (descriptor_descriptor_5) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TriclientExperiment.pbobjc.m", 239, @"Startup recursed!");
    }
    descriptor_descriptor_5 = (uint64_t)v2;
  }
  return v2;
}

@end