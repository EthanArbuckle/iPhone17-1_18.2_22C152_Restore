@interface TRIPBMethod
+ (id)descriptor;
@end

@implementation TRIPBMethod

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_36;
  if (!descriptor_descriptor_36)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRIPBApiRoot_FileDescriptor() fields:&descriptor_fields_37 fieldCount:7 storageSize:40 flags:v8];
    [v2 setupExtraTextInfo:&unk_193630AF0];
    if (descriptor_descriptor_36) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRIApi.pbobjc.m", 279, @"Startup recursed!");
    }
    descriptor_descriptor_36 = (uint64_t)v2;
  }
  return v2;
}

@end