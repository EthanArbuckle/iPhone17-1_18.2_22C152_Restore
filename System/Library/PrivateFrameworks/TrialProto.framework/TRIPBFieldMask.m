@interface TRIPBFieldMask
+ (id)descriptor;
@end

@implementation TRIPBFieldMask

+ (id)descriptor
{
  id v2 = (id)_MergedGlobals_18;
  if (!_MergedGlobals_18)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    if (!qword_1EB3EE5C0) {
      qword_1EB3EE5C0 = [[TRIPBFileDescriptor alloc] initWithPackage:@"google.protobuf" objcPrefix:@"TRIPB" syntax:3];
    }
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    if (_MergedGlobals_18) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRIFieldMask.pbobjc.m", 85, @"Startup recursed!");
    }
    _MergedGlobals_18 = (uint64_t)v2;
  }
  return v2;
}

@end