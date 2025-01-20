@interface RS2DPolygon
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)points;
- (unint64_t)count;
@end

@implementation RS2DPolygon

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  isa = self[1].super.isa;
  if (isa)
  {
    self[2].super.isa = isa;
    operator delete(isa);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  Class isa = self[1].super.isa;
  unint64_t v9 = (self[2].super.isa - isa) >> 3;

  return sub_25B5483C0(v7, v9, isa);
}

- (uint64_t)points
{
  return *(void *)(a1 + 8);
}

- (unint64_t)count
{
  return (self[2].super.isa - self[1].super.isa) >> 3;
}

@end