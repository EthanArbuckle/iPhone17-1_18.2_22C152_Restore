@interface PAESlitScan
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)variesOverTime;
- (PAESlitScan)initWithAPIManager:(id)a3;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAESlitScan

- (PAESlitScan)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAESlitScan;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (BOOL)variesOverTime
{
  return 1;
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"MayRemapTime", v4, @"PositionIndependent", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v7.receiver = self;
  v7.super_class = (Class)PAESlitScan;
  [(PAESharedDefaultBase *)&v7 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v4, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Slitscan::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Slitscan::Rotation", 0, 0), 2, 0, 0.0, 0.0, 6.28318531);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Slitscan::Speed", 0, 0), 3, 0, 100.0, 0.0, 400.0, 0.0, 400.0, 1.0);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Slitscan::Perspective", 0, 0), 4, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Slitscan::Glow Punch", 0, 0), 5, 0, 0.05, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Slitscan::Glow Color", 0, 0), 6, 0, 1.0, 1.0, 1.0);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Slitscan::Offset", 0, 0), 7, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
  }
  return 1;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    return 0;
  }
  unint64_t v95 = [a4 width];
  unint64_t v94 = [a4 height];
  double v115 = 0.0;
  double v114 = 0.0;
  [v9 getXValue:&v115 YValue:&v114 fromParm:1 atFxTime:a5->var0.var1];
  double v115 = v115 * (double)v95;
  double v114 = v114 * (double)v94;
  double v113 = 0.0;
  [v9 getFloatValue:&v113 fromParm:2 atFxTime:a5->var0.var1];
  double v112 = 0.0;
  [v9 getFloatValue:&v112 fromParm:3 atFxTime:a5->var0.var1];
  double v111 = 0.0;
  [v9 getFloatValue:&v111 fromParm:4 atFxTime:a5->var0.var1];
  double v110 = 0.0;
  [v9 getFloatValue:&v110 fromParm:5 atFxTime:a5->var0.var1];
  double v109 = 0.0;
  double v108 = 0.0;
  double v107 = 0.0;
  [v9 getRedValue:&v109 greenValue:&v108 blueValue:&v107 fromParm:6 atFxTime:a5->var0.var1];
  double v106 = 0.0;
  [v9 getFloatValue:&v106 fromParm:7 atFxTime:a5->var0.var1];
  double v106 = v106 * (double)v95;
  [(PAESharedDefaultBase *)self getScaleForImage:a4];
  if (v104 <= v105) {
    double v13 = v105;
  }
  else {
    double v13 = v104;
  }
  double v111 = v111 / v13;
  __double2 v14 = __sincos_stret(v113);
  [(PAESharedDefaultBase *)self secondsFromFxTime:a5->var0.var1];
  double v16 = v15;
  double v17 = v112;
  double v18 = v115;
  double v19 = v114;
  double v20 = v106;
  double v21 = v110;
  uint64_t v22 = [a4 imageType];
  int v23 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  BOOL result = 0;
  if (!v23 || v22 != 3) {
    return result;
  }
  uint64_t v24 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (!v24) {
    return 0;
  }
  if (a4) {
    [a4 heliumRef];
  }
  else {
    uint64_t v103 = 0;
  }
  v86 = (void *)v24;
  unint64_t v25 = [a4 width];
  double v115 = v115 - (double)(v25 >> 1);
  unint64_t v26 = [a4 height];
  double v114 = v114 - (double)(v26 >> 1);
  v27 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v27);
  v90 = v27;
  (*(void (**)(HGTextureWrap *, void, uint64_t))(*(void *)v27 + 120))(v27, 0, v103);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v27, (const char *)2, v28);
  v29 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v29);
  v91 = v29;
  uint64_t v30 = HGRectMake4i((int)((double)(unint64_t)[a4 width] * -1.5), (int)((double)(unint64_t)objc_msgSend(a4, "height") * -1.5), (int)((double)(unint64_t)objc_msgSend(a4, "width") * 1.5), (int)((double)(unint64_t)objc_msgSend(a4, "height") * 1.5));
  (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v29 + 96))(v29, 0, (float)(int)v30, (float)SHIDWORD(v30), (float)v31, (float)v32);
  (*(void (**)(HGCrop *, void, HGTextureWrap *))(*(void *)v29 + 120))(v29, 0, v27);
  HGTransform::HGTransform((HGTransform *)v102);
  double v127 = 1.0;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = xmmword_1B7E733D0;
  double v131 = v111 * -0.05;
  uint64_t v133 = 0;
  uint64_t v132 = 0;
  long long v135 = 0u;
  long long v136 = 0u;
  uint64_t v134 = 0x3FF0000000000000;
  uint64_t v137 = 0x3FF0000000000000;
  HGTransform::LoadMatrixd((HGTransform *)v102, &v127);
  double v87 = v21;
  double v88 = v20;
  double v89 = v19;
  HGTransform::HGTransform((HGTransform *)v101);
  double v33 = v106;
  long double v34 = v113;
  unint64_t v35 = [a4 width];
  long double v36 = v113;
  unint64_t v37 = [a4 height];
  float v38 = v13 * -(v16 * v17);
  double v39 = v38;
  long double v40 = sin(v34);
  double v41 = fmod(-((v33 + v38) * v40), (double)v35 * 1.5);
  long double v42 = cos(v36);
  long double v43 = fmod((v33 + v38) * v42, (double)v37 * 1.5);
  HGTransform::Translate((HGTransform *)v101, -v41, -v43, 0.0);
  HGTransform::Translate((HGTransform *)v101, -v115, -v114, 0.0);
  HGTransform::Rotate((HGTransform *)v101, v113 * 180.0 / 3.14159265, 0.0, 0.0, 1.0);
  HGTransform::Multiply(v101, v102);
  v44 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v44);
  v84 = v44;
  (*(void (**)(HGXForm *, float64x2_t *))(*(void *)v44 + 576))(v44, v101);
  (*(void (**)(HGXForm *, void, HGCrop *))(*(void *)v44 + 120))(v44, 0, v29);
  v45 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v45);
  v85 = v45;
  (*(void (**)(HGCrop *, void, float, double, float, float))(*(void *)v45 + 96))(v45, 0, (float)(int)0x80000000, 0.0, (float)0x7FFFFFFF, (float)0x7FFFFFFF);
  (*(void (**)(HGCrop *, void, HGXForm *))(*(void *)v45 + 120))(v45, 0, v44);
  HGTransform::HGTransform((HGTransform *)v100);
  HGTransform::Rotate((HGTransform *)v100, v113 * -180.0 / 3.14159265, 0.0, 0.0, 1.0);
  HGTransform::Translate((HGTransform *)v100, v115, v114, 0.0);
  v46 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v46);
  v93 = v46;
  (*(void (**)(HGXForm *, unsigned char *))(*(void *)v46 + 576))(v46, v100);
  (*(void (**)(HGXForm *, void, HGCrop *))(*(void *)v46 + 120))(v46, 0, v45);
  HGTransform::HGTransform((HGTransform *)v99);
  double v116 = 1.0;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = xmmword_1B7E733D0;
  double v120 = v111 * 0.05;
  uint64_t v122 = 0;
  uint64_t v121 = 0;
  long long v124 = 0u;
  long long v125 = 0u;
  uint64_t v123 = 0x3FF0000000000000;
  uint64_t v126 = 0x3FF0000000000000;
  HGTransform::LoadMatrixd((HGTransform *)v99, &v116);
  HGTransform::HGTransform((HGTransform *)v98);
  long double v47 = v113;
  unint64_t v48 = [a4 width];
  long double v49 = sin(v47);
  double v50 = fmod(v49 * (float)-v38, (double)v48 * 1.5);
  long double v51 = v113;
  unint64_t v52 = [a4 height];
  HGTransform::Scale((HGTransform *)v98, 1.0, -1.0, 1.0);
  long double v53 = cos(v51);
  double v54 = fmod(v53 * v38, (double)v52 * 1.5);
  HGTransform::Translate((HGTransform *)v98, -v50, v54, 0.0);
  HGTransform::Translate((HGTransform *)v98, 0.0, v114 + v114, 0.0);
  HGTransform::Translate((HGTransform *)v98, -v115, -v114, 0.0);
  HGTransform::Rotate((HGTransform *)v98, v113 * -180.0 / 3.14159265, 0.0, 0.0, 1.0);
  HGTransform::Multiply(v98, v99);
  v55 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v55);
  v92 = v55;
  (*(void (**)(HGXForm *, float64x2_t *))(*(void *)v55 + 576))(v55, v98);
  (*(void (**)(HGXForm *, void, HGCrop *))(*(void *)v55 + 120))(v55, 0, v29);
  v56 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v56);
  (*(void (**)(HGCrop *, void, float, float, float, double))(*(void *)v56 + 96))(v56, 0, (float)(int)0x80000000, (float)(int)0x80000000, (float)0x7FFFFFFF, 0.0);
  (*(void (**)(HGCrop *, void, HGXForm *))(*(void *)v56 + 120))(v56, 0, v55);
  HGTransform::HGTransform((HGTransform *)v97);
  HGTransform::Rotate((HGTransform *)v97, v113 * -180.0 / 3.14159265, 0.0, 0.0, 1.0);
  HGTransform::Translate((HGTransform *)v97, v115, v114, 0.0);
  v57 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v57);
  (*(void (**)(HGXForm *, unsigned char *))(*(void *)v57 + 576))(v57, v97);
  (*(void (**)(HGXForm *, void, HGCrop *))(*(void *)v57 + 120))(v57, 0, v56);
  v58 = (HGLegacyBlend *)HGObject::operator new(0x1C0uLL);
  HGLegacyBlend::HGLegacyBlend(v58);
  (*(void (**)(HGLegacyBlend *, void, double, double, double, double))(*(void *)v58 + 96))(v58, 0, 0.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGLegacyBlend *, void, HGXForm *))(*(void *)v58 + 120))(v58, 0, v46);
  (*(void (**)(HGLegacyBlend *, uint64_t, HGXForm *))(*(void *)v58 + 120))(v58, 1, v57);
  v59 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v59);
  int v60 = [a4 width];
  if (v60 >= 0) {
    int v61 = v60;
  }
  else {
    int v61 = v60 + 1;
  }
  int v62 = [a4 width];
  if (v62 >= 0) {
    int v63 = v62;
  }
  else {
    int v63 = v62 + 1;
  }
  int v64 = [a4 height];
  if (v64 >= 0) {
    int v65 = v64;
  }
  else {
    int v65 = v64 + 1;
  }
  int v66 = [a4 height];
  (*(void (**)(HGCrop *, void, HGLegacyBlend *))(*(void *)v59 + 120))(v59, 0, v58);
  if (v66 >= 0) {
    int v67 = v66;
  }
  else {
    int v67 = v66 + 1;
  }
  (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v59 + 96))(v59, 0, (float)-(v61 >> 1), (float)-(v65 >> 1), (float)(v63 >> 1), (float)(v67 >> 1));
  [v86 versionAtCreation];
  v68 = (HgcSlitScanGlow *)HGObject::operator new(0x1A0uLL);
  HgcSlitScanGlow::HgcSlitScanGlow(v68);
  (*(void (**)(HgcSlitScanGlow *, void, HGCrop *))(*(void *)v68 + 120))(v68, 0, v59);
  unint64_t v69 = [a4 width];
  double v115 = v115 + (double)(v69 >> 1);
  unint64_t v70 = [a4 height];
  float sinval = v14.__sinval;
  float v72 = -sinval;
  float cosval = v14.__cosval;
  float v74 = v18 + (float)((float)-sinval * v38);
  float v75 = v89 + (float)(cosval * v38);
  double v114 = v114 + (double)(v70 >> 1);
  (*(void (**)(HgcSlitScanGlow *, void, float, float, double, double))(*(void *)v68 + 96))(v68, 0, v74, v75, 0.0, 0.0);
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, double, double))(*(void *)v68 + 96))(v68, 1, (float)v95, (float)v94, 0.0, 0.0);
  float v76 = v87 * (double)(v95 >> 2);
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, double, double, double))(*(void *)v68 + 96))(v68, 2, v76, 0.0, 0.0, 0.0);
  float v77 = v109;
  float v78 = v108;
  float v79 = v107;
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, float, double))(*(void *)v68 + 96))(v68, 3, v77, v78, v79, 0.0);
  float v80 = v18 + (v88 + v39) * v72;
  float v81 = v89 + (v88 + v39) * cosval;
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, double, double))(*(void *)v68 + 96))(v68, 4, v80, v81, 0.0, 0.0);
  float v82 = v115;
  float v83 = v114;
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, double, double))(*(void *)v68 + 96))(v68, 5, v82, v83, 0.0, 0.0);
  (*(void (**)(HgcSlitScanGlow *, uint64_t, float, float, double, double))(*(void *)v68 + 96))(v68, 6, v72, cosval, 0.0, 0.0);
  v96 = v68;
  (*(void (**)(HgcSlitScanGlow *))(*(void *)v68 + 16))(v68);
  [a3 setHeliumRef:&v96];
  if (v96) {
    (*(void (**)(HgcSlitScanGlow *))(*(void *)v96 + 24))(v96);
  }
  (*(void (**)(HgcSlitScanGlow *))(*(void *)v68 + 24))(v68);
  (*(void (**)(HGCrop *))(*(void *)v59 + 24))(v59);
  (*(void (**)(HGLegacyBlend *))(*(void *)v58 + 24))(v58);
  (*(void (**)(HGXForm *))(*(void *)v57 + 24))(v57);
  HGTransform::~HGTransform((HGTransform *)v97);
  (*(void (**)(HGCrop *))(*(void *)v56 + 24))(v56);
  (*(void (**)(HGXForm *))(*(void *)v92 + 24))(v92);
  HGTransform::~HGTransform((HGTransform *)v98);
  HGTransform::~HGTransform((HGTransform *)v99);
  (*(void (**)(HGXForm *))(*(void *)v93 + 24))(v93);
  HGTransform::~HGTransform((HGTransform *)v100);
  (*(void (**)(HGCrop *))(*(void *)v85 + 24))(v85);
  (*(void (**)(HGXForm *))(*(void *)v84 + 24))(v84);
  HGTransform::~HGTransform((HGTransform *)v101);
  HGTransform::~HGTransform((HGTransform *)v102);
  (*(void (**)(HGCrop *))(*(void *)v91 + 24))(v91);
  (*(void (**)(HGTextureWrap *))(*(void *)v90 + 24))(v90);
  if (v103) {
    (*(void (**)(uint64_t))(*(void *)v103 + 24))(v103);
  }
  return 1;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 0;
  *a5 = 0;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end