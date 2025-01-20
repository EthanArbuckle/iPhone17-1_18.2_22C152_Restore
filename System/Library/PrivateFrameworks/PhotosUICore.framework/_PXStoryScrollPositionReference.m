@interface _PXStoryScrollPositionReference
- ($7DA682ECC7253F641496E0B6E9C98204)scrollPosition;
- (PXStoryTimeline)timeline;
- (_PXStoryScrollPositionReference)init;
- (_PXStoryScrollPositionReference)initWithScrollPosition:(id *)a3;
@end

@implementation _PXStoryScrollPositionReference

- (void).cxx_destruct
{
}

- ($7DA682ECC7253F641496E0B6E9C98204)scrollPosition
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = *($BC569A352189BBB700BC3B7A67A9BAFC *)&self->var2;
  return self;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (_PXStoryScrollPositionReference)initWithScrollPosition:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_PXStoryScrollPositionReference;
  result = [(_PXStoryScrollPositionReference *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    result->_scrollPosition.secondSegmentIdentifier = a3->var2;
    *(_OWORD *)&result->_scrollPosition.firstSegmentIdentifier = v5;
  }
  return result;
}

- (_PXStoryScrollPositionReference)init
{
  memset(v3, 0, sizeof(v3));
  return [(_PXStoryScrollPositionReference *)self initWithScrollPosition:v3];
}

@end