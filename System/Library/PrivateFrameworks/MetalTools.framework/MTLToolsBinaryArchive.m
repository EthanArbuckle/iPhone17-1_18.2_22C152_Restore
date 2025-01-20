@interface MTLToolsBinaryArchive
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addFunctionWithDescriptor:(id)a3 library:(id)a4 error:(id *)a5;
- (BOOL)addLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)enumerateArchivesFromBackingFile:(id)a3;
- (BOOL)enumerateArchivesFromPipelineCollection:(id)a3;
- (BOOL)recompileToArchiveWithURL:(id)a3 error:(id *)a4;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)storeComputePipelineDescriptor:(id)a3;
- (BOOL)storeMeshRenderPipelineDescriptor:(id)a3;
- (BOOL)storeRenderPipelineDescriptor:(id)a3;
- (BOOL)storeTileRenderPipelineDescriptor:(id)a3;
- (MTLDevice)device;
- (MTLPipelineCollection)pipelineCollection;
- (NSArray)keys;
- (NSString)label;
- (id)archiveFunctionIds;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)options;
- (void)setLabel:(id)a3;
@end

@implementation MTLToolsBinaryArchive

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

- (unint64_t)options
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 options];
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLComputePipelineDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];

  return [v7 addComputePipelineFunctionsWithDescriptor:v6 error:a4];
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLComputePipelineDescriptor:a3];
  id v9 = [(MTLToolsObject *)self baseObject];

  return [v9 addComputePipelineFunctionsWithDescriptor:v8 options:a4 error:a5];
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLRenderPipelineDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];

  return [v7 addRenderPipelineFunctionsWithDescriptor:v6 error:a4];
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLRenderPipelineDescriptor:a3];
  id v9 = [(MTLToolsObject *)self baseObject];

  return [v9 addRenderPipelineFunctionsWithDescriptor:v8 options:a4 error:a5];
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLTileRenderPipelineDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];

  return [v7 addTileRenderPipelineFunctionsWithDescriptor:v6 error:a4];
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLTileRenderPipelineDescriptor:a3];
  id v9 = [(MTLToolsObject *)self baseObject];

  return [v9 addTileRenderPipelineFunctionsWithDescriptor:v8 options:a4 error:a5];
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLMeshRenderPipelineDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];

  return [v7 addMeshRenderPipelineFunctionsWithDescriptor:v6 error:a4];
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLMeshRenderPipelineDescriptor:a3];
  id v9 = [(MTLToolsObject *)self baseObject];

  return [v9 addMeshRenderPipelineFunctionsWithDescriptor:v8 options:a4 error:a5];
}

- (BOOL)addLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)[(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLStitchedLibraryDescriptor:a3];
  LOBYTE(a4) = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addLibraryWithDescriptor:error:", v6, a4);

  return (char)a4;
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

- (NSArray)keys
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 keys];
}

- (id)formattedDescription:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 formattedDescription:a3];
}

- (MTLPipelineCollection)pipelineCollection
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLPipelineCollection *)[v2 pipelineCollection];
}

- (BOOL)enumerateArchivesFromBackingFile:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 enumerateArchivesFromBackingFile:a3];
}

- (BOOL)enumerateArchivesFromPipelineCollection:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 enumerateArchivesFromPipelineCollection:a3];
}

- (BOOL)storeComputePipelineDescriptor:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 storeComputePipelineDescriptor:a3];
}

- (BOOL)storeRenderPipelineDescriptor:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 storeRenderPipelineDescriptor:a3];
}

- (BOOL)storeTileRenderPipelineDescriptor:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 storeTileRenderPipelineDescriptor:a3];
}

- (BOOL)storeMeshRenderPipelineDescriptor:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 storeMeshRenderPipelineDescriptor:a3];
}

- (id)archiveFunctionIds
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 archiveFunctionIds];
}

- (BOOL)recompileToArchiveWithURL:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 recompileToArchiveWithURL:a3 error:a4];
}

- (BOOL)addFunctionWithDescriptor:(id)a3 library:(id)a4 error:(id *)a5
{
  id v8 = (void *)[(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLFunctionDescriptor:a3];
  LOBYTE(a5) = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addFunctionWithDescriptor:library:error:", v8, objc_msgSend(a4, "baseObject"), a5);

  return (char)a5;
}

@end