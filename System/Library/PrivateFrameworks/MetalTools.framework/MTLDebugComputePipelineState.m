@interface MTLDebugComputePipelineState
- (BOOL)isAncestorOf:(id)a3;
- (MTLComputePipelineDescriptor)descriptor;
- (MTLComputePipelineReflection)reflection;
- (MTLDebugComputePipelineState)initWithComputePipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6;
- (MTLFunction)function;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)functionHandleToDebugFunctionHandle:(id)a3 parentFunction:(id)a4;
- (id)functionHandleWithFunction:(id)a3;
- (id)getParameter:(id)a3;
- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3;
- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (void)dealloc;
- (void)validateHandleForSetFunction:(id)a3;
@end

@implementation MTLDebugComputePipelineState

- (MTLDebugComputePipelineState)initWithComputePipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)MTLDebugComputePipelineState;
  v8 = [(MTLToolsObject *)&v27 initWithBaseObject:a3 parent:a5];
  if (v8)
  {
    v9 = (MTLComputePipelineDescriptor *)[a6 copy];
    v8->_descriptor = v9;
    [(MTLComputePipelineDescriptor *)v9 setBinaryArchives:0];
    [(MTLComputePipelineDescriptor *)v8->_descriptor setPreloadedLibraries:MEMORY[0x263EFFA68]];
    v8->_function = (MTLFunction *)[a6 computeFunction];
    v10 = (MTLComputePipelineReflection *)a4;
    v8->_reflection = v10;
    v11 = (void *)[(MTLComputePipelineReflection *)v10 builtInArguments];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v17 = 1;
          uint64_t v18 = 1;
          uint64_t v19 = 1;
          switch([v16 builtInDataType])
          {
            case '!':
              goto LABEL_10;
            case '""':
              goto LABEL_9;
            case '#':
              uint64_t v17 = 0xFFFFFFFFLL;
LABEL_9:
              uint64_t v18 = 0xFFFFFFFFLL;
LABEL_10:
              uint64_t v19 = 0xFFFFFFFFLL;
              break;
            case ')':
              goto LABEL_13;
            case '*':
              goto LABEL_12;
            case '+':
              uint64_t v17 = 0xFFFFLL;
LABEL_12:
              uint64_t v18 = 0xFFFFLL;
LABEL_13:
              uint64_t v19 = 0xFFFFLL;
              break;
            default:
              break;
          }
          switch([v16 builtInType])
          {
            case 5:
              uint64_t v20 = 48;
              goto LABEL_22;
            case 6:
              uint64_t v20 = 72;
              goto LABEL_22;
            case 7:
              uint64_t v20 = 96;
              goto LABEL_22;
            case 8:
              v8->_maxThreadIndexInThreadgroup[0] = v19;
              continue;
            case 9:
              uint64_t v20 = 144;
              goto LABEL_22;
            case 10:
              uint64_t v20 = 168;
              goto LABEL_22;
            case 11:
              uint64_t v20 = 192;
LABEL_22:
              v21 = (uint64_t *)((char *)v8 + v20);
              uint64_t *v21 = v19;
              v21[1] = v18;
              v21[2] = v17;
              break;
            default:
              continue;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v13);
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugComputePipelineState;
  [(MTLToolsComputePipelineState *)&v3 dealloc];
}

- (id)formattedDescription:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugComputePipelineState;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLToolsObject description](&v4, sel_description), -[MTLComputePipelineDescriptor formattedDescription:](self->_descriptor, "formattedDescription:", a3 + 4)];
}

- (id)description
{
  return [(MTLDebugComputePipelineState *)self formattedDescription:0];
}

- (id)getParameter:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 getParameter:a3];
}

- (id)functionHandleToDebugFunctionHandle:(id)a3 parentFunction:(id)a4
{
  v7 = *(void **)([a4 device] + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__MTLDebugComputePipelineState_functionHandleToDebugFunctionHandle_parentFunction___block_invoke;
  v9[3] = &unk_264E13C00;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = a4;
  return (id)[v7 getCachedObjectForKey:a3 onMiss:v9];
}

uint64_t __83__MTLDebugComputePipelineState_functionHandleToDebugFunctionHandle_parentFunction___block_invoke(void *a1)
{
  v2 = [MTLDebugFunctionHandle alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  return (uint64_t)[(MTLDebugFunctionHandle *)v2 initWithBaseObject:v3 parent:v4 function:v5 stage:1];
}

- (id)functionHandleWithFunction:(id)a3
{
  if (!a3 || ([a3 conformsToProtocol:&unk_26EF98320] & 1) == 0) {
    MTLReportFailure();
  }
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionHandleWithFunction:", objc_msgSend(a3, "baseObject"));

  return [(MTLDebugComputePipelineState *)self functionHandleToDebugFunctionHandle:v5 parentFunction:a3];
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3
{
  return [(MTLDebugComputePipelineState *)self newComputePipelineStateWithAdditionalBinaryFunctions:a3 error:0];
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (![(MTLComputePipelineDescriptor *)[(MTLDebugComputePipelineState *)self descriptor] supportAddingBinaryFunctions])MTLReportFailure(); {
  v7 = [(MTLToolsComputePipelineState *)self device];
  }
  if (a3 && (v8 = v7, [a3 count]))
  {
    if ((objc_msgSend((id)-[MTLDevice baseObject](v8, "baseObject"), "supportsFunctionPointers") & 1) == 0) {
      MTLReportFailure();
    }
    v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v10 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(a3);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "baseObject", v21);
          [v9 addObject:v14];
          if (![v14 precompiledOutput])
          {
            uint64_t v21 = objc_msgSend((id)objc_msgSend(v14, "name"), "UTF8String");
            MTLReportFailure();
          }
        }
        uint64_t v11 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v9 = 0;
  }
  uint64_t v23 = 0;
  if (!a4) {
    a4 = (id *)&v23;
  }
  uint64_t v15 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v21), "newComputePipelineStateWithAdditionalBinaryFunctions:error:", v9, a4);
  v16 = (void *)v15;
  if (v23)
  {
    uint64_t v22 = v23;
    MTLReportFailure();
    if (v16) {
      goto LABEL_22;
    }
    return 0;
  }
  if (!v15) {
    return 0;
  }
LABEL_22:
  uint64_t v17 = (void *)[(MTLComputePipelineDescriptor *)self->_descriptor copy];
  id v18 = objc_alloc_init(MEMORY[0x263F12940]);
  [v18 setBinaryFunctions:a3];
  [v17 setLinkedFunctions:v18];

  uint64_t v19 = [[MTLDebugComputePipelineState alloc] initWithComputePipelineState:v16 reflection:self->_reflection parent:self descriptor:v17];
  return v19;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  if (objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsComputePipelineState device](self, "device"), "baseObject"), "supportsFunctionPointers"))
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_3:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
    }
  }
  MTLReportFailure();
LABEL_4:
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:", a3);
  if (result)
  {
    id v6 = result;
    v7 = [[MTLDebugVisibleFunctionTable alloc] initWithVisibleFunctionTable:result parent:self descriptor:a3 pipelineState:self stage:1];

    return v7;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:", a3);
  if (result)
  {
    id v6 = result;
    v7 = [[MTLDebugIntersectionFunctionTable alloc] initWithIntersectionFunctionTable:result parent:self descriptor:a3 pipelineState:self stage:1];

    return v7;
  }
  return result;
}

- (BOOL)isAncestorOf:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v3 = a3;
  id v5 = a3;
  while (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    id v6 = (MTLDebugComputePipelineState *)[v3 parent];

    uint64_t v3 = v6;
    if (v6 == self)
    {
      BOOL v7 = 1;
      uint64_t v3 = self;
      goto LABEL_8;
    }
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (void)validateHandleForSetFunction:(id)a3
{
  [a3 function];
  id v5 = (id)[a3 parent];
  if (([v5 isAncestorOf:self] & 1) == 0
    && ![(MTLDebugComputePipelineState *)self isAncestorOf:v5])
  {
    objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
    MTLReportFailure();
  }
}

- (int64_t)shaderValidation
{
  id v2 = [(MTLToolsObject *)self baseObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 2;
  }
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    id v2 = (id)[v2 baseObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 2;
    }
  }

  return [v2 shaderValidation];
}

- (int64_t)shaderValidationState
{
  id v2 = [(MTLToolsObject *)self baseObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 2;
  }
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    id v2 = (id)[v2 baseObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 2;
    }
  }

  return [v2 shaderValidationState];
}

- (MTLFunction)function
{
  return self->_function;
}

- (MTLComputePipelineDescriptor)descriptor
{
  return self->_descriptor;
}

- (MTLComputePipelineReflection)reflection
{
  return self->_reflection;
}

@end