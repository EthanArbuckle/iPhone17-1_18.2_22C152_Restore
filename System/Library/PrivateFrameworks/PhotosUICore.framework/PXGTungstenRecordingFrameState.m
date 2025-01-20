@interface PXGTungstenRecordingFrameState
- (NSIndexSet)recordedSpriteIndexes;
- (PXGTungstenRecordingFrameState)init;
- (void)addRecordedSpriteIndex:(unsigned int)a3;
- (void)addRecordedSpriteIndexes:(id)a3;
@end

@implementation PXGTungstenRecordingFrameState

- (void).cxx_destruct
{
}

- (NSIndexSet)recordedSpriteIndexes
{
  return (NSIndexSet *)self->_spriteIndexes;
}

- (void)addRecordedSpriteIndexes:(id)a3
{
}

- (void)addRecordedSpriteIndex:(unsigned int)a3
{
}

- (PXGTungstenRecordingFrameState)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXGTungstenRecordingFrameState;
  v2 = [(PXGTungstenRecordingFrameState *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E60] indexSet];
    spriteIndexes = v2->_spriteIndexes;
    v2->_spriteIndexes = (NSMutableIndexSet *)v3;
  }
  return v2;
}

@end