@interface TRIPersistedClientBMLTArtifact
+ (id)descriptor;
@end

@implementation TRIPersistedClientBMLTArtifact

+ (id)descriptor
{
  v2 = (void *)_MergedGlobals_35;
  if (!_MergedGlobals_35)
  {
    v5 = (void *)MEMORY[0x1E4FB05D0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    if (!qword_1EA8D7FE0) {
      qword_1EA8D7FE0 = [objc_alloc(MEMORY[0x1E4FB05E0]) initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    }
    LODWORD(v9) = 0;
    v2 = objc_msgSend(v5, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v6, v7, v9);
    [v2 setupExtraTextInfo:&unk_1DA4030F8];
    if (_MergedGlobals_35) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TripersistedClientBmltartifact.pbobjc.m", 132, @"Startup recursed!");
    }
    _MergedGlobals_35 = (uint64_t)v2;
  }
  return v2;
}

@end