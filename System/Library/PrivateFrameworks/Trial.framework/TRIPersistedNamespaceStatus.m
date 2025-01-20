@interface TRIPersistedNamespaceStatus
+ (id)descriptor;
@end

@implementation TRIPersistedNamespaceStatus

+ (id)descriptor
{
  v2 = (void *)_MergedGlobals_17;
  if (!_MergedGlobals_17)
  {
    v5 = (void *)MEMORY[0x1E4FB05D0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    if (!qword_1EB3B7910) {
      qword_1EB3B7910 = [objc_alloc(MEMORY[0x1E4FB05E0]) initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    }
    LODWORD(v9) = 0;
    v2 = objc_msgSend(v5, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v6, v7, v9);
    if (_MergedGlobals_17) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TripersistedNamespaceStatus.pbobjc.m", 113, @"Startup recursed!");
    }
    _MergedGlobals_17 = (uint64_t)v2;
  }
  return v2;
}

@end