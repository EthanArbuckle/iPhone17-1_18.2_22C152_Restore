@interface RSMajorViewInfo
- (RSMajorViewInfo)init;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RSMajorViewInfo

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  Class isa = self[1].super.isa;
  if (isa)
  {
    *(void *)self[1]._anon_8 = isa;
    operator delete(isa);
  }
  v4 = *(void **)self->_anon_38;
  if (v4)
  {
    *(void *)&self->_anon_38[8] = v4;
    operator delete(v4);
  }
  v5 = *(void **)self->_anon_20;
  if (v5)
  {
    *(void *)&self->_anon_20[8] = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_8;
  if (v6)
  {
    *(void *)&self->_anon_8[8] = v6;
    operator delete(v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void **)objc_opt_new();
  sub_25B5308B0(*(_OWORD **)self->_anon_8, *(_OWORD **)&self->_anon_8[8], v4 + 1);
  sub_25B5308B0(*(_OWORD **)self->_anon_20, *(_OWORD **)&self->_anon_20[8], v4 + 4);
  sub_25B5308B0(*(_OWORD **)self->_anon_38, *(_OWORD **)&self->_anon_38[8], v4 + 7);
  sub_25B5308B0((_OWORD *)self[1].super.isa, *(_OWORD **)self[1]._anon_8, v4 + 10);
  return v4;
}

- (RSMajorViewInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSMajorViewInfo;
  result = [(RSMajorViewInfo *)&v3 init];
  if (result)
  {
    *(void *)&result->_anon_8[8] = *(void *)result->_anon_8;
    *(void *)&result->_anon_20[8] = *(void *)result->_anon_20;
    *(void *)&result->_anon_38[8] = *(void *)result->_anon_38;
    *(void *)result[1]._anon_8 = result[1].super.isa;
  }
  return result;
}

@end