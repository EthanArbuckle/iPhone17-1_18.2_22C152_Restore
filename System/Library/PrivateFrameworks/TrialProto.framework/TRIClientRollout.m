@interface TRIClientRollout
+ (id)descriptor;
@end

@implementation TRIClientRollout

+ (id)descriptor
{
  id v2 = (id)_MergedGlobals_17;
  if (!_MergedGlobals_17)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    if (!qword_1EB3EE5B0) {
      qword_1EB3EE5B0 = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    }
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    if (_MergedGlobals_17) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TriclientRollout.pbobjc.m", 150, @"Startup recursed!");
    }
    _MergedGlobals_17 = (uint64_t)v2;
  }
  return v2;
}

@end