@interface PPKLayoutCompleteCollectionView
- (BOOL)laidOut;
- (PPKLayoutCompleteCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4 layoutCompletion:(id)a5;
- (id)layoutCompletion;
- (void)layoutSubviews;
- (void)setLaidOut:(BOOL)a3;
- (void)setLayoutCompletion:(id)a3;
@end

@implementation PPKLayoutCompleteCollectionView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PPKLayoutCompleteCollectionView;
  [(PPKLayoutCompleteCollectionView *)&v4 layoutSubviews];
  if (![(PPKLayoutCompleteCollectionView *)self laidOut])
  {
    [(PPKLayoutCompleteCollectionView *)self setLaidOut:1];
    v3 = [(PPKLayoutCompleteCollectionView *)self layoutCompletion];
    v3[2]();
  }
}

- (PPKLayoutCompleteCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4 layoutCompletion:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PPKLayoutCompleteCollectionView;
  id v10 = a5;
  v11 = -[PPKLayoutCompleteCollectionView initWithFrame:collectionViewLayout:](&v13, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
  -[PPKLayoutCompleteCollectionView setLayoutCompletion:](v11, "setLayoutCompletion:", v10, v13.receiver, v13.super_class);

  return v11;
}

- (BOOL)laidOut
{
  return self->_laidOut;
}

- (void)setLaidOut:(BOOL)a3
{
  self->_laidOut = a3;
}

- (id)layoutCompletion
{
  return self->_layoutCompletion;
}

- (void)setLayoutCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end