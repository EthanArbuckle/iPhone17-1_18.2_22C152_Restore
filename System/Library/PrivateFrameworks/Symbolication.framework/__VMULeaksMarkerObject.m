@interface __VMULeaksMarkerObject
- ($C6AC5999CB38BBFF64BCC54667DCCE81)region;
- (unsigned)entryIndex;
- (void)dealloc;
- (void)setEntryIndex:(unsigned int)a3;
- (void)setRegion:(id *)a3;
@end

@implementation __VMULeaksMarkerObject

- (void)dealloc
{
  region = self->_region;
  if (region)
  {
    unsigned int entryIndex = self->_entryIndex;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = ___removeEntryFromMarkingRegion_block_invoke;
    v6[3] = &__block_descriptor_44_e5_v8__0l;
    unsigned int v7 = entryIndex;
    v6[4] = region;
    _singleThreadedMarking(v6);
  }
  v5.receiver = self;
  v5.super_class = (Class)__VMULeaksMarkerObject;
  [(__VMULeaksMarkerObject *)&v5 dealloc];
}

- ($C6AC5999CB38BBFF64BCC54667DCCE81)region
{
  return self->_region;
}

- (void)setRegion:(id *)a3
{
  self->_region = a3;
}

- (unsigned)entryIndex
{
  return self->_entryIndex;
}

- (void)setEntryIndex:(unsigned int)a3
{
  self->_unsigned int entryIndex = a3;
}

@end