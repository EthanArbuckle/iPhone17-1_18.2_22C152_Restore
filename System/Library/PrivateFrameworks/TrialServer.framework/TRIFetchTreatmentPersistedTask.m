@interface TRIFetchTreatmentPersistedTask
+ (id)descriptor;
@end

@implementation TRIFetchTreatmentPersistedTask

+ (id)descriptor
{
  v2 = (void *)descriptor_descriptor_126;
  if (!descriptor_descriptor_126)
  {
    v5 = (void *)MEMORY[0x1E4FB05D0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    LODWORD(v9) = 0;
    v2 = (void *)[v5 allocDescriptorForClass:v6 rootClass:v7 file:TRITripersistedTasksRoot_FileDescriptor() fields:&descriptor_fields_127 fieldCount:6 storageSize:48 flags:v9];
    if (descriptor_descriptor_126) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TripersistedTasks.pbobjc.m", 817, @"Startup recursed!");
    }
    descriptor_descriptor_126 = (uint64_t)v2;
  }
  return v2;
}

@end