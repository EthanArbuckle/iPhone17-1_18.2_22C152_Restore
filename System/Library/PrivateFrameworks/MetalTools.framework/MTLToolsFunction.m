@interface MTLToolsFunction
- (MTLDebugInstrumentationData)debugInstrumentationData;
- (MTLFunctionHandle)functionHandle;
- (MTLToolsFunction)initWithFunction:(id)a3 library:(id)a4;
- (MTLType)returnType;
- (NSArray)arguments;
- (NSArray)bindings;
- (NSArray)importedLibraries;
- (NSArray)importedSymbols;
- (NSArray)relocations;
- (NSArray)stageInputAttributes;
- (NSArray)vertexAttributes;
- (NSDictionary)functionConstantsDictionary;
- (NSString)filePath;
- (NSString)label;
- (NSString)name;
- (NSString)unpackedFilePath;
- (const)bitCodeHash;
- (id)bitcodeData;
- (id)formattedDescription:(unint64_t)a3;
- (id)functionInputs;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5;
- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4;
- (id)precompiledOutput;
- (id)reflectionWithOptions:(unint64_t)a3;
- (id)reflectionWithOptions:(unint64_t)a3 binaryArchives:(id)a4;
- (id)reflectionWithOptions:(unint64_t)a3 pipelineLibrary:(id)a4;
- (int64_t)lineNumber;
- (int64_t)patchControlPointCount;
- (unint64_t)functionType;
- (unint64_t)options;
- (unint64_t)patchType;
- (unint64_t)renderTargetArrayIndexType;
- (void)dealloc;
- (void)reflectionWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)setLabel:(id)a3;
- (void)setRelocations:(id)a3;
@end

@implementation MTLToolsFunction

- (MTLToolsFunction)initWithFunction:(id)a3 library:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLToolsFunction;
  return [(MTLToolsObject *)&v5 initWithBaseObject:a3 parent:a4];
}

- (id)formattedDescription:(unint64_t)a3
{
  return &stru_26EF29A78;
}

- (unint64_t)functionType
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 functionType];
}

- (NSArray)vertexAttributes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 vertexAttributes];
}

- (MTLType)returnType
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLType *)[v2 returnType];
}

- (NSArray)arguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 arguments];
}

- (NSArray)bindings
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 bindings];
}

- (NSArray)importedSymbols
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 importedSymbols];
}

- (NSArray)importedLibraries
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 importedLibraries];
}

- (NSArray)stageInputAttributes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 stageInputAttributes];
}

- (NSString)name
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 name];
}

- (NSString)filePath
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 filePath];
}

- (int64_t)lineNumber
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 lineNumber];
}

- (NSString)unpackedFilePath
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 unpackedFilePath];
}

- (id)functionInputs
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 functionInputs];
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLDebugInstrumentationData *)[v2 debugInstrumentationData];
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

- (unint64_t)renderTargetArrayIndexType
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 renderTargetArrayIndexType];
}

- (NSDictionary)functionConstantsDictionary
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSDictionary *)[v2 functionConstantsDictionary];
}

- (unint64_t)patchType
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 patchType];
}

- (int64_t)patchControlPointCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 patchControlPointCount];
}

- (unint64_t)options
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 options];
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferIndex:", a3);
  if (result)
  {
    id v5 = result;
    v6 = [(MTLToolsObject *)[MTLToolsArgumentEncoder alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferIndex:reflection:", a3, a4);
  if (result)
  {
    id v6 = result;
    v7 = [(MTLToolsObject *)[MTLToolsArgumentEncoder alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferIndex:pipelineLibrary:", a3, a4);
  if (result)
  {
    id v6 = result;
    v7 = [(MTLToolsObject *)[MTLToolsArgumentEncoder alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    v8 = [(MTLToolsObject *)[MTLToolsArgumentEncoder alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferIndex:reflection:binaryArchives:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    v8 = [(MTLToolsObject *)[MTLToolsArgumentEncoder alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (NSArray)relocations
{
  return self->_relocations;
}

- (void)setRelocations:(id)a3
{
  relocations = self->_relocations;
  if (relocations != a3)
  {

    self->_relocations = (NSArray *)[a3 copy];
    id v6 = (id)[(MTLDevice *)[(MTLToolsObject *)self device] unwrapMTLRelocations:a3];
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRelocations:", v6);
  }
}

- (id)bitcodeData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 bitcodeData];
}

- (id)reflectionWithOptions:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 reflectionWithOptions:a3];
}

- (id)reflectionWithOptions:(unint64_t)a3 pipelineLibrary:(id)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return (id)[v6 reflectionWithOptions:a3 pipelineLibrary:a4];
}

- (id)reflectionWithOptions:(unint64_t)a3 binaryArchives:(id)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return (id)[v6 reflectionWithOptions:a3 binaryArchives:a4];
}

- (void)reflectionWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 reflectionWithOptions:a3 completionHandler:a4];
}

- (const)bitCodeHash
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)[v2 bitCodeHash];
}

- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithPluginData:bitcodeType:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (MTLFunctionHandle)functionHandle
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLFunctionHandle *)[v2 functionHandle];
}

- (id)precompiledOutput
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 precompiledOutput];
}

- (void)dealloc
{
  [(MTLToolsObjectCache *)self->super._device->functionObjectCache removeKey:self->super._baseObject];
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsFunction;
  [(MTLToolsObject *)&v3 dealloc];
}

@end