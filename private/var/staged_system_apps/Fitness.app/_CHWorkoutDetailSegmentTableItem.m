@interface _CHWorkoutDetailSegmentTableItem
- (CHWorkoutSegment)segment;
- (int64_t)segmentIndex;
- (void)setSegment:(id)a3;
- (void)setSegmentIndex:(int64_t)a3;
@end

@implementation _CHWorkoutDetailSegmentTableItem

- (int64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(int64_t)a3
{
  self->_segmentIndex = a3;
}

- (CHWorkoutSegment)segment
{
  return self->_segment;
}

- (void)setSegment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end