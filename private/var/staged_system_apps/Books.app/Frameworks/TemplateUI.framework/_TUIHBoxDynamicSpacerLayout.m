@interface _TUIHBoxDynamicSpacerLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- (_NSRange)range;
- (_TUIHBoxItemLayoutSummary)summary;
- (double)computedHeightAbovePivot;
- (void)computeLayout;
- (void)onChildTransformedSizeDidChange:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSummary:(_TUIHBoxItemLayoutSummary)a3;
@end

@implementation _TUIHBoxDynamicSpacerLayout

- (double)computedHeightAbovePivot
{
  return self->_summary.heightAbovePivot;
}

- (void)onChildTransformedSizeDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_TUIHBoxDynamicSpacerLayout;
  [(TUILayout *)&v5 onChildTransformedSizeDidChange:v4];
  [(TUILayout *)self setFlexedWidth:NAN];
}

- (void)computeLayout
{
  id v6 = [(TUILayout *)self parent];
  [v6 summaryForRange:self->_range.location, self->_range.length];
  self->_summary.width = v3;
  self->_summary.height = v4;
  self->_summary.heightAbovePivot = v5;
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");
}

- (void)setRange:(_NSRange)a3
{
  if (a3.location != self->_range.location || a3.length != self->_range.length)
  {
    self->_range = a3;
    [(TUILayout *)self invalidateLayout];
    [(TUILayout *)self invalidateIntrinsicSize];
  }
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  [(TUILayout *)self validateLayout];
  double width = self->_summary.width;
  if (width <= -3.40282347e38)
  {
    uint64_t v7 = 4286578687;
  }
  else
  {
    if (width < 3.40282347e38)
    {
      *(float *)&unsigned int v5 = width;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    uint64_t v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  [(TUILayout *)self validateLayout];
  double height = self->_summary.height;
  if (height <= -3.40282347e38)
  {
    uint64_t v7 = 4286578687;
  }
  else
  {
    if (height < 3.40282347e38)
    {
      *(float *)&unsigned int v5 = height;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    uint64_t v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (_TUIHBoxItemLayoutSummary)summary
{
  double width = self->_summary.width;
  double height = self->_summary.height;
  double heightAbovePivot = self->_summary.heightAbovePivot;
  result.double heightAbovePivot = heightAbovePivot;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSummary:(_TUIHBoxItemLayoutSummary)a3
{
  self->_summary = a3;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end