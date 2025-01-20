@interface CLIndoorLocation
+ (BOOL)supportsSecureCoding;
+ (id)fromGpsEstimate:(id)a3;
+ (id)fromPoseEstimate:(const void *)a3;
+ (id)fromPoseEstimate:(const void *)a3 andGpsEstimate:(id)a4;
- ($146E4FC062DDF4A2C58C04BCAEC0B25D)diagnosticReport;
- ($B16919DCCD4DB8B6BF8FD96F109B3512)locationPrivate;
- ($F74020F89A9F44914ED835A726641817)location;
- (BOOL)requestsGpsAssistance;
- (CLIndoorLocation)initWithCoder:(id)a3;
- (NSString)locationDescription;
- (NSString)locationId;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDiagnosticReport:(id *)a3;
- (void)setLocation:(id *)a3;
- (void)setLocationDescription:(id)a3;
- (void)setLocationId:(id)a3;
- (void)setLocationPrivate:(id *)a3;
- (void)setRequestsGpsAssistance:(BOOL)a3;
@end

@implementation CLIndoorLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLIndoorLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CLIndoorLocation;
  v5 = [(CLIndoorLocation *)&v23 init];
  if (v5)
  {
    sub_10003442C(v4, (char *)v22);
    long long v6 = v22[3];
    *(_OWORD *)(v5 + 200) = v22[2];
    *(_OWORD *)(v5 + 216) = v6;
    long long v7 = v22[5];
    *(_OWORD *)(v5 + 232) = v22[4];
    *(_OWORD *)(v5 + 248) = v7;
    long long v8 = v22[1];
    *(_OWORD *)(v5 + 168) = v22[0];
    *(_OWORD *)(v5 + 184) = v8;
    long long v9 = v22[7];
    *(_OWORD *)(v5 + 264) = v22[6];
    *(_OWORD *)(v5 + 280) = v9;
    *(_OWORD *)(v5 + 296) = v22[8];
    *(_OWORD *)(v5 + 308) = *(_OWORD *)((char *)&v22[8] + 12);
    sub_100034350(v4, (char *)v22);
    memcpy(v5 + 328, v22, 0x230uLL);
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationId"];
    v11 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationDescription"];
    v13 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v12;

    v5[8] = [v4 decodeBoolForKey:@"gpsAssistance"];
    sub_1001E1874(v4, (char *)v22);
    uint64_t v14 = *(void *)&v22[8];
    long long v15 = v22[7];
    *((_OWORD *)v5 + 8) = v22[6];
    *((_OWORD *)v5 + 9) = v15;
    *((void *)v5 + 20) = v14;
    long long v17 = v22[4];
    long long v16 = v22[5];
    long long v18 = v22[3];
    *((_OWORD *)v5 + 4) = v22[2];
    *((_OWORD *)v5 + 5) = v18;
    *((_OWORD *)v5 + 6) = v17;
    *((_OWORD *)v5 + 7) = v16;
    long long v19 = v22[1];
    *((_OWORD *)v5 + 2) = v22[0];
    *((_OWORD *)v5 + 3) = v19;
    v20 = v5;
  }

  return (CLIndoorLocation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  sub_1001E184C(v4, (uint64_t)&self->_location);
  sub_1001E1860(v4, (uint64_t)&self->_location.ellipsoidalAltitude);
  [v4 encodeObject:self->_locationId forKey:@"locationId"];
  [v4 encodeObject:self->_locationDescription forKey:@"locationDescription"];
  [v4 encodeBool:self->_requestsGpsAssistance forKey:@"gpsAssistance"];
  sub_1001E1908(v4, (uint64_t)&self->_diagnosticReport);
}

- (id)description
{
  [(CLIndoorLocation *)self location];
  [(CLIndoorLocation *)self location];
  [(CLIndoorLocation *)self location];
  v3 = [(CLIndoorLocation *)self locationId];
  id v4 = [(CLIndoorLocation *)self locationDescription];
  [(CLIndoorLocation *)self location];
  unsigned int v5 = [(CLIndoorLocation *)self requestsGpsAssistance];
  [(CLIndoorLocation *)self location];
  long long v6 = "no";
  if (v5) {
    long long v6 = "yes";
  }
  long long v7 = +[NSString stringWithFormat:@"lat/lon=[%lf, %lf] on floor %d (%@: %@) +/- %lf meters (gps assistance = %s) with location type %d", v12, v11, v13, v3, v4, v10, v6, v9];

  return v7;
}

- ($F74020F89A9F44914ED835A726641817)location
{
  long long v3 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var5 = v3;
  long long v4 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&self[1].var6;
  *(_OWORD *)&retstr->var9 = v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 var1 = self[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var21;
  *($F24F406B2B787EFB06265DBA3D28CBD5 *)&retstr->var1.$F24F406B2B787EFB06265DBA3D28CBD5 var1 = var1;
  $F24F406B2B787EFB06265DBA3D28CBD5 v6 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&self[1].var12;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&self[1].var10;
  retstr->var13 = v6;
  *(_OWORD *)&retstr->var14 = *(_OWORD *)&self[1].var13.var1;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)((char *)&self[1].var14 + 4);
  return self;
}

- (void)setLocation:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_location.coordinate.longitude = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_location.suitability = v3;
  long long v4 = *(_OWORD *)&a3->var3;
  long long v5 = *(_OWORD *)&a3->var5;
  long long v6 = *(_OWORD *)&a3->var7;
  *(_OWORD *)&self->_location.timestamp = *(_OWORD *)&a3->var9;
  *(_OWORD *)&self->_location.course = v6;
  *(_OWORD *)&self->_location.speed = v5;
  *(_OWORD *)&self->_location.altitude = v4;
  long long v7 = *(_OWORD *)&a3->var11;
  $AB5116BA7E623E054F959CECB034F4E7 var13 = ($AB5116BA7E623E054F959CECB034F4E7)a3->var13;
  long long v9 = *(_OWORD *)&a3->var14;
  *(_OWORD *)&self->_location.integrity = *(_OWORD *)&a3->var16;
  self->_location.rawCoordinate = var13;
  *(_OWORD *)&self->_location.rawCourse = v9;
  *(_OWORD *)&self->_location.lifespan = v7;
}

- ($B16919DCCD4DB8B6BF8FD96F109B3512)locationPrivate
{
  return ($B16919DCCD4DB8B6BF8FD96F109B3512 *)memcpy(retstr, &self->_location.ellipsoidalAltitude, sizeof($B16919DCCD4DB8B6BF8FD96F109B3512));
}

- (void)setLocationPrivate:(id *)a3
{
}

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
}

- (NSString)locationDescription
{
  return self->_locationDescription;
}

- (void)setLocationDescription:(id)a3
{
}

- (BOOL)requestsGpsAssistance
{
  return self->_requestsGpsAssistance;
}

- (void)setRequestsGpsAssistance:(BOOL)a3
{
  self->_requestsGpsAssistance = a3;
}

- ($146E4FC062DDF4A2C58C04BCAEC0B25D)diagnosticReport
{
  long long v3 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var8 = *(_OWORD *)&self->var12;
  *(_OWORD *)&retstr->var10 = v3;
  *(double *)&retstr->var12 = self[1].var3;
  long long v4 = *(_OWORD *)&self->var7[3];
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var7[1];
  *(_OWORD *)&retstr->var6 = v4;
  long long v5 = *(_OWORD *)&self->var10;
  *(_OWORD *)&retstr->var7[1] = *(_OWORD *)&self->var8;
  *(_OWORD *)&retstr->var7[3] = v5;
  long long v6 = *(_OWORD *)&self->var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var2 = v6;
  return self;
}

- (void)setDiagnosticReport:(id *)a3
{
  *(_OWORD *)&self->_diagnosticReport.yieldType = *(_OWORD *)&a3->var0;
  long long v3 = *(_OWORD *)&a3->var2;
  long long v4 = *(_OWORD *)&a3->var4;
  long long v5 = *(_OWORD *)&a3->var7[1];
  *(_OWORD *)&self->_diagnosticReport.prbOnFloors = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_diagnosticReport.prbOnFloor[1] = v5;
  *(_OWORD *)&self->_diagnosticReport.prbCoarseIndoorSaysIndoor = v3;
  *(_OWORD *)&self->_diagnosticReport.prbGpsSaysIndoor = v4;
  long long v6 = *(_OWORD *)&a3->var7[3];
  long long v7 = *(_OWORD *)&a3->var8;
  long long v8 = *(_OWORD *)&a3->var10;
  *(void *)&self->_diagnosticReport.pfYieldStatusBeforeCalculatePose = *(void *)&a3->var12;
  *(_OWORD *)&self->_diagnosticReport.prbInlier = v7;
  *(_OWORD *)&self->_diagnosticReport.prbInjectionOccupancyRetryLimitOk = v8;
  *(_OWORD *)&self->_diagnosticReport.prbOnFloor[3] = v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDescription, 0);

  objc_storeStrong((id *)&self->_locationId, 0);
}

+ (id)fromPoseEstimate:(const void *)a3
{
  return +[CLIndoorLocation fromPoseEstimate:a3 andGpsEstimate:0];
}

+ (id)fromGpsEstimate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    long long v4 = objc_alloc_init(CLIndoorLocation);
    long long v16 = 0u;
    memset(v17, 0, 28);
    long long v15 = 0u;
    long long v13 = 0u;
    memset(v14, 0, sizeof(v14));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    [v3 gpsLocation];
    memset(__src, 0, 512);
    [v3 gpsLocationPrivate];
    *(void *)((char *)v14 + 12) = 0;
    *((void *)&__src[21] + 1) = 0;
    *(void *)&__src[2] = 0;
    *((void *)&__src[1] + 1) = 0;
    v7[6] = v15;
    v7[7] = v16;
    v8[0] = v17[0];
    *(_OWORD *)((char *)v8 + 12) = *(_OWORD *)((char *)v17 + 12);
    v7[2] = v12;
    v7[3] = v13;
    v7[0] = v10;
    v7[1] = v11;
    v7[4] = v14[0];
    v7[5] = v14[1];
    [(CLIndoorLocation *)v4 setLocation:v7];
    memcpy(v6, __src, sizeof(v6));
    [(CLIndoorLocation *)v4 setLocationPrivate:v6];
  }
  else
  {
    long long v4 = 0;
  }

  return v4;
}

+ (id)fromPoseEstimate:(const void *)a3 andGpsEstimate:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    long long v6 = +[CLIndoorLocation fromGpsEstimate:v5];
  }
  else
  {
    long long v6 = objc_alloc_init(CLIndoorLocation);
  }
  long long v7 = v6;
  if (v6)
  {
    sub_100085B24(__src, (uint64_t)a3 + 104);
    char v8 = sub_1000706F4((const void ***)__src, (unsigned __int8 ***)&qword_10047ED40);
    char v9 = v8;
    long long v10 = (std::__shared_weak_count *)*((void *)&__src[0] + 1);
    if (*((void *)&__src[0] + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&__src[0] + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
      if (v9)
      {
LABEL_8:
        long long v11 = 0;
        if ((*((unsigned char *)a3 + 752) & 2) == 0)
        {
LABEL_9:
          double v12 = NAN;
          uint64_t v13 = 0x7FF8000000000000;
          goto LABEL_17;
        }
LABEL_12:
        uint64_t v13 = 0x7FF8000000000000;
        if (*((unsigned char *)a3 + 64)) {
          double v12 = *((double *)a3 + 6);
        }
        else {
          double v12 = NAN;
        }
        if ((*((unsigned char *)a3 + 64) & 2) != 0) {
          uint64_t v13 = *((void *)a3 + 7);
        }
LABEL_17:
        memset(&__src[35], 0, 156);
        [(CLIndoorLocation *)v7 location];
        LODWORD(__src[35]) = 0xFFFF;
        *(double *)((char *)&__src[41] + 4) = v12;
        *(void *)((char *)&__src[41] + 12) = v13;
        *(double *)((char *)&__src[35] + 4) = v12;
        *(void *)((char *)&__src[35] + 12) = v13;
        unint64_t v14 = *((void *)a3 + 94);
        double v15 = *((double *)a3 + 35);
        double v16 = -1.0;
        if ((v14 & 0x4000000) == 0) {
          double v15 = -1.0;
        }
        *(double *)((char *)&__src[36] + 4) = v15;
        if (!v5)
        {
          double v17 = *((double *)a3 + 87);
          if ((v14 & 0x80000000000000) == 0) {
            double v17 = -1.0;
          }
          *(double *)((char *)&__src[36] + 12) = v17;
          if ((v14 & 0x8000000) != 0) {
            double v16 = *((double *)a3 + 36);
          }
          *(double *)((char *)&__src[37] + 4) = v16;
          int8x16_t v18 = (int8x16_t)vdupq_n_s64(v14);
          __asm { FMOV            V2.2D, #-1.0 }
          int8x16_t v24 = *(int8x16_t *)((char *)a3 + 632);
          *(int8x16_t *)((char *)&__src[37] + 12) = vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v18, (int8x16_t)xmmword_1003FE930)), _Q2, *(int8x16_t *)((char *)a3 + 616));
          *(int8x16_t *)((char *)&__src[38] + 12) = vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v18, (int8x16_t)xmmword_1003FE940)), _Q2, v24);
        }
        *(void *)((char *)&__src[39] + 12) = *((void *)a3 + 86);
        DWORD1(__src[40]) = 96;
        LODWORD(__src[43]) = 75;
        int v25 = sub_100385D80(*((_DWORD *)a3 + 131));
        double v26 = *((double *)a3 + 64);
        if (v25 == 11) {
          double v26 = 5.0;
        }
        if ((*((void *)a3 + 94) & 0x80) != 0) {
          int v27 = *((_DWORD *)a3 + 32);
        }
        else {
          int v27 = 0x7FFFFFFF;
        }
        *((double *)&__src[40] + 1) = v26;
        LODWORD(__src[41]) = v25;
        HIDWORD(__src[42]) = v27;
        *(void *)((char *)&__src[43] + 4) = 1;
        memset(__src, 0, 512);
        [(CLIndoorLocation *)v7 locationPrivate];
        *(void *)&__src[2] = *((void *)a3 + 84);
        *((void *)&__src[21] + 1) = *((void *)a3 + 85);
        DWORD2(__src[3]) = 1;
        v47[6] = __src[41];
        v47[7] = __src[42];
        v48[0] = __src[43];
        *(_OWORD *)((char *)v48 + 12) = *(_OWORD *)((char *)&__src[43] + 12);
        v47[2] = __src[37];
        v47[3] = __src[38];
        v47[4] = __src[39];
        v47[5] = __src[40];
        v47[0] = __src[35];
        v47[1] = __src[36];
        [(CLIndoorLocation *)v7 setLocation:v47];
        memcpy(__dst, __src, sizeof(__dst));
        [(CLIndoorLocation *)v7 setLocationPrivate:__dst];
        [(CLIndoorLocation *)v7 setLocationDescription:0];
        [(CLIndoorLocation *)v7 setLocationId:v11];
        [(CLIndoorLocation *)v7 setRequestsGpsAssistance:*((unsigned __int8 *)a3 + 464)];
        long long v28 = *(_OWORD *)((char *)a3 + 328);
        *(_OWORD *)((char *)v42 + 8) = *(_OWORD *)((char *)a3 + 312);
        int v29 = *((_DWORD *)a3 + 152);
        if (v29 == 1) {
          int v30 = 2;
        }
        else {
          int v30 = 1;
        }
        if (v29 == 2) {
          int v31 = 3;
        }
        else {
          int v31 = v30;
        }
        LODWORD(v42[0]) = v31;
        *(_OWORD *)((char *)&v42[1] + 8) = v28;
        *(_OWORD *)((char *)&v42[2] + 8) = *(_OWORD *)((char *)a3 + 344);
        memset_pattern16((char *)&v42[3] + 8, &unk_1003FE960, 0x28uLL);
        v32 = (const void *)*((void *)a3 + 45);
        unint64_t v33 = (uint64_t)(*((void *)a3 + 46) - (void)v32) >> 3;
        if (v33 >= 5) {
          unint64_t v33 = 5;
        }
        if (v33) {
          memcpy((char *)&v42[3] + 8, v32, 8 * v33);
        }
        long long v34 = *((_OWORD *)a3 + 25);
        long long v43 = *((_OWORD *)a3 + 24);
        long long v44 = v34;
        int v35 = *((_DWORD *)a3 + 104) - 1;
        if (v35 > 3)
        {
          LODWORD(v45) = 1;
          unsigned int v36 = *((_DWORD *)a3 + 105) - 1;
          if (v36 > 3) {
            goto LABEL_42;
          }
        }
        else
        {
          LODWORD(v45) = dword_1003FEDAC[v35];
          unsigned int v36 = *((_DWORD *)a3 + 105) - 1;
          if (v36 > 3)
          {
LABEL_42:
            int v37 = 1;
LABEL_45:
            HIDWORD(v45) = v37;
            v40[6] = v43;
            v40[7] = v44;
            v40[2] = v42[2];
            v40[3] = v42[3];
            v40[4] = v42[4];
            v40[5] = v42[5];
            v40[0] = v42[0];
            v40[1] = v42[1];
            uint64_t v41 = v45;
            [(CLIndoorLocation *)v7 setDiagnosticReport:v40];
            v38 = v7;

            goto LABEL_46;
          }
        }
        int v37 = dword_1003FEDAC[v36];
        goto LABEL_45;
      }
    }
    else if (v8)
    {
      goto LABEL_8;
    }
    long long v11 = +[NSString ps_stringWithSTL:(char *)a3 + 104];
    if ((*((unsigned char *)a3 + 752) & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
LABEL_46:

  return v7;
}

@end