@interface MTLDebugBinaryArchive
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
@end

@implementation MTLDebugBinaryArchive

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (!a3) {
    MTLReportFailure();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    MTLReportFailure();
  }
  if (![a3 computeFunction]) {
    MTLReportFailure();
  }
  uint64_t v9 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLComputePipelineDescriptor:a3];
  uint64_t v10 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] debugPipelineOptions:a4 includePipelinePerfStats:0];
  id v11 = [(MTLToolsObject *)self baseObject];

  return [v11 addComputePipelineFunctionsWithDescriptor:v9 options:v10 error:a5];
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return [(MTLDebugBinaryArchive *)self addComputePipelineFunctionsWithDescriptor:a3 options:0 error:a4];
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (!a3) {
    MTLReportFailure();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    MTLReportFailure();
  }
  uint64_t v9 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLRenderPipelineDescriptor:a3];
  uint64_t v10 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] debugPipelineOptions:a4 includePipelinePerfStats:0];
  id v11 = [(MTLToolsObject *)self baseObject];

  return [v11 addRenderPipelineFunctionsWithDescriptor:v9 options:v10 error:a5];
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return [(MTLDebugBinaryArchive *)self addRenderPipelineFunctionsWithDescriptor:a3 options:0 error:a4];
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (!a3) {
    MTLReportFailure();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    MTLReportFailure();
  }
  uint64_t v9 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLMeshRenderPipelineDescriptor:a3];
  uint64_t v10 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] debugPipelineOptions:a4 includePipelinePerfStats:0];
  id v11 = [(MTLToolsObject *)self baseObject];

  return [v11 addMeshRenderPipelineFunctionsWithDescriptor:v9 options:v10 error:a5];
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return [(MTLDebugBinaryArchive *)self addMeshRenderPipelineFunctionsWithDescriptor:a3 options:0 error:a4];
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if ([(MTLDevice *)[(MTLToolsBinaryArchive *)self device] supportsTileShaders])
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    MTLReportFailure();
    if (a3) {
      goto LABEL_3;
    }
  }
  MTLReportFailure();
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    MTLReportFailure();
  }
  uint64_t v9 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] unwrapMTLTileRenderPipelineDescriptor:a3];
  uint64_t v10 = [(MTLDevice *)[(MTLToolsBinaryArchive *)self device] debugPipelineOptions:a4 includePipelinePerfStats:0];
  id v11 = [(MTLToolsObject *)self baseObject];

  return [v11 addTileRenderPipelineFunctionsWithDescriptor:v9 options:v10 error:a5];
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return [(MTLDebugBinaryArchive *)self addTileRenderPipelineFunctionsWithDescriptor:a3 options:0 error:a4];
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  if (!a3) {
    MTLReportFailure();
  }
  if (([a3 isFileURL] & 1) == 0) {
    MTLReportFailure();
  }
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugBinaryArchive;
  return [(MTLToolsBinaryArchive *)&v8 serializeToURL:a3 error:a4];
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (!a3) {
    MTLReportFailure();
  }
  if (([a3 isFileURL] & 1) == 0) {
    MTLReportFailure();
  }
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugBinaryArchive;
  return [(MTLToolsBinaryArchive *)&v10 serializeToURL:a3 options:a4 error:a5];
}

@end