@interface TRIFile
+ (id)descriptor;
- (BOOL)requiresDownload;
@end

@implementation TRIFile

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_34;
  if (!descriptor_descriptor_34)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITrifactorTypesRoot_FileDescriptor() fields:descriptor_fields_35 fieldCount:3 storageSize:24 flags:v8];
    if (descriptor_descriptor_34) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TrifactorTypes.pbobjc.m", 211, @"Startup recursed!");
    }
    descriptor_descriptor_34 = (uint64_t)v2;
  }
  return v2;
}

- (BOOL)requiresDownload
{
  if (![(TRIFile *)self isOnDemand]) {
    return 0;
  }
  v3 = [(TRIFile *)self path];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

@end