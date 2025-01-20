@interface TRIPBMixin
+ (id)descriptor;
@end

@implementation TRIPBMixin

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_52_0;
  if (!descriptor_descriptor_52_0)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRIPBApiRoot_FileDescriptor() fields:&descriptor_fields_53_0 fieldCount:2 storageSize:24 flags:v8];
    if (descriptor_descriptor_52_0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRIApi.pbobjc.m", 345, @"Startup recursed!");
    }
    descriptor_descriptor_52_0 = (uint64_t)v2;
  }
  return v2;
}

@end