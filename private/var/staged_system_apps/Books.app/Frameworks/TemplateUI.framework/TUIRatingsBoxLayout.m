@interface TUIRatingsBoxLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- (TUIRatingsBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (double)computeIntrinsicAspectRatio;
- (void)_computeIntrinsicContentSize;
- (void)computeLayout;
- (void)invalidateIntrinsicSize;
@end

@implementation TUIRatingsBoxLayout

- (TUIRatingsBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TUIRatingsBoxLayout;
  result = [(TUILayout *)&v6 initWithModel:a3 parent:a4 controller:a5];
  if (result) {
    result->_intrinsicContentSize = CGSizeZero;
  }
  return result;
}

- (void)_computeIntrinsicContentSize
{
  double height = CGSizeZero.height;
  p_intrinsicContentSize = &self->_intrinsicContentSize;
  if (CGSizeZero.width == self->_intrinsicContentSize.width && height == self->_intrinsicContentSize.height)
  {
    id v7 = [(TUILayout *)self box];
    +[TUIRatingsBox imageSizeForSize:](TUIRatingsBox, "imageSizeForSize:", [v7 size]);
    p_intrinsicContentSize->width = v5;
    p_intrinsicContentSize->double height = v6;
  }
}

- (void)invalidateIntrinsicSize
{
  v2.receiver = self;
  v2.super_class = (Class)TUIRatingsBoxLayout;
  [(TUILayout *)&v2 invalidateIntrinsicSize];
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  [(TUIRatingsBoxLayout *)self _computeIntrinsicContentSize];
  double width = self->_intrinsicContentSize.width;
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
  [(TUIRatingsBoxLayout *)self _computeIntrinsicContentSize];
  double height = self->_intrinsicContentSize.height;
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

- (double)computeIntrinsicAspectRatio
{
  [(TUIRatingsBoxLayout *)self _computeIntrinsicContentSize];
  double width = self->_intrinsicContentSize.width;
  double result = 1.0;
  if (width > 0.0) {
    return self->_intrinsicContentSize.height / width;
  }
  return result;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  [(TUILayout *)self computeHeight];
  double v6 = fmax(v5, 1.0);
  double v7 = fmax(v4, 1.0);

  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v7, v6);
}

@end