@interface TRIAsset
+ (id)descriptor;
@end

@implementation TRIAsset

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_3;
  if (!descriptor_descriptor_3)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITrifactorTypesRoot_FileDescriptor() fields:&descriptor_fields_15 fieldCount:7 storageSize:48 flags:v8];
    if (descriptor_descriptor_3) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TrifactorTypes.pbobjc.m", 147, @"Startup recursed!");
    }
    descriptor_descriptor_3 = (uint64_t)v2;
  }
  return v2;
}

@end