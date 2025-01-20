@interface VFXMTLResourceBinding
- (BOOL)needsRenderResource;
- (MTLArgumentEncoder)argumentEncoder;
- (MTLBinding)binding;
- (NSMutableArray)usedResources;
- (NSString)name;
- (VFXMTLResourceBinding)init;
- (id)bindBlock;
- (id)description;
- (int64_t)type;
- (void)dealloc;
- (void)setArgumentEncoder:(id)a3;
- (void)setBindBlock:(id)a3;
- (void)setBinding:(id)a3;
- (void)setNeedsRenderResource:(BOOL)a3;
@end

@implementation VFXMTLResourceBinding

- (VFXMTLResourceBinding)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLResourceBinding;
  result = [(VFXMTLResourceBinding *)&v3 init];
  *(_DWORD *)&result->_indices.vertexIndex = -1;
  result->_usedResources = 0;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLResourceBinding;
  [(VFXMTLResourceBinding *)&v3 dealloc];
}

- (int64_t)type
{
  return objc_msgSend_type(self->_binding, a2, v2, v3);
}

- (id)description
{
  v5 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  uint64_t v11 = objc_msgSend_name(self->_binding, v8, v9, v10);
  objc_msgSend_appendFormat_(v5, v12, @"<%@: %p> \"%@\"", v13, v7, self, v11);
  return v5;
}

- (NSString)name
{
  return (NSString *)objc_msgSend_name(self->_binding, a2, v2, v3);
}

- (void)setNeedsRenderResource:(BOOL)a3
{
  self->_needsRenderResource = a3;
}

- (BOOL)needsRenderResource
{
  return self->_needsRenderResource;
}

- (NSMutableArray)usedResources
{
  result = self->_usedResources;
  if (!result)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    result = (NSMutableArray *)objc_msgSend_initWithCapacity_(v4, v5, 0, v6);
    self->_usedResources = result;
  }
  return result;
}

- (id)bindBlock
{
  return self->_bindBlock;
}

- (void)setBindBlock:(id)a3
{
}

- (MTLBinding)binding
{
  return self->_binding;
}

- (void)setBinding:(id)a3
{
}

- (MTLArgumentEncoder)argumentEncoder
{
  return self->_argumentEncoder;
}

- (void)setArgumentEncoder:(id)a3
{
}

@end