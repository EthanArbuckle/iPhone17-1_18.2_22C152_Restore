@interface RSParentAssociation
- (RSParentAssociation)init;
- (id).cxx_construct;
@end

@implementation RSParentAssociation

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_2708F1E78;
  *((_OWORD *)self + 1) = xmmword_25B5F1070;
  *((_OWORD *)self + 2) = xmmword_25B5F1080;
  *((_OWORD *)self + 3) = xmmword_25B5F1090;
  *((void *)self + 8) = 0x3F0000003E4CCCCDLL;
  *((void *)self + 9) = 0x3F40000000000003;
  *((_DWORD *)self + 20) = 3;
  *(_OWORD *)((char *)self + 84) = xmmword_25B5F10A0;
  *(_OWORD *)((char *)self + 100) = xmmword_25B5F10B0;
  *(_OWORD *)((char *)self + 116) = xmmword_25B5F10C0;
  *((_DWORD *)self + 33) = 2;
  return self;
}

- (RSParentAssociation)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSParentAssociation;
  return [(RSParentAssociation *)&v3 init];
}

@end