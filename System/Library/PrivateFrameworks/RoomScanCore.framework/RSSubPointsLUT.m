@interface RSSubPointsLUT
- (BOOL)isEqual:(id)a3;
- (RSSubPointsLUT)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RSSubPointsLUT

- (BOOL)isEqual:(id)a3
{
  v4 = (RSSubPointsLUT *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self
      && self->_begin == v6->_begin
      && self->_end == v6->_end
      && self->_size == v6->_size
      && self->_rawSize == v6->_rawSize
      && self->_camH == v6->_camH
      && self->_camW == v6->_camW
      && (long long v8 = *(_OWORD *)&v6[1]._size,
          long long v7 = *(_OWORD *)v6[1]._anon_30,
          long long v9 = *(_OWORD *)&v6[1]._begin,
          float32x4_t v20 = *(float32x4_t *)&v6[1].super.isa,
          long long v21 = v9,
          long long v22 = v8,
          long long v23 = v7,
          vmaxvq_f32(vabdq_f32(*(float32x4_t *)&self[1].super.isa, v20)) <= 0.000001))
    {
      uint64_t v12 = 0;
      while (v12 != 3)
      {
        uint64_t v13 = v12 + 1;
        float v14 = vmaxvq_f32(vabdq_f32(*((float32x4_t *)&self[1]._begin + v12), *(&v20 + v12 + 1)));
        ++v12;
        if (v14 > 0.000001)
        {
          if ((unint64_t)(v13 - 1) <= 2) {
            goto LABEL_12;
          }
          break;
        }
      }
      unint64_t v15 = 0;
      BOOL v10 = 0;
      long long v17 = *(_OWORD *)&v6->_anon_30[16];
      long long v16 = *(_OWORD *)&v6->_anon_30[32];
      long long v18 = *(_OWORD *)v6->_anon_30;
      v20.i32[2] = *(void *)&v6->_anon_30[8];
      DWORD2(v21) = DWORD2(v17);
      DWORD2(v22) = DWORD2(v16);
      v20.i64[0] = v18;
      *(void *)&long long v21 = v17;
      *(void *)&long long v22 = v16;
      do
      {
        float32x4_t v19 = vabdq_f32(*(float32x4_t *)&self->_anon_30[16 * v15], *(&v20 + v15));
        if (fmaxf(fmaxf(v19.f32[0], v19.f32[2]), v19.f32[1]) > 0.000001) {
          break;
        }
        BOOL v10 = v15++ > 1;
      }
      while (v15 != 3);
    }
    else
    {
LABEL_12:
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_opt_new();
  *((void *)result + 2) = self->_begin;
  *((void *)result + 3) = self->_end;
  long long v5 = *(_OWORD *)&self[1].super.isa;
  long long v6 = *(_OWORD *)&self[1]._begin;
  long long v7 = *(_OWORD *)self[1]._anon_30;
  *((_OWORD *)result + 8) = *(_OWORD *)&self[1]._size;
  *((_OWORD *)result + 9) = v7;
  *((_OWORD *)result + 6) = v5;
  *((_OWORD *)result + 7) = v6;
  *((void *)result + 4) = self->_size;
  *((void *)result + 5) = self->_rawSize;
  long long v8 = *(_OWORD *)self->_anon_30;
  long long v9 = *(_OWORD *)&self->_anon_30[32];
  *((_OWORD *)result + 4) = *(_OWORD *)&self->_anon_30[16];
  *((_OWORD *)result + 5) = v9;
  *((_OWORD *)result + 3) = v8;
  *((_DWORD *)result + 3) = LODWORD(self->_camH);
  *((_DWORD *)result + 2) = LODWORD(self->_camW);
  return result;
}

- (RSSubPointsLUT)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSSubPointsLUT;
  id result = [(RSSubPointsLUT *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_begin = 0u;
    *(_OWORD *)&result->_size = 0u;
    *(void *)&result->_camW = 0x4390000043C00000;
    *(_OWORD *)result->_anon_30 = *(_OWORD *)"333C";
    *(_OWORD *)&result->_anon_30[16] = unk_25B5F2090;
    *(_OWORD *)&result->_anon_30[32] = xmmword_25B5F20A0;
  }
  return result;
}

@end