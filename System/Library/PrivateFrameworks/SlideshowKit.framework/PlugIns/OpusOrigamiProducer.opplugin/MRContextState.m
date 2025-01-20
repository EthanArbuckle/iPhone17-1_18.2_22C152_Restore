@interface MRContextState
- (MRContextState)init;
- (MRShaderArguments)shaderArguments;
- (NSMutableDictionary)temporaryUniforms;
- (NSMutableDictionary)vertexAttributes;
- (NSString)shaderID;
- (void)dealloc;
- (void)setShaderArguments:(id)a3;
- (void)setShaderID:(id)a3;
@end

@implementation MRContextState

- (MRContextState)init
{
  v10.receiver = self;
  v10.super_class = (Class)MRContextState;
  v2 = [(MRContextState *)&v10 init];
  v3 = (MRContextState *)v2;
  if (v2)
  {
    *((void *)v2 + 41) = 0;
    *((_DWORD *)v2 + 84) = 1065353216;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v2 + 424) = _Q0;
    *(_DWORD *)(v2 + 414) = 0;
    *(_DWORD *)(v2 + 417) = 0;
    *((void *)v2 + 55) = 0;
    *((void *)v2 + 56) = 0;
    *((void *)v2 + 69) = objc_alloc_init((Class)NSMutableDictionary);
    v3->_temporaryUniforms = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v3;
}

- (void)dealloc
{
  self->_vertexAttributes = 0;
  self->_temporaryUniforms = 0;

  self->_shaderID = 0;
  self->_shaderArguments = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRContextState;
  [(MRContextState *)&v3 dealloc];
}

- (NSString)shaderID
{
  return (NSString *)objc_getProperty(self, a2, 536, 1);
}

- (void)setShaderID:(id)a3
{
}

- (MRShaderArguments)shaderArguments
{
  return (MRShaderArguments *)objc_getProperty(self, a2, 544, 1);
}

- (void)setShaderArguments:(id)a3
{
}

- (NSMutableDictionary)vertexAttributes
{
  return self->_vertexAttributes;
}

- (NSMutableDictionary)temporaryUniforms
{
  return self->_temporaryUniforms;
}

@end