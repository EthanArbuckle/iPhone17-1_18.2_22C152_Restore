@interface TRIProvisionalFactorpackMetadata
+ (id)descriptor;
@end

@implementation TRIProvisionalFactorpackMetadata

+ (id)descriptor
{
  id v2 = (id)_MergedGlobals_12;
  if (!_MergedGlobals_12)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    if (!qword_1EB3EE558) {
      qword_1EB3EE558 = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    }
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    if (_MergedGlobals_12) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TriprovisionalFactorPackMetadata.pbobjc.m", 102, @"Startup recursed!");
    }
    _MergedGlobals_12 = (uint64_t)v2;
  }
  return v2;
}

@end