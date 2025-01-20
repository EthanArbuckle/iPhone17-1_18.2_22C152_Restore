@interface OpenCVWrapperCorners
- ($9E75A3F66B6E0EE08D18ACA558C00CC3)getCornerAtIndex:(SEL)a3;
- (OpenCVWrapperCorners)init;
- (OpenCVWrapperCorners)initWithCorners:(void *)a3;
- (id).cxx_construct;
- (unint64_t)getCornerCount;
- (void)corners;
@end

@implementation OpenCVWrapperCorners

- (OpenCVWrapperCorners)init
{
  v3.receiver = self;
  v3.super_class = (Class)OpenCVWrapperCorners;
  return [(OpenCVWrapperCorners *)&v3 init];
}

- (OpenCVWrapperCorners)initWithCorners:(void *)a3
{
  v4 = [(OpenCVWrapperCorners *)self init];
  v5 = v4;
  if (v4)
  {
    p_corners = (char *)&v4->_corners;
    if (&v5->_corners != a3) {
      sub_10000D574(p_corners, *(char **)a3, *((void *)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
    }
  }
  return v5;
}

- (unint64_t)getCornerCount
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_corners.__end_ - self->_corners.__begin_) >> 3);
}

- ($9E75A3F66B6E0EE08D18ACA558C00CC3)getCornerAtIndex:(SEL)a3
{
  *retstr = *($9E75A3F66B6E0EE08D18ACA558C00CC3 *)(*(void *)&self->var0.y + 24 * a4);
  return self;
}

- (void)corners
{
  return &self->_corners;
}

- (void).cxx_destruct
{
  begin = self->_corners.__begin_;
  if (begin)
  {
    self->_corners.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end