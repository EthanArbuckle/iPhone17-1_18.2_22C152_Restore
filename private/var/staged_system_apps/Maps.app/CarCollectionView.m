@interface CarCollectionView
- (id)accessibilityIdentifier;
- (id)accessoryViewAtEdge:(int64_t)a3;
- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4;
@end

@implementation CarCollectionView

- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4
{
  id v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CarCollectionView;
  [(CarCollectionView *)&v7 setAccessoryView:v5 atEdge:4];
  id v6 = [v5 _mapsCar_injectBlurView];
}

- (id)accessoryViewAtEdge:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarCollectionView;
  v3 = [(CarCollectionView *)&v5 accessoryViewAtEdge:4];

  return v3;
}

- (id)accessibilityIdentifier
{
  return @"CarCollectionView";
}

@end