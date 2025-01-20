@interface _UIActivityContentCollectionView
- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating;
- (BOOL)initialValidLayoutWasCalled;
- (BOOL)isInitialLayoutPass;
- (void)layoutSubviews;
- (void)removeFromSuperview;
- (void)setInitialValidLayoutWasCalled:(BOOL)a3;
- (void)setIsInitialLayoutPass:(BOOL)a3;
@end

@implementation _UIActivityContentCollectionView

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

- (void)layoutSubviews
{
  if ([(_UIActivityContentCollectionView *)self initialValidLayoutWasCalled]) {
    [(_UIActivityContentCollectionView *)self setIsInitialLayoutPass:0];
  }
  if (![(_UIActivityContentCollectionView *)self initialValidLayoutWasCalled])
  {
    v3 = [(_UIActivityContentCollectionView *)self window];

    if (v3)
    {
      [(_UIActivityContentCollectionView *)self setInitialValidLayoutWasCalled:1];
      [(_UIActivityContentCollectionView *)self setIsInitialLayoutPass:1];
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIActivityContentCollectionView;
  [(_UIActivityContentCollectionView *)&v4 layoutSubviews];
}

- (void)removeFromSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityContentCollectionView;
  [(_UIActivityContentCollectionView *)&v3 removeFromSuperview];
  [(_UIActivityContentCollectionView *)self setInitialValidLayoutWasCalled:0];
  [(_UIActivityContentCollectionView *)self setIsInitialLayoutPass:0];
}

- (BOOL)isInitialLayoutPass
{
  return self->_isInitialLayoutPass;
}

- (void)setIsInitialLayoutPass:(BOOL)a3
{
  self->_isInitialLayoutPass = a3;
}

- (BOOL)initialValidLayoutWasCalled
{
  return self->_initialValidLayoutWasCalled;
}

- (void)setInitialValidLayoutWasCalled:(BOOL)a3
{
  self->_initialValidLayoutWasCalled = a3;
}

@end