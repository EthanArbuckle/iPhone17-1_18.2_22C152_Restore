@interface _RoutePlanningCollectionView
- (id)layoutHandler;
- (void)layoutSubviews;
- (void)setLayoutHandler:(id)a3;
@end

@implementation _RoutePlanningCollectionView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_RoutePlanningCollectionView;
  [(_RoutePlanningCollectionView *)&v5 layoutSubviews];
  v3 = [(_RoutePlanningCollectionView *)self layoutHandler];

  if (v3)
  {
    v4 = [(_RoutePlanningCollectionView *)self layoutHandler];
    v4[2]();
  }
}

- (id)layoutHandler
{
  return self->_layoutHandler;
}

- (void)setLayoutHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end