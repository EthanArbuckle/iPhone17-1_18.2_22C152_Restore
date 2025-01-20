@interface tm0624042662bdd34b4bbbfc0f7da95deb
- (id)getGridX;
- (id)getGridY;
- (int)compute2DGridTemps;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateCoreAnalyticsInfo;
@end

@implementation tm0624042662bdd34b4bbbfc0f7da95deb

- (void)updateAllThermalLoad:(BOOL)a3
{
  int v4 = dword_1000AACF4;
  int v5 = dword_1000AACF8;
  int v6 = HIDWORD(qword_1000AAD88);
  id v7 = [(CommonProduct *)self findComponent:18];
  double v8 = (double)[(CommonProduct *)self dieTempMaxAverage] / 100.0;
  *(float *)&double v8 = v8;
  [v7 calculateControlEffort:v8];
  sub_100031714(51, (int)((double)v4 * 0.68 + 50.49 + (double)v5 * 0.3));
  float v9 = (float)SHIDWORD(qword_1000AAD94);
  id v10 = [(CommonProduct *)self findComponent:19];
  float v11 = v9 / 100.0;
  *(float *)&double v12 = v11;
  [v10 calculateControlEffort:v12];
  id v13 = [(CommonProduct *)self findComponent:20];
  *(float *)&double v14 = v11;
  [v13 calculateControlEffort:v14];
  sub_100031714(54, (int)((double)v5 * 0.11 + 155.28 + (double)v6 * 0.84));
  float v15 = (float)dword_1000AADA4;
  id v16 = [(CommonProduct *)self findComponent:21];
  *(float *)&double v17 = v15 / 100.0;
  [v16 calculateControlEffort:v17];
  uint64_t v18 = self->super.baseVT[12];

  sub_100031714(52, v18);
}

- (int)compute2DGridTemps
{
  int v3 = HIDWORD(qword_1000AACCC);
  int v5 = HIDWORD(qword_1000AACD4);
  int v4 = qword_1000AACDC;
  int v6 = dword_1000AACF4;
  int v7 = dword_1000AAD6C;
  int v8 = unk_1000AAD70;
  int v9 = dword_1000AAD7C;
  double v10 = (double)dword_1000AACE4;
  double v11 = (double)dword_1000AACF8;
  baseVT = self->super.baseVT;
  int32x2_t v13 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067FC0, (float64x2_t)xmmword_100067FB0, (double)dword_1000AACE4), (float64x2_t)xmmword_100067FD0, (double)dword_1000AACF8)));
  int32x2_t v14 = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100067FF0, (float64x2_t)xmmword_100067FE0, (double)dword_1000AACE4), (float64x2_t)xmmword_100068000, (double)dword_1000AACF8)));
  *(int32x2_t *)self->super.baseVT = v13;
  *(int32x2_t *)&self->super.baseVT[2] = v14;
  *(int32x2_t *)&self->super.baseVT[4] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100068020, (float64x2_t)xmmword_100068010, v10), (float64x2_t)xmmword_100068030, v11)));
  *(int32x2_t *)&self->super.baseVT[6] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100068050, (float64x2_t)xmmword_100068040, v10), (float64x2_t)xmmword_100068060, v11)));
  *(int32x2_t *)&self->super.baseVT[8] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100068080, (float64x2_t)xmmword_100068070, v10), (float64x2_t)xmmword_100068090, v11)));
  *(int32x2_t *)&self->super.baseVT[10] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000680B0, (float64x2_t)xmmword_1000680A0, (double)v3), (float64x2_t)xmmword_1000680C0, (double)v5), (float64x2_t)xmmword_1000680D0, v11)));
  *(int32x2_t *)&self->super.baseVT[13] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000680F0, (float64x2_t)xmmword_1000680E0, (double)v3), (float64x2_t)xmmword_100068100, (double)v5), (float64x2_t)xmmword_100068110, v11)));
  *(int32x2_t *)&self->super.baseVT[15] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100068130, (float64x2_t)xmmword_100068120, (double)v8), (float64x2_t)xmmword_100068140, (double)v4), (float64x2_t)xmmword_100068150, v11)));
  self->super.baseVT[12] = (int)((double)v5 * 0.171 + 8.1 + (double)v6 * 0.271 + v11 * 0.546);
  self->super.baseVT[17] = (int)((double)v9 * 0.062 + 61.0 + (double)v4 * 0.464 + v11 * 0.451);
  *(int32x2_t *)&self->super.baseVT[18] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_100068170, (float64x2_t)xmmword_100068160, (double)v7), (float64x2_t)xmmword_100068180, (double)v4), (float64x2_t)xmmword_100068190, v11)));
  *(int32x2_t *)&self->super.baseVT[20] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000681B0, (float64x2_t)xmmword_1000681A0, (double)v8), (float64x2_t)xmmword_1000681C0, (double)v4), (float64x2_t)xmmword_1000681D0, v11)));
  self->super.baseVT[22] = (int)((double)v9 * 0.271 + 103.0 + (double)v4 * 0.42 + v11 * 0.264);
  self->super.baseVT[23] = (int)((double)v7 * 0.366 + 137.0 + (double)v4 * 0.287 + v11 * 0.287);
  self->super.baseVT[24] = (int)((double)v7 * 0.391 + 204.4 + v11 * 0.536);
  *(int32x2_t *)&self->super.baseVT[25] = vmovn_s64(vcvtq_s64_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1000681F0, (float64x2_t)xmmword_1000681E0, (double)v8), (float64x2_t)xmmword_100068200, (double)v4), (float64x2_t)xmmword_100068210, v11)));
  self->super.baseVT[27] = (int)((double)v9 * 0.628 + 160.8 + (double)v4 * 0.202 + v11 * 0.115);
  self->super.baseVT[28] = (int)((double)v7 * 0.87 + 224.9 + v11 * 0.078);
  double v15 = (double)v7 * 0.612 + 181.8 + (double)v4 * 0.091 + v11 * 0.237;
  __int32 v16 = v13.i32[0];
  uint64_t v17 = 1;
  __int32 v18 = v13.i32[0];
  self->super.baseVT[29] = (int)v15;
  do
  {
    int v19 = baseVT[v17];
    if (v16 >= v19) {
      __int32 v16 = baseVT[v17];
    }
    if (v18 <= v19) {
      __int32 v18 = baseVT[v17];
    }
    ++v17;
  }
  while (v17 != 30);
  sub_100031714(53, (v18 - v16));
  if (byte_1000AA7A0)
  {
    v20 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> 5x6 Grid", buf, 2u);
      int v21 = byte_1000AA7A0;
    }
    else
    {
      int v21 = 1;
    }
  }
  else
  {
    int v21 = 0;
  }
  v22 = &self->super.baseVT[2];
  unint64_t v23 = -5;
  do
  {
    if (v21)
    {
      v24 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = *(v22 - 2);
        int v26 = *(v22 - 1);
        int v27 = *v22;
        int v28 = v22[1];
        int v29 = v22[2];
        *(_DWORD *)buf = 67110144;
        int v32 = v25;
        __int16 v33 = 1024;
        int v34 = v26;
        __int16 v35 = 1024;
        int v36 = v27;
        __int16 v37 = 1024;
        int v38 = v28;
        __int16 v39 = 1024;
        int v40 = v29;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "<Notice> %4d %4d %4d %4d %4d", buf, 0x20u);
        int v21 = byte_1000AA7A0;
      }
    }
    v23 += 5;
    v22 += 5;
  }
  while (v23 < 0x19);
  return baseVT;
}

- (id)getGridX
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B280;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000A26E0 != -1) {
    dispatch_once(&qword_1000A26E0, block);
  }
  return self->gridX;
}

- (id)getGridY
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B35C;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000A26E8 != -1) {
    dispatch_once(&qword_1000A26E8, block);
  }
  return self->gridY;
}

- (void)updateCoreAnalyticsInfo
{
}

@end