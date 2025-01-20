@interface TUNonAnimatingLayer
- (TUNonAnimatingLayer)init;
- (TUNonAnimatingLayerDelegate)layerDelegate;
@end

@implementation TUNonAnimatingLayer

- (TUNonAnimatingLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUNonAnimatingLayer;
  v2 = [(TUNonAnimatingLayer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(TUNonAnimatingLayerDelegate);
    layerDelegate = v2->_layerDelegate;
    v2->_layerDelegate = v3;

    [(TUNonAnimatingLayer *)v2 setDelegate:v2->_layerDelegate];
  }
  return v2;
}

- (TUNonAnimatingLayerDelegate)layerDelegate
{
  return self->_layerDelegate;
}

- (void).cxx_destruct
{
}

@end