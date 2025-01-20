@interface PAEEquirectProjectFilter
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameCleanup;
- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5;
- (BOOL)getIsFrontFacing:(id)a3;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (BOOL)variesOverTime;
- (HGEquirectProjectParams)getParams:(SEL)a3 withOutputImage:(id *)a4 inputImage:(id)a5 width:(id)a6 height:(unint64_t)a7 outputWidth:(unint64_t)a8 outputHeight:(unint64_t)a9 xRotation:(unint64_t)a10 yRotation:(double)a11 zRotation:(double)a12 cameraBehavior:(double)a13 paramAPI:(int)a14;
- (PAEEquirectProjectFilter)initWithAPIManager:(id)a3;
- (PCMatrix44Tmpl<double>)composeViewMatrix:(SEL)a3 withCameraBehavior:(id)a4 heroAngle:(int)a5;
- (PCMatrix44Tmpl<double>)getViewMatrix:(SEL)a3;
- (double)convertToFOVXFromFOVY:(double)a3 width:(double)a4 height:(double)a5;
- (double)convertToFOVYFromFOVX:(double)a3 width:(double)a4 height:(double)a5;
- (double)getInitialYaw:(id)a3;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
- (void)getProjectionFOVYDegrees:(float *)a3 FOVXDegrees:(float *)a4 withFrameAspect:(double)a5 atTime:(id)a6;
- (void)getQuaternion:(id)a3 :(double *)a4 :(double *)a5 :(double *)a6 :(double *)a7;
@end

@implementation PAEEquirectProjectFilter

- (PAEEquirectProjectFilter)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEEquirectProjectFilter;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (BOOL)addParameters
{
  v2 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
  v3 = v2;
  if (v2)
  {
    [v2 addAngleSliderWithName:@"X Rotation" parmId:1 defaultValue:0 parameterMin:0.0 parameterMax:-3600.0 parmFlags:3600.0];
    [v3 addAngleSliderWithName:@"Y Rotation" parmId:2 defaultValue:0 parameterMin:0.0 parameterMax:-3600.0 parmFlags:3600.0];
    [v3 addAngleSliderWithName:@"Z Rotation" parmId:3 defaultValue:0 parameterMin:0.0 parameterMax:-3600.0 parmFlags:3600.0];
    [v3 addToggleButtonWithName:@"FrontFacing" parmId:4 defaultValue:1 parmFlags:0];
    [v3 addAngleSliderWithName:@"Initial YAW" parmId:5 defaultValue:0 parameterMin:0.0 parameterMax:-3600.0 parmFlags:3600.0];
    [v3 addFloatSliderWithName:@"Quat X" parmId:6 defaultValue:0 parameterMin:0.0 parameterMax:-1024.0 sliderMin:1024.0 sliderMax:-1024.0 delta:1024.0 parmFlags:0.001];
    [v3 addFloatSliderWithName:@"Quat Y" parmId:7 defaultValue:0 parameterMin:0.0 parameterMax:-1024.0 sliderMin:1024.0 sliderMax:-1024.0 delta:1024.0 parmFlags:0.001];
    [v3 addFloatSliderWithName:@"Quat Z" parmId:8 defaultValue:0 parameterMin:0.0 parameterMax:-1024.0 sliderMin:1024.0 sliderMax:-1024.0 delta:1024.0 parmFlags:0.001];
    [v3 addFloatSliderWithName:@"Quat W" parmId:9 defaultValue:0 parameterMin:0.0 parameterMax:-1024.0 sliderMin:1024.0 sliderMax:-1024.0 delta:1024.0 parmFlags:0.001];
  }
  return v3 != 0;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithInt:3];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:67584];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:591872];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PixelTransformSupport", v4, @"TransformsFromLocalToScreenSpace", v5, @"UsesRationalTime", v6, @"SupportsHeliumRendering", v7, @"SDRWorkingSpace", v8, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a4 = 0;
  *a5 = 0;
  return 1;
}

- (PCMatrix44Tmpl<double>)getViewMatrix:(SEL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  uint64_t v7 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  result = (PCMatrix44Tmpl<double> *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E3F8];
  if (v7) {
    BOOL v9 = result == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    result = (PCMatrix44Tmpl<double> *)objc_msgSend((id)unk_1F12334B8(result, "cameraMatrixAtTime:", a4.var0), "getBytes:length:", v14, 128);
    long long v10 = v14[1];
    *(_OWORD *)&retstr->var0[0][0] = v14[0];
    *(_OWORD *)&retstr->var0[0][2] = v10;
    long long v11 = v14[3];
    *(_OWORD *)&retstr->var0[1][0] = v14[2];
    *(_OWORD *)&retstr->var0[1][2] = v11;
    long long v12 = v14[5];
    *(_OWORD *)&retstr->var0[2][0] = v14[4];
    *(_OWORD *)&retstr->var0[2][2] = v12;
    long long v13 = v14[7];
    *(_OWORD *)&retstr->var0[3][0] = v14[6];
    *(_OWORD *)&retstr->var0[3][2] = v13;
  }
  return result;
}

- (void)getQuaternion:(id)a3 :(double *)a4 :(double *)a5 :(double *)a6 :(double *)a7
{
  long long v12 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  [v12 getFloatValue:a4 fromParm:6 atFxTime:a3.var1];
  [v12 getFloatValue:a5 fromParm:7 atFxTime:a3.var1];
  [v12 getFloatValue:a6 fromParm:8 atFxTime:a3.var1];

  [v12 getFloatValue:a7 fromParm:9 atFxTime:a3.var1];
}

- (PCMatrix44Tmpl<double>)composeViewMatrix:(SEL)a3 withCameraBehavior:(id)a4 heroAngle:(int)a5
{
  double v96 = 0.0;
  double v97 = 0.0;
  double v94 = 0.0;
  double v95 = 0.0;
  [(PAEEquirectProjectFilter *)self getQuaternion:a4.var1 :&v97 :&v96 :&v95 :&v94];
  double v110 = v94;
  double v111 = v97;
  double v112 = v96;
  double v113 = v95;
  double v107 = 0.0;
  double v108 = 0.0;
  double v109 = 1.0;
  PCQuat<double>::transform<double>(&v110, &v107);
  double v10 = sqrt(v107 * v107 + v108 * v108 + v109 * v109);
  if (v10 <= -0.000000100000001 || v10 >= 0.000000100000001)
  {
    double v107 = v107 / v10;
    double v108 = v108 / v10;
    double v109 = v109 / v10;
  }
  double v105 = 0.0;
  double v106 = 0.0;
  double v104 = 1.0;
  PCQuat<double>::transform<double>(&v110, &v104);
  double v11 = sqrt(v104 * v104 + v105 * v105 + v106 * v106);
  if (v11 <= -0.000000100000001 || v11 >= 0.000000100000001)
  {
    double v104 = v104 / v11;
    double v105 = v105 / v11;
    double v106 = v106 / v11;
  }
  double v12 = v107;
  double v13 = v108;
  double v14 = v107 * 0.0;
  double v15 = v108 * 0.0;
  double v16 = v109;
  double v17 = v109 + v107 * 0.0 + v108 * 0.0;
  if (v17 <= 1.0) {
    double v18 = v109 + v107 * 0.0 + v108 * 0.0;
  }
  else {
    double v18 = 1.0;
  }
  if (v17 >= -1.0) {
    double v19 = v18;
  }
  else {
    double v19 = -1.0;
  }
  double v20 = acos(v19);
  double v21 = 0.0;
  if (v20 > 0.00001)
  {
    double v91 = v20;
    double v22 = v12 + v15 + v16 * 0.0;
    double v23 = v22 * 0.0;
    double v24 = v14 + v13 + v16 * 0.0;
    double v25 = v24 * 0.0;
    double v26 = v22 + v24 * 0.0;
    double v27 = v24 + v23;
    double v28 = v23 + v25;
    double v29 = sqrt(v28 * v28 + v26 * v26 + v27 * v27);
    if (v29 < 0.000000100000001 && v29 > -0.000000100000001) {
      double v29 = 1.0;
    }
    double v31 = v26 / v29;
    double v32 = v27 / v29;
    double v33 = v26 / v29 + v27 / v29 * 0.0;
    double v34 = v28 / v29 * 0.0;
    double v35 = v34 + v33;
    if (v34 + v33 <= 1.0) {
      double v36 = v34 + v33;
    }
    else {
      double v36 = 1.0;
    }
    if (v35 >= -1.0) {
      double v37 = v36;
    }
    else {
      double v37 = -1.0;
    }
    double v38 = acos(v37);
    if (v34 + v32 + v31 * 0.0 < 0.0) {
      double v38 = 6.28318531 - v38;
    }
    double v21 = v38 + 1.57079633;
    double v20 = v91;
  }
  long double v39 = v20;
  __double2 v40 = __sincos_stret(v20 * 0.5);
  __double2 v41 = __sincos_stret(v21 * 0.5);
  double v42 = v40.__sinval * (v41.__sinval * 0.0);
  double v43 = v40.__sinval * 0.0 * (v41.__sinval * 0.0);
  double v44 = v40.__sinval * 0.0 * v41.__cosval;
  double v45 = v40.__cosval * (v41.__sinval * 0.0);
  v103[0] = v40.__cosval * v41.__cosval - (v40.__sinval * 0.0 * v41.__sinval + v42 + v43);
  v103[1] = v40.__sinval * v41.__cosval + v45 + v43 - v40.__sinval * 0.0 * v41.__sinval;
  v103[2] = v44 + v45 + v40.__sinval * v41.__sinval - v43;
  v103[3] = v40.__cosval * v41.__sinval + v44 + v43 - v42;
  double v101 = 0.0;
  double v102 = 0.0;
  double v100 = 1.0;
  PCQuat<double>::transform<double>(v103, &v100);
  double v46 = sqrt(v100 * v100 + v101 * v101 + v102 * v102);
  if (v46 <= -0.000000100000001 || v46 >= 0.000000100000001)
  {
    double v100 = v100 / v46;
    double v101 = v101 / v46;
    double v102 = v102 / v46;
  }
  long long v98 = xmmword_1B7E733E0;
  double v99 = 0.0;
  PCQuat<double>::transform<double>(v103, (double *)&v98);
  double v48 = *((double *)&v98 + 1);
  double v47 = *(double *)&v98;
  double v49 = v99;
  double v50 = sqrt(*(double *)&v98 * *(double *)&v98 + *((double *)&v98 + 1) * *((double *)&v98 + 1) + v49 * v49);
  if (v50 <= -0.000000100000001 || v50 >= 0.000000100000001)
  {
    double v47 = *(double *)&v98 / v50;
    double v48 = *((double *)&v98 + 1) / v50;
    double v49 = v99 / v50;
  }
  double v51 = v104;
  double v52 = v105;
  double v53 = v106;
  double v54 = v104 * v100 + v105 * v101 + v106 * v102;
  double v55 = 1.0;
  if (v54 <= 1.0) {
    double v55 = v104 * v100 + v105 * v101 + v106 * v102;
  }
  if (v54 >= -1.0) {
    double v56 = v55;
  }
  else {
    double v56 = -1.0;
  }
  double v57 = acos(v56);
  if (v47 * v51 + v48 * v52 + v49 * v53 <= 0.0) {
    double v58 = v57;
  }
  else {
    double v58 = -v57;
  }
  double v59 = fmod(v58, 6.28318531);
  if (v58 >= 0.0) {
    double v60 = v59;
  }
  else {
    double v60 = v59 + 6.28318531;
  }
  double v61 = fmod(v39, 6.28318531);
  if (v39 >= 0.0) {
    double v62 = v61;
  }
  else {
    double v62 = v61 + 6.28318531;
  }
  double v63 = fmod(v21, 6.28318531);
  if (v21 >= 0.0) {
    double v64 = v63;
  }
  else {
    double v64 = v63 + 6.28318531;
  }
  double v65 = fmod(v62 + -1.57079633, 6.28318531);
  if (v62 + -1.57079633 >= 0.0) {
    double v66 = v65;
  }
  else {
    double v66 = v65 + 6.28318531;
  }
  [(PAEEquirectProjectFilter *)self getInitialYaw:a4.var1];
  double v68 = v64 - v67;
  double v69 = fmod(v64 - v67, 6.28318531);
  if (v68 < 0.0) {
    double v69 = v69 + 6.28318531;
  }
  double v70 = v69 + a6;
  double v71 = fmod(v69 + a6, 6.28318531);
  if (v70 >= 0.0) {
    double v72 = v71;
  }
  else {
    double v72 = v71 + 6.28318531;
  }
  if ([(PAEEquirectProjectFilter *)self getIsFrontFacing:a4.var1])
  {
    if (a5 != 1)
    {
      double v73 = fmod(-v60, 6.28318531);
      if (v60 <= 0.0) {
        double v60 = v73;
      }
      else {
        double v60 = v73 + 6.28318531;
      }
      double v74 = fmod(-v66, 6.28318531);
      if (v66 <= 0.0) {
        double v66 = v74;
      }
      else {
        double v66 = v74 + 6.28318531;
      }
    }
    long double v75 = v72 + 3.14159265;
    double v76 = fmod(v75, 6.28318531);
    if (v75 < 0.0) {
      double v76 = v76 + 6.28318531;
    }
    double v93 = v76;
  }
  else
  {
    double v93 = v72;
  }
  __double2 v77 = __sincos_stret(v60 * 0.5);
  double v78 = v77.__sinval * 0.0;
  __double2 v79 = __sincos_stret(v66 * 0.5);
  double v80 = v79.__sinval * 0.0;
  __double2 v81 = __sincos_stret(v93 * 0.5);
  double v82 = v79.__cosval * v77.__cosval - (v77.__sinval * v80 + v79.__sinval * v78 + v80 * v78);
  double v83 = v79.__sinval * v77.__cosval + v79.__cosval * v78 + v80 * v78 - v77.__sinval * v80;
  double v84 = v77.__cosval * v80 + v79.__cosval * v78 + v79.__sinval * v77.__sinval - v80 * v78;
  double v85 = v79.__cosval * v77.__sinval + v77.__cosval * v80 + v80 * v78 - v79.__sinval * v78;
  double v86 = v81.__sinval * 0.0 * v83;
  double v87 = v81.__sinval * 0.0 * v85;
  double v88 = v81.__sinval * 0.0 * v82;
  double v89 = v81.__sinval * 0.0 * v84;
  double v110 = v81.__cosval * v82 - (v87 + v86 + v81.__sinval * v84);
  double v111 = v89 - v81.__sinval * v85 + v81.__cosval * v83 + v88;
  double v112 = v87 - v86 + v81.__cosval * v84 + v81.__sinval * v82;
  double v113 = v81.__sinval * v83 - v89 + v81.__cosval * v85 + v88;
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  PCMatrix44Tmpl<double>::setRotationFromQuaternion((uint64_t)retstr, &v110);
  return result;
}

- (double)convertToFOVYFromFOVX:(double)a3 width:(double)a4 height:(double)a5
{
  long double v7 = tan(a3 * 0.0174532925 * 0.5);
  long double v8 = atan2(a5, a4 / v7);
  return (v8 + v8) / 0.0174532925;
}

- (double)convertToFOVXFromFOVY:(double)a3 width:(double)a4 height:(double)a5
{
  long double v7 = tan(a3 * 0.0174532925 * 0.5);
  long double v8 = atan2(v7 * a4, a5);
  return (v8 + v8) / 0.0174532925;
}

- (void)getProjectionFOVYDegrees:(float *)a3 FOVXDegrees:(float *)a4 withFrameAspect:(double)a5 atTime:(id)a6
{
  objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E3F8), "focalLengthAtFxTime:", a6.var1);
  if (fabs(v9) != INFINITY)
  {
    double v10 = 1.0 / v9;
    long double v11 = atan(1.0 / v9 * 36.0 * 0.5);
    *(float *)&long double v11 = (v11 + v11) * 57.2957795;
    *a4 = *(float *)&v11;
    long double v12 = atan(a5 * 36.0 * v10 * 0.5);
    *(float *)&long double v12 = (v12 + v12) * 57.2957795;
    *a3 = *(float *)&v12;
  }
}

- (BOOL)getIsFrontFacing:(id)a3
{
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v4)
  {
    char v6 = 0;
    [v4 getBoolValue:&v6 fromParm:4 atFxTime:a3.var1];
    LOBYTE(v4) = v6 != 0;
  }
  return (char)v4;
}

- (double)getInitialYaw:(id)a3
{
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v4) {
    return 0.0;
  }
  double v6 = 0.0;
  [v4 getFloatValue:&v6 fromParm:5 atFxTime:a3.var1];
  return v6;
}

- (HGEquirectProjectParams)getParams:(SEL)a3 withOutputImage:(id *)a4 inputImage:(id)a5 width:(id)a6 height:(unint64_t)a7 outputWidth:(unint64_t)a8 outputHeight:(unint64_t)a9 xRotation:(unint64_t)a10 yRotation:(double)a11 zRotation:(double)a12 cameraBehavior:(double)a13 paramAPI:(int)a14
{
  int v15 = a8;
  int v16 = a7;
  *(_OWORD *)retstr->var0 = xmmword_1B7E736B0;
  *(_OWORD *)&retstr->var1[1] = xmmword_1B7E736B0;
  *(void *)&retstr->var2[2] = 0x423400003F800000;
  retstr->var4 = 45.0;
  retstr->var5 = 0;
  *(void *)&retstr->var12 = 0;
  *(void *)&retstr->var14 = 0;
  *(_WORD *)&retstr->var16 = 0;
  *(_OWORD *)retstr->var18 = xmmword_1B7E73E70;
  *(_OWORD *)retstr->var19 = xmmword_1B7E74540;
  *(_OWORD *)retstr->var20 = xmmword_1B7E73E70;
  *(_OWORD *)retstr->var21 = xmmword_1B7E74540;
  result = (HGEquirectProjectParams *)[(PAEEquirectProjectFilter *)self getProjectionFOVYDegrees:&retstr->var3 FOVXDegrees:&retstr->var4 withFrameAspect:a4->var0.var1 atTime:(double)a10 / (double)a9];
  if (self)
  {
    result = [(PAEEquirectProjectFilter *)self composeViewMatrix:a4->var0.var1 withCameraBehavior:a14 heroAngle:a12];
    float v24 = v37;
    float v25 = v40;
    float v26 = v43;
    float v27 = v38;
    float v28 = v41;
    float v29 = v44;
    float v30 = v39;
    float v31 = v42;
    float v32 = v45;
  }
  else
  {
    float v32 = 0.0;
    float v31 = 0.0;
    float v30 = 0.0;
    float v29 = 0.0;
    float v28 = 0.0;
    float v27 = 0.0;
    float v26 = 0.0;
    float v25 = 0.0;
    float v24 = 0.0;
  }
  retstr->var0[0] = v24;
  retstr->var0[1] = v25;
  retstr->var0[2] = v26;
  retstr->var1[0] = v27;
  retstr->var1[1] = v28;
  retstr->var1[2] = v29;
  retstr->var2[0] = v30;
  retstr->var2[1] = v31;
  retstr->var2[2] = v32;
  retstr->var12 = v16;
  retstr->var13 = v15;
  if (a6)
  {
    retstr->var12 = [a6 width];
    result = (HGEquirectProjectParams *)[a6 height];
    retstr->var13 = (int)result;
    if (self)
    {
      result = [(PAESharedDefaultBase *)self getPixelTransformForImage:a6];
    }
    else
    {
      float64x2_t v35 = 0u;
      float64x2_t v36 = 0u;
      float64x2_t v33 = 0u;
      float64x2_t v34 = 0u;
    }
    *(float32x4_t *)retstr->var20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v33), v34);
    *(float32x4_t *)retstr->var21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v35), v36);
  }
  if (a5)
  {
    retstr->var14 = [a5 width];
    result = (HGEquirectProjectParams *)[a5 height];
    retstr->var15 = (int)result;
    if (self)
    {
      result = [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a5];
    }
    else
    {
      float64x2_t v35 = 0u;
      float64x2_t v36 = 0u;
      float64x2_t v33 = 0u;
      float64x2_t v34 = 0u;
    }
    *(float32x4_t *)retstr->var18 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v33), v34);
    *(float32x4_t *)retstr->var19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v35), v36);
  }
  *(_WORD *)&retstr->var16 = 256;
  return result;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  if (a3) {
    *a3 = a5->var0;
  }
  if (a4) {
    *a4 = a5->var1;
  }
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    double v10 = (void *)v9;
    if ([a3 imageType] == 3)
    {
      double v65 = 0.0;
      v66[0] = 0.0;
      double v64 = 0.0;
      [v10 getFloatValue:v66 fromParm:1 atFxTime:a5->var0.var1];
      [v10 getFloatValue:&v65 fromParm:2 atFxTime:a5->var0.var1];
      [v10 getFloatValue:&v64 fromParm:3 atFxTime:a5->var0.var1];
      uint64_t v63 = 0;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      if (a4)
      {
        [a4 imageInfo];
        unint64_t v11 = *((void *)&v59 + 1);
        unint64_t v12 = v59;
        [a4 heliumRef];
        float32x2_t v13 = v52;
      }
      else
      {
        unint64_t v12 = 0;
        unint64_t v11 = 0;
        float32x2_t v13 = 0;
      }
      double v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"PE360FrontCameraBehavior");
      if (v14 && (int v15 = [v14 integerValue], v15 != 2))
      {
        int v35 = v15;
        int v16 = 0;
      }
      else
      {
        if ([(PAEEquirectProjectFilter *)self getIsFrontFacing:a5->var0.var1]) {
          double v65 = -v65;
        }
        int v35 = 2;
        int v16 = 1;
      }
      long long v17 = *(_OWORD *)&a5->var2;
      v51[0] = *(_OWORD *)&a5->var0.var0;
      v51[1] = v17;
      v51[2] = *(_OWORD *)&a5->var4;
      uint64_t v18 = [a3 width];
      uint64_t v19 = [a3 height];
      LODWORD(v34) = v35;
      [(PAEEquirectProjectFilter *)self getParams:v51 withOutputImage:a3 inputImage:a4 width:v12 height:v11 outputWidth:v18 outputHeight:v66[0] xRotation:v65 yRotation:v64 zRotation:v19 cameraBehavior:v34 paramAPI:v10];
      double v45 = v57;
      uint64_t v50 = 0x3FF0000000000000;
      float64x2_t v38 = vcvtq_f64_f32(v52);
      float64x2_t v41 = vcvtq_f64_f32(v54);
      double v39 = v53;
      uint64_t v40 = 0;
      double v42 = v55;
      float64x2_t v44 = vcvtq_f64_f32(v56);
      uint64_t v43 = 0;
      uint64_t v47 = 0;
      uint64_t v46 = 0;
      uint64_t v49 = 0;
      uint64_t v48 = 0;
      [(PAESharedDefaultBase *)self getPixelTransformForImage:a3];
      [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a3];
      unint64_t v20 = [a3 width];
      unint64_t v21 = [a3 height];
      *(float *)&double v22 = (float)v20;
      if ((float)v20 >= (float)v21) {
        double v23 = (LiHeEquirectProject *)objc_msgSend(a3, "height", v22);
      }
      else {
        double v23 = (LiHeEquirectProject *)objc_msgSend(a3, "width", v22);
      }
      computeDistanceToEquirectImagePlane((float)(unint64_t)v23, v58, v23);
      float v24 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v24);
      uint64_t v26 = HGRectMake4f(v25, 1.0, 1.0, (float)v12 + -2.0, (float)v11 + -2.0);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v24 + 96))(v24, 0, (float)(int)v26, (float)SHIDWORD(v26), (float)v27, (float)v28);
      (*(void (**)(HGCrop *, void, float32x2_t))(*(void *)v24 + 120))(v24, 0, v13);
      float v29 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
      HGTextureWrap::HGTextureWrap(v29);
      HGTextureWrap::SetTextureWrapMode((uint64_t)v29, (const char *)3, v30);
      (*(void (**)(HGTextureWrap *, void, HGCrop *))(*(void *)v29 + 120))(v29, 0, v24);
      if ((HGTextureWrap *)v13 != v29)
      {
        if (v13) {
          (*(void (**)(float32x2_t))(**(void **)&v13 + 24))(v13);
        }
        float32x2_t v13 = (float32x2_t)v29;
        (*(void (**)(HGTextureWrap *))(*(void *)v29 + 16))(v29);
      }
      float v31 = fabs(v37) * (double)(v12 - 2);
      if ((v16 & [(PAEEquirectProjectFilter *)self getIsFrontFacing:a5->var0.var1]) == 1)
      {
        float v32 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v32);
        (*(void (**)(HGXForm *, void, float32x2_t))(*(void *)v32 + 120))(v32, 0, v13);
        HGTransform::HGTransform((HGTransform *)v36);
        HGTransform::LoadIdentity((HGTransform *)v36);
        HGTransform::Translate((HGTransform *)v36, (float)-(float)(v31 * 0.5), 0.0, 0.0);
        HGTransform::Scale((HGTransform *)v36, -1.0, 1.0, 1.0);
        HGTransform::Translate((HGTransform *)v36, (float)(v31 * 0.5), 0.0, 0.0);
        (*(void (**)(HGXForm *, unsigned char *))(*(void *)v32 + 576))(v32, v36);
        if ((HGXForm *)v13 != v32)
        {
          if (v13) {
            (*(void (**)(float32x2_t))(**(void **)&v13 + 24))(v13);
          }
          (*(void (**)(HGXForm *))(*(void *)v32 + 16))(v32);
        }
        HGTransform::~HGTransform((HGTransform *)v36);
        (*(void (**)(HGXForm *))(*(void *)v32 + 24))(v32);
      }
      [a3 width];
      [a3 height];
      NewEquirectProjectNode();
    }
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)frameCleanup
{
  return 1;
}

@end