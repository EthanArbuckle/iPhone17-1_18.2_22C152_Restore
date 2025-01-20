RoseSyntheticApertureFiltering::PRRoseRangeFilter *RoseSyntheticApertureFiltering::PRRoseRangeFilter::PRRoseRangeFilter(RoseSyntheticApertureFiltering::PRRoseRangeFilter *this)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  long double v6;
  unsigned int v7;
  NSObject *v8;
  uint8_t v10[16];

  *(_WORD *)this = 0;
  *((_DWORD *)this + 2) = 0;
  *((_OWORD *)this + 1) = xmmword_230EF8BE0;
  *((void *)this + 4) = 0;
  v2 = (char *)this + 48;
  *((void *)this + 9) = 0x100000003;
  *((void *)this + 6) = &unk_26E5D3818;
  *(_OWORD *)((char *)this + 56) = xmmword_230EF8BF0;
  *((void *)this + 10) = (char *)this + 88;
  v3 = (char *)this + 112;
  *((void *)this + 17) = 0x100000003;
  *((void *)this + 14) = &unk_26E5D3818;
  *(_OWORD *)((char *)this + 120) = xmmword_230EF8BF0;
  *((void *)this + 18) = (char *)this + 152;
  v4 = (char *)this + 176;
  *((void *)this + 25) = 0x100000003;
  *((void *)this + 22) = &unk_26E5D3818;
  *(_OWORD *)((char *)this + 184) = xmmword_230EF8BF0;
  *((void *)this + 26) = (char *)this + 216;
  *((_OWORD *)this + 15) = xmmword_230EF8C00;
  v5 = (char *)this + 240;
  *((void *)this + 32) = 0xBFFBB67AE8584CAALL;
  v6 = erf(1.73205081);
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *((void *)this + 37) = 0;
  *((long double *)this + 38) = v6;
  v7 = 0;
  *((long double *)this + 39) = erf(-1.73205081);
  *(_OWORD *)((char *)this + 360) = xmmword_230EF8CA8;
  *(_OWORD *)((char *)this + 376) = unk_230EF8CB8;
  *((void *)this + 44) = 0x3FC5555555555555;
  *((_OWORD *)this + 20) = xmmword_230EF8C80;
  *((_OWORD *)this + 21) = unk_230EF8C90;
  *((void *)this + 49) = 0x3FC5555555555555;
  do
  {
    *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v3, v7) = 0;
    *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v4, v7) = 0;
    *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v2, v7++) = 0;
  }
  while (v7 != 3);
  v8 = os_log_create("com.apple.proximity", "RangeFilter");
  *((void *)this + 5) = v8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_230EC1000, v8, OS_LOG_TYPE_DEFAULT, "PRRoseRangeFilter constructed", v10, 2u);
  }
  return this;
}

void sub_230EC3114(_Unwind_Exception *a1)
{
  void *v3 = &unk_26E5D3870;
  void *v2 = &unk_26E5D3870;
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

void *cnmatrix::CNMatrix<3u,1u,double>::~CNMatrix(void *result)
{
  *result = &unk_26E5D3870;
  return result;
}

void RoseSyntheticApertureFiltering::PRRoseRangeFilter::addMeasurementWithVIO(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v6 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = *(double *)a2;
    uint64_t v8 = *(void *)(a2 + 8);
    uint64_t v9 = *(void *)(a2 + 16);
    uint64_t v10 = *(void *)(a2 + 96);
    uint64_t v11 = *(void *)(a2 + 104);
    uint64_t v12 = *(void *)(a2 + 112);
    *(_DWORD *)buf = 134219264;
    double v47 = v7;
    __int16 v48 = 2048;
    uint64_t v49 = v8;
    __int16 v50 = 2048;
    uint64_t v51 = v9;
    __int16 v52 = 2048;
    uint64_t v53 = v10;
    __int16 v54 = 2048;
    uint64_t v55 = v11;
    __int16 v56 = 2048;
    uint64_t v57 = v12;
    _os_log_impl(&dword_230EC1000, v6, OS_LOG_TYPE_DEFAULT, "Measurement added with VIO: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, position [%3.2f, %3.2f, %3.2f] m", buf, 0x3Eu);
  }
  uint64_t v40 = 0x100000003;
  long long v39 = xmmword_230EF8BF0;
  v38 = &unk_26E5D3818;
  v41 = &v42;
  cnmatrix::FastResize<double>(&v38, 3, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v38, 0.0);
  uint64_t v35 = 0x100000004;
  v33 = &unk_26E5D38A0;
  long long v34 = xmmword_230EF8C10;
  v36 = &v37;
  cnmatrix::FastResize<double>(&v33, 4, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v33, 0.0);
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v14 = a2 + 8 * i;
    uint64_t v15 = *(void *)(v14 + 96);
    *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v38, i) = v15;
    uint64_t v16 = *(void *)(v14 + 120);
    *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v33, i) = v16;
  }
  uint64_t v17 = *(void *)(a2 + 144);
  *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v33, 3u) = v17;
  RoseSyntheticApertureFiltering::quatn2rot((uint64_t)&v33, (uint64_t)buf);
  uint64_t v44 = 0x100000003;
  *(_OWORD *)&v43[8] = xmmword_230EF8BF0;
  *(void *)v43 = &unk_26E5D3818;
  v45[0] = &v45[1];
  cnmatrix::Multiply<double>((uint64_t)buf, a1 + 112, (uint64_t)v43);
  uint64_t v30 = 0x100000003;
  v28 = &unk_26E5D3818;
  long long v29 = xmmword_230EF8BF0;
  v31 = &v32;
  cnmatrix::Add<double>((uint64_t)&v38, (uint64_t)v43, (uint64_t)&v28);
  if (*(unsigned char *)a1)
  {
    int v18 = *(_DWORD *)(a1 + 8);
    if (v18 == 1)
    {
      RoseSyntheticApertureFiltering::PRRoseRangeFilter::propagateStateWithPose(a1, (uint64_t)&v28);
    }
    else if (!v18)
    {
      v19 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_230EC1000, v19, OS_LOG_TYPE_DEFAULT, "Range filter transitioning from non-VIO to VIO mode", v43, 2u);
      }
      RoseSyntheticApertureFiltering::PRRoseRangeFilter::propagateStateWithTime((RoseSyntheticApertureFiltering::PRRoseRangeFilter *)a1, *(double *)a2, 0);
      cnmatrix::CNMatrixBase<double>::operator=(a1 + 48, (uint64_t)&v28);
    }
    RoseSyntheticApertureFiltering::PRRoseRangeFilter::measurementUpdate((RoseSyntheticApertureFiltering::PRRoseRangeFilter *)a1, *(double *)(a2 + 8), *(double *)(a2 + 16), 0);
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 8);
    cnmatrix::CNMatrixBase<double>::operator=(a1 + 48, (uint64_t)&v28);
    *(unsigned char *)a1 = 1;
    v20 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 16);
      uint64_t v22 = *(void *)(a1 + 24);
      *(_DWORD *)v43 = 134218240;
      *(void *)&v43[4] = v21;
      *(_WORD *)&v43[12] = 2048;
      *(void *)&v43[14] = v22;
      _os_log_impl(&dword_230EC1000, v20, OS_LOG_TYPE_DEFAULT, "Initializing range filter with VIO: range %f m, uncertainty %f m", v43, 0x16u);
    }
  }
  double v23 = *(double *)a2;
  *(_DWORD *)(a1 + 8) = 1;
  *(double *)(a1 + 32) = v23;
  v24 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = *(void *)(a1 + 16);
    uint64_t v26 = *(void *)(a1 + 24);
    *(_DWORD *)v43 = 134218754;
    *(double *)&v43[4] = v23;
    *(_WORD *)&v43[12] = 2048;
    *(void *)&v43[14] = v25;
    *(_WORD *)&v43[22] = 2048;
    uint64_t v44 = v26;
    LOWORD(v45[0]) = 2080;
    *(void *)((char *)v45 + 2) = "YES";
    _os_log_impl(&dword_230EC1000, v24, OS_LOG_TYPE_DEFAULT, "Filter state after meas with VIO: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, with VIO: %s", v43, 0x2Au);
  }
  long long v27 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)a3 = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(a3 + 16) = v27;
  *(double *)(a3 + 8) = fmax(*(double *)(a3 + 8), 0.0);
}

void RoseSyntheticApertureFiltering::PRRoseRangeFilter::propagateStateWithTime(RoseSyntheticApertureFiltering::PRRoseRangeFilter *this, double a2, int a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v4 = *((double *)this + 4);
  double v5 = a2 - v4;
  if (!a3) {
    double v5 = v5 * 0.0625;
  }
  double v6 = sqrt(v5 + *((double *)this + 3) * *((double *)this + 3));
  *((double *)this + 3) = v6;
  double v7 = *((void *)this + 5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *((void *)this + 2);
    if (*((_DWORD *)this + 2) == 1) {
      uint64_t v9 = "YES";
    }
    else {
      uint64_t v9 = "NO";
    }
    int v10 = 134218754;
    double v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    double v15 = v6;
    __int16 v16 = 2080;
    uint64_t v17 = v9;
    _os_log_impl(&dword_230EC1000, v7, OS_LOG_TYPE_DEFAULT, "Filter state after propagation with time: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, with VIO: %s", (uint8_t *)&v10, 0x2Au);
  }
}

void RoseSyntheticApertureFiltering::PRRoseRangeFilter::propagateStateWithPose(uint64_t a1, uint64_t a2)
{
  v36[309] = *MEMORY[0x263EF8340];
  uint64_t v4 = a1 + 48;
  uint64_t v21 = 0x100000003;
  v19 = &unk_26E5D3818;
  long long v20 = xmmword_230EF8BF0;
  uint64_t v22 = &v23;
  cnmatrix::Subtract<double>(a2, a1 + 48, (uint64_t)&v19);
  uint64_t v31 = 0x100000003;
  long long v30 = xmmword_230EF8BF0;
  long long v29 = &unk_26E5D3818;
  uint64_t v32 = &v33;
  uint64_t v35 = 0x100000134;
  *(_OWORD *)&buf[8] = xmmword_230EF8C20;
  *(void *)buf = &unk_26E5D38E8;
  v36[0] = &v36[1];
  uint64_t v26 = 0x100000003;
  v24 = &unk_26E5D3818;
  long long v25 = xmmword_230EF8BF0;
  long long v27 = &v28;
  cnmatrix::Norm<double>((uint64_t)&v19, (uint64_t)&v29, (uint64_t)buf, (uint64_t)&v24, "2");
  double v6 = v5;
  cnmatrix::CNMatrixBase<double>::operator=(v4, a2);
  double v8 = *(double *)(a1 + 16);
  double v7 = *(double *)(a1 + 24);
  if (v8 + v7 * -1.73205081 <= 0.0)
  {
    double v15 = sqrt(v6 * 0.5 * (v6 * 0.5) + v7 * v7);
    *(double *)(a1 + 24) = v15;
  }
  else
  {
    uint64_t v9 = 0;
    double v10 = 0.0;
    do
    {
      double v11 = v8 + v7 * *(double *)(a1 + v9 + 240);
      double v12 = sqrt(v6 * v6 + v11 * v11 + v6 * -2.0 * v11 * *(double *)(a1 + v9 + 280));
      *(double *)&buf[v9] = v12;
      double v10 = v10 + *(double *)(a1 + v9 + 320) * v12;
      v9 += 8;
    }
    while (v9 != 40);
    uint64_t v13 = 0;
    double v14 = 0.0;
    do
    {
      double v14 = v14 + *(double *)(a1 + 360 + v13) * (*(double *)&buf[v13] - v10) * (*(double *)&buf[v13] - v10);
      v13 += 8;
    }
    while (v13 != 40);
    double v15 = sqrt(v14);
    *(double *)(a1 + 16) = v10;
    *(double *)(a1 + 24) = v15;
    double v8 = v10;
  }
  __int16 v16 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    if (*(_DWORD *)(a1 + 8) == 1) {
      uint64_t v18 = "YES";
    }
    else {
      uint64_t v18 = "NO";
    }
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v35 = *(void *)&v15;
    LOWORD(v36[0]) = 2080;
    *(void *)((char *)v36 + 2) = v18;
    _os_log_impl(&dword_230EC1000, v16, OS_LOG_TYPE_DEFAULT, "Filter state after propagation with pose: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, with VIO: %s", buf, 0x2Au);
  }
}

void RoseSyntheticApertureFiltering::PRRoseRangeFilter::measurementUpdate(RoseSyntheticApertureFiltering::PRRoseRangeFilter *this, double a2, double a3, char a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  double v7 = a3 * a3;
  double v8 = *((double *)this + 2);
  double v9 = *((double *)this + 3);
  double v10 = a3 * a3 + v9 * v9;
  double v11 = sqrt(v10);
  double v12 = (a2 - v8) / v11;
  if ((a4 & 1) != 0 || v12 <= 6.0)
  {
    if ((a4 & 1) != 0 || v12 >= -6.0)
    {
      if (*((unsigned char *)this + 1))
      {
        *((unsigned char *)this + 1) = 0;
        v19 = *((void *)this + 5);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_230EC1000, v19, OS_LOG_TYPE_DEFAULT, "Did not observe a second nLoS->LoS event after the first one - marked as a false event due to packet collision", (uint8_t *)&v21, 2u);
          double v8 = *((double *)this + 2);
          double v9 = *((double *)this + 3);
        }
      }
      *((double *)this + 2) = (v7 * v8 + a2 * (v9 * v9)) / v10;
      *((double *)this + 3) = v9 * a3 / v11;
    }
    else if (*((unsigned char *)this + 1))
    {
      *((unsigned char *)this + 1) = 0;
      uint64_t v18 = *((void *)this + 5);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v21 = 134218496;
        double v22 = v8;
        __int16 v23 = 2048;
        double v24 = a2;
        __int16 v25 = 2048;
        double v26 = v12;
        _os_log_error_impl(&dword_230EC1000, v18, OS_LOG_TYPE_ERROR, "Second nLos->LoS event detected by the range filter: Previous range %f m, Current range %f m, Normalized change %f", (uint8_t *)&v21, 0x20u);
        uint64_t v18 = *((void *)this + 5);
      }
      *((double *)this + 2) = a2;
      *((double *)this + 3) = a3;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 134218240;
        double v22 = a2;
        __int16 v23 = 2048;
        double v24 = a3;
        double v15 = "Re-initializing range filter: range %f m, uncertainty %f m";
        __int16 v16 = v18;
        uint32_t v17 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      *((unsigned char *)this + 1) = 1;
      long long v20 = *((void *)this + 5);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = 134218496;
        double v22 = v8;
        __int16 v23 = 2048;
        double v24 = a2;
        __int16 v25 = 2048;
        double v26 = v12;
        _os_log_error_impl(&dword_230EC1000, v20, OS_LOG_TYPE_ERROR, "Possible nLos->LoS event detected by the range filter: Previous range %f m, Current range %f m, Normalized change %f - not acting yet", (uint8_t *)&v21, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v13 = *((void *)this + 5);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v21 = 134218496;
      double v22 = v8;
      __int16 v23 = 2048;
      double v24 = a2;
      __int16 v25 = 2048;
      double v26 = v12;
      _os_log_error_impl(&dword_230EC1000, v13, OS_LOG_TYPE_ERROR, "LoS->nLoS event detected by the range filter: Previous range %f m, Current range %f m, Normalized change %f", (uint8_t *)&v21, 0x20u);
    }
    if (*((unsigned char *)this + 1))
    {
      *((unsigned char *)this + 1) = 0;
      double v14 = *((void *)this + 5);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        double v15 = "Did not observe a second nLoS->LoS event after the first one - marked as a false event due to packet collision";
        __int16 v16 = v14;
        uint32_t v17 = 2;
LABEL_15:
        _os_log_impl(&dword_230EC1000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v21, v17);
      }
    }
  }
}

double RoseSyntheticApertureFiltering::PRRoseRangeFilter::getCurrentState@<D0>(RoseSyntheticApertureFiltering::PRRoseRangeFilter *this@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)a2 = *(_OWORD *)((char *)this + 8);
  *(_OWORD *)(a2 + 16) = v2;
  double result = fmax(*(double *)(a2 + 8), 0.0);
  *(double *)(a2 + 8) = result;
  return result;
}

void *cnmatrix::CNMatrix<4u,1u,double>::~CNMatrix(void *result)
{
  *double result = &unk_26E5D3870;
  return result;
}

void RoseSyntheticApertureFiltering::PRRoseRangeFilter::addMeasurementWithoutVIO(uint64_t a1@<X0>, double *a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  double v10 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = *a2;
    uint64_t v12 = *((void *)a2 + 1);
    uint64_t v13 = *((void *)a2 + 2);
    double v14 = "YES";
    if (a3) {
      double v15 = "YES";
    }
    else {
      double v15 = "NO";
    }
    if (!a4) {
      double v14 = "NO";
    }
    int v33 = 134219010;
    double v34 = v11;
    __int16 v35 = 2048;
    uint64_t v36 = v12;
    __int16 v37 = 2048;
    uint64_t v38 = v13;
    __int16 v39 = 2080;
    uint64_t v40 = v15;
    __int16 v41 = 2080;
    uint64_t v42 = v14;
    _os_log_impl(&dword_230EC1000, v10, OS_LOG_TYPE_DEFAULT, "Measurement added without VIO: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, isCompanionMoving %s, isDeviceMoving %s", (uint8_t *)&v33, 0x34u);
  }
  if (*(unsigned char *)a1)
  {
    if (a3 & 1) != 0 || (a4)
    {
      RoseSyntheticApertureFiltering::PRRoseRangeFilter::propagateStateWithTime((RoseSyntheticApertureFiltering::PRRoseRangeFilter *)a1, *a2, a3);
      double v19 = a2[1];
      double v20 = a2[2];
      int v21 = (RoseSyntheticApertureFiltering::PRRoseRangeFilter *)a1;
      char v22 = a3;
    }
    else
    {
      __int16 v16 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        double v17 = a2[1];
        uint64_t v18 = *((void *)a2 + 2);
        int v33 = 134218240;
        double v34 = v17;
        __int16 v35 = 2048;
        uint64_t v36 = v18;
        _os_log_impl(&dword_230EC1000, v16, OS_LOG_TYPE_DEFAULT, "Range filter update with stationary companion and device: range %f m, uncertainty %f m", (uint8_t *)&v33, 0x16u);
      }
      double v19 = a2[1];
      double v20 = a2[2];
      int v21 = (RoseSyntheticApertureFiltering::PRRoseRangeFilter *)a1;
      char v22 = 0;
    }
    RoseSyntheticApertureFiltering::PRRoseRangeFilter::measurementUpdate(v21, v19, v20, v22);
  }
  else
  {
    double v23 = a2[1];
    *(double *)(a1 + 16) = v23;
    uint64_t v24 = *((void *)a2 + 2);
    *(void *)(a1 + 24) = v24;
    *(unsigned char *)a1 = 1;
    __int16 v25 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 134218240;
      double v34 = v23;
      __int16 v35 = 2048;
      uint64_t v36 = v24;
      _os_log_impl(&dword_230EC1000, v25, OS_LOG_TYPE_DEFAULT, "Initializing range filter without VIO: range %f m, uncertainty %f m", (uint8_t *)&v33, 0x16u);
    }
  }
  uint64_t v27 = (_DWORD *)(a1 + 8);
  int v26 = *(_DWORD *)(a1 + 8);
  *(double *)(a1 + 32) = *a2;
  uint64_t v28 = *(NSObject **)(a1 + 40);
  if (v26 == 1 && os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v33) = 0;
    _os_log_impl(&dword_230EC1000, v28, OS_LOG_TYPE_DEFAULT, "Range filter transitioning from VIO to non-VIO mode", (uint8_t *)&v33, 2u);
    uint64_t v28 = *(NSObject **)(a1 + 40);
  }
  *uint64_t v27 = 0;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = *(void *)(a1 + 24);
    double v29 = *(double *)(a1 + 32);
    uint64_t v31 = *(void *)(a1 + 16);
    int v33 = 134218754;
    double v34 = v29;
    __int16 v35 = 2048;
    uint64_t v36 = v31;
    __int16 v37 = 2048;
    uint64_t v38 = v30;
    __int16 v39 = 2080;
    uint64_t v40 = "NO";
    _os_log_impl(&dword_230EC1000, v28, OS_LOG_TYPE_DEFAULT, "Filter state after meas without VIO: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, with VIO: %s", (uint8_t *)&v33, 0x2Au);
  }
  long long v32 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)a5 = *(_OWORD *)v27;
  *(_OWORD *)(a5 + 16) = v32;
  *(double *)(a5 + 8) = fmax(*(double *)(a5 + 8), 0.0);
}

void cnmatrix::CNMatrix<3u,1u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<3u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(uint64_t a1)
{
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

void cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(uint64_t a1, char *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 >= 2)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 12);
    if (v4 >= 2)
    {
      if (!a2) {
        cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint();
      }
      int v6 = v4 + v2 - *(_DWORD *)(a1 + 20);
      if (v6 <= 0) {
        cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint();
      }
      bzero(a2, *(unsigned int *)(a1 + 16));
      int v7 = *(_DWORD *)(a1 + 16);
      if (v7 >= 3)
      {
        uint64_t v8 = (v7 - 1);
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = 1;
        do
        {
          double v11 = &a2[v10];
          if (!a2[v10])
          {
            uint64_t v12 = *(void *)(v9 + 8 * v10);
            int v13 = v10;
            do
            {
              int v13 = v13 * v6 % (int)v8;
              uint64_t v14 = *(void *)(v9 + 8 * v13);
              *(void *)(v9 + 8 * v13) = v12;
              *double v11 = 1;
              double v11 = &a2[v13];
              uint64_t v12 = v14;
            }
            while (!*v11);
          }
          ++v10;
        }
        while (v10 != v8);
      }
    }
  }
}

_DWORD *cnmatrix::FastResize<double>(_DWORD *result, int a2, int a3)
{
  if (a2 < 0) {
    cnmatrix::FastResize<double>();
  }
  if (result[6] < a2) {
    cnmatrix::FastResize<double>();
  }
  if (a3 < 0) {
    cnmatrix::FastResize<double>();
  }
  if (result[7] < a3) {
    cnmatrix::FastResize<double>();
  }
  result[2] = a2;
  result[3] = a3;
  result[4] = a3 * a2;
  result[5] = a2;
  return result;
}

uint64_t cnmatrix::CNMatrixBase<double>::WriteValue(uint64_t result, double a2)
{
  unsigned int v2 = *(int64x2_t **)(result + 32);
  if (!v2) {
    cnmatrix::CNMatrixBase<double>::WriteValue();
  }
  uint64_t v3 = *(unsigned int *)(result + 16);
  if ((int)v3 > 3)
  {
    unsigned int v4 = (int64x2_t *)((char *)v2 + 8 * (v3 - 2));
    uint64_t v5 = (v3 - 1) >> 1;
    int64x2_t v6 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
    do
    {
      *v2++ = v6;
      --v5;
    }
    while (v5);
    *unsigned int v4 = v6;
  }
  else if ((int)v3 >= 1)
  {
    do
    {
      *(double *)v2->i64 = a2;
      unsigned int v2 = (int64x2_t *)((char *)v2 + 8);
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t cnmatrix::CNMatrixBase<double>::operator()(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  if ((a2 & 0x80000000) != 0) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  if (*(_DWORD *)(a1 + 16) <= (signed int)a2) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  return v2 + 8 * a2;
}

void cnmatrix::CNMatrix<4u,1u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<4u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<4u,1u,double>::TransposeDataFootprint(uint64_t a1)
{
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

void cnmatrix::Multiply<double>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t __ldb = *(unsigned int *)(a1 + 12);
  if (__ldb != *(_DWORD *)(a2 + 8)) {
    cnmatrix::Multiply<double>();
  }
  if (a1 == a3) {
    cnmatrix::Multiply<double>();
  }
  if (a2 == a3) {
    cnmatrix::Multiply<double>();
  }
  uint64_t v7 = *(unsigned int *)(a1 + 8);
  uint64_t v8 = *(unsigned int *)(a2 + 12);
  cnmatrix::FastResize<double>((_DWORD *)a3, *(_DWORD *)(a1 + 8), *(_DWORD *)(a2 + 12));
  if (__ldb <= v8) {
    int v9 = v8;
  }
  else {
    int v9 = __ldb;
  }
  if (v9 <= v7) {
    int v9 = v7;
  }
  uint64_t v10 = *(const double **)(a1 + 32);
  if (v9 > 5)
  {
    cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7, v8, __ldb, 1.0, v10, v7, *(const double **)(a2 + 32), __ldb, 0.0, *(double **)(a3 + 32), *(_DWORD *)(a3 + 8));
  }
  else if (v8)
  {
    uint64_t v11 = 0;
    uint64_t v12 = *(double **)(a2 + 32);
    uint64_t v13 = *(void *)(a3 + 32);
    do
    {
      if (v7)
      {
        uint64_t v14 = 0;
        double v15 = (double *)v10;
        do
        {
          double v16 = 0.0;
          if (__ldb)
          {
            uint64_t v17 = __ldb;
            uint64_t v18 = v12;
            double v19 = v15;
            do
            {
              double v20 = *v18++;
              double v16 = v16 + *v19 * v20;
              v19 += v7;
              --v17;
            }
            while (v17);
          }
          *(double *)(v13 + 8 * (v11 * v7 + v14++)) = v16;
          ++v15;
        }
        while (v14 != v7);
      }
      ++v11;
      v12 += __ldb;
    }
    while (v11 != v8);
  }
}

float64x2_t cnmatrix::Add<double>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(a1 + 8);
  if (v4 != *(_DWORD *)(a2 + 8)) {
    cnmatrix::Add<double>();
  }
  int v7 = *(_DWORD *)(a1 + 12);
  if (v7 != *(_DWORD *)(a2 + 12)) {
    cnmatrix::Add<double>();
  }
  if (a1 == a3) {
    cnmatrix::Add<double>();
  }
  if (a2 == a3) {
    cnmatrix::Add<double>();
  }
  cnmatrix::FastResize<double>((_DWORD *)a3, v4, v7);
  uint64_t v9 = *(unsigned int *)(a3 + 16);
  if ((int)v9 > 3)
  {
    double v16 = *(float64x2_t **)(a1 + 32);
    uint64_t v17 = *(float64x2_t **)(a2 + 32);
    uint64_t v18 = (float64x2_t *)((char *)v16 + 8 * (v9 - 2));
    double v19 = *(float64x2_t **)(a3 + 32);
    double v20 = (float64x2_t *)((char *)v17 + 8 * (v9 - 2));
    int v21 = (float64x2_t *)((char *)v19 + 8 * (v9 - 2));
    uint64_t v22 = (v9 - 1) >> 1;
    do
    {
      float64x2_t v23 = *v16++;
      float64x2_t v24 = v23;
      float64x2_t v25 = *v17++;
      *v19++ = vaddq_f64(v24, v25);
      --v22;
    }
    while (v22);
    float64x2_t result = vaddq_f64(*v18, *v20);
    *int v21 = result;
  }
  else if ((int)v9 >= 1)
  {
    uint64_t v10 = *(double **)(a1 + 32);
    uint64_t v11 = *(double **)(a2 + 32);
    uint64_t v12 = *(float64_t **)(a3 + 32);
    do
    {
      double v13 = *v10++;
      double v14 = v13;
      double v15 = *v11++;
      result.f64[0] = v14 + v15;
      *v12++ = result.f64[0];
      --v9;
    }
    while (v9);
  }
  return result;
}

__n128 cnmatrix::CNMatrixBase<double>::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v2 = *(_DWORD *)(a2 + 8);
    if (*(_DWORD *)(a1 + 24) < v2) {
      cnmatrix::CNMatrixBase<double>::operator=();
    }
    unsigned int v3 = *(_DWORD *)(a2 + 12);
    if (*(_DWORD *)(a1 + 28) < v3) {
      cnmatrix::CNMatrixBase<double>::operator=();
    }
    *(_DWORD *)(a1 + 8) = v2;
    *(_DWORD *)(a1 + 12) = v3;
    uint64_t v4 = v3 * v2;
    *(_DWORD *)(a1 + 16) = v4;
    *(_DWORD *)(a1 + 20) = v2;
    int v5 = *(_DWORD *)(a2 + 16);
    if (v5 > 3)
    {
      uint64_t v10 = *(_OWORD **)(a1 + 32);
      uint64_t v11 = *(long long **)(a2 + 32);
      uint64_t v12 = (__n128 *)((char *)v10 + 8 * (v5 - 2));
      double v13 = (__n128 *)((char *)v11 + 8 * (v5 - 2));
      uint64_t v14 = (v5 - 1) >> 1;
      do
      {
        long long v15 = *v11++;
        *v10++ = v15;
        --v14;
      }
      while (v14);
      __n128 result = *v13;
      *uint64_t v12 = *v13;
    }
    else if ((int)v4 >= 1)
    {
      int64x2_t v6 = *(unint64_t **)(a2 + 32);
      int v7 = *(unint64_t **)(a1 + 32);
      do
      {
        unint64_t v8 = *v6++;
        result.n128_u64[0] = v8;
        *v7++ = v8;
        --v4;
      }
      while (v4);
    }
  }
  return result;
}

float64x2_t cnmatrix::Subtract<double>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(a1 + 8);
  if (v4 != *(_DWORD *)(a2 + 8)) {
    cnmatrix::Subtract<double>();
  }
  int v7 = *(_DWORD *)(a1 + 12);
  if (v7 != *(_DWORD *)(a2 + 12)) {
    cnmatrix::Subtract<double>();
  }
  if (a1 == a3) {
    cnmatrix::Subtract<double>();
  }
  if (a2 == a3) {
    cnmatrix::Subtract<double>();
  }
  cnmatrix::FastResize<double>((_DWORD *)a3, v4, v7);
  uint64_t v9 = *(unsigned int *)(a3 + 16);
  if ((int)v9 > 3)
  {
    double v16 = *(float64x2_t **)(a1 + 32);
    uint64_t v17 = *(float64x2_t **)(a2 + 32);
    uint64_t v18 = (float64x2_t *)((char *)v16 + 8 * (v9 - 2));
    double v19 = *(float64x2_t **)(a3 + 32);
    double v20 = (float64x2_t *)((char *)v17 + 8 * (v9 - 2));
    int v21 = (float64x2_t *)((char *)v19 + 8 * (v9 - 2));
    uint64_t v22 = (v9 - 1) >> 1;
    do
    {
      float64x2_t v23 = *v16++;
      float64x2_t v24 = v23;
      float64x2_t v25 = *v17++;
      *v19++ = vsubq_f64(v24, v25);
      --v22;
    }
    while (v22);
    float64x2_t result = vsubq_f64(*v18, *v20);
    *int v21 = result;
  }
  else if ((int)v9 >= 1)
  {
    uint64_t v10 = *(double **)(a1 + 32);
    uint64_t v11 = *(double **)(a2 + 32);
    uint64_t v12 = *(float64_t **)(a3 + 32);
    do
    {
      double v13 = *v10++;
      double v14 = v13;
      double v15 = *v11++;
      result.f64[0] = v14 - v15;
      *v12++ = result.f64[0];
      --v9;
    }
    while (v9);
  }
  return result;
}

void cnmatrix::Norm<double>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *__s1)
{
  if (a1 == a2) {
    cnmatrix::Norm<double>();
  }
  if (a1 == a3) {
    cnmatrix::Norm<double>();
  }
  if (a1 == a4) {
    cnmatrix::Norm<double>();
  }
  if (a2 == a3) {
    cnmatrix::Norm<double>();
  }
  if (a2 == a4) {
    cnmatrix::Norm<double>();
  }
  if (a3 == a4) {
    cnmatrix::Norm<double>();
  }
  uint64_t v9 = *(unsigned int *)(a1 + 16);
  if (*(_DWORD *)(a2 + 16) < (int)v9) {
    cnmatrix::Norm<double>();
  }
  if (v9)
  {
    uint64_t v11 = *(unsigned int *)(a1 + 8);
    uint64_t v12 = *(unsigned int *)(a1 + 12);
    int v13 = strcmp(__s1, "2");
    if (v11 == 1 || v12 == 1)
    {
      if (v13)
      {
        if (!strcmp(__s1, "1"))
        {
          __int16 v37 = *(double **)(a1 + 32);
          double v38 = fabs(*v37);
          if (v9 >= 2)
          {
            __int16 v39 = v37 + 1;
            uint64_t v40 = v9 - 1;
            do
            {
              double v41 = *v39++;
              double v38 = v38 + fabs(v41);
              --v40;
            }
            while (v40);
          }
        }
        else if (!strcmp(__s1, "inf"))
        {
          uint64_t v53 = *(double **)(a1 + 32);
          double v54 = fabs(*v53);
          if (v9 >= 2)
          {
            uint64_t v55 = v53 + 1;
            uint64_t v56 = v9 - 1;
            do
            {
              double v57 = *v55++;
              double v58 = fabs(v57);
              if (v58 > v54) {
                double v54 = v58;
              }
              --v56;
            }
            while (v56);
          }
        }
        else if (!strcmp(__s1, "-inf"))
        {
          v59 = *(double **)(a1 + 32);
          double v60 = fabs(*v59);
          if (v9 >= 2)
          {
            v61 = v59 + 1;
            uint64_t v62 = v9 - 1;
            do
            {
              double v63 = *v61++;
              double v64 = fabs(v63);
              if (v64 < v60) {
                double v60 = v64;
              }
              --v62;
            }
            while (v62);
          }
        }
        else
        {
          long double v75 = 0.0;
          if (sscanf(__s1, "%lg", &v75) != 1) {
            cnmatrix::Norm<double>();
          }
          long double v19 = v75;
          if (fabs(v75) >= 2.22044605e-16)
          {
            v65 = *(double **)(a1 + 32);
            long double v66 = pow(fabs(*v65), v75);
            if (v9 >= 2)
            {
              v67 = v65 + 1;
              uint64_t v68 = v9 - 1;
              do
              {
                double v69 = *v67++;
                long double v66 = v66 + pow(fabs(v69), v19);
                --v68;
              }
              while (v68);
            }
            pow(v66, 1.0 / v19);
          }
        }
      }
      else
      {
        double v20 = *(double **)(a1 + 32);
        double v21 = *v20 * *v20;
        if (v9 >= 2)
        {
          uint64_t v22 = v20 + 1;
          uint64_t v23 = v9 - 1;
          do
          {
            double v24 = *v22++;
            double v21 = v21 + v24 * v24;
            --v23;
          }
          while (v23);
        }
      }
    }
    else if (v13)
    {
      if (!strcmp(__s1, "1"))
      {
        if (v12)
        {
          uint64_t v25 = 0;
          uint64_t v26 = *(void *)(a1 + 32);
          uint64_t v27 = *(double **)(a2 + 32);
          int v28 = 1;
          do
          {
            double v29 = fabs(*(double *)(v26 + 8 * (v11 * v25)));
            v27[v25] = v29;
            uint64_t v30 = v11 - 1;
            unsigned int v31 = v28;
            if (v11 >= 2)
            {
              do
              {
                double v29 = v29 + fabs(*(double *)(v26 + 8 * v31));
                v27[v25] = v29;
                ++v31;
                --v30;
              }
              while (v30);
            }
            ++v25;
            v28 += v11;
          }
          while (v25 != v12);
          double v32 = *v27;
          int v33 = v27 + 1;
          uint64_t v34 = v12 - 1;
          do
          {
            double v35 = *v33++;
            double v36 = v35;
            if (v35 > v32) {
              double v32 = v36;
            }
            --v34;
          }
          while (v34);
        }
      }
      else if (!strcmp(__s1, "inf"))
      {
        if (v11)
        {
          uint64_t v42 = *(double **)(a1 + 32);
          uint64_t v43 = *(double **)(a2 + 32);
          uint64_t v44 = v11;
          do
          {
            double v45 = *v42++;
            *v43++ = fabs(v45);
            --v44;
          }
          while (v44);
        }
        if (v12 <= 1)
        {
          double v47 = *(double **)(a2 + 32);
        }
        else
        {
          uint64_t v46 = *(void *)(a1 + 32);
          double v47 = *(double **)(a2 + 32);
          int v48 = 1;
          unsigned int v49 = v11;
          do
          {
            uint64_t v50 = v11;
            unsigned int v51 = v49;
            __int16 v52 = v47;
            if (v11)
            {
              do
              {
                *__int16 v52 = fabs(*(double *)(v46 + 8 * v51)) + *v52;
                ++v52;
                ++v51;
                --v50;
              }
              while (v50);
            }
            ++v48;
            v49 += v11;
          }
          while (v48 != v12);
        }
        double v70 = *v47;
        if (v11 >= 2)
        {
          v71 = v47 + 1;
          uint64_t v72 = v11 - 1;
          do
          {
            double v73 = *v71++;
            double v74 = v73;
            if (v73 > v70) {
              double v70 = v74;
            }
            --v72;
          }
          while (v72);
        }
      }
      else
      {
        if (strcmp(__s1, "fro")) {
          cnmatrix::Norm<double>();
        }
        double v14 = *(double **)(a1 + 32);
        double v15 = *v14 * *v14;
        if (v9 >= 2)
        {
          double v16 = v14 + 1;
          uint64_t v17 = v9 - 1;
          do
          {
            double v18 = *v16++;
            double v15 = v15 + v18 * v18;
            --v17;
          }
          while (v17);
        }
      }
    }
    else
    {
      cnmatrix::SingularValues<double>(a1, a2, a3, a4);
    }
  }
}

void *cnmatrix::CNMatrix<308u,1u,double>::~CNMatrix(void *result)
{
  *float64x2_t result = &unk_26E5D3870;
  return result;
}

void cnmatrix::CNMatrix<308u,1u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<308u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<308u,1u,double>::TransposeDataFootprint(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

_DWORD *cnmatrix::SingularValues<double>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v6 = *(_DWORD *)(a1 + 8);
  unsigned int v5 = *(_DWORD *)(a1 + 12);
  if (v5 <= v6) {
    int v7 = *(_DWORD *)(a1 + 8);
  }
  else {
    int v7 = *(_DWORD *)(a1 + 12);
  }
  if (v5 >= v6) {
    unsigned int v8 = *(_DWORD *)(a1 + 8);
  }
  else {
    unsigned int v8 = *(_DWORD *)(a1 + 12);
  }
  if (a1 == a2) {
    cnmatrix::SingularValues<double>();
  }
  if (a1 == a3) {
    cnmatrix::SingularValues<double>();
  }
  if (a1 == a4) {
    cnmatrix::SingularValues<double>();
  }
  if (a2 == a3) {
    cnmatrix::SingularValues<double>();
  }
  if (a2 == a4) {
    cnmatrix::SingularValues<double>();
  }
  if (a3 == a4) {
    cnmatrix::SingularValues<double>();
  }
  unsigned int v11 = *(_DWORD *)(a3 + 28) * *(_DWORD *)(a3 + 24);
  if (!v11) {
    cnmatrix::SingularValues<double>();
  }
  if (v11 < 3 * v8 + v7) {
    cnmatrix::SingularValues<double>();
  }
  if (v11 < 5 * v8) {
    cnmatrix::SingularValues<double>();
  }
  if (*(_DWORD *)(a2 + 24) < v6) {
    cnmatrix::SingularValues<double>();
  }
  if (*(_DWORD *)(a2 + 28) < v5) {
    cnmatrix::SingularValues<double>();
  }
  if (*(_DWORD *)(a4 + 24) < v8) {
    cnmatrix::SingularValues<double>();
  }
  if (!*(_DWORD *)(a4 + 28)) {
    cnmatrix::SingularValues<double>();
  }
  cnmatrix::CNMatrixBase<double>::operator=(a2, a1);
  __CLPK_integer v12 = *(_DWORD *)(a2 + 8);
  __CLPK_integer v13 = *(_DWORD *)(a2 + 12);
  double v14 = *(__CLPK_doublereal **)(a2 + 32);
  double v15 = *(__CLPK_doublereal **)(a4 + 32);
  double v16 = *(__CLPK_doublereal **)(a3 + 32);
  char __jobu = 78;
  char __jobvt = 78;
  __CLPK_integer __n = v13;
  __CLPK_integer __m = v12;
  __CLPK_integer __lda = v12;
  __CLPK_integer __ldvt = 1;
  __CLPK_integer __ldu = 1;
  __CLPK_integer v20 = 0;
  __CLPK_integer __lwork = v11;
  uint64_t v17 = dgesvd_(&__jobu, &__jobvt, &__m, &__n, v14, &__lda, v15, 0, &__ldu, 0, &__ldvt, v16, &__lwork, &v20);
  __CLPK_integer v18 = v20;
  if (v20)
  {
    LOWORD(__m) = 4;
    if (v20 < 0) {
      LOBYTE(__n) = 5;
    }
    else {
      LOBYTE(__n) = 4;
    }
    uint64_t v17 = cnprint::CNPrinter::Print();
  }
  if (v11 < **(double **)(a3 + 32)
    && cnprint::CNPrinter::GetLogLevel((cnprint::CNPrinter *)v17) <= 1)
  {
    LOWORD(__m) = 4;
    LOBYTE(__n) = 1;
    cnprint::CNPrinter::Print();
  }
  if (v18) {
    cnmatrix::SingularValues<double>();
  }
  cnmatrix::FastResize<double>((_DWORD *)a3, *(_DWORD *)(a3 + 24), *(_DWORD *)(a3 + 28));
  return cnmatrix::FastResize<double>((_DWORD *)a4, v8, 1);
}

void sub_230EC63A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EC6428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC649C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC66A8(_Unwind_Exception *a1)
{
  unsigned int v6 = v4;

  _Unwind_Resume(a1);
}

void sub_230EC6A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EC6D74(_Unwind_Exception *a1)
{
  unsigned int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_230EC6E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC6EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC6FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC7028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC70A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC7130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC7344(_Unwind_Exception *a1)
{
  unsigned int v6 = v4;

  _Unwind_Resume(a1);
}

void sub_230EC7AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EC8084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_230EC8248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EC85D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_230EC8790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EC88C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC8988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC8ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC8C04(_Unwind_Exception *a1)
{
  unsigned int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_230EC8D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC8DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC8E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC8FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC90D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC9248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void sub_230EC93CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EC9500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_230EC97A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_230EC98B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

double PRCommonConvertTicksToSeconds(unint64_t a1)
{
  double v2 = *(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds;
  if (*(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds == 0.0)
  {
    if (mach_timebase_info(&info)) {
      PRCommonConvertTicksToSeconds();
    }
    if (info.denom)
    {
      uint32_t denom = info.denom;
      uint32_t numer = info.numer;
      do
      {
        uint32_t v5 = denom;
        uint32_t denom = numer % denom;
        uint32_t numer = v5;
      }
      while (denom);
    }
    else
    {
      uint32_t v5 = info.numer;
    }
    unsigned int v6 = 1000000000;
    uint32_t v7 = info.numer / v5;
    do
    {
      uint32_t v8 = v7;
      uint32_t v7 = v6;
      unsigned int v6 = v8 % v6;
    }
    while (v6);
    double v2 = (double)(info.numer / v5 / v7) / (double)(0x3B9ACA00 / v7 * (unint64_t)(info.denom / v5));
    *(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds = v2;
  }
  return v2 * (double)a1;
}

double PRCommonGetMachTimeSeconds(void)
{
  uint64_t v0 = mach_absolute_time();
  return PRCommonConvertTicksToSeconds(v0);
}

double PRCommonGetMachContinuousTimeSeconds(void)
{
  uint64_t v0 = mach_continuous_time();
  return PRCommonConvertTicksToSeconds(v0);
}

BOOL PRCommonGetAllTimes(double *a1, double *a2, double *a3)
{
  int times = mach_get_times();
  if (!times)
  {
    if (a1) {
      *a1 = (double)v9 / 1000000000.0 + (double)v8 - *MEMORY[0x263EFFAF8];
    }
    if (a2) {
      *a2 = PRCommonConvertTicksToSeconds(0);
    }
    if (a3) {
      *a3 = PRCommonConvertTicksToSeconds(0);
    }
  }
  return times == 0;
}

id PRCommonConvertNSDataToHexNSString(NSData *a1, int a2)
{
  unsigned int v3 = a1;
  memset(&v16, 0, sizeof(v16));
  std::vector<unsigned char>::vector(&v14, [(NSData *)v3 length]);
  [(NSData *)v3 getBytes:v14 length:[(NSData *)v3 length]];
  int v4 = (unsigned __int8 *)v14;
  uint32_t v5 = v15;
  if (v14 == v15)
  {
    uint64_t v9 = &v16;
  }
  else
  {
    do
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%02X", *v4);
      id v6 = objc_claimAutoreleasedReturnValue();
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);

      if ((v13 & 0x80u) == 0) {
        uint32_t v7 = __p;
      }
      else {
        uint32_t v7 = (void **)__p[0];
      }
      if ((v13 & 0x80u) == 0) {
        std::string::size_type v8 = v13;
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      if (a2) {
        std::string::insert(&v16, 0, (const std::string::value_type *)v7, v8);
      }
      else {
        std::string::append(&v16, (const std::string::value_type *)v7, v8);
      }
      if ((char)v13 < 0) {
        operator delete(__p[0]);
      }
      ++v4;
    }
    while (v4 != v5);
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v9 = &v16;
    }
    else {
      uint64_t v9 = (std::string *)v16.__r_.__value_.__r.__words[0];
    }
  }
  uint64_t v10 = [NSString stringWithUTF8String:v9];
  if (v14)
  {
    double v15 = (unsigned __int8 *)v14;
    operator delete(v14);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }

  return v10;
}

void sub_230EC9E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id PRCommonConvertHexNSStringToNSData(NSString *a1)
{
  v1 = a1;
  if ([(NSString *)v1 length])
  {
    double v2 = 0;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[(NSString *)v1 UTF8String]);
    double v2 = objc_opt_new();
    __int16 v11 = 0;
    BOOL v3 = (v14 & 0x80u) != 0;
    unint64_t v4 = v14;
    if ((v14 & 0x80u) != 0) {
      unint64_t v4 = v13;
    }
    if (v4 >= 2)
    {
      uint64_t v5 = 0;
      do
      {
        if (v3) {
          p_p = (char *)__p;
        }
        else {
          p_p = (char *)&__p;
        }
        *(_WORD *)__str = *(_WORD *)&p_p[v5];
        HIBYTE(v11) = strtol(__str, 0, 16);
        [v2 appendBytes:(char *)&v11 + 1 length:1];
        unint64_t v7 = v5 + 3;
        v5 += 2;
        BOOL v3 = (v14 & 0x80u) != 0;
        unint64_t v8 = v14;
        if ((v14 & 0x80u) != 0) {
          unint64_t v8 = v13;
        }
      }
      while (v8 > v7);
    }
    if ((char)v14 < 0) {
      operator delete(__p);
    }
  }

  return v2;
}

void sub_230EC9FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

char *PRCommonSerializePrintableState(void *a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x230FCEF40]();
  id v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:200 options:0 error:0];
  if ((unint64_t)[v6 length] > 0x8000)
  {
    unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"WARNING: statedump too big (%d > %d)", objc_msgSend(v6, "length"), 0x8000);
    unint64_t v8 = (void *)MEMORY[0x263F08AC0];
    id v15 = v3;
    v16[0] = v7;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v10 = [v8 dataWithPropertyList:v9 format:200 options:0 error:0];

    id v6 = (void *)v10;
  }
  __int16 v11 = (char *)malloc_type_calloc(1uLL, [v6 length] + 200, 0x7E1CA1B2uLL);
  *(_DWORD *)__int16 v11 = 1;
  *((_DWORD *)v11 + 1) = [v6 length];
  id v12 = [NSString stringWithFormat:@"[nearbyd] %@", v3];
  strlcpy(v11 + 136, (const char *)[v12 UTF8String], 0x40uLL);

  id v13 = v6;
  memcpy(v11 + 200, (const void *)[v13 bytes], objc_msgSend(v13, "length"));

  return v11;
}

{
  id v3;
  id v4;
  void *v5;
  char *v6;
  id v8;
  void v9[2];

  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  unint64_t v8 = v3;
  v9[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = PRCommonSerializePrintableState(v3, v5);

  return v6;
}

void sub_230ECA21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECA324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    id v4 = (char *)a1[1];
    uint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_230ECA3A4(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  float64x2_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264BC1AC0, MEMORY[0x263F8C060]);
}

void sub_230ECA464(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  float64x2_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    id v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    id v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void sub_230ECA940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECACA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECAFA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECB548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230ECB72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v11 = v10;

  _Unwind_Resume(a1);
}

void sub_230ECB7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230ECBA8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECBF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECC150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_230ECC2C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECC4A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECC768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECC830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230ECC8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230ECCA24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECCB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECCDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_230ECCEBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230ECCFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_230ECD0C8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_230ECD340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECD4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230ECD750(_Unwind_Exception *a1)
{
  id v6 = v2;

  _Unwind_Resume(a1);
}

void sub_230ECDA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECDF78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECE160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_230ECE258(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_230ECE47C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECEA3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECEB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230ECF140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230ECF428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230ECF534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v11 = v10;

  _Unwind_Resume(a1);
}

void sub_230ECF610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230ECF824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)PRBTLocalizer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void std::default_delete<BTFinding::PRRSSIFilter>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a2 + 88);
    if (v3)
    {
      *(void *)(a2 + 96) = v3;
      operator delete(v3);
    }
    size_t v4 = *(void **)(a2 + 64);
    if (v4)
    {
      *(void *)(a2 + 72) = v4;
      operator delete(v4);
    }
    size_t v5 = *(void **)(a2 + 40);
    if (v5)
    {
      *(void *)(a2 + 48) = v5;
      operator delete(v5);
    }

    JUMPOUT(0x230FCEC50);
  }
}

RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::PRRoseSyntheticApertureBatchFilter(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  *(_DWORD *)this = 0;
  *((unsigned char *)this + 4) = 0;
  *((_DWORD *)this + 2) = 0;
  *((unsigned char *)this + 12) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 14) = 0;
  *((unsigned char *)this + 60) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 26) = 0;
  *((unsigned char *)this + 108) = 0;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 9) = 0u;
  double v2 = (char *)this + 168;
  *((_OWORD *)this + 2) = 0u;
  *(void *)((char *)this + 45) = 0;
  *((_OWORD *)this + 5) = 0u;
  *(void *)((char *)this + 93) = 0;
  *((_OWORD *)this + 8) = 0u;
  *((void *)this + 24) = 0x100000003;
  *((void *)this + 20) = 0;
  *((void *)this + 21) = &unk_26E5D3818;
  *((_OWORD *)this + 11) = xmmword_230EF8BF0;
  *((void *)this + 25) = (char *)this + 208;
  cnmatrix::FastResize<double>((_DWORD *)this + 42, 3, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)v2, 0.0);
  *((void *)this + 33) = 0x100000004;
  *((void *)this + 30) = &unk_26E5D38A0;
  *(_OWORD *)((char *)this + 248) = xmmword_230EF8C10;
  *((void *)this + 34) = (char *)this + 280;
  cnmatrix::FastResize<double>((_DWORD *)this + 60, 4, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)this + 240, 0.0);
  *((void *)this + 42) = 0x300000003;
  *((void *)this + 39) = &unk_26E5D3970;
  *((_OWORD *)this + 20) = xmmword_230EF8E90;
  *((void *)this + 43) = (char *)this + 352;
  *((void *)this + 53) = 0;
  *((unsigned char *)this + 440) = 0;
  *((void *)this + 60) = 0x100000003;
  *((void *)this + 57) = &unk_26E5D3818;
  *((_OWORD *)this + 29) = xmmword_230EF8BF0;
  *((void *)this + 61) = (char *)this + 496;
  *((void *)this + 68) = 0x100000003;
  *((void *)this + 65) = &unk_26E5D3818;
  *((_OWORD *)this + 33) = xmmword_230EF8BF0;
  *((void *)this + 69) = (char *)this + 560;
  *(_OWORD *)((char *)this + 584) = 0u;
  *(_OWORD *)((char *)this + 600) = 0u;
  *((void *)this + 77) = 0x3FF0000000000000;
  *((void *)this + 78) = 0;
  *((void *)this + 83) = 0;
  id v3 = (char *)operator new(0x28uLL);
  *((void *)this + 79) = v3;
  *((void *)this + 80) = v3 + 40;
  *((void *)this + 82) = v3;
  *((void *)this + 81) = v3;
  *((_OWORD *)this + 42) = 0u;
  *((_OWORD *)this + 43) = 0u;
  *((_OWORD *)this + 44) = 0u;
  *((_OWORD *)this + 45) = 0u;
  *((void *)this + 92) = 0;
  uint64_t v9 = 0x100000003;
  *(void *)buf = &unk_26E5D3818;
  long long v8 = xmmword_230EF8BF0;
  uint64_t v10 = &v11;
  cnmatrix::FastResize<double>(buf, 3, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)buf, 0.0);
  *((void *)this + 93) = 0;
  *((void *)this + 94) = 0;
  *((void *)this + 95) = 0x7FF8000000000000;
  *((void *)this + 97) = 0;
  *((void *)this + 96) = 0;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)this + 784, (uint64_t)buf);
  unsigned int v4 = 0;
  *((_DWORD *)this + 212) = 0;
  *((void *)this + 107) = 0;
  *((void *)this + 111) = 0x100000003;
  *((void *)this + 108) = &unk_26E5D3818;
  *(_OWORD *)((char *)this + 872) = xmmword_230EF8BF0;
  *((void *)this + 112) = (char *)this + 904;
  *((_DWORD *)this + 232) = 0x1000000;
  *((_WORD *)this + 466) = 1;
  *((unsigned char *)this + 934) = 0;
  *((_DWORD *)this + 234) = 0;
  *((_WORD *)this + 470) = 0;
  *((void *)this + 118) = 0x1000000032;
  *((void *)this + 119) = 0x3F847AE147AE147BLL;
  *((_OWORD *)this + 60) = xmmword_230EF8EA0;
  *((_OWORD *)this + 61) = xmmword_230EF8EB0;
  do
  {
    *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)this + 456, v4) = 0;
    *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)this + 520, v4++) = 0;
  }
  while (v4 != 3);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::reserve((uint64_t *)this + 84, 4uLL);
  size_t v5 = os_log_create("com.apple.proximity", "3DBatchFilter");
  *((void *)this + 56) = v5;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230EC1000, v5, OS_LOG_TYPE_DEFAULT, "PRRoseSyntheticApertureBatchFilter constructed", buf, 2u);
  }
  return this;
}

void sub_230ECFF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void **a10, void **a11, void **a12, uint64_t a13, uint64_t a14, void **a15)
{
  *double v21 = &unk_26E5D3870;
  void *v20 = &unk_26E5D3870;
  a15 = (void **)(v15 + 720);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a15);
  a15 = (void **)(v15 + 696);
  std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100](&a15);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a15);
  boost::circular_buffer<double,std::allocator<double>>::destroy(v15 + 632);
  void *v19 = &unk_26E5D3870;
  *__CLPK_integer v18 = &unk_26E5D3870;
  *a9 = &unk_26E5D3870;
  *uint64_t v17 = &unk_26E5D3870;
  *std::string v16 = &unk_26E5D3870;
  std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__destroy_vector::operator()[abi:ne180100](&a15);
  uint64_t v23 = *a10;
  if (*a10)
  {
    *(void *)(v15 + 120) = v23;
    operator delete(v23);
  }
  double v24 = *a11;
  if (*a11)
  {
    *(void *)(v15 + 72) = v24;
    operator delete(v24);
  }
  uint64_t v25 = *a12;
  if (*a12)
  {
    *(void *)(v15 + 24) = v25;
    operator delete(v25);
  }
  _Unwind_Resume(a1);
}

void std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - *a1) >> 4) < a2)
  {
    if (a2 >= 0x24924924924924ALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v14 = v3;
    __p = std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(v3, a2);
    uint64_t v11 = (char *)__p + v5;
    id v12 = (char *)__p + v5;
    id v13 = (char *)__p + 112 * v6;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(a1, &__p);
    uint64_t v7 = v11;
    long long v8 = v12;
    if (v12 != v11)
    {
      uint64_t v9 = v12 - 72;
      do
      {
        *((void *)v8 - 9) = &unk_26E5D3870;
        v9 -= 112;
        v8 -= 112;
      }
      while (v8 != v7);
      id v12 = v7;
    }
    if (__p) {
      operator delete(__p);
    }
  }
}

void sub_230ED020C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalRangeMeas>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *cnmatrix::CNMatrix<3u,3u,double>::~CNMatrix(void *result)
{
  *float64x2_t result = &unk_26E5D3870;
  return result;
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getCurrentRotatedSolution(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (char *)this + 312;
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v11, *((_DWORD *)this + 81), *((_DWORD *)this + 80));
  cnmatrix::Transpose<double>((uint64_t)v4, v11);
  uint64_t v5 = *((void *)this + 18);
  uint64_t v8 = 0x100000003;
  uint64_t v6 = &unk_26E5D3818;
  long long v7 = xmmword_230EF8BF0;
  uint64_t v9 = &v10;
  cnmatrix::Subtract<double>(v5, (uint64_t)this + 168, (uint64_t)&v6);
  *(void *)(a2 + 24) = 0x100000003;
  *(void *)a2 = &unk_26E5D3818;
  *(_OWORD *)(a2 + 8) = xmmword_230EF8BF0;
  *(void *)(a2 + 32) = a2 + 40;
  cnmatrix::Multiply<double>((uint64_t)v11, (uint64_t)&v6, a2);
}

void sub_230ED0334(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getCurrentRotatedCovariance(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (char *)this + 312;
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v6, *((_DWORD *)this + 81), *((_DWORD *)this + 80));
  cnmatrix::Transpose<double>((uint64_t)v4, v6);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v5, *((void *)this + 18) + 128);
  *(void *)(a2 + 24) = 0x300000003;
  *(void *)a2 = &unk_26E5D3970;
  *(_OWORD *)(a2 + 8) = xmmword_230EF8E90;
  *(void *)(a2 + 32) = a2 + 40;
  cnmatrix::Multiply<double>((uint64_t)v6, (uint64_t)v5, a2);
}

void sub_230ED0400(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

double RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getBatchOrAoASolution@<D0>(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this@<X0>, void *a2@<X8>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 934) || *((unsigned char *)this + 933)) {
    goto LABEL_3;
  }
  if (*((unsigned char *)this + 928))
  {
    uint64_t v6 = *((void *)this + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *((void *)this + 76);
      int v10 = 134217984;
      uint64_t v11 = v7;
      _os_log_impl(&dword_230EC1000, v6, OS_LOG_TYPE_DEFAULT, "Returning solution from AoA at %f s", (uint8_t *)&v10, 0xCu);
    }
    *a2 = *((void *)this + 6);
    *(void *)((char *)a2 + 5) = *(void *)((char *)this + 53);
    a2[3] = 0;
    a2[4] = 0;
    a2[2] = 0;
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(a2 + 2, *((const void **)this + 8), *((void *)this + 9), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)this + 9) - *((void *)this + 8)) >> 3));
    uint64_t v4 = (double *)((char *)this + 88);
  }
  else
  {
    if (!*((unsigned char *)this + 929))
    {
LABEL_3:
      *a2 = *(void *)this;
      *(void *)((char *)a2 + 5) = *(void *)((char *)this + 5);
      a2[3] = 0;
      a2[4] = 0;
      a2[2] = 0;
      std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(a2 + 2, *((const void **)this + 2), *((void *)this + 3), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)this + 3) - *((void *)this + 2)) >> 3));
      uint64_t v4 = (double *)((char *)this + 40);
      goto LABEL_4;
    }
    uint64_t v8 = *((void *)this + 56);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *((void *)this + 107);
      int v10 = 134217984;
      uint64_t v11 = v9;
      _os_log_impl(&dword_230EC1000, v8, OS_LOG_TYPE_DEFAULT, "Returning solution from straight path estimator at %f s", (uint8_t *)&v10, 0xCu);
    }
    *a2 = *((void *)this + 12);
    *(void *)((char *)a2 + 5) = *(void *)((char *)this + 101);
    a2[3] = 0;
    a2[4] = 0;
    a2[2] = 0;
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(a2 + 2, *((const void **)this + 14), *((void *)this + 15), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)this + 15) - *((void *)this + 14)) >> 3));
    uint64_t v4 = (double *)((char *)this + 136);
  }
LABEL_4:
  double result = *v4;
  a2[5] = *(void *)v4;
  return result;
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::updateCurrentBatchSolution(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this@<X0>, double a2@<D0>, double a3@<D1>, void *a4@<X8>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *((double *)this + 29) = a3;
  if (a2 - *((double *)this + 74) <= 10.0 || *((void *)this + 85) == *((void *)this + 84))
  {
    if (*((unsigned char *)this + 933))
    {
      *((unsigned char *)this + 12) = 0;
      int v7 = *((_DWORD *)this + 2);
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkVerticalAmbiguityResolution(this);
      if (v7 != *((_DWORD *)this + 2))
      {
        uint64_t v8 = *((void *)this + 56);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_230EC1000, v8, OS_LOG_TYPE_DEFAULT, "Vertical state changed with the pose update", (uint8_t *)&v11, 2u);
        }
        *((unsigned char *)this + 12) = 1;
      }
    }
  }
  else
  {
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::reinitFilter(this);
    *(_DWORD *)this = 0;
    *((unsigned char *)this + 4) = 0;
    *((_DWORD *)this + 2) = 0;
    *((unsigned char *)this + 12) = 0;
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>((char *)this + 16, 0, 0, 0);
    *((void *)this + 5) = 0;
  }
  if (*((unsigned char *)this + 928))
  {
    double v9 = *((double *)this + 76);
    if (a2 - v9 > 10.0)
    {
      *((unsigned char *)this + 928) = 0;
      int v10 = *((void *)this + 56);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134218240;
        double v12 = v9;
        __int16 v13 = 2048;
        double v14 = a2;
        _os_log_impl(&dword_230EC1000, v10, OS_LOG_TYPE_DEFAULT, "AoA Solution from AoA at %f s is no longer valid - current time is %f s", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getBatchOrAoASolution(this, a4);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::reinitFilter(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  uint64_t v2 = *((void *)this + 85);
  uint64_t v3 = *((void *)this + 84);
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 72;
    do
    {
      *(void *)(v2 - 72) = &unk_26E5D3870;
      v4 -= 112;
      v2 -= 112;
    }
    while (v2 != v3);
  }
  *((void *)this + 85) = v3;
  uint64_t v5 = *((void *)this + 88);
  uint64_t v6 = *((void *)this + 87);
  if (v5 != v6)
  {
    uint64_t v7 = v5 - 176;
    do
    {
      *(void *)(v5 - 112) = &unk_26E5D3870;
      *(void *)(v5 - 176) = &unk_26E5D3870;
      v7 -= 208;
      v5 -= 208;
    }
    while (v5 != v6);
  }
  *((void *)this + 88) = v6;
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::resetFilter(this);
  uint64_t v8 = (void *)*((void *)this + 2);
  *(void *)((char *)this + 5) = 0;
  *(void *)this = 0;
  if (v8)
  {
    *((void *)this + 3) = v8;
    operator delete(v8);
  }
  long long v9 = 0uLL;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  int v10 = (void *)*((void *)this + 8);
  *((void *)this + 6) = 0;
  *(void *)((char *)this + 53) = 0;
  if (v10)
  {
    *((void *)this + 9) = v10;
    operator delete(v10);
    long long v9 = 0uLL;
  }
  *((_OWORD *)this + 4) = v9;
  *((_OWORD *)this + 5) = v9;
  int v11 = (void *)*((void *)this + 14);
  *((void *)this + 12) = 0;
  *(void *)((char *)this + 101) = 0;
  if (v11)
  {
    *((void *)this + 15) = v11;
    operator delete(v11);
  }
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  uint64_t v12 = *((void *)this + 18);
  *((void *)this + 29) = 0;
  *(_OWORD *)((char *)this + 584) = 0u;
  *(_OWORD *)((char *)this + 600) = 0u;
  *((void *)this + 77) = 0x3FF0000000000000;
  std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__base_destruct_at_end[abi:ne180100]((uint64_t)this + 144, v12);
  uint64_t v13 = *((void *)this + 83);
  uint64_t v15 = *((void *)this + 80);
  uint64_t v14 = *((void *)this + 81);
  if (v13 >= (v15 - v14) >> 3) {
    v13 -= (v15 - *((void *)this + 79)) >> 3;
  }
  *((void *)this + 81) = v14 + 8 * v13;
  *((void *)this + 83) = 0;
  *((_WORD *)this + 464) = 0;
  *((void *)this + 107) = 0;
  *((unsigned char *)this + 440) = 0;
  std::string v16 = *((void *)this + 56);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_230EC1000, v16, OS_LOG_TYPE_DEFAULT, "Batch filter is reinitialized", v17, 2u);
  }
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkVerticalAmbiguityResolution(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  *((_DWORD *)this + 234) = 0;
  *((unsigned char *)this + 940) = 0;
  if (*((unsigned char *)this + 933))
  {
    uint64_t v2 = *((void *)this + 18);
    uint64_t v47 = 0x100000003;
    double v45 = &unk_26E5D3818;
    long long v46 = xmmword_230EF8BF0;
    int v48 = v49;
    cnmatrix::Subtract<double>(v2, (uint64_t)this + 168, (uint64_t)&v45);
    double v3 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v45, 0);
    double v4 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v45, 0);
    double v5 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v45, 2u);
    if (sqrt(v5 * cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v45, 2u) + v3 * v4) <= 2.0)
    {
      uint64_t v6 = *((void *)this + 18);
      uint64_t v7 = *((void *)this + 19);
      if (v6 == v7)
      {
LABEL_15:
        *((_DWORD *)this + 234) = 1;
      }
      else
      {
        while (1)
        {
          double v8 = cnmatrix::CNMatrixBase<double>::operator()(v6 + 128, 1, 1);
          double v9 = cnmatrix::CNMatrixBase<double>::operator()(v6, 1u);
          double v10 = sqrt(v8);
          double v11 = v9 - *((double *)this + 29);
          double v12 = v10 + v11;
          double v13 = v11 - v10;
          if (v13 <= -2.5 && v12 >= -2.5) {
            break;
          }
          if (v13 <= 2.5 && v12 >= 2.5) {
            break;
          }
          v6 += 432;
          if (v6 == v7) {
            goto LABEL_15;
          }
        }
      }
    }
    unint64_t v16 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)this + 85) - *((void *)this + 84)) >> 4);
    __p = 0;
    uint64_t v43 = 0;
    unint64_t v44 = 0;
    std::vector<double>::reserve(&__p, v16);
    uint64_t v17 = *((void *)this + 84);
    uint64_t v18 = *((void *)this + 85);
    if (v17 != v18)
    {
      uint64_t v19 = *((void *)this + 18);
      do
      {
        uint64_t v39 = 0x100000003;
        __int16 v37 = &unk_26E5D3818;
        long long v38 = xmmword_230EF8BF0;
        uint64_t v40 = &v41;
        cnmatrix::Subtract<double>(v19, v17 + 40, (uint64_t)&v37);
        double v20 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v37, 0);
        double v21 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v37, 2u);
        if (sqrt(v21 * v21 + v20 * v20) <= 1.0)
        {
          double v22 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v37, 1u);
          double v23 = v22;
          double v24 = v43;
          if ((unint64_t)v43 >= v44)
          {
            uint64_t v26 = (double *)__p;
            int64_t v27 = ((char *)v43 - (unsigned char *)__p) >> 3;
            unint64_t v28 = v27 + 1;
            if ((unint64_t)(v27 + 1) >> 61) {
              std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v29 = v44 - (void)__p;
            if ((uint64_t)(v44 - (void)__p) >> 2 > v28) {
              unint64_t v28 = v29 >> 2;
            }
            if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v30 = v28;
            }
            if (v30)
            {
              unsigned int v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v44, v30);
              uint64_t v26 = (double *)__p;
              double v24 = v43;
            }
            else
            {
              unsigned int v31 = 0;
            }
            double v32 = (double *)&v31[8 * v27];
            *double v32 = v23;
            uint64_t v25 = v32 + 1;
            while (v24 != v26)
            {
              uint64_t v33 = *((void *)v24-- - 1);
              *((void *)v32-- - 1) = v33;
            }
            __p = v32;
            uint64_t v43 = v25;
            unint64_t v44 = (unint64_t)&v31[8 * v30];
            if (v26) {
              operator delete(v26);
            }
          }
          else
          {
            *uint64_t v43 = v22;
            uint64_t v25 = v24 + 1;
          }
          uint64_t v43 = v25;
        }
        v17 += 112;
      }
      while (v17 != v18);
    }
    uint64_t v34 = (double *)__p;
    if (__p != v43)
    {
      v49[31] = 0;
      double v35 = std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<double *>,std::__wrap_iter<double *>,std::__identity,std::__less<void,void>>((double *)__p, v43);
      if (*v36 - *v35 >= 0.5)
      {
        *((_DWORD *)this + 234) = 2;
        *((unsigned char *)this + 940) = 1;
      }
      uint64_t v34 = (double *)__p;
    }
    if (v34)
    {
      uint64_t v43 = v34;
      operator delete(v34);
    }
  }
}

void sub_230ED0D1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(uint64_t **a1@<X1>, uint64_t *a2@<X8>)
{
  double v5 = *a1;
  double v4 = (long long *)a1[1];
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  double v63 = v5;
  v64[0] = v5;
  uint64_t v6 = (char *)v4 - (char *)v5;
  if (v4 == (long long *)v5)
  {
    double v5 = (uint64_t *)v4;
    uint64_t v7 = (uint64_t *)v4;
    goto LABEL_27;
  }
  uint64_t v7 = v5 + 14;
  long double v66 = (long long *)(v5 + 14);
  if (v5 + 14 == (uint64_t *)v4)
  {
    uint64_t v7 = v5;
    goto LABEL_27;
  }
  if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
  {
    double v63 = v5 + 14;
    double v8 = v5;
  }
  else
  {
    v64[0] = v5 + 14;
    double v8 = v5 + 14;
    uint64_t v7 = v5;
  }
  double v9 = (long long *)(v5 + 28);
  if (v5 + 28 == (uint64_t *)v4) {
    goto LABEL_26;
  }
  double v10 = v5 + 42;
  while (1)
  {
    v65 = (long long *)(v10 - 14);
    long double v66 = v9 + 7;
    if (v9 + 7 == v4) {
      break;
    }
    if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v65))
    {
      if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
      {
        double v63 = v10;
        uint64_t v7 = v10;
      }
      BOOL v11 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64);
      double v12 = v9;
      if (v11) {
        goto LABEL_20;
      }
    }
    else
    {
      if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
      {
        double v63 = v10 - 14;
        uint64_t v7 = v10 - 14;
      }
      BOOL v13 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)v64);
      double v12 = v10;
      if (v13) {
        goto LABEL_20;
      }
    }
    v64[0] = v12;
    double v8 = v12;
LABEL_20:
    v9 += 14;
    long double v66 = v9;
    v10 += 28;
    if (v9 == v4) {
      goto LABEL_26;
    }
  }
  if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
  {
    uint64_t v7 = v10 - 14;
  }
  else if (!std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64))
  {
    double v8 = v10 - 14;
  }
LABEL_26:
  double v5 = v8;
LABEL_27:
  double v14 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)(v7 + 5), 0);
  double v15 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)(v5 + 5), 0);
  uint64_t v17 = *a1;
  unint64_t v16 = (long long *)a1[1];
  double v63 = v17;
  v64[0] = v17;
  if (v17 == (uint64_t *)v16) {
    goto LABEL_46;
  }
  uint64_t v18 = v17 + 14;
  long double v66 = (long long *)(v17 + 14);
  if (v17 + 14 == (uint64_t *)v16) {
    goto LABEL_46;
  }
  if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
  {
    double v63 = v17 + 14;
  }
  else
  {
    v64[0] = v17 + 14;
    uint64_t v18 = v17;
  }
  uint64_t v19 = (long long *)(v17 + 28);
  if (v17 + 28 == (uint64_t *)v16)
  {
LABEL_45:
    uint64_t v17 = v18;
    goto LABEL_46;
  }
  double v20 = v17 + 42;
  while (2)
  {
    uint64_t v17 = v20 - 14;
    v65 = (long long *)(v20 - 14);
    long double v66 = v19 + 7;
    if (v19 + 7 != v16)
    {
      if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v65))
      {
        if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
        {
          double v63 = v20;
          uint64_t v18 = v20;
        }
        BOOL v21 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64);
        double v22 = v19;
        if (v21) {
          goto LABEL_44;
        }
      }
      else
      {
        if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
        {
          double v63 = v20 - 14;
          uint64_t v18 = v20 - 14;
        }
        BOOL v23 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)v64);
        double v22 = v20;
        if (v23)
        {
LABEL_44:
          v19 += 14;
          long double v66 = v19;
          v20 += 28;
          if (v19 == v16) {
            goto LABEL_45;
          }
          continue;
        }
      }
      v64[0] = v22;
      goto LABEL_44;
    }
    break;
  }
  if (!std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
  {
    std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64);
    uint64_t v17 = v18;
  }
LABEL_46:
  double v24 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)(v17 + 5), 1u);
  uint64_t v26 = *a1;
  uint64_t v25 = (long long *)a1[1];
  double v63 = v26;
  v64[0] = v26;
  if (v26 == (uint64_t *)v25 || (int64_t v27 = v26 + 14, v66 = (long long *)(v26 + 14), v26 + 14 == (uint64_t *)v25))
  {
    int64_t v27 = v26;
    goto LABEL_73;
  }
  if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
  {
    double v63 = v26 + 14;
    unint64_t v28 = v26;
  }
  else
  {
    v64[0] = v26 + 14;
    unint64_t v28 = v26 + 14;
    int64_t v27 = v26;
  }
  uint64_t v29 = (long long *)(v26 + 28);
  if (v26 + 28 == (uint64_t *)v25) {
    goto LABEL_72;
  }
  unint64_t v30 = v26 + 42;
  while (2)
  {
    v65 = (long long *)(v30 - 14);
    long double v66 = v29 + 7;
    if (v29 + 7 != v25)
    {
      if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v65))
      {
        if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
        {
          double v63 = v30;
          int64_t v27 = v30;
        }
        BOOL v31 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64);
        double v32 = v29;
        if (v31) {
          goto LABEL_64;
        }
      }
      else
      {
        if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
        {
          double v63 = v30 - 14;
          int64_t v27 = v30 - 14;
        }
        BOOL v33 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)v64);
        double v32 = v30;
        if (v33)
        {
LABEL_64:
          v29 += 14;
          long double v66 = v29;
          v30 += 28;
          if (v29 == v25) {
            goto LABEL_72;
          }
          continue;
        }
      }
      v64[0] = v32;
      unint64_t v28 = v32;
      goto LABEL_64;
    }
    break;
  }
  if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
  {
    int64_t v27 = v30 - 14;
  }
  else if (!std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64))
  {
    unint64_t v28 = v30 - 14;
  }
LABEL_72:
  uint64_t v26 = v28;
LABEL_73:
  double v34 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)(v27 + 5), 2u);
  double v35 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)(v26 + 5), 2u);
  v64[0] = 0;
  v64[1] = 0;
  double v63 = (uint64_t *)v64;
  if (-1227133513 * (v6 >> 4))
  {
    uint64_t v36 = 0;
    float v37 = ceil((v15 - v14) * 4.0);
    unsigned int v38 = fmaxf(v37, 1.0);
    float v39 = ceil((v35 - v34) * 4.0);
    unsigned int v40 = fmaxf(v39, 1.0);
    do
    {
      double v41 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&(*a1)[14 * v36 + 5], 0);
      double v42 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&(*a1)[14 * v36 + 5], 1u);
      double v43 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&(*a1)[14 * v36 + 5], 2u);
      float v44 = ceil((v41 - v14) * 4.0) + -1.0;
      unsigned int v45 = fmaxf(v44, 0.0);
      float v46 = ceil((v42 - v24) * 4.0) + -1.0;
      *(float *)&double v43 = ceil((v43 - v34) * 4.0) + -1.0;
      unsigned int v47 = v45 + (fmaxf(*(float *)&v43, 0.0) + fmaxf(v46, 0.0) * v40) * v38;
      int v48 = v64[0];
      if (!v64[0]) {
        goto LABEL_85;
      }
      unsigned int v49 = v64;
      do
      {
        uint64_t v50 = v48;
        unsigned int v51 = v49;
        unsigned int v52 = *((_DWORD *)v48 + 7);
        if (v52 >= v47) {
          unsigned int v49 = (void **)v48;
        }
        else {
          ++v48;
        }
        int v48 = (void *)*v48;
      }
      while (v48);
      if (v49 == v64) {
        goto LABEL_85;
      }
      if (v52 < v47) {
        uint64_t v50 = v51;
      }
      if (v47 >= *((_DWORD *)v50 + 7))
      {
        if (*(double *)&(*a1)[14 * v36 + 1] < *(double *)&(*a1)[14 * *((unsigned int *)v49 + 8) + 1]) {
          *((_DWORD *)v49 + 8) = v36;
        }
      }
      else
      {
LABEL_85:
        unint64_t v67 = __PAIR64__(v36, v47);
        std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,unsigned int>>(&v63, (unsigned int *)&v67, (uint64_t *)&v67);
      }
      ++v36;
    }
    while (v36 != -1227133513 * (v6 >> 4));
    uint64_t v53 = v63;
    if (v63 != (uint64_t *)v64)
    {
      unint64_t v54 = a2[1];
      do
      {
        unsigned int v55 = *((_DWORD *)v53 + 8);
        uint64_t v56 = *a1;
        uint64_t v57 = (uint64_t)&(*a1)[14 * v55];
        if (v54 >= a2[2])
        {
          unint64_t v54 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas const&>(a2, (long long *)v57);
        }
        else
        {
          long long v58 = *(_OWORD *)v57;
          long long v59 = *(_OWORD *)(v57 + 16);
          *(void *)(v54 + 32) = *(void *)(v57 + 32);
          *(_OWORD *)unint64_t v54 = v58;
          *(_OWORD *)(v54 + 16) = v59;
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v54 + 40, (uint64_t)&v56[14 * v55 + 5]);
          *(_DWORD *)(v54 + 104) = v56[14 * v55 + 13];
          v54 += 112;
          a2[1] = v54;
        }
        a2[1] = v54;
        double v60 = (uint64_t *)v53[1];
        if (v60)
        {
          do
          {
            v61 = v60;
            double v60 = (uint64_t *)*v60;
          }
          while (v60);
        }
        else
        {
          do
          {
            v61 = (uint64_t *)v53[2];
            BOOL v62 = *v61 == (void)v53;
            uint64_t v53 = v61;
          }
          while (!v62);
        }
        uint64_t v53 = v61;
      }
      while (v61 != (uint64_t *)v64);
    }
  }
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)&v63, v64[0]);
}

void sub_230ED140C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

double RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::estimateTargetOnStraightPath(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  memset(v40, 0, sizeof(v40));
  uint64_t v3 = *a2;
  if (a2[1] == *a2)
  {
    double v7 = 0.0;
  }
  else
  {
    unint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      uint64_t v37 = 0x100000003;
      double v35 = &unk_26E5D3818;
      long long v36 = xmmword_230EF8BF0;
      unsigned int v38 = &v39;
      uint64_t v32 = 0x100000003;
      unint64_t v30 = &unk_26E5D3818;
      long long v31 = xmmword_230EF8BF0;
      BOOL v33 = &v34;
      uint64_t v8 = *a3;
      uint64_t v9 = 112 * v6;
      double v10 = *(double *)(*a3 + 112 * v6 + 8);
      double v11 = *(double *)(v3 + 112 * v6 + 8);
      double v12 = 3.14159265
          - acos(((v11 + 0.1) * (v11 + 0.1) + (v10 - v11) * (v10 - v11) - (v10 + -0.1) * (v10 + -0.1))/ ((v11 + 0.1)* (v10 - v11 + v10 - v11)));
      if (v12 <= 1.0) {
        double v13 = 1.0;
      }
      else {
        double v13 = 1.0 / v12;
      }
      if (v10 <= v11) {
        uint64_t v14 = v8;
      }
      else {
        uint64_t v14 = v3;
      }
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v35, v14 + v9 + 40);
      uint64_t v15 = *a3;
      if (*(double *)(*a3 + v9 + 8) <= *(double *)(*a2 + v9 + 8)) {
        uint64_t v15 = *a2;
      }
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v30, v15 + v9 + 40);
      uint64_t v16 = *a2 + v9;
      uint64_t v17 = *a3 + v9;
      if (*(double *)(v16 + 8) >= *(double *)(v17 + 8)) {
        double v18 = *(double *)(v16 + 8);
      }
      else {
        double v18 = *(double *)(v17 + 8);
      }
      uint64_t v27 = 0x100000003;
      uint64_t v25 = &unk_26E5D3818;
      long long v26 = xmmword_230EF8BF0;
      unint64_t v28 = &v29;
      cnmatrix::Subtract<double>((uint64_t)&v35, (uint64_t)&v30, (uint64_t)&v25);
      uint64_t v53 = 0x100000003;
      unsigned int v51 = &unk_26E5D3818;
      long long v52 = xmmword_230EF8BF0;
      unint64_t v54 = &v55;
      uint64_t v48 = 0x100000134;
      long long v47 = xmmword_230EF8C20;
      float v46 = &unk_26E5D38E8;
      unsigned int v49 = v50;
      uint64_t v43 = 0x100000003;
      long long v42 = xmmword_230EF8BF0;
      double v41 = &unk_26E5D3818;
      float v44 = &v45;
      cnmatrix::Norm<double>((uint64_t)&v25, (uint64_t)&v51, (uint64_t)&v46, (uint64_t)&v41, "2");
      double v20 = v19;
      uint64_t v48 = 0x100000003;
      long long v47 = xmmword_230EF8BF0;
      float v46 = &unk_26E5D3818;
      unsigned int v49 = v50;
      cnmatrix::Subtract<double>((uint64_t)&v35, (uint64_t)&v30, (uint64_t)&v46);
      uint64_t v21 = 0;
      double v7 = v7 + v13;
      do
      {
        double v22 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v30, v21);
        *(double *)&v40[v21] = *(double *)&v40[v21]
                             + v13
                             * (v22
                              + v18 * *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v46, v21) / v20);
        ++v21;
      }
      while (v21 != 3);
      ++v6;
      uint64_t v3 = *a2;
    }
    while (0x6DB6DB6DB6DB6DB7 * ((a2[1] - *a2) >> 4) > v6);
  }
  for (uint64_t i = 0; i != 3; ++i)
    *(double *)&v40[i] = *(double *)&v40[i] / v7;
  return *(double *)v40;
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::computeStraightPathSolution(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  v120[308] = *MEMORY[0x263EF8340];
  uint64_t v1 = *((void *)this + 85);
  uint64_t v2 = *((void *)this + 84);
  unint64_t v3 = 0x6DB6DB6DB6DB6DB7 * ((v1 - v2) >> 4);
  if (v3 >= 4)
  {
    double v4 = this;
    uint64_t v5 = *((void *)this + 91);
    uint64_t v6 = *((void *)this + 90);
    if (v5 != v6)
    {
      uint64_t v7 = v5 - 72;
      do
      {
        *(void *)(v5 - 72) = &unk_26E5D3870;
        v7 -= 112;
        v5 -= 112;
      }
      while (v5 != v6);
    }
    *((void *)this + 91) = v6;
    memset(v106, 0, sizeof(v106));
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(v106, v2, v1, v3);
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(v106, (uint64_t *)buf);
    uint64_t v8 = (long long **)((char *)v4 + 720);
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vdeallocate((char **)v4 + 90);
    *((_OWORD *)v4 + 45) = *(_OWORD *)buf;
    *((void *)v4 + 92) = *(void *)&buf[16];
    memset(buf, 0, sizeof(buf));
    v112 = buf;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v112);
    v112 = (uint8_t *)v106;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v112);
    v103 = 0;
    v104 = 0;
    unint64_t v105 = 0;
    uint64_t v9 = *((void *)v4 + 91);
    if (v9 == *((void *)v4 + 90))
    {
      uint64_t v27 = *((void *)v4 + 91);
    }
    else
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      double v12 = &unk_26E5D3818;
      double v13 = v102;
      uint64_t v14 = v116;
      uint64_t v9 = *((void *)v4 + 90);
      do
      {
        uint64_t v15 = *((void *)v4 + 85) - 72;
        uint64_t v100 = 0x100000003;
        v98 = v12;
        long long v99 = xmmword_230EF8BF0;
        v101 = v13;
        cnmatrix::Subtract<double>(v9 + v10 * 16 + 40, v15, (uint64_t)&v98);
        uint64_t v114 = 0x100000003;
        long long v113 = xmmword_230EF8BF0;
        v112 = (uint8_t *)&unk_26E5D3818;
        v115 = v14;
        uint64_t v118 = 0x100000134;
        *(_OWORD *)&uint8_t buf[8] = xmmword_230EF8C20;
        *(void *)buf = &unk_26E5D38E8;
        v119 = v120;
        uint64_t v109 = 0x100000003;
        long long v108 = xmmword_230EF8BF0;
        v107 = &unk_26E5D3818;
        v110 = v111;
        cnmatrix::Norm<double>((uint64_t)&v98, (uint64_t)&v112, (uint64_t)buf, (uint64_t)&v107, "2");
        if (v16 < 2.0)
        {
          uint64_t v17 = v14;
          double v18 = v13;
          double v19 = v12;
          double v20 = v4;
          uint64_t v21 = *v8;
          double v22 = &(*v8)[v10];
          BOOL v23 = v104;
          if ((unint64_t)v104 >= v105)
          {
            long long v26 = (long long *)std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas&>((uint64_t *)&v103, v22);
          }
          else
          {
            long long v24 = *v22;
            long long v25 = v22[1];
            *((void *)v104 + 4) = *((void *)v22 + 4);
            *BOOL v23 = v24;
            v23[1] = v25;
            cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v23 + 40, (uint64_t)v22 + 40);
            *((_DWORD *)v23 + 26) = DWORD2(v21[v10 + 6]);
            long long v26 = v23 + 7;
          }
          double v4 = v20;
          v104 = v26;
          double v12 = v19;
          double v13 = v18;
          uint64_t v14 = v17;
        }
        ++v11;
        uint64_t v27 = *((void *)v4 + 91);
        uint64_t v9 = *((void *)v4 + 90);
        v10 += 7;
      }
      while (0x6DB6DB6DB6DB6DB7 * ((v27 - v9) >> 4) > v11);
    }
    if (v8 != &v103)
    {
      std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>((uint64_t)v8, v103, v104, 0x6DB6DB6DB6DB6DB7 * (v104 - v103));
      uint64_t v27 = *((void *)v4 + 91);
      uint64_t v9 = *((void *)v4 + 90);
    }
    uint64_t v28 = 0x6DB6DB6DB6DB6DB7 * ((v27 - v9) >> 4);
    int v29 = v28 - 2;
    if ((int)v28 >= 2)
    {
      if (v28 >= 4) {
        int v29 = 2;
      }
      if (v29)
      {
        if (v29 == 1) {
          int v30 = v28;
        }
        else {
          int v30 = ((int)v28 - 1) * (int)v28 / 2;
        }
      }
      else
      {
        int v30 = 1;
      }
      if (v28 >= 5)
      {
        int v84 = v30;
        v83 = v4;
        uint64_t v31 = 0;
        uint64_t v95 = 0;
        unint64_t v96 = 0;
        unint64_t v97 = 0;
        uint64_t v86 = (v28 - 1);
        uint64_t v92 = 0;
        unint64_t v93 = 0;
        uint64_t v87 = (int)v28;
        uint64_t v85 = v28;
        uint64_t v32 = 1;
        uint64_t v89 = 112;
        unint64_t v94 = 0;
        do
        {
          uint64_t v88 = v31 + 1;
          if (v31 + 1 < v87)
          {
            uint64_t v33 = v85;
            uint64_t v34 = v89;
            do
            {
              double v35 = *v8;
              long long v36 = (double *)((char *)*v8 + v34);
              double v37 = v36[1];
              double v38 = *((double *)&(*v8)[7 * v31] + 1);
              if (vabdd_f64(3.14159265, acos(((v38 + 0.1) * (v38 + 0.1) + (v37 - v38) * (v37 - v38) - (v37 + -0.1) * (v37 + -0.1))/ ((v38 + 0.1)* (v37 - v38 + v37 - v38)))) < 1.22173048)
              {
                uint64_t v100 = 0x100000003;
                v98 = &unk_26E5D3818;
                long long v99 = xmmword_230EF8BF0;
                v101 = v102;
                cnmatrix::Subtract<double>((uint64_t)&v35[7 * v31 + 2] + 8, (uint64_t)(v36 + 5), (uint64_t)&v98);
                uint64_t v114 = 0x100000003;
                long long v113 = xmmword_230EF8BF0;
                v112 = (uint8_t *)&unk_26E5D3818;
                v115 = v116;
                uint64_t v118 = 0x100000134;
                *(_OWORD *)&uint8_t buf[8] = xmmword_230EF8C20;
                *(void *)buf = &unk_26E5D38E8;
                v119 = v120;
                uint64_t v109 = 0x100000003;
                long long v108 = xmmword_230EF8BF0;
                v107 = &unk_26E5D3818;
                v110 = v111;
                cnmatrix::Norm<double>((uint64_t)&v98, (uint64_t)&v112, (uint64_t)buf, (uint64_t)&v107, "2");
                if (vabdd_f64(v39, fmax(v38, v37) - fmin(v38, v37)) < 0.1414)
                {
                  uint64_t v40 = (uint64_t)&(*v8)[7 * v31 + 2] + 8;
                  double v41 = (char *)*v8 + v34;
                  uint64_t v100 = 0x100000003;
                  v98 = &unk_26E5D3818;
                  long long v99 = xmmword_230EF8BF0;
                  v101 = v102;
                  cnmatrix::Subtract<double>(v40, (uint64_t)(v41 + 40), (uint64_t)&v98);
                  uint64_t v114 = 0x100000003;
                  long long v113 = xmmword_230EF8BF0;
                  v112 = (uint8_t *)&unk_26E5D3818;
                  v115 = v116;
                  uint64_t v118 = 0x100000134;
                  *(_OWORD *)&uint8_t buf[8] = xmmword_230EF8C20;
                  *(void *)buf = &unk_26E5D38E8;
                  v119 = v120;
                  uint64_t v109 = 0x100000003;
                  long long v108 = xmmword_230EF8BF0;
                  v107 = &unk_26E5D3818;
                  v110 = v111;
                  cnmatrix::Norm<double>((uint64_t)&v98, (uint64_t)&v112, (uint64_t)buf, (uint64_t)&v107, "2");
                  if (v42 > 0.25)
                  {
                    uint64_t v43 = *v8;
                    uint64_t v44 = (uint64_t)&(*v8)[7 * v31];
                    unint64_t v45 = v96;
                    if (v96 >= v97)
                    {
                      uint64_t v48 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas&>(&v95, (long long *)v44);
                    }
                    else
                    {
                      long long v46 = *(_OWORD *)v44;
                      long long v47 = *(_OWORD *)(v44 + 16);
                      *(void *)(v96 + 32) = *(void *)(v44 + 32);
                      *(_OWORD *)unint64_t v45 = v46;
                      *(_OWORD *)(v45 + 16) = v47;
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v45 + 40, (uint64_t)&v43[7 * v31 + 2] + 8);
                      *(_DWORD *)(v45 + 104) = DWORD2(v43[7 * v31 + 6]);
                      uint64_t v48 = v45 + 112;
                    }
                    unint64_t v96 = v48;
                    unsigned int v49 = *v8;
                    uint64_t v50 = (long long *)((char *)*v8 + v34);
                    unint64_t v51 = v93;
                    if (v93 >= v94)
                    {
                      uint64_t v54 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas&>(&v92, v50);
                    }
                    else
                    {
                      long long v52 = *v50;
                      long long v53 = v50[1];
                      *(void *)(v93 + 32) = *((void *)v50 + 4);
                      *(_OWORD *)unint64_t v51 = v52;
                      *(_OWORD *)(v51 + 16) = v53;
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v51 + 40, (uint64_t)v50 + 40);
                      *(_DWORD *)(v51 + 104) = *(_DWORD *)((char *)v49 + v34 + 104);
                      uint64_t v54 = v51 + 112;
                    }
                    unint64_t v93 = v54;
                  }
                }
              }
              v34 += 112;
              --v33;
            }
            while (v32 != v33);
          }
          ++v32;
          v89 += 112;
          ++v31;
        }
        while (v88 != v86);
        unint64_t v55 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v96 - v95) >> 4);
        if (v55 > 5 && (float)((float)((float)v55 / (float)v84) * 100.0) >= 70.0)
        {
          *((unsigned char *)v83 + 929) = 1;
          *((void *)v83 + 107) = *((void *)v83 + 74);
          cnmatrix::CNMatrixBase<double>::operator=((uint64_t)v83 + 864, (uint64_t)v83 + 168);
          uint64_t v56 = *((void *)v83 + 56);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v57 = *((void *)v83 + 74);
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v57;
            _os_log_impl(&dword_230EC1000, v56, OS_LOG_TYPE_DEFAULT, "Straight path solution generated at %f s", buf, 0xCu);
          }
          *((_DWORD *)v83 + 24) = 5;
          *((unsigned char *)v83 + 100) = 1;
          *((_DWORD *)v83 + 26) = 2;
          *((unsigned char *)v83 + 108) = 0;
          *((void *)v83 + 17) = 0;
          memset(v91, 0, sizeof(v91));
          std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(v91, v95, v96, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v96 - v95) >> 4));
          memset(v90, 0, sizeof(v90));
          long long v58 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(v90, v92, v93, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v93 - v92) >> 4));
          double v59 = RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::estimateTargetOnStraightPath((uint64_t)v58, v91, v90);
          uint64_t v61 = v60;
          uint64_t v63 = v62;
          *(void *)buf = v90;
          std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          *(void *)buf = v91;
          std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          unint64_t v64 = *((void *)v83 + 16);
          unint64_t v65 = *((void *)v83 + 14);
          *((void *)v83 + 15) = v65;
          if (v65 >= v64)
          {
            unint64_t v67 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v64 - v65) >> 3);
            uint64_t v68 = 2 * v67;
            if (2 * v67 <= 1) {
              uint64_t v68 = 1;
            }
            if (v67 >= 0xC30C30C30C30C3) {
              unint64_t v69 = 0x186186186186186;
            }
            else {
              unint64_t v69 = v68;
            }
            double v70 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::BatchSolutionParticle>>((uint64_t)v83 + 128, v69);
            uint64_t v72 = &v70[168 * v71];
            *(double *)double v70 = v59;
            *((void *)v70 + 1) = v61;
            *((void *)v70 + 2) = v63;
            *((void *)v70 + 4) = 0;
            *((void *)v70 + 5) = 0;
            *((void *)v70 + 3) = 0x3F847AE147AE147CLL;
            *((_OWORD *)v70 + 3) = xmmword_230EF8EC0;
            *((_OWORD *)v70 + 4) = xmmword_230EF8ED0;
            *((void *)v70 + 10) = 0x3FF0000000000000;
            *(_OWORD *)(v70 + 88) = 0u;
            *(_OWORD *)(v70 + 104) = 0u;
            *(_OWORD *)(v70 + 120) = 0u;
            *(_OWORD *)(v70 + 136) = 0u;
            *((void *)v70 + 19) = 0;
            *((_DWORD *)v70 + 40) = 2;
            long double v66 = v70 + 168;
            double v74 = (char *)*((void *)v83 + 14);
            double v73 = (char *)*((void *)v83 + 15);
            if (v73 != v74)
            {
              do
              {
                long long v75 = *(_OWORD *)(v73 - 168);
                long long v76 = *(_OWORD *)(v73 - 152);
                *(_OWORD *)(v70 - 136) = *(_OWORD *)(v73 - 136);
                *(_OWORD *)(v70 - 152) = v76;
                *(_OWORD *)(v70 - 168) = v75;
                long long v77 = *(_OWORD *)(v73 - 120);
                long long v78 = *(_OWORD *)(v73 - 104);
                long long v79 = *(_OWORD *)(v73 - 88);
                *(_OWORD *)(v70 - 72) = *(_OWORD *)(v73 - 72);
                *(_OWORD *)(v70 - 88) = v79;
                *(_OWORD *)(v70 - 104) = v78;
                *(_OWORD *)(v70 - 120) = v77;
                long long v80 = *(_OWORD *)(v73 - 56);
                long long v81 = *(_OWORD *)(v73 - 40);
                long long v82 = *(_OWORD *)(v73 - 24);
                *((_DWORD *)v70 - 2) = *((_DWORD *)v73 - 2);
                *(_OWORD *)(v70 - 24) = v82;
                *(_OWORD *)(v70 - 40) = v81;
                *(_OWORD *)(v70 - 56) = v80;
                v70 -= 168;
                v73 -= 168;
              }
              while (v73 != v74);
              double v73 = (char *)*((void *)v83 + 14);
            }
            *((void *)v83 + 14) = v70;
            *((void *)v83 + 15) = v66;
            *((void *)v83 + 16) = v72;
            if (v73) {
              operator delete(v73);
            }
          }
          else
          {
            *(double *)unint64_t v65 = v59;
            *(void *)(v65 + 8) = v61;
            *(void *)(v65 + 16) = v63;
            *(void *)(v65 + 32) = 0;
            *(void *)(v65 + 40) = 0;
            *(void *)(v65 + 24) = 0x3F847AE147AE147CLL;
            *(_OWORD *)(v65 + 48) = xmmword_230EF8EC0;
            *(_OWORD *)(v65 + 64) = xmmword_230EF8ED0;
            *(void *)(v65 + 80) = 0x3FF0000000000000;
            *(_OWORD *)(v65 + 88) = 0u;
            *(_OWORD *)(v65 + 104) = 0u;
            *(_OWORD *)(v65 + 120) = 0u;
            *(_OWORD *)(v65 + 136) = 0u;
            *(_DWORD *)(v65 + 160) = 2;
            long double v66 = (char *)(v65 + 168);
            *(void *)(v65 + 152) = 0;
          }
          *((void *)v83 + 15) = v66;
        }
        *(void *)buf = &v92;
        std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        *(void *)buf = &v95;
        std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      }
    }
    *(void *)buf = &v103;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
}

void sub_230ED2454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,void **a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  a37 = (void **)&a31;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a37);
  a37 = (void **)&a34;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a37);
  a37 = (void **)&a45;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a37);
  _Unwind_Resume(a1);
}

uint64_t RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::setCurrentRangeFilterEstimate(uint64_t this, double a2, char a3)
{
  *(double *)(this + 432) = a2;
  *(unsigned char *)(this + 440) = a3;
  return this;
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::addMeasurement(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v244 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 934))
  {
    *((unsigned char *)this + 934) = 0;
    if (*((void *)this + 84) != *((void *)this + 85)) {
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::reinitFilter(this);
    }
  }
  *((void *)this + 29) = *(void *)(a2 + 104);
  uint64_t v226 = 0x100000003;
  long long v225 = xmmword_230EF8BF0;
  v224 = &unk_26E5D3818;
  v227 = &v228;
  cnmatrix::FastResize<double>(&v224, 3, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v224, 0.0);
  uint64_t v221 = 0x100000004;
  long long v220 = xmmword_230EF8C10;
  v219 = &unk_26E5D38A0;
  v222 = &v223;
  cnmatrix::FastResize<double>(&v219, 4, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v219, 0.0);
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v7 = a2 + 8 * i;
    uint64_t v8 = *(void *)(v7 + 96);
    *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v224, i) = v8;
    uint64_t v9 = *(void *)(v7 + 120);
    *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v219, i) = v9;
  }
  uint64_t v10 = *(void *)(a2 + 144);
  *(void *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v219, 3u) = v10;
  RoseSyntheticApertureFiltering::quatn2rot((uint64_t)&v219, (uint64_t)v218);
  buf[3] = 0x100000003;
  *(_OWORD *)&buf[1] = xmmword_230EF8BF0;
  buf[0] = &unk_26E5D3818;
  *(void *)&long long v235 = (char *)&v235 + 8;
  cnmatrix::Multiply<double>((uint64_t)v218, (uint64_t)this + 456, (uint64_t)buf);
  uint64_t v215 = 0x100000003;
  long long v214 = xmmword_230EF8BF0;
  v213 = &unk_26E5D3818;
  v216 = &v217;
  cnmatrix::Add<double>((uint64_t)&v224, (uint64_t)buf, (uint64_t)&v213);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)this + 168, (uint64_t)&v224);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)this + 240, (uint64_t)&v219);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)this + 312, (uint64_t)v218);
  double v12 = *(double *)a2;
  *((void *)this + 74) = *(void *)a2;
  if (*((unsigned char *)this + 928))
  {
    double v13 = *((double *)this + 76);
    if (v12 - v13 > 10.0)
    {
      *((unsigned char *)this + 928) = 0;
      uint64_t v14 = *((void *)this + 56);
      unint64_t v11 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        LODWORD(buf[0]) = 134218240;
        *(double *)((char *)buf + 4) = v13;
        WORD2(buf[1]) = 2048;
        *(double *)((char *)&buf[1] + 6) = v12;
        _os_log_impl(&dword_230EC1000, v14, OS_LOG_TYPE_DEFAULT, "AoA Solution from AoA at %f s is no longer valid - current time is %f s", (uint8_t *)buf, 0x16u);
      }
    }
  }
  if (*((unsigned char *)this + 929))
  {
    double v15 = *((double *)this + 74) - *((double *)this + 107);
    if (v15 >= 2.0 && (*((double *)this + 54) < 2.0 || !*((unsigned char *)this + 440))) {
      goto LABEL_16;
    }
    if (v15 >= 5.0)
    {
      uint64_t v186 = 0x100000003;
      v184 = &unk_26E5D3818;
      long long v185 = xmmword_230EF8BF0;
      v187 = v188;
      cnmatrix::Subtract<double>((uint64_t)&v213, (uint64_t)this + 864, (uint64_t)&v184);
      *((void *)&v200[1] + 1) = 0x100000003;
      *(_OWORD *)((char *)v200 + 8) = xmmword_230EF8BF0;
      *(void *)&v200[0] = &unk_26E5D3818;
      *(void *)&long long v201 = (char *)&v201 + 8;
      buf[3] = 0x100000134;
      *(_OWORD *)&buf[1] = xmmword_230EF8C20;
      buf[0] = &unk_26E5D38E8;
      *(void *)&long long v235 = (char *)&v235 + 8;
      uint64_t v191 = 0x100000003;
      long long v190 = xmmword_230EF8BF0;
      v189 = &unk_26E5D3818;
      v192 = v193;
      cnmatrix::Norm<double>((uint64_t)&v184, (uint64_t)v200, (uint64_t)buf, (uint64_t)&v189, "2");
      if (v16 > 1.0)
      {
LABEL_16:
        *((unsigned char *)this + 929) = 0;
        uint64_t v17 = *((void *)this + 56);
        unint64_t v11 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          uint64_t v18 = *((void *)this + 107);
          uint64_t v19 = *((void *)this + 74);
          LODWORD(buf[0]) = 134218240;
          *(void *)((char *)buf + 4) = v18;
          WORD2(buf[1]) = 2048;
          *(void *)((char *)&buf[1] + 6) = v19;
          _os_log_impl(&dword_230EC1000, v17, OS_LOG_TYPE_DEFAULT, "Straight path solution at %f s is no longer valid - current time is %f s", (uint8_t *)buf, 0x16u);
        }
      }
    }
  }
  double v20 = *(double *)(a2 + 16);
  if (v20 <= 0.0 || *(double *)(a2 + 8) < -1.0)
  {
    uint64_t v21 = *((void *)this + 56);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::addMeasurement(a2, v21, v20);
    }
    goto LABEL_157;
  }
  double v22 = (uint64_t *)((char *)this + 672);
  uint64_t v23 = *((void *)this + 85);
  if (v23 != *((void *)this + 84))
  {
    uint64_t v186 = 0x100000003;
    v184 = &unk_26E5D3818;
    long long v185 = xmmword_230EF8BF0;
    v187 = v188;
    cnmatrix::Subtract<double>((uint64_t)&v213, v23 - 72, (uint64_t)&v184);
    *((void *)&v200[1] + 1) = 0x100000003;
    *(_OWORD *)((char *)v200 + 8) = xmmword_230EF8BF0;
    *(void *)&v200[0] = &unk_26E5D3818;
    *(void *)&long long v201 = (char *)&v201 + 8;
    buf[3] = 0x100000134;
    *(_OWORD *)&buf[1] = xmmword_230EF8C20;
    buf[0] = &unk_26E5D38E8;
    *(void *)&long long v235 = (char *)&v235 + 8;
    uint64_t v191 = 0x100000003;
    long long v190 = xmmword_230EF8BF0;
    v189 = &unk_26E5D3818;
    v192 = v193;
    cnmatrix::Norm<double>((uint64_t)&v184, (uint64_t)v200, (uint64_t)buf, (uint64_t)&v189, "2");
    double v25 = v24;
    double v26 = *(double *)(a2 + 8);
    double v27 = *(double *)(v23 - 104);
    double v28 = v26 - v27;
    if (v26 - v27 <= 0.0)
    {
      if ((fabs(v28) - v24) / *(double *)(a2 + 16) <= 6.0)
      {
        if (*((unsigned char *)this + 941))
        {
          *((unsigned char *)this + 941) = 0;
          double v42 = *((void *)this + 56);
          unint64_t v11 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_230EC1000, v42, OS_LOG_TYPE_DEFAULT, "Did not observe a second consecutive nLoS->LoS event after the first one - marked as a false event due to packet collision", (uint8_t *)buf, 2u);
          }
        }
      }
      else
      {
        uint64_t v33 = *((void *)this + 56);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf[0]) = 134218496;
          *(double *)((char *)buf + 4) = v27;
          WORD2(buf[1]) = 2048;
          *(double *)((char *)&buf[1] + 6) = v26;
          HIWORD(buf[2]) = 2048;
          *(double *)&buf[3] = v25;
          _os_log_error_impl(&dword_230EC1000, v33, OS_LOG_TYPE_ERROR, "nLoS->LoS event detected by the batch filter: Previous range %f m, Current range %f m, Distance travelled %f m", (uint8_t *)buf, 0x20u);
        }
        int v34 = *((unsigned __int8 *)this + 941);
        double v35 = *((void *)this + 56);
        BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        if (!v34)
        {
          if (v36)
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_230EC1000, v35, OS_LOG_TYPE_DEFAULT, "fRangeDropped is false, buffering this nLoS->LoS event for now", (uint8_t *)buf, 2u);
          }
          *((unsigned char *)this + 941) = 1;
          double v43 = RoseSyntheticApertureFiltering::range2deweight((RoseSyntheticApertureFiltering *)v36, *(double *)(a2 + 8) / *((double *)this + 77));
          double v44 = *(double *)(a2 + 8);
          double v45 = *(double *)(a2 + 16);
          int v46 = *(_DWORD *)(a2 + 24);
          buf[0] = *(void *)a2;
          *(double *)&buf[1] = v44;
          *(double *)&buf[2] = v44 / (v43 * v45);
          *(double *)&buf[3] = v45;
          *(double *)&long long v235 = v43;
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v235 + 8, (uint64_t)&v213);
          DWORD2(v239) = v46;
          *((void *)this + 97) = v235;
          long long v47 = *(_OWORD *)&buf[2];
          *(_OWORD *)((char *)this + 744) = *(_OWORD *)buf;
          *(_OWORD *)((char *)this + 760) = v47;
          cnmatrix::CNMatrixBase<double>::operator=((uint64_t)this + 784, (uint64_t)&v235 + 8);
          *((_DWORD *)this + 212) = DWORD2(v239);
          goto LABEL_144;
        }
        if (v36)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_230EC1000, v35, OS_LOG_TYPE_DEFAULT, "fRangeDropped is true, detected two consecutive nLoS->LoS events", (uint8_t *)buf, 2u);
        }
        double v37 = (long long *)((char *)this + 744);
        unint64_t v38 = *((void *)this + 85);
        if (v38 >= *((void *)this + 86))
        {
          uint64_t v41 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__push_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas const&>((uint64_t *)this + 84, v37);
        }
        else
        {
          long long v39 = *v37;
          long long v40 = *(_OWORD *)((char *)this + 760);
          *(void *)(v38 + 32) = *((void *)this + 97);
          *(_OWORD *)unint64_t v38 = v39;
          *(_OWORD *)(v38 + 16) = v40;
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v38 + 40, (uint64_t)this + 784);
          *(_DWORD *)(v38 + 104) = *((_DWORD *)this + 212);
          uint64_t v41 = v38 + 112;
          *((void *)this + 85) = v38 + 112;
        }
        *((void *)this + 85) = v41;
        *((unsigned char *)this + 941) = 0;
        __p = 0;
        long long v180 = 0uLL;
        uint64_t v48 = *((void *)this + 84);
        if (v48 != v41)
        {
          v177 = a3;
          unsigned int v49 = &unk_26E5D3818;
          do
          {
            uint64_t v186 = 0x100000003;
            v184 = v49;
            long long v185 = xmmword_230EF8BF0;
            v187 = v188;
            cnmatrix::Subtract<double>((uint64_t)&v213, v48 + 40, (uint64_t)&v184);
            *((void *)&v200[1] + 1) = 0x100000003;
            *(_OWORD *)((char *)v200 + 8) = xmmword_230EF8BF0;
            *(void *)&v200[0] = &unk_26E5D3818;
            *(void *)&long long v201 = (char *)&v201 + 8;
            buf[3] = 0x100000134;
            *(_OWORD *)&buf[1] = xmmword_230EF8C20;
            buf[0] = &unk_26E5D38E8;
            *(void *)&long long v235 = (char *)&v235 + 8;
            uint64_t v191 = 0x100000003;
            long long v190 = xmmword_230EF8BF0;
            v189 = &unk_26E5D3818;
            v192 = v193;
            cnmatrix::Norm<double>((uint64_t)&v184, (uint64_t)v200, (uint64_t)buf, (uint64_t)&v189, "2");
            if ((*(double *)(v48 + 8) - *(double *)(a2 + 8) - v50) / *(double *)(a2 + 16) <= 6.0)
            {
              v48 += 112;
              uint64_t v69 = *((void *)this + 85);
            }
            else
            {
              unint64_t v51 = v49;
              int v52 = 0;
              do
              {
                uint64_t v53 = *((void *)this + 87);
                if (0x4EC4EC4EC4EC4EC5 * ((*((void *)this + 88) - v53) >> 4) <= (unint64_t)v52) {
                  break;
                }
                double v54 = *(double *)(v53 + 208 * v52);
                double v55 = *(double *)v48;
                if (v54 == *(double *)v48)
                {
                  uint64_t v56 = (char *)v180;
                  if ((unint64_t)v180 >= *((void *)&v180 + 1))
                  {
                    long long v58 = (char *)__p;
                    uint64_t v59 = (uint64_t)(v180 - (void)__p) >> 3;
                    unint64_t v60 = v59 + 1;
                    if ((unint64_t)(v59 + 1) >> 61) {
                      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                    }
                    uint64_t v61 = *((void *)&v180 + 1) - (void)__p;
                    if ((uint64_t)(*((void *)&v180 + 1) - (void)__p) >> 2 > v60) {
                      unint64_t v60 = v61 >> 2;
                    }
                    if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF8) {
                      unint64_t v62 = 0x1FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v62 = v60;
                    }
                    if (v62)
                    {
                      uint64_t v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v180 + 8, v62);
                      long long v58 = (char *)__p;
                      uint64_t v56 = (char *)v180;
                    }
                    else
                    {
                      uint64_t v63 = 0;
                    }
                    unint64_t v64 = &v63[8 * v59];
                    *(void *)unint64_t v64 = v52;
                    uint64_t v57 = v64 + 8;
                    while (v56 != v58)
                    {
                      uint64_t v65 = *((void *)v56 - 1);
                      v56 -= 8;
                      *((void *)v64 - 1) = v65;
                      v64 -= 8;
                    }
                    __p = v64;
                    *(void *)&long long v180 = v57;
                    *((void *)&v180 + 1) = &v63[8 * v62];
                    if (v58) {
                      operator delete(v58);
                    }
                  }
                  else
                  {
                    *(void *)long long v180 = v52;
                    uint64_t v57 = v56 + 8;
                  }
                  *(void *)&long long v180 = v57;
                }
                else
                {
                  ++v52;
                }
              }
              while (v54 != v55);
              if (*((unsigned char *)this + 928))
              {
                double v66 = *((double *)this + 76);
                if (*(double *)v48 == v66)
                {
                  *((unsigned char *)this + 928) = 0;
                  unint64_t v67 = *((void *)this + 56);
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf[0]) = 134217984;
                    *(double *)((char *)buf + 4) = v66;
                    _os_log_impl(&dword_230EC1000, v67, OS_LOG_TYPE_DEFAULT, "AoA Solution from AoA at %f s is no longer valid due to multipath", (uint8_t *)buf, 0xCu);
                  }
                }
              }
              uint64_t v68 = *((void *)this + 56);
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                double v72 = *(double *)v48;
                uint64_t v73 = *(void *)(v48 + 8);
                LODWORD(buf[0]) = 134218240;
                *(double *)((char *)buf + 4) = v72;
                WORD2(buf[1]) = 2048;
                *(void *)((char *)&buf[1] + 6) = v73;
                _os_log_error_impl(&dword_230EC1000, v68, OS_LOG_TYPE_ERROR, "Removing measurement at time %f s with range %f m", (uint8_t *)buf, 0x16u);
              }
              std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,0>((long long *)(v48 + 112), *((long long **)this + 85), v48);
              uint64_t v70 = *((void *)this + 85);
              unsigned int v49 = v51;
              if (v70 != v69)
              {
                uint64_t v71 = v70 - 72;
                do
                {
                  *(void *)(v70 - 72) = &unk_26E5D3870;
                  v71 -= 112;
                  v70 -= 112;
                }
                while (v70 != v69);
              }
              *((void *)this + 85) = v69;
            }
          }
          while (v48 != v69);
          double v74 = (char *)v180;
          double v22 = (uint64_t *)((char *)this + 672);
          a3 = v177;
          if ((void *)v180 != __p)
          {
            long long v75 = (_OWORD *)*((void *)this + 88);
            do
            {
              uint64_t v76 = *((void *)v74 - 1);
              v74 -= 8;
              std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas *,RoseSyntheticApertureFiltering::InternalAoAMeas *,RoseSyntheticApertureFiltering::InternalAoAMeas *>((uint64_t)buf, (_OWORD *)(*((void *)this + 87) + 208 * v76 + 208), v75, (_OWORD *)(*((void *)this + 87) + 208 * v76));
              long long v75 = v77;
              long long v78 = (_OWORD *)*((void *)this + 88);
              if (v78 != v77)
              {
                long long v79 = v78 - 11;
                do
                {
                  *((void *)v78 - 14) = &unk_26E5D3870;
                  *((void *)v78 - 22) = &unk_26E5D3870;
                  v79 -= 13;
                  v78 -= 13;
                }
                while (v78 != v77);
              }
              *((void *)this + 88) = v77;
            }
            while (v74 != __p);
          }
        }
        RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::resetFilter(this);
        long long v81 = (double *)*((void *)this + 84);
        long long v82 = (double *)*((void *)this + 85);
        if (v81 == v82)
        {
          *((void *)this + 77) = 0x3FF0000000000000;
        }
        else
        {
          v83 = v81 + 14;
          int v84 = (double *)*((void *)this + 84);
          if (v81 + 14 != v82)
          {
            int v84 = (double *)*((void *)this + 84);
            do
            {
              if (v83[1] < v84[1]) {
                int v84 = v83;
              }
              v83 += 14;
            }
            while (v83 != v82);
          }
          double v85 = fmax(v84[1], 1.0);
          if (v85 != *((double *)this + 77))
          {
            *((double *)this + 77) = v85;
            do
            {
              double v86 = RoseSyntheticApertureFiltering::range2deweight(v80, v81[1] / *((double *)this + 77));
              v81[4] = v86;
              v81[2] = v81[1] / (v86 * v81[3]);
              v81 += 14;
            }
            while (v81 != v82);
          }
        }
        unint64_t v11 = (RoseSyntheticApertureFiltering *)__p;
        if (__p)
        {
          *(void *)&long long v180 = __p;
          operator delete(__p);
        }
      }
    }
    else
    {
      if (*((unsigned char *)this + 941))
      {
        *((unsigned char *)this + 941) = 0;
        int v29 = *((void *)this + 56);
        unint64_t v11 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_230EC1000, v29, OS_LOG_TYPE_DEFAULT, "Did not observe a second consecutive nLoS->LoS event after the first one - marked as a false event due to packet collision", (uint8_t *)buf, 2u);
        }
      }
      if ((v28 - v25) / *(double *)(a2 + 16) > 6.0)
      {
        int v30 = *((void *)this + 56);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = *(void *)(v23 - 104);
          uint64_t v32 = *(void *)(a2 + 8);
          LODWORD(buf[0]) = 134218496;
          *(void *)((char *)buf + 4) = v31;
          WORD2(buf[1]) = 2048;
          *(void *)((char *)&buf[1] + 6) = v32;
          HIWORD(buf[2]) = 2048;
          *(double *)&buf[3] = v25;
          _os_log_error_impl(&dword_230EC1000, v30, OS_LOG_TYPE_ERROR, "LoS->nLoS event detected by the batch filter: Previous range %f m, Current range %f m, Distance travelled %f m", (uint8_t *)buf, 0x20u);
        }
        goto LABEL_144;
      }
    }
  }
  uint64_t v87 = (double *)*((void *)this + 84);
  uint64_t v88 = (double *)*((void *)this + 85);
  double v89 = *(double *)(a2 + 8);
  if (v87 == v88)
  {
    double v94 = fmax(v89, 1.0);
    *((double *)this + 77) = v94;
    uint64_t v95 = *((void *)this + 56);
    unint64_t v11 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      LODWORD(buf[0]) = 134217984;
      *(double *)((char *)buf + 4) = v94;
      _os_log_impl(&dword_230EC1000, v95, OS_LOG_TYPE_DEFAULT, "Minimum observed range initialized to %f m", (uint8_t *)buf, 0xCu);
    }
  }
  else
  {
    double v90 = *((double *)this + 77);
    if (v89 < v90 && v90 > 1.0)
    {
      double v91 = fmax(v89, 1.0);
      *((double *)this + 77) = v91;
      uint64_t v92 = *((void *)this + 56);
      unint64_t v11 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        LODWORD(buf[0]) = 134217984;
        *(double *)((char *)buf + 4) = v91;
        _os_log_impl(&dword_230EC1000, v92, OS_LOG_TYPE_DEFAULT, "Minimum observed range changed to %f m", (uint8_t *)buf, 0xCu);
        uint64_t v87 = (double *)*((void *)this + 84);
        uint64_t v88 = (double *)*((void *)this + 85);
      }
      while (v87 != v88)
      {
        double v93 = RoseSyntheticApertureFiltering::range2deweight(v11, v87[1] / *((double *)this + 77));
        v87[4] = v93;
        v87[2] = v87[1] / (v93 * v87[3]);
        v87 += 14;
      }
    }
  }
  double v96 = RoseSyntheticApertureFiltering::range2deweight(v11, *(double *)(a2 + 8) / *((double *)this + 77));
  double v97 = *(double *)(a2 + 8);
  double v98 = *(double *)(a2 + 16);
  int v99 = *(_DWORD *)(a2 + 24);
  buf[0] = *(void *)a2;
  *(double *)&buf[1] = v97;
  *(double *)&buf[2] = v97 / (v96 * v98);
  *(double *)&buf[3] = v98;
  *(double *)&long long v235 = v96;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v235 + 8, (uint64_t)&v213);
  DWORD2(v239) = v99;
  unint64_t v100 = *((void *)this + 85);
  if (v100 >= *((void *)this + 86))
  {
    uint64_t v103 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas>(v22, (long long *)buf);
  }
  else
  {
    long long v101 = *(_OWORD *)buf;
    long long v102 = *(_OWORD *)&buf[2];
    *(void *)(v100 + 32) = v235;
    *(_OWORD *)unint64_t v100 = v101;
    *(_OWORD *)(v100 + 16) = v102;
    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v100 + 40, (uint64_t)&v235 + 8);
    *(_DWORD *)(v100 + 104) = DWORD2(v239);
    uint64_t v103 = v100 + 112;
    *((void *)this + 85) = v100 + 112;
  }
  *((void *)this + 85) = v103;
  if (*(unsigned char *)(a2 + 88))
  {
    if (*(unsigned char *)(a2 + 80))
    {
      double v104 = *(double *)(a2 + 72);
      if (v104 > 1.1)
      {
        unint64_t v105 = *((void *)this + 56);
        if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_144;
        }
        LODWORD(buf[0]) = 134217984;
        *(double *)((char *)buf + 4) = v104;
        v106 = "AoA measurement rejected due to high multipath probability (%4.2f)";
        v107 = v105;
        uint32_t v108 = 12;
        goto LABEL_119;
      }
    }
    double v109 = *(double *)(a2 + 56);
    double v110 = *(double *)(a2 + 64);
    if ((v110 < 450.0 || v109 < 0.0) && (v110 < 200.0 || v109 < 40.0))
    {
      v175 = *((void *)this + 56);
      if (!os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_144;
      }
      LODWORD(buf[0]) = 134218240;
      *(double *)((char *)buf + 4) = v110;
      WORD2(buf[1]) = 2048;
      *(double *)((char *)&buf[1] + 6) = v109;
      v106 = "AoA measurement rejected due to low track score (%4.1f) or low sweep angle (%4.1f deg)";
      v107 = v175;
      uint32_t v108 = 22;
LABEL_119:
      _os_log_impl(&dword_230EC1000, v107, OS_LOG_TYPE_DEFAULT, v106, (uint8_t *)buf, v108);
      goto LABEL_144;
    }
    v111 = *((void *)this + 56);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 134218240;
      *(double *)((char *)buf + 4) = v110;
      WORD2(buf[1]) = 2048;
      *(double *)((char *)&buf[1] + 6) = v109;
      _os_log_impl(&dword_230EC1000, v111, OS_LOG_TYPE_DEFAULT, "AoA measurement accepted: track score (%4.1f) and sweep angle (%4.1f deg)", (uint8_t *)buf, 0x16u);
    }
    *((_WORD *)this + 464) = 1;
    *((void *)this + 76) = *(void *)a2;
    buf[3] = 0x100000003;
    *(_OWORD *)&buf[1] = xmmword_230EF8BF0;
    buf[0] = &unk_26E5D3818;
    *(void *)&long long v235 = (char *)&v235 + 8;
    cnmatrix::Multiply<double>((uint64_t)v218, (uint64_t)this + 520, (uint64_t)buf);
    *((void *)&v200[1] + 1) = 0x100000003;
    *(_OWORD *)((char *)v200 + 8) = xmmword_230EF8BF0;
    *(void *)&v200[0] = &unk_26E5D3818;
    *(void *)&long long v201 = (char *)&v201 + 8;
    cnmatrix::Add<double>((uint64_t)&v224, (uint64_t)buf, (uint64_t)v200);
    if (!*(unsigned char *)(a2 + 88)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    RoseSyntheticApertureFiltering::rangeAzEl2pos(*(double *)(a2 + 8), *(double *)(a2 + 40) / 180.0 * 3.14159265, *(double *)(a2 + 32) / 180.0 * 3.14159265, (uint64_t)&v189);
    buf[3] = 0x100000003;
    *(_OWORD *)&buf[1] = xmmword_230EF8BF0;
    buf[0] = &unk_26E5D3818;
    *(void *)&long long v235 = (char *)&v235 + 8;
    cnmatrix::Multiply<double>((uint64_t)v218, (uint64_t)&v189, (uint64_t)buf);
    uint64_t v186 = 0x100000003;
    v184 = &unk_26E5D3818;
    long long v185 = xmmword_230EF8BF0;
    v187 = v188;
    cnmatrix::Add<double>((uint64_t)buf, (uint64_t)v200, (uint64_t)&v184);
    v112 = *((void *)this + 56);
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v113 = *((void *)this + 76);
      double v114 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v184, 0);
      double v115 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v184, 1u);
      double v116 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v184, 2u);
      LODWORD(buf[0]) = 134218752;
      *(void *)((char *)buf + 4) = v113;
      WORD2(buf[1]) = 2048;
      *(double *)((char *)&buf[1] + 6) = v114;
      HIWORD(buf[2]) = 2048;
      *(double *)&buf[3] = v115;
      LOWORD(v235) = 2048;
      *(double *)((char *)&v235 + 2) = v116;
      _os_log_impl(&dword_230EC1000, v112, OS_LOG_TYPE_DEFAULT, "Solution from AoA is generated at %f s - device pos is [%f, %f, %f] m", (uint8_t *)buf, 0x2Au);
    }
    uint64_t v117 = 0;
    *((_DWORD *)this + 12) = 5;
    *((unsigned char *)this + 52) = 1;
    *((_DWORD *)this + 14) = 2;
    *((unsigned char *)this + 60) = 0;
    *((void *)this + 11) = 0;
    long long v241 = 0u;
    long long v242 = 0u;
    long long v239 = 0u;
    long long v240 = 0u;
    long long v237 = 0u;
    long long v238 = 0u;
    long long v235 = 0u;
    long long v236 = 0u;
    memset(buf, 0, sizeof(buf));
    do
    {
      *(double *)&buf[v117] = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v184, v117);
      ++v117;
    }
    while (v117 != 3);
    buf[3] = 0x3F847AE147AE147CLL;
    long long v235 = 0uLL;
    long long v236 = xmmword_230EF8EC0;
    long long v237 = xmmword_230EF8ED0;
    *(void *)&long long v238 = 0x3FF0000000000000;
    LODWORD(v243) = 0;
    unint64_t v118 = *((void *)this + 10);
    unint64_t v119 = *((void *)this + 8);
    *((void *)this + 9) = v119;
    if (v119 >= v118)
    {
      unint64_t v121 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v118 - v119) >> 3);
      uint64_t v122 = 2 * v121;
      if (2 * v121 <= 1) {
        uint64_t v122 = 1;
      }
      if (v121 >= 0xC30C30C30C30C3) {
        unint64_t v123 = 0x186186186186186;
      }
      else {
        unint64_t v123 = v122;
      }
      v124 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::BatchSolutionParticle>>((uint64_t)this + 80, v123);
      v126 = &v124[168 * v125];
      *((_OWORD *)v124 + 6) = v239;
      *((_OWORD *)v124 + 5) = v238;
      *((_OWORD *)v124 + 4) = v237;
      *((_OWORD *)v124 + 3) = v236;
      *((void *)v124 + 20) = v243;
      *((_OWORD *)v124 + 9) = v242;
      *((_OWORD *)v124 + 8) = v241;
      *((_OWORD *)v124 + 7) = v240;
      *(_OWORD *)v124 = *(_OWORD *)buf;
      *((_OWORD *)v124 + 1) = *(_OWORD *)&buf[2];
      *((_OWORD *)v124 + 2) = v235;
      v120 = v124 + 168;
      v128 = (char *)*((void *)this + 8);
      v127 = (char *)*((void *)this + 9);
      if (v127 != v128)
      {
        do
        {
          long long v129 = *(_OWORD *)(v127 - 168);
          long long v130 = *(_OWORD *)(v127 - 152);
          *(_OWORD *)(v124 - 136) = *(_OWORD *)(v127 - 136);
          *(_OWORD *)(v124 - 152) = v130;
          *(_OWORD *)(v124 - 168) = v129;
          long long v131 = *(_OWORD *)(v127 - 120);
          long long v132 = *(_OWORD *)(v127 - 104);
          long long v133 = *(_OWORD *)(v127 - 88);
          *(_OWORD *)(v124 - 72) = *(_OWORD *)(v127 - 72);
          *(_OWORD *)(v124 - 88) = v133;
          *(_OWORD *)(v124 - 104) = v132;
          *(_OWORD *)(v124 - 120) = v131;
          long long v134 = *(_OWORD *)(v127 - 56);
          long long v135 = *(_OWORD *)(v127 - 40);
          long long v136 = *(_OWORD *)(v127 - 24);
          *((_DWORD *)v124 - 2) = *((_DWORD *)v127 - 2);
          *(_OWORD *)(v124 - 24) = v136;
          *(_OWORD *)(v124 - 40) = v135;
          *(_OWORD *)(v124 - 56) = v134;
          v124 -= 168;
          v127 -= 168;
        }
        while (v127 != v128);
        v127 = (char *)*((void *)this + 8);
      }
      *((void *)this + 8) = v124;
      *((void *)this + 9) = v120;
      *((void *)this + 10) = v126;
      if (v127) {
        operator delete(v127);
      }
    }
    else
    {
      *(_OWORD *)(v119 + 112) = v240;
      *(_OWORD *)(v119 + 128) = v241;
      *(_OWORD *)(v119 + 144) = v242;
      *(void *)(v119 + 160) = v243;
      *(_OWORD *)(v119 + 48) = v236;
      *(_OWORD *)(v119 + 64) = v237;
      *(_OWORD *)(v119 + 80) = v238;
      *(_OWORD *)(v119 + 96) = v239;
      *(_OWORD *)unint64_t v119 = *(_OWORD *)buf;
      *(_OWORD *)(v119 + 16) = *(_OWORD *)&buf[2];
      *(_OWORD *)(v119 + 32) = v235;
      v120 = (char *)(v119 + 168);
    }
    *((void *)this + 9) = v120;
  }
LABEL_144:
  if ((*((unsigned char *)this + 931) || *((unsigned char *)this + 932))
    && (unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)this + 85) - *((void *)this + 84)) >> 4)) >= 4)
  {
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkMotionStateAndObservability(this);
  }
  uint64_t v137 = *((void *)this + 85) - *((void *)this + 84);
  unint64_t v138 = 0x6DB6DB6DB6DB6DB7 * (v137 >> 4);
  if (v138 >= 4
    && !*((unsigned char *)this + 931)
    && !*((unsigned char *)this + 932)
    && *((double *)this + 74) - *((double *)this + 75) >= 0.5)
  {
    BOOL v176 = RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(this);
    *((unsigned char *)this + 933) = v176;
    if (v176)
    {
      *((void *)this + 75) = *((void *)this + 74);
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkVerticalAmbiguityResolution(this);
      *((unsigned char *)this + 929) = 0;
      goto LABEL_157;
    }
LABEL_156:
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::computeStraightPathSolution(this);
    goto LABEL_157;
  }
  if (v137 == 112)
  {
    double v139 = *((double *)this + 74);
    *((double *)this + 73) = v139;
    *((double *)this + 75) = v139 + -0.5;
    goto LABEL_157;
  }
  if (v138 >= 5 && !*((unsigned char *)this + 933)) {
    goto LABEL_156;
  }
LABEL_157:
  *(_DWORD *)v210 = 0;
  v210[4] = 0;
  *(_DWORD *)&v210[8] = 0;
  long long __src = 0u;
  long long v212 = 0u;
  v210[12] = 0;
  if (*((unsigned char *)this + 934))
  {
    int v140 = 6;
LABEL_159:
    *(_DWORD *)v210 = v140;
    goto LABEL_160;
  }
  if (*((unsigned char *)this + 931))
  {
    if (!*((unsigned char *)this + 932))
    {
      int v140 = 1;
      goto LABEL_159;
    }
  }
  else
  {
    if (*((unsigned char *)this + 932))
    {
      v141 = *((void *)this + 56);
      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v142 = *((void *)this + 78);
        LODWORD(buf[0]) = 134217984;
        *(void *)((char *)buf + 4) = v142;
        _os_log_impl(&dword_230EC1000, v141, OS_LOG_TYPE_DEFAULT, "Linear user path length is %4.2f m", (uint8_t *)buf, 0xCu);
      }
      if (*((double *)this + 78) >= 1.5) {
        int v140 = 3;
      }
      else {
        int v140 = 2;
      }
      goto LABEL_159;
    }
    if (!*((unsigned char *)this + 933))
    {
      int v140 = 4;
      goto LABEL_159;
    }
    *(_DWORD *)v210 = 5;
    *(_DWORD *)&v210[8] = *((_DWORD *)this + 234);
    v210[4] = *(_DWORD *)&v210[8] == 2;
    uint64_t v143 = *((void *)this + 18);
    uint64_t v178 = *((void *)this + 19);
    for (j = (char *)this + 168; v143 != v178; v143 += 432)
    {
      uint64_t v145 = 0;
      long long v207 = 0u;
      long long v208 = 0u;
      long long v205 = 0u;
      long long v206 = 0u;
      long long v203 = 0u;
      long long v204 = 0u;
      long long v201 = 0u;
      long long v202 = 0u;
      memset(v200, 0, sizeof(v200));
      LODWORD(v209) = 1;
      do
      {
        *((void *)v200 + v145) = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143, v145);
        ++v145;
      }
      while (v145 != 3);
      *((void *)&v200[1] + 1) = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 128, 0, 0);
      *(void *)&long long v201 = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 128, 0, 1);
      *((void *)&v201 + 1) = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 128, 0, 2);
      *(void *)&long long v202 = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 128, 1, 1);
      *((void *)&v202 + 1) = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 128, 1, 2);
      *(void *)&long long v203 = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 128, 2, 2);
      int v146 = *(_DWORD *)(v143 + 136);
      if (v146 != *(_DWORD *)(v143 + 140)) {
        __assert_rtn("Trace", "cnmatrixbase.h", 4977, "A.NumRows() == A.NumCols()");
      }
      if (v146 < 1)
      {
        double v148 = 0.0;
      }
      else
      {
        int v147 = 0;
        double v148 = 0.0;
        do
        {
          double v148 = v148 + cnmatrix::CNMatrixBase<double>::operator()<int,int>(v143 + 128, v147, v147);
          ++v147;
        }
        while (v146 != v147);
      }
      uint64_t v149 = *(void *)(v143 + 352);
      *((void *)&v203 + 1) = sqrt(v148);
      *(void *)&long long v204 = v149;
      LODWORD(v209) = *(_DWORD *)(v143 + 360);
      uint64_t v181 = 0x100000003;
      __p = &unk_26E5D3818;
      long long v180 = xmmword_230EF8BF0;
      v182 = v183;
      cnmatrix::Subtract<double>(v143 + 368, (uint64_t)j, (uint64_t)&__p);
      uint64_t v191 = 0x100000003;
      long long v190 = xmmword_230EF8BF0;
      v189 = &unk_26E5D3818;
      v192 = v193;
      buf[3] = 0x100000134;
      *(_OWORD *)&buf[1] = xmmword_230EF8C20;
      buf[0] = &unk_26E5D38E8;
      *(void *)&long long v235 = (char *)&v235 + 8;
      uint64_t v186 = 0x100000003;
      v184 = &unk_26E5D3818;
      long long v185 = xmmword_230EF8BF0;
      v187 = v188;
      cnmatrix::Norm<double>((uint64_t)&__p, (uint64_t)&v189, (uint64_t)buf, (uint64_t)&v184, "2");
      if (v150 != 0.0)
      {
        uint64_t v198 = 0;
        uint64_t v197 = 0;
        uint64_t v199 = 0;
        memset(v196, 0, sizeof(v196));
        memset(v195, 0, sizeof(v195));
        std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve(&v197, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)this + 85) - *((void *)this + 84)) >> 4));
        cnmatrix::CNMatrixBase<double>::operator=(v143 + 368, (uint64_t)j);
        buf[3] = 0x100000003;
        *(_OWORD *)&buf[1] = xmmword_230EF8BF0;
        buf[0] = &unk_26E5D3818;
        *(void *)&long long v235 = (char *)&v235 + 8;
        cnmatrix::Subtract<double>(v143, (uint64_t)j, (uint64_t)buf);
        RoseSyntheticApertureFiltering::pos2rangeThPhi((uint64_t)buf, (uint64_t)v194);
        cnmatrix::CNMatrixBase<double>::operator=(v143 + 64, (uint64_t)v194);
        RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatchAlt(v151, (uint64_t)v194, (uint64_t)j, (double **)this + 84, v195, &v197, v196);
        v152 = a3;
        uint64_t v191 = 0x300000003;
        long long v190 = xmmword_230EF8E90;
        v189 = &unk_26E5D3970;
        v192 = v193;
        cnmatrix::FastResize<double>(&v189, 3, 3);
        cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v189, 0.0);
        uint64_t v153 = v197;
        for (uint64_t k = v198; v153 != k; v153 += 136)
        {
          uint64_t v186 = 0x300000003;
          v184 = &unk_26E5D3970;
          long long v185 = xmmword_230EF8E90;
          v187 = v188;
          cnmatrix::Multiply<double>(v153 + 72, v153 + 8, (uint64_t)&v184);
          buf[3] = 0x300000003;
          *(_OWORD *)&buf[1] = xmmword_230EF8E90;
          buf[0] = &unk_26E5D3970;
          *(void *)&long long v235 = (char *)&v235 + 8;
          cnmatrix::Add<double>((uint64_t)&v189, (uint64_t)&v184, (uint64_t)buf);
          cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v189, (uint64_t)buf);
        }
        cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)&v184, (uint64_t)&v189);
        uint64_t v181 = 0x300000003;
        __p = &unk_26E5D3970;
        long long v180 = xmmword_230EF8E90;
        v182 = v183;
        uint64_t v231 = 0x100000003;
        long long v230 = xmmword_230EF8BF0;
        v229 = &unk_26E5D3A90;
        v232 = &v233;
        buf[3] = 0x10000000CLL;
        *(_OWORD *)&buf[1] = xmmword_230EF8EE0;
        buf[0] = &unk_26E5D3B18;
        *(void *)&long long v235 = (char *)&v235 + 8;
        cnmatrix::Inv<double>((uint64_t)&v184, (uint64_t)&v229, (uint64_t)buf, (uint64_t)&__p);
        a3 = v152;
        cnmatrix::CNMatrixBase<double>::operator=(v143 + 240, (uint64_t)&__p);
        j = (char *)this + 168;
        buf[0] = v195;
        std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        buf[0] = v196;
        std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        buf[0] = &v197;
        std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      }
      *((void *)&v204 + 1) = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 64, 0);
      *(void *)&long long v205 = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 64, 1u);
      *((void *)&v205 + 1) = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 64, 2u);
      *(void *)&long long v206 = sqrt(*(double *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 240, 0, 0));
      *((void *)&v206 + 1) = sqrt(*(double *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 240, 1, 1));
      uint64_t v155 = 0;
      *(void *)&long long v207 = sqrt(*(double *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 240, 2, 2));
      do
      {
        *((void *)&v207 + v155 + 1) = *(void *)cnmatrix::CNMatrixBase<double>::operator()(v143 + 368, v155);
        ++v155;
      }
      while (v155 != 3);
      v156 = (_OWORD *)*((void *)&__src + 1);
      if (*((void *)&__src + 1) >= (unint64_t)v212)
      {
        v158 = (_OWORD *)__src;
        unint64_t v159 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)&__src + 1) - __src) >> 3);
        unint64_t v160 = v159 + 1;
        if (v159 + 1 > 0x186186186186186) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        if (0x9E79E79E79E79E7ALL * ((uint64_t)(v212 - __src) >> 3) > v160) {
          unint64_t v160 = 0x9E79E79E79E79E7ALL * ((uint64_t)(v212 - __src) >> 3);
        }
        if (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v212 - __src) >> 3) >= 0xC30C30C30C30C3) {
          unint64_t v161 = 0x186186186186186;
        }
        else {
          unint64_t v161 = v160;
        }
        if (v161)
        {
          v162 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::BatchSolutionParticle>>((uint64_t)&v212, v161);
          v156 = (_OWORD *)*((void *)&__src + 1);
          v158 = (_OWORD *)__src;
        }
        else
        {
          v162 = 0;
        }
        v163 = &v162[168 * v159];
        *((_OWORD *)v163 + 7) = v206;
        *((_OWORD *)v163 + 8) = v207;
        *((_OWORD *)v163 + 9) = v208;
        *((void *)v163 + 20) = v209;
        *((_OWORD *)v163 + 3) = v202;
        *((_OWORD *)v163 + 4) = v203;
        *((_OWORD *)v163 + 5) = v204;
        *((_OWORD *)v163 + 6) = v205;
        *(_OWORD *)v163 = v200[0];
        *((_OWORD *)v163 + 1) = v200[1];
        *((_OWORD *)v163 + 2) = v201;
        if (v156 == v158)
        {
          v173 = &v162[168 * v159];
        }
        else
        {
          v164 = &v162[168 * v159];
          do
          {
            long long v165 = *(_OWORD *)((char *)v156 - 168);
            long long v166 = *(_OWORD *)((char *)v156 - 152);
            *(_OWORD *)(v164 - 136) = *(_OWORD *)((char *)v156 - 136);
            *(_OWORD *)(v164 - 152) = v166;
            *(_OWORD *)(v164 - 168) = v165;
            long long v167 = *(_OWORD *)((char *)v156 - 120);
            long long v168 = *(_OWORD *)((char *)v156 - 104);
            long long v169 = *(_OWORD *)((char *)v156 - 88);
            *(_OWORD *)(v164 - 72) = *(_OWORD *)((char *)v156 - 72);
            *(_OWORD *)(v164 - 88) = v169;
            *(_OWORD *)(v164 - 104) = v168;
            *(_OWORD *)(v164 - 120) = v167;
            long long v170 = *(_OWORD *)((char *)v156 - 56);
            long long v171 = *(_OWORD *)((char *)v156 - 40);
            long long v172 = *(_OWORD *)((char *)v156 - 24);
            v173 = v164 - 168;
            *((_DWORD *)v164 - 2) = *((_DWORD *)v156 - 2);
            *(_OWORD *)(v164 - 24) = v172;
            *(_OWORD *)(v164 - 40) = v171;
            *(_OWORD *)(v164 - 56) = v170;
            v156 = (_OWORD *)((char *)v156 - 168);
            v164 -= 168;
          }
          while (v156 != v158);
        }
        v157 = v163 + 168;
        *(void *)&long long __src = v173;
        *((void *)&__src + 1) = v163 + 168;
        *(void *)&long long v212 = &v162[168 * v161];
        if (v158) {
          operator delete(v158);
        }
      }
      else
      {
        *(_OWORD *)(*((void *)&__src + 1) + 112) = v206;
        v156[8] = v207;
        v156[9] = v208;
        *((void *)v156 + 20) = v209;
        v156[3] = v202;
        v156[4] = v203;
        v156[5] = v204;
        v156[6] = v205;
        _OWORD *v156 = v200[0];
        v156[1] = v200[1];
        v156[2] = v201;
        v157 = (char *)v156 + 168;
      }
      *((void *)&__src + 1) = v157;
      uint64_t v174 = *((void *)this + 82);
      if (v174 == *((void *)this + 79)) {
        uint64_t v174 = *((void *)this + 80);
      }
      *((void *)&v212 + 1) = *(void *)(v174 - 8);
    }
  }
LABEL_160:
  *(void *)this = *(void *)v210;
  *(void *)((char *)this + 5) = *(void *)&v210[5];
  if (v210 != (unsigned char *)this) {
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>((char *)this + 16, (char *)__src, *((uint64_t *)&__src + 1), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)&__src + 1) - __src) >> 3));
  }
  *((void *)this + 5) = *((void *)&v212 + 1);
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getBatchOrAoASolution(this, a3);
  if ((void)__src)
  {
    *((void *)&__src + 1) = __src;
    operator delete((void *)__src);
  }
}

void sub_230ED4630(_Unwind_Exception *a1)
{
  *(void *)(v1 + 680) = v2;
  _Unwind_Resume(a1);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::resetFilter(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  *((void *)this + 75) = *((void *)this + 73);
  *((void *)this + 78) = 0;
  *(_DWORD *)((char *)this + 930) = 65792;
  *((_WORD *)this + 470) = 0;
  *((_DWORD *)this + 234) = 0;
  uint64_t v1 = *((void *)this + 56);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_230EC1000, v1, OS_LOG_TYPE_DEFAULT, "Batch filter is reset", v2, 2u);
  }
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkMotionStateAndObservability(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  v68[226] = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 85);
  uint64_t v3 = *((void *)this + 84);
  unint64_t v4 = 0x6DB6DB6DB6DB6DB7 * ((v2 - v3) >> 4);
  uint64_t v58 = 0;
  unint64_t v59 = 0;
  unint64_t v60 = 0;
  std::vector<cnmatrix::CNMatrix<2u,1u,double>>::reserve(&v58, v4);
  uint64_t v55 = 0x100000002;
  long long v54 = xmmword_230EF8EF0;
  uint64_t v53 = &unk_26E5D3BA8;
  uint64_t v56 = &v57;
  uint64_t v5 = *((void *)this + 84);
  uint64_t v6 = *((void *)this + 85);
  while (v5 != v6)
  {
    double v7 = cnmatrix::CNMatrixBase<double>::operator()(v5 + 40, 2u);
    *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v53, 0) = v7;
    double v8 = cnmatrix::CNMatrixBase<double>::operator()(v5 + 40, 0);
    *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v53, 1u) = v8;
    unint64_t v9 = v59;
    if (v59 >= v60)
    {
      uint64_t v10 = std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__push_back_slow_path<cnmatrix::CNMatrix<2u,1u,double> const&>(&v58, (uint64_t)&v53);
    }
    else
    {
      cnmatrix::CNMatrix<2u,1u,double>::CNMatrix(v59, (uint64_t)&v53);
      uint64_t v10 = v9 + 56;
    }
    unint64_t v59 = v10;
    v5 += 112;
  }
  uint64_t v50 = 0x100000002;
  long long v49 = xmmword_230EF8EF0;
  uint64_t v48 = &unk_26E5D3BA8;
  unint64_t v51 = &v52;
  cnmatrix::FastResize<double>(&v48, 2, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v48, 0.0);
  uint64_t v12 = v58;
  for (unint64_t i = v59; v12 != i; v12 += 56)
  {
    uint64_t v66 = 0x100000002;
    buf[0] = (void **)&unk_26E5D3BA8;
    *(_OWORD *)&buf[1] = xmmword_230EF8EF0;
    unint64_t v67 = v68;
    cnmatrix::Add<double>((uint64_t)&v48, v12, (uint64_t)buf);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v48, (uint64_t)buf);
  }
  uint64_t v66 = 0x100000002;
  *(_OWORD *)&buf[1] = xmmword_230EF8EF0;
  buf[0] = (void **)&unk_26E5D3BA8;
  unint64_t v67 = v68;
  cnmatrix::Multiply<double>((uint64_t)&v48, (uint64_t)buf, 1.0 / (double)v4);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v48, (uint64_t)buf);
  if (v2 == v3)
  {
    int v17 = *((unsigned __int8 *)this + 931);
    goto LABEL_25;
  }
  uint64_t v13 = 0;
  if (v4 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v4;
  }
  double v15 = 0.0;
  do
  {
    uint64_t v66 = 0x100000002;
    buf[0] = (void **)&unk_26E5D3BA8;
    *(_OWORD *)&buf[1] = xmmword_230EF8EF0;
    unint64_t v67 = v68;
    cnmatrix::Subtract<double>(v58 + v13, (uint64_t)&v48, (uint64_t)buf);
    cnmatrix::CNMatrixBase<double>::operator=(v58 + v13, (uint64_t)buf);
    if (*((unsigned char *)this + 931))
    {
      uint64_t v45 = 0x100000002;
      long long v44 = xmmword_230EF8EF0;
      double v43 = &unk_26E5D3BA8;
      int v46 = v47;
      uint64_t v66 = 0x1000000E1;
      *(_OWORD *)&buf[1] = xmmword_230EF8F00;
      buf[0] = (void **)&unk_26E5D3BF0;
      unint64_t v67 = v68;
      uint64_t v40 = 0x100000002;
      unint64_t v38 = &unk_26E5D3BA8;
      long long v39 = xmmword_230EF8EF0;
      uint64_t v41 = v42;
      cnmatrix::Norm<double>(v58 + v13, (uint64_t)&v43, (uint64_t)buf, (uint64_t)&v38, "2");
      if (v16 > v15) {
        double v15 = v16;
      }
    }
    v13 += 56;
    --v14;
  }
  while (v14);
  int v17 = *((unsigned __int8 *)this + 931);
  if (!*((unsigned char *)this + 931) || v15 < 0.3)
  {
LABEL_25:
    if (!*((unsigned char *)this + 932) || v17) {
      goto LABEL_56;
    }
    goto LABEL_27;
  }
  uint64_t v18 = *((void *)this + 56);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 134217984;
    *(void ***)((char *)buf + 4) = *(void ***)&v15;
    _os_log_impl(&dword_230EC1000, v18, OS_LOG_TYPE_DEFAULT, "Enough user motion is detected: %f m - fStatic set to false", (uint8_t *)buf, 0xCu);
  }
  *((unsigned char *)this + 931) = 0;
  if (*((unsigned char *)this + 932))
  {
LABEL_27:
    uint64_t v66 = 0x200000002;
    *(_OWORD *)&buf[1] = xmmword_230EF8F10;
    buf[0] = (void **)&unk_26E5D3C38;
    unint64_t v67 = v68;
    cnmatrix::FastResize<double>(buf, 2, 2);
    cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)buf, 0.0);
    uint64_t v20 = v58;
    for (unint64_t j = v59; v20 != j; v20 += 56)
    {
      cnmatrix::CNMatrix<1u,2u,double>::CNMatrix((uint64_t)v37, *(_DWORD *)(v20 + 12), *(_DWORD *)(v20 + 8));
      cnmatrix::Transpose<double>(v20, v37);
      uint64_t v40 = 0x200000002;
      unint64_t v38 = &unk_26E5D3C38;
      long long v39 = xmmword_230EF8F10;
      uint64_t v41 = v42;
      cnmatrix::Multiply<double>(v20, (uint64_t)v37, (uint64_t)&v38);
      uint64_t v45 = 0x200000002;
      long long v44 = xmmword_230EF8F10;
      double v43 = &unk_26E5D3C38;
      int v46 = v47;
      cnmatrix::Add<double>((uint64_t)buf, (uint64_t)&v38, (uint64_t)&v43);
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)buf, (uint64_t)&v43);
    }
    uint64_t v45 = 0x200000002;
    long long v44 = xmmword_230EF8F10;
    double v43 = &unk_26E5D3C38;
    int v46 = v47;
    uint64_t v40 = 0x200000002;
    unint64_t v38 = &unk_26E5D3C38;
    long long v39 = xmmword_230EF8F10;
    uint64_t v41 = v42;
    cnmatrix::Eig<2u,2u,2u,2u,2u,2u,double>((uint64_t)buf, (uint64_t)&v43, (uint64_t)&v38);
    double v21 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v38, 0, 0);
    double v22 = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v38, 1, 1);
    if (*v22 >= v21) {
      double v23 = v21;
    }
    else {
      double v23 = *v22;
    }
    cnmatrix::CNMatrix<2u,2u,double>::CNMatrix((uint64_t)v37, DWORD1(v44), v44);
    cnmatrix::Transpose<double>((uint64_t)&v43, v37);
    uint64_t v25 = v58;
    unint64_t v24 = v59;
    if (v58 == v59)
    {
      double v33 = 0.0;
      double v34 = 0.0;
    }
    else
    {
      double v26 = 0.0;
      double v27 = 0.0;
      double v28 = 0.0;
      double v29 = 0.0;
      do
      {
        uint64_t v62 = 0x100000002;
        *(void *)uint64_t v61 = &unk_26E5D3BA8;
        *(_OWORD *)&v61[8] = xmmword_230EF8EF0;
        uint64_t v63 = &v64;
        cnmatrix::Multiply<double>((uint64_t)v37, v25, (uint64_t)v61);
        double v30 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v61, 0);
        double v31 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v61, 1u);
        if (v30 < v29) {
          double v32 = v30;
        }
        else {
          double v32 = v29;
        }
        if (v30 > v28) {
          double v28 = v30;
        }
        else {
          double v29 = v32;
        }
        if (v31 <= v26)
        {
          if (v31 < v27) {
            double v27 = v31;
          }
        }
        else
        {
          double v26 = v31;
        }
        v25 += 56;
      }
      while (v25 != v24);
      double v33 = v28 - v29;
      double v34 = v26 - v27;
    }
    if (v34 >= v33) {
      double v35 = v33;
    }
    else {
      double v35 = v34;
    }
    if (v33 < v34) {
      double v33 = v34;
    }
    *((double *)this + 78) = v33;
    if (v35 >= 0.3)
    {
      BOOL v36 = *((void *)this + 56);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v61 = 134218240;
        *(double *)&v61[4] = v23;
        *(_WORD *)&v61[12] = 2048;
        *(double *)&v61[14] = v35;
        _os_log_impl(&dword_230EC1000, v36, OS_LOG_TYPE_DEFAULT, "Batch filter problem is observable now: smallest eigenvalue is %f, smallest rectangular box dimension is %f m", v61, 0x16u);
      }
      *((unsigned char *)this + 932) = 0;
    }
  }
LABEL_56:
  buf[0] = (void **)&v58;
  std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__destroy_vector::operator()[abi:ne180100](buf);
}

void sub_230ED4FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  a13 = (void **)&a54;
  std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

BOOL RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  v143[308] = *MEMORY[0x263EF8340];
  uint64_t v1 = *((void *)this + 85);
  uint64_t v2 = *((void *)this + 84);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v1 - v2) >> 4)) >= 4)
  {
    uint64_t v133 = 0;
    uint64_t v132 = 0;
    uint64_t v134 = 0;
    uint64_t v4 = *((void *)this + 18);
    long long v102 = (uint64_t *)((char *)this + 144);
    uint64_t v5 = *((void *)this + 19);
    if (*((unsigned char *)this + 933)) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v4 == v5;
    }
    if (v6)
    {
      if (v2 != v1)
      {
        for (uint64_t i = v2 + 112; i != v1; i += 112)
        {
          if (*(double *)(i + 8) < *(double *)(v2 + 8)) {
            uint64_t v2 = i;
          }
        }
      }
      if (*(double *)(v2 + 8) >= 0.5) {
        double v11 = *(double *)(v2 + 8);
      }
      else {
        double v11 = 0.5;
      }
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)buf, v2 + 40);
      for (unsigned int j = 0; j != 3; ++j)
      {
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v113, (uint64_t)buf);
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v108, (uint64_t)buf);
        double v13 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v113, j);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v113, j) = v11 + v13;
        double v14 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v108, j);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v108, j) = v14 - v11;
        std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](&v132, (uint64_t)&v113);
        std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](&v132, (uint64_t)&v108);
      }
    }
    else
    {
      if (v4 != v5)
      {
        do
        {
          std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](&v132, v4);
          v4 += 432;
        }
        while (v4 != v5);
        uint64_t v5 = *v102;
      }
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)buf, v5);
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v113, (uint64_t)buf);
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v108, (uint64_t)buf);
      double v7 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v113, 1u);
      *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v113, 1u) = v7 + 3.0;
      double v8 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v108, 1u);
      *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v108, 1u) = v8 + -3.0;
      std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](&v132, (uint64_t)&v113);
      std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](&v132, (uint64_t)&v108);
    }
    uint64_t v103 = this;
    double v15 = (char *)this + 672;
    long long v130 = 0;
    uint64_t v129 = 0;
    unint64_t v131 = 0;
    uint64_t v16 = v132;
    uint64_t v17 = v133;
    if (v132 == v133)
    {
      double v21 = 0;
      double v23 = 0;
    }
    else
    {
      do
      {
        uint64_t v113 = 0;
        long long v114 = 0uLL;
        RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::initializeFilterWithGuess((uint64_t)this, v16, (uint64_t)v15, &v113, (uint64_t)buf);
        uint64_t v18 = v130;
        if ((unint64_t)v130 >= v131)
        {
          uint64_t v19 = (char *)std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult>(&v129, (uint64_t)buf);
        }
        else
        {
          std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult>((uint64_t)&v131, (uint64_t)v130, (uint64_t)buf);
          uint64_t v19 = v18 + 376;
        }
        long long v130 = v19;
        v143[26] = &unk_26E5D3870;
        v143[12] = &unk_26E5D3870;
        v143[4] = &unk_26E5D3870;
        *(void *)&uint8_t buf[8] = &unk_26E5D3870;
        uint32_t v108 = &v113;
        std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v108);
        v16 += 64;
      }
      while (v16 != v17);
      uint64_t v20 = v129;
      double v21 = v130;
      if ((char *)v129 != v130)
      {
        double v22 = this;
        while (*(unsigned char *)v20)
        {
          v20 += 376;
          if ((char *)v20 == v130)
          {
            double v23 = v130;
            goto LABEL_35;
          }
        }
        if ((char *)v20 == v130 || (char *)(v20 + 376) == v130)
        {
          double v23 = (char *)v20;
        }
        else
        {
          double v23 = (char *)v20;
          do
          {
            if (*(unsigned char *)(v20 + 376))
            {
              *double v23 = *(unsigned char *)(v20 + 376);
              cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v23 + 8), v20 + 384);
              cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v23 + 72), v20 + 448);
              cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v23 + 136), v20 + 512);
              cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v23 + 248), v20 + 624);
              uint64_t v54 = *(void *)(v20 + 736);
              *((_DWORD *)v23 + 92) = *(_DWORD *)(v20 + 744);
              *((void *)v23 + 45) = v54;
              v23 += 376;
            }
            uint64_t v55 = (char *)(v20 + 752);
            v20 += 376;
          }
          while (v55 != v21);
          double v21 = v130;
        }
        goto LABEL_35;
      }
      double v23 = v130;
    }
    double v22 = this;
LABEL_35:
    std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::erase((uint64_t)&v129, (uint64_t)v23, (uint64_t)v21);
    unint64_t v24 = 126 - 2 * __clz(0x51B3BEA3677D46CFLL * ((uint64_t)&v130[-v129] >> 3));
    if (v130 == (char *)v129) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = v24;
    }
    std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(v129, v130, v25, 1);
    if ((char *)v129 == v130)
    {
LABEL_157:
      BOOL v9 = *((void *)v22 + 19) != *((void *)v22 + 18);
LABEL_158:
      *(void *)buf = &v129;
      std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      *(void *)buf = &v132;
      std::vector<cnmatrix::CNMatrix<3u,1u,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      return v9;
    }
    *(void *)buf = sqrt(*(double *)(v129 + 360)/ ((double)(unint64_t)(0x6DB6DB6DB6DB6DB7* ((uint64_t)(*((void *)v22 + 85) - *((void *)v22 + 84)) >> 4))+ -3.0));
    boost::circular_buffer<double,std::allocator<double>>::push_back_impl<double &&>((void *)v22 + 79, buf);
    uint64_t v26 = *((void *)v22 + 82);
    uint64_t v27 = *((void *)v22 + 79);
    uint64_t v28 = v26;
    if (v26 == v27) {
      uint64_t v28 = *((void *)v22 + 80);
    }
    double v29 = *((double *)v22 + 123);
    if (*(double *)(v28 - 8) > v29)
    {
      uint64_t v52 = *((void *)v22 + 56);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        if (v26 == v27) {
          uint64_t v26 = *((void *)v22 + 80);
        }
        uint64_t v53 = *(void *)(v26 - 8);
        *(_DWORD *)buf = 134218240;
        *(void *)&void buf[4] = v53;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v29;
        _os_log_impl(&dword_230EC1000, v52, OS_LOG_TYPE_DEFAULT, "Batch filter has detected an issue with the measurements - rms normalized error (%f) is above the threshold (%f)", buf, 0x16u);
      }
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::reinitFilter(v22);
      BOOL v9 = 0;
      *((unsigned char *)v22 + 934) = 1;
      goto LABEL_158;
    }
    uint64_t v127 = 0;
    uint64_t v126 = 0;
    unint64_t v128 = 0;
    uint64_t v30 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v126, v129);
    uint64_t v31 = v30;
    uint64_t v32 = v129;
    uint64_t v127 = v30;
    if ((unint64_t)(0x51B3BEA3677D46CFLL * ((uint64_t)&v130[-v129] >> 3)) >= 2)
    {
      unint64_t v33 = 1;
      uint64_t v34 = v30;
      do
      {
        if (v34 == v126)
        {
          unint64_t v37 = v34;
        }
        else
        {
          unint64_t v35 = 0;
          BOOL v36 = 1;
          uint64_t v34 = v126;
          unint64_t v37 = v31;
          do
          {
            uint64_t v38 = v34 + 376 * v35 + 8;
            while (!v36)
            {
              BOOL v36 = 0;
              ++v35;
              v38 += 376;
              if (0x51B3BEA3677D46CFLL * ((uint64_t)(v37 - v34) >> 3) <= v35)
              {
                uint64_t v32 = v129;
                uint64_t v31 = v37;
                goto LABEL_59;
              }
            }
            uint64_t v123 = 0x100000003;
            long long v122 = xmmword_230EF8BF0;
            unint64_t v121 = &unk_26E5D3818;
            v124 = v125;
            cnmatrix::Subtract<double>(v129 + 376 * v33 + 8, v38, (uint64_t)&v121);
            uint64_t v115 = 0x100000003;
            long long v114 = xmmword_230EF8BF0;
            uint64_t v113 = (double *)&unk_26E5D3818;
            double v116 = v117;
            uint64_t v141 = 0x100000134;
            *(_OWORD *)&uint8_t buf[8] = xmmword_230EF8C20;
            *(void *)buf = &unk_26E5D38E8;
            uint64_t v142 = v143;
            uint64_t v110 = 0x100000003;
            uint32_t v108 = (double **)&unk_26E5D3818;
            long long v109 = xmmword_230EF8BF0;
            v111 = v112;
            cnmatrix::Norm<double>((uint64_t)&v121, (uint64_t)&v113, (uint64_t)buf, (uint64_t)&v108, "2");
            BOOL v36 = v39 > 0.1;
            unint64_t v37 = v127;
            uint64_t v34 = v126;
            ++v35;
          }
          while (0x51B3BEA3677D46CFLL * ((v127 - v126) >> 3) > v35);
          uint64_t v32 = v129;
          uint64_t v31 = v127;
          if (v39 <= 0.1) {
            goto LABEL_59;
          }
        }
        if (exp(*(double *)(v34 + 360) - *(double *)(v32 + 376 * v33 + 360)) > 0.01)
        {
          if (v37 >= v128)
          {
            uint64_t v31 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v126, v32 + 376 * v33);
          }
          else
          {
            std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>((uint64_t)&v128, v37, v32 + 376 * v33);
            uint64_t v31 = v37 + 376;
          }
          uint64_t v127 = v31;
          uint64_t v32 = v129;
          unint64_t v37 = v31;
        }
LABEL_59:
        ++v33;
        uint64_t v34 = v37;
      }
      while (0x51B3BEA3677D46CFLL * ((uint64_t)&v130[-v32] >> 3) > v33);
    }
    uint64_t v40 = v126;
    double v22 = v103;
    if ((unint64_t)(0x51B3BEA3677D46CFLL * ((v31 - v126) >> 3)) > 1)
    {
      double v41 = exp(-*(double *)(v126 + 360));
      double v42 = 0.0;
      if (v40 != v31)
      {
        uint64_t v43 = v40;
        do
        {
          double v42 = v42 + exp(-*(double *)(v43 + 360));
          v43 += 376;
        }
        while (v43 != v31);
      }
      double v44 = v41 / v42;
      if (v44 < 0.9)
      {
        uint64_t v45 = (double *)cnmatrix::CNMatrixBase<double>::operator()(v40 + 72, 1u);
        uint64_t v31 = v127;
        uint64_t v40 = v126;
        if ((unint64_t)(0x51B3BEA3677D46CFLL * ((v127 - v126) >> 3)) >= 2)
        {
          double v46 = *v45;
          unint64_t v47 = 1;
          uint64_t v48 = 448;
          while (1)
          {
            long long v49 = (double *)cnmatrix::CNMatrixBase<double>::operator()(v40 + v48, 1u);
            double v50 = fmod(*v49 - v46 + 3.14159265, 6.28318531);
            if (v50 < 0.0) {
              double v50 = v50 + 6.28318531;
            }
            double v51 = fabs(v50 + -3.14159265);
            if (v51 > 0.392699082) {
              break;
            }
            ++v47;
            uint64_t v31 = v127;
            uint64_t v40 = v126;
            v48 += 376;
            if (0x51B3BEA3677D46CFLL * ((v127 - v126) >> 3) <= v47) {
              goto LABEL_84;
            }
          }
          double v97 = *((void *)v103 + 56);
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            *(double *)&void buf[4] = v44;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v51;
            _os_log_impl(&dword_230EC1000, v97, OS_LOG_TYPE_DEFAULT, "Batch filter clearing solutions since the best one has a low weight (%f) and the horizontal angle difference to a secondary solution is too high (%f)", buf, 0x16u);
          }
          uint64_t v98 = v126;
          if (v127 != v126)
          {
            uint64_t v99 = v127 - 368;
            unint64_t v100 = (void *)(v127 - 368);
            do
            {
              v100[30] = &unk_26E5D3870;
              v100[16] = &unk_26E5D3870;
              v100[8] = &unk_26E5D3870;
              *unint64_t v100 = &unk_26E5D3870;
              long long v101 = v100 - 1;
              v100 -= 47;
              v99 -= 376;
            }
            while (v101 != (void *)v98);
          }
          uint64_t v63 = 0;
          uint64_t v62 = 0;
          uint64_t v127 = v98;
          uint64_t v118 = 0;
          unint64_t v119 = 0;
          unint64_t v120 = 0;
LABEL_107:
          unint64_t v64 = 126 - 2 * __clz(0x51B3BEA3677D46CFLL * ((v63 - v62) >> 3));
          if (v63 == v62) {
            uint64_t v65 = 0;
          }
          else {
            uint64_t v65 = v64;
          }
          std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(v62, v63, v65, 1);
          uint64_t v66 = v118;
          if (v118 != v119)
          {
            long long v67 = xmmword_230EF8E90;
            long long v68 = xmmword_230EF8EE0;
            do
            {
              uint64_t v115 = 0x300000003;
              uint64_t v113 = (double *)&unk_26E5D3970;
              long long v114 = v67;
              double v116 = v117;
              uint64_t v110 = 0x100000003;
              uint32_t v108 = (double **)&unk_26E5D3A90;
              long long v109 = xmmword_230EF8BF0;
              v111 = v112;
              uint64_t v141 = 0x10000000CLL;
              *(void *)buf = &unk_26E5D3B18;
              *(_OWORD *)&uint8_t buf[8] = v68;
              uint64_t v142 = v143;
              cnmatrix::Inv<double>(v66 + 248, (uint64_t)&v108, (uint64_t)buf, (uint64_t)&v113);
              double v69 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v113, 1, 1);
              uint64_t v110 = 0x300000003;
              uint32_t v108 = (double **)&unk_26E5D3970;
              long long v109 = xmmword_230EF8E90;
              v111 = v112;
              uint64_t v123 = 0x100000003;
              long long v122 = xmmword_230EF8BF0;
              unint64_t v121 = &unk_26E5D3A90;
              v124 = v125;
              uint64_t v141 = 0x10000000CLL;
              *(_OWORD *)&uint8_t buf[8] = xmmword_230EF8EE0;
              *(void *)buf = &unk_26E5D3B18;
              uint64_t v142 = v143;
              cnmatrix::Inv<double>(v66 + 136, (uint64_t)&v121, (uint64_t)buf, (uint64_t)&v108);
              int v70 = v109;
              if (v109 != DWORD1(v109)) {
                __assert_rtn("Trace", "cnmatrixbase.h", 4977, "A.NumRows() == A.NumCols()");
              }
              if ((int)v109 < 1)
              {
                double v72 = 0.0;
              }
              else
              {
                int v71 = 0;
                double v72 = 0.0;
                do
                {
                  double v72 = v72 + cnmatrix::CNMatrixBase<double>::operator()<int,int>((uint64_t)&v108, v71, v71);
                  ++v71;
                }
                while (v70 != v71);
              }
              if (sqrt(v69) * 180.0 / 3.14159265 <= *((double *)v103 + 122) || v72 <= *((double *)v103 + 121))
              {
                v66 += 376;
                unint64_t v73 = v119;
                long long v68 = xmmword_230EF8EE0;
                long long v67 = xmmword_230EF8E90;
              }
              else
              {
                std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *>((uint64_t)buf, v66 + 376, v119, v66);
                long long v68 = xmmword_230EF8EE0;
                long long v67 = xmmword_230EF8E90;
                if (v119 != v73)
                {
                  unint64_t v74 = v119 - 368;
                  long long v75 = (void *)(v119 - 368);
                  do
                  {
                    v75[30] = &unk_26E5D3870;
                    v75[16] = &unk_26E5D3870;
                    v75[8] = &unk_26E5D3870;
                    *long long v75 = &unk_26E5D3870;
                    uint64_t v76 = v75 - 1;
                    v75 -= 47;
                    v74 -= 376;
                  }
                  while (v76 != (void *)v73);
                }
                unint64_t v119 = v73;
              }
            }
            while (v66 != v73);
            double v22 = v103;
            if (v118 != v73)
            {
              uint64_t v105 = 0;
              unint64_t v106 = 0;
              unint64_t v107 = 0;
              unint64_t v77 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v105, v118);
              uint64_t v78 = v118;
              double v79 = *(double *)(v118 + 360);
              unint64_t v106 = v77;
              if ((unint64_t)(0x51B3BEA3677D46CFLL * ((uint64_t)(v119 - v118) >> 3)) >= 2)
              {
                unint64_t v80 = 1;
                do
                {
                  uint64_t v81 = v105;
                  if (v77 == v105) {
                    goto LABEL_137;
                  }
                  unint64_t v82 = 0;
                  BOOL v83 = 1;
                  do
                  {
                    uint64_t v84 = v81 + 376 * v82 + 8;
                    while (!v83)
                    {
                      BOOL v83 = 0;
                      ++v82;
                      v84 += 376;
                      if (0x51B3BEA3677D46CFLL * ((uint64_t)(v77 - v81) >> 3) <= v82) {
                        goto LABEL_141;
                      }
                    }
                    uint64_t v123 = 0x100000003;
                    long long v122 = xmmword_230EF8BF0;
                    unint64_t v121 = &unk_26E5D3818;
                    v124 = v125;
                    cnmatrix::Subtract<double>(v118 + 376 * v80 + 8, v84, (uint64_t)&v121);
                    uint64_t v115 = 0x100000003;
                    long long v114 = xmmword_230EF8BF0;
                    uint64_t v113 = (double *)&unk_26E5D3818;
                    double v116 = v117;
                    uint64_t v141 = 0x100000134;
                    *(_OWORD *)&uint8_t buf[8] = xmmword_230EF8C20;
                    *(void *)buf = &unk_26E5D38E8;
                    uint64_t v142 = v143;
                    uint64_t v110 = 0x100000003;
                    uint32_t v108 = (double **)&unk_26E5D3818;
                    long long v109 = xmmword_230EF8BF0;
                    v111 = v112;
                    cnmatrix::Norm<double>((uint64_t)&v121, (uint64_t)&v113, (uint64_t)buf, (uint64_t)&v108, "2");
                    BOOL v83 = v85 > 0.1;
                    uint64_t v81 = v105;
                    unint64_t v77 = v106;
                    ++v82;
                  }
                  while (0x51B3BEA3677D46CFLL * ((uint64_t)(v106 - v105) >> 3) > v82);
                  uint64_t v78 = v118;
                  if (v85 > 0.1)
                  {
LABEL_137:
                    uint64_t v86 = v78 + 376 * v80;
                    if (v77 >= v107)
                    {
                      unint64_t v77 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v105, v86);
                    }
                    else
                    {
                      std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>((uint64_t)&v107, v77, v86);
                      v77 += 376;
                    }
                    unint64_t v106 = v77;
LABEL_141:
                    uint64_t v78 = v118;
                  }
                  ++v80;
                }
                while (0x51B3BEA3677D46CFLL * ((uint64_t)(v119 - v78) >> 3) > v80);
              }
              std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__base_destruct_at_end[abi:ne180100]((uint64_t)v102, *v102);
              unint64_t v87 = v106;
              if (v105 == v106)
              {
                uint64_t v93 = *((void *)v103 + 19);
                double v88 = 0.0;
              }
              else
              {
                double v88 = 0.0;
                uint64_t v89 = (uint64_t)v103 + 168;
                uint64_t v90 = v105 + 248;
                do
                {
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v121, v90 - 240);
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v104, v90 - 176);
                  uint64_t v115 = 0x300000003;
                  long long v114 = xmmword_230EF8E90;
                  uint64_t v113 = (double *)&unk_26E5D3970;
                  double v116 = v117;
                  uint64_t v110 = 0x100000003;
                  uint32_t v108 = (double **)&unk_26E5D3A90;
                  long long v109 = xmmword_230EF8BF0;
                  v111 = v112;
                  uint64_t v141 = 0x10000000CLL;
                  *(_OWORD *)&uint8_t buf[8] = xmmword_230EF8EE0;
                  *(void *)buf = &unk_26E5D3B18;
                  uint64_t v142 = v143;
                  cnmatrix::Inv<double>(v90 - 112, (uint64_t)&v108, (uint64_t)buf, (uint64_t)&v113);
                  uint64_t v110 = 0x300000003;
                  uint32_t v108 = (double **)&unk_26E5D3970;
                  long long v109 = xmmword_230EF8E90;
                  v111 = v112;
                  uint64_t v137 = 0x100000003;
                  long long v136 = xmmword_230EF8BF0;
                  long long v135 = &unk_26E5D3A90;
                  unint64_t v138 = &v139;
                  uint64_t v141 = 0x10000000CLL;
                  *(_OWORD *)&uint8_t buf[8] = xmmword_230EF8EE0;
                  *(void *)buf = &unk_26E5D3B18;
                  uint64_t v142 = v143;
                  cnmatrix::Inv<double>(v90, (uint64_t)&v135, (uint64_t)buf, (uint64_t)&v108);
                  double v91 = exp(v79 - *(double *)(v90 + 112));
                  *(double *)buf = v91;
                  LODWORD(v135) = *(_DWORD *)(v90 + 120);
                  unint64_t v92 = *((void *)v103 + 19);
                  if (v92 >= *((void *)v103 + 20))
                  {
                    uint64_t v93 = std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__emplace_back_slow_path<cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,double &,RoseSyntheticApertureFiltering::BatchSolutionType const&,cnmatrix::CNMatrix<3u,1u,double>&>(v102, (uint64_t)&v121, (uint64_t)v104, (uint64_t)&v113, (uint64_t)&v108, (double *)buf, (int *)&v135, v89);
                  }
                  else
                  {
                    std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__construct_one_at_end[abi:ne180100]<cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,double &,RoseSyntheticApertureFiltering::BatchSolutionType const&,cnmatrix::CNMatrix<3u,1u,double>&>((uint64_t)v102, (uint64_t)&v121, (uint64_t)v104, (uint64_t)&v113, (uint64_t)&v108, (double *)buf, (int *)&v135, v89);
                    uint64_t v93 = v92 + 432;
                  }
                  *((void *)v103 + 19) = v93;
                  double v88 = v88 + v91;
                  uint64_t v94 = v90 + 128;
                  v90 += 376;
                }
                while (v94 != v87);
              }
              for (uint64_t k = *v102; k != v93; k += 432)
                *(double *)(k + 352) = *(double *)(k + 352) / v88;
              *(void *)buf = &v105;
              std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
              double v22 = v103;
            }
          }
          *(void *)buf = &v118;
          std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          *(void *)buf = &v126;
          std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          goto LABEL_157;
        }
      }
    }
LABEL_84:
    uint64_t v118 = 0;
    unint64_t v119 = 0;
    unint64_t v120 = 0;
    if (v40 == v31)
    {
      uint64_t v63 = 0;
      uint64_t v62 = 0;
      goto LABEL_107;
    }
    while (1)
    {
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoVBatch(v40 + 8, (uint64_t)v103 + 696, (uint64_t *)&v113);
      if (v113 == (double *)v114)
      {
        unint64_t v59 = v119;
        if (v119 >= v120)
        {
          uint64_t v61 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v118, v40);
          goto LABEL_104;
        }
      }
      else
      {
        RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::initializeFilterWithGuess((uint64_t)v103, v40 + 8, (uint64_t)v15, &v113, (uint64_t)buf);
        uint64_t v57 = v113;
        uint64_t v56 = (double *)v114;
        BOOL v58 = 1;
        while (v57 != v56)
        {
          BOOL v58 = v58
             && RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoV((uint64_t)&buf[8], (uint64_t)v57);
          v57 += 26;
        }
        unint64_t v59 = v119;
        if (v58 && buf[0])
        {
          if (v119 >= v120)
          {
            unint64_t v60 = buf;
LABEL_103:
            uint64_t v61 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v118, (uint64_t)v60);
            goto LABEL_104;
          }
          std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>((uint64_t)&v120, v119, (uint64_t)buf);
          goto LABEL_100;
        }
        unint64_t v60 = (unsigned char *)v40;
        if (v119 >= v120) {
          goto LABEL_103;
        }
      }
      std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>((uint64_t)&v120, v119, v40);
LABEL_100:
      uint64_t v61 = v59 + 376;
LABEL_104:
      unint64_t v119 = v61;
      *(void *)buf = &v113;
      std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      v40 += 376;
      if (v40 == v31)
      {
        uint64_t v62 = (char *)v118;
        uint64_t v63 = (char *)v119;
        goto LABEL_107;
      }
    }
  }
  return 0;
}

void sub_230ED6538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  a67 = (void **)&STACK[0x210];
  std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100](&a67);
  a67 = (void **)&STACK[0x228];
  std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100](&a67);
  a67 = (void **)&STACK[0x240];
  std::vector<cnmatrix::CNMatrix<3u,1u,double>>::__destroy_vector::operator()[abi:ne180100](&a67);
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xF0F0F0F0F0F0F0F1 * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x1E1E1E1E1E1E1E2) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 136 * v6;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_230ED67BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatchAlt(uint64_t a1, uint64_t a2, uint64_t a3, double **a4, double **a5, uint64_t *a6, uint64_t *a7)
{
  uint64_t v11 = *a6;
  uint64_t v12 = a6[1];
  if (*a6 != v12)
  {
    uint64_t v13 = v12 - 128;
    do
    {
      *(void *)(v12 - 64) = &unk_26E5D3870;
      *(void *)(v12 - 128) = &unk_26E5D3870;
      v13 -= 136;
      v12 -= 136;
    }
    while (v12 != v11);
    a6[1] = v11;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve(a6, 0x6DB6DB6DB6DB6DB7 * (((char *)a4[1] - (char *)*a4) >> 4));
  }
  uint64_t v14 = *a7;
  uint64_t v15 = a7[1];
  if (*a7 != v15)
  {
    uint64_t v16 = v15 - 176;
    do
    {
      *(void *)(v15 - 88) = &unk_26E5D3870;
      *(void *)(v15 - 176) = &unk_26E5D3870;
      v16 -= 192;
      v15 -= 192;
    }
    while (v15 != v14);
    a7[1] = v14;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::reserve(a7, 0x4EC4EC4EC4EC4EC5 * (((char *)a5[1] - (char *)*a5) >> 4));
  }
  double v41 = a5;
  uint64_t v73 = 0x100000003;
  int v71 = &unk_26E5D3818;
  long long v72 = xmmword_230EF8BF0;
  unint64_t v74 = &v75;
  uint64_t v68 = 0x300000003;
  long long v67 = xmmword_230EF8E90;
  uint64_t v66 = &unk_26E5D3970;
  double v69 = &v70;
  uint64_t result = (uint64_t)RoseSyntheticApertureFiltering::rhoThPhi2pos(a2, (uint64_t)&v71, (uint64_t)&v66);
  uint64_t v18 = *a4;
  uint64_t v19 = a4[1];
  if (*a4 != v19)
  {
    do
    {
      uint64_t v62 = 0x100000001;
      unint64_t v60 = &unk_26E5D3B60;
      *(void *)&long long v20 = 0x100000001;
      *((void *)&v20 + 1) = 0x100000001;
      long long v61 = v20;
      uint64_t v63 = v64;
      uint64_t v57 = 0x300000001;
      uint64_t v55 = &unk_26E5D39B8;
      long long v56 = xmmword_230EF8F20;
      BOOL v58 = v59;
      uint64_t v51 = 0x100000003;
      long long v49 = &unk_26E5D3818;
      long long v50 = xmmword_230EF8BF0;
      uint64_t v52 = v53;
      cnmatrix::Subtract<double>((uint64_t)(v18 + 5), a3, (uint64_t)&v49);
      RoseSyntheticApertureFiltering::measModelRangeAlt(a2, (uint64_t)&v66, (uint64_t)&v71, (uint64_t)&v49, (uint64_t)&v60, (uint64_t)&v55);
      double v22 = v18[3];
      double v21 = v18[4];
      double v65 = 0.0;
      double v23 = v18[2];
      unint64_t v24 = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v60, 0);
      double v25 = 1.0 / (v22 * v21);
      double v65 = v23 - v25 * *v24;
      uint64_t v51 = 0x300000001;
      long long v49 = &unk_26E5D39B8;
      long long v50 = xmmword_230EF8F20;
      uint64_t v52 = v53;
      cnmatrix::Multiply<double>((uint64_t)&v55, (uint64_t)&v49, v25);
      unsigned int v26 = 0;
      uint64_t v46 = 0x100000003;
      double v44 = &unk_26E5D3818;
      long long v45 = xmmword_230EF8BF0;
      unint64_t v47 = v48;
      do
      {
        double v27 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v49, v26);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v44, v26++) = v27;
      }
      while (v26 != 3);
      unint64_t v28 = a6[1];
      if (v28 >= a6[2])
      {
        uint64_t result = std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__emplace_back_slow_path<double const&,cnmatrix::CNMatrix<1u,3u,double> const&,cnmatrix::CNMatrix<3u,1u,double> &>(a6, &v65, (uint64_t)&v49, (uint64_t)&v44);
      }
      else
      {
        RoseSyntheticApertureFiltering::InternalExpectedRangeMeas::InternalExpectedRangeMeas((double *)a6[1], (uint64_t)&v49, (uint64_t)&v44, v65);
        uint64_t result = v28 + 136;
        a6[1] = v28 + 136;
      }
      a6[1] = result;
      v18 += 14;
    }
    while (v18 != v19);
  }
  double v29 = *v41;
  uint64_t v30 = v41[1];
  if (*v41 != v30)
  {
    do
    {
      uint64_t v62 = 0x100000002;
      unint64_t v60 = &unk_26E5D3BA8;
      long long v61 = xmmword_230EF8EF0;
      uint64_t v63 = v64;
      uint64_t v57 = 0x300000002;
      uint64_t v55 = &unk_26E5D3A00;
      long long v56 = xmmword_230EF8F30;
      BOOL v58 = v59;
      uint64_t v51 = 0x100000003;
      long long v49 = &unk_26E5D3818;
      long long v50 = xmmword_230EF8BF0;
      uint64_t v52 = v53;
      cnmatrix::Subtract<double>((uint64_t)(v29 + 4), a3, (uint64_t)&v49);
      RoseSyntheticApertureFiltering::measModelAoAAlt(a2, (uint64_t)&v66, (uint64_t)&v71, (uint64_t)&v49, (uint64_t)(v29 + 12), (uint64_t)&v60, (uint64_t)&v55);
      double v31 = v29[3];
      double v32 = v29[1];
      unint64_t v33 = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v60, 0);
      double v34 = 1.0 / v31;
      double v35 = fmod(v31 * v32 - *v33 + 3.14159265, 6.28318531);
      if (v35 < 0.0) {
        double v35 = v35 + 6.28318531;
      }
      double v65 = v34 * (v35 + -3.14159265);
      double v54 = 0.0;
      double v36 = v29[2];
      double v54 = v36 - v34 * *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v60, 1u);
      uint64_t v51 = 0x300000002;
      long long v49 = &unk_26E5D3A00;
      long long v50 = xmmword_230EF8F30;
      uint64_t v52 = v53;
      cnmatrix::Multiply<double>((uint64_t)&v55, (uint64_t)&v49, v34);
      int v37 = 0;
      uint64_t v46 = 0x200000003;
      double v44 = &unk_26E5D3A48;
      long long v45 = xmmword_230EF8F40;
      unint64_t v47 = v48;
      do
      {
        double v38 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v49, 0, v37);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v44, v37, 0) = v38;
        double v39 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v49, 1, v37);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v44, v37++, 1) = v39;
      }
      while (v37 != 3);
      unint64_t v40 = a7[1];
      if (v40 >= a7[2])
      {
        uint64_t result = std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__emplace_back_slow_path<double const&,double const&,cnmatrix::CNMatrix<2u,3u,double> const&,cnmatrix::CNMatrix<3u,2u,double> &>(a7, &v65, &v54, (uint64_t)&v49, (uint64_t)&v44);
      }
      else
      {
        RoseSyntheticApertureFiltering::InternalExpectedAoAMeas::InternalExpectedAoAMeas((double *)a7[1], (uint64_t)&v49, (uint64_t)&v44, v65, v54);
        uint64_t result = v40 + 192;
        a7[1] = v40 + 192;
      }
      a7[1] = result;
      v29 += 26;
    }
    while (v29 != v30);
  }
  return result;
}

void sub_230ED6F14(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_230ED6F20(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v9 = (uint64_t)(v7 - *a1) >> 6;
    if ((unint64_t)(v9 + 1) >> 58) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - *a1;
    uint64_t v11 = v10 >> 5;
    if (v10 >> 5 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v18 = v4;
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<3u,1u,double>>>(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = v13;
    uint64_t v15 = &v13[64 * v9];
    uint64_t v17 = &v13[64 * v12];
    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v15, a2);
    uint64_t v16 = v15 + 64;
    std::vector<cnmatrix::CNMatrix<3u,1u,double>>::__swap_out_circular_buffer(a1, &v14);
    uint64_t v8 = a1[1];
    std::__split_buffer<cnmatrix::CNMatrix<3u,1u,double>>::~__split_buffer((uint64_t)&v14);
  }
  else
  {
    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(*(void *)(v4 - 8), a2);
    uint64_t v8 = v7 + 64;
    a1[1] = v7 + 64;
  }
  a1[1] = v8;
}

void sub_230ED7048(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::initializeFilterWithGuess(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, double **a4@<X3>, uint64_t a5@<X8>)
{
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v83, a2);
  uint64_t v80 = 0x100000003;
  long long v79 = xmmword_230EF8BF0;
  uint64_t v78 = &unk_26E5D3818;
  uint64_t v81 = &v82;
  double GNStep = RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::generateGNStep(a1, (uint64_t)v83, a3, a4, (uint64_t)&v78);
  uint64_t v75 = 0x100000003;
  long long v74 = xmmword_230EF8BF0;
  uint64_t v73 = &unk_26E5D3818;
  uint64_t v76 = &v77;
  if (*(int *)(a1 + 944) < 1)
  {
    char v17 = 0;
    int v9 = 1;
  }
  else
  {
    int v9 = 1;
LABEL_3:
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v73, (uint64_t)&v78);
    int v10 = 0;
    while (v10 < *(_DWORD *)(a1 + 948))
    {
      uint64_t v86 = 0x100000003;
      long long v85 = xmmword_230EF8BF0;
      uint64_t v84 = (double **)&unk_26E5D3818;
      unint64_t v87 = v88;
      cnmatrix::Add<double>((uint64_t)v83, (uint64_t)&v73, (uint64_t)&v84);
      double v11 = RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::generateGNStep(a1, (uint64_t)&v84, a3, a4, (uint64_t)&v78);
      if (v11 < GNStep)
      {
        uint64_t v86 = 0x100000003;
        long long v85 = xmmword_230EF8BF0;
        uint64_t v84 = (double **)&unk_26E5D3818;
        unint64_t v87 = v88;
        cnmatrix::Add<double>((uint64_t)v83, (uint64_t)&v73, (uint64_t)&v84);
        cnmatrix::CNMatrixBase<double>::operator=((uint64_t)v83, (uint64_t)&v84);
        uint64_t v64 = 0x100000003;
        long long v63 = xmmword_230EF8BF0;
        uint64_t v62 = &unk_26E5D3818;
        double v65 = v66;
        uint64_t v86 = 0x100000134;
        long long v85 = xmmword_230EF8C20;
        uint64_t v84 = (double **)&unk_26E5D38E8;
        unint64_t v87 = v88;
        uint64_t v59 = 0x100000003;
        long long v58 = xmmword_230EF8BF0;
        uint64_t v57 = (void **)&unk_26E5D3818;
        unint64_t v60 = v61;
        cnmatrix::Norm<double>((uint64_t)&v73, (uint64_t)&v62, (uint64_t)&v84, (uint64_t)&v57, "2");
        BOOL v14 = v15 < *(double *)(a1 + 952) || (GNStep - v11) / GNStep < *(double *)(a1 + 960);
        ++v9;
        double GNStep = v11;
LABEL_15:
        if (v9 > *(_DWORD *)(a1 + 944) || v14)
        {
          char v17 = 0;
          goto LABEL_22;
        }
        goto LABEL_3;
      }
      unsigned int v12 = 0;
      ++v10;
      do
      {
        double v13 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v73, v12);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v73, v12++) = v13 * 0.5;
      }
      while (v12 != 3);
      if (v11 < GNStep)
      {
        BOOL v14 = 0;
        goto LABEL_15;
      }
    }
    char v17 = 1;
  }
LABEL_22:
  int v71 = 0;
  uint64_t v70 = 0;
  uint64_t v72 = 0;
  uint64_t v68 = 0;
  long long v67 = 0;
  uint64_t v69 = 0;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve((uint64_t *)&v70, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 4));
  uint64_t v18 = std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::reserve((uint64_t *)&v67, 0x4EC4EC4EC4EC4EC5 * (((char *)a4[1] - (char *)*a4) >> 4));
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatch(v18, (uint64_t)v83, (double **)a3, a4, (uint64_t *)&v70, (uint64_t *)&v67);
  char v38 = v17;
  uint64_t v86 = 0x300000003;
  long long v85 = xmmword_230EF8E90;
  uint64_t v84 = (double **)&unk_26E5D3970;
  unint64_t v87 = v88;
  cnmatrix::FastResize<double>(&v84, 3, 3);
  double v19 = 0.0;
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v84, 0.0);
  long long v20 = v70;
  for (uint64_t i = v71; v20 != i; v20 = (double *)(v23 + 128))
  {
    uint64_t v22 = (uint64_t)(v20 + 9);
    double v24 = *v20;
    uint64_t v23 = (uint64_t)(v20 + 1);
    uint64_t v59 = 0x300000003;
    uint64_t v57 = (void **)&unk_26E5D3970;
    long long v58 = xmmword_230EF8E90;
    unint64_t v60 = v61;
    cnmatrix::Multiply<double>(v22, v23, (uint64_t)&v57);
    uint64_t v64 = 0x300000003;
    long long v63 = xmmword_230EF8E90;
    uint64_t v62 = &unk_26E5D3970;
    double v65 = v66;
    cnmatrix::Add<double>((uint64_t)&v84, (uint64_t)&v57, (uint64_t)&v62);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v84, (uint64_t)&v62);
    double v19 = v19 + v24 * v24;
  }
  double v25 = v67;
  unsigned int v26 = v68;
  if (v67 != v68)
  {
    do
    {
      double v27 = *v25;
      double v28 = v25[1];
      uint64_t v59 = 0x300000003;
      uint64_t v57 = (void **)&unk_26E5D3970;
      long long v58 = xmmword_230EF8E90;
      double v29 = v25 + 2;
      unint64_t v60 = v61;
      cnmatrix::Multiply<double>((uint64_t)(v25 + 13), (uint64_t)(v25 + 2), (uint64_t)&v57);
      uint64_t v64 = 0x300000003;
      long long v63 = xmmword_230EF8E90;
      uint64_t v62 = &unk_26E5D3970;
      double v65 = v66;
      cnmatrix::Add<double>((uint64_t)&v84, (uint64_t)&v57, (uint64_t)&v62);
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v84, (uint64_t)&v62);
      double v19 = v19 + v28 * v28 + v27 * v27;
      double v25 = v29 + 22;
    }
    while (v29 + 22 != v26);
  }
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)&v62, (uint64_t)&v84);
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve(&v54, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 4));
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::reserve(&v51, 0x4EC4EC4EC4EC4EC5 * (((char *)a4[1] - (char *)*a4) >> 4));
  uint64_t v59 = 0x100000003;
  long long v58 = xmmword_230EF8BF0;
  uint64_t v57 = (void **)&unk_26E5D3818;
  unint64_t v60 = v61;
  cnmatrix::Subtract<double>((uint64_t)v83, a1 + 168, (uint64_t)&v57);
  RoseSyntheticApertureFiltering::pos2rangeThPhi((uint64_t)&v57, (uint64_t)v50);
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatchAlt(v30, (uint64_t)v50, a1 + 168, (double **)a3, a4, &v54, &v51);
  uint64_t v59 = 0x300000003;
  long long v58 = xmmword_230EF8E90;
  uint64_t v57 = (void **)&unk_26E5D3970;
  unint64_t v60 = v61;
  cnmatrix::FastResize<double>(&v57, 3, 3);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v57, 0.0);
  uint64_t v31 = v54;
  for (uint64_t j = v55; v31 != j; v31 += 136)
  {
    uint64_t v42 = 0x300000003;
    unint64_t v40 = &unk_26E5D3970;
    long long v41 = xmmword_230EF8E90;
    uint64_t v43 = v44;
    cnmatrix::Multiply<double>(v31 + 72, v31 + 8, (uint64_t)&v40);
    uint64_t v47 = 0x300000003;
    long long v45 = &unk_26E5D3970;
    long long v46 = xmmword_230EF8E90;
    uint64_t v48 = v49;
    cnmatrix::Add<double>((uint64_t)&v57, (uint64_t)&v40, (uint64_t)&v45);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v57, (uint64_t)&v45);
  }
  uint64_t v33 = v51;
  for (uint64_t k = v52; v33 != k; v33 += 192)
  {
    uint64_t v42 = 0x300000003;
    unint64_t v40 = &unk_26E5D3970;
    long long v41 = xmmword_230EF8E90;
    uint64_t v43 = v44;
    cnmatrix::Multiply<double>(v33 + 104, v33 + 16, (uint64_t)&v40);
    uint64_t v47 = 0x300000003;
    long long v45 = &unk_26E5D3970;
    long long v46 = xmmword_230EF8E90;
    uint64_t v48 = v49;
    cnmatrix::Add<double>((uint64_t)&v57, (uint64_t)&v40, (uint64_t)&v45);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v57, (uint64_t)&v45);
  }
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)&v45, (uint64_t)&v57);
  BOOL v35 = (v38 & 1) != 0 || v9 <= *(_DWORD *)(a1 + 944);
  double v36 = *a4;
  int v37 = a4[1];
  *(unsigned char *)a5 = v35;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a5 + 8, (uint64_t)v83);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a5 + 72, (uint64_t)v50);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a5 + 136, (uint64_t)&v62);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a5 + 248, (uint64_t)&v45);
  *(double *)(a5 + 360) = v19;
  *(_DWORD *)(a5 + 368) = v36 == v37;
  uint64_t v57 = (void **)&v51;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100](&v57);
  uint64_t v57 = (void **)&v54;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100](&v57);
  uint64_t v84 = &v67;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v84);
  uint64_t v84 = &v70;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v84);
}

void sub_230ED7998(_Unwind_Exception *a1)
{
}

uint64_t std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *>((uint64_t)&v7, a3, *(void *)(a1 + 8), a2);
    std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__base_destruct_at_end[abi:ne180100](a1, v5);
  }
  return a2;
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoVBatch(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v3 = *(_OWORD **)a2;
  uint64_t v4 = *(_OWORD **)(a2 + 8);
  if (*(_OWORD **)a2 != v4)
  {
    uint64_t v7 = (uint64_t)(a3 + 2);
    do
    {
      if (RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoV(a1, (uint64_t)v3))
      {
        unint64_t v8 = a3[1];
        if (v8 >= a3[2])
        {
          uint64_t v9 = std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__push_back_slow_path<RoseSyntheticApertureFiltering::InternalAoAMeas const&>(a3, v3);
        }
        else
        {
          std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas,RoseSyntheticApertureFiltering::InternalAoAMeas const&>(v7, (_OWORD *)a3[1], v3);
          uint64_t v9 = v8 + 208;
          a3[1] = v8 + 208;
        }
        a3[1] = v9;
      }
      v3 += 13;
    }
    while (v3 != v4);
  }
}

void sub_230ED7BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  *(void *)(v10 + 8) = v11;
  a10 = (void **)v10;
  std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

BOOL RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoV(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = 0x100000003;
  uint64_t v11 = &unk_26E5D3818;
  long long v12 = xmmword_230EF8BF0;
  BOOL v14 = &v15;
  cnmatrix::Subtract<double>(a1, a2 + 32, (uint64_t)&v11);
  uint64_t v8 = 0x100000003;
  unint64_t v6 = &unk_26E5D3818;
  long long v7 = xmmword_230EF8BF0;
  uint64_t v9 = &v10;
  cnmatrix::Multiply<double>(a2 + 96, (uint64_t)&v11, (uint64_t)&v6);
  double v3 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v6, 2u);
  uint64_t v28 = 0x100000003;
  unsigned int v26 = &unk_26E5D3818;
  long long v27 = xmmword_230EF8BF0;
  double v29 = &v30;
  uint64_t v23 = 0x100000134;
  long long v22 = xmmword_230EF8C20;
  double v21 = &unk_26E5D38E8;
  double v24 = &v25;
  uint64_t v18 = 0x100000003;
  long long v17 = xmmword_230EF8BF0;
  uint64_t v16 = &unk_26E5D3818;
  double v19 = &v20;
  cnmatrix::Norm<double>((uint64_t)&v6, (uint64_t)&v26, (uint64_t)&v21, (uint64_t)&v16, "2");
  return acos(-v3 / v4) * 180.0 / 3.14159265 <= 60.0;
}

double RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::generateGNStep(uint64_t a1, uint64_t a2, uint64_t a3, double **a4, uint64_t a5)
{
  uint64_t v9 = (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 4;
  long long v46 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v43 = 0;
  double v44 = 0;
  uint64_t v45 = 0;
  uint64_t v10 = std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve((uint64_t *)&v46, 0x6DB6DB6DB6DB6DB7 * v9);
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatch(v10, a2, (double **)a3, a4, (uint64_t *)&v46, (uint64_t *)&v43);
  uint64_t v40 = 0x300000003;
  long long v39 = xmmword_230EF8E90;
  char v38 = &unk_26E5D3970;
  long long v41 = &v42;
  cnmatrix::FastResize<double>(&v38, 3, 3);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v38, 0.0);
  uint64_t v35 = 0x100000003;
  long long v34 = xmmword_230EF8BF0;
  uint64_t v33 = &unk_26E5D3818;
  double v36 = &v37;
  cnmatrix::FastResize<double>(&v33, 3, 1);
  double v11 = 0.0;
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v33, 0.0);
  uint64_t v13 = v46;
  for (uint64_t i = v47; v13 != i; v13 = (double *)(v15 + 64))
  {
    uint64_t v14 = (uint64_t)(v13 + 9);
    double v16 = *v13;
    uint64_t v15 = (uint64_t)(v13 + 1);
    uint64_t v30 = 0x300000003;
    uint64_t v28 = &unk_26E5D3970;
    long long v29 = xmmword_230EF8E90;
    uint64_t v31 = v32;
    cnmatrix::Multiply<double>(v14, v15, (uint64_t)&v28);
    uint64_t v51 = 0x300000003;
    long long v50 = xmmword_230EF8E90;
    long long v49 = (double **)&unk_26E5D3970;
    uint64_t v52 = v53;
    cnmatrix::Add<double>((uint64_t)&v38, (uint64_t)&v28, (uint64_t)&v49);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v38, (uint64_t)&v49);
    uint64_t v30 = 0x100000003;
    uint64_t v28 = &unk_26E5D3818;
    long long v29 = xmmword_230EF8BF0;
    uint64_t v31 = v32;
    v15 += 64;
    cnmatrix::Multiply<double>(v15, (uint64_t)&v28, v16);
    uint64_t v51 = 0x100000003;
    long long v50 = xmmword_230EF8BF0;
    long long v49 = (double **)&unk_26E5D3818;
    uint64_t v52 = v53;
    cnmatrix::Add<double>((uint64_t)&v33, (uint64_t)&v28, (uint64_t)&v49);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v33, (uint64_t)&v49);
    double v11 = v11 + v16 * v16;
  }
  long long v17 = v43;
  uint64_t v18 = v44;
  if (v43 != v44)
  {
    do
    {
      double v19 = *v17;
      double v20 = v17[1];
      uint64_t v30 = 0x300000003;
      uint64_t v28 = &unk_26E5D3970;
      long long v29 = xmmword_230EF8E90;
      uint64_t v21 = (uint64_t)(v17 + 2);
      uint64_t v31 = v32;
      cnmatrix::Multiply<double>((uint64_t)(v17 + 13), (uint64_t)(v17 + 2), (uint64_t)&v28);
      uint64_t v51 = 0x300000003;
      long long v50 = xmmword_230EF8E90;
      long long v49 = (double **)&unk_26E5D3970;
      uint64_t v52 = v53;
      cnmatrix::Add<double>((uint64_t)&v38, (uint64_t)&v28, (uint64_t)&v49);
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v38, (uint64_t)&v49);
      uint64_t v25 = 0x100000002;
      uint64_t v23 = &unk_26E5D3BA8;
      long long v24 = xmmword_230EF8EF0;
      unsigned int v26 = v27;
      *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v23, 0) = v19;
      *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v23, 1u) = v20;
      uint64_t v30 = 0x100000003;
      uint64_t v28 = &unk_26E5D3818;
      long long v29 = xmmword_230EF8BF0;
      uint64_t v31 = v32;
      v21 += 88;
      cnmatrix::Multiply<double>(v21, (uint64_t)&v23, (uint64_t)&v28);
      uint64_t v51 = 0x100000003;
      long long v50 = xmmword_230EF8BF0;
      long long v49 = (double **)&unk_26E5D3818;
      uint64_t v52 = v53;
      cnmatrix::Add<double>((uint64_t)&v33, (uint64_t)&v28, (uint64_t)&v49);
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v33, (uint64_t)&v49);
      double v11 = v11 + v20 * v20 + v19 * v19;
      long long v17 = (double *)(v21 + 88);
    }
    while ((double *)(v21 + 88) != v18);
  }
  uint64_t v30 = 0x300000003;
  uint64_t v28 = &unk_26E5D3970;
  long long v29 = xmmword_230EF8E90;
  uint64_t v31 = v32;
  uint64_t v56 = 0x100000003;
  uint64_t v54 = &unk_26E5D3A90;
  long long v55 = xmmword_230EF8BF0;
  uint64_t v57 = &v58;
  uint64_t v51 = 0x10000000CLL;
  long long v50 = xmmword_230EF8EE0;
  long long v49 = (double **)&unk_26E5D3B18;
  uint64_t v52 = v53;
  cnmatrix::Inv<double>((uint64_t)&v38, (uint64_t)&v54, (uint64_t)&v49, (uint64_t)&v28);
  uint64_t v25 = 0x100000003;
  uint64_t v23 = &unk_26E5D3818;
  long long v24 = xmmword_230EF8BF0;
  unsigned int v26 = v27;
  cnmatrix::Multiply<double>((uint64_t)&v28, (uint64_t)&v33, (uint64_t)&v23);
  cnmatrix::CNMatrixBase<double>::operator=(a5, (uint64_t)&v23);
  long long v49 = &v43;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);
  long long v49 = &v46;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);
  return v11;
}

void sub_230ED8364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  a68 = (void **)&a62;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100](&a68);
  a68 = (void **)&a65;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a68);
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 6) < a2)
  {
    if (a2 >= 0x155555555555556) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 192 * v6;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_230ED8478(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatch(uint64_t a1, uint64_t a2, double **a3, double **a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v10 = *a5;
  uint64_t v11 = a5[1];
  if (*a5 != v11)
  {
    uint64_t v12 = v11 - 128;
    do
    {
      *(void *)(v11 - 64) = &unk_26E5D3870;
      *(void *)(v11 - 128) = &unk_26E5D3870;
      v12 -= 136;
      v11 -= 136;
    }
    while (v11 != v10);
    a5[1] = v10;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve(a5, 0x6DB6DB6DB6DB6DB7 * (((char *)a3[1] - (char *)*a3) >> 4));
  }
  uint64_t v13 = *a6;
  uint64_t v14 = a6[1];
  if (*a6 != v14)
  {
    uint64_t v15 = v14 - 176;
    do
    {
      *(void *)(v14 - 88) = &unk_26E5D3870;
      *(void *)(v14 - 176) = &unk_26E5D3870;
      v15 -= 192;
      v14 -= 192;
    }
    while (v14 != v13);
    a6[1] = v13;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::reserve(a6, 0x4EC4EC4EC4EC4EC5 * (((char *)a4[1] - (char *)*a4) >> 4));
  }
  long long v41 = a4;
  double v16 = *a3;
  long long v17 = a3[1];
  if (*a3 != v17)
  {
    do
    {
      uint64_t v61 = 0x100000001;
      uint64_t v59 = &unk_26E5D3B60;
      *(void *)&long long v18 = 0x100000001;
      *((void *)&v18 + 1) = 0x100000001;
      long long v60 = v18;
      uint64_t v62 = v63;
      uint64_t v56 = 0x300000001;
      uint64_t v54 = &unk_26E5D39B8;
      long long v55 = xmmword_230EF8F20;
      uint64_t v57 = v58;
      RoseSyntheticApertureFiltering::measModelRange(a2, (uint64_t)(v16 + 5), (uint64_t)&v59, (uint64_t)&v54);
      double v20 = v16[3];
      double v19 = v16[4];
      v64[0] = 0.0;
      double v21 = v16[2];
      long long v22 = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v59, 0);
      double v23 = 1.0 / (v20 * v19);
      v64[0] = v21 - v23 * *v22;
      uint64_t v50 = 0x300000001;
      uint64_t v48 = &unk_26E5D39B8;
      long long v49 = xmmword_230EF8F20;
      uint64_t v51 = v52;
      cnmatrix::Multiply<double>((uint64_t)&v54, (uint64_t)&v48, v23);
      unsigned int v24 = 0;
      uint64_t v45 = 0x100000003;
      uint64_t v43 = &unk_26E5D3818;
      long long v44 = xmmword_230EF8BF0;
      long long v46 = v47;
      do
      {
        double v25 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v48, v24);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v43, v24++) = v25;
      }
      while (v24 != 3);
      unint64_t v26 = a5[1];
      if (v26 >= a5[2])
      {
        uint64_t v27 = std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__emplace_back_slow_path<double const&,cnmatrix::CNMatrix<1u,3u,double> const&,cnmatrix::CNMatrix<3u,1u,double> &>(a5, v64, (uint64_t)&v48, (uint64_t)&v43);
      }
      else
      {
        RoseSyntheticApertureFiltering::InternalExpectedRangeMeas::InternalExpectedRangeMeas((double *)a5[1], (uint64_t)&v48, (uint64_t)&v43, v64[0]);
        uint64_t v27 = v26 + 136;
        a5[1] = v26 + 136;
      }
      a5[1] = v27;
      v16 += 14;
    }
    while (v16 != v17);
  }
  uint64_t v28 = *v41;
  long long v29 = v41[1];
  if (*v41 != v29)
  {
    do
    {
      uint64_t v61 = 0x100000002;
      uint64_t v59 = &unk_26E5D3BA8;
      long long v60 = xmmword_230EF8EF0;
      uint64_t v62 = v63;
      uint64_t v56 = 0x300000002;
      uint64_t v54 = &unk_26E5D3A00;
      long long v55 = xmmword_230EF8F30;
      uint64_t v57 = v58;
      RoseSyntheticApertureFiltering::measModelAoA(a2, (uint64_t)(v28 + 4), (uint64_t)(v28 + 12), (uint64_t)&v59, (uint64_t)&v54);
      double v30 = v28[3];
      double v31 = v28[1];
      double v32 = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v59, 0);
      double v33 = 1.0 / v30;
      double v34 = fmod(v30 * v31 - *v32 + 3.14159265, 6.28318531);
      if (v34 < 0.0) {
        double v34 = v34 + 6.28318531;
      }
      v64[0] = v33 * (v34 + -3.14159265);
      double v53 = 0.0;
      double v35 = v28[2];
      double v53 = v35 - v33 * *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v59, 1u);
      uint64_t v50 = 0x300000002;
      uint64_t v48 = &unk_26E5D3A00;
      long long v49 = xmmword_230EF8F30;
      uint64_t v51 = v52;
      cnmatrix::Multiply<double>((uint64_t)&v54, (uint64_t)&v48, 1.0 / v30);
      int v36 = 0;
      uint64_t v45 = 0x200000003;
      uint64_t v43 = &unk_26E5D3A48;
      long long v44 = xmmword_230EF8F40;
      long long v46 = v47;
      do
      {
        double v37 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v48, 0, v36);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v43, v36, 0) = v37;
        double v38 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v48, 1, v36);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v43, v36++, 1) = v38;
      }
      while (v36 != 3);
      unint64_t v39 = a6[1];
      if (v39 >= a6[2])
      {
        uint64_t v40 = std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__emplace_back_slow_path<double const&,double const&,cnmatrix::CNMatrix<2u,3u,double> const&,cnmatrix::CNMatrix<3u,2u,double> &>(a6, v64, &v53, (uint64_t)&v48, (uint64_t)&v43);
      }
      else
      {
        RoseSyntheticApertureFiltering::InternalExpectedAoAMeas::InternalExpectedAoAMeas((double *)a6[1], (uint64_t)&v48, (uint64_t)&v43, v64[0], v53);
        uint64_t v40 = v39 + 192;
        a6[1] = v39 + 192;
      }
      a6[1] = v40;
      v28 += 26;
    }
    while (v28 != v29);
  }
}

void sub_230ED8AB0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_230ED8ABC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void *cnmatrix::CNMatrix<1u,3u,double>::~CNMatrix(void *result)
{
  *uint64_t result = &unk_26E5D3870;
  return result;
}

void *cnmatrix::CNMatrix<1u,1u,double>::~CNMatrix(void *result)
{
  *uint64_t result = &unk_26E5D3870;
  return result;
}

void *cnmatrix::CNMatrix<3u,2u,double>::~CNMatrix(void *result)
{
  *uint64_t result = &unk_26E5D3870;
  return result;
}

void *cnmatrix::CNMatrix<2u,3u,double>::~CNMatrix(void *result)
{
  *uint64_t result = &unk_26E5D3870;
  return result;
}

void *cnmatrix::CNMatrix<2u,1u,double>::~CNMatrix(void *result)
{
  *uint64_t result = &unk_26E5D3870;
  return result;
}

uint64_t std::vector<cnmatrix::CNMatrix<2u,1u,double>>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x492492492492493) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 56 * v6;
    std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<cnmatrix::CNMatrix<2u,1u,double>>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_230ED8C34(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<cnmatrix::CNMatrix<2u,1u,double>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *cnmatrix::CNMatrix<2u,2u,double>::~CNMatrix(void *result)
{
  *uint64_t result = &unk_26E5D3870;
  return result;
}

void *cnmatrix::CNMatrix<1u,2u,double>::~CNMatrix(void *result)
{
  *uint64_t result = &unk_26E5D3870;
  return result;
}

void cnmatrix::Eig<2u,2u,2u,2u,2u,2u,double>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = 0x200000002;
  double v30 = &unk_26E5D3C38;
  long long v31 = xmmword_230EF8F10;
  double v33 = &v34;
  uint64_t v27 = 0x200000002;
  double v25 = &unk_26E5D3C38;
  long long v26 = xmmword_230EF8F10;
  uint64_t v28 = &v29;
  uint64_t v22 = 0x200000002;
  double v20 = &unk_26E5D3C38;
  long long v21 = xmmword_230EF8F10;
  double v23 = &v24;
  uint64_t v17 = 0x100000002;
  uint64_t v15 = &unk_26E5D3BA8;
  long long v16 = xmmword_230EF8EF0;
  long long v18 = &v19;
  uint64_t v12 = 0x200000002;
  uint64_t v10 = &unk_26E5D3C38;
  long long v11 = xmmword_230EF8F10;
  uint64_t v13 = &v14;
  uint64_t v7 = 0x1000000A8;
  uint64_t v5 = &unk_26E5D3CC8;
  long long v6 = xmmword_230EF8F50;
  uint64_t v8 = &v9;
  cnmatrix::Eig<double>(a1, (uint64_t)&v30, a3, (uint64_t)&v25, a2, (uint64_t)&v20, (uint64_t)&v15, (uint64_t)&v10, (uint64_t)&v5);
  if (DWORD2(v26))
  {
    unsigned int v3 = 0;
    while (*(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v25, v3) == 0.0)
    {
      if (++v3 >= DWORD2(v26)) {
        goto LABEL_6;
      }
    }
    cnprint::CNPrinter::Print();
  }
LABEL_6:
  if (DWORD2(v21))
  {
    unsigned int v4 = 0;
    while (*(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v20, v4) == 0.0)
    {
      if (++v4 >= DWORD2(v21)) {
        return;
      }
    }
    cnprint::CNPrinter::Print();
  }
}

void std::vector<double>::reserve(void **a1, unint64_t a2)
{
  unsigned int v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    long long v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    uint64_t v10 = (char *)*a1;
    long long v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoVBatchMultiple(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v3 = *(_OWORD **)a2;
  unsigned int v4 = *(_OWORD **)(a2 + 8);
  if (*(_OWORD **)a2 != v4)
  {
    uint64_t v7 = (uint64_t)(a3 + 2);
    do
    {
      uint64_t v8 = *a1;
      uint64_t v9 = a1[1];
      if (*a1 == v9) {
        goto LABEL_11;
      }
      BOOL v10 = 1;
      do
      {
        while (!v10)
        {
          BOOL v10 = 0;
          v8 += 64;
          if (v8 == v9) {
            goto LABEL_15;
          }
        }
        BOOL v10 = RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoV(v8, (uint64_t)v3);
        v8 += 64;
      }
      while (v8 != v9);
      if (v10)
      {
LABEL_11:
        unint64_t v11 = a3[1];
        if (v11 >= a3[2])
        {
          uint64_t v12 = std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__push_back_slow_path<RoseSyntheticApertureFiltering::InternalAoAMeas const&>(a3, v3);
        }
        else
        {
          std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas,RoseSyntheticApertureFiltering::InternalAoAMeas const&>(v7, (_OWORD *)a3[1], v3);
          uint64_t v12 = v11 + 208;
          a3[1] = v11 + 208;
        }
        a3[1] = v12;
      }
LABEL_15:
      v3 += 13;
    }
    while (v3 != v4);
  }
}

void sub_230ED9070(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void *std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    long long v6 = result;
    uint64_t result = std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    uint64_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8 - 4);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_230ED90F8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x186186186186187) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::BatchSolutionParticle>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[168 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::BatchSolutionParticle>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x186186186186187) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(168 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

char *std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (0xCF3CF3CF3CF3CF3DLL * ((v8 - *(void *)result) >> 3) < a4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0x186186186186186) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xCF3CF3CF3CF3CF3DLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0xC30C30C30C30C3) {
      unint64_t v12 = 0x186186186186186;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t result = std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__vallocate[abi:ne180100](v7, v12);
    uint64_t v14 = (char *)v7[1];
    uint64_t v13 = (void **)(v7 + 1);
    uint64_t v9 = v14;
LABEL_16:
    uint64_t v17 = a3 - (void)__src;
    if (v17)
    {
      size_t v18 = v17 - 4;
      uint64_t v19 = v9;
      double v20 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v13 = (void **)(result + 8);
  uint64_t v15 = (unsigned char *)*((void *)result + 1);
  if (0xCF3CF3CF3CF3CF3DLL * ((v15 - v9) >> 3) >= a4) {
    goto LABEL_16;
  }
  long long v16 = &__src[8 * ((v15 - v9) >> 3)];
  if (v15 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v15 - v9 - 4);
    uint64_t v9 = (char *)*v13;
  }
  uint64_t v17 = a3 - (void)v16;
  if (v17)
  {
    size_t v18 = v17 - 4;
    uint64_t v19 = v9;
    double v20 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v19, v20, v18);
  }
LABEL_19:
  *uint64_t v13 = &v9[v17];
  return result;
}

BOOL std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(long long **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  long long v4 = **a1;
  long long v5 = (*a1)[1];
  uint64_t v11 = *((void *)*a1 + 4);
  long long v9 = v4;
  long long v10 = v5;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v12, (uint64_t)v2 + 40);
  v12[16] = *((_DWORD *)v2 + 26);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v8, v3 + 40);
  v8[16] = *(_DWORD *)(v3 + 104);
  double v6 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v12, 0);
  return v6 < cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v8, 0);
}

BOOL std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(long long **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  long long v4 = **a1;
  long long v5 = (*a1)[1];
  uint64_t v11 = *((void *)*a1 + 4);
  long long v9 = v4;
  long long v10 = v5;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v12, (uint64_t)v2 + 40);
  v12[16] = *((_DWORD *)v2 + 26);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v8, v3 + 40);
  v8[16] = *(_DWORD *)(v3 + 104);
  double v6 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v12, 1u);
  return v6 < cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v8, 1u);
}

BOOL std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(long long **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  long long v4 = **a1;
  long long v5 = (*a1)[1];
  uint64_t v11 = *((void *)*a1 + 4);
  long long v9 = v4;
  long long v10 = v5;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v12, (uint64_t)v2 + 40);
  v12[16] = *((_DWORD *)v2 + 26);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v8, v3 + 40);
  v8[16] = *(_DWORD *)(v3 + 104);
  double v6 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v12, 2u);
  return v6 < cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v8, 2u);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

double *std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<double *>,std::__wrap_iter<double *>,std::__identity,std::__less<void,void>>(double *result, double *a2)
{
  uint64_t v2 = result;
  if (result != a2 && result + 1 != a2)
  {
    double v5 = *result;
    double v4 = result[1];
    if (v4 < *result) {
      ++result;
    }
    double v6 = v4 >= *v2 ? v2 + 1 : v2;
    uint64_t v7 = v2 + 2;
    if (v7 != a2)
    {
      if (v4 >= v5) {
        double v4 = v5;
      }
      while (v7 + 1 != a2)
      {
        double v9 = *v7;
        double v8 = v7[1];
        if (v8 >= *v7)
        {
          if (v9 < v4)
          {
            double v4 = *v7;
            uint64_t result = v7;
          }
          if (v8 >= *v6) {
            double v6 = v7 + 1;
          }
        }
        else
        {
          double v4 = *result;
          if (v8 < *result)
          {
            double v4 = v7[1];
            uint64_t result = v7 + 1;
          }
          if (v9 >= *v6) {
            double v6 = v7;
          }
        }
        v7 += 2;
        if (v7 == a2) {
          return result;
        }
      }
      if (*v7 < *result) {
        return v7;
      }
    }
  }
  return result;
}

void cnmatrix::CNMatrix<3u,3u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<3u,3u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<3u,3u,double>::TransposeDataFootprint(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

uint64_t cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(uint64_t result, unsigned int a2, unsigned int a3)
{
  *(void *)(result + 24) = 0x300000003;
  *(void *)(result + 32) = 0;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(void *)uint64_t result = &unk_26E5D3970;
  if (a2 > 3)
  {
    uint64_t v3 = "this->max_num_rows_ >= num_rows";
    int v4 = 422;
    goto LABEL_6;
  }
  if (a3 >= 4)
  {
    uint64_t v3 = "this->max_num_cols_ >= num_cols";
    int v4 = 423;
LABEL_6:
    __assert_rtn("SetMatrixSize", "cnmatrixbase.h", v4, v3);
  }
  *(_DWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 12) = a3;
  *(_DWORD *)(result + 16) = a3 * a2;
  *(_DWORD *)(result + 20) = a2;
  *(void *)(result + 32) = result + 40;
  return result;
}

void sub_230ED97CC(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

__n128 cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  result.n128_u64[0] = 0x100000003;
  *(void *)(a1 + 24) = 0x100000003;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26E5D3818;
  if (a1 == a2)
  {
    long long v16 = "this != &(A)";
    int v17 = 603;
LABEL_21:
    size_t v18 = "cnmatrix.h";
    uint64_t v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  unsigned int v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 3)
  {
    long long v16 = "this->max_num_rows_ >= num_rows";
    int v17 = 422;
LABEL_18:
    size_t v18 = "cnmatrixbase.h";
    uint64_t v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  unsigned int v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 2)
  {
    long long v16 = "this->max_num_cols_ >= num_cols";
    int v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  uint64_t v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  double v6 = (_OWORD *)(a1 + 40);
  *(void *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 3u)
  {
    long long v16 = "this->max_num_rows_ >= A.num_rows_";
    int v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 1u)
  {
    long long v16 = "this->max_num_cols_ >= A.num_cols_";
    int v17 = 617;
    goto LABEL_21;
  }
  int v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    uint64_t v10 = (v7 - 2);
    uint64_t v11 = *(long long **)(a2 + 32);
    unint64_t v12 = (__n128 *)((char *)v6 + 8 * v10);
    uint64_t v13 = (v7 - 1) >> 1;
    uint64_t v14 = v11;
    do
    {
      long long v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    __n128 result = *(__n128 *)((char *)v11 + 8 * v10);
    *unint64_t v12 = result;
  }
  else if (v5)
  {
    double v8 = *(unint64_t **)(a2 + 32);
    do
    {
      unint64_t v9 = *v8++;
      result.n128_u64[0] = v9;
      *(void *)double v6 = v9;
      double v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_230ED995C(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

__n128 cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  result.n128_u64[0] = 0x300000003;
  *(void *)(a1 + 24) = 0x300000003;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26E5D3970;
  if (a1 == a2)
  {
    long long v16 = "this != &(A)";
    int v17 = 603;
LABEL_21:
    size_t v18 = "cnmatrix.h";
    uint64_t v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  unsigned int v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 3)
  {
    long long v16 = "this->max_num_rows_ >= num_rows";
    int v17 = 422;
LABEL_18:
    size_t v18 = "cnmatrixbase.h";
    uint64_t v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  unsigned int v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 4)
  {
    long long v16 = "this->max_num_cols_ >= num_cols";
    int v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  uint64_t v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  double v6 = (_OWORD *)(a1 + 40);
  *(void *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 3u)
  {
    long long v16 = "this->max_num_rows_ >= A.num_rows_";
    int v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 3u)
  {
    long long v16 = "this->max_num_cols_ >= A.num_cols_";
    int v17 = 617;
    goto LABEL_21;
  }
  int v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    uint64_t v10 = (v7 - 2);
    uint64_t v11 = *(long long **)(a2 + 32);
    unint64_t v12 = (__n128 *)((char *)v6 + 8 * v10);
    uint64_t v13 = (v7 - 1) >> 1;
    uint64_t v14 = v11;
    do
    {
      long long v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    __n128 result = *(__n128 *)((char *)v11 + 8 * v10);
    *unint64_t v12 = result;
  }
  else if (v5)
  {
    double v8 = *(unint64_t **)(a2 + 32);
    do
    {
      unint64_t v9 = *v8++;
      result.n128_u64[0] = v9;
      *(void *)double v6 = v9;
      double v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_230ED9AE8(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

void cnmatrix::CNMatrix<1u,3u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<1u,3u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<1u,3u,double>::TransposeDataFootprint(uint64_t a1)
{
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

void cnmatrix::CNMatrix<2u,3u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<2u,3u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<2u,3u,double>::TransposeDataFootprint(uint64_t a1)
{
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

void cnmatrix::CNMatrix<3u,2u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<3u,2u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<3u,2u,double>::TransposeDataFootprint(uint64_t a1)
{
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

void std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = (uint64_t *)*a1;
  if (*v2)
  {
    std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, *v2);
    unsigned int v3 = **a1;
    operator delete(v3);
  }
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__base_destruct_at_end[abi:ne180100](uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (v2 != a2)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = v2 + v3;
      *(void *)(v4 - 64) = &unk_26E5D3870;
      *(void *)(v4 - 192) = &unk_26E5D3870;
      *(void *)(v2 + v3 - 304) = &unk_26E5D3870;
      *(void *)(v2 + v3 - 368) = &unk_26E5D3870;
      *(void *)(v2 + v3 - 432) = &unk_26E5D3870;
      v3 -= 432;
    }
    while (v2 + v3 != a2);
  }
  *(void *)(result + 8) = a2;
  return result;
}

void boost::circular_buffer<double,std::allocator<double>>::destroy(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)a1;
  uint64_t v6 = v3 - v2;
  unint64_t v7 = (unint64_t)(v3 - (void)v5) >> 3;
  if (v4 < v6 >> 3) {
    unint64_t v7 = 0;
  }
  *(void *)(a1 + 16) = v2 + 8 * (v4 - v7);
  if (v5) {
    operator delete(v5);
  }
}

void std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v3 = (char *)v1[1];
    if (v3 != v2)
    {
      uint64_t v4 = v3 - 72;
      do
      {
        *((void *)v3 - 9) = &unk_26E5D3870;
        v4 -= 112;
        v3 -= 112;
      }
      while (v3 != v2);
    }
    v1[1] = v2;
    operator delete(v2);
  }
}

void std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v3 = (char *)v1[1];
    if (v3 != v2)
    {
      uint64_t v4 = v3 - 176;
      do
      {
        *((void *)v3 - 14) = &unk_26E5D3870;
        *((void *)v3 - 22) = &unk_26E5D3870;
        v4 -= 208;
        v3 -= 208;
      }
      while (v3 != v2);
    }
    v1[1] = v2;
    operator delete(v2);
  }
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(112 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = a7 + v11;
      long long v13 = *(_OWORD *)(a3 + v11 - 112);
      long long v14 = *(_OWORD *)(a3 + v11 - 96);
      *(void *)(v12 - 80) = *(void *)(a3 + v11 - 80);
      *(_OWORD *)(v12 - 112) = v13;
      *(_OWORD *)(v12 - 96) = v14;
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a7 + v11 - 72, a3 + v11 - 72);
      *(_DWORD *)(v12 - 8) = *(_DWORD *)(a3 + v11 - 8);
      v11 -= 112;
    }
    while (a3 + v11 != a5);
  }
  return a6;
}

void sub_230ED9FB0(_Unwind_Exception *a1)
{
  for (; v2; v2 += 112)
    *(void *)(v1 + 40 + v2) = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<RoseSyntheticApertureFiltering::InternalRangeMeas>::~__split_buffer(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3 != v2)
  {
    uint64_t v4 = v3 - 72;
    do
    {
      *(void *)(v3 - 72) = &unk_26E5D3870;
      v4 -= 112;
      v3 -= 112;
    }
    while (v3 != v2);
    *(void *)(a1 + 16) = v2;
  }
  uint64_t v5 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v5);
  }
  return a1;
}

double *cnmatrix::Transpose<double>(uint64_t a1, _DWORD *a2)
{
  if ((_DWORD *)a1 == a2) {
    cnmatrix::Transpose<double>();
  }
  uint64_t result = (double *)cnmatrix::FastResize<double>(a2, *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 8));
  int v5 = a2[2];
  if (v5)
  {
    int v6 = 0;
    int v7 = a2[3];
    do
    {
      if (v7)
      {
        for (int i = 0; i != v7; ++i)
        {
          double v9 = cnmatrix::CNMatrixBase<double>::operator()(a1, i, v6);
          uint64_t result = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)a2, v6, i);
          *uint64_t result = v9;
        }
      }
      ++v6;
    }
    while (v6 != v5);
  }
  return result;
}

double cnmatrix::CNMatrixBase<double>::operator()(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  unsigned int v4 = a2 + *(_DWORD *)(a1 + 20) * a3;
  if ((v4 & 0x80000000) != 0) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  if ((signed int)v4 >= *(_DWORD *)(a1 + 16)) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  return *(double *)(v3 + 8 * v4);
}

uint64_t cnmatrix::CNMatrixBase<double>::operator()(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  unsigned int v4 = a2 + *(_DWORD *)(a1 + 20) * a3;
  if ((v4 & 0x80000000) != 0) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  if ((signed int)v4 >= *(_DWORD *)(a1 + 16)) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  return v3 + 8 * v4;
}

double cnmatrix::CNMatrixBase<double>::operator()(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  if ((a2 & 0x80000000) != 0) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  if (*(_DWORD *)(a1 + 16) <= (signed int)a2) {
    cnmatrix::CNMatrixBase<double>::operator()();
  }
  return *(double *)(v2 + 8 * a2);
}

void std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,unsigned int>>(uint64_t **a1, unsigned int *a2, uint64_t *a3)
{
  int v6 = a1 + 1;
  int v5 = a1[1];
  if (v5)
  {
    unsigned int v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        unsigned int v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9) {
          break;
        }
        int v5 = *v8;
        int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      int v5 = v8[1];
      if (!v5)
      {
        int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v10 + 28) = *a3;
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
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
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      unsigned int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unsigned int v9 = (uint64_t **)a2[2];
          }
          else
          {
            unsigned int v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unsigned int v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), int v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *int v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x249249249249249) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x124924924924924) {
    unint64_t v9 = 0x249249249249249;
  }
  else {
    unint64_t v9 = v5;
  }
  double v23 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[112 * v4];
  __p = v10;
  double v20 = v11;
  long long v21 = v11;
  uint64_t v22 = &v10[112 * v9];
  long long v12 = *a2;
  long long v13 = a2[1];
  *((void *)v11 + 4) = *((void *)a2 + 4);
  *(_OWORD *)uint64_t v11 = v12;
  *((_OWORD *)v11 + 1) = v13;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(v11 + 40), (uint64_t)a2 + 40);
  *(_DWORD *)&v10[112 * v4 + 104] = *((_DWORD *)a2 + 26);
  v21 += 112;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(a1, &__p);
  uint64_t v14 = a1[1];
  long long v15 = v20;
  long long v16 = v21;
  if (v21 != v20)
  {
    int v17 = v21 - 72;
    do
    {
      *((void *)v16 - 9) = &unk_26E5D3870;
      v17 -= 112;
      v16 -= 112;
    }
    while (v16 != v15);
    long long v21 = v15;
  }
  if (__p) {
    operator delete(__p);
  }
  return v14;
}

void sub_230EDA640(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalRangeMeas>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_230EDA6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[112 * v4];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != a3)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a4 + v7;
      uint64_t v9 = a2 + v7;
      long long v10 = *(_OWORD *)(a2 + v7);
      long long v11 = *(_OWORD *)(a2 + v7 + 16);
      *(void *)(v8 + 32) = *(void *)(a2 + v7 + 32);
      *(_OWORD *)uint64_t v8 = v10;
      *(_OWORD *)(v8 + 16) = v11;
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a4 + v7 + 40, a2 + v7 + 40);
      *(_DWORD *)(v8 + 104) = *(_DWORD *)(a2 + v7 + 104);
      v7 += 112;
    }
    while (v9 + 112 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_230EDA7BC(_Unwind_Exception *a1)
{
  for (; v2; v2 -= 112)
    *(void *)(v1 - 72 + v2) = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

void std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vdeallocate(char **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    uint64_t v3 = a1[1];
    if (v3 != v2)
    {
      uint64_t v4 = v3 - 72;
      do
      {
        *((void *)v3 - 9) = &unk_26E5D3870;
        v4 -= 112;
        v3 -= 112;
      }
      while (v3 != v2);
    }
    a1[1] = v2;
    operator delete(v2);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x249249249249249) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x124924924924924) {
    unint64_t v9 = 0x249249249249249;
  }
  else {
    unint64_t v9 = v5;
  }
  double v23 = a1 + 2;
  if (v9) {
    long long v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(v7, v9);
  }
  else {
    long long v10 = 0;
  }
  long long v11 = &v10[112 * v4];
  __p = v10;
  double v20 = v11;
  long long v21 = v11;
  uint64_t v22 = &v10[112 * v9];
  long long v12 = *a2;
  long long v13 = a2[1];
  *((void *)v11 + 4) = *((void *)a2 + 4);
  *(_OWORD *)long long v11 = v12;
  *((_OWORD *)v11 + 1) = v13;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(v11 + 40), (uint64_t)a2 + 40);
  *(_DWORD *)&v10[112 * v4 + 104] = *((_DWORD *)a2 + 26);
  v21 += 112;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(a1, &__p);
  uint64_t v14 = a1[1];
  long long v15 = v20;
  long long v16 = v21;
  if (v21 != v20)
  {
    int v17 = v21 - 72;
    do
    {
      *((void *)v16 - 9) = &unk_26E5D3870;
      v17 -= 112;
      v16 -= 112;
    }
    while (v16 != v15);
    long long v21 = v15;
  }
  if (__p) {
    operator delete(__p);
  }
  return v14;
}

void sub_230EDA9E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalRangeMeas>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(uint64_t a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  unint64_t v9 = *(char **)a1;
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4) < a4)
  {
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vdeallocate((char **)a1);
    if (a4 > 0x249249249249249) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4)) >= 0x124924924924924) {
      unint64_t v11 = 0x249249249249249;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vallocate[abi:ne180100]((void *)a1, v11);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(v8, (uint64_t)a2, (uint64_t)a3, *(void *)(a1 + 8));
    goto LABEL_11;
  }
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4) < a4)
  {
    long long v13 = &a2[(uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4];
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,0>(a2, v13, (uint64_t)v9);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(v8, (uint64_t)v13, (uint64_t)a3, *(void *)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = result;
    return result;
  }
  uint64_t result = (uint64_t)std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,0>(a2, a3, (uint64_t)v9);
  uint64_t v15 = *(void *)(a1 + 8);
  if (v15 != v14)
  {
    uint64_t v16 = v15 - 72;
    do
    {
      *(void *)(v15 - 72) = &unk_26E5D3870;
      v16 -= 112;
      v15 -= 112;
    }
    while (v15 != v14);
  }
  *(void *)(a1 + 8) = v14;
  return result;
}

void sub_230EDAB90(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_230EDAB98(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

long long *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,0>(long long *a1, long long *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  if (a1 == a2) {
    return a1;
  }
  unint64_t v5 = a2;
  do
  {
    long long v6 = *v4;
    long long v7 = v4[1];
    *(void *)(a3 + 32) = *((void *)v4 + 4);
    *(_OWORD *)a3 = v6;
    *(_OWORD *)(a3 + 16) = v7;
    cnmatrix::CNMatrixBase<double>::operator=(a3 + 40, (uint64_t)v4 + 40);
    *(_DWORD *)(a3 + 104) = *((_DWORD *)v4 + 26);
    a3 += 112;
    v4 += 7;
  }
  while (v4 != v5);
  return v5;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__push_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x249249249249249) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x124924924924924) {
    unint64_t v9 = 0x249249249249249;
  }
  else {
    unint64_t v9 = v5;
  }
  double v23 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v11 = &v10[112 * v4];
  __p = v10;
  double v20 = v11;
  long long v21 = v11;
  uint64_t v22 = &v10[112 * v9];
  long long v12 = *a2;
  long long v13 = a2[1];
  *((void *)v11 + 4) = *((void *)a2 + 4);
  *(_OWORD *)unint64_t v11 = v12;
  *((_OWORD *)v11 + 1) = v13;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(v11 + 40), (uint64_t)a2 + 40);
  *(_DWORD *)&v10[112 * v4 + 104] = *((_DWORD *)a2 + 26);
  v21 += 112;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(a1, &__p);
  uint64_t v14 = a1[1];
  uint64_t v15 = v20;
  uint64_t v16 = v21;
  if (v21 != v20)
  {
    int v17 = v21 - 72;
    do
    {
      *((void *)v16 - 9) = &unk_26E5D3870;
      v17 -= 112;
      v16 -= 112;
    }
    while (v16 != v15);
    long long v21 = v15;
  }
  if (__p) {
    operator delete(__p);
  }
  return v14;
}

void sub_230EDAD94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalRangeMeas>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

_OWORD *std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas *,RoseSyntheticApertureFiltering::InternalAoAMeas *,RoseSyntheticApertureFiltering::InternalAoAMeas *>(uint64_t a1, _OWORD *a2, _OWORD *a3, _OWORD *a4)
{
  unint64_t v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  long long v6 = a3;
  do
  {
    long long v7 = v5[1];
    *a4 = *v5;
    a4[1] = v7;
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a4 + 2), (uint64_t)(v5 + 2));
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a4 + 6), (uint64_t)(v5 + 6));
    a4 += 13;
    v5 += 13;
  }
  while (v5 != v6);
  return v6;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x249249249249249) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x124924924924924) {
    unint64_t v9 = 0x249249249249249;
  }
  else {
    unint64_t v9 = v5;
  }
  double v23 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v11 = &v10[112 * v4];
  __p = v10;
  double v20 = v11;
  long long v21 = v11;
  uint64_t v22 = &v10[112 * v9];
  long long v12 = *a2;
  long long v13 = a2[1];
  *((void *)v11 + 4) = *((void *)a2 + 4);
  *(_OWORD *)unint64_t v11 = v12;
  *((_OWORD *)v11 + 1) = v13;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(v11 + 40), (uint64_t)a2 + 40);
  *(_DWORD *)&v10[112 * v4 + 104] = *((_DWORD *)a2 + 26);
  v21 += 112;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(a1, &__p);
  uint64_t v14 = a1[1];
  uint64_t v15 = v20;
  uint64_t v16 = v21;
  if (v21 != v20)
  {
    int v17 = v21 - 72;
    do
    {
      *((void *)v16 - 9) = &unk_26E5D3870;
      v17 -= 112;
      v16 -= 112;
    }
    while (v16 != v15);
    long long v21 = v15;
  }
  if (__p) {
    operator delete(__p);
  }
  return v14;
}

void sub_230EDAFD0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalRangeMeas>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

double cnmatrix::CNMatrixBase<double>::operator()<int,int>(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    cnmatrix::CNMatrixBase<double>::operator()<int,int>();
  }
  unsigned int v4 = a2 + *(_DWORD *)(a1 + 20) * a3;
  if ((v4 & 0x80000000) != 0) {
    cnmatrix::CNMatrixBase<double>::operator()<int,int>();
  }
  if ((signed int)v4 >= *(_DWORD *)(a1 + 16)) {
    cnmatrix::CNMatrixBase<double>::operator()<int,int>();
  }
  return *(double *)(v3 + 8 * v4);
}

void std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v3 = (char *)v1[1];
    if (v3 != v2)
    {
      unsigned int v4 = v3 - 128;
      do
      {
        *((void *)v3 - 8) = &unk_26E5D3870;
        *((void *)v3 - 16) = &unk_26E5D3870;
        v4 -= 136;
        v3 -= 136;
      }
      while (v3 != v2);
    }
    v1[1] = v2;
    operator delete(v2);
  }
}

void std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v3 = (char *)v1[1];
    if (v3 != v2)
    {
      unsigned int v4 = v3 - 176;
      do
      {
        *((void *)v3 - 11) = &unk_26E5D3870;
        *((void *)v3 - 22) = &unk_26E5D3870;
        v4 -= 192;
        v3 -= 192;
      }
      while (v3 != v2);
    }
    v1[1] = v2;
    operator delete(v2);
  }
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1E1E1E1E1E1E1E2) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(136 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  for (uint64_t i = 0;
        a3 + i != a5;
        std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas,RoseSyntheticApertureFiltering::InternalExpectedRangeMeas const&>(a1, (void *)(i + a7), (void *)(i + a3)))
  {
    i -= 136;
  }
  return a6;
}

double std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas,RoseSyntheticApertureFiltering::InternalExpectedRangeMeas const&>(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (uint64_t)(a3 + 9);
  *a2 = *a3;
  cnmatrix::CNMatrix<1u,3u,double>::CNMatrix((uint64_t)(a2 + 1), (uint64_t)(a3 + 1));
  *(void *)&double result = cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(a2 + 9), v4).n128_u64[0];
  return result;
}

void sub_230EDB2BC(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

__n128 cnmatrix::CNMatrix<1u,3u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  result.n128_u64[0] = 0x300000001;
  *(void *)(a1 + 24) = 0x300000001;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26E5D39B8;
  if (a1 == a2)
  {
    uint64_t v16 = "this != &(A)";
    int v17 = 603;
LABEL_21:
    size_t v18 = "cnmatrix.h";
    uint64_t v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  unsigned int v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 1)
  {
    uint64_t v16 = "this->max_num_rows_ >= num_rows";
    int v17 = 422;
LABEL_18:
    size_t v18 = "cnmatrixbase.h";
    uint64_t v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  unsigned int v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 4)
  {
    uint64_t v16 = "this->max_num_cols_ >= num_cols";
    int v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  uint64_t v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  uint64_t v6 = (_OWORD *)(a1 + 40);
  *(void *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 1u)
  {
    uint64_t v16 = "this->max_num_rows_ >= A.num_rows_";
    int v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 3u)
  {
    uint64_t v16 = "this->max_num_cols_ >= A.num_cols_";
    int v17 = 617;
    goto LABEL_21;
  }
  int v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    uint64_t v10 = (v7 - 2);
    unint64_t v11 = *(long long **)(a2 + 32);
    long long v12 = (__n128 *)((char *)v6 + 8 * v10);
    uint64_t v13 = (v7 - 1) >> 1;
    uint64_t v14 = v11;
    do
    {
      long long v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    __n128 result = *(__n128 *)((char *)v11 + 8 * v10);
    *long long v12 = result;
  }
  else if (v5)
  {
    uint64_t v8 = *(unint64_t **)(a2 + 32);
    do
    {
      unint64_t v9 = *v8++;
      result.n128_u64[0] = v9;
      *(void *)uint64_t v6 = v9;
      uint64_t v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_230EDB44C(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::~__split_buffer(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3 != v2)
  {
    uint64_t v4 = v3 - 128;
    do
    {
      *(void *)(v3 - 64) = &unk_26E5D3870;
      *(void *)(v3 - 128) = &unk_26E5D3870;
      v4 -= 136;
      v3 -= 136;
    }
    while (v3 != v2);
    *(void *)(a1 + 16) = v2;
  }
  uint64_t v5 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v5);
  }
  return a1;
}

cnprint::CNPrinter *cnmatrix::Inv<double>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3) {
    cnmatrix::Inv<double>();
  }
  if (a1 == a4) {
    cnmatrix::Inv<double>();
  }
  if (a3 == a4) {
    cnmatrix::Inv<double>();
  }
  unsigned int v7 = *(_DWORD *)(a1 + 8);
  if (v7 != *(_DWORD *)(a1 + 12)) {
    cnmatrix::Inv<double>();
  }
  if (*(_DWORD *)(a2 + 28) * *(_DWORD *)(a2 + 24) < v7) {
    cnmatrix::Inv<double>();
  }
  if (*(_DWORD *)(a3 + 28) * *(_DWORD *)(a3 + 24) < 4 * v7) {
    cnmatrix::Inv<double>();
  }
  if (*(_DWORD *)(a4 + 24) < v7) {
    cnmatrix::Inv<double>();
  }
  if (*(_DWORD *)(a4 + 28) < v7) {
    cnmatrix::Inv<double>();
  }
  cnmatrix::CNMatrixBase<double>::operator=(a4, a1);
  uint64_t v8 = *(unsigned int *)(a4 + 8);
  uint64_t v9 = *(unsigned int *)(a4 + 12);
  uint64_t v10 = *(__CLPK_doublereal **)(a4 + 32);
  __CLPK_integer v11 = *(_DWORD *)(a4 + 20);
  long long v12 = *(void **)(a2 + 32);
  __CLPK_integer __n = *(_DWORD *)(a4 + 12);
  __CLPK_integer __m = v8;
  __CLPK_integer __lda = v11;
  if ((int)v8 < 1) {
    goto LABEL_37;
  }
  size_t v13 = 4 * v8;
  uint64_t v14 = (__CLPK_integer *)operator new[](4 * v8, MEMORY[0x263F8C180]);
  if (!v14) {
    cnmatrix::Inv<double>();
  }
  long long v15 = v14;
  __mach_timebase_info info = 0;
  dgetrf_(&__m, &__n, v10, &__lda, v14, &__info);
  memcpy(v12, v15, v13);
  MEMORY[0x230FCEC30](v15, 0x1000C8052888210);
  if (__info)
  {
    if (__info >= 1)
    {
      LOWORD(__m) = 4;
      LOBYTE(__n) = 2;
      cnprint::CNPrinter::Print();
      goto LABEL_14;
    }
LABEL_37:
    cnmatrix::Inv<double>();
  }
LABEL_14:
  uint64_t v16 = *(__CLPK_doublereal **)(a3 + 32);
  __CLPK_integer v17 = *(_DWORD *)(a3 + 28) * *(_DWORD *)(a3 + 24);
  __CLPK_integer __n = v11;
  __CLPK_integer __m = v9;
  if ((int)v9 < 1)
  {
    __CLPK_integer v23 = -1;
LABEL_20:
    LOWORD(__m) = 4;
    LOBYTE(__n) = 5;
    __n128 result = (cnprint::CNPrinter *)cnprint::CNPrinter::Print();
    int v22 = 1;
    goto LABEL_21;
  }
  size_t v18 = 4 * v9;
  uint64_t v19 = (__CLPK_integer *)operator new[](v18, MEMORY[0x263F8C180]);
  if (!v19)
  {
    __CLPK_integer v23 = -4;
    goto LABEL_20;
  }
  double v20 = v19;
  memcpy(v19, v12, v18);
  __mach_timebase_info info = 0;
  __CLPK_integer __lda = v17;
  dgetri_(&__m, v10, &__n, v20, v16, &__lda, &__info);
  __n128 result = (cnprint::CNPrinter *)MEMORY[0x230FCEC30](v20, 0x1000C8052888210);
  int v22 = 0;
  __CLPK_integer v23 = __info;
  if (__info < 0) {
    goto LABEL_20;
  }
LABEL_21:
  if (v17 < (int)**(double **)(a3 + 32))
  {
    __n128 result = (cnprint::CNPrinter *)cnprint::CNPrinter::GetLogLevel(result);
    if (result <= 1)
    {
      LOWORD(__m) = 4;
      LOBYTE(__n) = 1;
      __n128 result = (cnprint::CNPrinter *)cnprint::CNPrinter::Print();
    }
  }
  if (v22) {
    cnmatrix::Inv<double>();
  }
  if (v23) {
    return (cnprint::CNPrinter *)cnmatrix::CNMatrixBase<double>::WriteValue(a4, INFINITY);
  }
  return result;
}

void *cnmatrix::CNMatrix<12u,1u,double>::~CNMatrix(void *result)
{
  *__n128 result = &unk_26E5D3870;
  return result;
}

void *cnmatrix::CNMatrix<3u,1u,int>::~CNMatrix(void *result)
{
  *__n128 result = &unk_26E5D3AE8;
  return result;
}

void cnmatrix::CNMatrix<3u,1u,int>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3AE8;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<3u,1u,int>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<3u,1u,int>::TransposeDataFootprint(uint64_t a1)
{
  cnmatrix::CNMatrix<3u,1u,int>::TransposeDataFootprint(a1, v1);
}

void cnmatrix::CNMatrix<3u,1u,int>::TransposeDataFootprint(uint64_t a1, char *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 >= 2)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 12);
    if (v4 >= 2)
    {
      if (!a2) {
        cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint();
      }
      int v6 = v4 + v2 - *(_DWORD *)(a1 + 20);
      if (v6 <= 0) {
        cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint();
      }
      bzero(a2, *(unsigned int *)(a1 + 16));
      int v7 = *(_DWORD *)(a1 + 16);
      if (v7 >= 3)
      {
        uint64_t v8 = (v7 - 1);
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = 1;
        do
        {
          __CLPK_integer v11 = &a2[v10];
          if (!a2[v10])
          {
            int v12 = *(_DWORD *)(v9 + 4 * v10);
            int v13 = v10;
            do
            {
              int v13 = v13 * v6 % (int)v8;
              int v14 = *(_DWORD *)(v9 + 4 * v13);
              *(_DWORD *)(v9 + 4 * v13) = v12;
              *__CLPK_integer v11 = 1;
              __CLPK_integer v11 = &a2[v13];
              int v12 = v14;
            }
            while (!*v11);
          }
          ++v10;
        }
        while (v10 != v8);
      }
    }
  }
}

void cnmatrix::CNMatrix<12u,1u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<12u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<12u,1u,double>::TransposeDataFootprint(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

void std::vector<cnmatrix::CNMatrix<3u,1u,double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    unsigned int v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      int v6 = v4 - 64;
      int v7 = v4 - 64;
      uint64_t v8 = v4 - 64;
      do
      {
        uint64_t v9 = *(void (***)(char *))v8;
        v8 -= 64;
        (*v9)(v7);
        v6 -= 64;
        BOOL v10 = v7 == v2;
        int v7 = v8;
      }
      while (!v10);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<cnmatrix::CNMatrix<3u,1u,double>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<3u,1u,double>>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<3u,1u,double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 6);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<3u,1u,double>>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  for (uint64_t i = 0; a3 + i != a5; cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(i + a7, i + a3))
    i -= 64;
  return a6;
}

uint64_t std::__split_buffer<cnmatrix::CNMatrix<3u,1u,double>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    unsigned int v4 = *(void (***)(void))(i - 64);
    *(void *)(a1 + 16) = i - 64;
    (*v4)();
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = (uint64_t *)*a1;
  if (*v2)
  {
    std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

uint64_t std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__base_destruct_at_end[abi:ne180100](uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (v2 != a2)
  {
    uint64_t v3 = v2 - 128;
    do
    {
      *(void *)(v2 - 128) = &unk_26E5D3870;
      *(void *)(v2 - 240) = &unk_26E5D3870;
      *(void *)(v2 - 304) = &unk_26E5D3870;
      *(void *)(v2 - 368) = &unk_26E5D3870;
      v3 -= 376;
      v2 -= 376;
    }
    while (v2 != a2);
  }
  *(void *)(result + 8) = a2;
  return result;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = 0x51B3BEA3677D46CFLL * ((a1[1] - *a1) >> 3);
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0xAE4C415C9882B9) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  if (0xA3677D46CEFA8D9ELL * ((a1[2] - *a1) >> 3) > v4) {
    unint64_t v4 = 0xA3677D46CEFA8D9ELL * ((a1[2] - *a1) >> 3);
  }
  if ((unint64_t)(0x51B3BEA3677D46CFLL * ((a1[2] - *a1) >> 3)) >= 0x572620AE4C415CLL) {
    unint64_t v6 = 0xAE4C415C9882B9;
  }
  else {
    unint64_t v6 = v4;
  }
  int v14 = a1 + 2;
  if (v6) {
    uint64_t v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>>((uint64_t)(a1 + 2), v6);
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v10 = v7;
  __CLPK_integer v11 = &v7[376 * v3];
  int v13 = &v7[376 * v6];
  std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult>((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  int v12 = v11 + 376;
  std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__swap_out_circular_buffer(a1, &v10);
  uint64_t v8 = a1[1];
  std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::~__split_buffer((uint64_t)&v10);
  return v8;
}

void sub_230EDBE4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3 + 72;
  *(unsigned char *)a2 = *(unsigned char *)a3;
  uint64_t v6 = a2 + 72;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a2 + 8, a3 + 8);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v6, v5);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 136, a3 + 136);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 248, a3 + 248);
  uint64_t v7 = *(void *)(a3 + 360);
  *(_DWORD *)(a2 + 368) = *(_DWORD *)(a3 + 368);
  *(void *)(a2 + 360) = v7;
}

void sub_230EDBEEC(_Unwind_Exception *a1)
{
  void *v3 = &unk_26E5D3870;
  void *v2 = &unk_26E5D3870;
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAE4C415C9882BALL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(376 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  char v14 = 0;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      v9 -= 376;
      std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>(a1, v7 - 376, v9);
      uint64_t v7 = *((void *)&v16 + 1) - 376;
      *((void *)&v16 + 1) -= 376;
    }
    while (v9 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

void sub_230EDC0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3 + 72;
  *(unsigned char *)a2 = *(unsigned char *)a3;
  uint64_t v6 = a2 + 72;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a2 + 8, a3 + 8);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v6, v5);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 136, a3 + 136);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 248, a3 + 248);
  uint64_t v7 = *(void *)(a3 + 360);
  *(_DWORD *)(a2 + 368) = *(_DWORD *)(a3 + 368);
  *(void *)(a2 + 360) = v7;
}

void sub_230EDC168(_Unwind_Exception *a1)
{
  void *v3 = &unk_26E5D3870;
  void *v2 = &unk_26E5D3870;
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

uint64_t std::_AllocatorDestroyRangeReverse<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>>::operator()[abi:ne180100](uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(result + 16) + 8);
  uint64_t v2 = *(void **)(*(void *)(result + 8) + 8);
  if (v1 != v2)
  {
    uint64_t v3 = v1 + 31;
    do
    {
      v1[31] = &unk_26E5D3870;
      v1[17] = &unk_26E5D3870;
      char v1[9] = &unk_26E5D3870;
      v1[1] = &unk_26E5D3870;
      v1 += 47;
      v3 += 47;
    }
    while (v1 != v2);
  }
  return result;
}

uint64_t std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destruct_at_end[abi:ne180100](uint64_t result, void *a2)
{
  uint64_t v2 = *(void **)(result + 16);
  if (v2 != a2)
  {
    uint64_t v3 = v2 - 46;
    unint64_t v4 = v3;
    do
    {
      v4[30] = &unk_26E5D3870;
      v4[16] = &unk_26E5D3870;
      v4[8] = &unk_26E5D3870;
      *unint64_t v4 = &unk_26E5D3870;
      uint64_t v5 = v4 - 1;
      v4 -= 47;
      v3 -= 47;
    }
    while (v5 != a2);
    *(void *)(result + 16) = a2;
  }
  return result;
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    *(unsigned char *)a4 = *(unsigned char *)v5;
    cnmatrix::CNMatrixBase<double>::operator=(a4 + 8, v5 + 8);
    cnmatrix::CNMatrixBase<double>::operator=(a4 + 72, v5 + 72);
    cnmatrix::CNMatrixBase<double>::operator=(a4 + 136, v5 + 136);
    cnmatrix::CNMatrixBase<double>::operator=(a4 + 248, v5 + 248);
    int v7 = *(_DWORD *)(v5 + 368);
    *(void *)(a4 + 360) = *(void *)(v5 + 360);
    *(_DWORD *)(a4 + 368) = v7;
    a4 += 376;
    v5 += 376;
  }
  while (v5 != v6);
  return v6;
}

void std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(uint64_t a1, char *a2, uint64_t a3, char a4)
{
  while (2)
  {
    uint64_t v115 = a2 - 376;
    uint64_t v112 = (uint64_t)(a2 - 1128);
    uint64_t v113 = (uint64_t)(a2 - 752);
    unint64_t v8 = a1;
    uint64_t v122 = (uint64_t)a2;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v9 = v8;
          uint64_t v10 = (uint64_t)&a2[-v8];
          unint64_t v11 = 0x51B3BEA3677D46CFLL * ((uint64_t)&a2[-v8] >> 3);
          a1 = v9;
          if (!(!v5 & v4))
          {
            switch(v11)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                if (*((double *)a2 - 2) >= *(double *)(v9 + 360)) {
                  return;
                }
                uint64_t v51 = (char *)v9;
                uint64_t v52 = v115;
                break;
              case 3uLL:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v9, v9 + 376, (uint64_t)v115);
                return;
              case 4uLL:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v9, v9 + 376, v9 + 752, (uint64_t)v115);
                return;
              case 5uLL:
                double v53 = (char *)(v9 + 752);
                uint64_t v54 = (char *)(v9 + 1128);
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v9, v9 + 376, v9 + 752, v9 + 1128);
                if (*((double *)a2 - 2) >= *(double *)(v9 + 1488)) {
                  return;
                }
                std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>(v54, v115);
                if (*(double *)(v9 + 1488) >= *(double *)(v9 + 1112)) {
                  return;
                }
                std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>(v53, v54);
                if (*(double *)(v9 + 1112) >= *(double *)(v9 + 736)) {
                  return;
                }
                std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)(v9 + 376), v53);
                if (*(double *)(v9 + 736) >= *(double *)(v9 + 360)) {
                  return;
                }
                uint64_t v51 = (char *)v9;
                uint64_t v52 = (char *)(v9 + 376);
                break;
              default:
                JUMPOUT(0);
            }
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>(v51, v52);
            return;
          }
          if (v10 <= 9023)
          {
            if (a4)
            {
              if ((char *)v9 != a2)
              {
                long long v55 = (char *)(v9 + 376);
                if ((char *)(v9 + 376) != a2)
                {
                  uint64_t v56 = 0;
                  uint64_t v57 = v9;
                  do
                  {
                    uint64_t v58 = v55;
                    if (*(double *)(v57 + 736) < *(double *)(v57 + 360))
                    {
                      char v131 = *v55;
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v132, v57 + 384);
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v133, v57 + 448);
                      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v134, v57 + 512);
                      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v135, v57 + 624);
                      double v136 = *(double *)(v57 + 736);
                      int v137 = *(_DWORD *)(v57 + 744);
                      uint64_t v59 = v56;
                      while (1)
                      {
                        uint64_t v60 = v9 + v59;
                        *(unsigned char *)(v9 + v59 + 376) = *(unsigned char *)(v9 + v59);
                        cnmatrix::CNMatrixBase<double>::operator=(v9 + v59 + 384, v9 + v59 + 8);
                        cnmatrix::CNMatrixBase<double>::operator=(v60 + 448, v60 + 72);
                        cnmatrix::CNMatrixBase<double>::operator=(v60 + 512, v60 + 136);
                        cnmatrix::CNMatrixBase<double>::operator=(v60 + 624, v60 + 248);
                        *(void *)(v60 + 736) = *(void *)(v60 + 360);
                        *(_DWORD *)(v60 + 744) = *(_DWORD *)(v60 + 368);
                        if (!v59) {
                          break;
                        }
                        v59 -= 376;
                        if (v136 >= *(double *)(v60 - 16))
                        {
                          uint64_t v61 = (unsigned char *)(v9 + v59 + 376);
                          goto LABEL_74;
                        }
                      }
                      uint64_t v61 = (unsigned char *)v9;
LABEL_74:
                      a2 = (char *)v122;
                      unsigned char *v61 = v131;
                      cnmatrix::CNMatrixBase<double>::operator=(v60 + 8, (uint64_t)v132);
                      cnmatrix::CNMatrixBase<double>::operator=(v60 + 72, (uint64_t)v133);
                      cnmatrix::CNMatrixBase<double>::operator=(v60 + 136, (uint64_t)v134);
                      cnmatrix::CNMatrixBase<double>::operator=(v60 + 248, (uint64_t)v135);
                      int v62 = v137;
                      *(double *)(v60 + 360) = v136;
                      *(_DWORD *)(v60 + 368) = v62;
                    }
                    long long v55 = v58 + 376;
                    v56 += 376;
                    uint64_t v57 = (uint64_t)v58;
                  }
                  while (v58 + 376 != a2);
                }
              }
            }
            else if ((char *)v9 != a2)
            {
              unint64_t v100 = (char *)(v9 + 376);
              if ((char *)(v9 + 376) != a2)
              {
                uint64_t v101 = v9 - 16;
                do
                {
                  long long v102 = v100;
                  if (*(double *)(a1 + 736) < *(double *)(a1 + 360))
                  {
                    uint64_t v103 = a2;
                    char v131 = *v100;
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v132, a1 + 384);
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v133, a1 + 448);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v134, a1 + 512);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v135, a1 + 624);
                    double v136 = *(double *)(a1 + 736);
                    int v137 = *(_DWORD *)(a1 + 744);
                    uint64_t v104 = v101;
                    do
                    {
                      *(unsigned char *)(v104 + 392) = *(unsigned char *)(v104 + 16);
                      cnmatrix::CNMatrixBase<double>::operator=(v104 + 400, v104 + 24);
                      cnmatrix::CNMatrixBase<double>::operator=(v104 + 464, v104 + 88);
                      cnmatrix::CNMatrixBase<double>::operator=(v104 + 528, v104 + 152);
                      cnmatrix::CNMatrixBase<double>::operator=(v104 + 640, v104 + 264);
                      *(_DWORD *)(v104 + 760) = *(_DWORD *)(v104 + 384);
                      *(void *)(v104 + 752) = *(void *)(v104 + 376);
                      double v105 = *(double *)v104;
                      v104 -= 376;
                    }
                    while (v136 < v105);
                    *(unsigned char *)(v104 + 392) = v131;
                    cnmatrix::CNMatrixBase<double>::operator=(v104 + 400, (uint64_t)v132);
                    cnmatrix::CNMatrixBase<double>::operator=(v104 + 464, (uint64_t)v133);
                    cnmatrix::CNMatrixBase<double>::operator=(v104 + 528, (uint64_t)v134);
                    cnmatrix::CNMatrixBase<double>::operator=(v104 + 640, (uint64_t)v135);
                    int v106 = v137;
                    *(double *)(v104 + 752) = v136;
                    *(_DWORD *)(v104 + 760) = v106;
                    a2 = v103;
                  }
                  unint64_t v100 = v102 + 376;
                  v101 += 376;
                  a1 = (uint64_t)v102;
                }
                while (v102 + 376 != a2);
              }
            }
            return;
          }
          if (!a3)
          {
            if ((char *)v9 != a2)
            {
              unint64_t v114 = v10;
              int64_t v120 = (v11 - 2) >> 1;
              int64_t v63 = v120;
              uint64_t v64 = v9;
              do
              {
                int64_t v65 = v63;
                if (v120 >= v63)
                {
                  uint64_t v66 = (2 * v63) | 1;
                  uint64_t v67 = v64 + 376 * v66;
                  if (2 * v63 + 2 < (uint64_t)v11 && *(double *)(v64 + 376 * v66 + 360) < *(double *)(v67 + 736))
                  {
                    v67 += 376;
                    uint64_t v66 = 2 * v63 + 2;
                  }
                  uint64_t v68 = v64 + 376 * v63;
                  if (*(double *)(v67 + 360) >= *(double *)(v68 + 360))
                  {
                    uint64_t v69 = v64 + 376 * v65;
                    uint64_t v70 = v68 + 360;
                    char v131 = *(unsigned char *)v69;
                    int64_t v119 = v65;
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v132, v69 + 8);
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v133, v69 + 72);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v134, v69 + 136);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v135, v69 + 248);
                    double v71 = *(double *)v70;
                    int v137 = *(_DWORD *)(v70 + 8);
                    double v136 = v71;
                    do
                    {
                      uint64_t v72 = v67;
                      *(unsigned char *)uint64_t v69 = *(unsigned char *)v67;
                      uint64_t v73 = v67 + 8;
                      cnmatrix::CNMatrixBase<double>::operator=(v69 + 8, v67 + 8);
                      uint64_t v74 = v67 + 72;
                      cnmatrix::CNMatrixBase<double>::operator=(v69 + 72, v67 + 72);
                      uint64_t v75 = v67 + 136;
                      cnmatrix::CNMatrixBase<double>::operator=(v69 + 136, v67 + 136);
                      uint64_t v76 = v67 + 248;
                      cnmatrix::CNMatrixBase<double>::operator=(v69 + 248, v67 + 248);
                      int v77 = *(_DWORD *)(v67 + 368);
                      *(void *)(v69 + 360) = *(void *)(v67 + 360);
                      *(_DWORD *)(v69 + 368) = v77;
                      if (v120 < v66) {
                        break;
                      }
                      uint64_t v78 = (2 * v66) | 1;
                      uint64_t v67 = a1 + 376 * v78;
                      if (2 * v66 + 2 < (uint64_t)v11 && *(double *)(a1 + 376 * v78 + 360) < *(double *)(v67 + 736))
                      {
                        v67 += 376;
                        uint64_t v78 = 2 * v66 + 2;
                      }
                      uint64_t v69 = v72;
                      uint64_t v66 = v78;
                    }
                    while (*(double *)(v67 + 360) >= v136);
                    *(unsigned char *)uint64_t v72 = v131;
                    cnmatrix::CNMatrixBase<double>::operator=(v73, (uint64_t)v132);
                    cnmatrix::CNMatrixBase<double>::operator=(v74, (uint64_t)v133);
                    cnmatrix::CNMatrixBase<double>::operator=(v75, (uint64_t)v134);
                    cnmatrix::CNMatrixBase<double>::operator=(v76, (uint64_t)v135);
                    int64_t v65 = v119;
                    int v79 = v137;
                    *(double *)(v72 + 360) = v136;
                    *(_DWORD *)(v72 + 368) = v79;
                    a2 = (char *)v122;
                    uint64_t v64 = a1;
                  }
                }
                int64_t v63 = v65 - 1;
              }
              while (v65);
              int64_t v80 = v114 / 0x178;
              uint64_t v111 = v64 + 8;
              uint64_t v109 = v64 + 136;
              uint64_t v110 = v64 + 72;
              uint64_t v107 = v64 + 360;
              uint64_t v108 = v64 + 248;
              do
              {
                double v116 = a2;
                uint64_t v81 = a1;
                char v124 = *(unsigned char *)a1;
                cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v125, v111);
                cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v126, v110);
                cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v127, v109);
                cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v128, v108);
                uint64_t v82 = 0;
                uint64_t v83 = *(void *)v107;
                int v130 = *(_DWORD *)(v107 + 8);
                uint64_t v129 = v83;
                do
                {
                  uint64_t v84 = v81;
                  uint64_t v85 = v82 + 1;
                  v81 += 376 * (v82 + 1);
                  uint64_t v86 = 2 * v82;
                  uint64_t v82 = (2 * v82) | 1;
                  int64_t v87 = v86 + 2;
                  if (v87 < v80 && *(double *)(v84 + 376 * v85 + 360) < *(double *)(v81 + 736))
                  {
                    v81 += 376;
                    uint64_t v82 = v87;
                  }
                  *(unsigned char *)uint64_t v84 = *(unsigned char *)v81;
                  cnmatrix::CNMatrixBase<double>::operator=(v84 + 8, v81 + 8);
                  cnmatrix::CNMatrixBase<double>::operator=(v84 + 72, v81 + 72);
                  cnmatrix::CNMatrixBase<double>::operator=(v84 + 136, v81 + 136);
                  cnmatrix::CNMatrixBase<double>::operator=(v84 + 248, v81 + 248);
                  int v88 = *(_DWORD *)(v81 + 368);
                  *(void *)(v84 + 360) = *(void *)(v81 + 360);
                  *(_DWORD *)(v84 + 368) = v88;
                }
                while (v82 <= (uint64_t)((unint64_t)(v80 - 2) >> 1));
                uint64_t v89 = v116 - 376;
                unint64_t v121 = (double *)(v81 + 360);
                if ((char *)v81 == v116 - 376)
                {
                  *(unsigned char *)uint64_t v81 = v124;
                  cnmatrix::CNMatrixBase<double>::operator=(v81 + 8, (uint64_t)v125);
                  cnmatrix::CNMatrixBase<double>::operator=(v81 + 72, (uint64_t)v126);
                  cnmatrix::CNMatrixBase<double>::operator=(v81 + 136, (uint64_t)v127);
                  cnmatrix::CNMatrixBase<double>::operator=(v81 + 248, (uint64_t)v128);
                  int v98 = v130;
                  *(void *)unint64_t v121 = v129;
                  *(_DWORD *)(v81 + 368) = v98;
                }
                else
                {
                  *(unsigned char *)uint64_t v81 = *v89;
                  cnmatrix::CNMatrixBase<double>::operator=(v81 + 8, (uint64_t)(v116 - 368));
                  cnmatrix::CNMatrixBase<double>::operator=(v81 + 72, (uint64_t)(v116 - 304));
                  cnmatrix::CNMatrixBase<double>::operator=(v81 + 136, (uint64_t)(v116 - 240));
                  cnmatrix::CNMatrixBase<double>::operator=(v81 + 248, (uint64_t)(v116 - 128));
                  uint64_t v90 = *((void *)v116 - 2);
                  *(_DWORD *)(v81 + 368) = *((_DWORD *)v116 - 2);
                  *(void *)unint64_t v121 = v90;
                  *uint64_t v89 = v124;
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v116 - 368), (uint64_t)v125);
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v116 - 304), (uint64_t)v126);
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v116 - 240), (uint64_t)v127);
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v116 - 128), (uint64_t)v128);
                  int v91 = v130;
                  *((void *)v116 - 2) = v129;
                  *((_DWORD *)v116 - 2) = v91;
                  uint64_t v92 = v81 - a1 + 376;
                  if (v92 >= 377)
                  {
                    unint64_t v93 = (v92 / 0x178uLL - 2) >> 1;
                    if (*(double *)(a1 + 376 * v93 + 360) < *v121)
                    {
                      char v131 = *(unsigned char *)v81;
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v132, v81 + 8);
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v133, v81 + 72);
                      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v134, v81 + 136);
                      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v135, v81 + 248);
                      double v94 = *v121;
                      int v137 = *(_DWORD *)(v81 + 368);
                      double v136 = v94;
                      do
                      {
                        uint64_t v95 = v81;
                        uint64_t v81 = a1 + 376 * v93;
                        *(unsigned char *)uint64_t v95 = *(unsigned char *)v81;
                        cnmatrix::CNMatrixBase<double>::operator=(v95 + 8, v81 + 8);
                        cnmatrix::CNMatrixBase<double>::operator=(v95 + 72, v81 + 72);
                        cnmatrix::CNMatrixBase<double>::operator=(v95 + 136, v81 + 136);
                        cnmatrix::CNMatrixBase<double>::operator=(v95 + 248, v81 + 248);
                        int v96 = *(_DWORD *)(v81 + 368);
                        *(void *)(v95 + 360) = *(void *)(v81 + 360);
                        *(_DWORD *)(v95 + 368) = v96;
                        if (!v93) {
                          break;
                        }
                        unint64_t v93 = (v93 - 1) >> 1;
                      }
                      while (*(double *)(a1 + 376 * v93 + 360) < v136);
                      *(unsigned char *)uint64_t v81 = v131;
                      cnmatrix::CNMatrixBase<double>::operator=(v81 + 8, (uint64_t)v132);
                      cnmatrix::CNMatrixBase<double>::operator=(v81 + 72, (uint64_t)v133);
                      cnmatrix::CNMatrixBase<double>::operator=(v81 + 136, (uint64_t)v134);
                      cnmatrix::CNMatrixBase<double>::operator=(v81 + 248, (uint64_t)v135);
                      int v97 = v137;
                      *(double *)(v81 + 360) = v136;
                      *(_DWORD *)(v81 + 368) = v97;
                    }
                  }
                }
                BOOL v99 = v80-- <= 2;
                a2 = v116 - 376;
              }
              while (!v99);
            }
            return;
          }
          unint64_t v12 = v11 >> 1;
          int v13 = (char *)(v9 + 376 * (v11 >> 1));
          if ((unint64_t)v10 >= 0xBC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v9, v9 + 376 * (v11 >> 1), (uint64_t)v115);
            uint64_t v14 = 376 * v12;
            uint64_t v15 = 376 * v12 + v9 - 376;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v9 + 376, v15, v113);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v9 + 752, v9 + 376 + v14, v112);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v15, (uint64_t)v13, v9 + 376 + v14);
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)v9, v13);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v9 + 376 * (v11 >> 1), v9, (uint64_t)v115);
          }
          --a3;
          if ((a4 & 1) != 0 || *(double *)(v9 - 16) < *(double *)(v9 + 360)) {
            break;
          }
          char v131 = *(unsigned char *)v9;
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v132, v9 + 8);
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v133, v9 + 72);
          cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v134, v9 + 136);
          cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v135, v9 + 248);
          double v38 = *(double *)(v9 + 360);
          int v137 = *(_DWORD *)(v9 + 368);
          double v136 = v38;
          if (v38 < *((double *)a2 - 2))
          {
            uint64_t v39 = v9;
            do
            {
              unint64_t v8 = v39 + 376;
              double v40 = *(double *)(v39 + 736);
              v39 += 376;
            }
            while (v136 >= v40);
          }
          else
          {
            unint64_t v41 = v9 + 376;
            do
            {
              unint64_t v8 = v41;
              if (v41 >= (unint64_t)a2) {
                break;
              }
              double v42 = *(double *)(v41 + 360);
              v41 += 376;
            }
            while (v136 >= v42);
          }
          uint64_t v43 = a2;
          if (v8 < (unint64_t)a2)
          {
            long long v44 = a2;
            do
            {
              uint64_t v43 = v44 - 376;
              double v45 = *((double *)v44 - 2);
              v44 -= 376;
            }
            while (v136 < v45);
          }
          while (v8 < (unint64_t)v43)
          {
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)v8, v43);
            do
            {
              double v46 = *(double *)(v8 + 736);
              v8 += 376;
            }
            while (v136 >= v46);
            do
            {
              double v47 = *((double *)v43 - 2);
              v43 -= 376;
            }
            while (v136 < v47);
          }
          uint64_t v48 = (char *)(v8 - 376);
          if (v8 - 376 != v9)
          {
            *(unsigned char *)uint64_t v9 = *v48;
            cnmatrix::CNMatrixBase<double>::operator=(v9 + 8, v8 - 368);
            cnmatrix::CNMatrixBase<double>::operator=(v9 + 72, v8 - 304);
            cnmatrix::CNMatrixBase<double>::operator=(v9 + 136, v8 - 240);
            cnmatrix::CNMatrixBase<double>::operator=(v9 + 248, v8 - 128);
            int v49 = *(_DWORD *)(v8 - 8);
            *(void *)(v9 + 360) = *(void *)(v8 - 16);
            *(_DWORD *)(v9 + 368) = v49;
          }
          *uint64_t v48 = v131;
          cnmatrix::CNMatrixBase<double>::operator=(v8 - 368, (uint64_t)v132);
          cnmatrix::CNMatrixBase<double>::operator=(v8 - 304, (uint64_t)v133);
          cnmatrix::CNMatrixBase<double>::operator=(v8 - 240, (uint64_t)v134);
          cnmatrix::CNMatrixBase<double>::operator=(v8 - 128, (uint64_t)v135);
          a4 = 0;
          int v50 = v137;
          *(double *)(v8 - 16) = v136;
          *(_DWORD *)(v8 - 8) = v50;
        }
        uint64_t v118 = a3;
        char v131 = *(unsigned char *)v9;
        uint64_t v16 = v9 + 8;
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v132, v9 + 8);
        uint64_t v17 = v9 + 72;
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v133, v9 + 72);
        uint64_t v18 = v9 + 136;
        cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v134, v9 + 136);
        uint64_t v19 = v9 + 248;
        cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v135, v9 + 248);
        uint64_t v20 = 0;
        uint64_t v21 = v9 + 360;
        double v22 = *(double *)(v9 + 360);
        int v137 = *(_DWORD *)(v9 + 368);
        double v136 = v22;
        do
        {
          double v23 = *(double *)(v9 + v20 + 736);
          v20 += 376;
        }
        while (v23 < v136);
        unint64_t v24 = v9 + v20;
        uint64_t v25 = v122;
        if (v20 == 376)
        {
          unint64_t v28 = v122;
          while (v24 < v28)
          {
            long long v26 = (char *)(v28 - 376);
            double v29 = *(double *)(v28 - 16);
            v28 -= 376;
            if (v29 < v136) {
              goto LABEL_21;
            }
          }
          long long v26 = (char *)v28;
        }
        else
        {
          do
          {
            long long v26 = (char *)(v25 - 376);
            double v27 = *(double *)(v25 - 16);
            v25 -= 376;
          }
          while (v27 >= v136);
        }
LABEL_21:
        unint64_t v8 = v24;
        if (v24 < (unint64_t)v26)
        {
          double v30 = v26;
          do
          {
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)v8, v30);
            do
            {
              double v31 = *(double *)(v8 + 736);
              v8 += 376;
            }
            while (v31 < v136);
            do
            {
              double v32 = *((double *)v30 - 2);
              v30 -= 376;
            }
            while (v32 >= v136);
          }
          while (v8 < (unint64_t)v30);
        }
        double v33 = (char *)(v8 - 376);
        if (v8 - 376 != a1)
        {
          *(unsigned char *)a1 = *v33;
          cnmatrix::CNMatrixBase<double>::operator=(v16, v8 - 368);
          cnmatrix::CNMatrixBase<double>::operator=(v17, v8 - 304);
          cnmatrix::CNMatrixBase<double>::operator=(v18, v8 - 240);
          cnmatrix::CNMatrixBase<double>::operator=(v19, v8 - 128);
          int v34 = *(_DWORD *)(v8 - 8);
          *(void *)uint64_t v21 = *(void *)(v8 - 16);
          *(_DWORD *)(v21 + 8) = v34;
        }
        char *v33 = v131;
        cnmatrix::CNMatrixBase<double>::operator=(v8 - 368, (uint64_t)v132);
        cnmatrix::CNMatrixBase<double>::operator=(v8 - 304, (uint64_t)v133);
        cnmatrix::CNMatrixBase<double>::operator=(v8 - 240, (uint64_t)v134);
        __n128 v35 = cnmatrix::CNMatrixBase<double>::operator=(v8 - 128, (uint64_t)v135);
        a3 = v118;
        int v36 = v137;
        *(double *)(v8 - 16) = v136;
        *(_DWORD *)(v8 - 8) = v36;
        a2 = (char *)v122;
        if (v24 >= (unint64_t)v26) {
          break;
        }
LABEL_32:
        std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(a1, v8 - 376, v118, a4 & 1, v35);
        a4 = 0;
      }
      BOOL v37 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, v8 - 376);
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v8, v122))
      {
        break;
      }
      if (!v37) {
        goto LABEL_32;
      }
    }
    a2 = (char *)(v8 - 376);
    if (!v37) {
      continue;
    }
    break;
  }
}

void std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  double v6 = *(double *)(a2 + 360);
  double v7 = *(double *)(a3 + 360);
  if (v6 >= *(double *)(a1 + 360))
  {
    if (v7 >= v6) {
      return;
    }
    std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a2, (char *)a3);
    if (*(double *)(a2 + 360) >= *(double *)(v5 + 360)) {
      return;
    }
    a1 = v5;
    unint64_t v8 = (char *)a2;
  }
  else
  {
    if (v7 >= v6)
    {
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)a2);
      if (*(double *)(a3 + 360) >= *(double *)(a2 + 360)) {
        return;
      }
      a1 = a2;
    }
    unint64_t v8 = (char *)a3;
  }
  std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, v8);
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0x51B3BEA3677D46CFLL * v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*(double *)(a2 - 16) < *(double *)(a1 + 360))
      {
        double v6 = (char *)(a2 - 376);
        double v7 = (char *)a1;
        goto LABEL_4;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a2 - 376);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a1 + 752, a2 - 376);
      return 1;
    case 5:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a1 + 752, a1 + 1128);
      if (*(double *)(v2 - 16) < *(double *)(a1 + 1488))
      {
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)(a1 + 1128), (char *)(v2 - 376));
        if (*(double *)(a1 + 1488) < *(double *)(a1 + 1112))
        {
          std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)(a1 + 752), (char *)(a1 + 1128));
          if (*(double *)(a1 + 1112) < *(double *)(a1 + 736))
          {
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)(a1 + 376), (char *)(a1 + 752));
            if (*(double *)(a1 + 736) < *(double *)(a1 + 360))
            {
              double v7 = (char *)a1;
              double v6 = (char *)(a1 + 376);
LABEL_4:
              std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>(v7, v6);
            }
          }
        }
      }
      return 1;
    default:
      uint64_t v8 = a1 + 752;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a1 + 752);
      uint64_t v9 = a1 + 1128;
      if (a1 + 1128 == v2) {
        return 1;
      }
      uint64_t v10 = 0;
      int v11 = 0;
      uint64_t v16 = v2;
      break;
  }
  while (1)
  {
    if (*(double *)(v9 + 360) < *(double *)(v8 + 360))
    {
      char v17 = *(unsigned char *)v9;
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v18, v9 + 8);
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v19, v9 + 72);
      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v20, v9 + 136);
      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v21, v9 + 248);
      double v22 = *(double *)(v9 + 360);
      int v23 = *(_DWORD *)(v9 + 368);
      uint64_t v12 = v10;
      while (1)
      {
        uint64_t v13 = a1 + v12;
        *(unsigned char *)(a1 + v12 + 1128) = *(unsigned char *)(a1 + v12 + 752);
        uint64_t v14 = a1 + v12 + 760;
        cnmatrix::CNMatrixBase<double>::operator=(a1 + v12 + 1136, v14);
        cnmatrix::CNMatrixBase<double>::operator=(v13 + 1200, v13 + 824);
        cnmatrix::CNMatrixBase<double>::operator=(v13 + 1264, v13 + 888);
        cnmatrix::CNMatrixBase<double>::operator=(v13 + 1376, v13 + 1000);
        *(void *)(v13 + 1488) = *(void *)(v13 + 1112);
        *(_DWORD *)(v13 + 1496) = *(_DWORD *)(v13 + 1120);
        if (v12 == -752) {
          break;
        }
        v12 -= 376;
        if (v22 >= *(double *)(v13 + 736))
        {
          uint64_t v15 = (unsigned char *)(a1 + v12 + 1128);
          goto LABEL_14;
        }
      }
      uint64_t v15 = (unsigned char *)a1;
LABEL_14:
      *uint64_t v15 = v17;
      cnmatrix::CNMatrixBase<double>::operator=(v14, (uint64_t)v18);
      cnmatrix::CNMatrixBase<double>::operator=(v13 + 824, (uint64_t)v19);
      cnmatrix::CNMatrixBase<double>::operator=(v13 + 888, (uint64_t)v20);
      cnmatrix::CNMatrixBase<double>::operator=(v13 + 1000, (uint64_t)v21);
      *(double *)(v13 + 1112) = v22;
      *(_DWORD *)(v13 + 1120) = v23;
      ++v11;
      uint64_t v2 = v16;
      if (v11 == 8) {
        return v9 + 376 == v16;
      }
    }
    uint64_t v8 = v9;
    v10 += 376;
    v9 += 376;
    if (v9 == v2) {
      return 1;
    }
  }
}

void std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>(char *a1, char *a2)
{
  char v5 = *a1;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v6, (uint64_t)(a1 + 8));
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v7, (uint64_t)(a1 + 72));
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v8, (uint64_t)(a1 + 136));
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v9, (uint64_t)(a1 + 248));
  uint64_t v10 = *((void *)a1 + 45);
  int v11 = *((_DWORD *)a1 + 92);
  *a1 = *a2;
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a1 + 8), (uint64_t)(a2 + 8));
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a1 + 72), (uint64_t)(a2 + 72));
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a1 + 136), (uint64_t)(a2 + 136));
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a1 + 248), (uint64_t)(a2 + 248));
  uint64_t v4 = *((void *)a2 + 45);
  *((_DWORD *)a1 + 92) = *((_DWORD *)a2 + 92);
  *((void *)a1 + 45) = v4;
  *a2 = v5;
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a2 + 8), (uint64_t)v6);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a2 + 72), (uint64_t)v7);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a2 + 136), (uint64_t)v8);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a2 + 248), (uint64_t)v9);
  *((void *)a2 + 45) = v10;
  *((_DWORD *)a2 + 92) = v11;
}

void std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a2, a3);
  if (*(double *)(a4 + 360) < *(double *)(a3 + 360))
  {
    std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a3, (char *)a4);
    if (*(double *)(a3 + 360) < *(double *)(a2 + 360))
    {
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a2, (char *)a3);
      if (*(double *)(a2 + 360) < *(double *)(a1 + 360))
      {
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)a2);
      }
    }
  }
}

void *boost::circular_buffer<double,std::allocator<double>>::push_back_impl<double &&>(void *result, void *a2)
{
  uint64_t v2 = (void *)*result;
  uint64_t v3 = (void *)result[1];
  uint64_t v4 = result[4];
  if (v4 == ((uint64_t)v3 - *result) >> 3)
  {
    if (v3 != v2)
    {
      char v5 = (void *)result[3];
      *char v5 = *a2;
      double v6 = v5 + 1;
      if (v6 != v3) {
        uint64_t v2 = v6;
      }
      result[2] = v2;
      result[3] = v2;
    }
  }
  else
  {
    double v7 = (void *)result[3];
    *double v7 = *a2;
    uint64_t v8 = v7 + 1;
    if (v8 != v3) {
      uint64_t v2 = v8;
    }
    result[3] = v2;
    result[4] = v4 + 1;
  }
  return result;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = 0x51B3BEA3677D46CFLL * ((a1[1] - *a1) >> 3);
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0xAE4C415C9882B9) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  if (0xA3677D46CEFA8D9ELL * ((a1[2] - *a1) >> 3) > v4) {
    unint64_t v4 = 0xA3677D46CEFA8D9ELL * ((a1[2] - *a1) >> 3);
  }
  if ((unint64_t)(0x51B3BEA3677D46CFLL * ((a1[2] - *a1) >> 3)) >= 0x572620AE4C415CLL) {
    unint64_t v6 = 0xAE4C415C9882B9;
  }
  else {
    unint64_t v6 = v4;
  }
  uint64_t v14 = a1 + 2;
  if (v6) {
    double v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>>((uint64_t)(a1 + 2), v6);
  }
  else {
    double v7 = 0;
  }
  uint64_t v10 = v7;
  int v11 = &v7[376 * v3];
  uint64_t v13 = &v7[376 * v6];
  std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  uint64_t v12 = v11 + 376;
  std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__swap_out_circular_buffer(a1, &v10);
  uint64_t v8 = a1[1];
  std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::~__split_buffer((uint64_t)&v10);
  return v8;
}

void sub_230EDDB9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(char *a1, char *a2, uint64_t a3, char a4)
{
  while (2)
  {
    int v140 = a2 - 376;
    unint64_t v142 = (unint64_t)a2;
    uint64_t v131 = (uint64_t)(a2 - 1128);
    uint64_t v133 = (uint64_t)(a2 - 752);
    long long v135 = a2 - 384;
    unint64_t k = (unint64_t)a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v10 = k;
          uint64_t v11 = (uint64_t)&a2[-k];
          uint64_t v12 = 0x51B3BEA3677D46CFLL * ((uint64_t)&a2[-k] >> 3);
          if (!(!v5 & v4))
          {
            switch(v12)
            {
              case 0:
              case 1:
                return;
              case 2:
                int v56 = *((_DWORD *)a2 - 2);
                int v57 = *(_DWORD *)(v10 + 368);
                if (v56 < v57 || v56 <= v57 && *((double *)a2 - 2) < *(double *)(v10 + 360)) {
                  std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)v10, v140);
                }
                break;
              case 3:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v10, v10 + 376, (uint64_t)v140);
                break;
              case 4:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v10, v10 + 376, v10 + 752, (uint64_t)v140);
                break;
              case 5:
                std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,0>(v10, v10 + 376, v10 + 752, v10 + 1128, (uint64_t)v140);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          uint64_t v143 = (char *)v10;
          if (v11 <= 9023)
          {
            if (a4)
            {
              if ((char *)v10 != a2)
              {
                uint64_t v58 = (char *)(v10 + 376);
                if ((char *)(v10 + 376) != a2)
                {
                  uint64_t v59 = 0;
                  uint64_t v60 = v152;
                  uint64_t v61 = (char *)v10;
                  do
                  {
                    int v62 = v61;
                    uint64_t v61 = v58;
                    int v63 = *((_DWORD *)v62 + 186);
                    int v64 = *((_DWORD *)v62 + 92);
                    if (v63 < v64 || v63 <= v64 && *((double *)v62 + 92) < *((double *)v62 + 45))
                    {
                      char v151 = *v61;
                      uint64_t v65 = (uint64_t)v60;
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v60, (uint64_t)(v62 + 384));
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v153, (uint64_t)(v62 + 448));
                      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v154, (uint64_t)(v62 + 512));
                      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v155, (uint64_t)(v62 + 624));
                      double v156 = *((double *)v62 + 92);
                      int v157 = *((_DWORD *)v62 + 186);
                      for (uint64_t i = v59; ; i -= 376)
                      {
                        uint64_t v67 = v10 + i;
                        *(unsigned char *)(v10 + i + 376) = *(unsigned char *)(v10 + i);
                        uint64_t v68 = v10 + i + 8;
                        cnmatrix::CNMatrixBase<double>::operator=(v10 + i + 384, v68);
                        cnmatrix::CNMatrixBase<double>::operator=(v67 + 448, v67 + 72);
                        cnmatrix::CNMatrixBase<double>::operator=(v67 + 512, v67 + 136);
                        cnmatrix::CNMatrixBase<double>::operator=(v67 + 624, v67 + 248);
                        *(void *)(v67 + 736) = *(void *)(v67 + 360);
                        *(_DWORD *)(v67 + 744) = *(_DWORD *)(v67 + 368);
                        if (!i)
                        {
                          uint64_t v70 = v143;
                          goto LABEL_116;
                        }
                        int v69 = *(_DWORD *)(v67 - 8);
                        if (v157 >= v69 && (v157 > v69 || v156 >= *(double *)&v143[i - 16])) {
                          break;
                        }
                        uint64_t v10 = (uint64_t)v143;
                      }
                      uint64_t v70 = &v143[i];
LABEL_116:
                      uint64_t v60 = (unsigned char *)v65;
                      *uint64_t v70 = v151;
                      cnmatrix::CNMatrixBase<double>::operator=(v68, v65);
                      cnmatrix::CNMatrixBase<double>::operator=(v67 + 72, (uint64_t)v153);
                      cnmatrix::CNMatrixBase<double>::operator=(v67 + 136, (uint64_t)v154);
                      cnmatrix::CNMatrixBase<double>::operator=(v67 + 248, (uint64_t)v155);
                      int v71 = v157;
                      *(double *)(v67 + 360) = v156;
                      *(_DWORD *)(v67 + 368) = v71;
                      a2 = (char *)v142;
                      uint64_t v10 = (uint64_t)v143;
                    }
                    uint64_t v58 = v61 + 376;
                    v59 += 376;
                  }
                  while (v61 + 376 != a2);
                }
              }
            }
            else if ((char *)v10 != a2)
            {
              uint64_t v119 = v10 + 376;
              if ((char *)(v10 + 376) != a2)
              {
                uint64_t v120 = v10 + 736;
                do
                {
                  uint64_t v121 = v10;
                  uint64_t v10 = v119;
                  int v122 = *(_DWORD *)(v121 + 744);
                  int v123 = *(_DWORD *)(v121 + 368);
                  if (v122 < v123 || v122 <= v123 && *(double *)(v121 + 736) < *(double *)(v121 + 360))
                  {
                    char v151 = *(unsigned char *)v10;
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v152, v121 + 384);
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v153, v121 + 448);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v154, v121 + 512);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v155, v121 + 624);
                    double v156 = *(double *)(v121 + 736);
                    int v157 = *(_DWORD *)(v121 + 744);
                    for (uint64_t j = v120; ; j -= 376)
                    {
                      *(unsigned char *)(j - 360) = *(unsigned char *)(j - 736);
                      cnmatrix::CNMatrixBase<double>::operator=(j - 352, j - 728);
                      cnmatrix::CNMatrixBase<double>::operator=(j - 288, j - 664);
                      cnmatrix::CNMatrixBase<double>::operator=(j - 224, j - 600);
                      cnmatrix::CNMatrixBase<double>::operator=(j - 112, j - 488);
                      *(_DWORD *)(j + 8) = *(_DWORD *)(j - 368);
                      *(void *)uint64_t j = *(void *)(j - 376);
                      int v125 = *(_DWORD *)(j - 744);
                      if (v157 >= v125 && (v157 > v125 || v156 >= *(double *)(j - 752))) {
                        break;
                      }
                    }
                    *(unsigned char *)(j - 736) = v151;
                    cnmatrix::CNMatrixBase<double>::operator=(j - 728, (uint64_t)v152);
                    cnmatrix::CNMatrixBase<double>::operator=(j - 664, (uint64_t)v153);
                    cnmatrix::CNMatrixBase<double>::operator=(j - 600, (uint64_t)v154);
                    cnmatrix::CNMatrixBase<double>::operator=(j - 488, (uint64_t)v155);
                    int v126 = v157;
                    *(double *)(j - 376) = v156;
                    *(_DWORD *)(j - 368) = v126;
                    a2 = (char *)v142;
                  }
                  uint64_t v119 = v10 + 376;
                  v120 += 376;
                }
                while ((char *)(v10 + 376) != a2);
              }
            }
            return;
          }
          if (!a3)
          {
            if ((char *)v10 != a2)
            {
              int64_t v141 = (unint64_t)(v12 - 2) >> 1;
              int64_t v72 = v141;
              do
              {
                int64_t v73 = v72;
                if (v141 >= v72)
                {
                  uint64_t v74 = (2 * v72) | 1;
                  uint64_t v75 = (char *)(v10 + 376 * v74);
                  if (2 * v72 + 2 < v12)
                  {
                    int v76 = *(_DWORD *)(v10 + 376 * v74 + 368);
                    int v77 = *((_DWORD *)v75 + 186);
                    if (v76 < v77 || v76 <= v77 && *(double *)(v10 + 376 * v74 + 360) < *((double *)v75 + 92))
                    {
                      v75 += 376;
                      uint64_t v74 = 2 * v72 + 2;
                    }
                  }
                  int v78 = *((_DWORD *)v75 + 92);
                  int v79 = *(_DWORD *)(v10 + 376 * v73 + 368);
                  if (v78 >= v79 && (v78 > v79 || *((double *)v75 + 45) >= *(double *)(v10 + 376 * v73 + 360)))
                  {
                    uint64_t v80 = v10 + 376 * v73;
                    char v151 = *(unsigned char *)v80;
                    int64_t v139 = v73;
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v152, v80 + 8);
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v153, v80 + 72);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v154, v80 + 136);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v155, v80 + 248);
                    double v81 = *(double *)(v80 + 360);
                    int v157 = *(_DWORD *)(v80 + 368);
                    double v156 = v81;
                    while (1)
                    {
                      uint64_t v82 = (double *)v75;
                      *(unsigned char *)uint64_t v80 = *v75;
                      uint64_t v83 = (uint64_t)(v75 + 8);
                      cnmatrix::CNMatrixBase<double>::operator=(v80 + 8, (uint64_t)(v75 + 8));
                      uint64_t v84 = (uint64_t)(v75 + 72);
                      cnmatrix::CNMatrixBase<double>::operator=(v80 + 72, (uint64_t)(v75 + 72));
                      uint64_t v85 = (uint64_t)(v75 + 136);
                      cnmatrix::CNMatrixBase<double>::operator=(v80 + 136, (uint64_t)(v75 + 136));
                      uint64_t v86 = (uint64_t)(v75 + 248);
                      cnmatrix::CNMatrixBase<double>::operator=(v80 + 248, (uint64_t)(v75 + 248));
                      int v87 = *((_DWORD *)v75 + 92);
                      *(void *)(v80 + 360) = *((void *)v75 + 45);
                      *(_DWORD *)(v80 + 368) = v87;
                      if (v141 < v74) {
                        break;
                      }
                      uint64_t v88 = (2 * v74) | 1;
                      uint64_t v75 = &v143[376 * v88];
                      if (2 * v74 + 2 < v12)
                      {
                        int v89 = *(_DWORD *)&v143[376 * v88 + 368];
                        int v90 = *((_DWORD *)v75 + 186);
                        if (v89 < v90 || v89 <= v90 && *(double *)&v143[376 * v88 + 360] < *((double *)v75 + 92))
                        {
                          v75 += 376;
                          uint64_t v88 = 2 * v74 + 2;
                        }
                      }
                      int v91 = *((_DWORD *)v75 + 92);
                      if (v91 < v157) {
                        break;
                      }
                      uint64_t v80 = (uint64_t)v82;
                      uint64_t v74 = v88;
                      if (v91 <= v157)
                      {
                        uint64_t v80 = (uint64_t)v82;
                        uint64_t v74 = v88;
                        if (*((double *)v75 + 45) < v156) {
                          break;
                        }
                      }
                    }
                    *(unsigned char *)uint64_t v82 = v151;
                    cnmatrix::CNMatrixBase<double>::operator=(v83, (uint64_t)v152);
                    cnmatrix::CNMatrixBase<double>::operator=(v84, (uint64_t)v153);
                    cnmatrix::CNMatrixBase<double>::operator=(v85, (uint64_t)v154);
                    cnmatrix::CNMatrixBase<double>::operator=(v86, (uint64_t)v155);
                    int64_t v73 = v139;
                    int v92 = v157;
                    v82[45] = v156;
                    *((_DWORD *)v82 + 92) = v92;
                    uint64_t v10 = (uint64_t)v143;
                  }
                }
                int64_t v72 = v73 - 1;
              }
              while (v73);
              int64_t v93 = v11 / 0x178uLL;
              uint64_t v132 = v10 + 72;
              uint64_t v134 = v10 + 8;
              uint64_t v129 = v10 + 248;
              uint64_t v130 = v10 + 136;
              uint64_t v128 = v10 + 360;
              double v94 = (unsigned char *)v142;
              do
              {
                int v137 = v94;
                char v144 = *(unsigned char *)v10;
                cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v145, v134);
                cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v146, v132);
                cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v147, v130);
                cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v148, v129);
                uint64_t v95 = 0;
                uint64_t v96 = *(void *)v128;
                int v150 = *(_DWORD *)(v128 + 8);
                uint64_t v149 = v96;
                int v97 = (char *)v10;
                do
                {
                  int v98 = v97;
                  uint64_t v99 = v95 + 1;
                  v97 += 376 * v95 + 376;
                  uint64_t v100 = 2 * v95;
                  uint64_t v95 = (2 * v95) | 1;
                  int64_t v101 = v100 + 2;
                  if (v101 < v93)
                  {
                    int v102 = *(_DWORD *)&v98[376 * v99 + 368];
                    int v103 = *((_DWORD *)v97 + 186);
                    if (v102 < v103 || v102 <= v103 && *(double *)&v98[376 * v99 + 360] < *((double *)v97 + 92))
                    {
                      v97 += 376;
                      uint64_t v95 = v101;
                    }
                  }
                  char *v98 = *v97;
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v98 + 8), (uint64_t)(v97 + 8));
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v98 + 72), (uint64_t)(v97 + 72));
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v98 + 136), (uint64_t)(v97 + 136));
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v98 + 248), (uint64_t)(v97 + 248));
                  int v104 = *((_DWORD *)v97 + 92);
                  *((void *)v98 + 45) = *((void *)v97 + 45);
                  *((_DWORD *)v98 + 92) = v104;
                }
                while (v95 <= (uint64_t)((unint64_t)(v93 - 2) >> 1));
                double v105 = v97 + 360;
                double v94 = v137 - 376;
                if (v97 == v137 - 376)
                {
                  *int v97 = v144;
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 8), (uint64_t)v145);
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 72), (uint64_t)v146);
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 136), (uint64_t)v147);
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 248), (uint64_t)v148);
                  int v117 = v150;
                  *double v105 = v149;
                  *((_DWORD *)v97 + 92) = v117;
                  uint64_t v10 = (uint64_t)v143;
                }
                else
                {
                  *int v97 = *v94;
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 8), (uint64_t)(v137 - 368));
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 72), (uint64_t)(v137 - 304));
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 136), (uint64_t)(v137 - 240));
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 248), (uint64_t)(v137 - 128));
                  uint64_t v106 = *((void *)v137 - 2);
                  *((_DWORD *)v97 + 92) = *((_DWORD *)v137 - 2);
                  uint64_t v127 = (double *)(v97 + 360);
                  *double v105 = v106;
                  *double v94 = v144;
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v137 - 368), (uint64_t)v145);
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v137 - 304), (uint64_t)v146);
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v137 - 240), (uint64_t)v147);
                  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v137 - 128), (uint64_t)v148);
                  int v107 = v150;
                  *((void *)v137 - 2) = v149;
                  *((_DWORD *)v137 - 2) = v107;
                  uint64_t v10 = (uint64_t)v143;
                  uint64_t v108 = v97 - v143 + 376;
                  if (v108 >= 377)
                  {
                    unint64_t v109 = (v108 / 0x178uLL - 2) >> 1;
                    int v110 = *(_DWORD *)&v143[376 * v109 + 368];
                    int v111 = *((_DWORD *)v97 + 92);
                    if (v110 < v111 || v110 <= v111 && *(double *)&v143[376 * v109 + 360] < *v127)
                    {
                      char v151 = *v97;
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v152, (uint64_t)(v97 + 8));
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v153, (uint64_t)(v97 + 72));
                      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v154, (uint64_t)(v97 + 136));
                      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v155, (uint64_t)(v97 + 248));
                      double v112 = *v127;
                      int v157 = *((_DWORD *)v97 + 92);
                      double v156 = v112;
                      do
                      {
                        uint64_t v113 = v97;
                        int v97 = &v143[376 * v109];
                        *uint64_t v113 = *v97;
                        cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v113 + 8), (uint64_t)(v97 + 8));
                        cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v113 + 72), (uint64_t)(v97 + 72));
                        cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v113 + 136), (uint64_t)(v97 + 136));
                        cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v113 + 248), (uint64_t)(v97 + 248));
                        int v114 = *((_DWORD *)v97 + 92);
                        *((void *)v113 + 45) = *((void *)v97 + 45);
                        *((_DWORD *)v113 + 92) = v114;
                        if (!v109) {
                          break;
                        }
                        unint64_t v109 = (v109 - 1) >> 1;
                        int v115 = *(_DWORD *)&v143[376 * v109 + 368];
                      }
                      while (v115 < v157 || v115 <= v157 && *(double *)&v143[376 * v109 + 360] < v156);
                      *int v97 = v151;
                      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 8), (uint64_t)v152);
                      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 72), (uint64_t)v153);
                      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 136), (uint64_t)v154);
                      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v97 + 248), (uint64_t)v155);
                      int v116 = v157;
                      *((double *)v97 + 45) = v156;
                      *((_DWORD *)v97 + 92) = v116;
                      double v94 = v137 - 376;
                    }
                  }
                }
              }
              while (v93-- > 2);
            }
            return;
          }
          unint64_t v13 = (unint64_t)v12 >> 1;
          uint64_t v14 = (char *)(v10 + 376 * ((unint64_t)v12 >> 1));
          if ((unint64_t)v11 < 0xBC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>((uint64_t)v14, v10, (uint64_t)v140);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v10, (uint64_t)v14, (uint64_t)v140);
            uint64_t v15 = 376 * v13;
            uint64_t v16 = 376 * v13 + v10 - 376;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v10 + 376, v16, v133);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v10 + 752, v10 + 376 + v15, v131);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v16, (uint64_t)v14, v10 + 376 + v15);
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)v10, v14);
          }
          --a3;
          if (a4) {
            break;
          }
          int v17 = *(_DWORD *)(v10 - 8);
          int v18 = *(_DWORD *)(v10 + 368);
          if (v17 < v18 || v17 <= v18 && *(double *)(v10 - 16) < *(double *)(v10 + 360)) {
            break;
          }
          char v151 = *(unsigned char *)v10;
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v152, v10 + 8);
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v153, v10 + 72);
          cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v154, v10 + 136);
          cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v155, v10 + 248);
          double v43 = *(double *)(v10 + 360);
          int v157 = *(_DWORD *)(v10 + 368);
          double v156 = v43;
          int v44 = *((_DWORD *)a2 - 2);
          if (v157 < v44 || v157 <= v44 && v156 < *((double *)a2 - 2))
          {
            int v45 = *(_DWORD *)(v10 + 744);
            if (v157 >= v45)
            {
              uint64_t v47 = v10 + 736;
              do
              {
                if (v157 <= v45 && v156 < *(double *)v47) {
                  break;
                }
                int v45 = *(_DWORD *)(v47 + 384);
                v47 += 376;
              }
              while (v157 >= v45);
              unint64_t k = v47 - 360;
            }
            else
            {
              unint64_t k = v10 + 376;
            }
          }
          else
          {
            for (unint64_t k = v10 + 376; k < (unint64_t)a2; k += 376)
            {
              int v46 = *(_DWORD *)(k + 368);
              if (v157 < v46 || v157 <= v46 && v156 < *(double *)(k + 360)) {
                break;
              }
            }
          }
          unint64_t v48 = (unint64_t)a2;
          if (k < (unint64_t)a2)
          {
            for (m = (double *)v135; v157 < v44 || v157 <= v44 && v156 < m[46]; m -= 47)
              int v44 = *(_DWORD *)m;
            unint64_t v48 = (unint64_t)(m + 1);
          }
          while (k < v48)
          {
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)k, (char *)v48);
            int v50 = *(_DWORD *)(k + 744);
            if (v157 >= v50)
            {
              unint64_t v51 = k + 736;
              do
              {
                if (v157 <= v50 && v156 < *(double *)v51) {
                  break;
                }
                int v50 = *(_DWORD *)(v51 + 384);
                v51 += 376;
              }
              while (v157 >= v50);
              unint64_t k = v51 - 360;
            }
            else
            {
              k += 376;
            }
            do
            {
              do
              {
                v48 -= 376;
                int v52 = *(_DWORD *)(v48 + 368);
              }
              while (v157 < v52);
            }
            while (v157 <= v52 && v156 < *(double *)(v48 + 360));
          }
          double v53 = (char *)(k - 376);
          if (k - 376 != v10)
          {
            *(unsigned char *)uint64_t v10 = *v53;
            cnmatrix::CNMatrixBase<double>::operator=(v10 + 8, k - 368);
            cnmatrix::CNMatrixBase<double>::operator=(v10 + 72, k - 304);
            cnmatrix::CNMatrixBase<double>::operator=(v10 + 136, k - 240);
            cnmatrix::CNMatrixBase<double>::operator=(v10 + 248, k - 128);
            int v54 = *(_DWORD *)(k - 8);
            *(void *)(v10 + 360) = *(void *)(k - 16);
            *(_DWORD *)(v10 + 368) = v54;
          }
          *double v53 = v151;
          cnmatrix::CNMatrixBase<double>::operator=(k - 368, (uint64_t)v152);
          cnmatrix::CNMatrixBase<double>::operator=(k - 304, (uint64_t)v153);
          cnmatrix::CNMatrixBase<double>::operator=(k - 240, (uint64_t)v154);
          cnmatrix::CNMatrixBase<double>::operator=(k - 128, (uint64_t)v155);
          a4 = 0;
          int v55 = v157;
          *(double *)(k - 16) = v156;
          *(_DWORD *)(k - 8) = v55;
        }
        uint64_t v138 = a3;
        char v151 = *(unsigned char *)v10;
        uint64_t v19 = v10 + 8;
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v152, v10 + 8);
        uint64_t v20 = v10 + 72;
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v153, v10 + 72);
        uint64_t v21 = v10 + 136;
        cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v154, v10 + 136);
        uint64_t v22 = v10 + 248;
        cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v155, v10 + 248);
        uint64_t v23 = 0;
        uint64_t v24 = v10 + 360;
        double v25 = *(double *)(v10 + 360);
        int v157 = *(_DWORD *)(v10 + 368);
        double v156 = v25;
        while (1)
        {
          int v26 = *(_DWORD *)(v10 + v23 + 744);
          if (v26 >= v157 && (v26 > v157 || *(double *)(v10 + v23 + 736) >= v156)) {
            break;
          }
          v23 += 376;
        }
        unint64_t v27 = v10 + v23 + 376;
        if (v23)
        {
          unint64_t v28 = v140;
          int v29 = *(_DWORD *)(v142 - 8);
          double v30 = v135;
          if (v29 >= v157)
          {
            do
            {
              if (v29 <= v157 && *((double *)v30 + 46) < v156) {
                break;
              }
              int v29 = *(_DWORD *)v30;
              v30 -= 376;
            }
            while (v29 >= v157);
LABEL_23:
            unint64_t v28 = v30 + 8;
          }
        }
        else
        {
          unint64_t v28 = (char *)v142;
          if (v27 < v142)
          {
            unint64_t v28 = v140;
            int v31 = *(_DWORD *)(v142 - 8);
            if (v31 >= v157)
            {
              double v30 = v135;
              unint64_t v28 = v140;
              while (1)
              {
                unint64_t v41 = (unint64_t)(v30 + 8);
                if (v31 <= v157)
                {
                  if (*((double *)v30 + 46) < v156 || v27 >= v41) {
                    break;
                  }
                }
                else if (v27 >= v41)
                {
                  goto LABEL_23;
                }
                v28 -= 376;
                int v31 = *(_DWORD *)v30;
                v30 -= 376;
                if (v31 < v157) {
                  goto LABEL_23;
                }
              }
            }
          }
        }
        unint64_t k = v27;
        if (v27 < (unint64_t)v28)
        {
          double v32 = v28;
          do
          {
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)k, v32);
            do
            {
              do
              {
                k += 376;
                int v33 = *(_DWORD *)(k + 368);
              }
              while (v33 < v157);
            }
            while (v33 <= v157 && *(double *)(k + 360) < v156);
            int v34 = *((_DWORD *)v32 - 2);
            if (v34 >= v157)
            {
              __n128 v35 = v32 - 384;
              do
              {
                if (v34 <= v157 && *((double *)v35 + 46) < v156) {
                  break;
                }
                int v34 = *(_DWORD *)v35;
                v35 -= 376;
              }
              while (v34 >= v157);
              double v32 = v35 + 8;
            }
            else
            {
              v32 -= 376;
            }
          }
          while (k < (unint64_t)v32);
        }
        int v36 = (char *)(k - 376);
        a1 = v143;
        if ((char *)(k - 376) != v143)
        {
          *uint64_t v143 = *v36;
          cnmatrix::CNMatrixBase<double>::operator=(v19, k - 368);
          cnmatrix::CNMatrixBase<double>::operator=(v20, k - 304);
          cnmatrix::CNMatrixBase<double>::operator=(v21, k - 240);
          cnmatrix::CNMatrixBase<double>::operator=(v22, k - 128);
          int v37 = *(_DWORD *)(k - 8);
          *(void *)uint64_t v24 = *(void *)(k - 16);
          *(_DWORD *)(v24 + 8) = v37;
        }
        char *v36 = v151;
        cnmatrix::CNMatrixBase<double>::operator=(k - 368, (uint64_t)v152);
        cnmatrix::CNMatrixBase<double>::operator=(k - 304, (uint64_t)v153);
        cnmatrix::CNMatrixBase<double>::operator=(k - 240, (uint64_t)v154);
        __n128 v38 = cnmatrix::CNMatrixBase<double>::operator=(k - 128, (uint64_t)v155);
        a3 = v138;
        int v39 = v157;
        *(double *)(k - 16) = v156;
        *(_DWORD *)(k - 8) = v39;
        a2 = (char *)v142;
        if (v27 >= (unint64_t)v28) {
          break;
        }
LABEL_45:
        std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(v143, k - 376, v138, a4 & 1, v38);
        a4 = 0;
      }
      BOOL v40 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>((uint64_t)v143, k - 376);
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(k, v142))
      {
        break;
      }
      if (!v40) {
        goto LABEL_45;
      }
    }
    a2 = (char *)(k - 376);
    if (!v40) {
      continue;
    }
    break;
  }
}

double std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,0>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a2, a3, a4);
  int v11 = *(_DWORD *)(a5 + 368);
  int v12 = *(_DWORD *)(a4 + 368);
  if (v11 < v12 || v11 <= v12 && (double result = *(double *)(a5 + 360), result < *(double *)(a4 + 360)))
  {
    std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a4, (char *)a5);
    int v13 = *(_DWORD *)(a4 + 368);
    int v14 = *(_DWORD *)(a3 + 368);
    if (v13 < v14 || v13 <= v14 && (double result = *(double *)(a4 + 360), result < *(double *)(a3 + 360)))
    {
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a3, (char *)a4);
      int v15 = *(_DWORD *)(a3 + 368);
      int v16 = *(_DWORD *)(a2 + 368);
      if (v15 < v16 || v15 <= v16 && (double result = *(double *)(a3 + 360), result < *(double *)(a2 + 360)))
      {
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a2, (char *)a3);
        int v17 = *(_DWORD *)(a2 + 368);
        int v18 = *(_DWORD *)(a1 + 368);
        if (v17 < v18 || v17 <= v18 && (double result = *(double *)(a2 + 360), result < *(double *)(a1 + 360)))
        {
          std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)a2);
        }
      }
    }
  }
  return result;
}

double std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  int v6 = *(_DWORD *)(a2 + 368);
  int v7 = *(_DWORD *)(a1 + 368);
  if (v6 < v7 || v6 <= v7 && (double result = *(double *)(a2 + 360), result < *(double *)(a1 + 360)))
  {
    int v9 = *(_DWORD *)(a3 + 368);
    if (v9 >= v6 && (v9 > v6 || *(double *)(a3 + 360) >= *(double *)(a2 + 360)))
    {
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)a2);
      int v14 = *(_DWORD *)(a3 + 368);
      int v15 = *(_DWORD *)(a2 + 368);
      if (v14 >= v15)
      {
        if (v14 > v15) {
          return result;
        }
        double result = *(double *)(a3 + 360);
        if (result >= *(double *)(a2 + 360)) {
          return result;
        }
      }
      a1 = a2;
    }
    int v13 = (char *)a3;
    goto LABEL_18;
  }
  int v10 = *(_DWORD *)(a3 + 368);
  if (v10 < v6 || v10 <= v6 && (double result = *(double *)(a3 + 360), result < *(double *)(a2 + 360)))
  {
    std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a2, (char *)a3);
    int v11 = *(_DWORD *)(a2 + 368);
    int v12 = *(_DWORD *)(v5 + 368);
    if (v11 < v12 || v11 <= v12 && (double result = *(double *)(a2 + 360), result < *(double *)(v5 + 360)))
    {
      a1 = v5;
      int v13 = (char *)a2;
LABEL_18:
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, v13);
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0x51B3BEA3677D46CFLL * v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      int v6 = *(_DWORD *)(a2 - 8);
      int v7 = *(_DWORD *)(a1 + 368);
      if (v6 < v7 || v6 <= v7 && *(double *)(a2 - 16) < *(double *)(a1 + 360))
      {
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)(a2 - 376));
        return 1;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a2 - 376);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a1 + 752, a2 - 376);
      return 1;
    case 5:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,0>(a1, a1 + 376, a1 + 752, a1 + 1128, a2 - 376);
      return 1;
    default:
      uint64_t v8 = a1 + 752;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a1 + 752);
      uint64_t v9 = a1 + 1128;
      if (a1 + 1128 == v2) {
        return 1;
      }
      uint64_t v10 = 0;
      int v11 = 0;
      uint64_t v18 = v2;
      break;
  }
  while (1)
  {
    int v12 = *(_DWORD *)(v9 + 368);
    int v13 = *(_DWORD *)(v8 + 368);
    if (v12 < v13 || v12 <= v13 && *(double *)(v9 + 360) < *(double *)(v8 + 360))
    {
      int v19 = v11;
      char v20 = *(unsigned char *)v9;
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v21, v9 + 8);
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v22, v9 + 72);
      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v23, v9 + 136);
      cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v24, v9 + 248);
      double v25 = *(double *)(v9 + 360);
      int v26 = *(_DWORD *)(v9 + 368);
      for (uint64_t i = v10; ; i -= 376)
      {
        uint64_t v15 = a1 + i;
        *(unsigned char *)(a1 + i + 1128) = *(unsigned char *)(a1 + i + 752);
        uint64_t v16 = a1 + i + 760;
        cnmatrix::CNMatrixBase<double>::operator=(a1 + i + 1136, v16);
        cnmatrix::CNMatrixBase<double>::operator=(v15 + 1200, v15 + 824);
        cnmatrix::CNMatrixBase<double>::operator=(v15 + 1264, v15 + 888);
        cnmatrix::CNMatrixBase<double>::operator=(v15 + 1376, v15 + 1000);
        *(void *)(v15 + 1488) = *(void *)(v15 + 1112);
        *(_DWORD *)(v15 + 1496) = *(_DWORD *)(v15 + 1120);
        if (i == -752) {
          break;
        }
        int v17 = *(_DWORD *)(v15 + 744);
        if (v26 >= v17)
        {
          if (v26 > v17)
          {
            uint64_t v8 = a1 + i + 752;
            goto LABEL_19;
          }
          if (v25 >= *(double *)(a1 + i + 736)) {
            goto LABEL_19;
          }
        }
        v8 -= 376;
      }
      uint64_t v8 = a1;
LABEL_19:
      uint64_t v2 = v18;
      *(unsigned char *)uint64_t v8 = v20;
      cnmatrix::CNMatrixBase<double>::operator=(v16, (uint64_t)v21);
      cnmatrix::CNMatrixBase<double>::operator=(v15 + 824, (uint64_t)v22);
      cnmatrix::CNMatrixBase<double>::operator=(v15 + 888, (uint64_t)v23);
      cnmatrix::CNMatrixBase<double>::operator=(v15 + 1000, (uint64_t)v24);
      *(double *)(v15 + 1112) = v25;
      *(_DWORD *)(v15 + 1120) = v26;
      int v11 = v19 + 1;
      if (v19 == 7) {
        return v9 + 376 == v18;
      }
    }
    uint64_t v8 = v9;
    v10 += 376;
    v9 += 376;
    if (v9 == v2) {
      return 1;
    }
  }
}

double std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a2, a3);
  int v9 = *(_DWORD *)(a4 + 368);
  int v10 = *(_DWORD *)(a3 + 368);
  if (v9 < v10 || v9 <= v10 && (double result = *(double *)(a4 + 360), result < *(double *)(a3 + 360)))
  {
    std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a3, (char *)a4);
    int v11 = *(_DWORD *)(a3 + 368);
    int v12 = *(_DWORD *)(a2 + 368);
    if (v11 < v12 || v11 <= v12 && (double result = *(double *)(a3 + 360), result < *(double *)(a2 + 360)))
    {
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a2, (char *)a3);
      int v13 = *(_DWORD *)(a2 + 368);
      int v14 = *(_DWORD *)(a1 + 368);
      if (v13 < v14 || v13 <= v14 && (double result = *(double *)(a2 + 360), result < *(double *)(a1 + 360)))
      {
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)a2);
      }
    }
  }
  return result;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__construct_one_at_end[abi:ne180100]<cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,double &,RoseSyntheticApertureFiltering::BatchSolutionType const&,cnmatrix::CNMatrix<3u,1u,double>&>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double *a6, int *a7, uint64_t a8)
{
  uint64_t v13 = *(void *)(a1 + 8);
  double v14 = *a6;
  int v15 = *a7;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v17, a8);
  uint64_t result = RoseSyntheticApertureFiltering::InternalFilterState::InternalFilterState(v13, a2, a3, a4, a5, v15, (uint64_t)v17, v14);
  *(void *)(a1 + 8) = v13 + 432;
  return result;
}

void sub_230EDF504(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__emplace_back_slow_path<cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,double &,RoseSyntheticApertureFiltering::BatchSolutionType const&,cnmatrix::CNMatrix<3u,1u,double>&>(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double *a6, int *a7, uint64_t a8)
{
  uint64_t v9 = *a1;
  unint64_t v10 = 0x84BDA12F684BDA13 * ((a1[1] - *a1) >> 4);
  unint64_t v11 = v10 + 1;
  if (v10 + 1 > 0x97B425ED097B42) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v19 = (uint64_t)(a1 + 2);
  unint64_t v20 = 0x84BDA12F684BDA13 * ((a1[2] - v9) >> 4);
  if (2 * v20 > v11) {
    unint64_t v11 = 2 * v20;
  }
  if (v20 >= 0x4BDA12F684BDA1) {
    unint64_t v21 = 0x97B425ED097B42;
  }
  else {
    unint64_t v21 = v11;
  }
  int v31 = a1 + 2;
  if (v21) {
    uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>>(v19, v21);
  }
  else {
    uint64_t v22 = 0;
  }
  unint64_t v27 = v22;
  unint64_t v28 = &v22[432 * v10];
  uint64_t v29 = (uint64_t)v28;
  double v30 = &v22[432 * v21];
  double v23 = *a6;
  int v24 = *a7;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v32, a8);
  RoseSyntheticApertureFiltering::InternalFilterState::InternalFilterState((uint64_t)v28, a2, a3, a4, a5, v24, (uint64_t)v32, v23);
  uint64_t v29 = (uint64_t)(v28 + 432);
  std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__swap_out_circular_buffer(a1, &v27);
  uint64_t v25 = a1[1];
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalFilterState>::~__split_buffer((uint64_t)&v27);
  return v25;
}

void sub_230EDF67C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalFilterState>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t RoseSyntheticApertureFiltering::InternalFilterState::InternalFilterState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, double a8)
{
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a1, a2);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v15 + 64, a3);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a1 + 128, a4);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a1 + 240, a5);
  *(double *)(a1 + 352) = a8;
  *(_DWORD *)(a1 + 360) = a6;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a1 + 368, a7);
  return a1;
}

void sub_230EDF734(_Unwind_Exception *a1)
{
  *uint64_t v4 = &unk_26E5D3870;
  void *v3 = &unk_26E5D3870;
  void *v2 = &unk_26E5D3870;
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x97B425ED097B43) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(432 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  char v14 = 0;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      v9 -= 432;
      std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalFilterState,RoseSyntheticApertureFiltering::InternalFilterState const&>(a1, v7 - 432, v9);
      uint64_t v7 = *((void *)&v16 + 1) - 432;
      *((void *)&v16 + 1) -= 432;
    }
    while (v9 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

void sub_230EDF930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

double std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalFilterState,RoseSyntheticApertureFiltering::InternalFilterState const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a2, a3);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a2 + 64, a3 + 64);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 128, a3 + 128);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 240, a3 + 240);
  uint64_t v5 = *(void *)(a3 + 352);
  *(_DWORD *)(a2 + 360) = *(_DWORD *)(a3 + 360);
  *(void *)(a2 + 352) = v5;
  *(void *)&double result = cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a2 + 368, a3 + 368).n128_u64[0];
  return result;
}

void sub_230EDF9D0(_Unwind_Exception *a1)
{
  *uint64_t v4 = &unk_26E5D3870;
  void *v3 = &unk_26E5D3870;
  void *v2 = &unk_26E5D3870;
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  std::__allocator_destroy[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>,std::reverse_iterator<std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>>(v4, (uint64_t)v13, (uint64_t)v8);
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>,std::reverse_iterator<std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 32);
  if (v3 != *(void *)(a3 + 32))
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = (void *)(v3 + v4);
      v5[46] = &unk_26E5D3870;
      v5[30] = &unk_26E5D3870;
      v5[16] = &unk_26E5D3870;
      v5[8] = &unk_26E5D3870;
      *uint64_t v5 = &unk_26E5D3870;
      *(void *)(a2 + 32) = v3 + v4 + 432;
      v4 += 432;
    }
    while (v3 + v4 != *(void *)(a3 + 32));
  }
}

uint64_t std::__split_buffer<RoseSyntheticApertureFiltering::InternalFilterState>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__split_buffer<RoseSyntheticApertureFiltering::InternalFilterState>::__destruct_at_end[abi:ne180100](uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2 != a2)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = v2 + v3;
      *(void *)(v4 - 64) = &unk_26E5D3870;
      *(void *)(v4 - 192) = &unk_26E5D3870;
      *(void *)(v2 + v3 - 304) = &unk_26E5D3870;
      *(void *)(v2 + v3 - 368) = &unk_26E5D3870;
      *(void *)(v2 + v3 - 432) = &unk_26E5D3870;
      v3 -= 432;
    }
    while (v2 + v3 != a2);
    *(void *)(result + 16) = a2;
  }
  return result;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x155555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(192 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  for (uint64_t i = 0;
        a3 + i != a5;
        std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas,RoseSyntheticApertureFiltering::InternalExpectedAoAMeas const&>(a1, (_OWORD *)(i + a7), (_OWORD *)(i + a3)))
  {
    i -= 192;
  }
  return a6;
}

double std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas,RoseSyntheticApertureFiltering::InternalExpectedAoAMeas const&>(uint64_t a1, _OWORD *a2, _OWORD *a3)
{
  *a2 = *a3;
  cnmatrix::CNMatrix<2u,3u,double>::CNMatrix((uint64_t)(a2 + 1), (uint64_t)(a3 + 1));
  *(void *)&double result = cnmatrix::CNMatrix<3u,2u,double>::CNMatrix((uint64_t)a2 + 104, (uint64_t)a3 + 104).n128_u64[0];
  return result;
}

void sub_230EDFE7C(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

__n128 cnmatrix::CNMatrix<2u,3u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  result.n128_u64[0] = 0x300000002;
  *(void *)(a1 + 24) = 0x300000002;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26E5D3A00;
  if (a1 == a2)
  {
    uint64_t v16 = "this != &(A)";
    int v17 = 603;
LABEL_21:
    uint64_t v18 = "cnmatrix.h";
    uint64_t v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  unsigned int v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 2)
  {
    uint64_t v16 = "this->max_num_rows_ >= num_rows";
    int v17 = 422;
LABEL_18:
    uint64_t v18 = "cnmatrixbase.h";
    uint64_t v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  unsigned int v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 4)
  {
    uint64_t v16 = "this->max_num_cols_ >= num_cols";
    int v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  uint64_t v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  uint64_t v6 = (_OWORD *)(a1 + 40);
  *(void *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 2u)
  {
    uint64_t v16 = "this->max_num_rows_ >= A.num_rows_";
    int v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 3u)
  {
    uint64_t v16 = "this->max_num_cols_ >= A.num_cols_";
    int v17 = 617;
    goto LABEL_21;
  }
  int v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    uint64_t v10 = (v7 - 2);
    uint64_t v11 = *(long long **)(a2 + 32);
    uint64_t v12 = (__n128 *)((char *)v6 + 8 * v10);
    uint64_t v13 = (v7 - 1) >> 1;
    uint64_t v14 = v11;
    do
    {
      long long v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    __n128 result = *(__n128 *)((char *)v11 + 8 * v10);
    *uint64_t v12 = result;
  }
  else if (v5)
  {
    uint64_t v8 = *(unint64_t **)(a2 + 32);
    do
    {
      unint64_t v9 = *v8++;
      result.n128_u64[0] = v9;
      *(void *)uint64_t v6 = v9;
      uint64_t v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_230EE000C(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

__n128 cnmatrix::CNMatrix<3u,2u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  result.n128_u64[0] = 0x200000003;
  *(void *)(a1 + 24) = 0x200000003;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26E5D3A48;
  if (a1 == a2)
  {
    uint64_t v16 = "this != &(A)";
    int v17 = 603;
LABEL_21:
    uint64_t v18 = "cnmatrix.h";
    uint64_t v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  unsigned int v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 3)
  {
    uint64_t v16 = "this->max_num_rows_ >= num_rows";
    int v17 = 422;
LABEL_18:
    uint64_t v18 = "cnmatrixbase.h";
    uint64_t v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  unsigned int v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 3)
  {
    uint64_t v16 = "this->max_num_cols_ >= num_cols";
    int v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  uint64_t v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  uint64_t v6 = (_OWORD *)(a1 + 40);
  *(void *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 3u)
  {
    uint64_t v16 = "this->max_num_rows_ >= A.num_rows_";
    int v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 2u)
  {
    uint64_t v16 = "this->max_num_cols_ >= A.num_cols_";
    int v17 = 617;
    goto LABEL_21;
  }
  int v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    uint64_t v10 = (v7 - 2);
    uint64_t v11 = *(long long **)(a2 + 32);
    uint64_t v12 = (__n128 *)((char *)v6 + 8 * v10);
    uint64_t v13 = (v7 - 1) >> 1;
    uint64_t v14 = v11;
    do
    {
      long long v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    __n128 result = *(__n128 *)((char *)v11 + 8 * v10);
    *uint64_t v12 = result;
  }
  else if (v5)
  {
    uint64_t v8 = *(unint64_t **)(a2 + 32);
    do
    {
      unint64_t v9 = *v8++;
      result.n128_u64[0] = v9;
      *(void *)uint64_t v6 = v9;
      uint64_t v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_230EE019C(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::~__split_buffer(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3 != v2)
  {
    uint64_t v4 = v3 - 176;
    do
    {
      *(void *)(v3 - 88) = &unk_26E5D3870;
      *(void *)(v3 - 176) = &unk_26E5D3870;
      v4 -= 192;
      v3 -= 192;
    }
    while (v3 != v2);
    *(void *)(a1 + 16) = v2;
  }
  uint64_t v5 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v5);
  }
  return a1;
}

void cnmatrix::CNMatrix<1u,1u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<1u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<1u,1u,double>::TransposeDataFootprint(uint64_t a1)
{
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, &v1);
}

float64x2_t cnmatrix::Multiply<double>(uint64_t a1, uint64_t a2, double a3)
{
  if (a1 == a2) {
    cnmatrix::Multiply<double>();
  }
  cnmatrix::FastResize<double>((_DWORD *)a2, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  uint64_t v6 = *(unsigned int *)(a2 + 16);
  if ((int)v6 > 3)
  {
    uint64_t v10 = *(float64x2_t **)(a1 + 32);
    uint64_t v11 = *(float64x2_t **)(a2 + 32);
    uint64_t v12 = (float64x2_t *)((char *)v10 + 8 * (v6 - 2));
    uint64_t v13 = (float64x2_t *)((char *)v11 + 8 * (v6 - 2));
    uint64_t v14 = (v6 - 1) >> 1;
    do
    {
      float64x2_t v15 = *v10++;
      *v11++ = vmulq_n_f64(v15, a3);
      --v14;
    }
    while (v14);
    float64x2_t result = vmulq_n_f64(*v12, a3);
    *uint64_t v13 = result;
  }
  else if ((int)v6 >= 1)
  {
    int v7 = *(double **)(a1 + 32);
    uint64_t v8 = *(double **)(a2 + 32);
    do
    {
      double v9 = *v7++;
      result.f64[0] = v9 * a3;
      *v8++ = v9 * a3;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__emplace_back_slow_path<double const&,cnmatrix::CNMatrix<1u,3u,double> const&,cnmatrix::CNMatrix<3u,1u,double> &>(uint64_t *a1, double *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  unint64_t v6 = 0xF0F0F0F0F0F0F0F1 * ((a1[1] - *a1) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0x1E1E1E1E1E1E1E1) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v12 = 0xF0F0F0F0F0F0F0F1 * ((a1[2] - v5) >> 3);
  if (2 * v12 > v7) {
    unint64_t v7 = 2 * v12;
  }
  if (v12 >= 0xF0F0F0F0F0F0F0) {
    unint64_t v13 = 0x1E1E1E1E1E1E1E1;
  }
  else {
    unint64_t v13 = v7;
  }
  unint64_t v21 = a1 + 2;
  if (v13) {
    uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>>(v11, v13);
  }
  else {
    uint64_t v14 = 0;
  }
  int v17 = v14;
  uint64_t v18 = (double *)&v14[136 * v6];
  uint64_t v19 = v18;
  unint64_t v20 = &v14[136 * v13];
  RoseSyntheticApertureFiltering::InternalExpectedRangeMeas::InternalExpectedRangeMeas(v18, a3, a4, *a2);
  uint64_t v19 = v18 + 17;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__swap_out_circular_buffer(a1, &v17);
  uint64_t v15 = a1[1];
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::~__split_buffer((uint64_t)&v17);
  return v15;
}

void sub_230EE047C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

double *RoseSyntheticApertureFiltering::InternalExpectedRangeMeas::InternalExpectedRangeMeas(double *a1, uint64_t a2, uint64_t a3, double a4)
{
  *a1 = a4;
  uint64_t v6 = (uint64_t)(a1 + 9);
  cnmatrix::CNMatrix<1u,3u,double>::CNMatrix((uint64_t)(a1 + 1), a2);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v6, a3);
  return a1;
}

void sub_230EE04E0(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

void cnmatrix::CNMatrix<2u,1u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<2u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<2u,1u,double>::TransposeDataFootprint(uint64_t a1)
{
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__emplace_back_slow_path<double const&,double const&,cnmatrix::CNMatrix<2u,3u,double> const&,cnmatrix::CNMatrix<3u,2u,double> &>(uint64_t *a1, double *a2, double *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *a1;
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 6);
  unint64_t v8 = v7 + 1;
  if (v7 + 1 > 0x155555555555555) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v13 = (uint64_t)(a1 + 2);
  unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v6) >> 6);
  if (2 * v14 > v8) {
    unint64_t v8 = 2 * v14;
  }
  if (v14 >= 0xAAAAAAAAAAAAAALL) {
    unint64_t v15 = 0x155555555555555;
  }
  else {
    unint64_t v15 = v8;
  }
  double v23 = a1 + 2;
  if (v15) {
    uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>>(v13, v15);
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v19 = v16;
  unint64_t v20 = (double *)&v16[192 * v7];
  unint64_t v21 = v20;
  uint64_t v22 = &v16[192 * v15];
  RoseSyntheticApertureFiltering::InternalExpectedAoAMeas::InternalExpectedAoAMeas(v20, a4, a5, *a2, *a3);
  unint64_t v21 = v20 + 24;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__swap_out_circular_buffer(a1, &v19);
  uint64_t v17 = a1[1];
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::~__split_buffer((uint64_t)&v19);
  return v17;
}

void sub_230EE0674(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

double *RoseSyntheticApertureFiltering::InternalExpectedAoAMeas::InternalExpectedAoAMeas(double *a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  *a1 = a4;
  a1[1] = a5;
  cnmatrix::CNMatrix<2u,3u,double>::CNMatrix((uint64_t)(a1 + 2), a2);
  cnmatrix::CNMatrix<3u,2u,double>::CNMatrix((uint64_t)(a1 + 13), a3);
  return a1;
}

void sub_230EE06D4(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

void std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  char v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = v4 - 56;
      unint64_t v7 = v4 - 56;
      unint64_t v8 = v4 - 56;
      do
      {
        double v9 = *(void (***)(char *))v8;
        v8 -= 56;
        (*v9)(v7);
        v6 -= 56;
        BOOL v10 = v7 == v2;
        unint64_t v7 = v8;
      }
      while (!v10);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(56 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  for (uint64_t i = 0; a3 + i != a5; cnmatrix::CNMatrix<2u,1u,double>::CNMatrix(i + a7, i + a3))
    i -= 56;
  return a6;
}

__n128 cnmatrix::CNMatrix<2u,1u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  result.n128_u64[0] = 0x100000002;
  *(void *)(a1 + 24) = 0x100000002;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26E5D3BA8;
  if (a1 == a2)
  {
    uint64_t v16 = "this != &(A)";
    int v17 = 603;
LABEL_21:
    uint64_t v18 = "cnmatrix.h";
    uint64_t v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  unsigned int v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 2)
  {
    uint64_t v16 = "this->max_num_rows_ >= num_rows";
    int v17 = 422;
LABEL_18:
    uint64_t v18 = "cnmatrixbase.h";
    uint64_t v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  unsigned int v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 2)
  {
    uint64_t v16 = "this->max_num_cols_ >= num_cols";
    int v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  uint64_t v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  uint64_t v6 = (_OWORD *)(a1 + 40);
  *(void *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 2u)
  {
    uint64_t v16 = "this->max_num_rows_ >= A.num_rows_";
    int v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 1u)
  {
    uint64_t v16 = "this->max_num_cols_ >= A.num_cols_";
    int v17 = 617;
    goto LABEL_21;
  }
  int v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    uint64_t v10 = (v7 - 2);
    uint64_t v11 = *(long long **)(a2 + 32);
    unint64_t v12 = (__n128 *)((char *)v6 + 8 * v10);
    uint64_t v13 = (v7 - 1) >> 1;
    unint64_t v14 = v11;
    do
    {
      long long v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    __n128 result = *(__n128 *)((char *)v11 + 8 * v10);
    *unint64_t v12 = result;
  }
  else if (v5)
  {
    uint64_t v8 = *(unint64_t **)(a2 + 32);
    do
    {
      unint64_t v9 = *v8++;
      result.n128_u64[0] = v9;
      *(void *)uint64_t v6 = v9;
      uint64_t v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_230EE0A74(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<cnmatrix::CNMatrix<2u,1u,double>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    unsigned int v4 = *(void (***)(void))(i - 56);
    *(void *)(a1 + 16) = i - 56;
    (*v4)();
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__push_back_slow_path<cnmatrix::CNMatrix<2u,1u,double> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x492492492492492) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x249249249249249) {
    unint64_t v9 = 0x492492492492492;
  }
  else {
    unint64_t v9 = v5;
  }
  int v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v13 = v10;
  unint64_t v14 = &v10[56 * v4];
  uint64_t v16 = &v10[56 * v9];
  cnmatrix::CNMatrix<2u,1u,double>::CNMatrix((uint64_t)v14, a2);
  long long v15 = v14 + 56;
  std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<cnmatrix::CNMatrix<2u,1u,double>>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_230EE0C0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<cnmatrix::CNMatrix<2u,1u,double>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *cnmatrix::CNMatrix<225u,1u,double>::~CNMatrix(void *result)
{
  *__n128 result = &unk_26E5D3870;
  return result;
}

void cnmatrix::CNMatrix<225u,1u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<225u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<225u,1u,double>::TransposeDataFootprint(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

uint64_t cnmatrix::CNMatrix<2u,2u,double>::CNMatrix(uint64_t result, unsigned int a2, unsigned int a3)
{
  *(void *)(result + 24) = 0x200000002;
  *(void *)(result + 32) = 0;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(void *)__n128 result = &unk_26E5D3C38;
  if (a2 > 2)
  {
    uint64_t v3 = "this->max_num_rows_ >= num_rows";
    int v4 = 422;
    goto LABEL_6;
  }
  if (a3 >= 3)
  {
    uint64_t v3 = "this->max_num_cols_ >= num_cols";
    int v4 = 423;
LABEL_6:
    __assert_rtn("SetMatrixSize", "cnmatrixbase.h", v4, v3);
  }
  *(_DWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 12) = a3;
  *(_DWORD *)(result + 16) = a3 * a2;
  *(_DWORD *)(result + 20) = a2;
  *(void *)(result + 32) = result + 40;
  return result;
}

void sub_230EE0D7C(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

void cnmatrix::CNMatrix<2u,2u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<2u,2u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<2u,2u,double>::TransposeDataFootprint(uint64_t a1)
{
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

uint64_t cnmatrix::CNMatrix<1u,2u,double>::CNMatrix(uint64_t result, unsigned int a2, unsigned int a3)
{
  *(void *)(result + 24) = 0x200000001;
  *(void *)(result + 32) = 0;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(void *)__n128 result = &unk_26E5D3C80;
  if (a2 > 1)
  {
    uint64_t v3 = "this->max_num_rows_ >= num_rows";
    int v4 = 422;
    goto LABEL_6;
  }
  if (a3 >= 3)
  {
    uint64_t v3 = "this->max_num_cols_ >= num_cols";
    int v4 = 423;
LABEL_6:
    __assert_rtn("SetMatrixSize", "cnmatrixbase.h", v4, v3);
  }
  *(_DWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 12) = a3;
  *(_DWORD *)(result + 16) = a3 * a2;
  *(_DWORD *)(result + 20) = a2;
  *(void *)(result + 32) = result + 40;
  return result;
}

void sub_230EE0EA8(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

void cnmatrix::CNMatrix<1u,2u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<1u,2u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<1u,2u,double>::TransposeDataFootprint(uint64_t a1)
{
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

double cnmatrix::Eig<double>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1 == a2) {
    cnmatrix::Eig<double>();
  }
  if (a1 == a3) {
    cnmatrix::Eig<double>();
  }
  if (a1 == a4) {
    cnmatrix::Eig<double>();
  }
  if (a1 == a5) {
    cnmatrix::Eig<double>();
  }
  if (a1 == a6) {
    cnmatrix::Eig<double>();
  }
  if (a1 == a7) {
    cnmatrix::Eig<double>();
  }
  if (a1 == a8) {
    cnmatrix::Eig<double>();
  }
  if (a1 == a9) {
    cnmatrix::Eig<double>();
  }
  if (a2 == a3) {
    cnmatrix::Eig<double>();
  }
  if (a2 == a4) {
    cnmatrix::Eig<double>();
  }
  if (a2 == a5) {
    cnmatrix::Eig<double>();
  }
  if (a2 == a6) {
    cnmatrix::Eig<double>();
  }
  if (a2 == a7) {
    cnmatrix::Eig<double>();
  }
  if (a2 == a8) {
    cnmatrix::Eig<double>();
  }
  if (a2 == a9) {
    cnmatrix::Eig<double>();
  }
  if (a3 == a4) {
    cnmatrix::Eig<double>();
  }
  if (a3 == a5) {
    cnmatrix::Eig<double>();
  }
  if (a3 == a6) {
    cnmatrix::Eig<double>();
  }
  if (a3 == a7) {
    cnmatrix::Eig<double>();
  }
  if (a3 == a8) {
    cnmatrix::Eig<double>();
  }
  if (a3 == a9) {
    cnmatrix::Eig<double>();
  }
  if (a4 == a5) {
    cnmatrix::Eig<double>();
  }
  if (a4 == a6) {
    cnmatrix::Eig<double>();
  }
  if (a4 == a7) {
    cnmatrix::Eig<double>();
  }
  if (a4 == a8) {
    cnmatrix::Eig<double>();
  }
  if (a4 == a9) {
    cnmatrix::Eig<double>();
  }
  if (a5 == a6) {
    cnmatrix::Eig<double>();
  }
  if (a5 == a7) {
    cnmatrix::Eig<double>();
  }
  if (a5 == a8) {
    cnmatrix::Eig<double>();
  }
  if (a5 == a9) {
    cnmatrix::Eig<double>();
  }
  if (a6 == a7) {
    cnmatrix::Eig<double>();
  }
  if (a6 == a8) {
    cnmatrix::Eig<double>();
  }
  if (a6 == a9) {
    cnmatrix::Eig<double>();
  }
  if (a7 == a8) {
    cnmatrix::Eig<double>();
  }
  if (a7 == a9) {
    cnmatrix::Eig<double>();
  }
  if (a8 == a9) {
    cnmatrix::Eig<double>();
  }
  uint64_t v16 = *(unsigned int *)(a1 + 8);
  if (v16 != *(_DWORD *)(a1 + 12)) {
    cnmatrix::Eig<double>();
  }
  unsigned int v17 = *(_DWORD *)(a7 + 24);
  if (*(_DWORD *)(a7 + 28) * v17 < v16) {
    cnmatrix::Eig<double>();
  }
  unsigned int v18 = *(_DWORD *)(a8 + 24);
  if (*(_DWORD *)(a8 + 28) * v18 < v16) {
    cnmatrix::Eig<double>();
  }
  unsigned int v44 = *(_DWORD *)(a9 + 28) * *(_DWORD *)(a9 + 24);
  if (v44 < 3 * (int)v16) {
    cnmatrix::Eig<double>();
  }
  if (*(_DWORD *)(a2 + 24) < v16) {
    cnmatrix::Eig<double>();
  }
  if (*(_DWORD *)(a2 + 28) < v16) {
    cnmatrix::Eig<double>();
  }
  if (*(_DWORD *)(a3 + 24) < v16) {
    cnmatrix::Eig<double>();
  }
  if (*(_DWORD *)(a3 + 28) < v16) {
    cnmatrix::Eig<double>();
  }
  if (*(_DWORD *)(a4 + 24) < v16) {
    cnmatrix::Eig<double>();
  }
  if (*(_DWORD *)(a4 + 28) < v16) {
    cnmatrix::Eig<double>();
  }
  if (*(_DWORD *)(a5 + 24) < v16) {
    cnmatrix::Eig<double>();
  }
  if (*(_DWORD *)(a5 + 28) < v16) {
    cnmatrix::Eig<double>();
  }
  if (*(_DWORD *)(a6 + 24) < v16) {
    cnmatrix::Eig<double>();
  }
  if (*(_DWORD *)(a6 + 28) < v16) {
    cnmatrix::Eig<double>();
  }
  if (v17 < v16) {
    cnmatrix::Eig<double>();
  }
  if (v18 < v16) {
    cnmatrix::Eig<double>();
  }
  cnmatrix::CNMatrixBase<double>::operator=(a2, a1);
  cnmatrix::FastResize<double>((_DWORD *)a3, v16, v16);
  cnmatrix::CNMatrixBase<double>::WriteValue(a3, 0.0);
  cnmatrix::FastResize<double>((_DWORD *)a4, v16, v16);
  cnmatrix::CNMatrixBase<double>::WriteValue(a4, 0.0);
  cnmatrix::FastResize<double>((_DWORD *)a5, v16, v16);
  cnmatrix::CNMatrixBase<double>::WriteValue(a5, 0.0);
  cnmatrix::FastResize<double>((_DWORD *)a6, v16, v16);
  cnmatrix::CNMatrixBase<double>::WriteValue(a6, 0.0);
  uint64_t v19 = *(__CLPK_doublereal **)(a3 + 32);
  __wuint64_t i = *(__CLPK_doublereal **)(a4 + 32);
  __scale = *(__CLPK_doublereal **)(a7 + 32);
  __CLPK_doublereal v45 = 0.0;
  __rconde = *(__CLPK_doublereal **)(a8 + 32);
  __worunint64_t k = *(__CLPK_doublereal **)(a9 + 32);
  int v24 = *(__CLPK_doublereal **)(a2 + 32);
  __CLPK_integer v25 = *(_DWORD *)(a2 + 8);
  int v26 = *(__CLPK_doublereal **)(a5 + 32);
  __CLPK_integer v27 = *(_DWORD *)(a5 + 8);
  qmemcpy(__sense, "NVNB", 4);
  __CLPK_integer __lda = v25;
  __CLPK_integer __n = v16;
  __CLPK_integer __ldvr = v27;
  __CLPK_integer __ldvl = 1;
  *(void *)__ihuint64_t i = 0;
  __CLPK_integer v46 = 0;
  unsigned int v47 = v44;
  uint64_t v28 = dgeevx_(&__sense[3], &__sense[2], &__sense[1], __sense, &__n, v24, &__lda, v19, __wi, 0, &__ldvl, v26, &__ldvr, &__ihi[1], __ihi, __scale, &v45, __rconde, &__rconde[(int)v16],
          __work,
          (__CLPK_integer *)&v47,
          0,
          &v46);
  __CLPK_integer v29 = v46;
  if (v46)
  {
    LOWORD(__n) = 4;
    if (v46 < 0) {
      LOBYTE(__lda) = 5;
    }
    else {
      LOBYTE(__lda) = 4;
    }
    uint64_t v28 = cnprint::CNPrinter::Print();
  }
  if (v44 < **(double **)(a9 + 32)
    && cnprint::CNPrinter::GetLogLevel((cnprint::CNPrinter *)v28) <= 1)
  {
    LOWORD(__n) = 4;
    LOBYTE(__lda) = 1;
    cnprint::CNPrinter::Print();
  }
  if (v29) {
    cnmatrix::Eig<double>();
  }
  cnmatrix::FastResize<double>((_DWORD *)a9, *(_DWORD *)(a9 + 24), *(_DWORD *)(a9 + 28));
  cnmatrix::FastResize<double>((_DWORD *)a8, v16, 2);
  cnmatrix::FastResize<double>((_DWORD *)a7, v16, 1);
  if (v16)
  {
    unsigned int v31 = 0;
    uint64_t v32 = *(void *)(a4 + 32);
    uint64_t v33 = *(void *)(a5 + 32);
    uint64_t v34 = *(void *)(a6 + 32);
    do
    {
      double result = *(double *)(v32 + 8 * v31);
      if (result != 0.0)
      {
        unsigned int v35 = v31 * v16;
        unsigned int v36 = v16 + v31;
        uint64_t v37 = v16;
        do
        {
          *(void *)(v34 + 8 * v35) = *(void *)(v33 + 8 * v36);
          *(double *)(v34 + 8 * v36) = -*(double *)(v33 + 8 * v36);
          double result = *(double *)(v33 + 8 * v35++);
          *(double *)(v33 + 8 * v36++) = result;
          --v37;
        }
        while (v37);
        ++v31;
      }
      ++v31;
    }
    while (v31 < v16);
    if (v16 >= 2)
    {
      uint64_t v38 = *(void *)(a3 + 32);
      uint64_t v39 = *(void *)(a4 + 32);
      int v40 = v16 - 1;
      unint64_t v41 = (double *)(v39 + 8);
      double v42 = (void *)(v38 + 8);
      int v43 = v16 + 1;
      do
      {
        *(void *)(v38 + 8 * v43) = *v42;
        double result = *v41;
        *(double *)(v39 + 8 * v43) = *v41;
        *v42++ = 0;
        *v41++ = 0.0;
        v43 += v16 + 1;
        --v40;
      }
      while (v40);
    }
  }
  return result;
}

void *cnmatrix::CNMatrix<168u,1u,double>::~CNMatrix(void *result)
{
  *double result = &unk_26E5D3870;
  return result;
}

void cnmatrix::CNMatrix<168u,1u,double>::~CNMatrix(void *a1)
{
  *a1 = &unk_26E5D3870;
  JUMPOUT(0x230FCEC50);
}

uint64_t cnmatrix::CNMatrix<168u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(void *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<168u,1u,double>::TransposeDataFootprint(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__push_back_slow_path<RoseSyntheticApertureFiltering::InternalAoAMeas const&>(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = 0x4EC4EC4EC4EC4EC5 * ((a1[1] - *a1) >> 4);
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x13B13B13B13B13BLL) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  if (0x9D89D89D89D89D8ALL * ((a1[2] - *a1) >> 4) > v4) {
    unint64_t v4 = 0x9D89D89D89D89D8ALL * ((a1[2] - *a1) >> 4);
  }
  if ((unint64_t)(0x4EC4EC4EC4EC4EC5 * ((a1[2] - *a1) >> 4)) >= 0x9D89D89D89D89DLL) {
    unint64_t v6 = 0x13B13B13B13B13BLL;
  }
  else {
    unint64_t v6 = v4;
  }
  unint64_t v14 = a1 + 2;
  if (v6) {
    uint64_t v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>>((uint64_t)(a1 + 2), v6);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v10 = v7;
  uint64_t v11 = &v7[208 * v3];
  uint64_t v13 = &v7[208 * v6];
  std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas,RoseSyntheticApertureFiltering::InternalAoAMeas const&>((uint64_t)(a1 + 2), v11, a2);
  unint64_t v12 = v11 + 208;
  std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__swap_out_circular_buffer(a1, &v10);
  uint64_t v8 = a1[1];
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalAoAMeas>::~__split_buffer((uint64_t)&v10);
  return v8;
}

void sub_230EE16C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalAoAMeas>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

double std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas,RoseSyntheticApertureFiltering::InternalAoAMeas const&>(uint64_t a1, _OWORD *a2, _OWORD *a3)
{
  long long v5 = a3[1];
  *a2 = *a3;
  a2[1] = v5;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(a2 + 2), (uint64_t)(a3 + 2));
  *(void *)&double result = cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)(a2 + 6), (uint64_t)(a3 + 6)).n128_u64[0];
  return result;
}

void sub_230EE1728(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x13B13B13B13B13CLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(208 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  for (uint64_t i = 0;
        a3 + i != a5;
        std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas,RoseSyntheticApertureFiltering::InternalAoAMeas const&>(a1, (_OWORD *)(i + a7), (_OWORD *)(i + a3)))
  {
    i -= 208;
  }
  return a6;
}

uint64_t std::__split_buffer<RoseSyntheticApertureFiltering::InternalAoAMeas>::~__split_buffer(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3 != v2)
  {
    uint64_t v4 = v3 - 176;
    do
    {
      *(void *)(v3 - 112) = &unk_26E5D3870;
      *(void *)(v3 - 176) = &unk_26E5D3870;
      v4 -= 208;
      v3 -= 208;
    }
    while (v3 != v2);
    *(void *)(a1 + 16) = v2;
  }
  uint64_t v5 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v5);
  }
  return a1;
}

double *RoseSyntheticApertureFiltering::measModelRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = 0x100000003;
  uint64_t v13 = &unk_26E5D3818;
  long long v14 = xmmword_230EF8BF0;
  uint64_t v16 = &v17;
  cnmatrix::Subtract<double>(a1, a2, (uint64_t)&v13);
  uint64_t v30 = 0x100000003;
  uint64_t v28 = &unk_26E5D3818;
  long long v29 = xmmword_230EF8BF0;
  unsigned int v31 = &v32;
  uint64_t v25 = 0x100000134;
  double v23 = &unk_26E5D38E8;
  long long v24 = xmmword_230EF8C20;
  int v26 = &v27;
  uint64_t v20 = 0x100000003;
  unsigned int v18 = &unk_26E5D3818;
  long long v19 = xmmword_230EF8BF0;
  unint64_t v21 = &v22;
  cnmatrix::Norm<double>((uint64_t)&v13, (uint64_t)&v28, (uint64_t)&v23, (uint64_t)&v18, "2");
  double v7 = v6;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 0) = v6;
  if (v7 == 0.0)
  {
    *(void *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 0) = 0;
    *(void *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 1) = 0;
    uint64_t result = (double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 2);
    *uint64_t result = 0.0;
  }
  else
  {
    double v8 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v13, 0);
    double v9 = 1.0 / v7;
    *(double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 0) = 1.0 / v7 * v8;
    double v10 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v13, 1u);
    *(double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 1) = v9 * v10;
    double v11 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v13, 2u);
    uint64_t result = (double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 2);
    *uint64_t result = v9 * v11;
  }
  return result;
}

void RoseSyntheticApertureFiltering::measModelAoA(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v27 = 0x100000003;
  uint64_t v25 = &unk_26E5D3818;
  long long v26 = xmmword_230EF8BF0;
  uint64_t v28 = &v29;
  cnmatrix::Subtract<double>(a1, a2, (uint64_t)&v25);
  uint64_t v22 = 0x100000003;
  uint64_t v20 = &unk_26E5D3818;
  long long v21 = xmmword_230EF8BF0;
  double v23 = &v24;
  cnmatrix::Multiply<double>(a3, (uint64_t)&v25, (uint64_t)&v20);
  uint64_t v42 = 0x100000003;
  int v40 = &unk_26E5D3818;
  long long v41 = xmmword_230EF8BF0;
  int v43 = &v44;
  uint64_t v37 = 0x100000134;
  long long v36 = xmmword_230EF8C20;
  unsigned int v35 = &unk_26E5D38E8;
  uint64_t v38 = v39;
  uint64_t v32 = 0x100000003;
  long long v31 = xmmword_230EF8BF0;
  uint64_t v30 = &unk_26E5D3818;
  uint64_t v33 = &v34;
  cnmatrix::Norm<double>((uint64_t)&v20, (uint64_t)&v40, (uint64_t)&v35, (uint64_t)&v30, "2");
  double v9 = v8;
  double v10 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v20, 0);
  long double v11 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v20, 1u);
  double v12 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v20, 2u);
  if (v9 != 0.0)
  {
    long double v13 = v12;
    long long v14 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0);
    *long long v14 = atan2(v13, v11);
    uint64_t v15 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 1u);
    *uint64_t v15 = asin(v10 / v9);
    double v16 = v13 * v13 + v11 * v11;
    double v17 = 1.0 / (v9 * v9);
    *(void *)cnmatrix::CNMatrixBase<double>::operator()(a5, 0, 0) = 0;
    double v18 = sqrt(v16);
    *(double *)cnmatrix::CNMatrixBase<double>::operator()(a5, 1, 0) = v17 * v18;
    long long v19 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a5, 0, 1);
    if (v16 == 0.0)
    {
      long double *v19 = 0.0;
      *(void *)cnmatrix::CNMatrixBase<double>::operator()(a5, 0, 2) = 0;
      *(void *)cnmatrix::CNMatrixBase<double>::operator()(a5, 1, 1) = 0;
      *(void *)cnmatrix::CNMatrixBase<double>::operator()(a5, 1, 2) = 0;
    }
    else
    {
      long double *v19 = -v13 / v16;
      *(long double *)cnmatrix::CNMatrixBase<double>::operator()(a5, 0, 2) = v11 / v16;
      *(long double *)cnmatrix::CNMatrixBase<double>::operator()(a5, 1, 1) = v17 * (-(v10 * v11) / v18);
      *(long double *)cnmatrix::CNMatrixBase<double>::operator()(a5, 1, 2) = v17 * (-(v10 * v13) / v18);
    }
  }
  uint64_t v37 = 0x300000002;
  long long v36 = xmmword_230EF8F30;
  unsigned int v35 = &unk_26E5D3A00;
  uint64_t v38 = v39;
  cnmatrix::Multiply<double>(a5, a3, (uint64_t)&v35);
  cnmatrix::CNMatrixBase<double>::operator=(a5, (uint64_t)&v35);
}

void RoseSyntheticApertureFiltering::measModelRangeAlt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = 0x300000001;
  long double v13 = &unk_26E5D39B8;
  long long v14 = xmmword_230EF8F20;
  double v16 = &v17;
  RoseSyntheticApertureFiltering::measModelRange(a3, a4, a5, (uint64_t)&v13);
  uint64_t v10 = 0x300000001;
  double v8 = &unk_26E5D39B8;
  long long v9 = xmmword_230EF8F20;
  long double v11 = &v12;
  cnmatrix::Multiply<double>((uint64_t)&v13, a2, (uint64_t)&v8);
  cnmatrix::CNMatrixBase<double>::operator=(a6, (uint64_t)&v8);
}

void RoseSyntheticApertureFiltering::measModelAoAAlt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v16 = 0x300000002;
  long long v14 = &unk_26E5D3A00;
  long long v15 = xmmword_230EF8F30;
  uint64_t v17 = &v18;
  RoseSyntheticApertureFiltering::measModelAoA(a3, a4, a5, a6, (uint64_t)&v14);
  uint64_t v11 = 0x300000002;
  long long v9 = &unk_26E5D3A00;
  long long v10 = xmmword_230EF8F30;
  uint64_t v12 = &v13;
  cnmatrix::Multiply<double>((uint64_t)&v14, a2, (uint64_t)&v9);
  cnmatrix::CNMatrixBase<double>::operator=(a7, (uint64_t)&v9);
}

double *RoseSyntheticApertureFiltering::rhoThPhi2pos(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v6 = cnmatrix::CNMatrixBase<double>::operator()(a1, 0);
  double v7 = cnmatrix::CNMatrixBase<double>::operator()(a1, 1u);
  double v8 = cnmatrix::CNMatrixBase<double>::operator()(a1, 2u);
  __double2 v9 = __sincos_stret(v8);
  __double2 v10 = __sincos_stret(v7);
  double v11 = v6 * v9.__cosval;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0) = v10.__sinval * (v6 * v9.__cosval);
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1u) = v6 * v9.__sinval;
  double v12 = v10.__cosval * (v6 * v9.__cosval);
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2u) = v12;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 0, 0) = v10.__sinval * v9.__cosval;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 1, 0) = v9.__sinval;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 2, 0) = v10.__cosval * v9.__cosval;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 0, 1) = v12;
  *(void *)cnmatrix::CNMatrixBase<double>::operator()(a3, 1, 1) = 0;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 2, 1) = v10.__sinval * -(v6 * v9.__cosval);
  double v13 = -(v6 * v9.__sinval);
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 0, 2) = v10.__sinval * v13;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 1, 2) = v11;
  uint64_t result = (double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 2, 2);
  *uint64_t result = v10.__cosval * v13;
  return result;
}

void RoseSyntheticApertureFiltering::pos2rangeThPhi(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long double v4 = cnmatrix::CNMatrixBase<double>::operator()(a1, 0);
  double v5 = cnmatrix::CNMatrixBase<double>::operator()(a1, 1u);
  long double v6 = cnmatrix::CNMatrixBase<double>::operator()(a1, 2u);
  *(void *)(a2 + 24) = 0x100000003;
  *(void *)a2 = &unk_26E5D3818;
  *(_OWORD *)(a2 + 8) = xmmword_230EF8BF0;
  *(void *)(a2 + 32) = a2 + 40;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0) = sqrt(v5 * v5 + v4 * v4 + v6 * v6);
  if (*(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0) <= 0.0)
  {
    *(void *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1u) = 0;
    *(void *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2u) = 0;
  }
  else
  {
    double v7 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1u);
    *double v7 = atan2(v4, v6);
    double v8 = *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0);
    __double2 v9 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2u);
    *__double2 v9 = asin(v5 / v8);
  }
}

void sub_230EE238C(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

long double RoseSyntheticApertureFiltering::rangeAzEl2pos@<D0>(double a1@<D0>, long double a2@<D1>, long double a3@<D2>, uint64_t a4@<X8>)
{
  *(void *)(a4 + 24) = 0x100000003;
  *(void *)a4 = &unk_26E5D3818;
  *(_OWORD *)(a4 + 8) = xmmword_230EF8BF0;
  *(void *)(a4 + 32) = a4 + 40;
  __double2 v9 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0);
  *__double2 v9 = sin(a2) * a1;
  __double2 v10 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 1u);
  long double v11 = cos(a2) * a1;
  *__double2 v10 = v11 * cos(a3);
  double v12 = (double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 2u);
  long double result = v11 * sin(a3);
  *double v12 = result;
  return result;
}

void sub_230EE2490(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

double RoseSyntheticApertureFiltering::quatn2rot@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 24) = 0x300000003;
  *(void *)a2 = &unk_26E5D3970;
  *(_OWORD *)(a2 + 8) = xmmword_230EF8E90;
  *(void *)(a2 + 32) = a2 + 40;
  cnmatrix::FastResize<double>((_DWORD *)a2, 3, 3);
  cnmatrix::CNMatrixBase<double>::WriteValue(a2, 0.0);
  double v4 = cnmatrix::CNMatrixBase<double>::operator()(a1, 0);
  double v5 = cnmatrix::CNMatrixBase<double>::operator()(a1, 1u);
  double v6 = cnmatrix::CNMatrixBase<double>::operator()(a1, 2u);
  double v7 = cnmatrix::CNMatrixBase<double>::operator()(a1, 3u);
  double v14 = v5 * v5;
  double v15 = v4 * v4;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0, 0) = v4 * v4 - v5 * v5 - v6 * v6 + v7 * v7;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1, 0) = v4 * v5 + v6 * v7 + v4 * v5 + v6 * v7;
  double v8 = v4 * v6;
  double v9 = v5 * v7;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2, 0) = v4 * v6 - v5 * v7 + v4 * v6 - v5 * v7;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0, 1) = v4 * v5 - v6 * v7 + v4 * v5 - v6 * v7;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1, 1) = v5 * v5 - v4 * v4 - v6 * v6 + v7 * v7;
  double v10 = v4 * v7;
  double v11 = v5 * v6;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2, 1) = v11 + v10 + v11 + v10;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0, 2) = v8 + v9 + v8 + v9;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1, 2) = v11 - v10 + v11 - v10;
  double v12 = (double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2, 2);
  double result = -v15 - v14 + v6 * v6 + v7 * v7;
  *double v12 = result;
  return result;
}

void sub_230EE26E4(_Unwind_Exception *a1)
{
  void *v1 = &unk_26E5D3870;
  _Unwind_Resume(a1);
}

double RoseSyntheticApertureFiltering::range2deweight(RoseSyntheticApertureFiltering *this, double a2)
{
  double v2 = 1.0;
  if (a2 <= 1.0) {
    return v2;
  }
  double v2 = 5.0;
  if (a2 >= 10.0) {
    return v2;
  }
  else {
    return (a2 + -1.0) * 0.444444444 + 1.0;
  }
}

void sub_230EE2DF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE2FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE3288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE36E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE3B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_230EE3C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  MEMORY[0x230FCEC50](v10, 0x1080C4011C7A211);

  _Unwind_Resume(a1);
}

void sub_230EE3D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE4058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230EE4144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  MEMORY[0x230FCEC50](v10, 0x1080C4011C7A211);

  _Unwind_Resume(a1);
}

void sub_230EE42FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE456C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_230EE47FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE48A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE48F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EE49AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE4A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE4B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_230EE5130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double simd_quaternion(simd_float4x4 a1)
{
  float v1 = a1.columns[2].f32[2] + (float)(a1.columns[0].f32[0] + a1.columns[1].f32[1]);
  if (v1 >= 0.0)
  {
    a1.columns[3].f32[0] = sqrtf(v1 + 1.0);
    float32x2_t v5 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]));
    float32x2_t v6 = vmul_f32(v5, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]), v5));
    *(float32x2_t *)a1.columns[3].f32 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL), *(int32x2_t *)a1.columns[2].f32), (float32x2_t)vext_s8(*(int8x8_t *)a1.columns[2].f32, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), 4uLL)), vmul_f32(v6, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]), v6)).f32[0]);
  }
  else if (a1.columns[0].f32[0] < a1.columns[1].f32[1] || a1.columns[0].f32[0] < a1.columns[2].f32[2])
  {
    float v3 = 1.0 - a1.columns[0].f32[0];
    if (a1.columns[1].f32[1] >= a1.columns[2].f32[2])
    {
      a1.columns[3].f32[0] = sqrtf(a1.columns[1].f32[1] + (float)(v3 - a1.columns[2].f32[2]));
      a1.columns[3].f32[0] = a1.columns[3].f32[0] + a1.columns[3].f32[0];
      float32x2_t v16 = vrecpe_f32((float32x2_t)a1.columns[3].u32[0]);
      float32x2_t v17 = vmul_f32(v16, vrecps_f32((float32x2_t)a1.columns[3].u32[0], v16));
      v18.i32[0] = vmul_f32(v17, vrecps_f32((float32x2_t)a1.columns[3].u32[0], v17)).u32[0];
      v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)a1.columns[0].f32, 1), *(float32x2_t *)a1.columns[1].f32).u32[0];
      v17.i32[1] = a1.columns[3].i32[0];
      v18.i32[1] = 0.25;
      *(float32x2_t *)a1.columns[3].f32 = vmul_f32(v17, v18);
    }
    else
    {
      float32x2_t v4 = (float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[2].f32[2] + (float)(v3 - a1.columns[1].f32[1]))));
      *(float32x2_t *)a1.columns[2].f32 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL)), *(float32x2_t *)a1.columns[2].f32);
      *(int32x2_t *)a1.columns[1].f32 = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
      a1.columns[1].i32[0] = 2.0;
      a1.columns[1].i32[0] = vmul_f32(v4, *(float32x2_t *)a1.columns[1].f32).u32[0];
      *(float32x2_t *)a1.columns[3].f32 = vrecpe_f32((float32x2_t)a1.columns[1].u32[0]);
      *(float32x2_t *)a1.columns[3].f32 = vmul_f32(*(float32x2_t *)a1.columns[3].f32, vrecps_f32((float32x2_t)a1.columns[1].u32[0], *(float32x2_t *)a1.columns[3].f32));
      *(float32x2_t *)a1.columns[3].f32 = vmul_n_f32(*(float32x2_t *)a1.columns[2].f32, vmul_f32(*(float32x2_t *)a1.columns[3].f32, vrecps_f32((float32x2_t)a1.columns[1].u32[0], *(float32x2_t *)a1.columns[3].f32)).f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
    }
  }
  else
  {
    *(int32x2_t *)a1.columns[3].f32 = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
    float32x2_t v7 = vadd_f32(*(float32x2_t *)a1.columns[0].f32, *(float32x2_t *)a1.columns[3].f32);
    a1.columns[3].i32[0] = 2.0;
    v8.i32[0] = vmul_f32((float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[0].f32[0]+ (float)((float)(1.0 - a1.columns[1].f32[1]) - a1.columns[2].f32[2])))), *(float32x2_t *)a1.columns[3].f32).u32[0];
    v8.i32[1] = v7.i32[1];
    float32x2_t v9 = vrecpe_f32((float32x2_t)v8.u32[0]);
    float32x2_t v10 = vmul_f32(v9, vrecps_f32((float32x2_t)v8.u32[0], v9));
    unsigned __int32 v11 = vmul_f32(v10, vrecps_f32((float32x2_t)v8.u32[0], v10)).u32[0];
    __asm { FMOV            V5.2S, #0.25 }
    _D5.i32[1] = v11;
    *(float32x2_t *)a1.columns[3].f32 = vmul_f32(v8, _D5);
  }
  return *(double *)a1.columns[3].i64;
}

void sub_230EE57D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE5A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_230EE5FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_230EE61E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EE646C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE65D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE6714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE6818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE6998(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v2 - 56));

  _Unwind_Resume(a1);
}

void sub_230EE6D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28)
{
  _Unwind_Resume(a1);
}

void sub_230EE6EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE7308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v34 = *(void **)(v32 - 80);
  if (v34)
  {
    *(void *)(v32 - 72) = v34;
    operator delete(v34);
  }

  _Unwind_Resume(a1);
}

void sub_230EE7474(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_230EE7558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter>::reset[abi:ne180100](RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter **a1, RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *a2)
{
  double result = *a1;
  *a1 = a2;
  if (result)
  {
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::~PRRoseSyntheticApertureBatchFilter(result);
    JUMPOUT(0x230FCEC50);
  }
  return result;
}

void sub_230EE7700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE7BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_230EE7CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE7E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE7FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE81B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE8688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE8800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE8904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE8A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE8B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE8C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE8D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE92EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE9520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE9604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  float32x2_t v16 = v15;

  _Unwind_Resume(a1);
}

void sub_230EE96D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE9A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_230EE9B50(_Unwind_Exception *a1)
{
  float32x2_t v4 = v2;

  _Unwind_Resume(a1);
}

void sub_230EE9C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  float32x2_t v10 = v9;

  a9.super_class = (Class)PRItemLocalizer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_230EE9CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EE9DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::default_delete<RoseSyntheticApertureFiltering::PRRoseRangeFilter>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(void *)(a2 + 176) = &unk_26E5D3870;
    *(void *)(a2 + 112) = &unk_26E5D3870;
    *(void *)(a2 + 48) = &unk_26E5D3870;

    JUMPOUT(0x230FCEC50);
  }
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::~PRRoseSyntheticApertureBatchFilter(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  *((void *)this + 108) = &unk_26E5D3870;
  *((void *)this + 98) = &unk_26E5D3870;
  float32x2_t v5 = (void **)((char *)this + 720);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&v5);
  float32x2_t v5 = (void **)((char *)this + 696);
  std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100](&v5);
  float32x2_t v5 = (void **)((char *)this + 672);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&v5);
  boost::circular_buffer<double,std::allocator<double>>::destroy((uint64_t)this + 632);
  *((void *)this + 65) = &unk_26E5D3870;
  *((void *)this + 57) = &unk_26E5D3870;

  *((void *)this + 39) = &unk_26E5D3870;
  *((void *)this + 30) = &unk_26E5D3870;
  *((void *)this + 21) = &unk_26E5D3870;
  float32x2_t v5 = (void **)((char *)this + 144);
  std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__destroy_vector::operator()[abi:ne180100](&v5);
  uint64_t v2 = (void *)*((void *)this + 14);
  if (v2)
  {
    *((void *)this + 15) = v2;
    operator delete(v2);
  }
  float v3 = (void *)*((void *)this + 8);
  if (v3)
  {
    *((void *)this + 9) = v3;
    operator delete(v3);
  }
  float32x2_t v4 = (void *)*((void *)this + 2);
  if (v4)
  {
    *((void *)this + 3) = v4;
    operator delete(v4);
  }
}

BTFinding::PRRSSIFilter *BTFinding::PRRSSIFilter::PRRSSIFilter(BTFinding::PRRSSIFilter *this, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *((unsigned char *)this + 8) = 0;
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 8) = 2;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((void *)this + 13) = 0;
  *((_DWORD *)this + 28) = -128;
  *((void *)this + 15) = 0;
  *((_DWORD *)this + 32) = 0;
  *((_DWORD *)this + 34) = -128;
  *((void *)this + 18) = 0;
  *((_DWORD *)this + 38) = 1;
  *((_DWORD *)this + 40) = -128;
  *((void *)this + 21) = 0;
  *((_DWORD *)this + 44) = 2;
  *((_DWORD *)this + 6) = a2;
  *((_DWORD *)this + 7) = a2 - 4;
  float v3 = os_log_create("com.apple.proximity", "BTRSSIFilter");
  *(void *)this = v3;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *((_DWORD *)this + 6);
    int v5 = *((_DWORD *)this + 7);
    v7[0] = 67109376;
    v7[1] = v4;
    __int16 v8 = 1024;
    int v9 = v5;
    _os_log_impl(&dword_230EC1000, v3, OS_LOG_TYPE_DEFAULT, "Received Tx Power: %d dB, calculated Tx power adjustment: %d dB", (uint8_t *)v7, 0xEu);
  }
  return this;
}

uint64_t BTFinding::PRRSSIFilter::reset(uint64_t this)
{
  *(unsigned char *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(_DWORD *)(this + 32) = 2;
  *(_DWORD *)(this + 112) = -128;
  *(void *)(this + 120) = 0;
  *(_DWORD *)(this + 128) = 0;
  *(_DWORD *)(this + 136) = -128;
  *(void *)(this + 144) = 0;
  *(_DWORD *)(this + 152) = 1;
  *(_DWORD *)(this + 160) = -128;
  *(void *)(this + 168) = 0;
  *(_DWORD *)(this + 176) = 2;
  *(void *)(this + 48) = *(void *)(this + 40);
  *(void *)(this + 72) = *(void *)(this + 64);
  *(void *)(this + 96) = *(void *)(this + 88);
  return this;
}

void BTFinding::PRRSSIFilter::addRSSImeasurement(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  int v5 = *(_DWORD *)a2 - *(_DWORD *)(a1 + 28);
  double v6 = *(double *)(a2 + 8);
  int v7 = *(_DWORD *)(a2 + 16);
  __int16 v8 = *(NSObject **)a1;
  BOOL v9 = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 0x80000000) == 0)
  {
    if (v9)
    {
      int v75 = 67109376;
      *(_DWORD *)int v76 = v5;
      *(_WORD *)&v76[4] = 2048;
      *(double *)&v76[6] = v6;
      uint64_t v10 = "An invalid RSSI measurement with a value of %d dB has been received and ignored at time = %5.3f s";
      unsigned __int32 v11 = v8;
      uint32_t v12 = 18;
LABEL_109:
      _os_log_impl(&dword_230EC1000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v75, v12);
      goto LABEL_110;
    }
    goto LABEL_110;
  }
  if (v9)
  {
    int v75 = 67109376;
    *(_DWORD *)int v76 = v5;
    *(_WORD *)&v76[4] = 2048;
    *(double *)&v76[6] = v6;
    _os_log_impl(&dword_230EC1000, v8, OS_LOG_TYPE_DEFAULT, "Processing measurement with an adjusted value of %d dB has at time = %5.3f s", (uint8_t *)&v75, 0x12u);
  }
  uint64_t v15 = *(void *)(a1 + 40);
  double v13 = *(long long **)(a1 + 48);
  double v14 = (void **)(a1 + 40);
  if ((long long *)v15 != v13)
  {
    while (v6 - *(double *)(v15 + 8) <= 0.5)
    {
      v15 += 24;
      if ((long long *)v15 == v13) {
        goto LABEL_18;
      }
    }
    if ((long long *)v15 != v13)
    {
      float32x2_t v16 = (long long *)(v15 + 24);
      if ((long long *)(v15 + 24) != v13)
      {
        do
        {
          if (v6 - *((double *)v16 + 1) <= 0.5)
          {
            long long v17 = *v16;
            *(_DWORD *)(v15 + 16) = *((_DWORD *)v16 + 4);
            *(_OWORD *)uint64_t v15 = v17;
            v15 += 24;
          }
          float32x2_t v16 = (long long *)((char *)v16 + 24);
        }
        while (v16 != v13);
        double v13 = *(long long **)(a1 + 48);
      }
    }
    if ((long long *)v15 != v13) {
      *(void *)(a1 + 48) = v15;
    }
  }
LABEL_18:
  uint64_t v20 = *(void *)(a1 + 64);
  float32x2_t v18 = *(long long **)(a1 + 72);
  long long v19 = (void **)(a1 + 64);
  if ((long long *)v20 != v18)
  {
    while (v6 - *(double *)(v20 + 8) <= 0.5)
    {
      v20 += 24;
      if ((long long *)v20 == v18) {
        goto LABEL_30;
      }
    }
    if ((long long *)v20 != v18)
    {
      long long v21 = (long long *)(v20 + 24);
      if ((long long *)(v20 + 24) != v18)
      {
        do
        {
          if (v6 - *((double *)v21 + 1) <= 0.5)
          {
            long long v22 = *v21;
            *(_DWORD *)(v20 + 16) = *((_DWORD *)v21 + 4);
            *(_OWORD *)uint64_t v20 = v22;
            v20 += 24;
          }
          long long v21 = (long long *)((char *)v21 + 24);
        }
        while (v21 != v18);
        float32x2_t v18 = *(long long **)(a1 + 72);
      }
    }
    if ((long long *)v20 != v18) {
      *(void *)(a1 + 72) = v20;
    }
  }
LABEL_30:
  unint64_t v25 = *(void *)(a1 + 88);
  double v23 = *(long long **)(a1 + 96);
  uint64_t v24 = (void **)(a1 + 88);
  if ((long long *)v25 != v23)
  {
    while (v6 - *(double *)(v25 + 8) <= 0.5)
    {
      v25 += 24;
      if ((long long *)v25 == v23) {
        goto LABEL_42;
      }
    }
    if ((long long *)v25 != v23)
    {
      long long v26 = (long long *)(v25 + 24);
      if ((long long *)(v25 + 24) != v23)
      {
        do
        {
          if (v6 - *((double *)v26 + 1) <= 0.5)
          {
            long long v27 = *v26;
            *(_DWORD *)(v25 + 16) = *((_DWORD *)v26 + 4);
            *(_OWORD *)unint64_t v25 = v27;
            v25 += 24;
          }
          long long v26 = (long long *)((char *)v26 + 24);
        }
        while (v26 != v23);
        double v23 = *(long long **)(a1 + 96);
      }
    }
    if ((long long *)v25 != v23)
    {
      *(void *)(a1 + 96) = v25;
      goto LABEL_43;
    }
LABEL_42:
    unint64_t v25 = (unint64_t)v23;
  }
LABEL_43:
  switch(v7)
  {
    case 2:
      if (v6 > *(double *)(a1 + 168))
      {
        *(_DWORD *)(a1 + 160) = v5;
        *(double *)(a1 + 168) = v6;
        *(_DWORD *)(a1 + 176) = 2;
      }
      unint64_t v34 = *(void *)(a1 + 104);
      if (v25 >= v34)
      {
        uint64_t v42 = *v24;
        unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v25 - (void)*v24) >> 3);
        unint64_t v44 = v43 + 1;
        if (v43 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v34 - (void)v42) >> 3);
        if (2 * v45 > v44) {
          unint64_t v44 = 2 * v45;
        }
        if (v45 >= 0x555555555555555) {
          unint64_t v46 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v46 = v44;
        }
        if (v46)
        {
          unsigned int v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BTFinding::RSSIMeasurement>>(a1 + 104, v46);
          uint64_t v42 = *(void **)(a1 + 88);
          unint64_t v25 = *(void *)(a1 + 96);
        }
        else
        {
          unsigned int v47 = 0;
        }
        int v57 = (double *)&v47[24 * v43];
        uint64_t v58 = &v47[24 * v46];
        *(_DWORD *)int v57 = v5;
        v57[1] = v6;
        *((_DWORD *)v57 + 4) = 2;
        unsigned int v35 = (char *)(v57 + 3);
        if ((void *)v25 != v42)
        {
          do
          {
            long long v59 = *(_OWORD *)(v25 - 24);
            *((_DWORD *)v57 - 2) = *(_DWORD *)(v25 - 8);
            *(_OWORD *)(v57 - 3) = v59;
            v57 -= 3;
            v25 -= 24;
          }
          while ((void *)v25 != v42);
          uint64_t v42 = *v24;
        }
        *(void *)(a1 + 88) = v57;
        *(void *)(a1 + 96) = v35;
        *(void *)(a1 + 104) = v58;
        if (v42) {
          operator delete(v42);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v25 = v5;
        *(double *)(v25 + 8) = v6;
        *(_DWORD *)(v25 + 16) = 2;
        unsigned int v35 = (char *)(v25 + 24);
      }
      *(void *)(a1 + 96) = v35;
      break;
    case 1:
      if (v6 > *(double *)(a1 + 144))
      {
        *(_DWORD *)(a1 + 136) = v5;
        *(double *)(a1 + 144) = v6;
        *(_DWORD *)(a1 + 152) = 1;
      }
      unint64_t v31 = *(void *)(a1 + 80);
      uint64_t v32 = *(int **)(a1 + 72);
      if ((unint64_t)v32 >= v31)
      {
        long long v36 = (int *)*v19;
        unint64_t v37 = 0xAAAAAAAAAAAAAAABLL * (((char *)v32 - (unsigned char *)*v19) >> 3);
        unint64_t v38 = v37 + 1;
        if (v37 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v39 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v31 - (void)v36) >> 3);
        if (2 * v39 > v38) {
          unint64_t v38 = 2 * v39;
        }
        if (v39 >= 0x555555555555555) {
          unint64_t v40 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v40 = v38;
        }
        if (v40)
        {
          long long v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BTFinding::RSSIMeasurement>>(a1 + 80, v40);
          long long v36 = *(int **)(a1 + 64);
          uint64_t v32 = *(int **)(a1 + 72);
        }
        else
        {
          long long v41 = 0;
        }
        int v54 = (double *)&v41[24 * v37];
        int v55 = &v41[24 * v40];
        *(_DWORD *)int v54 = v5;
        v54[1] = v6;
        *((_DWORD *)v54 + 4) = 1;
        uint64_t v33 = (char *)(v54 + 3);
        if (v32 != v36)
        {
          do
          {
            long long v56 = *(_OWORD *)(v32 - 6);
            *((_DWORD *)v54 - 2) = *(v32 - 2);
            *(_OWORD *)(v54 - 3) = v56;
            v54 -= 3;
            v32 -= 6;
          }
          while (v32 != v36);
          long long v36 = (int *)*v19;
        }
        *(void *)(a1 + 64) = v54;
        *(void *)(a1 + 72) = v33;
        *(void *)(a1 + 80) = v55;
        if (v36) {
          operator delete(v36);
        }
      }
      else
      {
        *uint64_t v32 = v5;
        *((double *)v32 + 1) = v6;
        v32[4] = 1;
        uint64_t v33 = (char *)(v32 + 6);
      }
      *(void *)(a1 + 72) = v33;
      break;
    case 0:
      if (v6 > *(double *)(a1 + 120))
      {
        *(_DWORD *)(a1 + 112) = v5;
        *(double *)(a1 + 120) = v6;
        *(_DWORD *)(a1 + 128) = 0;
      }
      unint64_t v28 = *(void *)(a1 + 56);
      uint64_t v29 = *(int **)(a1 + 48);
      if ((unint64_t)v29 >= v28)
      {
        unint64_t v48 = (int *)*v14;
        unint64_t v49 = 0xAAAAAAAAAAAAAAABLL * (((char *)v29 - (unsigned char *)*v14) >> 3);
        unint64_t v50 = v49 + 1;
        if (v49 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v51 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - (void)v48) >> 3);
        if (2 * v51 > v50) {
          unint64_t v50 = 2 * v51;
        }
        if (v51 >= 0x555555555555555) {
          unint64_t v52 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v52 = v50;
        }
        if (v52)
        {
          double v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BTFinding::RSSIMeasurement>>(a1 + 56, v52);
          unint64_t v48 = *(int **)(a1 + 40);
          uint64_t v29 = *(int **)(a1 + 48);
        }
        else
        {
          double v53 = 0;
        }
        uint64_t v60 = (double *)&v53[24 * v49];
        *(_DWORD *)uint64_t v60 = v5;
        uint64_t v61 = &v53[24 * v52];
        v60[1] = v6;
        *((_DWORD *)v60 + 4) = 0;
        uint64_t v30 = (char *)(v60 + 3);
        if (v29 != v48)
        {
          do
          {
            long long v62 = *(_OWORD *)(v29 - 6);
            *((_DWORD *)v60 - 2) = *(v29 - 2);
            *(_OWORD *)(v60 - 3) = v62;
            v60 -= 3;
            v29 -= 6;
          }
          while (v29 != v48);
          unint64_t v48 = (int *)*v14;
        }
        *(void *)(a1 + 40) = v60;
        *(void *)(a1 + 48) = v30;
        *(void *)(a1 + 56) = v61;
        if (v48) {
          operator delete(v48);
        }
      }
      else
      {
        *uint64_t v29 = v5;
        *((double *)v29 + 1) = v6;
        uint64_t v30 = (char *)(v29 + 6);
        v29[4] = 0;
      }
      *(void *)(a1 + 48) = v30;
      break;
  }
  if (!*(unsigned char *)(a1 + 8))
  {
    *(unsigned char *)(a1 + 8) = 1;
    *(double *)(a1 + 16) = v6;
    int v63 = *(NSObject **)a1;
    if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v75) = 0;
      _os_log_impl(&dword_230EC1000, v63, OS_LOG_TYPE_DEFAULT, "RSSI filter is initialized", (uint8_t *)&v75, 2u);
    }
  }
  if (v6 - *(double *)(a1 + 16) < 0.5)
  {
    int v64 = *(NSObject **)a1;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      int v75 = 134217984;
      *(double *)int v76 = v6;
      uint64_t v10 = "Not returning any solution yet at time = %5.3f s";
      unsigned __int32 v11 = v64;
      uint32_t v12 = 12;
      goto LABEL_109;
    }
LABEL_110:
    char v65 = 0;
    *(unsigned char *)a3 = 0;
    goto LABEL_111;
  }
  double v66 = BTFinding::PRRSSIFilter::calculateAverageForChannel((os_log_t *)a1, (int **)(a1 + 40));
  double v67 = BTFinding::PRRSSIFilter::calculateAverageForChannel((os_log_t *)a1, (int **)(a1 + 64));
  double v68 = BTFinding::PRRSSIFilter::calculateAverageForChannel((os_log_t *)a1, (int **)(a1 + 88));
  int v69 = *(NSObject **)a1;
  if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT))
  {
    int v75 = 134218752;
    *(double *)int v76 = v66;
    *(_WORD *)&v76[8] = 2048;
    *(double *)&v76[10] = v67;
    __int16 v77 = 2048;
    double v78 = v68;
    __int16 v79 = 2048;
    double v80 = v6;
    _os_log_impl(&dword_230EC1000, v69, OS_LOG_TYPE_DEFAULT, "Averages calculated for channel 37, 38, and 39 are: %4.1f, %4.1f, and %4.1f dB at time = %5.3f s", (uint8_t *)&v75, 0x2Au);
    int v69 = *(NSObject **)a1;
  }
  if (v66 >= v67) {
    double v70 = v66;
  }
  else {
    double v70 = v67;
  }
  if (v70 >= v68) {
    double v71 = v70;
  }
  else {
    double v71 = v68;
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    int v75 = 134218240;
    *(double *)int v76 = v71;
    *(_WORD *)&v76[8] = 2048;
    *(double *)&v76[10] = v6;
    _os_log_impl(&dword_230EC1000, v69, OS_LOG_TYPE_DEFAULT, "Max among channel is %4.1f dB at time = %5.3f s", (uint8_t *)&v75, 0x16u);
  }
  double v72 = 0.0;
  if (v71 > -100.0)
  {
    double v72 = 1.0;
    if (v71 < -40.0) {
      double v72 = (v71 + 100.0) / 60.0;
    }
  }
  int64_t v73 = *(NSObject **)a1;
  if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT))
  {
    int v75 = 134218240;
    *(double *)int v76 = v72;
    *(_WORD *)&v76[8] = 2048;
    *(double *)&v76[10] = v6;
    _os_log_impl(&dword_230EC1000, v73, OS_LOG_TYPE_DEFAULT, "Continuous proximity level %3.2f at time = %5.3f s", (uint8_t *)&v75, 0x16u);
  }
  BTFinding::PRRSSIFilter::updateProximityLevelWithHysteresis((BTFinding::PRRSSIFilter *)a1, v71);
  int v74 = *(_DWORD *)(a1 + 32);
  *(void *)(a1 + 48) = *(void *)(a1 + 40);
  *(void *)(a1 + 72) = *(void *)(a1 + 64);
  *(void *)(a1 + 96) = *(void *)(a1 + 88);
  *(double *)(a1 + 16) = v6;
  *(double *)a3 = v71;
  *(double *)(a3 + 8) = v6;
  *(_DWORD *)(a3 + 16) = v74;
  char v65 = 1;
  *(double *)(a3 + 24) = v72;
LABEL_111:
  *(unsigned char *)(a3 + 32) = v65;
}

double BTFinding::PRRSSIFilter::calculateAverageForChannel(os_log_t *a1, int **a2)
{
  uint64_t v2 = *a2;
  float v3 = a2[1];
  if (*a2 != v3)
  {
    double v4 = 0.0;
    int v5 = *a2;
    do
    {
      int v6 = *v5;
      v5 += 6;
      double v4 = v4 + (double)v6;
    }
    while (v5 != v3);
    if (v2 != v3) {
      return v4 / (double)(0xAAAAAAAAAAAAAAABLL * (((char *)v3 - (char *)v2) >> 3));
    }
  }
  __int16 v8 = *a1;
  if (os_log_type_enabled(*a1, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 0;
    _os_log_impl(&dword_230EC1000, v8, OS_LOG_TYPE_DEFAULT, "No measurement found for channel", (uint8_t *)v9, 2u);
  }
  return -128.0;
}

double BTFinding::PRRSSIFilter::convertRSSIToContinuousProximityLevel(BTFinding::PRRSSIFilter *this, double a2)
{
  double v2 = 0.0;
  if (a2 > -100.0)
  {
    double v2 = 1.0;
    if (a2 < -40.0) {
      return (a2 + 100.0) / 60.0;
    }
  }
  return v2;
}

void BTFinding::PRRSSIFilter::updateProximityLevelWithHysteresis(BTFinding::PRRSSIFilter *this, double a2)
{
  if (a2 > -65.0) {
    int v2 = 1;
  }
  else {
    int v2 = 2;
  }
  if (a2 > -50.0) {
    int v2 = 0;
  }
  uint64_t v3 = *((int *)this + 8);
  if (v3 == 2 || v2 - v3 != 1)
  {
    *((_DWORD *)this + 8) = v2;
    return;
  }
  if (BTFinding::offsetThresholds[v3] <= a2)
  {
    int v5 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v8 = 0;
    int v6 = "Hysteresis: RSSI decrease is not small enough to switch to the lower level";
    int v7 = (uint8_t *)&v8;
  }
  else
  {
    *((_DWORD *)this + 8) = v2;
    int v5 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v9 = 0;
    int v6 = "Hysteresis: RSSI decrease is enough to switch to the lower level";
    int v7 = (uint8_t *)&v9;
  }
  _os_log_impl(&dword_230EC1000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<BTFinding::RSSIMeasurement>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void sub_230EEB930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_230EEC070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_230EEC30C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EEC434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EEC568(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v2 - 40));

  _Unwind_Resume(a1);
}

void sub_230EECD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EED0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EED210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EED334(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v2 - 40));

  _Unwind_Resume(a1);
}

void sub_230EED6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_230EED8B4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v2 - 40));

  _Unwind_Resume(a1);
}

void sub_230EEDC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_230EEE118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, objc_super a14)
{
  a14.super_class = (Class)PRBTGroupLocalizer;
  [(_Unwind_Exception *)&a14 dealloc];
  _Unwind_Resume(a1);
}

uint64_t platformSupportsProximity()
{
  return [MEMORY[0x263F623C8] isSupported];
}

double PRArmsReachThresholdEnter()
{
  return 0.9144;
}

double PRArmsReachThresholdExit()
{
  return 1.143;
}

double PRVerticalThresholdEnter()
{
  return 2.5;
}

double PRVerticalThresholdExit()
{
  return 2.75;
}

double PRItemFoundThresholdEnter()
{
  return 0.15;
}

double PRItemFoundThresholdExit()
{
  return 0.1875;
}

unint64_t calculateBearingAngleHorizontalDistanceAndVerticalDistance(void *a1, void *a2)
{
  id v4 = a2;
  id v5 = a1;
  [v4 pose];
  float v44 = v6;
  [v4 pose];
  float32x4_t v45 = v7;
  [v4 pose];
  float32x4_t v48 = v8;
  [v4 pose];
  float32x4_t v52 = v9;

  [v5 vector];
  float32x4_t v50 = v10;

  float32x4_t v11 = vsubq_f32(v50, v52);
  float32x4_t v12 = vmulq_f32(v11, v11);
  float32x4_t v13 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2);
  v13.f32[0] = sqrtf(vaddq_f32(v13, v12).f32[0]);
  if (v13.f32[0] > 0.01)
  {
    v14.i32[0] = vextq_s8((int8x16_t)v11, (int8x16_t)v11, 8uLL).u32[0];
    v14.i32[1] = v11.i32[0];
    __int32 v51 = v13.i32[0];
    float32x2_t v42 = vdiv_f32(v14, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.f32, 0));
    float v15 = acosf(-v48.f32[1]);
    *(float *)&v20.i32[1] = v44;
    float32x4_t v16 = v45;
    v2.i32[0] = v45.i32[1];
    v17.i32[0] = vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL).u32[0];
    v17.i32[1] = v45.i32[0];
    float32x4_t v18 = vmulq_f32(v16, v16);
    int32x2_t v19 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), v18).u64[0];
    *(float *)v20.i32 = sqrtf(*(float *)v19.i32);
    if (fabsf(v45.f32[1]) >= fabsf(v44))
    {
      int32x2_t v43 = v20;
      float32x2_t v46 = v17;
      float v25 = asinf(*(float *)v20.i32);
      if (v25 >= 0.43633)
      {
        double v21 = COERCE_DOUBLE(vdiv_f32(v46, (float32x2_t)vdup_lane_s32(v43, 0)));
        double v39 = v15;
        float32x2_t v36 = v42;
        if (v15 <= 1.57079633)
        {
          *(float *)&double v39 = -*((float *)&v21 + 1);
          double v23 = COERCE_DOUBLE(vzip1_s32(*(int32x2_t *)&v39, *(int32x2_t *)&v21));
          double v40 = COERCE_DOUBLE(vneg_f32(*(float32x2_t *)&v21));
          LODWORD(v41) = vdup_lane_s32(*(int32x2_t *)&v40, 1).u32[0];
          if (v15 > 0.7854)
          {
            *((float *)&v41 + 1) = -*(float *)&v40;
            double v23 = v41;
            double v21 = v40;
          }
        }
        else
        {
          LODWORD(v23) = vdup_lane_s32(*(int32x2_t *)&v21, 1).u32[0];
          *((float *)&v23 + 1) = -*(float *)&v21;
        }
        goto LABEL_12;
      }
      float32x4_t v26 = v48;
      v27.i32[0] = vextq_s8((int8x16_t)v26, (int8x16_t)v26, 8uLL).u32[0];
      v27.i32[1] = v48.i32[0];
      float32x4_t v28 = vmulq_f32(v26, v26);
      v28.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), v28).u64[0];
      v28.f32[0] = sqrtf(v28.f32[0]);
      double v21 = COERCE_DOUBLE(vdiv_f32((float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(v2, 0), 0), (int8x8_t)vneg_f32(v27), (int8x8_t)v27), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.f32, 0)));
      if (v25 > 0.2618)
      {
        float32x2_t v29 = (float32x2_t)vbsl_s8((int8x8_t)vcgtd_f64(1.57079633, v15), (int8x8_t)vneg_f32(v46), (int8x8_t)v46);
        float32x2_t v30 = vmul_f32(v29, v29);
        v30.f32[0] = sqrtf(vaddv_f32(v30));
        int32x2_t v31 = (int32x2_t)vdiv_f32(v29, (float32x2_t)vdup_lane_s32((int32x2_t)v30, 0));
        v29.f32[0] = -*(float *)&v31.i32[1];
        int32x2_t v32 = vzip1_s32((int32x2_t)v29, v31);
        float32x2_t v47 = (float32x2_t)v32;
        float32x2_t v49 = (float32x2_t)v31;
        float32x2_t v33 = vmla_lane_f32(vmul_n_f32((float32x2_t)__PAIR64__(v32.u32[0], v31.u32[0]), *(float *)&v21), (float32x2_t)__PAIR64__(v32.u32[1], v31.u32[1]), *(float32x2_t *)&v21, 1);
        float v34 = atan2f(v33.f32[1], v33.f32[0]);
        __float2 v35 = __sincosf_stret((float)((float)(v25 + -0.43633) / -0.17453) * v34);
        double v21 = COERCE_DOUBLE(vmla_n_f32(vmul_n_f32(v47, v35.__sinval), v49, v35.__cosval));
      }
      LODWORD(v23) = vdup_lane_s32(*(int32x2_t *)&v21, 1).u32[0];
      *((float *)&v23 + 1) = -*(float *)&v21;
    }
    else
    {
      double v21 = COERCE_DOUBLE(vdiv_f32(v17, (float32x2_t)vdup_lane_s32(v20, 0)));
      LODWORD(v23) = HIDWORD(v21);
      *(float *)v19.i32 = -*((float *)&v21 + 1);
      double v22 = COERCE_DOUBLE(vzip1_s32(v19, *(int32x2_t *)&v21));
      *((float *)&v23 + 1) = -*(float *)&v21;
      if (v15 <= 0.7854) {
        double v23 = v22;
      }
    }
    float32x2_t v36 = v42;
LABEL_12:
    float32x2_t v37 = vmla_lane_f32(vmul_n_f32((float32x2_t)vzip1_s32(*(int32x2_t *)&v21, *(int32x2_t *)&v23), v36.f32[0]), (float32x2_t)vzip2_s32(*(int32x2_t *)&v21, *(int32x2_t *)&v23), v36, 1);
    uint64_t v24 = COERCE_UNSIGNED_INT(atan2f(v37.f32[1], v37.f32[0]));
    v13.i32[0] = v51;
    return v24 | ((unint64_t)v13.u32[0] << 32);
  }
  uint64_t v24 = 0;
  return v24 | ((unint64_t)v13.u32[0] << 32);
}

double combinedQuaternionFromAoA(float a1, float a2)
{
  __float2 v3 = __sincosf_stret(a1 * 0.5);
  float32x4_t v10 = vmulq_n_f32((float32x4_t)xmmword_230EF91E0, v3.__sinval);
  __float2 v4 = __sincosf_stret(a2 * 0.5);
  float32x4_t v5 = vmulq_n_f32((float32x4_t)xmmword_230EF91F0, v4.__sinval);
  v6.i32[0] = LODWORD(v4.__cosval);
  v6.f32[1] = -v5.f32[2];
  v6.i32[2] = v5.i32[1];
  *(float32x2_t *)v7.f32 = vneg_f32(*(float32x2_t *)v5.f32);
  v6.i32[3] = v7.i32[0];
  v8.i32[0] = vdupq_laneq_s32((int32x4_t)v5, 2).u32[0];
  v8.i32[1] = LODWORD(v4.__cosval);
  v8.i64[1] = v7.i64[0];
  v7.i32[0] = vdup_lane_s32(*(int32x2_t *)v7.f32, 1).u32[0];
  v7.i32[1] = v5.i32[0];
  v7.i32[2] = LODWORD(v4.__cosval);
  v7.f32[3] = -v5.f32[2];
  v5.i32[3] = LODWORD(v4.__cosval);
  *(void *)&double result = vmlaq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, v10.f32[0]), v8, *(float32x2_t *)v10.f32, 1), v7, v10, 2), v5, v3.__cosval).u64[0];
  return result;
}

__n64 unitVectorForAoAInNearbydCoordinates(float *a1)
{
  __float2 v2 = __sincosf_stret(*a1);
  float cosval = __sincosf_stret(a1[4]).__cosval;
  result.n64_u32[0] = LODWORD(v2.__sinval);
  result.n64_f32[1] = v2.__cosval * cosval;
  return result;
}

double unitVectorForAoAInSpatialCoordinates(float *a1)
{
  __float2 v2 = __sincosf_stret(*a1);
  return COERCE_DOUBLE(__PAIR64__(v2.__cosval * __sincosf_stret(a1[1]).__sinval, LODWORD(v2.__sinval)));
}

float convertAoAFromNearbydCoordinatesToSpatialCoordinates(float *a1)
{
  float v2 = *a1;
  float v3 = cosf(*a1);
  __float2 v4 = __sincosf_stret(a1[1]);
  atan2f(v3 * v4.__cosval, -(float)(v3 * v4.__sinval));
  return v2;
}

float calculateAoAFromUnitVectorInSpatialCoordinates(float a1, float a2, float a3)
{
  float v3 = a3;
  float v4 = a2;
  float v5 = sqrtf((float)((float)(a2 * a2) + (float)(a1 * a1)) + (float)(a3 * a3));
  if (v5 >= 0.000001)
  {
    a1 = a1 / v5;
    float v4 = v4 / v5;
    float v3 = a3 / v5;
  }
  float v6 = asinf(a1);
  atan2f(v4, -v3);
  return v6;
}

void sub_230EEF070(_Unwind_Exception *a1)
{
  float v4 = v3;

  _Unwind_Resume(a1);
}

void sub_230EEF124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  float32x4_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_230EEF318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  _Unwind_Resume(a1);
}

void sub_230EEF4A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EEF704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EEFAC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EEFED4(_Unwind_Exception *a1)
{
  float v3 = v2;

  _Unwind_Resume(a1);
}

void sub_230EEFFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF0074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF0108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF0184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF0210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF0334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF0470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF05AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF06E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF0824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF0960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF0A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF0A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF0B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF0D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF1B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF2390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_230EF2614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF2A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_230EF2C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF2D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF2E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF2FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF31AC(_Unwind_Exception *a1)
{
  float v3 = v2;

  _Unwind_Resume(a1);
}

void sub_230EF3308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF33C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF3508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF35F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF37A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF386C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF38F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF3964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF39D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF3B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void sub_230EF3E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_230EF4034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF4108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF417C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_230EF4284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_230EF4528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_230EF4634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

double degToRad(double a1)
{
  return a1 / 180.0 * 3.14159265;
}

double radToDeg(double a1)
{
  return a1 * 180.0 / 3.14159265;
}

double picosecsToMeters(double a1)
{
  return a1 / 1.0e12 * 299792458.0;
}

double metersToPicosecs(double a1)
{
  return a1 / 299792458.0 * 1.0e12;
}

double secsToMeters(double a1)
{
  return a1 * 299792458.0;
}

double metersToSecs(double a1)
{
  return a1 / 299792458.0;
}

double secsToPicosecs(double a1)
{
  return a1 * 1.0e12;
}

double picosecsToSecs(double a1)
{
  return a1 / 1.0e12;
}

double pptToPpb(double a1)
{
  return a1 / 1000.0;
}

double ppbToPpt(double a1)
{
  return a1 * 1000.0;
}

double ppbToPpu(double a1)
{
  return a1 / 1000000000.0;
}

double ppuToPpb(double a1)
{
  return a1 * 1000000000.0;
}

long double coordinate_transform_from_R1_to_nearbyD(double a1, double a2, double *a3, long double *a4)
{
  double v6 = a2 / 180.0 * 3.14159265;
  __double2 v7 = __sincos_stret(a1 / 180.0 * 3.14159265);
  __double2 v8 = __sincos_stret(v6);
  *a3 = asin(v7.__cosval * v8.__sinval) * 180.0 / 3.14159265;
  long double result = atan2(-(v7.__sinval * v8.__sinval), v8.__cosval) * 180.0 / 3.14159265;
  *a4 = result;
  return result;
}

void coordinate_transform_from_nearbyD_to_R1(double a1, double a2, double *a3, double *a4)
{
  __double2 v7 = __sincos_stret(a1 / 180.0 * 3.14159265);
  __double2 v8 = __sincos_stret(a2 / 180.0 * 3.14159265);
  *a4 = acos(v7.__cosval * v8.__cosval) * 180.0 / 3.14159265;
  double v9 = atan2(-(v7.__cosval * v8.__sinval), v7.__sinval) * 180.0 / 3.14159265;
  if (v9 < 0.0) {
    double v9 = v9 + 360.0;
  }
  *a3 = v9;
}

void cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint()
{
  __assert_rtn("TransposeDataFootprint", "cnmatrix.h", 122, "scratch != nullptr");
}

{
  __assert_rtn("TransposeDataFootprint", "cnmatrix.h", 128, "lead_dim > 0");
}

void cnmatrix::FastResize<double>()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2337, "in_nr >= 0");
}

{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2339, "in_nr <= max_nr");
}

{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2340, "in_nc >= 0");
}

{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2342, "in_nc <= max_nc");
}

void cnmatrix::CNMatrixBase<double>::WriteValue()
{
  __assert_rtn("WriteValue", "cnmatrixbase.h", 1104, "data_ != __null");
}

void cnmatrix::CNMatrixBase<double>::operator()()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 913, "data_ != __null");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 914, "idx >= 0");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 915, "idx < num_elements_");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 815, "data_ != __null");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 816, "idx >= 0");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 817, "idx < num_elements_");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 782, "data_ != __null");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 783, "idx >= 0");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 784, "idx < num_elements_");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 945, "data_ != __null");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 946, "idx >= 0");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 947, "idx < num_elements_");
}

void cnmatrix::Multiply<double>()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3887, "&(A) != &(C)");
}

{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3888, "&(B) != &(C)");
}

{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3885, "A.num_cols_ == B.num_rows_");
}

{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3818, "&(B) != &(C)");
}

void cnmatrix::Add<double>()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3536, "&(A) != &(C)");
}

{
  __assert_rtn("Add", "cnmatrixbase.h", 3537, "&(B) != &(C)");
}

{
  __assert_rtn("Add", "cnmatrixbase.h", 3534, "A.num_cols_ == B.num_cols_");
}

{
  __assert_rtn("Add", "cnmatrixbase.h", 3533, "A.num_rows_ == B.num_rows_");
}

void cnmatrix::CNMatrixBase<double>::operator=()
{
  __assert_rtn("operator=", "cnmatrixbase.h", 619, "this->max_num_rows_ >= A.num_rows_");
}

{
  __assert_rtn("operator=", "cnmatrixbase.h", 620, "this->max_num_cols_ >= A.num_cols_");
}

void cnmatrix::Subtract<double>()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3677, "&(A) != &(C)");
}

{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3678, "&(B) != &(C)");
}

{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3675, "A.num_cols_ == B.num_cols_");
}

{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3674, "A.num_rows_ == B.num_rows_");
}

void cnmatrix::Norm<double>()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4504, "&A != &Acopy");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4505, "&A != &Work");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4506, "&A != &S");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4507, "&Acopy != &Work");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4508, "&Acopy != &S");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4509, "&Work != &S");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4512, "Acopy.num_elements_ >= A.num_elements_");
}

{
  cnprint::CNPrinter::Print();
  __assert_rtn("Norm", "cnmatrixbase.h", 4640, "false");
}

{
  cnprint::CNPrinter::Print();
  __assert_rtn("Norm", "cnmatrixbase.h", 4716, "ret == 1");
}

void cnmatrix::SingularValues<double>()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7028, "&A != &Acopy");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7029, "&A != &Work");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7030, "&A != &S");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7031, "&Acopy != &Work");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7032, "&Acopy != &S");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7033, "&Work != &S");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7036, "ne >= 1");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7037, "ne >= 3*minnrnc + maxnrnc");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7038, "ne >= 5*minnrnc");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7040, "Acopy.max_num_rows_ >= nrA");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7041, "Acopy.max_num_cols_ >= ncA");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7042, "S.max_num_rows_ >= minnrnc");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7043, "S.max_num_cols_ >= 1");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7111, "info == 0");
}

void PRCommonConvertTicksToSeconds()
{
  __assert_rtn("PRCommonConvertTicksToSeconds", "PRCommon.mm", 43, "timebaseResult == KERN_SUCCESS");
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::addMeasurement(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_error_impl(&dword_230EC1000, a2, OS_LOG_TYPE_ERROR, "Invalid measurement rejected by the batch filter filter, range passed: %f m, range uncertainty passed: %f m", (uint8_t *)&v4, 0x16u);
}

void cnmatrix::Transpose<double>()
{
  __assert_rtn("Transpose", "cnmatrixbase.h", 5010, "&(A) != &(B)");
}

void cnmatrix::CNMatrixBase<double>::operator()<int,int>()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 749, "data_ != __null");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 750, "idx >= 0");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 751, "idx < num_elements_");
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>>(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + 72;
  do
  {
    *(void *)(result + 72) = &unk_26E5D3870;
    *(void *)(result + 8) = &unk_26E5D3870;
    result += 136;
    v2 += 136;
  }
  while (result != a2);
  return result;
}

void cnmatrix::Inv<double>()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6077, "&A != &Work");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6078, "&A != &B");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6081, "&Work != &B");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6086, "Ipiv.max_num_rows_ * Ipiv.max_num_cols_ >= A.num_rows_");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6088, "Work.max_num_rows_ * Work.max_num_cols_ >= 4 * A.num_rows_");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6090, "B.max_num_rows_ >= A.num_rows_");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6091, "B.max_num_cols_ >= A.num_cols_");
}

{
  cnprint::CNPrinter::Print();
  __assert_rtn("Inv", "cnmatrixbase.h", 6127, "info >= 0");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6159, "info >= 0");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6084, "A.num_rows_ == A.num_cols_");
}

void (***std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<3u,1u,double>>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>>(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  int v4 = a1;
  do
  {
    uint64_t v5 = *v4;
    v4 += 8;
    (*v5)();
    v3 += 8;
    long double result = v4;
  }
  while (v4 != a2);
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>>(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + 104;
  do
  {
    *(void *)(result + 104) = &unk_26E5D3870;
    *(void *)(result + 16) = &unk_26E5D3870;
    result += 192;
    v2 += 192;
  }
  while (result != a2);
  return result;
}

void (***std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>>(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  int v4 = a1;
  do
  {
    uint64_t v5 = *v4;
    v4 += 7;
    (*v5)();
    v3 += 7;
    long double result = v4;
  }
  while (v4 != a2);
  return result;
}

void cnmatrix::Eig<double>()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5690, "&A != &Acopy");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5691, "&A != &Dr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5692, "&A != &Di");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5693, "&A != &Vr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5694, "&A != &Vi");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5695, "&A != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5696, "&A != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5697, "&A != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5698, "&Acopy != &Dr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5699, "&Acopy != &Di");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5700, "&Acopy != &Vr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5701, "&Acopy != &Vi");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5702, "&Acopy != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5703, "&Acopy != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5704, "&Acopy != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5705, "&Dr != &Di");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5706, "&Dr != &Vr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5707, "&Dr != &Vi");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5708, "&Dr != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5709, "&Dr != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5710, "&Dr != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5711, "&Di != &Vr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5712, "&Di != &Vi");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5713, "&Di != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5714, "&Di != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5715, "&Di != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5716, "&Vr != &Vi");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5717, "&Vr != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5718, "&Vr != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5719, "&Vr != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5720, "&Vi != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5721, "&Vi != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5722, "&Vi != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5723, "&Swork != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5724, "&Swork != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5725, "&Rwork != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5730, "Swork.max_num_rows_ * Swork.max_num_cols_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5731, "Rwork.max_num_rows_ * Rwork.max_num_cols_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5732, "ne >= 3*nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5734, "Acopy.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5735, "Acopy.max_num_cols_ >= ncA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5736, "Dr.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5737, "Dr.max_num_cols_ >= ncA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5738, "Di.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5739, "Di.max_num_cols_ >= ncA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5740, "Vr.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5741, "Vr.max_num_cols_ >= ncA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5742, "Vi.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5743, "Vi.max_num_cols_ >= ncA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5744, "Swork.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5745, "Rwork.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5834, "info == 0");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5728, "nrA == ncA");
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>>(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + 96;
  do
  {
    *(void *)(result + 96) = &unk_26E5D3870;
    *(void *)(result + 32) = &unk_26E5D3870;
    result += 208;
    v2 += 208;
  }
  while (result != a2);
  return result;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PRSetRoseGlobalConfigParams()
{
  return MEMORY[0x270F588D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t cnprint::CNPrinter::GetLogLevel(cnprint::CNPrinter *this)
{
  return MEMORY[0x270F1A8D0](this);
}

uint64_t cnprint::CNPrinter::Print()
{
  return MEMORY[0x270F1A8E0]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__float cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__float cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

int dgeevx_(char *__balanc, char *__jobvl, char *__jobvr, char *__sense, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__wr, __CLPK_doublereal *__wi, __CLPK_doublereal *__vl, __CLPK_integer *__ldvl, __CLPK_doublereal *__vr, __CLPK_integer *__ldvr, __CLPK_integer *__ilo, __CLPK_integer *__ihi, __CLPK_doublereal *__scale, __CLPK_doublereal *__abnrm, __CLPK_doublereal *__rconde, __CLPK_doublereal *__rcondv, __CLPK_doublereal *__work,__CLPK_integer *__lwork,__CLPK_integer *__iwork,__CLPK_integer *__info)
{
  return MEMORY[0x270EDE520](__balanc, __jobvl, __jobvr, __sense, __n, __a, __lda, __wr);
}

int dgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE590](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

int dgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE5A0](__m, __n, __a, __lda, __ipiv, __info);
}

int dgetri_(__CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE5B0](__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double erf(long double __x)
{
  MEMORY[0x270ED9780](__x);
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}