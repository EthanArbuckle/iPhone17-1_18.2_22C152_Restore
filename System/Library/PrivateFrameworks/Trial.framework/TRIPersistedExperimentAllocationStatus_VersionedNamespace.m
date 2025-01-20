@interface TRIPersistedExperimentAllocationStatus_VersionedNamespace
+ (id)descriptor;
@end

@implementation TRIPersistedExperimentAllocationStatus_VersionedNamespace

+ (id)descriptor
{
  v2 = (void *)descriptor_descriptor_57;
  if (!descriptor_descriptor_57)
  {
    v5 = (void *)MEMORY[0x1E4FB05D0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    LODWORD(v9) = 0;
    v2 = (void *)[v5 allocDescriptorForClass:v6 rootClass:v7 file:TRITripersistedAllocationStatusRoot_FileDescriptor() fields:&descriptor_fields_58 fieldCount:2 storageSize:16 flags:v9];
    [v2 setupExtraTextInfo:&unk_19D98C628];
    [v2 setupContainingMessageClassName:"TRIPersistedExperimentAllocationStatus"];
    if (descriptor_descriptor_57) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TripersistedAllocationStatus.pbobjc.m", 282, @"Startup recursed!");
    }
    descriptor_descriptor_57 = (uint64_t)v2;
  }
  return v2;
}

@end