@interface TITesterMathUtils
+ (double)distanceBetween:(CGPoint)a3 andPoint:(CGPoint)a4;
+ (int)solveSystemOfEquations:(float *)a3 withBMatrix:(float *)a4 size:(int)a5;
@end

@implementation TITesterMathUtils

+ (int)solveSystemOfEquations:(float *)a3 withBMatrix:(float *)a4 size:(int)a5
{
  __CLPK_integer __info = 0;
  uint64_t v8 = a5;
  size_t v9 = 4 * a5;
  v10 = (__CLPK_integer *)malloc_type_malloc(v9, 0x100004052888210uLL);
  v11 = (__CLPK_real *)malloc_type_malloc(v9 * v8, 0x5BDC9E44uLL);
  v12 = v11;
  if (a5 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 4 * v8;
    v15 = v11;
    do
    {
      v16 = a3;
      v17 = v15;
      uint64_t v18 = a5;
      do
      {
        int v19 = *(_DWORD *)v16++;
        *(_DWORD *)v17 = v19;
        v17 = (__CLPK_real *)((char *)v17 + v14);
        --v18;
      }
      while (v18);
      ++v13;
      ++v15;
      a3 = (float *)((char *)a3 + v14);
    }
    while (v13 != a5);
  }
  __CLPK_integer __nrhs = 1;
  __CLPK_integer __ldb = a5;
  sgesv_(&__ldb, &__nrhs, v11, &__ldb, v10, a4, &__ldb, &__info);
  free(v10);
  free(v12);
  return __info;
}

+ (double)distanceBetween:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return sqrt((a3.x - a4.x) * (a3.x - a4.x) + (a3.y - a4.y) * (a3.y - a4.y));
}

@end