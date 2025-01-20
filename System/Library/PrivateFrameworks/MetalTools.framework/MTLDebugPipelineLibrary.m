@interface MTLDebugPipelineLibrary
- (MTLDebugPipelineLibrary)initWithLibrary:(id)a3 parent:(id)a4 filePath:(id)a5;
- (NSString)filePath;
- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (void)dealloc;
- (void)setFilePath:(id)a3;
@end

@implementation MTLDebugPipelineLibrary

- (MTLDebugPipelineLibrary)initWithLibrary:(id)a3 parent:(id)a4 filePath:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugPipelineLibrary;
  v6 = [(MTLToolsObject *)&v8 initWithBaseObject:a3 parent:a4];
  if (v6) {
    v6->_filePath = (NSString *)[a5 copy];
  }
  return v6;
}

- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  v17 = 0;
  uint64_t v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithName:options:reflection:error:", a3, a4 | 0x10003, &v17, a6);
  v12 = (void *)v11;
  if (a5) {
    *a5 = v17;
  }
  if (!v11) {
    return 0;
  }
  v13 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineDescriptorWithName:error:", a3, 0);
  v14 = [MTLDebugComputePipelineState alloc];
  v15 = [(MTLDebugComputePipelineState *)v14 initWithComputePipelineState:v12 reflection:v17 parent:self descriptor:v13];

  return v15;
}

- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    MTLReportFailure();
  }
  v17 = 0;
  uint64_t v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithName:options:reflection:error:", a3, a4 | 0x10003, &v17, a6);
  v12 = (void *)v11;
  if (a5) {
    *a5 = v17;
  }
  if (!v11) {
    return 0;
  }
  v13 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineDescriptorWithName:error:", a3, 0);
  v14 = [MTLDebugRenderPipelineState alloc];
  v15 = [(MTLDebugRenderPipelineState *)v14 initWithPipelineState:v12 reflection:v17 parent:self descriptor:v13];

  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugPipelineLibrary;
  [(MTLToolsObject *)&v3 dealloc];
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

@end