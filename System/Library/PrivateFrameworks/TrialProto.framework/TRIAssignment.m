@interface TRIAssignment
+ (id)descriptor;
@end

@implementation TRIAssignment

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_9;
  if (!descriptor_descriptor_9)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITriassignmentRoot_FileDescriptor() fields:off_1EB3EE178 fieldCount:7 storageSize:64 flags:v8];
    [v2 setupOneofs:_MergedGlobals_2 count:1 firstHasIndex:0xFFFFFFFFLL];
    if (descriptor_descriptor_9) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"Triassignment.pbobjc.m", 158, @"Startup recursed!");
    }
    descriptor_descriptor_9 = (uint64_t)v2;
  }
  return v2;
}

@end