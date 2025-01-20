@interface ODDChoose
- (ODDChoose)init;
- (id)description;
- (id)otherwise;
- (id)whens;
- (void)addWhen:(id)a3;
- (void)setOtherwise:(id)a3;
@end

@implementation ODDChoose

- (ODDChoose)init
{
  v6.receiver = self;
  v6.super_class = (Class)ODDChoose;
  v2 = [(ODDChoose *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mWhens = v2->mWhens;
    v2->mWhens = v3;
  }
  return v2;
}

- (id)whens
{
  return self->mWhens;
}

- (void)addWhen:(id)a3
{
}

- (id)otherwise
{
  return self->mOtherwise;
}

- (void)setOtherwise:(id)a3
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)ODDChoose;
  v2 = [(ODDLayoutObject *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOtherwise, 0);
  objc_storeStrong((id *)&self->mWhens, 0);
}

@end