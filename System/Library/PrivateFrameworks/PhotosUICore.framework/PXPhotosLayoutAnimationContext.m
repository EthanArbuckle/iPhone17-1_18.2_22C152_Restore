@interface PXPhotosLayoutAnimationContext
- (PXPhotosLayoutState)fromState;
- (PXPhotosLayoutState)toState;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFromState:(id)a3;
- (void)setToState:(id)a3;
@end

@implementation PXPhotosLayoutAnimationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toState, 0);
  objc_storeStrong((id *)&self->_fromState, 0);
}

- (void)setToState:(id)a3
{
}

- (PXPhotosLayoutState)toState
{
  return self->_toState;
}

- (void)setFromState:(id)a3
{
}

- (PXPhotosLayoutState)fromState
{
  return self->_fromState;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PXPhotosLayoutAnimationContext);
  v5 = [(PXPhotosLayoutAnimationContext *)self fromState];
  v6 = (void *)[v5 copy];
  [(PXPhotosLayoutAnimationContext *)v4 setFromState:v6];

  v7 = [(PXPhotosLayoutAnimationContext *)self toState];
  v8 = (void *)[v7 copy];
  [(PXPhotosLayoutAnimationContext *)v4 setToState:v8];

  return v4;
}

@end