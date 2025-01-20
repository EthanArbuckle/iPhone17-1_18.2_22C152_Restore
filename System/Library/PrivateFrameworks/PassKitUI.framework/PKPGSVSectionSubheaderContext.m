@interface PKPGSVSectionSubheaderContext
- (BOOL)isEqual:(id)a3;
- (PKPGSVSectionSubheaderContext)init;
- (double)positionForViewInContainerFrame:(double)a3;
- (unint64_t)hash;
@end

@implementation PKPGSVSectionSubheaderContext

- (PKPGSVSectionSubheaderContext)init
{
  return 0;
}

- (unint64_t)hash
{
  view = self->_view;
  long long v2 = *(_OWORD *)&self->_margins.bottom;
  long long v5 = *(_OWORD *)&self->_margins.top;
  long long v6 = v2;
  return PKObjectHash(&view);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v5 = (float64x2_t *)v4;
    if (self)
    {
      if (self->_view == *(PKPGSVSectionSubheaderView **)&v5->f64[1]) {
        LOBYTE(self) = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_margins.top, v5[1]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_margins.bottom, v5[2]))), 0xFuLL)));
      }
      else {
        LOBYTE(self) = 0;
      }
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

- (double)positionForViewInContainerFrame:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 8) bounds];
  double v10 = v9;
  double v12 = v11;
  double v13 = *(double *)(a1 + 24);
  double v14 = a2 + v13;
  double v15 = a4 - (v13 + *(double *)(a1 + 40));
  double v16 = a5 - (*(double *)(a1 + 16) + *(double *)(a1 + 32));
  v17 = [*(id *)(a1 + 8) layer];
  [v17 anchorPoint];
  double v19 = v18;

  v20.n128_f64[0] = (v15 - v10) * 0.5;
  PKFloatFloorToPixel(v20, v21);
  double v23 = v14 + v22 + v19 * v10;
  v24.n128_f64[0] = (v16 - v12) * 0.5;
  PKFloatFloorToPixel(v24, v25);
  return v23;
}

- (void).cxx_destruct
{
}

@end