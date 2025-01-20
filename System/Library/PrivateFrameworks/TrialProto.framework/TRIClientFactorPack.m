@interface TRIClientFactorPack
+ (id)descriptor;
@end

@implementation TRIClientFactorPack

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_4;
  if (!descriptor_descriptor_4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITriclientFactorPackRoot_FileDescriptor() fields:&descriptor_fields_5 fieldCount:3 storageSize:32 flags:v8];
    if (descriptor_descriptor_4) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TriclientFactorPack.pbobjc.m", 104, @"Startup recursed!");
    }
    descriptor_descriptor_4 = (uint64_t)v2;
  }
  return v2;
}

@end