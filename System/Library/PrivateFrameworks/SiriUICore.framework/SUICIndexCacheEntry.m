@interface SUICIndexCacheEntry
- (unsigned)metal_indices;
- (unsigned)numAuraIndices;
- (unsigned)numAuraIndicesCulled;
- (unsigned)numWaveIndices;
- (void)dealloc;
- (void)setMetal_indices:(unsigned int *)a3;
- (void)setNumAuraIndices:(unsigned int)a3;
- (void)setNumAuraIndicesCulled:(unsigned int)a3;
- (void)setNumWaveIndices:(unsigned int)a3;
@end

@implementation SUICIndexCacheEntry

- (void)dealloc
{
  free(self->_metal_indices);
  v3.receiver = self;
  v3.super_class = (Class)SUICIndexCacheEntry;
  [(SUICIndexCacheEntry *)&v3 dealloc];
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

- (unsigned)metal_indices
{
  return self->_metal_indices;
}

- (void)setMetal_indices:(unsigned int *)a3
{
  self->_metal_indices = a3;
}

@end