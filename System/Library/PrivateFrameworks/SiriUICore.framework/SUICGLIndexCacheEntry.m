@interface SUICGLIndexCacheEntry
- (unsigned)gl_indices;
- (unsigned)numAuraIndices;
- (unsigned)numAuraIndicesCulled;
- (unsigned)numWaveIndices;
- (void)dealloc;
- (void)setGl_indices:(unsigned int *)a3;
- (void)setNumAuraIndices:(unsigned int)a3;
- (void)setNumAuraIndicesCulled:(unsigned int)a3;
- (void)setNumWaveIndices:(unsigned int)a3;
@end

@implementation SUICGLIndexCacheEntry

- (void)dealloc
{
  free(self->_gl_indices);
  v3.receiver = self;
  v3.super_class = (Class)SUICGLIndexCacheEntry;
  [(SUICGLIndexCacheEntry *)&v3 dealloc];
}

- (unsigned)numAuraIndices
{
  return self->_numAuraIndices;
}

- (void)setNumAuraIndices:(unsigned int)a3
{
  self->_numAuraIndices = a3;
}

- (unsigned)numAuraIndicesCulled
{
  return self->_numAuraIndicesCulled;
}

- (void)setNumAuraIndicesCulled:(unsigned int)a3
{
  self->_numAuraIndicesCulled = a3;
}

- (unsigned)numWaveIndices
{
  return self->_numWaveIndices;
}

- (void)setNumWaveIndices:(unsigned int)a3
{
  self->_numWaveIndices = a3;
}

- (unsigned)gl_indices
{
  return self->_gl_indices;
}

- (void)setGl_indices:(unsigned int *)a3
{
  self->_gl_indices = a3;
}

@end