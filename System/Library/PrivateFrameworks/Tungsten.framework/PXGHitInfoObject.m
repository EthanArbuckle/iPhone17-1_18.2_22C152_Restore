@interface PXGHitInfoObject
- ($B1B5C5B0C66BF93902DBED69AB029F5A)hitInfo;
- (PXGHitInfoObject)init;
- (PXGHitInfoObject)initWithHitInfo:(id *)a3;
- (int64_t)compare:(id)a3;
@end

@implementation PXGHitInfoObject

- (int64_t)compare:(id)a3
{
  v4 = self;
  id v5 = a3;
  uint64_t v6 = [(PXGHitInfoObject *)v4 hitInfo];
  id v7 = v5;
  uint64_t v8 = [v7 hitInfo];

  double v9 = *(double *)(v6 + 8);
  double v10 = *(double *)(v8 + 8);
  if (v9 < v10) {
    return -1;
  }
  if (v9 != v10) {
    return 1;
  }
  double v11 = *(double *)(v6 + 40);
  double v12 = *(double *)(v8 + 40);
  if (v11 < v12) {
    return -1;
  }
  if (v11 != v12) {
    return 1;
  }
  double v13 = *(double *)(v6 + 16);
  double v14 = *(double *)(v8 + 16);
  if (v13 < v14) {
    return -1;
  }
  if (v13 != v14) {
    return 1;
  }
  if (*(_DWORD *)v6 > *(_DWORD *)v8) {
    return -1;
  }
  return *(_DWORD *)v6 != *(_DWORD *)v8;
}

- ($B1B5C5B0C66BF93902DBED69AB029F5A)hitInfo
{
  return ($B1B5C5B0C66BF93902DBED69AB029F5A *)&self->_hitInfo;
}

- (PXGHitInfoObject)initWithHitInfo:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGHitInfoObject;
  return [(PXGHitInfoObject *)&v4 init];
}

- (PXGHitInfoObject)init
{
  long long v5 = 0u;
  long long v6 = 0u;
  uint64_t v3 = 0xFFFFFFFFLL;
  int64x2_t v4 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  return [(PXGHitInfoObject *)self initWithHitInfo:&v3];
}

@end