@interface _UICollectionLayoutFramesQueryOffsets
- (_UICollectionLayoutFramesQueryOffsets)init;
@end

@implementation _UICollectionLayoutFramesQueryOffsets

- (_UICollectionLayoutFramesQueryOffsets)init
{
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)_UICollectionLayoutFramesQueryOffsets;
    self = [(_UICollectionLayoutFramesQueryOffsets *)&v2 init];
    if (self)
    {
      self->_frameOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
      self->_indexOffset = 0;
      self->_supplementaryIndexOffset = 0;
    }
  }
  return self;
}

@end