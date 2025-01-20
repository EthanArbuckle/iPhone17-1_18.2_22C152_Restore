@interface RSDeduplicateOpeningOpenDoor
- (RSDeduplicateOpeningOpenDoor)init;
- (id).cxx_construct;
@end

@implementation RSDeduplicateOpeningOpenDoor

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_2708F1A08;
  *(void *)((char *)self + 76) = 0x3F0000003E4CCCCDLL;
  *(void *)((char *)self + 84) = 0x3F40000000000003;
  *((_DWORD *)self + 23) = 3;
  *((_OWORD *)self + 6) = xmmword_25B5F10A0;
  *((_OWORD *)self + 7) = xmmword_25B5F10B0;
  *((_OWORD *)self + 8) = xmmword_25B5F10C0;
  *((_DWORD *)self + 36) = 2;
  *((_OWORD *)self + 1) = xmmword_25B5F1410;
  *((_OWORD *)self + 2) = xmmword_25B5F1420;
  *((_OWORD *)self + 3) = xmmword_25B5F1430;
  *((void *)self + 8) = 0x3DCCCCCD3ECCCCCDLL;
  *((_DWORD *)self + 18) = 1114636288;
  *((void *)self + 12) = 0x3F0000003F4CCCCDLL;
  *(_OWORD *)((char *)self + 108) = xmmword_25B5F1440;
  *((void *)self + 17) = 0x3F0000003F19999ALL;
  return self;
}

- (RSDeduplicateOpeningOpenDoor)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSDeduplicateOpeningOpenDoor;
  return [(RSDeduplicateOpeningOpenDoor *)&v3 init];
}

@end