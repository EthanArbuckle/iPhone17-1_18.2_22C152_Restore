@interface TRIBmltDeploymentId
+ (id)descriptor;
@end

@implementation TRIBmltDeploymentId

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_58;
  if (!descriptor_descriptor_58)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITriclientBackgroundMltaskRoot_FileDescriptor() fields:&descriptor_fields_59 fieldCount:2 storageSize:16 flags:v8];
    if (descriptor_descriptor_58) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TriclientBackgroundMltask.pbobjc.m", 259, @"Startup recursed!");
    }
    descriptor_descriptor_58 = (uint64_t)v2;
  }
  return v2;
}

@end