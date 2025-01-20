@interface TRIClientSelectedNamespace
+ (id)descriptor;
@end

@implementation TRIClientSelectedNamespace

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_24;
  if (!descriptor_descriptor_24)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITriclientFactorPackRoot_FileDescriptor() fields:&descriptor_fields_25 fieldCount:2 storageSize:24 flags:v8];
    if (descriptor_descriptor_24) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TriclientFactorPack.pbobjc.m", 158, @"Startup recursed!");
    }
    descriptor_descriptor_24 = (uint64_t)v2;
  }
  return v2;
}

@end