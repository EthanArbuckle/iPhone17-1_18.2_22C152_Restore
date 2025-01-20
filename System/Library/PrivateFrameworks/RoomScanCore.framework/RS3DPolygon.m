@interface RS3DPolygon
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)points;
- (unint64_t)count;
@end

@implementation RS3DPolygon

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
  if (!v7) {
    return 0;
  }
  v10 = self + 1;
  Class isa = self[1].super.isa;
  Class v9 = v10[1].super.isa;
  v15.receiver = v7;
  v15.super_class = (Class)RS3DPolygon;
  id v11 = [(RS3DPolygon *)&v15 init];
  v12 = (void **)v11;
  if (v11)
  {
    int64_t v13 = v9 - isa;
    sub_25B469590((char **)v11 + 1, v13 >> 4);
    memcpy(v12[1], isa, v13);
  }
  return v12;
}

- (uint64_t)points
{
  return *(void *)(a1 + 8);
}

- (unint64_t)count
{
  return (self[2].super.isa - self[1].super.isa) >> 4;
}

@end