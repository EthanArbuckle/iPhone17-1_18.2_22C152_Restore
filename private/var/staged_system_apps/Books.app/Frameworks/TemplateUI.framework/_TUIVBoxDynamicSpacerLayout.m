@interface _TUIVBoxDynamicSpacerLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- (_NSRange)range;
- (_TUIVBoxItemLayoutSummary)summary;
- (double)computedHeightAbovePivot;
- (void)computeLayout;
- (void)setRange:(_NSRange)a3;
- (void)setSummary:(_TUIVBoxItemLayoutSummary)a3;
@end

@implementation _TUIVBoxDynamicSpacerLayout

- (double)computedHeightAbovePivot
{
  [(TUILayout *)self computedNaturalSize];
  return v2;
}

- (void)computeLayout
{
  id v5 = [(TUILayout *)self parent];
  [v5 summaryForRange:self->_range.location, self->_range.length];
  self->_summary.width = v3;
  self->_summary.height = v4;
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

- (_TUIVBoxItemLayoutSummary)summary
{
  double width = self->_summary.width;
  double height = self->_summary.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSummary:(_TUIVBoxItemLayoutSummary)a3
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