@interface _UILibArchiveReaderLoadedItem
- (id)description;
- (int64_t)sequenceIndex;
- (void)setSequenceIndex:(int64_t)a3;
@end

@implementation _UILibArchiveReaderLoadedItem

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_UILibArchiveReaderLoadedItem;
  v4 = [(_UIArchiveItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ seq = %d", v4, self->_sequenceIndex];

  return v5;
}

- (int64_t)sequenceIndex
{
  return self->_sequenceIndex;
}

- (void)setSequenceIndex:(int64_t)a3
{
  self->_sequenceIndex = a3;
}

@end