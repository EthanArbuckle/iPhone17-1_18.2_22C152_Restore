@interface MTLLegacySVLibrary
- (MTLLegacySVLibrary)initWithLibrary:(id)a3 device:(id)a4;
- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4;
- (id)newFunctionWithName:(id)a3;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 error:(id *)a6;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6;
- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4;
- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6;
- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4;
@end

@implementation MTLLegacySVLibrary

- (MTLLegacySVLibrary)initWithLibrary:(id)a3 device:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVLibrary;
  return [(MTLToolsObject *)&v5 initWithBaseObject:a3 parent:a4];
}

- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsDevice *)self->super.super._device unwrapMTLFunctionDescriptor:a3];
  [(MTLToolsDevice *)self->super.super._device modifyFunctionDescriptor:v6];
  v7 = (void *)[(MTLToolsObject *)self->super.super._baseObject newFunctionWithDescriptor:v6 error:a4];
  id v8 = [(MTLToolsDevice *)self->super.super._device getFunctionForBaseObject:v7 library:self];

  [v8 prepareForBinaryFunctionUsage];
  return v8;
}

- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(MTLToolsDevice *)self->super.super._device unwrapMTLFunctionDescriptor:a3];
  [(MTLToolsDevice *)self->super.super._device modifyFunctionDescriptor:v6];
  baseObject = self->super.super._baseObject;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__MTLLegacySVLibrary_newFunctionWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E12C30;
  v8[4] = self;
  v8[5] = a4;
  [(MTLToolsObject *)baseObject newFunctionWithDescriptor:v6 completionHandler:v8];
}

void __66__MTLLegacySVLibrary_newFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  [v3 prepareForBinaryFunctionUsage];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)newIntersectionFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(MTLToolsDevice *)self->super.super._device unwrapMTLFunctionDescriptor:a3];
  [(MTLToolsDevice *)self->super.super._device modifyFunctionDescriptor:v6];
  baseObject = self->super.super._baseObject;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__MTLLegacySVLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E12C30;
  v8[4] = self;
  v8[5] = a4;
  [(MTLToolsObject *)baseObject newIntersectionFunctionWithDescriptor:v6 completionHandler:v8];
}

void __78__MTLLegacySVLibrary_newIntersectionFunctionWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "getFunctionForBaseObject:library:", a2);
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  [v3 prepareForBinaryFunctionUsage];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)newIntersectionFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsDevice *)self->super.super._device unwrapMTLFunctionDescriptor:a3];
  [(MTLToolsDevice *)self->super.super._device modifyFunctionDescriptor:v6];
  v7 = (void *)[(MTLToolsObject *)self->super.super._baseObject newIntersectionFunctionWithDescriptor:v6 error:a4];
  id v8 = [(MTLToolsDevice *)self->super.super._device getFunctionForBaseObject:v7 library:self];

  [v8 prepareForBinaryFunctionUsage];
  return v8;
}

- (id)newFunctionWithName:(id)a3
{
  objc_super v5 = objc_opt_new();
  [v5 setName:a3];
  [v5 setApplyFunctionConstants:0];
  id v6 = [(MTLLegacySVLibrary *)self newFunctionWithDescriptor:v5 error:0];

  return v6;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  v9 = objc_opt_new();
  [v9 setName:a3];
  [v9 setConstantValues:a4];
  id v10 = [(MTLLegacySVLibrary *)self newFunctionWithDescriptor:v9 error:a5];

  return v10;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5
{
  v9 = objc_opt_new();
  [v9 setName:a3];
  [v9 setConstantValues:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__MTLLegacySVLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke;
  v10[3] = &unk_264E12C58;
  v10[4] = v9;
  v10[5] = a5;
  [(MTLLegacySVLibrary *)self newFunctionWithDescriptor:v9 completionHandler:v10];
}

void __75__MTLLegacySVLibrary_newFunctionWithName_constantValues_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 error:(id *)a6
{
  id v8 = objc_opt_new();
  [v8 setName:a3];
  [v8 setConstantValues:a4];

  abort();
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id v8 = objc_opt_new();
  [v8 setName:a3];
  [v8 setConstantValues:a4];

  abort();
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6
{
  id v8 = objc_opt_new();
  [v8 setName:a3];
  [v8 setConstantValues:a4];

  abort();
}

@end