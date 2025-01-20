@interface PAEKaleidascope
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)canThrowRenderOutputHe:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEKaleidascope)initWithAPIManager:(id)a3;
- (id)properties;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEKaleidascope

- (PAEKaleidascope)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEKaleidascope;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:1];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"InputSizeLimit", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v7.receiver = self;
  v7.super_class = (Class)PAEKaleidascope;
  [(PAESharedDefaultBase *)&v7 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v4, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Kaleidascope::Center", 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Kaleidascope::Segment Angle", 0, 0), 2, 0, 22.5, 0.0, 6.28318531);
    objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Kaleidascope::Offset Angle", 0, 0), 3, 0, 0.785398163, 0.0, 6.28318531);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"Kaleidascope::Allow Partial", 0, 0), 4, 0, 33);
  }
  return 1;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  int v9 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (v9)
  {
    long long v10 = *(_OWORD *)&a5->var2;
    v12[0] = *(_OWORD *)&a5->var0.var0;
    v12[1] = v10;
    v12[2] = *(_OWORD *)&a5->var4;
    LOBYTE(v9) = [(PAEKaleidascope *)self canThrowRenderOutputHe:a3 withInput:a4 withInfo:v12];
  }
  return v9;
}

- (BOOL)canThrowRenderOutputHe:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (v9)
  {
    long long v10 = (void *)v9;
    uint64_t v9 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
    if (v9)
    {
      v11 = (void *)v9;
      uint64_t v151 = 0;
      long long v149 = 0u;
      long long v150 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      if (a4) {
        [a4 imageInfo];
      }
      unint64_t v12 = [a4 width];
      unint64_t v13 = [a4 height];
      var1 = a5->var0.var1;
      double v145 = 0.0;
      double v146 = 0.0;
      [(PAESharedDefaultBase *)self getPoint:&v145 fromParm:1 atTime:var1 withImage:a3];
      double v16 = v145;
      double v15 = v146;
      if ([v11 versionAtCreation]) {
        double v17 = 1.0 - v15;
      }
      else {
        double v17 = v15;
      }
      double v144 = 0.0;
      [v10 getFloatValue:&v144 fromParm:2 atFxTime:var1];
      double v143 = 0.0;
      [v10 getFloatValue:&v143 fromParm:3 atFxTime:var1];
      char v142 = 0;
      [v10 getBoolValue:&v142 fromParm:4 atFxTime:var1];
      unint64_t v18 = [a4 width];
      unint64_t v19 = [a4 height];
      if (v144 <= 0.0628318531) {
        float v20 = 100.0;
      }
      else {
        float v20 = 3.14159265 / v144;
      }
      int v21 = vcvtps_s32_f32(v20);
      if (v21 <= 1) {
        int v22 = 1;
      }
      else {
        int v22 = v21;
      }
      if (v142) {
        float v23 = v20;
      }
      else {
        float v23 = (float)v22;
      }
      if (v23 >= 0.501)
      {
        v24 = (HGGLNode *)HGObject::operator new(0x1B0uLL);
        HGGLNode::HGGLNode(v24, 0);
        HGGLNode::hglClearToBlack(v24);
        HGGLNode::hglMatrixMode(v24, 5890);
        float v25 = (float)v12 * -0.5;
        float v26 = (float)v13 * -0.5;
        HGGLNode::hglTranslatef(v24, v25, v26, 0.0);
        [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
        *(float *)v27.i32 = v143;
        float v28 = v16 * (double)v18;
        float v29 = v17 * (double)v19;
        float v30 = v16 * (float)v12;
        float v31 = v17 * (float)v13;
        float v134 = v31 - (float)((float)v13 * 0.5);
        float v135 = v30 - (float)((float)v12 * 0.5);
        float v32 = v28 - (v25 + (float)((float)v12 * 0.5)) * 0.5;
        float v120 = v32;
        double v33 = v29 - ((float)((float)v13 * 0.5) + v26) * 0.5;
        *(float *)&double v33 = v33;
        float v117 = *(float *)&v33;
        float v34 = (float)((float)v12 * 0.5) - v25;
        float v35 = (float)((float)v13 * 0.5) - v26;
        double v36 = v34;
        double v137 = v141;
        double v138 = v140[0];
        double v39 = v34 / v140[0];
        *(float *)&double v39 = v39;
        double v37 = v35;
        double v38 = v35 / v141;
        *(float *)&double v38 = v38;
        *(float *)&double v39 = sqrtf((float)(*(float *)&v39 * *(float *)&v39) + (float)(*(float *)&v38 * *(float *)&v38));
        float v136 = *(float *)&v39 + *(float *)&v39;
        if (v23 >= 2.0)
        {
          float v115 = 6.2832 / (float)(v23 + v23);
          float v80 = v115 + *(float *)v27.i32;
          float v116 = v143;
          float v81 = v143;
          __float2 v82 = __sincosf_stret(v81);
          __float2 v83 = __sincosf_stret(v80);
          HGGLNode::hglBegin((char **)v24, 4);
          *(float *)&unsigned __int32 v129 = v120 / v34;
          *(float *)&unsigned __int32 v84 = (v140[0] * (float)(v82.__cosval * v136) + v120) / v36;
          double v85 = v140[0] * (float)(v83.__cosval * v136) + v120;
          float v86 = (v117 - v141 * (float)(v82.__sinval * v136)) / v37;
          float v121 = v86;
          unsigned __int32 v123 = v84;
          *(float *)&unsigned __int32 v87 = v85 / v36;
          *(float *)&double v85 = (v117 - v141 * (float)(v83.__sinval * v136)) / v37;
          float v118 = *(float *)&v85;
          unsigned __int32 v119 = v87;
          double v133 = v135;
          double v88 = v134;
          int v89 = 1;
          float v125 = v117 / v35;
          float v90 = v116;
          do
          {
            float v91 = v115 * (float)(v89 - 1);
            float v92 = v115 * (float)v89;
            float v93 = v115 * (float)(v89 + 1);
            if (v93 <= 6.2832)
            {
              BOOL v94 = v22 == 1;
            }
            else
            {
              float v92 = (float)(v91 + 6.2832) * 0.5;
              BOOL v94 = 1;
            }
            if (v94) {
              float v93 = 0.0;
            }
            float v95 = v92 + v90;
            float v96 = v93 + v90;
            __float2 v97 = __sincosf_stret(v91 + v90);
            __float2 v98 = __sincosf_stret(v95);
            __float2 v99 = __sincosf_stret(v96);
            v100.n128_u32[0] = 1.0;
            v101.n128_f64[0] = HGGLNode::hglColor4f(v24, v100, 1.0, 1.0, 1.0);
            v101.n128_u32[0] = v129;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v101, v125);
            HGGLNode::hglVertex3f((float32x4_t **)v24, v135, v134, 0.0);
            v102.n128_u32[0] = v123;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v102, v121);
            float v103 = v140[0] * (float)(v136 * v97.__cosval) + v133;
            float v104 = v141 * (float)(v136 * v97.__sinval) + v88;
            HGGLNode::hglVertex3f((float32x4_t **)v24, v103, v104, 0.0);
            v105.n128_u32[0] = v119;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v105, v118);
            float v106 = v140[0] * (float)(v136 * v98.__cosval) + v133;
            float v107 = v141 * (float)(v136 * v98.__sinval) + v88;
            HGGLNode::hglVertex3f((float32x4_t **)v24, v106, v107, 0.0);
            v108.n128_u32[0] = v129;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v108, v125);
            HGGLNode::hglVertex3f((float32x4_t **)v24, v135, v134, 0.0);
            v109.n128_u32[0] = v123;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v109, v121);
            float v110 = v140[0] * (float)(v136 * v99.__cosval) + v133;
            float v111 = v141 * (float)(v136 * v99.__sinval) + v88;
            HGGLNode::hglVertex3f((float32x4_t **)v24, v110, v111, 0.0);
            v112.n128_u32[0] = v119;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v112, v118);
            HGGLNode::hglVertex3f((float32x4_t **)v24, v106, v107, 0.0);
            v89 += 2;
            --v22;
            float v90 = v116;
          }
          while (v22);
        }
        else
        {
          unint64_t v40 = 0;
          *(float *)&double v39 = 6.2832 / v23;
          *(float *)&double v38 = (float)(6.2832 / v23) * 0.5;
          if (v23 <= 1.0) {
            *(float *)&double v33 = (float)(6.2832 / v23) * 0.5;
          }
          else {
            *(float *)&double v33 = 6.2832 / v23;
          }
          v41.i32[1] = 1065353216;
          float32x4_t v42 = vmulq_n_f32((float32x4_t)xmmword_1B7E740F0, *(float *)&v33 * 0.25);
          float32x4_t v43 = vmulq_n_f32((float32x4_t)xmmword_1B7E740F0, (float)(6.2832 - *(float *)&v33) * 0.25);
          float32x4_t v44 = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v33, 0), v43);
          v43.f32[0] = 6.2832 - *(float *)&v38;
          float32x4_t v45 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v38, 0);
          float32x4_t v46 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 0);
          *(float *)v41.i32 = 6.2832 - *(float *)&v39;
          float32x4_t v47 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v39, 0);
          float32x4_t v48 = (float32x4_t)vdupq_lane_s32(v41, 0);
          v153[0] = v42;
          v153[1] = v44;
          int8x8_t v49 = (int8x8_t)vdup_n_s16(v23 > 1.0);
          int8x8_t v50 = vmvn_s8(v49);
          do
          {
            int8x16_t v51 = (int8x16_t)v153[v40 / 2];
            int8x8_t v52 = (int8x8_t)vmovn_s32(vcgtq_f32(v45, (float32x4_t)v51));
            int32x4_t v53 = vcgtq_f32(v47, (float32x4_t)v51);
            int8x16_t v54 = (int8x16_t)vmulq_n_f32(vdivq_f32(vsubq_f32((float32x4_t)v51, v47), v48), *(float *)&v39);
            *(int8x16_t *)&v152[v40] = vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vand_s8(vorr_s8(v50, vand_s8(v49, (int8x8_t)vmovn_s32(v53))), v52)), 0x1FuLL)), v51, vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vorr_s8(v49, v52)), 0x1FuLL)), vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32(
                                                            (int32x4_t)vmovl_u16((uint16x4_t)vand_s8(v49, (int8x8_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)v53)))), 0x1FuLL)), vbslq_s8((int8x16_t)vcgtq_f32(v45, (float32x4_t)v54), v54, (int8x16_t)vsubq_f32(v47, (float32x4_t)v54)), (int8x16_t)vsubq_f32(v47, (float32x4_t)v51)), (int8x16_t)vsubq_f32(v47, vaddq_f32(v45, vmulq_n_f32(vdivq_f32(vsubq_f32((float32x4_t)v51, v45), v46), *(float *)&v38)))));
            v40 += 2;
          }
          while (v40 != 4);
          uint64_t v55 = 0;
          float32x2_t v56 = (float32x2_t)vdup_lane_s32(v27, 0);
          do
          {
            float32x2_t v57 = vadd_f32(*(float32x2_t *)((char *)v153 + v55 * 8), v56);
            float v126 = v57.f32[0];
            float v130 = fmodf(v57.f32[1], 6.2832);
            *(float *)&uint64_t v58 = fmodf(v126, 6.2832);
            *((float *)&v58 + 1) = v130;
            *(void *)((char *)v153 + v55 * 8) = v58;
            float32x2_t v59 = vadd_f32((float32x2_t)v152[v55], v56);
            float v127 = v59.f32[0];
            float v131 = fmodf(v59.f32[1], 6.2832);
            *(float *)&uint64_t v60 = fmodf(v127, 6.2832);
            *((float *)&v60 + 1) = v131;
            v152[v55++] = v60;
          }
          while (v55 != 4);
          HGGLNode::hglBegin((char **)v24, 4);
          uint64_t v61 = 0;
          double v122 = v134;
          double v124 = v135;
          double v132 = v120;
          double v128 = v117;
          while (v61 != 8)
          {
            uint64_t v62 = ((_BYTE)v61 + 1) & 7;
            float v63 = *((float *)v153 + v62);
            float v64 = *((float *)v152 + v61);
            float v65 = *((float *)v152 + v62);
            __float2 v66 = __sincosf_stret(*((float *)v153 + v61));
            __float2 v67 = __sincosf_stret(v63);
            __float2 v68 = __sincosf_stret(v64);
            __float2 v69 = __sincosf_stret(v65);
            v70.n128_u32[0] = 1.0;
            v71.n128_f64[0] = HGGLNode::hglColor4f(v24, v70, 1.0, 1.0, 1.0);
            v71.n128_f32[0] = v120;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v71, v117);
            HGGLNode::hglVertex3f((float32x4_t **)v24, v135, v134, 0.0);
            v72.n128_f64[0] = v138 * (float)(v136 * v68.__cosval) + v132;
            v72.n128_f32[0] = v72.n128_f64[0];
            float v73 = v128 - v137 * (float)(v136 * v68.__sinval);
            HGGLNode::hglTexCoord2f((__n128 **)v24, v72, v73);
            float v74 = v138 * (float)(v136 * v66.__cosval) + v124;
            float v75 = v137 * (float)(v136 * v66.__sinval) + v122;
            HGGLNode::hglVertex3f((float32x4_t **)v24, v74, v75, 0.0);
            v76.n128_f64[0] = v138 * (float)(v136 * v69.__cosval) + v132;
            v76.n128_f32[0] = v76.n128_f64[0];
            float v77 = v128 - v137 * (float)(v136 * v69.__sinval);
            HGGLNode::hglTexCoord2f((__n128 **)v24, v76, v77);
            float v78 = v138 * (float)(v136 * v67.__cosval) + v124;
            float v79 = v137 * (float)(v136 * v67.__sinval) + v122;
            ++v61;
            HGGLNode::hglVertex3f((float32x4_t **)v24, v78, v79, 0.0);
          }
        }
        HGGLNode::hglEnd((HGRasterizer **)v24);
        if (a4)
        {
          [a4 heliumRef];
          uint64_t v139 = *(void *)&v153[0];
          if (*(void *)&v153[0]) {
            (*(void (**)(void))(**(void **)&v153[0] + 16))(*(void *)&v153[0]);
          }
        }
        else
        {
          *(void *)&v153[0] = 0;
          uint64_t v139 = 0;
        }
        [(PAESharedDefaultBase *)self smear:&v139 fromImage:a4 toImage:a4];
        uint64_t v113 = v152[0];
        if (*(void *)&v153[0] == v152[0])
        {
          if (*(void *)&v153[0]) {
            (*(void (**)(void))(**(void **)&v153[0] + 24))();
          }
        }
        else
        {
          if (*(void *)&v153[0])
          {
            (*(void (**)(void))(**(void **)&v153[0] + 24))();
            uint64_t v113 = v152[0];
          }
          *(void *)&v153[0] = v113;
          v152[0] = 0;
        }
        if (v139) {
          (*(void (**)(uint64_t))(*(void *)v139 + 24))(v139);
        }
        (*(void (**)(HGGLNode *, void, void))(*(void *)v24 + 120))(v24, 0, *(void *)&v153[0]);
        (*(void (**)(HGGLNode *, void, uint64_t))(*(void *)v24 + 136))(v24, 0, 2);
        v152[0] = v24;
        (*(void (**)(HGGLNode *))(*(void *)v24 + 16))(v24);
        [(PAESharedDefaultBase *)self crop:v152 fromImage:a4 toImage:a3];
        [a3 setHeliumRef:v152];
        if (v152[0]) {
          (*(void (**)(void))(*(void *)v152[0] + 24))(v152[0]);
        }
        if (*(void *)&v153[0]) {
          (*(void (**)(void))(**(void **)&v153[0] + 24))(*(void *)&v153[0]);
        }
        (*(void (**)(HGGLNode *))(*(void *)v24 + 24))(v24);
      }
      else
      {
        if (a4) {
          [a4 heliumRef];
        }
        else {
          v140[0] = 0.0;
        }
        [a3 setHeliumRef:v140];
        if (v140[0] != 0.0) {
          (*(void (**)(double))(**(void **)&v140[0] + 24))(COERCE_DOUBLE(*(void *)&v140[0]));
        }
      }
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a5 = 0;
  *a6 = 0;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end