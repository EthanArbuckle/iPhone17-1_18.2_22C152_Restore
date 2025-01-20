@interface TRIPBField
+ (id)descriptor;
@end

@implementation TRIPBField

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_38;
  if (!descriptor_descriptor_38)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRIPBTypeRoot_FileDescriptor() fields:&descriptor_fields_39 fieldCount:10 storageSize:64 flags:v8];
    [v2 setupExtraTextInfo:&unk_193630568];
    if (descriptor_descriptor_38) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRIType.pbobjc.m", 339, @"Startup recursed!");
    }
    descriptor_descriptor_38 = (uint64_t)v2;
  }
  return v2;
}

@end