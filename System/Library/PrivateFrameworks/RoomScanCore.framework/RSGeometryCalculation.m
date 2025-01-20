@interface RSGeometryCalculation
- (RSGeometryCalculation)init;
@end

@implementation RSGeometryCalculation

- (void).cxx_destruct
{
}

- (RSGeometryCalculation)init
{
  v8.receiver = self;
  v8.super_class = (Class)RSGeometryCalculation;
  v2 = [(RSGeometryCalculation *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(RSGeometryMeta);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *((void *)v2 + 2) = 0x18000000003;
    v2[24] = 0;
    *(void *)(v2 + 28) = 0x4000000180;
    v2[36] = 1;
    *((_DWORD *)v2 + 10) = 10;
    *((_WORD *)v2 + 22) = 256;
    *((_DWORD *)v2 + 12) = 1022739087;
    v2[52] = 1;
    *((void *)v2 + 7) = 0x3E99999A0000000CLL;
    *((_DWORD *)v2 + 16) = 0;
    uint64_t v5 = *((void *)v2 + 1);
    if (v5)
    {
      *(_DWORD *)(v5 + 28) = 384;
      uint64_t v6 = *((void *)v2 + 1);
      if (v6) {
        *(_DWORD *)(v6 + 32) = *((_DWORD *)v2 + 14);
      }
    }
    *((_DWORD *)v2 + 17) = *((_DWORD *)v2 + 8);
  }
  return (RSGeometryCalculation *)v2;
}

@end