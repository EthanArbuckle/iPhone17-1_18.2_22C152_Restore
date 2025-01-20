@interface MTLDebugLibrary
- ($6C9A29DA84AEC1C3BC185F86B6CC520C)imageFilterFunctionInfo;
- (MTLCompileOptions)compileOptions;
- (MTLDebugLibrary)initWithLibrary:(id)a3 parent:(id)a4 type:(unint64_t)a5 code:(id)a6 options:(id)a7;
- (NSArray)imageFilterFunctions;
- (id)code;
- (id)copyConstantValues:(id)a3;
- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4;
- (id)newFunctionWithName:(id)a3;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5;
- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4;
- (unint64_t)debugType;
- (void)dealloc;
- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5;
- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)setCode:(id)a3;
- (void)setCompileOptions:(id)a3;
- (void)setDebugType:(unint64_t)a3;
- (void)setImageFilterFunctions:(id)a3 imageFilterFunctionInfo:(id *)a4;
- (void)validateDescriptor:(id)a3 expectedClass:(Class)a4;
@end

@implementation MTLDebugLibrary

- (MTLDebugLibrary)initWithLibrary:(id)a3 parent:(id)a4 type:(unint64_t)a5 code:(id)a6 options:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugLibrary;
  v10 = [(MTLToolsObject *)&v13 initWithBaseObject:a3 parent:a4];
  v11 = v10;
  if (v10)
  {
    v10->_debugType = a5;
    v10->_code = (id)[a6 copy];
    v11->_compileOptions = (MTLCompileOptions *)[a7 copy];
  }
  return v11;
}

- (void)dealloc
{
  if (self->_imageFilterFunctionInfo)
  {
    if ([(NSArray *)self->_imageFilterFunctions count])
    {
      unint64_t v3 = 0;
      uint64_t v4 = 16;
      do
      {
        free(*(void **)(&self->_imageFilterFunctionInfo->var0 + v4));
        ++v3;
        v4 += 24;
      }
      while (v3 < [(NSArray *)self->_imageFilterFunctions count]);
    }
    free(self->_imageFilterFunctionInfo);
    self->_imageFilterFunctionInfo = 0;
  }

  self->_imageFilterFunctions = 0;
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugLibrary;
  [(MTLToolsLibrary *)&v5 dealloc];
}

- (id)newFunctionWithName:(id)a3
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithName:", a3);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsDevice *)self->super.super._device getFunctionForBaseObject:result library:self];

    return v7;
  }
  return result;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  validateNewFunctionWithConstantArguments((NSString *)a3, (MTLFunctionConstantValues *)a4);
  uint64_t v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithName:constantValues:error:", a3, a4, a5);
  if (!v9) {
    return 0;
  }
  v10 = (void *)v9;
  id v11 = [(MTLToolsDevice *)self->super.super._device getFunctionForBaseObject:v9 library:self];

  v12 = (void *)[a4 copy];
  [v11 setConstantValues:v12];

  return v11;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5
{
  validateNewFunctionWithConstantArguments((NSString *)a3, (MTLFunctionConstantValues *)a4);
  uint64_t v9 = [a4 copy];
  id v10 = [(MTLToolsObject *)self baseObject];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__MTLDebugLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke;
  v11[3] = &unk_264E13F88;
  v11[4] = self;
  v11[5] = v9;
  v11[6] = a5;
  [v10 newFunctionWithName:a3 constantValues:v9 completionHandler:v11];
}

void __72__MTLDebugLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  unint64_t v3 = objc_msgSend(*(id *)(a1[4] + 24), "getFunctionForBaseObject:library:", a2);
  [v3 setConstantValues:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();

  uint64_t v4 = (void *)a1[5];
}

- (void)validateDescriptor:(id)a3 expectedClass:(Class)a4
{
  if (!a3) {
    goto LABEL_7;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = NSStringFromClass(a4);
    MTLReportFailure();
  }
  if ((objc_msgSend(a3, "options", v7) & 1) != 0
    && ([(MTLDevice *)[(MTLToolsLibrary *)self device] supportsFunctionPointers] & 1) == 0)
  {
LABEL_7:
    MTLReportFailure();
  }
}

- (id)copyConstantValues:(id)a3
{
  unint64_t v3 = (void *)[a3 constantValues];
  if (v3)
  {
    return (id)[v3 copy];
  }
  else
  {
    objc_super v5 = (objc_class *)MEMORY[0x263F128B0];
    return objc_alloc_init(v5);
  }
}

- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  [(MTLDebugLibrary *)self validateDescriptor:a3 expectedClass:objc_opt_class()];
  id v7 = (MTLFunctionDescriptor *)[(MTLDevice *)[(MTLToolsLibrary *)self device] unwrapMTLFunctionDescriptor:a3];
  v8 = [(MTLDebugLibrary *)self copyConstantValues:v7];
  validateNewFunctionWithConstantArguments([(MTLFunctionDescriptor *)v7 name], v8);
  validateLinkedFunctionsHaveUniqueNames(v7);
  id v9 = [(MTLToolsObject *)self baseObject];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__MTLDebugLibrary_newFunctionWithDescriptor_completionHandler___block_invoke;
  v10[3] = &unk_264E13FB0;
  v10[4] = self;
  v10[5] = v8;
  v10[6] = v7;
  v10[7] = a4;
  [v9 newFunctionWithDescriptor:v7 completionHandler:v10];
}

void __63__MTLDebugLibrary_newFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  [v3 setConstantValues:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  uint64_t v4 = *(void **)(a1 + 48);
}

- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  [(MTLDebugLibrary *)self validateDescriptor:a3 expectedClass:objc_opt_class()];
  id v7 = (MTLFunctionDescriptor *)[(MTLDevice *)[(MTLToolsLibrary *)self device] unwrapMTLFunctionDescriptor:a3];
  v8 = [(MTLDebugLibrary *)self copyConstantValues:v7];
  validateNewFunctionWithConstantArguments([(MTLFunctionDescriptor *)v7 name], v8);
  validateLinkedFunctionsHaveUniqueNames(v7);
  uint64_t v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithDescriptor:error:", v7, a4);
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [(MTLToolsDevice *)self->super.super._device getFunctionForBaseObject:v9 library:self];

    [v11 setConstantValues:v8];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  [(MTLDebugLibrary *)self validateDescriptor:a3 expectedClass:objc_opt_class()];
  id v7 = [(MTLDebugLibrary *)self copyConstantValues:a3];
  validateNewFunctionWithConstantArguments((NSString *)[a3 name], v7);
  id v8 = [(MTLToolsObject *)self baseObject];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__MTLDebugLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke;
  v9[3] = &unk_264E13F88;
  v9[4] = self;
  v9[5] = v7;
  v9[6] = a4;
  [v8 newIntersectionFunctionWithDescriptor:a3 completionHandler:v9];
}

void __75__MTLDebugLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  unint64_t v3 = objc_msgSend(*(id *)(a1[4] + 24), "getFunctionForBaseObject:library:", a2);
  [v3 setConstantValues:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();

  uint64_t v4 = (void *)a1[5];
}

- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  [(MTLDebugLibrary *)self validateDescriptor:a3 expectedClass:objc_opt_class()];
  id v7 = [(MTLDebugLibrary *)self copyConstantValues:a3];
  validateNewFunctionWithConstantArguments((NSString *)[a3 name], v7);
  uint64_t v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionWithDescriptor:error:", a3, a4);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v10 = [(MTLToolsDevice *)self->super.super._device getFunctionForBaseObject:v8 library:self];

    [v10 setConstantValues:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)setImageFilterFunctions:(id)a3 imageFilterFunctionInfo:(id *)a4
{
  if (self->_imageFilterFunctionInfo)
  {
    if ([(NSArray *)self->_imageFilterFunctions count])
    {
      unint64_t v7 = 0;
      uint64_t v8 = 16;
      do
      {
        free(*(void **)(&self->_imageFilterFunctionInfo->var0 + v8));
        ++v7;
        v8 += 24;
      }
      while (v7 < [(NSArray *)self->_imageFilterFunctions count]);
    }
    free(self->_imageFilterFunctionInfo);
  }
  imageFilterFunctions = self->_imageFilterFunctions;
  if (imageFilterFunctions != a3)
  {
    if (imageFilterFunctions) {

    }
    a3 = (id)[a3 copy];
    self->_imageFilterFunctions = (NSArray *)a3;
  }
  self->_imageFilterFunctionInfo = ($6C9A29DA84AEC1C3BC185F86B6CC520C *)malloc_type_malloc(24 * [a3 count], 0x1060040D275764BuLL);
  if ([(NSArray *)self->_imageFilterFunctions count])
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      v12 = &self->_imageFilterFunctionInfo[v10];
      v12->var0 = a4[v10].var0;
      v12->var1 = a4[v10].var1;
      size_t v13 = 24 * a4[v10].var1;
      if (v13)
      {
        v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(24 * a4[v10].var1, 0x92C25F38uLL);
        memcpy(v14, a4[v10].var2, v13);
      }
      else
      {
        v14 = 0;
      }
      v12->var2 = v14;
      ++v11;
      ++v10;
    }
    while (v11 < [(NSArray *)self->_imageFilterFunctions count]);
  }
}

- (unint64_t)debugType
{
  return self->_debugType;
}

- (void)setDebugType:(unint64_t)a3
{
  self->_debugType = a3;
}

- (id)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (MTLCompileOptions)compileOptions
{
  return self->_compileOptions;
}

- (void)setCompileOptions:(id)a3
{
}

- (NSArray)imageFilterFunctions
{
  return self->_imageFilterFunctions;
}

- ($6C9A29DA84AEC1C3BC185F86B6CC520C)imageFilterFunctionInfo
{
  return self->_imageFilterFunctionInfo;
}

@end