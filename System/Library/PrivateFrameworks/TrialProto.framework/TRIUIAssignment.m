@interface TRIUIAssignment
+ (id)descriptor;
@end

@implementation TRIUIAssignment

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_94;
  if (!descriptor_descriptor_94)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRIUiassignmentRoot_FileDescriptor() fields:&unk_1EB3EE3B0 fieldCount:4 storageSize:32 flags:v8];
    [v2 setupOneofs:off_1EB3EE328 count:1 firstHasIndex:0xFFFFFFFFLL];
    if (descriptor_descriptor_94) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"Uiassignment.pbobjc.m", 624, @"Startup recursed!");
    }
    descriptor_descriptor_94 = (uint64_t)v2;
  }
  return v2;
}

@end