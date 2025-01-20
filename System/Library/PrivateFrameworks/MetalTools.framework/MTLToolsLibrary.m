@interface MTLToolsLibrary
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)shaderValidationEnabled;
- (MTLDevice)device;
- (NSArray)externFunctionNames;
- (NSArray)functionNames;
- (NSData)bitcodeData;
- (NSString)installName;
- (NSString)label;
- (NSString)overrideTriple;
- (NSUUID)libraryIdentifier;
- (id)newExternFunctionWithName:(id)a3;
- (id)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 error:(id *)a5;
- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4;
- (id)newFunctionWithName:(id)a3;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6;
- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4;
- (int64_t)type;
- (void)dealloc;
- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6;
- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)setLabel:(id)a3;
- (void)setOverrideTriple:(id)a3;
- (void)setShaderValidationEnabled:(BOOL)a3;
@end

@implementation MTLToolsLibrary

- (void)dealloc
{
  [(MTLToolsObjectCache *)self->super._device->sourceLibraryObjectCache removeKey:self->super._baseObject];
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsLibrary;
  [(MTLToolsObject *)&v3 dealloc];
}

- (BOOL)shaderValidationEnabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 shaderValidationEnabled];
}

- (void)setShaderValidationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setShaderValidationEnabled:v3];
}

- (NSString)overrideTriple
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 overrideTriple];
}

- (void)setOverrideTriple:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setOverrideTriple:a3];
}

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (void)setLabel:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setLabel:a3];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->super._parent;
}

- (NSUUID)libraryIdentifier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSUUID *)[v2 libraryIdentifier];
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 serializeToURL:a3 error:a4];
}

- (id)newFunctionWithName:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithName:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newExternFunctionWithName:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newExternFunctionWithName:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithName:constantValues:error:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    v8 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithName:constantValues:pipelineLibrary:error:", a3, a4, a5, a6);
  if (result)
  {
    id v8 = result;
    v9 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5
{
  id v9 = [(MTLToolsObject *)self baseObject];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__MTLToolsLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke;
  v10[3] = &unk_264E12C30;
  v10[4] = self;
  v10[5] = a5;
  [v9 newFunctionWithName:a3 constantValues:a4 completionHandler:v10];
}

void __72__MTLToolsLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = [(MTLDevice *)[(MTLToolsLibrary *)self device] unwrapMTLFunctionDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__MTLToolsLibrary_newFunctionWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E130F8;
  v8[5] = v6;
  v8[6] = a4;
  v8[4] = self;
  [v7 newFunctionWithDescriptor:v6 completionHandler:v8];
}

void __63__MTLToolsLibrary_newFunctionWithDescriptor_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(*(id *)(a1[4] + 24), "getFunctionForBaseObject:library:", a2);
  (*(void (**)(void))(a1[6] + 16))();

  id v4 = (void *)a1[5];
}

- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)[(MTLDevice *)[(MTLToolsLibrary *)self device] unwrapMTLFunctionDescriptor:a3];
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithDescriptor:error:", v6, a4);
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [(MTLToolsDevice *)self->super._device getFunctionForBaseObject:v7 library:self];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v7 = [(MTLToolsObject *)self baseObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__MTLToolsLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E12C30;
  v8[4] = self;
  v8[5] = a4;
  [v7 newIntersectionFunctionWithDescriptor:a3 completionHandler:v8];
}

void __75__MTLToolsLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionWithDescriptor:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsDevice *)self->super._device getFunctionForBaseObject:result library:self];

    return v7;
  }
  return result;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6
{
  id v11 = [(MTLToolsObject *)self baseObject];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__MTLToolsLibrary_newFunctionWithName_constantValues_pipelineLibrary_completionHandler___block_invoke;
  v12[3] = &unk_264E12C30;
  v12[4] = self;
  v12[5] = a6;
  [v11 newFunctionWithName:a3 constantValues:a4 pipelineLibrary:a5 completionHandler:v12];
}

void __88__MTLToolsLibrary_newFunctionWithName_constantValues_pipelineLibrary_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 error:(id *)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithDescriptor:destinationArchive:error:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    id v8 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (NSArray)functionNames
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 functionNames];
}

- (NSArray)externFunctionNames
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 externFunctionNames];
}

- (NSData)bitcodeData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSData *)[v2 bitcodeData];
}

- (int64_t)type
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 type];
}

- (NSString)installName
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 installName];
}

@end