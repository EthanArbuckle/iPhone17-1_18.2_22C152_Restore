@interface TRIPBUninterpretedOption_NamePart
+ (id)descriptor;
@end

@implementation TRIPBUninterpretedOption_NamePart

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_450;
  if (!descriptor_descriptor_450)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRIPBDescriptorRoot_FileDescriptor() fields:&descriptor_fields_451 fieldCount:2 storageSize:16 flags:v8];
    [v2 setupContainingMessageClassName:"TRIPBUninterpretedOption"];
    if (descriptor_descriptor_450) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRIDescriptor.pbobjc.m", 2332, @"Startup recursed!");
    }
    descriptor_descriptor_450 = (uint64_t)v2;
  }
  return v2;
}

@end