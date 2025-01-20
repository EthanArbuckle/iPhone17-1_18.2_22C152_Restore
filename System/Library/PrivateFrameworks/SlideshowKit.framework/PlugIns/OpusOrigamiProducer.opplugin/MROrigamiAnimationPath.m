@interface MROrigamiAnimationPath
- (MROrigamiAnimationPath)initWithControlPoints:(double *)(a3 keyTimes:values:length:;
- (MROrigamiAnimationPath)initWithSwingType:(int)a3;
- (float)timeFirstAtRestValue;
- (float)valueAtTime:(float)a3;
- (void)dealloc;
@end

@implementation MROrigamiAnimationPath

- (MROrigamiAnimationPath)initWithSwingType:(int)a3
{
  switch(a3)
  {
    case 0:
      long long v15 = xmmword_165668;
      long long v16 = unk_165678;
      long long v17 = xmmword_165688;
      long long v18 = unk_165698;
      long long v13 = xmmword_165648;
      long long v14 = unk_165658;
      v3 = &xmmword_165628;
      goto LABEL_5;
    case 1:
      long long v15 = xmmword_165668;
      long long v16 = unk_165678;
      long long v17 = xmmword_165688;
      long long v18 = unk_165698;
      long long v13 = xmmword_165648;
      long long v14 = unk_165658;
      v3 = &xmmword_1656A8;
LABEL_5:
      long long v5 = v3[1];
      long long v11 = *v3;
      long long v12 = v5;
      v6 = &xmmword_1656C8;
      goto LABEL_9;
    case 2:
      long long v15 = xmmword_165708;
      long long v16 = unk_165718;
      long long v17 = xmmword_165728;
      long long v18 = unk_165738;
      long long v13 = xmmword_1656E8;
      long long v14 = unk_1656F8;
      long long v11 = xmmword_165748;
      *(void *)&long long v12 = 0x3FF0000000000000;
      long long v9 = xmmword_165760;
      *(void *)&long long v10 = 0x3FE921FB54442B65;
      uint64_t v7 = 3;
      goto LABEL_10;
    case 3:
      long long v13 = xmmword_165778;
      long long v14 = unk_165788;
      long long v11 = xmmword_165840;
      long long v9 = xmmword_165850;
      uint64_t v7 = 2;
      goto LABEL_10;
    case 4:
      long long v15 = xmmword_1657B8;
      long long v16 = unk_1657C8;
      long long v17 = xmmword_1657D8;
      long long v18 = unk_1657E8;
      long long v13 = xmmword_165798;
      long long v14 = unk_1657A8;
      long long v11 = xmmword_1657F8;
      long long v12 = unk_165808;
      v6 = &xmmword_165818;
LABEL_9:
      long long v8 = v6[1];
      long long v9 = *v6;
      long long v10 = v8;
      uint64_t v7 = 4;
LABEL_10:
      result = -[MROrigamiAnimationPath initWithControlPoints:keyTimes:values:length:](self, "initWithControlPoints:keyTimes:values:length:", &v13, &v11, &v9, v7, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (MROrigamiAnimationPath)initWithControlPoints:(double *)(a3 keyTimes:values:length:
{
  v34.receiver = self;
  v34.super_class = (Class)MROrigamiAnimationPath;
  long long v10 = [(MROrigamiAnimationPath *)&v34 init];
  long long v11 = v10;
  if (v10)
  {
    v10->_uint64_t length = a6;
    v10->_curves = (id *)malloc_type_malloc(8 * a6 - 8, 0x80040B8603338uLL);
    uint64_t length = v11->_length;
    if (length > 1)
    {
      uint64_t v13 = 0;
      do
      {
        v11->_curves[v13++] = [[MRCAMLBezierData alloc] initWithControlPoints:a3];
        uint64_t length = v11->_length;
        ++a3;
      }
      while (length - 1 > v13);
    }
    long long v14 = (double *)malloc_type_malloc(8 * length, 0x100004000313F17uLL);
    v11->_keyTimes = v14;
    uint64_t v15 = v11->_length;
    if (v15 >= 1)
    {
      int64_t v16 = v11->_length;
      do
      {
        uint64_t v17 = *(void *)a4++;
        *(void *)v14++ = v17;
        --v16;
      }
      while (v16);
    }
    long long v18 = (double *)malloc_type_malloc(8 * v15, 0x100004000313F17uLL);
    v11->_values = v18;
    uint64_t v19 = v11->_length;
    uint64_t v20 = v19 - 1;
    if (v19 >= 1)
    {
      double v21 = *a5;
      v22 = v18;
      do
      {
        double v23 = *a5++;
        *v22++ = v23 - v21;
        --v19;
      }
      while (v19);
    }
    uint64_t v24 = 0;
    double v25 = v18[v20];
    uint64_t v26 = v20 & ~(v20 >> 63);
    while (v26 != v24)
    {
      uint64_t v27 = v24 + 1;
      double v28 = v18[++v24];
      if (v28 > v25)
      {
        v29 = &v11->_keyTimes[v27];
        double v30 = *(v29 - 1);
        double v31 = *v29;
        objc_msgSend(v11->_curves[v27 - 1], "evaluate_inverseAtTime:", (v25 - v18[v27 - 1]) / (v28 - v18[v27 - 1]));
        *(float *)&double v32 = v30 + v32 * (v31 - v30);
        v11->_timeFirstAtRestValue = *(float *)&v32;
        return v11;
      }
    }
  }
  return v11;
}

- (void)dealloc
{
  if (self->_length >= 2)
  {
    int64_t v3 = 0;
    do

    while (self->_length - 1 > v3);
  }
  free(self->_curves);
  free(self->_keyTimes);
  free(self->_values);
  v4.receiver = self;
  v4.super_class = (Class)MROrigamiAnimationPath;
  [(MROrigamiAnimationPath *)&v4 dealloc];
}

- (float)valueAtTime:(float)a3
{
  if (a3 >= 1.0) {
    return self->_values[self->_length - 1];
  }
  else {
    ValueFromBezierPath(self->_curves, self->_keyTimes, 0.0, 1.0, a3, (uint64_t)self->_values, self->_length);
  }
  return v3;
}

- (float)timeFirstAtRestValue
{
  return self->_timeFirstAtRestValue;
}

@end