@interface RSOnlineOfflineAssociation
- (RSOnlineOfflineAssociation)init;
- (id).cxx_construct;
@end

@implementation RSOnlineOfflineAssociation

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_2708F1610;
  *((void *)self + 8) = 0x3F0000003E4CCCCDLL;
  *((void *)self + 9) = 0x3F40000000000003;
  *((_DWORD *)self + 20) = 3;
  *(_OWORD *)((char *)self + 84) = xmmword_25B5F10A0;
  *(_OWORD *)((char *)self + 100) = xmmword_25B5F10B0;
  *(_OWORD *)((char *)self + 116) = xmmword_25B5F10C0;
  *((_DWORD *)self + 33) = 2;
  *((unsigned char *)self + 136) = 1;
  *((_OWORD *)self + 1) = xmmword_25B5F1760;
  *((_OWORD *)self + 2) = xmmword_25B5F1770;
  *((_OWORD *)self + 3) = xmmword_25B5F1090;
  *(void *)((char *)self + 84) = 0x3F0000003F4CCCCDLL;
  *((_OWORD *)self + 6) = xmmword_25B5F1440;
  *(void *)((char *)self + 124) = 0x3F0000003F19999ALL;
  return self;
}

- (RSOnlineOfflineAssociation)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSOnlineOfflineAssociation;
  result = [(RSOnlineOfflineAssociation *)&v3 init];
  if (result) {
    result->_isCurveEnabled = 1;
  }
  return result;
}

@end