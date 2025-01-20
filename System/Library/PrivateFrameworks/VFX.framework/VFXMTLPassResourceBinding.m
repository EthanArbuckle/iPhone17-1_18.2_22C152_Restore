@interface VFXMTLPassResourceBinding
- (VFXMTLPassResourceBinding)init;
- (int64_t)bufferSize;
- (int64_t)inputsCount;
- (void)dealloc;
- (void)setBufferSize:(int64_t)a3;
- (void)setInputsCount:(int64_t)a3;
@end

@implementation VFXMTLPassResourceBinding

- (VFXMTLPassResourceBinding)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLPassResourceBinding;
  return [(VFXMTLResourceBinding *)&v3 init];
}

- (void)dealloc
{
  free(self->_inputs);
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLPassResourceBinding;
  [(VFXMTLResourceBinding *)&v3 dealloc];
}

- (int64_t)inputsCount
{
  return self->inputsCount;
}

- (void)setInputsCount:(int64_t)a3
{
  self->inputsCount = a3;
}

- (int64_t)bufferSize
{
  return self->bufferSize;
}

- (void)setBufferSize:(int64_t)a3
{
  self->bufferSize = a3;
}

@end