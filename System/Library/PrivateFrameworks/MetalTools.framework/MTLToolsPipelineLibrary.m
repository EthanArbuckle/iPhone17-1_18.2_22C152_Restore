@interface MTLToolsPipelineLibrary
- (BOOL)disableRunTimeCompilation;
- (MTLDevice)device;
- (MTLPipelineCache)functionCache;
- (MTLPipelineCache)pipelineCache;
- (NSArray)metallibPaths;
- (NSArray)pipelineNames;
- (NSString)label;
- (id)newComputePipelineDescriptorWithName:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineDescriptorWithName:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (void)setDisableRunTimeCompilation:(BOOL)a3;
- (void)setLabel:(id)a3;
@end

@implementation MTLToolsPipelineLibrary

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

- (NSArray)pipelineNames
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 pipelineNames];
}

- (BOOL)disableRunTimeCompilation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 disableRunTimeCompilation];
}

- (void)setDisableRunTimeCompilation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setDisableRunTimeCompilation:v3];
}

- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithName:options:reflection:error:", a3, a4, a5, a6);
  if (result)
  {
    id v8 = result;
    v9 = [(MTLToolsObject *)[MTLToolsComputePipelineState alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithName:options:reflection:error:", a3, a4, a5, a6);
  if (result)
  {
    id v8 = result;
    v9 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (id)newComputePipelineDescriptorWithName:(id)a3 error:(id *)a4
{
}

- (id)newRenderPipelineDescriptorWithName:(id)a3 error:(id *)a4
{
}

- (NSArray)metallibPaths
{
}

- (MTLPipelineCache)pipelineCache
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLPipelineCache *)[v2 pipelineCache];
}

- (MTLPipelineCache)functionCache
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLPipelineCache *)[v2 functionCache];
}

@end