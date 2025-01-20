@interface ContaineeState
- (ContaineeProtocol)viewController;
- (ContaineeState)initWithContainee:(id)a3;
- (unint64_t)layoutForStyle:(unint64_t)a3;
- (void)setLayout:(unint64_t)a3 forStyle:(unint64_t)a4;
- (void)setViewController:(id)a3;
@end

@implementation ContaineeState

- (ContaineeProtocol)viewController
{
  return self->_viewController;
}

- (ContaineeState)initWithContainee:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ContaineeState;
  v6 = [(ContaineeState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)setLayout:(unint64_t)a3 forStyle:(unint64_t)a4
{
  self->layoutByStyle[a4] = a3;
  if (a4 == 1)
  {
    self->layoutByStyle[5] = 4 * (a3 == 3);
  }
  else if (a4 == 5)
  {
    unint64_t v4 = 2;
    if (a3 == 4) {
      unint64_t v4 = 3;
    }
    self->layoutByStyle[1] = v4;
  }
}

- (unint64_t)layoutForStyle:(unint64_t)a3
{
  return self->layoutByStyle[a3];
}

- (void)setViewController:(id)a3
{
}

@end