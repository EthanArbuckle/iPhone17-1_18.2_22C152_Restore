@interface MTLToolsDynamicLibrary
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)shaderValidationEnabled;
- (MTLDebugInstrumentationData)debugInstrumentationData;
- (MTLDevice)device;
- (NSArray)exportedFunctions;
- (NSArray)exportedVariables;
- (NSArray)importedLibraries;
- (NSArray)importedSymbols;
- (NSArray)relocations;
- (NSString)installName;
- (NSString)label;
- (NSString)libraryPath;
- (OS_dispatch_data)binaryData;
- (OS_dispatch_data)reflectionData;
- (const)libraryUUID;
- (id)formattedDescription:(unint64_t)a3;
- (void)dealloc;
- (void)setDebugInstrumentationData:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRelocations:(id)a3;
@end

@implementation MTLToolsDynamicLibrary

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

- (OS_dispatch_data)binaryData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (OS_dispatch_data *)[v2 binaryData];
}

- (OS_dispatch_data)reflectionData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (OS_dispatch_data *)[v2 reflectionData];
}

- (NSArray)exportedFunctions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 exportedFunctions];
}

- (NSArray)exportedVariables
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 exportedVariables];
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

- (NSString)installName
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 installName];
}

- (NSString)libraryPath
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 libraryPath];
}

- (const)libraryUUID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)[v2 libraryUUID];
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 serializeToURL:a3 error:a4];
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  return [v8 serializeToURL:a3 options:a4 error:a5];
}

- (id)formattedDescription:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 formattedDescription:a3];
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
    id v6 = (id)[(MTLDevice *)[(MTLToolsDynamicLibrary *)self device] unwrapMTLRelocations:a3];
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRelocations:", v6);
  }
}

- (BOOL)shaderValidationEnabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 shaderValidationEnabled];
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLDebugInstrumentationData *)[v2 debugInstrumentationData];
}

- (void)setDebugInstrumentationData:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setDebugInstrumentationData:a3];
}

- (void)dealloc
{
  [(MTLToolsObjectCache *)self->super._device->dynamicLibraryObjectCache removeKey:self->super._baseObject];
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsDynamicLibrary;
  [(MTLToolsObject *)&v3 dealloc];
}

@end