@interface bb74bdd798ceadff5c1f0c2b
- (id)initW9ab3a732e8c7a246dd8:(rp6S0jzg *)a3 c0147d93538f22fb3e2a91a0:(unint64_t)a4;
- (rp6S0jzg)c443a638ffc3d34ce6b8ac05;
- (void)dealloc;
@end

@implementation bb74bdd798ceadff5c1f0c2b

- (id)initW9ab3a732e8c7a246dd8:(rp6S0jzg *)a3 c0147d93538f22fb3e2a91a0:(unint64_t)a4
{
  id result = [(bb74bdd798ceadff5c1f0c2b *)self init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 2) = a4;
  }
  return result;
}

- (void)dealloc
{
  cf96f37f8dfcefb8f3d84a15 = self->cf96f37f8dfcefb8f3d84a15;
  if (cf96f37f8dfcefb8f3d84a15)
  {
    sub_21BEE4((uint64_t)cf96f37f8dfcefb8f3d84a15);
    self->cf96f37f8dfcefb8f3d84a15 = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)bb74bdd798ceadff5c1f0c2b;
  [(bb74bdd798ceadff5c1f0c2b *)&v4 dealloc];
}

- (rp6S0jzg)c443a638ffc3d34ce6b8ac05
{
  return self->cf96f37f8dfcefb8f3d84a15;
}

@end