@interface RSDriftDetection
- (RSDriftDetection)init;
- (id).cxx_construct;
@end

@implementation RSDriftDetection

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_2708F1468;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  *((_OWORD *)self + 3) = xmmword_25B5F1100;
  *((_OWORD *)self + 4) = xmmword_25B5F1110;
  *((_OWORD *)self + 5) = xmmword_25B5F1120;
  *((void *)self + 12) = 0x33A03126FLL;
  *((_DWORD *)self + 4) = 0;
  *(_OWORD *)((char *)self + 104) = xmmword_25B5F1130;
  *((void *)self + 15) = 4;
  return self;
}

- (void).cxx_destruct
{
}

- (RSDriftDetection)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSDriftDetection;
  return [(RSDriftDetection *)&v3 init];
}

@end