@interface PMLSeparatedDPNoiseStrategy
+ (id)getPFLIdentifier:(id)a3;
- (BOOL)scaleAndAddNoiseToDenseVector:(id)a3 usingNorm:(BOOL)a4 scaleFactor:(float *)a5;
- (PMLSeparatedDPNoiseStrategy)initWithPFLIdentifier:(const char *)a3;
- (PMLSeparatedDPNoiseStrategy)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
- (void)addNoiseToSparseMatrix:(id)a3;
- (void)addNoiseToSparseVector:(id)a3;
@end

@implementation PMLSeparatedDPNoiseStrategy

- (PMLSeparatedDPNoiseStrategy)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v7 = a5;
  v8 = [v7 objectForKeyedSubscript:@"PFL_ID"];

  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PMLSeparatedDPNoiseStrategy.m", 85, @"Can't instantiate %@. Missing %@ dependency.", v14, @"PFL_ID" object file lineNumber description];
  }
  id v9 = [v7 objectForKeyedSubscript:@"PFL_ID"];
  v10 = -[PMLSeparatedDPNoiseStrategy initWithPFLIdentifier:](self, "initWithPFLIdentifier:", [v9 UTF8String]);

  return v10;
}

- (id)toPlistWithChunks:(id)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (BOOL)scaleAndAddNoiseToDenseVector:(id)a3 usingNorm:(BOOL)a4 scaleFactor:(float *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 mutablePtr];
  uint64_t v9 = [v7 count];
  pflIdentifier = self->_pflIdentifier;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  v11 = (uint64_t (*)(uint64_t, uint64_t, const char *))getPFLPrivatizeSymbolLoc_ptr;
  v25 = getPFLPrivatizeSymbolLoc_ptr;
  if (!getPFLPrivatizeSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __getPFLPrivatizeSymbolLoc_block_invoke;
    v20 = &unk_26459F268;
    v21 = &v22;
    __getPFLPrivatizeSymbolLoc_block_invoke(buf);
    v11 = (uint64_t (*)(uint64_t, uint64_t, const char *))v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (v11)
  {
    char v12 = v11(v8, v9, pflIdentifier);
    if (v12)
    {
      *a5 = 1.0;
    }
    else
    {
      v13 = PML_LogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2212A0000, v13, OS_LOG_TYPE_ERROR, "PFLPrivatize call failed", buf, 2u);
      }
    }
    return v12;
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = objc_msgSend(NSString, "stringWithUTF8String:", "_Bool soft_PFLPrivatize(float *, size_t, const char *)");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"PMLSeparatedDPNoiseStrategy.m", 19, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (void)addNoiseToSparseVector:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (void)addNoiseToSparseMatrix:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (PMLSeparatedDPNoiseStrategy)initWithPFLIdentifier:(const char *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PMLSeparatedDPNoiseStrategy;
  BOOL result = [(PMLSeparatedDPNoiseStrategy *)&v5 init];
  if (result) {
    result->_pflIdentifier = a3;
  }
  return result;
}

+ (id)getPFLIdentifier:(id)a3
{
  if ([@"QuickResponsesClassification" isEqualToString:a3]) {
    return @"com.apple.proactive.responses";
  }
  else {
    return @"com.apple.proactive.fia.phone.en";
  }
}

@end