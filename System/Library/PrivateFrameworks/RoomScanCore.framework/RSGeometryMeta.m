@interface RSGeometryMeta
- (BOOL)isEqual:(id)a3;
- (RSGeometryMeta)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RSGeometryMeta

- (BOOL)isEqual:(id)a3
{
  v4 = (RSGeometryMeta *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self) {
      LOBYTE(self) = self->_isCenterScaleUpdated == v6->_isCenterScaleUpdated
    }
                  && vabds_f32(self->_pixelSize, v6->_pixelSize) <= 0.000001
                  && vabds_f32(self->_floorHeight, v6->_floorHeight) <= 0.000001
                  && vabds_f32(self->_ceilingHeight, v6->_ceilingHeight) <= 0.000001
                  && vabds_f32(self->_supportHeight, v6->_supportHeight) <= 0.000001
                  && self->_imageSize == v6->_imageSize
                  && (float32x4_t v7 = vabdq_f32(*(float32x4_t *)&self->_center[4], *(float32x4_t *)&v6->_center[4]),
                      fmaxf(fmaxf(v7.f32[0], v7.f32[2]), v7.f32[1]) <= 0.00001)
                  && (float64x2_t v8 = vabdq_f64(*(float64x2_t *)&self->_shift[4], *(float64x2_t *)&v6->_shift[4]),
                      fmax(fmax(v8.f64[0], vabdq_f64(*(float64x2_t *)&self->_shift[20], *(float64x2_t *)&v6->_shift[20]).f64[0]), v8.f64[1]) <= 0.00000999999975)&& (float64x2_t v9 = vabdq_f64(*(float64x2_t *)&self->_scale[4], *(float64x2_t *)&v6->_scale[4]), fmax(fmax(v9.f64[0], vabdq_f64(*(float64x2_t *)&self->_scale[20], *(float64x2_t *)&v6->_scale[20]).f64[0]), v9.f64[1]) <= 0.00000999999975)&& (v10 = vabd_f32(*(float32x2_t *)&self->_floorCeilingCount[4], *(float32x2_t *)&v6->_floorCeilingCount[4]), fmaxf(v10.f32[0], v10.f32[1]) <= 0.000001)&& vabds_f32((float)self->_zSlice, (float)v6->_zSlice) <= 0.000001;
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_opt_new();
  *((unsigned char *)result + 8) = self->_isCenterScaleUpdated;
  *((_DWORD *)result + 3) = LODWORD(self->_pixelSize);
  long long v5 = *(_OWORD *)&self->_scale[20];
  *((_OWORD *)result + 5) = *(_OWORD *)&self->_scale[4];
  *((_OWORD *)result + 6) = v5;
  *((_OWORD *)result + 4) = *(_OWORD *)&self->_center[4];
  long long v6 = *(_OWORD *)&self->_shift[20];
  *((_OWORD *)result + 7) = *(_OWORD *)&self->_shift[4];
  *((_OWORD *)result + 8) = v6;
  *((_DWORD *)result + 4) = LODWORD(self->_floorHeight);
  *((_DWORD *)result + 5) = LODWORD(self->_ceilingHeight);
  *((_DWORD *)result + 6) = LODWORD(self->_supportHeight);
  *((_DWORD *)result + 7) = self->_imageSize;
  *((void *)result + 6) = *(void *)&self->_floorCeilingCount[4];
  *((_DWORD *)result + 8) = self->_zSlice;
  return result;
}

- (RSGeometryMeta)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSGeometryMeta;
  return [(RSGeometryMeta *)&v3 init];
}

@end