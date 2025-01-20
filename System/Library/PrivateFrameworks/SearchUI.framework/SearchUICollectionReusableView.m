@interface SearchUICollectionReusableView
- (BOOL)_disableRasterizeInAnimations;
- (SearchUICollectionReusableView)initWithFrame:(CGRect)a3;
- (id)contentView;
@end

@implementation SearchUICollectionReusableView

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (SearchUICollectionReusableView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUICollectionReusableView;
  v3 = -[SearchUICollectionReusableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SearchUICollectionReusableView *)v3 contentView];
    if (v5)
    {
      [(SearchUICollectionReusableView *)v4 addSubview:v5];
      +[SearchUIAutoLayout fillContainerWithView:v5];
    }
  }
  return v4;
}

- (id)contentView
{
  return 0;
}

@end