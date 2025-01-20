@interface SCPacketDropDetector
- (id).cxx_construct;
- (void)handlePacketWithReportID:(unsigned __int8)a3 frameIndex:(unsigned __int16)a4 size:(unint64_t)a5;
@end

@implementation SCPacketDropDetector

- (void)handlePacketWithReportID:(unsigned __int8)a3 frameIndex:(unsigned __int16)a4 size:(unint64_t)a5
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end