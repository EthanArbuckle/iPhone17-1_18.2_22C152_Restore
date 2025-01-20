@interface CpuPiecewiseCC
- (CpuPiecewiseCC)initWithParams:(__CFDictionary *)a3 listID:(int)a4 needspowerZones:(BOOL)a5;
- (int)maxLoadIndexToDVDFactor1:(int)a3;
- (void)refreshFunctionalTelemetry;
@end

@implementation CpuPiecewiseCC

- (CpuPiecewiseCC)initWithParams:(__CFDictionary *)a3 listID:(int)a4 needspowerZones:(BOOL)a5
{
  v22.receiver = self;
  v22.super_class = (Class)CpuPiecewiseCC;
  LODWORD(v5) = 1.0;
  v7 = [(CpuCC *)&v22 initWithParams:a3 powerScale:*(void *)&a4 listID:a5 needspowerZones:v5];
  v8 = v7;
  if (!v7) {
    return (CpuPiecewiseCC *)v8;
  }
  v9 = v7 + 212;
  *(_OWORD *)(v7 + 212) = 0u;
  *(_OWORD *)(v7 + 228) = 0u;
  *((_DWORD *)v7 + 61) = 0;
  v10 = v7 + 248;
  *((_DWORD *)v7 + 70) = 0;
  *(_OWORD *)(v7 + 248) = 0u;
  *(_OWORD *)(v7 + 264) = 0u;
  Value = (void *)CFDictionaryGetValue(a3, @"maxLoadIndexLimits");
  v12 = (void *)CFDictionaryGetValue(a3, @"dvdFactor1Limits");
  id v13 = [Value count];
  if (v13 != [v12 count])
  {
    v14 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055D80(v14);
    }
  }
  int v15 = [Value count];
  *((_DWORD *)v8 + 52) = v15;
  if (v15 < 10) {
    goto LABEL_8;
  }
  v16 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CpuPiecewiseCC initWithParams:listID:needspowerZones:]";
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "<Error> %s: data array too large", buf, 0xCu);
    int v15 = *((_DWORD *)v8 + 52);
LABEL_8:
    if (v15 < 1) {
      return (CpuPiecewiseCC *)v8;
    }
  }
  uint64_t v17 = 0;
  do
  {
    *(_DWORD *)&v9[4 * v17] = [Value objectAtIndex:v17];
    *(_DWORD *)&v10[4 * v17] = [v12 objectAtIndex:v17].intValue;
    ++v17;
    uint64_t v18 = *((int *)v8 + 52);
  }
  while (v17 < v18);
  if ((int)v18 >= 2)
  {
    uint64_t v19 = 0;
    do
    {
      if (*(_DWORD *)&v9[4 * v19] >= *(_DWORD *)&v9[4 * v19 + 4]
        || *(_DWORD *)&v10[4 * v19] >= *(_DWORD *)&v10[4 * v19 + 4])
      {
        v20 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v24 = "-[CpuPiecewiseCC initWithParams:listID:needspowerZones:]";
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "<Error> %s: data improperly sorted", buf, 0xCu);
          LODWORD(v18) = *((_DWORD *)v8 + 52);
        }
      }
      ++v19;
    }
    while (v19 < (int)v18 - 1);
  }
  return (CpuPiecewiseCC *)v8;
}

- (void)refreshFunctionalTelemetry
{
  *(&self->super.super.currentPower + 1) = [(CpuPiecewiseCC *)self maxLoadIndexToDVDFactor1:self->super.super.currentLoadingIndex];
  *(_DWORD *)&self->super.super.allowLIOverride = self->super.super.currentLoadingIndex;
}

- (int)maxLoadIndexToDVDFactor1:(int)a3
{
  v3 = &self->super._directMapIntercept + 1;
  int v4 = *((_DWORD *)&self->super._directMapIntercept + 1);
  uint64_t directMapIntercept_low = LODWORD(self->super._directMapIntercept);
  if (v4 <= a3)
  {
    int v4 = LODWORD(v3[(int)directMapIntercept_low - 1]);
    if (v4 >= a3) {
      int v4 = a3;
    }
  }
  if ((int)directMapIntercept_low < 2)
  {
    LODWORD(directMapIntercept_low) = 1;
  }
  else
  {
    uint64_t v6 = 1;
    while (v4 >= SLODWORD(v3[v6]))
    {
      if (directMapIntercept_low == ++v6) {
        goto LABEL_11;
      }
    }
    LODWORD(directMapIntercept_low) = v6;
  }
LABEL_11:
  uint64_t v7 = (int)directMapIntercept_low - 1;
  float v8 = v3[v7];
  float v9 = v3[directMapIntercept_low];
  if (LODWORD(v9) == LODWORD(v8)) {
    return 0;
  }
  else {
    return (int)(float)((float)((float)((float)(LODWORD(v9) - v4) * (float)self->_maxLoadIndexLimits[v7 + 7])
  }
                              + (float)((float)self->_maxLoadIndexLimits[directMapIntercept_low + 7]
                                      * (float)(v4 - LODWORD(v8))))
                      / (float)(LODWORD(v9) - LODWORD(v8)));
}

@end