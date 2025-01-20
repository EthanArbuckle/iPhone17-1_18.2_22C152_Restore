@interface VFXMTLSemanticResourceBinding
- (int64_t)bufferSize;
- (int64_t)semanticsCount;
- (void)dealloc;
- (void)setBufferSize:(int64_t)a3;
- (void)setSemanticsCount:(int64_t)a3;
@end

@implementation VFXMTLSemanticResourceBinding

- (void)dealloc
{
  free(self->_semantics);
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLSemanticResourceBinding;
  [(VFXMTLResourceBinding *)&v3 dealloc];
}

- (int64_t)semanticsCount
{
  return self->semanticsCount;
}

- (void)setSemanticsCount:(int64_t)a3
{
  self->semanticsCount = a3;
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