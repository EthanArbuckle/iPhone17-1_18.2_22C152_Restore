@interface FusionInputBands
- (FusionInputBands)init;
- (void)swapFrame:(int)a3 withFrame:(int)a4;
@end

@implementation FusionInputBands

- (FusionInputBands)init
{
  v7.receiver = self;
  v7.super_class = (Class)FusionInputBands;
  v2 = [(FusionInputBands *)&v7 init];
  if (v2)
  {
    for (uint64_t i = 8; i != 48; i += 8)
    {
      v4 = objc_alloc_init(PyramidStorage);
      v5 = *(Class *)((char *)&v2->super.isa + i);
      *(Class *)((char *)&v2->super.isa + i) = (Class)v4;
    }
  }
  return v2;
}

- (void)swapFrame:(int)a3 withFrame:(int)a4
{
  bands = self->bands;
  v6 = (id *)&self->bands[a3];
  objc_super v7 = (PyramidStorage *)*v6;
  objc_storeStrong(v6, bands[a4]);
  v8 = bands[a4];
  bands[a4] = v7;
}

- (void).cxx_destruct
{
  uint64_t v3 = 40;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end