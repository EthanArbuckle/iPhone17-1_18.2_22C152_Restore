@interface TRIPBFileOptions
+ (id)descriptor;
@end

@implementation TRIPBFileOptions

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_247;
  if (!descriptor_descriptor_247)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 1;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRIPBDescriptorRoot_FileDescriptor() fields:&descriptor_fields_248 fieldCount:21 storageSize:96 flags:v8];
    [v2 setupExtensionRanges:&descriptor_ranges_270 count:1];
    if (descriptor_descriptor_247) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRIDescriptor.pbobjc.m", 1521, @"Startup recursed!");
    }
    descriptor_descriptor_247 = (uint64_t)v2;
  }
  return v2;
}

@end