@interface CLWaterTemperatureEstimator
- (BOOL)coefficientsUpdated;
- (CLWaterTemperatureEstimator)init;
- (float)waterTempEst;
- (float)waterTempUncertainty;
- (id).cxx_construct;
- (void)getEnclosureMaterial;
- (void)setWaterTempCoefficients;
- (void)setWaterTempEst:(float)a3;
- (void)setWaterTempUncertainty:(float)a3;
- (void)updateWithTDot:(const float *)a3 andTempMeasurement:(const float *)a4;
@end

@implementation CLWaterTemperatureEstimator

- (CLWaterTemperatureEstimator)init
{
  v8.receiver = self;
  v8.super_class = (Class)CLWaterTemperatureEstimator;
  v2 = [(CLWaterTemperatureEstimator *)&v8 init];
  if (v2)
  {
    unsigned __int8 v6 = 0;
    sub_10006ACBC(v7, "LogWatchEnclosureMaterial", &v6, 0);
    v2->_logEnclosureMaterial = v7[1];
    v3 = (float *)qword_1024858D0;
    unint64_t v4 = (unint64_t)(qword_1024858D8 - qword_1024858D0) >> 2;
    v2->_enclosureMaterial = 0;
    v2->_numTDotBins = v4;
    v2->_binWidth = v3[1] - *v3;
    v2->_numTErrorBins = -1;
    [(CLWaterTemperatureEstimator *)v2 getEnclosureMaterial];
    [(CLWaterTemperatureEstimator *)v2 setWaterTempCoefficients];
  }
  return v2;
}

- (void)updateWithTDot:(const float *)a3 andTempMeasurement:(const float *)a4
{
  *(float *)&double v4 = *a4;
  [(CLWaterTemperatureEstimator *)self setWaterTempEst:v4];
  LODWORD(v8) = 5.0;
  [(CLWaterTemperatureEstimator *)self setWaterTempUncertainty:v8];
  if ([(CLWaterTemperatureEstimator *)self coefficientsUpdated])
  {
    *(float *)&double v9 = *a3;
    if (*a3 >= *(float *)qword_1024858D0 && *(float *)&v9 <= *(float *)(qword_1024858D0 + 4 * self->_numTDotBins - 4))
    {
      unsigned int v10 = llroundf((float)(*(float *)&v9 - *(float *)qword_1024858D0) / self->_binWidth);
      *(float *)&double v9 = *a4 - self->_tempCoefficients.deltaTemp.__begin_[v10];
      [(CLWaterTemperatureEstimator *)self setWaterTempEst:v9];
      *(float *)&double v11 = self->_tempCoefficients.tempUncertainty.__begin_[v10];
      [(CLWaterTemperatureEstimator *)self setWaterTempUncertainty:v11];
    }
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_102311ED8);
  }
  v12 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    double v13 = *a4;
    double v14 = *a3;
    [(CLWaterTemperatureEstimator *)self waterTempEst];
    double v16 = v15;
    [(CLWaterTemperatureEstimator *)self waterTempUncertainty];
    *(_DWORD *)buf = 134218752;
    double v20 = v13;
    __int16 v21 = 2048;
    double v22 = v14;
    __int16 v23 = 2048;
    double v24 = v16;
    __int16 v25 = 2048;
    double v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "tdot estimator, temp, %f, tdot, %f, est temp, %f, est uncertainty, %f", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102311ED8);
    }
    [(CLWaterTemperatureEstimator *)self waterTempEst];
    [(CLWaterTemperatureEstimator *)self waterTempUncertainty];
    v18 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWaterTemperatureEstimator updateWithTDot:andTempMeasurement:]", "%s\n", v18);
    if (v18 != (char *)buf) {
      free(v18);
    }
  }
}

- (void)getEnclosureMaterial
{
  int v3 = MGGetSInt32Answer();
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_102311ED8);
  }
  double v4 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "device enclosure material is %u", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102311ED8);
    }
    int v13 = 67109120;
    int v14 = v3;
    double v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWaterTemperatureEstimator getEnclosureMaterial]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (v3) {
    self->_uint64_t enclosureMaterial = v3;
  }
  if (self->_logEnclosureMaterial)
  {
    sub_10170140C(buf);
    sub_1017264C8((uint64_t)buf);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v12 |= 1u;
    CFAbsoluteTime v10 = Current;
    uint64_t v6 = v11;
    uint64_t enclosureMaterial = self->_enclosureMaterial;
    *(unsigned char *)(v11 + 24) |= 1u;
    *(void *)(v6 + 8) = enclosureMaterial;
    if (qword_10248AF88 != -1) {
      dispatch_once(&qword_10248AF88, &stru_102311EF8);
    }
    if (qword_10248AF90) {
      sub_1019E5150(qword_10248AF90, (uint64_t)buf);
    }
    sub_101706914((PB::Base *)buf);
  }
}

- (void)setWaterTempCoefficients
{
  int v3 = sub_1000B5AD4();
  *(_DWORD *)buf = self->_enclosureMaterial;
  *(_DWORD *)double v22 = v3;
  double v4 = sub_101119EBC(qword_102485948, (int *)buf);
  if (v4)
  {
    uint64_t v5 = v4[3];
    if (&self->_tempCoefficients != (CLWaterTemperatureCoefficients *)v5)
    {
      sub_1000FB43C((char *)&self->_tempCoefficients, *(char **)v5, *(void *)(v5 + 8), (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2);
      sub_1000FB43C((char *)&self->_tempCoefficients.tempUncertainty, *(char **)(v5 + 24), *(void *)(v5 + 32), (uint64_t)(*(void *)(v5 + 32) - *(void *)(v5 + 24)) >> 2);
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102311ED8);
    }
    uint64_t v6 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      *(CFAbsoluteTime *)double v22 = Current;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "temperature coefficients updated,timestamp,%f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102311ED8);
      }
      CFAbsoluteTimeGetCurrent();
      double v8 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWaterTemperatureEstimator setWaterTempCoefficients]", "%s\n");
LABEL_31:
      if (v8 != buf) {
        free(v8);
      }
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102311ED8);
    }
    double v9 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_FAULT))
    {
      CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      *(CFAbsoluteTime *)double v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "temperature coefficients not found,using defaults for replay,timestamp,%f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102311ED8);
      }
      CFAbsoluteTimeGetCurrent();
      double v8 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWaterTemperatureEstimator setWaterTempCoefficients]", "%s\n");
      goto LABEL_31;
    }
  }
  self->_numTErrorBins = (unint64_t)((char *)self->_tempCoefficients.deltaTemp.__end_
                                          - (char *)self->_tempCoefficients.deltaTemp.__begin_) >> 2;
  if ([(CLWaterTemperatureEstimator *)self coefficientsUpdated])
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102311ED8);
    }
    uint64_t v11 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      begin = self->_tempCoefficients.deltaTemp.__begin_;
      end = self->_tempCoefficients.deltaTemp.__end_;
      uint64_t v14 = end - begin;
      double v15 = *begin;
      double v16 = *(end - 1);
      double v17 = *(float *)qword_1024858D0;
      double v18 = *(float *)(qword_1024858D8 - 4);
      LODWORD(end) = self->_enclosureMaterial;
      LODWORD(begin) = self->_numTDotBins;
      double binWidth = self->_binWidth;
      *(_DWORD *)buf = 67110912;
      *(_DWORD *)double v22 = end;
      *(_WORD *)&v22[4] = 2048;
      *(void *)&v22[6] = v14;
      __int16 v23 = 2048;
      double v24 = v15;
      __int16 v25 = 2048;
      double v26 = v16;
      __int16 v27 = 2048;
      double v28 = v17;
      __int16 v29 = 2048;
      double v30 = v18;
      __int16 v31 = 1024;
      int v32 = (int)begin;
      __int16 v33 = 2048;
      double v34 = binWidth;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "enclosure details,material,%u,deltaTempCount,%zu,firstDeltaTemp,%f,lastDeltaTemp,%f,firstTDot,%f,lastTDot,%f,numBins,%d,binWidth,%f", buf, 0x4Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102311ED8);
      }
      double v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWaterTemperatureEstimator setWaterTempCoefficients]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
  }
}

- (BOOL)coefficientsUpdated
{
  return self->_numTErrorBins == self->_numTDotBins;
}

- (float)waterTempEst
{
  return self->_waterTempEst;
}

- (void)setWaterTempEst:(float)a3
{
  self->_waterTempEst = a3;
}

- (float)waterTempUncertainty
{
  return self->_waterTempUncertainty;
}

- (void)setWaterTempUncertainty:(float)a3
{
  self->_waterTempUncertainty = a3;
}

- (void).cxx_destruct
{
  begin = self->_tempCoefficients.tempUncertainty.__begin_;
  if (begin)
  {
    self->_tempCoefficients.tempUncertainty.__end_ = begin;
    operator delete(begin);
  }
  double v4 = self->_tempCoefficients.deltaTemp.__begin_;
  if (v4)
  {
    self->_tempCoefficients.deltaTemp.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end