void sub_1D3CD1250(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3CD24AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3CD2FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3CD3904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v32 - 120), 8);
  objc_sync_exit(v31);
  _Unwind_Resume(a1);
}

void sub_1D3CD93B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 168), 8);
  _Unwind_Resume(a1);
}

double MachTimeToSecs(unint64_t a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v3) = info.denom;
  LODWORD(v2) = info.numer;
  return (double)a1 * (double)v2 / (double)v3 / 1000000000.0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1D3CDE9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__tree<gloria::TileId>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<gloria::TileId>::destroy(a1, *a2);
    std::__tree<gloria::TileId>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t gloria::TileId::TileId(uint64_t this, unint64_t a2)
{
  int v2 = __clz(a2);
  LOBYTE(v2) = (int)((63 - v2 + (((63 - v2) & 0x80u) >> 7)) << 24) >> 25;
  *(unsigned char *)(this + 8) = v2;
  *(void *)this = a2 - gloria::LEADING_BITS_VALUE_LUT[v2];
  return this;
}

{
  int v2;

  int v2 = __clz(a2);
  LOBYTE(v2) = (int)((63 - v2 + (((63 - v2) & 0x80u) >> 7)) << 24) >> 25;
  *(unsigned char *)(this + 8) = v2;
  *(void *)this = a2 - gloria::LEADING_BITS_VALUE_LUT[v2];
  return this;
}

void gloria::TileId::Neighbors(gloria::TileId *this@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  gloria::TileId::ToXYZ(this, &v21);
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)a3 = a3 + 8;
  double v6 = ldexp(1.0, *((unsigned __int8 *)this + 8));
  uint64_t v7 = v21.i64[0] - a2;
  uint64_t v8 = v21.i64[0] + a2;
  if (v7 <= v8)
  {
    uint64_t v9 = (uint64_t)v6;
    uint64_t v10 = a2;
    uint64_t v11 = (v21.i64[1] - a2) & ~((v21.i64[1] - a2) >> 63);
    uint64_t v12 = v21.i64[1] + v10;
    if ((uint64_t)v6 - 1 >= v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = (uint64_t)v6 - 1;
    }
    do
    {
      uint64_t v14 = v11;
      if (v11 <= v13)
      {
        do
        {
          v15 = (gloria::MortonUtils *)v7;
          if (v7 < 0) {
            v15 = (gloria::MortonUtils *)(v7 % v9 + v9);
          }
          char v16 = *((unsigned char *)this + 8);
          gloria::MortonUtils::XYToQuadId(v15, v14 % v9);
          unint64_t v19 = v17;
          char v20 = v16;
          std::__tree<gloria::TileId>::__emplace_unique_key_args<gloria::TileId,gloria::TileId const&>((uint64_t **)a3, &v19, (uint64_t)&v19);
          ++v14;
        }
        while (v13 + 1 != v14);
      }
    }
    while (v7++ != v8);
  }
}

void sub_1D3CDEBBC(_Unwind_Exception *a1)
{
  std::__tree<gloria::TileId>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<gloria::TileId>::__emplace_unique_key_args<gloria::TileId,gloria::TileId const&>(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  double v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        v5 = *v8;
        double v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      v5 = v8[1];
      if (!v5)
      {
        double v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = operator new(0x30uLL);
    v10[4] = *(void *)a3;
    *((unsigned char *)v10 + 40) = *(unsigned char *)(a3 + 8);
    std::__tree<gloria::TileId>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *std::__tree<gloria::TileId>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      int v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      unint64_t v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              unint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            unint64_t v3 = v9[2];
            int v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *unint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *int v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            unint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          unint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        int v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *int v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void gloria::TileId::NeighborsWithinRadius(gloria::TileId *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  unsigned int v3 = a2;
  double v4 = 40075016.7 / (double)(unint64_t)(256 << *((unsigned char *)this + 8)) * 256.0;
  if (v4 * 0.5 >= (double)v3) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = vcvtpd_u64_f64((double)v3 / v4);
  }
  gloria::TileId::Neighbors(this, v5, a3);
}

void sub_1D3CDEF90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t gloria::TileId::GetEncodedTileId(gloria::TileId *this)
{
  return *(void *)this | gloria::LEADING_BITS_VALUE_LUT[*((unsigned __int8 *)this + 8)];
}

void gloria::TileId::FromLatLng(gloria::TileId *this@<X0>, double *a2@<X1>, const double *a3@<X2>, uint64_t a4@<X8>)
{
  gloria::TileCoordinate::FromLatLng(this, a2, a3, &v8);
  gloria::MortonUtils::XYToQuadId((gloria::MortonUtils *)v8.i64[0], v8.i64[1]);
  char v6 = v9;
  *(void *)a4 = v7;
  *(unsigned char *)(a4 + 8) = v6;
}

double gloria::MortonUtils::XYToQuadId(gloria::MortonUtils *this, uint64_t a2)
{
  v2.i64[0] = a2;
  v2.i64[1] = (uint64_t)this;
  v3.i64[0] = 0xFFFFFFFFLL;
  v3.i64[1] = 0xFFFFFFFFLL;
  int8x16_t v4 = vorrq_s8((int8x16_t)vshlq_n_s64(v2, 0x10uLL), vandq_s8((int8x16_t)v2, v3));
  v3.i64[0] = 0xFFFF0000FFFFLL;
  v3.i64[1] = 0xFFFF0000FFFFLL;
  int64x2_t v5 = (int64x2_t)vandq_s8(v4, v3);
  unsigned long long v6 = *(_OWORD *)&vorrq_s8((int8x16_t)vshlq_n_s64(v5, 8uLL), (int8x16_t)v5) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL);
  unsigned long long v7 = *(_OWORD *)&vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v6, 4uLL), (int8x16_t)v6) & __PAIR128__(0xFF0FFF0FFF0FFF0FLL, 0xFF0FFF0FFF0FFF0FLL);
  v3.i64[0] = 0x3333333333333333;
  v3.i64[1] = 0x3333333333333333;
  int8x16_t v8 = vandq_s8(vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v7, 2uLL), (int8x16_t)v7), v3);
  int8x16_t v9 = (int8x16_t)vshlq_u64((uint64x2_t)v8, (uint64x2_t)xmmword_1D3D95A00);
  v8.i64[0] *= 2;
  int64x2_t v10 = (int64x2_t)vandq_s8(vorrq_s8(v9, v8), (int8x16_t)xmmword_1D3D95A10);
  *(void *)&double result = vorrq_s8((int8x16_t)v10, (int8x16_t)vdupq_laneq_s64(v10, 1)).u64[0];
  return result;
}

int8x16_t gloria::TileCoordinate::FromLatLng@<Q0>(gloria::TileCoordinate *this@<X0>, double *a2@<X1>, const double *a3@<X2>, int8x16_t *a4@<X8>)
{
  double v7 = fmax(*a2, -180.0);
  double v8 = fmax(*(double *)this, -85.0511288);
  if (v7 >= 180.0) {
    double v9 = 1.0;
  }
  else {
    double v9 = (v7 + 180.0) / 360.0;
  }
  float64_t v18 = v9;
  double v10 = v8 * 3.14159265 / 180.0;
  if (v8 >= 85.0511288) {
    double v10 = 1.48442223;
  }
  long double v11 = sin(v10);
  long double v12 = log((v11 + 1.0) / (1.0 - v11));
  __int8 v13 = *(unsigned char *)a3;
  v14.f64[0] = v18;
  v14.f64[1] = v12 / -12.5663706 + 0.5;
  int8x16_t v15 = (int8x16_t)vcvtq_u64_f64(vrndmq_f64(vmulq_n_f64(v14, (double)(unint64_t)(1 << *(unsigned char *)a3))));
  int8x16_t v16 = (int8x16_t)vdupq_n_s64((1 << *(unsigned char *)a3) - 1);
  int8x16_t result = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v15, (uint64x2_t)v16), v16, v15);
  *a4 = result;
  a4[1].i8[0] = v13;
  return result;
}

double gloria::TileId::TileSize(gloria::TileId *this)
{
  return 40075016.7 / (double)(unint64_t)(256 << *((unsigned char *)this + 8)) * 256.0;
}

double _TBGloriaBoundingBoxFromLocation(double a1, double a2, char a3)
{
  double v6 = a2;
  double v7 = a1;
  char v5 = a3;
  gloria::TileId::FromLatLng((gloria::TileId *)&v7, &v6, (const double *)&v5, (uint64_t)v4);
  return gloria::TileId::ToBBOX((gloria::TileId *)v4);
}

double gloria::TileId::ToBBOX(gloria::TileId *this)
{
  gloria::TileId::ToXYZ(this, (int8x16_t *)&v6);
  int v1 = v7;
  int64x2_t v4 = vaddq_s64(v6, vdupq_n_s64(1uLL));
  unsigned __int8 v5 = v7;
  double v2 = gloria::TileCoordinate::YToLat((gloria::TileCoordinate *)&v6);
  gloria::TileCoordinate::YToLat((gloria::TileCoordinate *)&v4);
  ldexp(1.0, v1);
  ldexp(1.0, v1);
  return v2;
}

long double gloria::TileCoordinate::YToLat(gloria::TileCoordinate *this)
{
  double v1 = (double)*((unint64_t *)this + 1) * -6.28318531;
  long double v2 = v1 / ldexp(1.0, *((unsigned __int8 *)this + 16)) + 3.14159265;
  double v3 = exp(v2);
  long double v4 = exp(-v2);
  return atan((v3 - v4) * 0.5) * 57.2957795;
}

int8x16_t gloria::TileId::ToXYZ@<Q0>(gloria::TileId *this@<X0>, int8x16_t *a2@<X8>)
{
  v2.i64[0] = *(void *)this & 0x1111111111111111 | ((*(void *)this & 0x5555555555555555uLL) >> 1) & 0x3333333333333333;
  v2.i64[1] = (*(void *)this >> 1) & 0x4444444444444444 | *(void *)this & 0x2222222222222222;
  int8x16_t v3 = (int8x16_t)vshlq_u64(v2, (uint64x2_t)xmmword_1D3D959F0);
  v2.i64[1] = (unint64_t)v2.i64[1] >> 1;
  __int8 v4 = *((unsigned char *)this + 8);
  int8x16_t v5 = vorrq_s8(v3, (int8x16_t)v2);
  v3.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v3.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  int8x16_t v6 = vandq_s8(v5, v3);
  v3.i64[0] = 0xFF00FF00FF00FFLL;
  v3.i64[1] = 0xFF00FF00FF00FFLL;
  int8x16_t v7 = vandq_s8(vorrq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v6, 4uLL), v6), v3);
  int8x16_t v8 = vorrq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v7, 8uLL), v7);
  v9.i64[0] = 4294901760;
  v9.i64[1] = 4294901760;
  int8x16_t v10 = vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v8, 0x10uLL), v9);
  v9.i64[0] = 0xFFFFLL;
  v9.i64[1] = 0xFFFFLL;
  int8x16_t result = vorrq_s8(v10, vandq_s8(v8, v9));
  *a2 = result;
  a2[1].i8[0] = v4;
  return result;
}

void sub_1D3CDFB40(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1D3CE0204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3CE1CF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void __WiFiManagerLocationManagerVisitCallback(void *a1, uint64_t a2)
{
  if (a1)
  {
    [a1 _handleLocationManagerVisitCallbackWithVisit:a2];
  }
  else
  {
    NSLog(&cfstr_SCallbackconte.isa, "__WiFiManagerLocationManagerVisitCallback");
  }
}

float TBCentroidDegreesToRadians(float a1)
{
  return a1 * 0.0174532925;
}

float TBCentroidRadiansToDegrees(float a1)
{
  return a1 * 57.2957795;
}

void sub_1D3CEDF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3CEE5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void *TBMacAddressFromString(void *result)
{
  if (result)
  {
    id v1 = [result stringByReplacingOccurrencesOfString:@":" withString:&stru_1F2B5AC50];
    unint64_t v2 = strtoull((const char *)[v1 UTF8String], 0, 16);

    return (void *)v2;
  }
  return result;
}

uint64_t TBMacAdressFromLong(uint64_t a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x:%02x:%02x:%02x", BYTE5(a1), BYTE4(a1), BYTE3(a1), BYTE2(a1), BYTE1(a1), a1);
}

uint64_t _createLexiconWithLocale(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v4 = *MEMORY[0x1E4F72450];
  v5[0] = v1;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = LXLexiconCreate();

  return v2;
}

void sub_1D3CF0C18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D3CF1174()
{
}

void sub_1D3CF118C(_Unwind_Exception *a1)
{
}

void sub_1D3CF1A98(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D3CF422C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3CF4F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3CF59B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1D3CF5BDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3CF5CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

id WiFiUsageFaultReasonStringMap(unint64_t a1)
{
  if (WiFiUsageFaultReasonStringMap_onceToken != -1) {
    dispatch_once(&WiFiUsageFaultReasonStringMap_onceToken, &__block_literal_global_2);
  }
  if (a1 > 0x21) {
    WiFiUsageFaultReasonStringMap_cold_3(a1);
  }
  uint64_t v2 = [NSNumber numberWithLong:a1];
  if (!v2) {
    WiFiUsageFaultReasonStringMap_cold_1(a1);
  }
  uint64_t v3 = (void *)v2;
  uint64_t v4 = [(id)gWiFiUsageFaultReasonStringMap objectForKey:v2];

  if (!v4) {
    WiFiUsageFaultReasonStringMap_cold_2(a1);
  }
  int8x16_t v5 = [(id)gWiFiUsageFaultReasonStringMap objectForKey:v3];

  return v5;
}

void __WiFiUsageFaultReasonStringMap_block_invoke()
{
  v3[34] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F2B93DF0;
  v2[1] = &unk_1F2B93E08;
  v3[0] = @"kWiFiUsageFaultReasonUnknown";
  v3[1] = @"kWiFiUsageFaultReasonSymptomLowRssiDnsFailure";
  v2[2] = &unk_1F2B93E20;
  v2[3] = &unk_1F2B93E38;
  v3[2] = @"kWiFiUsageFaultReasonSymptomLowRssiArpFailure";
  v3[3] = @"kWiFiUsageFaultReasonSymptomLowRssiDataStall";
  v2[4] = &unk_1F2B93E50;
  v2[5] = &unk_1F2B93E68;
  v3[4] = @"kWiFiUsageFaultReasonSymptomLowRssiShortFlow";
  v3[5] = @"kWiFiUsageFaultReasonSymptomLowRssiRTTFailure";
  v2[6] = &unk_1F2B93E80;
  v2[7] = &unk_1F2B93E98;
  v3[6] = @"kWiFiUsageFaultReasonDatapathStall";
  v3[7] = @"kWiFiUsageFaultReasonWatchdogReset";
  v2[8] = &unk_1F2B93EB0;
  v2[9] = &unk_1F2B93EC8;
  v3[8] = @"kWiFiUsageFaultReasonSsidBlocklisted";
  v3[9] = @"kWiFiUsageFaultReasonBssidBlocklisted";
  v2[10] = &unk_1F2B93EE0;
  v2[11] = &unk_1F2B93EF8;
  v3[10] = @"kWiFiUsageFaultReasonSlowWiFiAP";
  v3[11] = @"kWiFiUsageFaultReasonPrivateMACFallback";
  v2[12] = &unk_1F2B93F10;
  v2[13] = &unk_1F2B93F28;
  v3[12] = @"kWiFiUsageFaultReasonDelayedAutoJoin";
  v3[13] = @"kWiFiUsageFaultReasonDhcpFailure";
  v2[14] = &unk_1F2B93F40;
  v2[15] = &unk_1F2B93F58;
  v3[14] = @"kWiFiUsageFaultReasonLinkTestLocalCheckFailed";
  v3[15] = @"kWiFiUsageFaultReasonLinkTestInternetCheckFailed";
  v2[16] = &unk_1F2B93F70;
  v2[17] = &unk_1F2B93F88;
  v3[16] = @"kWiFiUsageFaultReasonLinkTestDNSCheckFailed";
  v3[17] = @"kWiFiUsageFaultReasonArpFailure";
  v2[18] = &unk_1F2B93FA0;
  v2[19] = &unk_1F2B93FB8;
  v3[18] = @"kWiFiUsageFaultReasonSlowWiFiDnsFailure";
  v3[19] = @"kWiFiUsageFaultReasonSlowWiFiDUT";
  v2[20] = &unk_1F2B93FD0;
  v2[21] = &unk_1F2B93FE8;
  v3[20] = @"kWiFiUsageFaultReasonUserOverridesCellularOutranking";
  v3[21] = @"kWiFiUsageFaultReasonFirmwareTrap";
  v2[22] = &unk_1F2B94000;
  v2[23] = &unk_1F2B94018;
  v3[22] = @"kWiFiUsageFaultReasonSleepPowerBudgetExceeded";
  v3[23] = @"kWiFiUsageFaultReasonLowPowerBudgetExceeded";
  v2[24] = &unk_1F2B94030;
  v2[25] = &unk_1F2B94048;
  v3[24] = @"kWiFiUsageFaultReasonDextCrashed";
  v3[25] = @"kWiFiUsageFaultReasonSiriTimedOut";
  v2[26] = &unk_1F2B94060;
  v2[27] = &unk_1F2B94078;
  v3[26] = @"kWiFiUsageFaultReasonApsdTimedOut";
  v3[27] = @"kWiFiUsageFaultReasonBrokenBackhaulLinkFailed";
  v2[28] = &unk_1F2B94090;
  v2[29] = &unk_1F2B940A8;
  v3[28] = @"kWiFiUsageFaultReasonLinkTestSiriTCPCheckFailed";
  v3[29] = @"kWiFiUsageFaultReasonLinkTestSiriTLSCheckFailed";
  v2[30] = &unk_1F2B940C0;
  v2[31] = &unk_1F2B940D8;
  v3[30] = @"kWiFiUsageFaultReasonAirplayConnectionStall";
  v3[31] = @"kWiFiUsageFaultReasonAirplayBufferedAudioUnderrun";
  v2[32] = &unk_1F2B940F0;
  v2[33] = &unk_1F2B94108;
  v3[32] = @"kWiFiUsageFaultReasonAirplayRealtimeAudioUnderrun";
  v3[33] = @"kWiFiUsageFaultReasonHomeKitFault";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:34];
  uint64_t v1 = (void *)gWiFiUsageFaultReasonStringMap;
  gWiFiUsageFaultReasonStringMap = v0;
}

id WiFiFaultHandlingLimitsStringMap(uint64_t a1)
{
  if (WiFiFaultHandlingLimitsStringMap_onceToken != -1) {
    dispatch_once(&WiFiFaultHandlingLimitsStringMap_onceToken, &__block_literal_global_187);
  }
  uint64_t v2 = (void *)gWiFiFaultHandlingLimitsStringMap;
  uint64_t v3 = [NSNumber numberWithLong:a1];
  uint64_t v4 = [v2 objectForKey:v3];

  return v4;
}

void __WiFiFaultHandlingLimitsStringMap_block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F2B94120;
  v2[1] = &unk_1F2B94138;
  v3[0] = @"WiFiFaultHandlingNotIgnored";
  v3[1] = @"WiFiFaultHandlingLimitedRateLastFaultIndication";
  v2[2] = &unk_1F2B94150;
  v2[3] = &unk_1F2B94168;
  v3[2] = @"WiFiFaultHandlingLimitedLinkOrPrimaryNotSet";
  v3[3] = @"WiFiFaultHandlingLimitedRateMinBrokenLinkDetectedInterval";
  v2[4] = &unk_1F2B94180;
  v3[4] = @"WiFiFaultHandlingLimitedRecoveryDisabled";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  uint64_t v1 = (void *)gWiFiFaultHandlingLimitsStringMap;
  gWiFiFaultHandlingLimitsStringMap = v0;
}

void sub_1D3CF66C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3CF7B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3CFE170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38)
{
  _Unwind_Resume(a1);
}

void sub_1D3D08B48(_Unwind_Exception *a1)
{
}

void sub_1D3D098D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D09B64(_Unwind_Exception *a1)
{
}

uint64_t WiFiUsageConnectionQualityRecordConvertDisconnectReasonToGEOReason(uint64_t a1)
{
  switch(a1)
  {
    case 1000:
      uint64_t result = 6;
      break;
    case 1001:
      uint64_t result = 8;
      break;
    case 1002:
      uint64_t result = 7;
      break;
    case 1003:
      uint64_t result = 9;
      break;
    case 1004:
      uint64_t result = 10;
      break;
    case 1005:
      uint64_t result = 11;
      break;
    case 1006:
      uint64_t result = 12;
      break;
    case 1007:
      uint64_t result = 13;
      break;
    case 1008:
      uint64_t result = 14;
      break;
    case 1009:
      uint64_t result = 15;
      break;
    case 1010:
      uint64_t result = 16;
      break;
    case 1011:
      uint64_t result = 17;
      break;
    case 1012:
      uint64_t result = 18;
      break;
    case 1013:
      uint64_t result = 19;
      break;
    case 1014:
      uint64_t result = 20;
      break;
    case 1015:
      uint64_t result = 21;
      break;
    case 1016:
      uint64_t result = 22;
      break;
    case 1017:
      uint64_t result = 23;
      break;
    case 1018:
      uint64_t result = 24;
      break;
    case 1019:
      uint64_t result = 25;
      break;
    case 1020:
      uint64_t result = 26;
      break;
    case 1021:
      uint64_t result = 28;
      break;
    default:
      uint64_t v2 = a1 - 1;
      uint64_t result = 1;
      switch(v2)
      {
        case 0:
          return result;
        case 1:
          uint64_t result = 2;
          break;
        case 2:
          uint64_t result = 3;
          break;
        case 3:
          uint64_t result = 4;
          break;
        case 4:
          uint64_t result = 5;
          break;
        case 5:
          uint64_t result = 27;
          break;
        default:
          uint64_t result = 0;
          break;
      }
      break;
  }
  return result;
}

void sub_1D3D0EB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D0FD28(_Unwind_Exception *a1)
{
}

void sub_1D3D13F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D145AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id __softlink__BiomeLibrary()
{
  uint64_t v5 = 0;
  int8x16_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void (*)(void))getBiomeLibrarySymbolLoc_ptr;
  int8x16_t v8 = getBiomeLibrarySymbolLoc_ptr;
  if (!getBiomeLibrarySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)BiomeLibraryLibrary();
    v6[3] = (uint64_t)dlsym(v1, "BiomeLibrary");
    getBiomeLibrarySymbolLoc_ptr = (_UNKNOWN *)v6[3];
    uint64_t v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__softlink__BiomeLibrary_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = v0();

  return v2;
}

void sub_1D3D194D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__getBiomeLibrarySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BiomeLibraryLibrary();
  uint64_t result = dlsym(v2, "BiomeLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBiomeLibrarySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BiomeLibraryLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!BiomeLibraryLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __BiomeLibraryLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E69BD7E8;
    uint64_t v5 = 0;
    BiomeLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = BiomeLibraryLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!BiomeLibraryLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __BiomeLibraryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiomeLibraryLibraryCore_frameworkLibrary = result;
  return result;
}

WiFiUsageLQMMLOSample *__getBMDeviceWiFiClass_block_invoke(uint64_t a1)
{
  BiomeLibraryLibrary();
  uint64_t result = (WiFiUsageLQMMLOSample *)objc_getClass("BMDeviceWiFi");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBMDeviceWiFiClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (WiFiUsageLQMMLOSample *)__getBMDeviceWiFiClass_block_invoke_cold_1();
    return [(WiFiUsageLQMMLOSample *)v3 initWith:v5 andDuration:v6];
  }
  return result;
}

void sub_1D3D1A9D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1AFD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1B280(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1B498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1B6A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1B958(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1BB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1BD80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1C030(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1C248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1CA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3D1CBA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3D1DE94(_Unwind_Exception *a1)
{
}

void sub_1D3D1E598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1E954(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D3D1F25C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D3D218B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D21AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D22B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3D25194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D3D25440(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void WFLoggerTimerTmoCallBack(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9440170]();
  if (!a1) {
    goto LABEL_9;
  }
  if (!*(void *)(a1 + 8))
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s: _ctxt is null", "WFLoggerTimerTmoCallBack");
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
LABEL_13:
    *(_DWORD *)buf = 136446210;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v5, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    goto LABEL_9;
  }
  if (!*(void *)(a1 + 24))
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s: _dispatchQueue is null", "WFLoggerTimerTmoCallBack");
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Timeout", "WFLoggerTimerTmoCallBack");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String")), "UTF8String");
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([(id)a1 checkLogFileUpdate:*(void *)(a1 + 96)])
  {
    SEL v4 = (const void *)[(id)a1 changeLogFile:*(unsigned __int8 *)(a1 + 64)];
    if (v4) {
      CFRelease(v4);
    }
  }
LABEL_9:
}

long double gloria::TileCoordinate::XToLng(gloria::TileCoordinate *this)
{
  double v1 = (double)*(unint64_t *)this;
  return v1 / ldexp(1.0, *((unsigned __int8 *)this + 16)) * 360.0 + -180.0;
}

void *gloria::operator<<(void *a1)
{
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"tile_x_: ", 9);
  uint64_t v2 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" tile_y: ", 9);
  uint64_t v3 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" tile_zoom: ", 12);
  std::ostream::operator<<();
  return a1;
}

{
  void *v2;

  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"tile_id: ", 9);
  uint64_t v2 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" zoom: ", 7);
  std::ostream::operator<<();
  return a1;
}

unint64_t gloria::MortonUtils::LeadingZeros(gloria::MortonUtils *this)
{
  return __clz((unint64_t)this);
}

void gloria::TileId::FromXYZ(gloria::TileId *this@<X0>, uint64_t a2@<X8>)
{
  gloria::MortonUtils::XYToQuadId(*(gloria::MortonUtils **)this, *((void *)this + 1));
  char v5 = *((unsigned char *)this + 16);
  *(void *)a2 = v6;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x218], 8) = v5;
}

uint64_t gloria::TileId::Zoom(gloria::TileId *this)
{
  char v1 = 63 - __clz((unint64_t)this);
  return ((char)(v1 + ((v1 & 0x80) >> 7)) >> 1);
}

BOOL gloria::TileId::operator==(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

BOOL gloria::TileId::operator!=(uint64_t a1, uint64_t a2)
{
  return *(void *)a2 != *(void *)a1 || *(unsigned __int8 *)(a2 + 8) != *(unsigned __int8 *)(a1 + 8);
}

void gloria::TileId::Children(gloria::TileId *this@<X0>, void *a2@<X8>)
{
}

void gloria::TileId::Children(gloria::TileId *this@<X0>, char a2@<W1>, void *a3@<X8>)
{
  char v5 = *((unsigned char *)this + 8);
  char v6 = 2 * a2;
  uint64_t v7 = *(void *)this;
  a3[1] = 0;
  a3[2] = 0;
  unint64_t v8 = (1 << (2 * a2));
  *a3 = 0;
  std::vector<gloria::TileId>::resize(a3, v8);
  uint64_t v9 = 0;
  uint64_t v10 = v7 << v6;
  do
  {
    uint64_t v11 = *a3 + v9;
    *(void *)uint64_t v11 = v10;
    *(unsigned char *)(v11 + _Block_object_dispose(&STACK[0x218], 8) = v5 + a2;
    ++v10;
    v9 += 16;
    --v8;
  }
  while (v8);
}

void sub_1D3D2D53C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x218], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<gloria::TileId>::resize(void *a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(a1[1] - *a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      a1[1] = *a1 + 16 * a2;
    }
  }
  else
  {
    std::vector<gloria::TileId>::__append((uint64_t)a1, a2 - v2);
  }
}

uint64_t gloria::TileId::Ancestor@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(this + 8) - 1;
  if (*(unsigned char *)(this + 8) == 1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)this >> 2;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x218], 8) = v2;
  return this;
}

uint64_t gloria::TileId::Ancestor@<X0>(uint64_t this@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v3 = *(unsigned __int8 *)(this + 8) - a2;
  if (v3) {
    uint64_t v4 = *(void *)this >> (2 * a2);
  }
  else {
    uint64_t v4 = 0;
  }
  *(void *)a3 = v4;
  *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x218], 8) = v3;
  return this;
}

void gloria::TileId::Neighbors(gloria::TileId *this@<X0>, uint64_t a2@<X8>)
{
}

unsigned int gloria::TileId::Reach(gloria::TileId *this, unsigned int a2)
{
  double v2 = 40075016.7 / (double)(unint64_t)(256 << *((unsigned char *)this + 8)) * 256.0;
  if (v2 * 0.5 >= (double)a2) {
    return 0;
  }
  else {
    return vcvtpd_u64_f64((double)a2 / v2);
  }
}

uint64_t gloria::TileId::MapSize(gloria::TileId *this)
{
  return 256 << *((unsigned char *)this + 8);
}

double gloria::TileId::Resolution(gloria::TileId *this)
{
  return 40075016.7 / (double)(unint64_t)(256 << *((unsigned char *)this + 8));
}

uint64_t gloria::TileBoundingBox::ToWKT(gloria::TileBoundingBox *this)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v11);
  *(void *)((char *)&v11[2] + *(void *)(v11[0] - 24)) = 8;
  uint64_t v1 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"POLYGON( ", 9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v1, (uint64_t)"(", 1);
  double v2 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" ", 1);
  int v3 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)", ", 2);
  uint64_t v4 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)" ", 1);
  char v5 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)", ", 2);
  char v6 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)" ", 1);
  uint64_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", ", 2);
  unint64_t v8 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)" ", 1);
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"))", 2);
  std::stringbuf::str();
  v11[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v11 + *(void *)(v11[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v11[1] = MEMORY[0x1E4FBA470] + 16;
  if (v12 < 0) {
    operator delete((void *)v11[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1D943F880](&v13);
}

void sub_1D3D2D894(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA498] + 64;
  *(void *)(a1 + 112) = MEMORY[0x1E4FBA498] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x1E4FBA418] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x1E4FBA418] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  char v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x1E4FBA498] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x218], 8) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 8_Block_object_dispose(&STACK[0x218], 8) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_1D3D2DA18(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x1D943F880](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA418];
  uint64_t v3 = *MEMORY[0x1E4FBA418];
  *(void *)a1 = *MEMORY[0x1E4FBA418];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x218], 8) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1D943F880](a1 + 112);
  return a1;
}

BOOL gloria::TileId::operator<(void *a1, void *a2)
{
  return *a1 < *a2;
}

void __clang_call_terminate(void *a1)
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1D943F7C0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1D943F7D0](v13);
  return a1;
}

void sub_1D3D2DCA8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x1D943F7D0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1D3D2DC88);
}

void sub_1D3D2DCFC(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_1D3D2DE7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E69BC640, MEMORY[0x1E4FBA1C8]);
}

void sub_1D3D2DFA4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::vector<gloria::TileId>::__append(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = a1 + 16;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(unsigned char **)(a1 + 8);
  if (a2 <= (v5 - (uint64_t)v6) >> 4)
  {
    *(void *)(a1 + _Block_object_dispose(&STACK[0x218], 8) = &v6[16 * a2];
  }
  else
  {
    size_t v7 = *(unsigned char **)a1;
    uint64_t v8 = (uint64_t)&v6[-*(void *)a1];
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<gloria::TileId>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (void)v7;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12)
    {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gloria::TileId>>(v4, v12);
      size_t v7 = *(unsigned char **)a1;
      uint64_t v6 = *(unsigned char **)(a1 + 8);
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = &v13[16 * v10];
    uint64_t v15 = &v13[16 * v12];
    int8x16_t v16 = &v14[16 * a2];
    while (v6 != v7)
    {
      uint64_t v17 = *((void *)v6 - 2);
      v6 -= 16;
      *((void *)v14 - 2) = v17;
      v14 -= 16;
      v14[8] = v6[8];
    }
    *(void *)a1 = v14;
    *(void *)(a1 + _Block_object_dispose(&STACK[0x218], 8) = v16;
    *(void *)(a1 + 16) = v15;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

void std::vector<gloria::TileId>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<gloria::TileId>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void sub_1D3D34050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v23 - 88));
  _Unwind_Resume(a1);
}

void sub_1D3D343C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3D3C008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D3C3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D3C5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D3C8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D3CD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D3D1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D3D69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D3DDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t isDisplayOff()
{
  int out_token = -1;
  if (notify_register_check("com.apple.iokit.hid.displayStatus", &out_token)) {
    return 1;
  }
  uint64_t v10 = 0;
  if (notify_get_state(out_token, &v10))
  {
    BOOL v0 = 1;
  }
  else
  {
    uint64_t v1 = v10;
    BOOL v0 = v10 == 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14508], OS_LOG_TYPE_ERROR)) {
      isDisplayOff_cold_1(v1 == 0, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  notify_cancel(out_token);
  return v0;
}

void sub_1D3D3E208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D3E5A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

void sub_1D3D3E980(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x218], 8) = a1;
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x218], 8) = a1;
}

void sub_1D3D46E3C(_Unwind_Exception *a1)
{
  __destructor_8_s48_s56(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s48_s56(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
}

void sub_1D3D472D4(_Unwind_Exception *a1)
{
  __destructor_8_s48_s56(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D519AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D51AF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D51D3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D52070(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D523C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D526BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D52890(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D52A68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D53624(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *_labelDescription(unint64_t a1)
{
  if (a1 >= 0xB) {
    _labelDescription_cold_1(a1);
  }
  return off_1E69BE290[a1];
}

void sub_1D3D54914(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1D3D56140(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D3D5B734(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1D3D68274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3D68C80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D3D68E40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D6A8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

void sub_1D3D6AC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3D6EDF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void WiFiWalletUtilAddPassFromURL(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9B8];
  id v4 = a2;
  uint64_t v5 = [v3 dataWithContentsOfURL:a1];
  uint64_t v7 = 0;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F84848]) initWithData:v5 error:&v7];
  WiFiWalletUtilAddPass(v6, v4);
}

void WiFiWalletUtilAddPass(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void (**)(void, void, void))v4;
  if (v3)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F84890]);
    if (v6)
    {
      v11[0] = v3;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __WiFiWalletUtilAddPass_block_invoke;
      v8[3] = &unk_1E69BE6D0;
      uint64_t v10 = v5;
      id v9 = v3;
      [v6 addPasses:v7 withCompletionHandler:v8];
    }
    else
    {
      v5[2](v5, 0, -1);
    }
  }
  else
  {
    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0, -1);
  }
}

uint64_t __WiFiWalletUtilAddPass_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

uint64_t WiFiWalletUtilRemovePassesMatchingIdentifier(void *a1, void *a2)
{
  return _WiFiWalletUtilRemovePassMatching(a1, a2, 0, 0);
}

uint64_t _WiFiWalletUtilRemovePassMatching(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F84890]);
  id v12 = v10;
  uint64_t v13 = v12;
  if (!v12)
  {
    if (v9)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9];
      uint64_t v18 = 0;
      int8x16_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F84848]) initWithData:v15 error:&v18];
      if (v16)
      {

        NSLog(&cfstr_FailedToRemove.isa, 0);
      }
      else
      {
        NSLog(&cfstr_FailedToCreate.isa, v9);
      }
    }
    else
    {
      if (v7)
      {
        uint64_t v13 = [v11 passWithPassTypeIdentifier:v7 serialNumber:v8];
        if (v13) {
          goto LABEL_2;
        }
        NSLog(&cfstr_FailedToFindPa.isa, v7, v8);
LABEL_8:
        uint64_t v14 = 0;
        goto LABEL_9;
      }
      NSLog(&cfstr_FailedToFindPa.isa, 0, v8);
    }
    uint64_t v13 = 0;
    goto LABEL_8;
  }
LABEL_2:
  [v11 removePass:v13];
  if ([v11 containsPass:v13])
  {
    NSLog(&cfstr_LibraryStillCo.isa);
    goto LABEL_8;
  }
  uint64_t v14 = 1;
LABEL_9:

  return v14;
}

uint64_t WiFiWalletUtilRemovePassMatchingURL(void *a1)
{
  return _WiFiWalletUtilRemovePassMatching(0, 0, a1, 0);
}

uint64_t WiFiWalletUtilRemovePass(void *a1)
{
  return _WiFiWalletUtilRemovePassMatching(0, 0, 0, a1);
}

id WiFiWalletSignedDataForRawPass(void *a1, void *a2, void *a3, void *a4)
{
  items[1] = *(CFArrayRef *)MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v7)
  {
    v28 = 0;
    uint64_t v17 = 0;
    goto LABEL_42;
  }
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v13 = NSTemporaryDirectory();
  uint64_t v14 = [v13 stringByAppendingPathComponent:@"PassBeingSigned.raw"];
  uint64_t v15 = [v12 fileURLWithPath:v14];

  [v11 removeItemAtURL:v15 error:0];
  id v117 = 0;
  v105 = v11;
  v106 = (void *)v15;
  [v11 copyItemAtURL:v7 toURL:v15 error:&v117];
  int8x16_t v16 = (__CFString *)v117;
  uint64_t v17 = v16;
  if (v10 && !v16)
  {
    v116 = 0;
    id v103 = v10;
    id v18 = v10;
    unint64_t v19 = [v106 URLByAppendingPathComponent:@"pass.json" isDirectory:0];
    uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v19 options:0 error:&v116];
    if (v20)
    {
      int8x16_t v21 = (void *)v20;
      id v99 = v9;
      v118[0] = 0;
      v22 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v20 options:1 error:v118];
      uint64_t v23 = (__CFString *)v118[0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v97 = v8;
        id v24 = v22;
        v25 = [v24 objectForKey:@"semantics"];
        v26 = v25;
        if (v25)
        {
          v27 = (void *)[v25 mutableCopy];
          [v27 setObject:v18 forKey:@"wifiAccess"];
        }
        else
        {
          items[0] = (CFArrayRef)@"wifiAccess";
          *(void *)&long long v119 = v18;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:items count:1];
        }
        [v24 setObject:v27 forKey:@"semantics"];

        v125 = v23;
        uint64_t v30 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v24 options:1 error:&v125];
        v29 = v125;

        if (v29) {
          v116 = v29;
        }
        else {
          [v30 writeToURL:v19 atomically:1];
        }

        id v8 = v97;
      }
      else
      {
        _ErrorWithCodeAndDescription(0, @"Invalid pass data.");
        v116 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v29 = v23;
        uint64_t v30 = v21;
      }

      id v9 = v99;
    }

    uint64_t v17 = v116;
    id v10 = v103;
  }
  if (v17) {
    goto LABEL_39;
  }
  id v104 = v10;
  v98 = v8;
  v31 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v32 = v106;
  id v107 = objc_alloc_init(v31);
  v33 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v34 = [v32 URLByStandardizingPath];
  v95 = v32;

  v96 = v33;
  v110 = (void *)v34;
  v35 = [v33 enumeratorAtURL:v34 includingPropertiesForKeys:0 options:0 errorHandler:0];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v119 objects:v118 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    id v100 = v9;
    id v93 = v7;
    v38 = 0;
    uint64_t v39 = *(void *)v120;
    uint64_t v40 = *MEMORY[0x1E4F1C670];
    uint64_t v108 = *MEMORY[0x1E4F1C670];
    v109 = v35;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v120 != v39) {
          objc_enumerationMutation(v35);
        }
        if (!v38)
        {
          v42 = *(void **)(*((void *)&v119 + 1) + 8 * i);
          v125 = 0;
          items[0] = 0;
          int v43 = [v42 getResourceValue:items forKey:v40 error:&v125];
          CFArrayRef v44 = items[0];
          v38 = v125;
          if (v43 && [(__CFArray *)v44 BOOLValue])
          {
            v45 = [v42 URLByStandardizingPath];
            v112 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v45];
            v46 = [v112 SHA1Hash];
            v114 = [v46 hexEncoding];

            v47 = [v110 pathComponents];
            v48 = [v45 pathComponents];
            uint64_t v49 = [v47 count];
            v50 = objc_msgSend(v48, "subarrayWithRange:", v49, objc_msgSend(v48, "count") - v49);
            v51 = [NSString pathWithComponents:v50];
            if (v51) {
              [v107 setObject:v114 forKeyedSubscript:v51];
            }

            uint64_t v40 = v108;
            v35 = v109;
          }
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v119 objects:v118 count:16];
    }
    while (v37);
    id v7 = v93;
    id v9 = v100;
    if (v38) {
      goto LABEL_35;
    }
  }
  v52 = [v110 URLByAppendingPathComponent:@"manifest.json"];
  id v124 = 0;
  v53 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v107 options:1 error:&v124];
  v54 = (__CFString *)v124;
  if (v54)
  {
    v38 = v54;

LABEL_35:
    v55 = v38;
    goto LABEL_37;
  }
  [v53 writeToURL:v52 atomically:1];

  v55 = 0;
LABEL_37:

  v56 = v55;
  id v8 = v98;
  id v10 = v104;
  if (v56)
  {
    uint64_t v17 = v56;
LABEL_39:
    v28 = 0;
    goto LABEL_40;
  }
  id v58 = v95;
  id v59 = v98;
  id v60 = v9;
  if (v60 && v59 && v58)
  {
    v61 = [v58 URLByAppendingPathComponent:@"manifest.json"];
    v62 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v61];
    v63 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v59];
    CFDataRef v64 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v60];
    CFDataRef v65 = v64;
    if (!v63 || !v64)
    {
      _ErrorWithCodeAndDescription(0, @"Error loading certificates.");
      id v76 = (id)objc_claimAutoreleasedReturnValue();
LABEL_65:

      id v8 = v98;
      goto LABEL_66;
    }
    v113 = v61;
    v115 = v62;
    id v101 = v9;
    CFAllocatorRef v66 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    SecCertificateRef v67 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v64);
    items[0] = 0;
    id v124 = (id)*MEMORY[0x1E4F3B9E8];
    v125 = @"apple123";
    CFDictionaryRef v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
    OSStatus v68 = SecPKCS12Import((CFDataRef)v63, v111, items);
    if (v67 && !v68 && CFArrayGetCount(items[0]) == 1)
    {
      id v94 = v7;
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items[0], 0);
      CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4F3B9F0]);
      uint64_t v70 = *MEMORY[0x1E4F3B938];
      v118[0] = *(id *)MEMORY[0x1E4F1CFD0];
      uint64_t v71 = *MEMORY[0x1E4F3B920];
      *(void *)&long long v119 = v70;
      *((void *)&v119 + 1) = v71;
      SecCertificateRef v123 = v67;
      v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
      v118[1] = v72;
      v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:&v119 count:2];

      CFMutableDataRef Mutable = CFDataCreateMutable(v66, 0);
      int v75 = SecCMSCreateSignedData();
      if (v75)
      {
        _ErrorWithCodeAndDescription(v75, @"Error signing manifest.");
        id v76 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v77 = [v58 URLByAppendingPathComponent:@"signature"];
        [(__CFData *)Mutable writeToURL:v77 atomically:1];

        id v76 = 0;
      }
      id v7 = v94;
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    else
    {
      _ErrorWithCodeAndDescription(0, @"Error importing certificates.");
      id v76 = (id)objc_claimAutoreleasedReturnValue();
      if (!v67) {
        goto LABEL_64;
      }
    }
    CFRelease(v67);
LABEL_64:

    id v9 = v101;
    v61 = v113;
    v62 = v115;
    goto LABEL_65;
  }
  _ErrorWithCodeAndDescription(0, @"Missing required signature parameters.");
  id v76 = (id)objc_claimAutoreleasedReturnValue();
LABEL_66:

  v78 = (__CFString *)v76;
  if (v78)
  {
    uint64_t v17 = v78;
    v28 = 0;
  }
  else
  {
    id v102 = v9;
    id v79 = v7;
    id v80 = v58;
    BOMCopierNew();
    *(void *)&long long v119 = @"createPKZip";
    v118[0] = (id)MEMORY[0x1E4F1CC38];
    v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:&v119 count:1];
    v82 = [MEMORY[0x1E4F29128] UUID];
    v83 = [v82 UUIDString];
    v84 = [v83 stringByAppendingPathExtension:@"pkpass"];

    v85 = NSTemporaryDirectory();
    v86 = [v85 stringByAppendingPathComponent:v84];

    v87 = [v80 path];

    v88 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v89 = v87;
    [v89 fileSystemRepresentation];
    id v90 = v86;
    [v90 fileSystemRepresentation];
    int v91 = BOMCopierCopyWithOptions();
    if (v91)
    {
      _ErrorWithCodeAndDescription(v91, @"Error zipping pass.");
      id v92 = (id)objc_claimAutoreleasedReturnValue();
      v28 = 0;
    }
    else
    {
      v28 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v90];
      id v92 = 0;
    }
    [v88 removeItemAtPath:v90 error:0];
    BOMCopierFree();

    uint64_t v17 = (__CFString *)v92;
    id v7 = v79;
    id v9 = v102;
  }
  id v10 = v104;
LABEL_40:
  [v105 removeItemAtURL:v106 error:0];

  if (v17) {
    NSLog(&cfstr_PassSigningErr.isa, v17);
  }
LABEL_42:

  return v28;
}

id _ErrorWithCodeAndDescription(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = a2;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a2;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v3 errorWithDomain:@"com.apple.wallet.server" code:a1 userInfo:v6];

  return v7;
}

void sub_1D3D73F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1D3D74030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3D74150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3D78284(_Unwind_Exception *a1)
{
  __destructor_8_s48_s56(v1);
  _Unwind_Resume(a1);
}

void sub_1D3D7855C(_Unwind_Exception *a1)
{
  __destructor_8_s48_s56(v1);
  _Unwind_Resume(a1);
}

void WiFiUsageFaultReasonStringMap_cold_1(uint64_t a1)
{
}

void WiFiUsageFaultReasonStringMap_cold_2(uint64_t a1)
{
}

void WiFiUsageFaultReasonStringMap_cold_3(uint64_t a1)
{
}

uint64_t __softlink__BiomeLibrary_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getBMDeviceWiFiClass_block_invoke_cold_1(v0);
}

uint64_t __getBMDeviceWiFiClass_block_invoke_cold_1()
{
  uint64_t v0 = (uint8_t *)abort_report_np();
  return __30__WFMeasure_dispatchPingTest___block_invoke_cold_1(v0);
}

void isDisplayOff_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _labelDescription_cold_1(uint64_t a1)
{
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B0]();
}

uint64_t Apple80211BindToInterface()
{
  return MEMORY[0x1F4124780]();
}

uint64_t Apple80211Close()
{
  return MEMORY[0x1F4124798]();
}

uint64_t Apple80211CopyValue()
{
  return MEMORY[0x1F41247B0]();
}

uint64_t Apple80211Get()
{
  return MEMORY[0x1F41247C8]();
}

uint64_t Apple80211Open()
{
  return MEMORY[0x1F41247F8]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1F410CFC8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1F410CFD8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1F410CFE0]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1F40D78D8](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFHostCancelInfoResolution(CFHostRef theHost, CFHostInfoType info)
{
}

CFHostRef CFHostCreateWithName(CFAllocatorRef allocator, CFStringRef hostname)
{
  return (CFHostRef)MEMORY[0x1F40D5318](allocator, hostname);
}

CFArrayRef CFHostGetAddressing(CFHostRef theHost, Boolean *hasBeenResolved)
{
  return (CFArrayRef)MEMORY[0x1F40D5320](theHost, hasBeenResolved);
}

Boolean CFHostStartInfoResolution(CFHostRef theHost, CFHostInfoType info, CFStreamError *error)
{
  return MEMORY[0x1F40D5340](theHost, *(void *)&info, error);
}

uint64_t CFNetDiagnosticPingWithOptions()
{
  return MEMORY[0x1F40D5350]();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1F40D85A0](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A48](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A8](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return MEMORY[0x1F4116E58]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x1F411C138]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1F412A6A0]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1F412A6D0]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1F412A760]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x1F412A790]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t MKBUserUnlockedSinceBoot()
{
  return MEMORY[0x1F412FA20]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DF0](allocator, domain, serviceID, entity);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1F4101E78](interface);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x1F4101F78](service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x1F4101F88](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x1F4101FC0](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x1F4101FC8](set);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1F4102000](allocator, name, prefsID, authorization);
}

uint64_t SCPrint()
{
  return MEMORY[0x1F4102078]();
}

uint64_t SecCMSCreateSignedData()
{
  return MEMORY[0x1F40F6A80]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

OSStatus SecPKCS12Import(CFDataRef pkcs12_data, CFDictionaryRef options, CFArrayRef *items)
{
  return MEMORY[0x1F40F6F90](pkcs12_data, options, items);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCopyISOForMCC()
{
  return MEMORY[0x1F40DF050]();
}

uint64_t _CTServerConnectionCopyMobileCountryCode()
{
  return MEMORY[0x1F40DF068]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1F40DF0D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8D0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

int __vsnprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, va_list a6)
{
  return MEMORY[0x1F40C9D30](a1, a2, *(void *)&a3, a4, a5, a6);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1F4181550](cls, name);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x1F40CB8F8](a1, a2);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return (ether_addr *)MEMORY[0x1F40CBF70](a1);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CC070](*(void *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1F40CC410](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1F40CC650](a1);
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x1F40CC800](*(void *)&__e, __x);
  return result;
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1F40F2878]();
}

uint64_t nw_activity_complete_with_reason_and_underlying_error()
{
  return MEMORY[0x1F40F2880]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1F40F2898]();
}

uint64_t nw_activity_get_domain()
{
  return MEMORY[0x1F40F28B0]();
}

uint64_t nw_activity_get_label()
{
  return MEMORY[0x1F40F28B8]();
}

uint64_t nw_activity_get_token()
{
  return MEMORY[0x1F40F28C0]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1F40F28E8]();
}

uint64_t nw_activity_submit_metrics()
{
  return MEMORY[0x1F40F2900]();
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x1F40F2940]();
}

uint64_t nw_array_get_object_at_index()
{
  return MEMORY[0x1F40F2948]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_attempted_endpoint_array()
{
  return MEMORY[0x1F40F2A70]();
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

uint64_t nw_connection_end_activity()
{
  return MEMORY[0x1F40F2B20]();
}

uint64_t nw_connection_get_id()
{
  return MEMORY[0x1F40F2B48]();
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1F40F2C60]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x1F40F2C88]();
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x1F40F2CA0]();
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_connection_start_activity()
{
  return MEMORY[0x1F40F2CB0]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x1F40F2D70]();
}

uint64_t nw_context_set_isolate_protocol_cache()
{
  return MEMORY[0x1F40F2DA8]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x1F40F2DB0]();
}

uint64_t nw_context_set_privacy_level()
{
  return MEMORY[0x1F40F2DC0]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x1F40F2DC8]();
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2EA8](hostname, port);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x1F40F2EF8]();
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1F40F2F60](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x1F40F2F68](error);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34D0](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x1F40F35E0]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x1F40F35E8]();
}

void nw_parameters_set_expired_dns_behavior(nw_parameters_t parameters, nw_parameters_expired_dns_behavior_t expired_dns_behavior)
{
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x1F40F3660]();
}

uint64_t nw_parameters_set_initial_data_payload()
{
  return MEMORY[0x1F40F3668]();
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x1F40F3788]();
}

uint64_t nw_parameters_set_tfo()
{
  return MEMORY[0x1F40F37A0]();
}

uint64_t nw_parameters_set_tls_session_id()
{
  return MEMORY[0x1F40F37A8]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x1F40F37B8]();
}

void nw_tcp_options_set_no_delay(nw_protocol_options_t options, BOOL no_delay)
{
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x1F40F3F58](options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1F40CD660]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x1F40CD668]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AC8](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1F40CDD10](__p, __ec);
}

void sec_protocol_options_set_tls_tickets_enabled(sec_protocol_options_t options, BOOL tickets_enabled)
{
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x1F40CE5B0](a1, a2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}