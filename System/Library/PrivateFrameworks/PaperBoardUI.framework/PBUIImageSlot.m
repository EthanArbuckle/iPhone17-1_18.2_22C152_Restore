@interface PBUIImageSlot
- (BSInvalidatable)lifetimeToken;
- (UIImage)image;
- (id)_deferredImageSlot;
- (id)_initWithImage:(id)a3 lifetimeToken:(id)a4;
- (void)_setImage:(id)a3;
- (void)dealloc;
@end

@implementation PBUIImageSlot

- (id)_initWithImage:(id)a3 lifetimeToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PBUIImageSlot;
  v9 = [(PBUIImageSlot *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_image, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_lifetimeToken invalidate];
  lifetimeToken = self->_lifetimeToken;
  self->_lifetimeToken = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBUIImageSlot;
  [(PBUIImageSlot *)&v4 dealloc];
}

- (id)_deferredImageSlot
{
  return 0;
}

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 8, 1);
}

- (void)_setImage:(id)a3
{
}

- (BSInvalidatable)lifetimeToken
{
  return self->_lifetimeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetimeToken, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end