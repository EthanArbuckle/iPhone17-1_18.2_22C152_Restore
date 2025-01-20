@interface TRIPBEnumDescriptorProto
+ (id)descriptor;
@end

@implementation TRIPBEnumDescriptorProto

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_183;
  if (!descriptor_descriptor_183)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRIPBDescriptorRoot_FileDescriptor() fields:&descriptor_fields_184 fieldCount:5 storageSize:48 flags:v8];
    if (descriptor_descriptor_183) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRIDescriptor.pbobjc.m", 960, @"Startup recursed!");
    }
    descriptor_descriptor_183 = (uint64_t)v2;
  }
  return v2;
}

@end