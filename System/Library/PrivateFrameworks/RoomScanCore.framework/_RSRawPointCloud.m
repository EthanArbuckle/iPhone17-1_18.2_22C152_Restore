@interface _RSRawPointCloud
- (id).cxx_construct;
- (uint64_t)points;
- (unint64_t)count;
@end

@implementation _RSRawPointCloud

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

- (uint64_t)points
{
  return *(void *)(a1 + 8);
}

- (unint64_t)count
{
  return (self[2].super.isa - self[1].super.isa) >> 4;
}

@end