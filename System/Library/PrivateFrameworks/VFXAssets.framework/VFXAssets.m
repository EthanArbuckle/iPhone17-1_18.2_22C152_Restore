__n128 Main_comAppleRealitykitVfxGeneral_graph_CABE86CB_8495_4BA5_8564_211F4E42EAD3(float a1, uint64_t a2, uint64_t a3, int a4, long long *a5, float32x4_t *a6)
{
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  __float2 v11;
  float32x4_t v12;
  long long v13;
  __n128 result;
  float32x4_t v15;
  long long v16;

  v16 = *a5;
  v8 = vrsqrteq_f32((float32x4_t)xmmword_260C14FB0);
  v9 = vmulq_f32(v8, vrsqrtsq_f32((float32x4_t)xmmword_260C14FB0, vmulq_f32(v8, v8)));
  v15 = vmulq_f32(vmulq_f32(v9, vrsqrtsq_f32((float32x4_t)xmmword_260C14FB0, vmulq_f32(v9, v9))), (float32x4_t)xmmword_260C14FC0);
  v10 = 1.5708;
  if (!a4) {
    v10 = 0.0;
  }
  v11 = __sincosf_stret(v10);
  v12 = vmulq_n_f32(v15, v11.__sinval);
  v12.i32[3] = LODWORD(v11.__cosval);
  *a6 = v12;
  v13 = v16;
  *((float *)&v13 + 1) = a1;
  DWORD2(v13) = DWORD2(v16);
  *a5 = v13;
  result.n128_u64[0] = v13;
  result.n128_u32[2] = DWORD2(v13);
  return result;
}

float __vfx_script_comAppleRealitykitVfxGeneral_graph_CABE86CB_8495_4BA5_8564_211F4E42EAD3()
{
  uint64_t arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(_DWORD **)(arguments_buffer + 16);
  v2 = *(long long **)(arguments_buffer + 32);
  v3 = *(float32x4_t **)(arguments_buffer + 40);
  long long v12 = *v2;
  float32x4_t v4 = vrsqrteq_f32((float32x4_t)xmmword_260C14FB0);
  float32x4_t v5 = vmulq_f32(v4, vrsqrtsq_f32((float32x4_t)xmmword_260C14FB0, vmulq_f32(v4, v4)));
  float32x4_t v11 = vmulq_f32(vmulq_f32(v5, vrsqrtsq_f32((float32x4_t)xmmword_260C14FB0, vmulq_f32(v5, v5))), (float32x4_t)xmmword_260C14FC0);
  float v6 = 1.5708;
  if (!**(unsigned char **)(arguments_buffer + 24)) {
    float v6 = 0.0;
  }
  __float2 v7 = __sincosf_stret(v6);
  float32x4_t v8 = vmulq_n_f32(v11, v7.__sinval);
  v8.i32[3] = LODWORD(v7.__cosval);
  LODWORD(v9) = v12;
  DWORD1(v9) = *v1;
  float32x4_t *v3 = v8;
  *((void *)&v9 + 1) = __PAIR64__(1.0, DWORD2(v12));
  float result = 1.0;
  long long *v2 = v9;
  return result;
}

void Spawn_comAppleRealitykitVfxGeneral_graph_2EFCC965_6C2A_4409_B612_17DCDCF8132E(float a1, float a2, float a3, float a4, float a5, float a6, uint64_t a7, int a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, float *a13, float *a14, float *a15, float *a16, float *a17, unsigned char *a18, unint64_t *a19)
{
  float v19 = a1 - a2;
  float v20 = a1 + a2;
  float v21 = fminf(v19, v20);
  float v22 = fmaxf(v19, v20);
  float v23 = a3 - a4;
  float v24 = a3 + a4;
  float v25 = fminf(v23, v24);
  float v26 = fmaxf(v23, v24);
  float v27 = a5 - a6;
  float v28 = a5 + a6;
  float v29 = fminf(v27, v28);
  float v30 = fmaxf(v27, v28);
  unsigned int v31 = 277803737
      * (((747796405 * a8 - 2038165537) >> (((747796405 * a8 - 2038165537) >> 28) + 4)) ^ (747796405 * a8 - 2038165537));
  float v32 = COERCE_FLOAT((v31 >> 31) ^ (v31 >> 9) | 0x3F800000) + -1.0;
  float v33 = v21 + (float)(v32 * (float)(v22 - v21));
  float v34 = v25 + (float)(v32 * (float)(v26 - v25));
  unint64_t v35 = a10 - a11;
  if (!a12) {
    unint64_t v35 = 0;
  }
  *a13 = v21;
  a13[1] = v22;
  unint64_t v36 = a11 + a10;
  *a14 = v25;
  a14[1] = v26;
  if (!a12) {
    unint64_t v36 = 0;
  }
  *a15 = v29;
  a15[1] = v30;
  *a16 = v33;
  *a17 = v34;
  *a18 = a9 ^ 1;
  if (v35 >= v36) {
    unint64_t v37 = v36;
  }
  else {
    unint64_t v37 = v35;
  }
  if (v35 <= v36) {
    unint64_t v38 = v36;
  }
  else {
    unint64_t v38 = v35;
  }
  *a19 = v37;
  a19[1] = v38;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_2EFCC965_6C2A_4409_B612_17DCDCF8132E()
{
  uint64_t arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(float **)(arguments_buffer + 56);
  v2 = *(unsigned char **)(arguments_buffer + 64);
  v3 = *(void **)(arguments_buffer + 72);
  float32x4_t v4 = *(void **)(arguments_buffer + 80);
  float32x4_t v5 = *(float **)(arguments_buffer + 96);
  __float2 v7 = *(float **)(arguments_buffer + 104);
  float v6 = *(float **)(arguments_buffer + 112);
  float32x4_t v8 = *(float **)(arguments_buffer + 120);
  long long v9 = *(float **)(arguments_buffer + 128);
  float32x4_t v11 = *(unsigned char **)(arguments_buffer + 136);
  v10 = *(unint64_t **)(arguments_buffer + 144);
  float v12 = **(float **)(arguments_buffer + 16);
  float v13 = **(float **)(arguments_buffer + 24);
  float v14 = **(float **)(arguments_buffer + 32);
  float v15 = **(float **)(arguments_buffer + 40);
  float v16 = **(float **)(arguments_buffer + 48);
  uint64_t v17 = **(void **)(arguments_buffer + 88);
  float v18 = v12 - v13;
  float v19 = v12 + v13;
  float v20 = fminf(v18, v19);
  float v21 = fmaxf(v18, v19);
  float v22 = v14 - v15;
  float v23 = v14 + v15;
  float v24 = fminf(v22, v23);
  float v25 = fmaxf(v22, v23);
  float v26 = v16 - *v1;
  float v27 = v16 + *v1;
  float v28 = fminf(v26, v27);
  float v29 = fmaxf(v26, v27);
  unsigned int v30 = 747796405 * **(_DWORD **)(arguments_buffer + 8) - 2038165537;
  unsigned int v31 = 277803737 * ((v30 >> ((v30 >> 28) + 4)) ^ v30);
  uint64_t result = v31 >> 31;
  float v33 = COERCE_FLOAT(result ^ (v31 >> 9) | 0x3F800000) + -1.0;
  float v34 = v20 + (float)(v33 * (float)(v21 - v20));
  float v35 = v24 + (float)(v33 * (float)(v25 - v24));
  char v36 = *v2 ^ 1;
  unint64_t v37 = *v3 - *v4;
  if (!v17) {
    unint64_t v37 = 0;
  }
  unint64_t v38 = *v4 + *v3;
  if (!v17) {
    unint64_t v38 = 0;
  }
  *float32x4_t v5 = v20;
  v5[1] = v21;
  *__float2 v7 = v24;
  v7[1] = v25;
  *float v6 = v28;
  v6[1] = v29;
  *float32x4_t v8 = v34;
  *long long v9 = v35;
  *float32x4_t v11 = v36;
  if (v37 >= v38) {
    unint64_t v39 = v38;
  }
  else {
    unint64_t v39 = v37;
  }
  if (v37 <= v38) {
    unint64_t v40 = v38;
  }
  else {
    unint64_t v40 = v37;
  }
  unint64_t *v10 = v39;
  v10[1] = v40;
  return result;
}

float Init_comAppleRealitykitVfxGeneral_graph_C4E7830E_DFD6_42B0_8C1E_C42D73D86C9C(float a1, float a2, float a3, float a4, float a5, float a6, float a7, __n128 a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, float *a13, float *a14, BOOL *a15, float *a16, float a17, float a18, uint64_t a19, long long a20,float a21,float *a22,void *a23,void *a24,__n128 *a25,float *a26,_OWORD *a27,_OWORD *a28,float *a29)
{
  float v29 = *a29;
  float v30 = *a16;
  float v31 = a1 - a2;
  float v32 = a1 + a2;
  float v33 = fminf(v31, v32);
  float v34 = fmaxf(v31, v32);
  float v35 = a3 - a4;
  float v36 = a3 + a4;
  a8.n128_u64[0] = (unint64_t)vand_s8((int8x8_t)vcvt_u32_f32(vmaxnm_f32((float32x2_t)a8.n128_u64[0], 0)), vorr_s8((int8x8_t)vcltz_f32((float32x2_t)a8.n128_u64[0]), (int8x8_t)vcgez_f32((float32x2_t)a8.n128_u64[0])));
  a8.n128_u32[2] = fmaxf(a8.n128_f32[2], 0.0);
  *a13 = v33;
  a13[1] = v34;
  float v37 = fmaxf(a6 - a7, 0.02);
  *a14 = fminf(v35, v36);
  a14[1] = fmaxf(v35, v36);
  *a15 = a11 == 0;
  *a22 = fminf(v37, a6 + a7);
  a22[1] = fmaxf(v37, a6 + a7);
  *a23 = a11 == 2;
  *a24 = a12;
  *a25 = a8;
  *a26 = fminf(a17 - a18, a17 + a18);
  a26[1] = fmaxf(a17 - a18, a17 + a18);
  *a27 = a20;
  *a28 = a20;
  *a29 = fminf(v29, a21);
  a29[1] = fmaxf(v29, a21);
  float result = fminf(v30, a5);
  *a16 = result;
  a16[1] = fmaxf(v30, a5);
  return result;
}

float __vfx_script_comAppleRealitykitVfxGeneral_graph_C4E7830E_DFD6_42B0_8C1E_C42D73D86C9C()
{
  uint64_t arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(float **)(arguments_buffer + 24);
  v2 = *(float **)(arguments_buffer + 32);
  v3 = *(float **)(arguments_buffer + 40);
  float32x4_t v4 = *(float **)(arguments_buffer + 56);
  float32x4_t v5 = *(float **)(arguments_buffer + 64);
  float v6 = *(float **)(arguments_buffer + 72);
  __float2 v7 = *(uint64_t **)(arguments_buffer + 80);
  float32x4_t v8 = *(long long **)(arguments_buffer + 88);
  long long v9 = *(float **)(arguments_buffer + 96);
  v10 = *(float **)(arguments_buffer + 104);
  float32x4_t v11 = *(long long **)(arguments_buffer + 112);
  float v12 = *(float **)(arguments_buffer + 120);
  float v13 = *(float **)(arguments_buffer + 128);
  float v14 = *(float **)(arguments_buffer + 136);
  float v16 = *(BOOL **)(arguments_buffer + 144);
  float v15 = *(float **)(arguments_buffer + 152);
  uint64_t v17 = *(float **)(arguments_buffer + 160);
  float v18 = *(void **)(arguments_buffer + 168);
  float v20 = *(void **)(arguments_buffer + 176);
  float v19 = *(_OWORD **)(arguments_buffer + 184);
  float v21 = *(float **)(arguments_buffer + 192);
  float v22 = *(_OWORD **)(arguments_buffer + 200);
  float v24 = *(_OWORD **)(arguments_buffer + 208);
  float v23 = *(float **)(arguments_buffer + 216);
  float v25 = **(float **)(arguments_buffer + 16);
  uint64_t v26 = **(void **)(arguments_buffer + 48);
  float v27 = *v4;
  uint64_t v28 = *v7;
  long long v29 = *v8;
  long long v30 = *v11;
  float v31 = *v12;
  float v32 = *v23;
  float v33 = *v15;
  float v34 = v25 - *v1;
  float v35 = v25 + *v1;
  float v36 = fminf(v34, v35);
  float v37 = fmaxf(v34, v35);
  float v38 = *v2 - *v3;
  float v39 = *v2 + *v3;
  float v40 = fminf(v38, v39);
  float v41 = fmaxf(v38, v39);
  float v42 = fmaxf(*v5 - *v6, 0.02);
  float v43 = *v5 + *v6;
  float v44 = fminf(v42, v43);
  float v45 = fmaxf(v42, v43);
  *(int8x8_t *)&long long v29 = vand_s8((int8x8_t)vcvt_u32_f32(vmaxnm_f32(*(float32x2_t *)&v29, 0)), vorr_s8((int8x8_t)vcltz_f32(*(float32x2_t *)&v29), (int8x8_t)vcgez_f32(*(float32x2_t *)&v29)));
  DWORD2(v29) = fmaxf(COERCE_FLOAT(*((void *)v8 + 1)), 0.0);
  float v46 = *v9 - *v10;
  float v47 = *v9 + *v10;
  *float v13 = v36;
  v13[1] = v37;
  *float v14 = v40;
  v14[1] = v41;
  *float v16 = v26 == 0;
  *uint64_t v17 = v44;
  v17[1] = v45;
  *float v18 = v26 == 2;
  *float v20 = v28;
  *float v19 = v29;
  *float v21 = fminf(v46, v47);
  v21[1] = fmaxf(v46, v47);
  *float v22 = v30;
  *float v24 = v30;
  *float v23 = fminf(v32, v31);
  v23[1] = fmaxf(v32, v31);
  float v48 = fminf(v33, v27);
  float result = fmaxf(v33, v27);
  *float v15 = v48;
  v15[1] = result;
  return result;
}

__n128 Update_comAppleRealitykitVfxGeneral_graph_9D89648D_3FBB_4295_90CD_9E682BD76791(float a1, float a2, float a3, float a4, uint64_t a5, uint64_t a6, int a7, int32x4_t *a8, BOOL *a9, BOOL *a10, void *a11)
{
  __int32 v24 = a8->i32[2];
  vfx_script_clock_time();
  *(float *)&double v20 = v20;
  *(float *)&double v20 = (float)(*(float *)&v20 * a1) * 0.1;
  BOOL v21 = a3 != 0.0;
  if (a4 != 0.0) {
    BOOL v21 = 1;
  }
  *a9 = a2 != 0.0;
  *a10 = v21;
  *a11 = a7 ^ 1u;
  int32x4_t v22 = vdupq_lane_s32(*(int32x2_t *)&v20, 0);
  v22.i32[2] = v24;
  *a8 = v22;
  result.n128_u64[0] = v22.i64[0];
  result.n128_u32[2] = v22.u32[2];
  return result;
}

__n128 __vfx_script_comAppleRealitykitVfxGeneral_graph_9D89648D_3FBB_4295_90CD_9E682BD76791()
{
  uint64_t arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(__n128 **)(arguments_buffer + 56);
  v2 = *(BOOL **)(arguments_buffer + 64);
  v3 = *(BOOL **)(arguments_buffer + 72);
  float32x4_t v4 = *(BOOL **)(arguments_buffer + 80);
  float v5 = **(float **)(arguments_buffer + 16);
  float v6 = **(float **)(arguments_buffer + 24);
  float v7 = **(float **)(arguments_buffer + 32);
  float v8 = **(float **)(arguments_buffer + 40);
  BOOL v9 = **(unsigned char **)(arguments_buffer + 48) == 0;
  unsigned __int32 v13 = v1->n128_u32[2];
  vfx_script_clock_time();
  *(float *)&double v10 = v10;
  *(float *)&double v10 = (float)(v5 * *(float *)&v10) * 0.1;
  BOOL v11 = v7 != 0.0;
  if (v8 != 0.0) {
    BOOL v11 = 1;
  }
  BOOL *v2 = v6 != 0.0;
  BOOL *v3 = v11;
  *float32x4_t v4 = v9;
  result.n128_u64[0] = vdupq_lane_s32(*(int32x2_t *)&v10, 0).u64[0];
  result.n128_u64[1] = __PAIR64__(1.0, v13);
  __n128 *v1 = result;
  return result;
}

void Render_comAppleRealitykitVfxGeneral_graph_39FD28C5_BDF9_4DD6_B2B8_459F45892DBF(const void *a1, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t *a6, unint64_t *a7, unint64_t *a8)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v8 = qword_260C15058[a3];
  v11[0] = xmmword_260C14FD0;
  v11[1] = xmmword_260C14FE0;
  v11[2] = xmmword_260C14FF0;
  uint64_t v12 = 0;
  unint64_t v9 = *((void *)v11 + a4);
  unint64_t v10 = 2;
  if (a5 < 2) {
    unint64_t v10 = a5;
  }
  *a6 = v8;
  *a7 = v9;
  *a8 = v10;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_39FD28C5_BDF9_4DD6_B2B8_459F45892DBF()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = vfx_script_get_arguments_buffer();
  v1 = *(void **)(result + 40);
  v2 = *(void **)(result + 48);
  v3 = *(unint64_t **)(result + 56);
  uint64_t v4 = **(void **)(result + 24);
  unint64_t v5 = **(void **)(result + 32);
  uint64_t v6 = qword_260C15058[**(void **)(result + 16)];
  v8[0] = xmmword_260C14FD0;
  v8[1] = xmmword_260C14FE0;
  v8[2] = xmmword_260C14FF0;
  uint64_t v9 = 0;
  uint64_t v7 = *((void *)v8 + v4);
  if (v5 >= 2) {
    unint64_t v5 = 2;
  }
  void *v1 = v6;
  void *v2 = v7;
  unint64_t *v3 = v5;
  return result;
}

uint64_t Spawn_comAppleRealitykitVfxGeneral_graph_3A6197AD_E251_4C3C_A4A4_97B88CE13708(const void *a1, int a2, float a3, float a4, BOOL a5, float a6, float *a7, BOOL *a8, BOOL *a9, float *a10)
{
  float v17 = a3 - a4;
  float v18 = a3 + a4;
  float v19 = fminf(v17, v18);
  float v20 = fmaxf(v17, v18);
  vfx_script_clock_time();
  *(float *)&double v21 = v21;
  unsigned int v22 = fmaxf(*(float *)&v21, 0.0);
  uint64_t result = vfx_script_clock_simulation_index();
  unsigned int v24 = 277803737
      * (((747796405 * (result + a2 + v22) + 1270287430) >> (((747796405 * (result + a2 + v22)
                                                                     + 1270287430) >> 28)
                                                                   + 4)) ^ (747796405 * (result + a2 + v22) + 1270287430));
  *a7 = v19 + (float)((float)(COERCE_FLOAT((v24 >> 31) ^ (v24 >> 9) | 0x3F800000) + -1.0) * (float)(v20 - v19));
  *a8 = a5;
  *a9 = a6 != 0.0;
  *a10 = a6;
  return result;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_3A6197AD_E251_4C3C_A4A4_97B88CE13708()
{
  uint64_t arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(float **)(arguments_buffer + 16);
  v2 = *(float **)(arguments_buffer + 24);
  v3 = *(float **)(arguments_buffer + 48);
  uint64_t v4 = *(unsigned char **)(arguments_buffer + 56);
  unint64_t v5 = *(BOOL **)(arguments_buffer + 64);
  uint64_t v6 = *(float **)(arguments_buffer + 72);
  int v7 = **(_DWORD **)(arguments_buffer + 8);
  char v8 = **(unsigned char **)(arguments_buffer + 32);
  float v9 = **(float **)(arguments_buffer + 40);
  float v10 = *v1 - *v2;
  float v11 = *v1 + *v2;
  float v12 = fminf(v10, v11);
  float v13 = fmaxf(v10, v11);
  vfx_script_clock_time();
  *(float *)&double v14 = v14;
  unsigned int v15 = fmaxf(*(float *)&v14, 0.0);
  uint64_t result = vfx_script_clock_simulation_index();
  unsigned int v17 = 277803737
      * (((747796405 * (result + v7 + v15) + 1270287430) >> (((747796405 * (result + v7 + v15)
                                                                     + 1270287430) >> 28)
                                                                   + 4)) ^ (747796405 * (result + v7 + v15) + 1270287430));
  float *v3 = v12 + (float)((float)(COERCE_FLOAT((v17 >> 31) ^ (v17 >> 9) | 0x3F800000) + -1.0) * (float)(v13 - v12));
  *uint64_t v4 = v8;
  *unint64_t v5 = v9 != 0.0;
  *uint64_t v6 = v9;
  return result;
}

float Init_comAppleRealitykitVfxGeneral_graph_808D496A_AA3D_4B1F_B709_6D736E35F2D4(float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8, uint64_t a9, uint64_t a10, float *a11, float *a12, float *a13, float *a14, float *a15, float *a16, float a17, float a18, float a19)
{
  float v19 = *a14;
  float v20 = a1 - a2;
  float v21 = a1 + a2;
  float v22 = fminf(v20, v21);
  float v23 = fmaxf(v20, v21);
  float v24 = a3 - a4;
  float v25 = a3 + a4;
  float v26 = fminf(v24, v25);
  float v27 = fmaxf(v24, v25);
  float v28 = a5 - a6;
  float v29 = a5 + a6;
  float v30 = fminf(v28, v29);
  float v31 = fmaxf(v28, v29);
  float v32 = fmaxf(a8 - a17, 0.02);
  float v33 = a8 + a17;
  *a11 = v22;
  a11[1] = v23;
  *a12 = v26;
  a12[1] = v27;
  *a13 = v30;
  a13[1] = v31;
  *a15 = fminf(v32, v33);
  a15[1] = fmaxf(v32, v33);
  *a16 = fminf(a18 - a19, a18 + a19);
  a16[1] = fmaxf(a18 - a19, a18 + a19);
  float result = fminf(v19, a7);
  *a14 = result;
  a14[1] = fmaxf(v19, a7);
  return result;
}

float __vfx_script_comAppleRealitykitVfxGeneral_graph_808D496A_AA3D_4B1F_B709_6D736E35F2D4()
{
  uint64_t arguments_buffer = (void *)vfx_script_get_arguments_buffer();
  v1 = (float *)arguments_buffer[2];
  v2 = (float *)arguments_buffer[3];
  v3 = (float *)arguments_buffer[4];
  uint64_t v4 = (float *)arguments_buffer[5];
  unint64_t v5 = (float *)arguments_buffer[6];
  uint64_t v6 = (float *)arguments_buffer[7];
  int v7 = (float *)arguments_buffer[8];
  char v8 = (float *)arguments_buffer[9];
  float v9 = (float *)arguments_buffer[10];
  float v10 = (float *)arguments_buffer[11];
  float v11 = (float *)arguments_buffer[12];
  float v12 = (float *)arguments_buffer[13];
  float v13 = (float *)arguments_buffer[14];
  double v14 = (float *)arguments_buffer[15];
  unsigned int v15 = (float *)arguments_buffer[16];
  float v16 = (float *)arguments_buffer[17];
  unsigned int v17 = (float *)arguments_buffer[18];
  float v18 = *v7;
  float v19 = *v15;
  float v20 = *v1 - *v2;
  float v21 = *v1 + *v2;
  float v22 = fminf(v20, v21);
  float v23 = fmaxf(v20, v21);
  float v24 = *v3 - *v4;
  float v25 = *v3 + *v4;
  float v26 = fminf(v24, v25);
  float v27 = fmaxf(v24, v25);
  float v28 = *v5 - *v6;
  float v29 = *v5 + *v6;
  float v30 = fminf(v28, v29);
  float v31 = fmaxf(v28, v29);
  float v32 = fmaxf(*v8 - *v9, 0.02);
  float v33 = *v8 + *v9;
  float v34 = fminf(v32, v33);
  float v35 = fmaxf(v32, v33);
  float v36 = *v10 - *v11;
  float v37 = *v10 + *v11;
  *float v12 = v22;
  v12[1] = v23;
  *float v13 = v26;
  v13[1] = v27;
  *double v14 = v30;
  v14[1] = v31;
  *float v16 = v34;
  v16[1] = v35;
  *unsigned int v17 = fminf(v36, v37);
  v17[1] = fmaxf(v36, v37);
  float result = fminf(v19, v18);
  *unsigned int v15 = result;
  v15[1] = fmaxf(v19, v18);
  return result;
}

__n128 Update_comAppleRealitykitVfxGeneral_graph_C0414514_1ABD_430C_99B8_0B75A900FA1A(float a1, float a2, float a3, float a4, uint64_t a5, uint64_t a6, int a7, int32x4_t *a8, BOOL *a9, BOOL *a10, void *a11)
{
  __int32 v24 = a8->i32[2];
  vfx_script_clock_time();
  *(float *)&double v20 = v20;
  *(float *)&double v20 = (float)(*(float *)&v20 * a1) * 0.1;
  BOOL v21 = a3 != 0.0;
  if (a4 != 0.0) {
    BOOL v21 = 1;
  }
  *a9 = a2 > 0.0;
  *a10 = v21;
  *a11 = a7 ^ 1u;
  int32x4_t v22 = vdupq_lane_s32(*(int32x2_t *)&v20, 0);
  v22.i32[2] = v24;
  *a8 = v22;
  result.n128_u64[0] = v22.i64[0];
  result.n128_u32[2] = v22.u32[2];
  return result;
}

__n128 __vfx_script_comAppleRealitykitVfxGeneral_graph_C0414514_1ABD_430C_99B8_0B75A900FA1A()
{
  uint64_t arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(__n128 **)(arguments_buffer + 56);
  v2 = *(BOOL **)(arguments_buffer + 64);
  v3 = *(BOOL **)(arguments_buffer + 72);
  uint64_t v4 = *(BOOL **)(arguments_buffer + 80);
  float v5 = **(float **)(arguments_buffer + 16);
  float v6 = **(float **)(arguments_buffer + 24);
  float v7 = **(float **)(arguments_buffer + 32);
  float v8 = **(float **)(arguments_buffer + 40);
  BOOL v9 = **(unsigned char **)(arguments_buffer + 48) == 0;
  unsigned __int32 v13 = v1->n128_u32[2];
  vfx_script_clock_time();
  *(float *)&double v10 = v10;
  *(float *)&double v10 = (float)(v5 * *(float *)&v10) * 0.1;
  BOOL v11 = v7 != 0.0;
  if (v8 != 0.0) {
    BOOL v11 = 1;
  }
  BOOL *v2 = v6 > 0.0;
  BOOL *v3 = v11;
  *uint64_t v4 = v9;
  result.n128_u64[0] = vdupq_lane_s32(*(int32x2_t *)&v10, 0).u64[0];
  result.n128_u64[1] = __PAIR64__(1.0, v13);
  __n128 *v1 = result;
  return result;
}

double Render_comAppleRealitykitVfxGeneral_graph_79611F84_9966_49FC_9DA9_42E714051A7E(const void *a1, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t *a6, unint64_t *a7, unint64_t *a8)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v8 = qword_260C15058[a3];
  v11[0] = xmmword_260C14FD0;
  v11[1] = xmmword_260C14FE0;
  *(void *)&double result = 1;
  v11[2] = xmmword_260C14FF0;
  uint64_t v12 = 0;
  unint64_t v10 = *((void *)v11 + a4);
  *a6 = v8;
  *a7 = v10;
  *a8 = a5;
  return result;
}

double __vfx_script_comAppleRealitykitVfxGeneral_graph_79611F84_9966_49FC_9DA9_42E714051A7E()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t arguments_buffer = vfx_script_get_arguments_buffer();
  v1 = *(void **)(arguments_buffer + 40);
  v2 = *(void **)(arguments_buffer + 48);
  v3 = *(void **)(arguments_buffer + 56);
  uint64_t v4 = **(void **)(arguments_buffer + 24);
  uint64_t v5 = **(void **)(arguments_buffer + 32);
  uint64_t v6 = qword_260C15058[**(void **)(arguments_buffer + 16)];
  v9[0] = xmmword_260C14FD0;
  v9[1] = xmmword_260C14FE0;
  *(void *)&double result = 1;
  v9[2] = xmmword_260C14FF0;
  uint64_t v10 = 0;
  uint64_t v8 = *((void *)v9 + v4);
  void *v1 = v6;
  void *v2 = v8;
  void *v3 = v5;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_18FD4393_3EF4_4453_A815_8E3AD16F6D13(const void *a1, unsigned int a2, unint64_t a3, int a4, unint64_t a5, unint64_t *a6, unint64_t *a7)
{
  if (!a4) {
    a3 = 1;
  }
  if (!a4) {
    a5 = 1;
  }
  *a6 = a3;
  *a7 = a5;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_18FD4393_3EF4_4453_A815_8E3AD16F6D13()
{
  uint64_t result = vfx_script_get_arguments_buffer();
  v1 = *(uint64_t **)(result + 48);
  uint64_t v2 = **(void **)(result + 16);
  if (**(unsigned char **)(result + 24))
  {
    uint64_t v3 = **(void **)(result + 32);
  }
  else
  {
    uint64_t v2 = 1;
    uint64_t v3 = 1;
  }
  **(void **)(result + 40) = v2;
  uint64_t *v1 = v3;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_73DD6AB1_ACCC_401A_9516_CEDA7AB07AC2(const void *a1, unsigned int a2, unint64_t a3, int a4, unint64_t a5, unint64_t *a6, unint64_t *a7)
{
  if (!a4) {
    a3 = 1;
  }
  if (!a4) {
    a5 = 1;
  }
  *a6 = a3;
  *a7 = a5;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_73DD6AB1_ACCC_401A_9516_CEDA7AB07AC2()
{
  uint64_t result = vfx_script_get_arguments_buffer();
  v1 = *(uint64_t **)(result + 48);
  uint64_t v2 = **(void **)(result + 16);
  if (**(unsigned char **)(result + 24))
  {
    uint64_t v3 = **(void **)(result + 32);
  }
  else
  {
    uint64_t v2 = 1;
    uint64_t v3 = 1;
  }
  **(void **)(result + 40) = v2;
  uint64_t *v1 = v3;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_C81D8ED9_E765_4CB8_B826_CC8497F5A622(float32x4_t a1, float a2, uint64_t a3, uint64_t a4, int a5, float32x4_t *a6, float *a7, BOOL *a8, void *a9)
{
  float32x4_t v10 = vmulq_f32(a1, a1);
  v10.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).u64[0];
  float32x4_t v11 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 0);
  v11.i32[3] = 0;
  float32x4_t v12 = vrsqrteq_f32(v11);
  float32x4_t v13 = vmulq_f32(v12, vrsqrtsq_f32(v11, vmulq_f32(v12, v12)));
  int8x16_t v24 = (int8x16_t)vmulq_f32(v13, vrsqrtsq_f32(v11, vmulq_f32(v13, v13)));
  int32x4_t v14 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v10.f32[0] != 0.0)), 0x1FuLL));
  v14.i32[3] = 0;
  __asm { FMOV            V4.4S, #1.0 }
  float32x4_t v19 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v14), v24, _Q4), a1);
  _Q4.i32[0] = v19.i32[2];
  v9.i32[0] = 1.0;
  v22.i64[0] = 0x8000000080000000;
  v22.i64[1] = 0x8000000080000000;
  float v20 = *(float *)vbslq_s8(v22, v9, _Q4).i32;
  *(float *)v22.i32 = v19.f32[1] / (float)(fabsf(v19.f32[2]) + 1.0);
  float v21 = vmuls_lane_f32(*(float *)v22.i32, *(float32x2_t *)v19.f32, 1);
  *(float *)v22.i32 = -(float)(v19.f32[0] * *(float *)v22.i32);
  float v23 = v19.f32[2] + (float)(v20 * v21);
  *(float *)v24.i32 = v20 * *(float *)v22.i32;
  float v25 = 1.0 - v21;
  float v26 = vmuls_lane_f32(-v20, *(float32x2_t *)v19.f32, 1);
  float v27 = v19.f32[2] + (float)(v23 + v25);
  if (v27 > 0.0)
  {
    float32x2_t v28 = (float32x2_t)vrev64_s32(*(int32x2_t *)v19.f32);
    *(int32x2_t *)v32.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32), 0);
    v32.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v28.u32[1], LODWORD(v26)), v28).u32[0];
    float32x2_t v29 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v27 + 1.0)), v24.u32[0]);
    float32x2_t v30 = vmul_f32(v29, v29);
    v29.i32[0] = v22.i32[0];
    unsigned __int32 v31 = vsub_f32(*(float32x2_t *)v24.i8, v29).u32[0];
    v22.i32[1] = v30.i32[1];
    v32.i64[1] = v22.i64[0];
    *(float *)v22.i32 = 0.5 / v29.f32[1];
LABEL_12:
    float32x4_t v36 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.i8, 0);
    goto LABEL_13;
  }
  if (v23 < v25 || v23 < v19.f32[2])
  {
    if (v25 <= v19.f32[2])
    {
      float v39 = sqrtf((float)((float)(v19.f32[2] + 1.0) - v23) - v25);
      v19.i32[0] = vsubq_f32(v19, v19).u32[0];
      v32.f32[1] = v19.f32[1] + v26;
      v32.f32[2] = v39 * v39;
      v32.f32[3] = *(float *)v24.i32 - *(float *)v22.i32;
      *(float *)v22.i32 = 0.5 / v39;
      goto LABEL_12;
    }
    float v35 = sqrtf((float)((float)(v25 + 1.0) - v23) - v19.f32[2]);
    v36.f32[0] = *(float *)v22.i32 + *(float *)v24.i32;
    float v37 = v35 * v35;
    float32x2_t v34 = (float32x2_t)vrev64_s32(*(int32x2_t *)v19.f32);
    int32x2_t v38 = (int32x2_t)vadd_f32(v34, (float32x2_t)__PAIR64__(v34.u32[1], LODWORD(v26)));
  }
  else
  {
    float v35 = sqrtf((float)((float)(v23 + 1.0) - v25) - v19.f32[2]);
    v36.f32[0] = v35 * v35;
    float v37 = *(float *)v22.i32 + *(float *)v24.i32;
    int32x2_t v38 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v26), v19.u32[0]), *(float32x2_t *)v19.f32);
  }
  v36.f32[1] = v37;
  *(int32x2_t *)&v36.u32[2] = v38;
  *(float *)v38.i32 = 0.5 / v35;
  float32x4_t v32 = (float32x4_t)vdupq_lane_s32(v38, 0);
LABEL_13:
  *a6 = vmulq_f32(v32, v36);
  *a7 = -a2;
  *a8 = a2 != 0.0;
  *a9 = a5 ^ 1u;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_C81D8ED9_E765_4CB8_B826_CC8497F5A622()
{
  uint64_t result = vfx_script_get_arguments_buffer();
  v1 = *(float **)(result + 48);
  uint64_t v2 = *(BOOL **)(result + 56);
  uint64_t v3 = *(void **)(result + 64);
  float32x4_t v4 = *(float32x4_t *)*(void *)(result + 16);
  float v5 = **(float **)(result + 24);
  int v6 = **(unsigned __int8 **)(result + 32);
  float32x4_t v7 = vmulq_f32(v4, v4);
  v7.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).u64[0];
  float32x4_t v8 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 0);
  v8.i32[3] = 0;
  float32x4_t v9 = vrsqrteq_f32(v8);
  float32x4_t v10 = vmulq_f32(v9, vrsqrtsq_f32(v8, vmulq_f32(v9, v9)));
  int8x16_t v22 = (int8x16_t)vmulq_f32(v10, vrsqrtsq_f32(v8, vmulq_f32(v10, v10)));
  int32x4_t v11 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v7.f32[0] != 0.0)), 0x1FuLL));
  v11.i32[3] = 0;
  __asm { FMOV            V4.4S, #1.0 }
  float32x4_t v16 = vmulq_f32(v4, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v11), v22, _Q4));
  _Q4.i32[0] = v16.i32[2];
  v17.i32[0] = 1.0;
  v20.i64[0] = 0x8000000080000000;
  v20.i64[1] = 0x8000000080000000;
  float v18 = *(float *)vbslq_s8(v20, v17, _Q4).i32;
  *(float *)v20.i32 = v16.f32[1] / (float)(fabsf(v16.f32[2]) + 1.0);
  float v19 = vmuls_lane_f32(*(float *)v20.i32, *(float32x2_t *)v16.f32, 1);
  *(float *)v20.i32 = -(float)(v16.f32[0] * *(float *)v20.i32);
  float v21 = v16.f32[2] + (float)(v18 * v19);
  *(float *)v22.i32 = v18 * *(float *)v20.i32;
  float v23 = 1.0 - v19;
  float v24 = vmuls_lane_f32(-v18, *(float32x2_t *)v16.f32, 1);
  float v25 = v16.f32[2] + (float)(v21 + v23);
  if (v25 > 0.0)
  {
    float32x2_t v26 = (float32x2_t)vrev64_s32(*(int32x2_t *)v16.f32);
    *(int32x2_t *)v30.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v16.f32, *(float32x2_t *)v16.f32), 0);
    v30.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v26.u32[1], LODWORD(v24)), v26).u32[0];
    float32x2_t v27 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v25 + 1.0)), v22.u32[0]);
    float32x2_t v28 = vmul_f32(v27, v27);
    v27.i32[0] = v20.i32[0];
    unsigned __int32 v29 = vsub_f32(*(float32x2_t *)v22.i8, v27).u32[0];
    v20.i32[1] = v28.i32[1];
    v30.i64[1] = v20.i64[0];
    *(float *)v20.i32 = 0.5 / v27.f32[1];
LABEL_12:
    float32x4_t v34 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.i8, 0);
    goto LABEL_13;
  }
  if (v21 < v23 || v21 < v16.f32[2])
  {
    if (v23 <= v16.f32[2])
    {
      float v37 = sqrtf((float)((float)(v16.f32[2] + 1.0) - v21) - v23);
      v16.i32[0] = vsubq_f32(v16, v16).u32[0];
      v30.f32[1] = v16.f32[1] + v24;
      v30.f32[2] = v37 * v37;
      v30.f32[3] = *(float *)v22.i32 - *(float *)v20.i32;
      *(float *)v20.i32 = 0.5 / v37;
      goto LABEL_12;
    }
    float v33 = sqrtf((float)((float)(v23 + 1.0) - v21) - v16.f32[2]);
    v34.f32[0] = *(float *)v20.i32 + *(float *)v22.i32;
    float v35 = v33 * v33;
    float32x2_t v32 = (float32x2_t)vrev64_s32(*(int32x2_t *)v16.f32);
    int32x2_t v36 = (int32x2_t)vadd_f32(v32, (float32x2_t)__PAIR64__(v32.u32[1], LODWORD(v24)));
  }
  else
  {
    float v33 = sqrtf((float)((float)(v21 + 1.0) - v23) - v16.f32[2]);
    v34.f32[0] = v33 * v33;
    float v35 = *(float *)v20.i32 + *(float *)v22.i32;
    int32x2_t v36 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v24), v16.u32[0]), *(float32x2_t *)v16.f32);
  }
  v34.f32[1] = v35;
  *(int32x2_t *)&v34.u32[2] = v36;
  *(float *)v36.i32 = 0.5 / v33;
  float32x4_t v30 = (float32x4_t)vdupq_lane_s32(v36, 0);
LABEL_13:
  *(float32x4_t *)*(void *)(result + 40) = vmulq_f32(v30, v34);
  float *v1 = -v5;
  BOOL *v2 = v5 != 0.0;
  void *v3 = v6 == 0;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_36892C5B_FE17_447F_9E03_D2C255C0486F(float32x4_t a1, float a2, uint64_t a3, uint64_t a4, int a5, float32x4_t *a6, float *a7, BOOL *a8, void *a9)
{
  float32x4_t v10 = vmulq_f32(a1, a1);
  v10.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).u64[0];
  float32x4_t v11 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 0);
  v11.i32[3] = 0;
  float32x4_t v12 = vrsqrteq_f32(v11);
  float32x4_t v13 = vmulq_f32(v12, vrsqrtsq_f32(v11, vmulq_f32(v12, v12)));
  int8x16_t v24 = (int8x16_t)vmulq_f32(v13, vrsqrtsq_f32(v11, vmulq_f32(v13, v13)));
  int32x4_t v14 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v10.f32[0] != 0.0)), 0x1FuLL));
  v14.i32[3] = 0;
  __asm { FMOV            V4.4S, #1.0 }
  float32x4_t v19 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v14), v24, _Q4), a1);
  _Q4.i32[0] = v19.i32[2];
  v9.i32[0] = 1.0;
  v22.i64[0] = 0x8000000080000000;
  v22.i64[1] = 0x8000000080000000;
  float v20 = *(float *)vbslq_s8(v22, v9, _Q4).i32;
  *(float *)v22.i32 = v19.f32[1] / (float)(fabsf(v19.f32[2]) + 1.0);
  float v21 = vmuls_lane_f32(*(float *)v22.i32, *(float32x2_t *)v19.f32, 1);
  *(float *)v22.i32 = -(float)(v19.f32[0] * *(float *)v22.i32);
  float v23 = v19.f32[2] + (float)(v20 * v21);
  *(float *)v24.i32 = v20 * *(float *)v22.i32;
  float v25 = 1.0 - v21;
  float v26 = vmuls_lane_f32(-v20, *(float32x2_t *)v19.f32, 1);
  float v27 = v19.f32[2] + (float)(v23 + v25);
  if (v27 > 0.0)
  {
    float32x2_t v28 = (float32x2_t)vrev64_s32(*(int32x2_t *)v19.f32);
    *(int32x2_t *)v32.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32), 0);
    v32.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v28.u32[1], LODWORD(v26)), v28).u32[0];
    float32x2_t v29 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v27 + 1.0)), v24.u32[0]);
    float32x2_t v30 = vmul_f32(v29, v29);
    v29.i32[0] = v22.i32[0];
    unsigned __int32 v31 = vsub_f32(*(float32x2_t *)v24.i8, v29).u32[0];
    v22.i32[1] = v30.i32[1];
    v32.i64[1] = v22.i64[0];
    *(float *)v22.i32 = 0.5 / v29.f32[1];
LABEL_12:
    float32x4_t v36 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.i8, 0);
    goto LABEL_13;
  }
  if (v23 < v25 || v23 < v19.f32[2])
  {
    if (v25 <= v19.f32[2])
    {
      float v39 = sqrtf((float)((float)(v19.f32[2] + 1.0) - v23) - v25);
      v19.i32[0] = vsubq_f32(v19, v19).u32[0];
      v32.f32[1] = v19.f32[1] + v26;
      v32.f32[2] = v39 * v39;
      v32.f32[3] = *(float *)v24.i32 - *(float *)v22.i32;
      *(float *)v22.i32 = 0.5 / v39;
      goto LABEL_12;
    }
    float v35 = sqrtf((float)((float)(v25 + 1.0) - v23) - v19.f32[2]);
    v36.f32[0] = *(float *)v22.i32 + *(float *)v24.i32;
    float v37 = v35 * v35;
    float32x2_t v34 = (float32x2_t)vrev64_s32(*(int32x2_t *)v19.f32);
    int32x2_t v38 = (int32x2_t)vadd_f32(v34, (float32x2_t)__PAIR64__(v34.u32[1], LODWORD(v26)));
  }
  else
  {
    float v35 = sqrtf((float)((float)(v23 + 1.0) - v25) - v19.f32[2]);
    v36.f32[0] = v35 * v35;
    float v37 = *(float *)v22.i32 + *(float *)v24.i32;
    int32x2_t v38 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v26), v19.u32[0]), *(float32x2_t *)v19.f32);
  }
  v36.f32[1] = v37;
  *(int32x2_t *)&v36.u32[2] = v38;
  *(float *)v38.i32 = 0.5 / v35;
  float32x4_t v32 = (float32x4_t)vdupq_lane_s32(v38, 0);
LABEL_13:
  *a6 = vmulq_f32(v32, v36);
  *a7 = -a2;
  *a8 = a2 != 0.0;
  *a9 = a5 ^ 1u;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_36892C5B_FE17_447F_9E03_D2C255C0486F()
{
  uint64_t result = vfx_script_get_arguments_buffer();
  v1 = *(float **)(result + 48);
  uint64_t v2 = *(BOOL **)(result + 56);
  uint64_t v3 = *(void **)(result + 64);
  float32x4_t v4 = *(float32x4_t *)*(void *)(result + 16);
  float v5 = **(float **)(result + 24);
  int v6 = **(unsigned __int8 **)(result + 32);
  float32x4_t v7 = vmulq_f32(v4, v4);
  v7.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).u64[0];
  float32x4_t v8 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 0);
  v8.i32[3] = 0;
  float32x4_t v9 = vrsqrteq_f32(v8);
  float32x4_t v10 = vmulq_f32(v9, vrsqrtsq_f32(v8, vmulq_f32(v9, v9)));
  int8x16_t v22 = (int8x16_t)vmulq_f32(v10, vrsqrtsq_f32(v8, vmulq_f32(v10, v10)));
  int32x4_t v11 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v7.f32[0] != 0.0)), 0x1FuLL));
  v11.i32[3] = 0;
  __asm { FMOV            V4.4S, #1.0 }
  float32x4_t v16 = vmulq_f32(v4, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v11), v22, _Q4));
  _Q4.i32[0] = v16.i32[2];
  v17.i32[0] = 1.0;
  v20.i64[0] = 0x8000000080000000;
  v20.i64[1] = 0x8000000080000000;
  float v18 = *(float *)vbslq_s8(v20, v17, _Q4).i32;
  *(float *)v20.i32 = v16.f32[1] / (float)(fabsf(v16.f32[2]) + 1.0);
  float v19 = vmuls_lane_f32(*(float *)v20.i32, *(float32x2_t *)v16.f32, 1);
  *(float *)v20.i32 = -(float)(v16.f32[0] * *(float *)v20.i32);
  float v21 = v16.f32[2] + (float)(v18 * v19);
  *(float *)v22.i32 = v18 * *(float *)v20.i32;
  float v23 = 1.0 - v19;
  float v24 = vmuls_lane_f32(-v18, *(float32x2_t *)v16.f32, 1);
  float v25 = v16.f32[2] + (float)(v21 + v23);
  if (v25 > 0.0)
  {
    float32x2_t v26 = (float32x2_t)vrev64_s32(*(int32x2_t *)v16.f32);
    *(int32x2_t *)v30.f32 = vdup_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v16.f32, *(float32x2_t *)v16.f32), 0);
    v30.i32[0] = vsub_f32((float32x2_t)__PAIR64__(v26.u32[1], LODWORD(v24)), v26).u32[0];
    float32x2_t v27 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sqrtf(v25 + 1.0)), v22.u32[0]);
    float32x2_t v28 = vmul_f32(v27, v27);
    v27.i32[0] = v20.i32[0];
    unsigned __int32 v29 = vsub_f32(*(float32x2_t *)v22.i8, v27).u32[0];
    v20.i32[1] = v28.i32[1];
    v30.i64[1] = v20.i64[0];
    *(float *)v20.i32 = 0.5 / v27.f32[1];
LABEL_12:
    float32x4_t v34 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.i8, 0);
    goto LABEL_13;
  }
  if (v21 < v23 || v21 < v16.f32[2])
  {
    if (v23 <= v16.f32[2])
    {
      float v37 = sqrtf((float)((float)(v16.f32[2] + 1.0) - v21) - v23);
      v16.i32[0] = vsubq_f32(v16, v16).u32[0];
      v30.f32[1] = v16.f32[1] + v24;
      v30.f32[2] = v37 * v37;
      v30.f32[3] = *(float *)v22.i32 - *(float *)v20.i32;
      *(float *)v20.i32 = 0.5 / v37;
      goto LABEL_12;
    }
    float v33 = sqrtf((float)((float)(v23 + 1.0) - v21) - v16.f32[2]);
    v34.f32[0] = *(float *)v20.i32 + *(float *)v22.i32;
    float v35 = v33 * v33;
    float32x2_t v32 = (float32x2_t)vrev64_s32(*(int32x2_t *)v16.f32);
    int32x2_t v36 = (int32x2_t)vadd_f32(v32, (float32x2_t)__PAIR64__(v32.u32[1], LODWORD(v24)));
  }
  else
  {
    float v33 = sqrtf((float)((float)(v21 + 1.0) - v23) - v16.f32[2]);
    v34.f32[0] = v33 * v33;
    float v35 = *(float *)v20.i32 + *(float *)v22.i32;
    int32x2_t v36 = (int32x2_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v24), v16.u32[0]), *(float32x2_t *)v16.f32);
  }
  v34.f32[1] = v35;
  *(int32x2_t *)&v34.u32[2] = v36;
  *(float *)v36.i32 = 0.5 / v33;
  float32x4_t v30 = (float32x4_t)vdupq_lane_s32(v36, 0);
LABEL_13:
  *(float32x4_t *)*(void *)(result + 40) = vmulq_f32(v30, v34);
  float *v1 = -v5;
  BOOL *v2 = v5 != 0.0;
  void *v3 = v6 == 0;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_3631C6CB_E76B_47C6_9BA0_12F4E98A26BD(const void *a1, unsigned int a2, float a3, int a4, float *a5, BOOL *a6, unint64_t *a7)
{
  *a5 = -a3;
  *a6 = a3 != 0.0;
  *a7 = a4 ^ 1u;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_3631C6CB_E76B_47C6_9BA0_12F4E98A26BD()
{
  uint64_t result = vfx_script_get_arguments_buffer();
  v1 = *(BOOL **)(result + 40);
  uint64_t v2 = *(BOOL **)(result + 48);
  float v3 = **(float **)(result + 16);
  BOOL v4 = **(unsigned char **)(result + 24) == 0;
  **(float **)(result + 32) = -v3;
  BOOL *v1 = v3 != 0.0;
  BOOL *v2 = v4;
  return result;
}

void Main_comAppleRealitykitVfxGeneral_graph_EAD9CBA2_783E_48D3_B113_0CC58281BB32(const void *a1, unsigned int a2, float a3, int a4, float *a5, BOOL *a6, unint64_t *a7)
{
  *a5 = -a3;
  *a6 = a3 != 0.0;
  *a7 = a4 ^ 1u;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_graph_EAD9CBA2_783E_48D3_B113_0CC58281BB32()
{
  uint64_t result = vfx_script_get_arguments_buffer();
  v1 = *(BOOL **)(result + 40);
  uint64_t v2 = *(BOOL **)(result + 48);
  float v3 = **(float **)(result + 16);
  BOOL v4 = **(unsigned char **)(result + 24) == 0;
  **(float **)(result + 32) = -v3;
  BOOL *v1 = v3 != 0.0;
  BOOL *v2 = v4;
  return result;
}

__n128 ParticleInit_comAppleRealitykitVfxGeneral_particleInit_52(float32x4_t a1, float32x4_t a2, uint64_t a3, uint64_t a4, __n128 *a5)
{
  a2.i64[0] = 0;
  float32x4_t v5 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(a1, a2), 0), (int8x16_t)xmmword_260C14FC0, (int8x16_t)0);
  a1.i32[0] = vextq_s8((int8x16_t)a1, (int8x16_t)a1, 8uLL).u32[0];
  int16x4_t v6 = (int16x4_t)vcgtz_f32(*(float32x2_t *)a1.f32);
  __n128 result = (__n128)vaddq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_lane_s16(v6, 0)), 0x1FuLL)), (int8x16_t)xmmword_260C15010, (int8x16_t)vdupq_n_s32(0x3DCCCCCDu)), vaddq_f32(v5, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vuzp1_s16(v6, v6)), 0x1FuLL)), (int8x16_t)xmmword_260C15000, (int8x16_t)0)));
  result.n128_u32[3] = 1.0;
  *a5 = result;
  return result;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_particleInit_52()
{
  return vfx_script_get_arguments_buffer();
}

__n128 ParticleInit_comAppleRealitykitVfxGeneral_particleInit_3(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float a5, float a6, float a7, float a8, uint64_t a9, int a10, int a11, int a12, int a13, int a14, uint64_t a15, uint64_t a16, unsigned __int8 a17, unint64_t a18, unint64_t a19, float a20,float32x4_t a21,float a22,float a23,uint64_t a24,float32x4_t a25,float a26,float a27,int a28,unint64_t a29,int8x16_t *a30,int8x16_t *a31,int8x16_t *a32,_OWORD *a33,_DWORD *a34,__n128 *a35,float *a36,float32x4_t *a37,float32x4_t *a38,_OWORD *a39)
{
  int v44 = vfx_script_clock_simulation_index();
  int v45 = vfx_script_clock_simulation_index();
  int v46 = a11 + a10;
  unsigned int v47 = 277803737
      * (((747796405 * (v45 + v46) - 745064565) >> (((747796405 * (v45 + v46) - 745064565) >> 28)
                                                                + 4)) ^ (747796405 * (v45 + v46) - 745064565));
  unint64_t v48 = a16 * a15;
  float v49 = fmaxf((float)v48, 1.0);
  float v50 = (float)((float)(a7 - a8)
              + (float)((float)(COERCE_FLOAT((v47 >> 31) ^ (v47 >> 9) | 0x3F800000) + -1.0)
                      * (float)((float)(a7 + a8) - (float)(a7 - a8))))
      / v49;
  int v51 = vfx_script_clock_simulation_index();
  unsigned int v52 = 277803737
      * (((747796405 * (v51 + v46) - 745064565) >> (((747796405 * (v51 + v46) - 745064565) >> 28)
                                                                + 4)) ^ (747796405 * (v51 + v46) - 745064565));
  float v53 = fmaxf((float)((float)a18 - (float)a19)+ (float)((float)(COERCE_FLOAT((v52 >> 31) ^ (v52 >> 9) | 0x3F800000) + -1.0)* (float)((float)((float)a18 + (float)a19) - (float)((float)a18 - (float)a19))), 0.0)/ v49;
  float v54 = 0.999;
  if (!a17) {
    float v54 = 0.0;
  }
  float v158 = v54 * v50;
  unsigned int v55 = 747796405 * (v46 + v44) - 606257472;
  unsigned int v56 = 277803737 * ((v55 >> ((v55 >> 28) + 4)) ^ v55);
  float v57 = COERCE_FLOAT((v56 >> 31) ^ (v56 >> 9) | 0x3F800000) + -1.0;
  unsigned int v58 = 277803737
      * (((747796405 * v55 - 1403630843) >> (((747796405 * v55 - 1403630843) >> 28) + 4)) ^ (747796405 * v55 - 1403630843));
  float v59 = COERCE_FLOAT((v58 >> 31) ^ (v58 >> 9) | 0x3F800000) + -1.0;
  if (!a13) {
    float v59 = 0.0;
  }
  int8x16_t v60 = (int8x16_t)vmlaq_n_f32(a3, vsubq_f32(a4, a3), v59);
  if (!a12) {
    float v57 = 0.0;
  }
  float32x4_t v61 = vsubq_f32(a2, a1);
  if (a14) {
    unsigned int v62 = -1;
  }
  else {
    unsigned int v62 = 0;
  }
  int8x16_t v168 = (int8x16_t)vmlaq_n_f32(a1, v61, v57);
  int8x16_t v63 = vbslq_s8((int8x16_t)vdupq_n_s32(v62), v60, v168);
  if ((a17 & (v48 > 1)) == 0) {
    float v53 = 0.0;
  }
  float v152 = v53;
  int8x16_t v154 = v63;
  __int32 v64 = 747796405 * (vfx_script_clock_simulation_index() + v46) + 85864716;
  v65.i32[0] = v64;
  v65.i32[1] = 747796405 * v64 - 1403630843;
  uint32x2_t v66 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v65, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v65, 0x1CuLL))), (int8x8_t)v65), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v72 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v66, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v66, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)v74.f32 = vadd_f32(v72, _D1);
  unsigned int v75 = 277803737
      * (((747796405 * (747796405 * v64 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v64 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v64
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  v74.f32[2] = COERCE_FLOAT((v75 >> 31) ^ (v75 >> 9) | 0x3F800000) + -1.0;
  v74.i32[3] = 0;
  float32x4_t v76 = vmaxnmq_f32(v74, (float32x4_t)0);
  v76.i32[3] = 0;
  __asm { FMOV            V5.4S, #1.0 }
  int8x16_t v164 = _Q5;
  v78.i64[0] = 0x4000000040000000;
  v78.i64[1] = 0x4000000040000000;
  __asm { FMOV            V2.4S, #-1.0 }
  float32x4_t v80 = vmlaq_f32(_Q2, v78, vminnmq_f32(v76, (float32x4_t)xmmword_260C14FB0));
  float32x4_t v81 = vmulq_f32(v80, v80);
  v81.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v81, 2), vaddq_f32(v81, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 1))).u64[0];
  float32x4_t v82 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 0);
  v82.i32[3] = 0;
  float32x4_t v83 = vrsqrteq_f32(v82);
  float32x4_t v84 = vmulq_f32(v83, vrsqrtsq_f32(v82, vmulq_f32(v83, v83)));
  int8x16_t v85 = (int8x16_t)vmulq_f32(v80, vmulq_f32(v84, vrsqrtsq_f32(v82, vmulq_f32(v84, v84))));
  int32x4_t v86 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v81.f32[0] != 0.0)), 0x1FuLL));
  v86.i32[3] = 0;
  float32x4_t v87 = vmulq_f32(a21, a21);
  v87.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v87, 2), vaddq_f32(v87, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 1))).u64[0];
  float32x4_t v88 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 0);
  v88.i32[3] = 0;
  float32x4_t v89 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v86), v85, (int8x16_t)v80);
  float32x4_t v90 = vrsqrteq_f32(v88);
  float32x4_t v91 = vmulq_f32(v90, vrsqrtsq_f32(v88, vmulq_f32(v90, v90)));
  int32x4_t v92 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v87.f32[0] != 0.0)), 0x1FuLL));
  v92.i32[3] = 0;
  float32x4_t v93 = vmulq_f32(a21, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v92), (int8x16_t)vmulq_f32(v91, vrsqrtsq_f32(v88, vmulq_f32(v91, v91))), _Q5));
  float32x4_t v146 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v93, (int32x4_t)v93), (int8x16_t)v93, 0xCuLL), vnegq_f32(v89)), v93, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v89, (int32x4_t)v89), (int8x16_t)v89, 0xCuLL));
  float32x4_t v148 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v146, (int32x4_t)v146), (int8x16_t)v146, 0xCuLL);
  float32x4_t v94 = vmulq_f32(v93, v89);
  float v95 = acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v94, 2), vaddq_f32(v94, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v94.f32, 1))).f32[0]);
  float32x4_t v96 = vmulq_f32(v146, v146);
  v96.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v96, 2), v96)).u64[0];
  float32x4_t v97 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 0);
  v97.i32[3] = 0;
  float32x4_t v98 = vrsqrteq_f32(v97);
  float32x4_t v99 = vmulq_f32(v98, vrsqrtsq_f32(v97, vmulq_f32(v98, v98)));
  int32x4_t v100 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v96.f32[0] != 0.0)), 0x1FuLL));
  v100.i32[3] = 0;
  float32x4_t v149 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v100), (int8x16_t)vmulq_f32(vmulq_f32(v99, vrsqrtsq_f32(v97, vmulq_f32(v99, v99))), v148), (int8x16_t)v148);
  __float2 v101 = __sincosf_stret((float)(v95 * a20) * 0.5);
  float32x4_t v102 = vmulq_n_f32(v149, v101.__sinval);
  float32x4_t v103 = v102;
  v103.i32[3] = LODWORD(v101.__cosval);
  float32x4_t v104 = vmulq_f32(v103, (float32x4_t)xmmword_260C15020);
  int32x4_t v105 = (int32x4_t)vnegq_f32(v104);
  int8x16_t v106 = (int8x16_t)vtrn2q_s32((int32x4_t)v104, vtrn1q_s32((int32x4_t)v104, v105));
  float32x4_t v107 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v104, (int8x16_t)v105, 8uLL), *(float32x2_t *)a21.f32, 1), (float32x4_t)vextq_s8(v106, v106, 8uLL), a21.f32[0]);
  float32x4_t v108 = (float32x4_t)vrev64q_s32((int32x4_t)v104);
  v108.i32[0] = v105.i32[1];
  v108.i32[3] = v105.i32[2];
  float32x4_t v109 = vmlaq_laneq_f32(v107, v108, a21, 2);
  int32x4_t v110 = (int32x4_t)vnegq_f32(v109);
  int8x16_t v111 = (int8x16_t)vtrn2q_s32((int32x4_t)v109, vtrn1q_s32((int32x4_t)v109, v110));
  float32x4_t v112 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v109, (int8x16_t)v110, 8uLL), *(float32x2_t *)v102.f32, 1), (float32x4_t)vextq_s8(v111, v111, 8uLL), v102.f32[0]);
  float32x4_t v113 = (float32x4_t)vrev64q_s32((int32x4_t)v109);
  v113.i32[0] = v110.i32[1];
  v113.i32[3] = v110.i32[2];
  float32x4_t v114 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v109, v103, 3), v113, v102, 2), v112);
  float32x4_t v115 = vmulq_f32(v114, v114);
  v115.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v115, 2), vaddq_f32(v115, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 1))).u64[0];
  float32x4_t v116 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 0);
  v116.i32[3] = 0;
  float32x4_t v117 = vrsqrteq_f32(v116);
  float32x4_t v118 = vmulq_f32(v117, vrsqrtsq_f32(v116, vmulq_f32(v117, v117)));
  int32x4_t v119 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v115.f32[0] != 0.0)), 0x1FuLL));
  v119.i32[3] = 0;
  float32x4_t v162 = vmulq_f32(v114, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v119), (int8x16_t)vmulq_f32(v118, vrsqrtsq_f32(v116, vmulq_f32(v118, v118))), v164));
  int v120 = vfx_script_clock_simulation_index();
  unsigned int v121 = 277803737
       * (((747796405 * (v120 + v46) - 745064565) >> (((747796405 * (v120 + v46) - 745064565) >> 28)
                                                                  + 4)) ^ (747796405 * (v120 + v46) - 745064565));
  float v122 = (float)(a22 - a23)
       + (float)((float)(COERCE_FLOAT((v121 >> 31) ^ (v121 >> 9) | 0x3F800000) + -1.0)
               * (float)((float)(a22 + a23) - (float)(a22 - a23)));
  *(float *)&unsigned __int32 v150 = v122;
  float32x4_t v123 = vmulq_f32(v162, v162);
  int32x2_t v124 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v123, 2), vaddq_f32(v123, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v123.f32, 1))).u64[0];
  unsigned int v125 = *(float *)v124.i32 != 0.0;
  if (a24 == 1) {
    float v126 = 0.0;
  }
  else {
    float v126 = v122;
  }
  float v127 = v122 * 0.5;
  float32x4_t v128 = (float32x4_t)vdupq_lane_s32(v124, 0);
  v128.i32[3] = 0;
  float32x4_t v129 = vrsqrteq_f32(v128);
  float32x4_t v130 = vmulq_f32(v129, vrsqrtsq_f32(v128, vmulq_f32(v129, v129)));
  int8x16_t v131 = (int8x16_t)vmulq_f32(v130, vrsqrtsq_f32(v128, vmulq_f32(v130, v130)));
  int32x4_t v132 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v125)), 0x1FuLL));
  v132.i32[3] = 0;
  float32x4_t v155 = vmulq_f32(v162, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v132), v131, v164));
  if (a24 == 1) {
    float v133 = v127;
  }
  else {
    float v133 = 0.0;
  }
  __float2 v134 = __sincosf_stret(v133);
  float32x4_t v135 = vmulq_n_f32(v155, v134.__sinval);
  v135.i32[3] = LODWORD(v134.__cosval);
  float32x4_t v156 = v135;
  float32x4_t v136 = vmulq_f32(a25, a25);
  v136.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v136, 2), vaddq_f32(v136, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v136.f32, 1))).u64[0];
  float32x4_t v137 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v136.f32, 0);
  v137.i32[3] = 0;
  float32x4_t v138 = vrsqrteq_f32(v137);
  float32x4_t v139 = vmulq_f32(v138, vrsqrtsq_f32(v137, vmulq_f32(v138, v138)));
  int32x4_t v140 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v136.f32[0] != 0.0)), 0x1FuLL));
  v140.i32[3] = 0;
  float32x4_t v165 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v140), (int8x16_t)vmulq_f32(v139, vrsqrtsq_f32(v137, vmulq_f32(v139, v139))), v164), a25);
  int v141 = vfx_script_clock_simulation_index();
  unsigned int v142 = 277803737
       * (((747796405 * (v141 + v46) - 745064565) >> (((747796405 * (v141 + v46) - 745064565) >> 28)
                                                                  + 4)) ^ (747796405 * (v141 + v46) - 745064565));
  float32x4_t v166 = vmulq_n_f32(v165, (float)(a26 - a27)+ (float)((float)(COERCE_FLOAT((v142 >> 31) ^ (v142 >> 9) | 0x3F800000) + -1.0)* (float)((float)(a26 + a27) - (float)(a26 - a27))));
  vfx_script_clock_time();
  *(float *)&long long v143 = *(double *)&v143;
  *a30 = v168;
  *a31 = v168;
  *a32 = v154;
  *a34 = LODWORD(v152);
  *a36 = v126;
  *a37 = v156;
  DWORD1(v143) = a28;
  *((float *)&v143 + 2) = (float)a29;
  *a38 = v166;
  *a39 = v143;
  *(void *)&long long v143 = __PAIR64__(LODWORD(a6), LODWORD(a5));
  *((void *)&v143 + 1) = __PAIR64__(LODWORD(v152), LODWORD(v158));
  *a33 = v143;
  __n128 result = (__n128)v162;
  result.n128_u32[3] = v150;
  *a35 = result;
  return result;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_particleInit_3()
{
  return vfx_script_get_arguments_buffer();
}

__n128 ParticleInit_comAppleRealitykitVfxGeneral_particleInit_65(int8x16_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float a6, float a7, float a8, uint64_t a9, int a10, int a11, int a12, int a13, int a14, int a15, uint64_t a16, float a17, uint64_t a18, unint64_t a19, unint64_t a20,float a21,uint64_t a22,float32x4_t a23,float a24,float a25,uint64_t a26,int8x16_t *a27,int8x16_t *a28,int8x16_t *a29,_OWORD *a30,_DWORD *a31,__n128 *a32,float *a33,float32x4_t *a34,long long *a35)
{
  long long v154 = *a35;
  int v39 = vfx_script_clock_simulation_index();
  float v40 = fminf(a8 - a17, a8 + a17);
  int v41 = vfx_script_clock_simulation_index();
  int v42 = a11 + a10;
  unsigned int v43 = 277803737
      * (((747796405 * (v41 + v42) + 1492984298) >> (((747796405 * (v41 + v42) + 1492984298) >> 28)
                                                                 + 4)) ^ (747796405 * (v41 + v42) + 1492984298));
  unint64_t v44 = a18 * a16;
  float v45 = fmaxf((float)v44, 1.0);
  float v153 = (float)((float)(v40
                       + (float)((float)(COERCE_FLOAT((v43 >> 31) ^ (v43 >> 9) | 0x3F800000) + -1.0)
                               * (float)(fmaxf(a8 - a17, a8 + a17) - v40)))
               / v45)
       * 0.999;
  float v46 = (float)a19 - (float)a20;
  float v47 = (float)a19 + (float)a20;
  float v48 = fminf(v46, v47);
  float v49 = fmaxf(v46, v47);
  int v50 = vfx_script_clock_simulation_index();
  unsigned int v51 = 277803737
      * (((747796405 * (v50 + v42) + 1492984298) >> (((747796405 * (v50 + v42) + 1492984298) >> 28)
                                                                 + 4)) ^ (747796405 * (v50 + v42) + 1492984298));
  float v52 = fmaxf(v48 + (float)((float)(COERCE_FLOAT((v51 >> 31) ^ (v51 >> 9) | 0x3F800000) + -1.0) * (float)(v49 - v48)), 0.0)/ v45;
  unsigned int v53 = 747796405 * (v42 + v39) - 478131083;
  unsigned int v54 = 277803737 * ((v53 >> ((v53 >> 28) + 4)) ^ v53);
  float v55 = COERCE_FLOAT((v54 >> 31) ^ (v54 >> 9) | 0x3F800000) + -1.0;
  unsigned int v56 = 277803737
      * (((747796405 * v53 - 1403630843) >> (((747796405 * v53 - 1403630843) >> 28) + 4)) ^ (747796405 * v53 - 1403630843));
  float v57 = COERCE_FLOAT((v56 >> 31) ^ (v56 >> 9) | 0x3F800000) + -1.0;
  if (!a14) {
    float v57 = 0.0;
  }
  int8x16_t v58 = (int8x16_t)vmlaq_n_f32(a4, vsubq_f32(a5, a4), v57);
  if (!a12) {
    float v55 = 0.0;
  }
  int8x16_t v59 = (int8x16_t)vmlaq_n_f32(a2, vsubq_f32(a3, a2), v55);
  if (a13) {
    unsigned int v60 = -1;
  }
  else {
    unsigned int v60 = 0;
  }
  int8x16_t v61 = vbslq_s8((int8x16_t)vdupq_n_s32(v60), a1, v59);
  int8x16_t v148 = v61;
  if (a15) {
    unsigned int v62 = -1;
  }
  else {
    unsigned int v62 = 0;
  }
  int8x16_t v63 = vbslq_s8((int8x16_t)vdupq_n_s32(v62), v58, v61);
  if (v44 <= 1) {
    float v52 = 0.0;
  }
  float v150 = v52;
  int8x16_t v152 = v63;
  __int32 v64 = 747796405 * (vfx_script_clock_simulation_index() + v42) + 85864716;
  v65.i32[0] = v64;
  v65.i32[1] = 747796405 * v64 - 1403630843;
  uint32x2_t v66 = (uint32x2_t)vmul_s32((int32x2_t)veor_s8((int8x8_t)vshl_u32(v65, (uint32x2_t)vsub_s32((int32x2_t)0x300000003, (int32x2_t)vshr_n_u32(v65, 0x1CuLL))), (int8x8_t)v65), vdup_n_s32(0x108EF2D9u));
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v72 = (float32x2_t)vorr_s8(veor_s8((int8x8_t)vshl_u32(v66, (uint32x2_t)0xFFFFFFE1FFFFFFF7), (int8x8_t)vshl_u32(v66, (uint32x2_t)0xFFFFFFF7FFFFFFE1)), _D1);
  __asm { FMOV            V1.2S, #-1.0 }
  *(float32x2_t *)v74.f32 = vadd_f32(v72, _D1);
  unsigned int v75 = 277803737
      * (((747796405 * (747796405 * v64 - 1403630843) - 1403630843) >> (((747796405 * (747796405 * v64 - 1403630843) - 1403630843) >> 28)
                                                                                    + 4)) ^ (747796405
                                                                                           * (747796405 * v64
                                                                                            - 1403630843)
                                                                                           - 1403630843));
  v74.f32[2] = COERCE_FLOAT((v75 >> 31) ^ (v75 >> 9) | 0x3F800000) + -1.0;
  v74.i32[3] = 0;
  float32x4_t v76 = vmaxnmq_f32(v74, (float32x4_t)0);
  v76.i32[3] = 0;
  __asm { FMOV            V5.4S, #1.0 }
  int8x16_t v160 = _Q5;
  v78.i64[0] = 0x4000000040000000;
  v78.i64[1] = 0x4000000040000000;
  __asm { FMOV            V2.4S, #-1.0 }
  float32x4_t v80 = vmlaq_f32(_Q2, v78, vminnmq_f32(v76, (float32x4_t)xmmword_260C14FB0));
  float32x4_t v81 = vmulq_f32(v80, v80);
  v81.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v81, 2), vaddq_f32(v81, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 1))).u64[0];
  float32x4_t v82 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 0);
  v82.i32[3] = 0;
  float32x4_t v83 = vrsqrteq_f32(v82);
  float32x4_t v84 = vmulq_f32(v83, vrsqrtsq_f32(v82, vmulq_f32(v83, v83)));
  int8x16_t v85 = (int8x16_t)vmulq_f32(v80, vmulq_f32(v84, vrsqrtsq_f32(v82, vmulq_f32(v84, v84))));
  int32x4_t v86 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v81.f32[0] != 0.0)), 0x1FuLL));
  v86.i32[3] = 0;
  float32x4_t v87 = vmulq_f32(a23, a23);
  v87.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v87, 2), vaddq_f32(v87, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 1))).u64[0];
  float32x4_t v88 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 0);
  v88.i32[3] = 0;
  float32x4_t v89 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v86), v85, (int8x16_t)v80);
  float32x4_t v90 = vrsqrteq_f32(v88);
  float32x4_t v91 = vmulq_f32(v90, vrsqrtsq_f32(v88, vmulq_f32(v90, v90)));
  int32x4_t v92 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v87.f32[0] != 0.0)), 0x1FuLL));
  v92.i32[3] = 0;
  float32x4_t v93 = vmulq_f32(a23, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v92), (int8x16_t)vmulq_f32(v91, vrsqrtsq_f32(v88, vmulq_f32(v91, v91))), _Q5));
  float32x4_t v142 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v93, (int32x4_t)v93), (int8x16_t)v93, 0xCuLL), vnegq_f32(v89)), v93, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v89, (int32x4_t)v89), (int8x16_t)v89, 0xCuLL));
  float32x4_t v144 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v142, (int32x4_t)v142), (int8x16_t)v142, 0xCuLL);
  float32x4_t v94 = vmulq_f32(v93, v89);
  float v95 = acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v94, 2), vaddq_f32(v94, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v94.f32, 1))).f32[0]);
  float32x4_t v96 = vmulq_f32(v142, v142);
  v96.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v96, 2), v96)).u64[0];
  float32x4_t v97 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 0);
  v97.i32[3] = 0;
  float32x4_t v98 = vrsqrteq_f32(v97);
  float32x4_t v99 = vmulq_f32(v98, vrsqrtsq_f32(v97, vmulq_f32(v98, v98)));
  int32x4_t v100 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v96.f32[0] != 0.0)), 0x1FuLL));
  v100.i32[3] = 0;
  float32x4_t v145 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v100), (int8x16_t)vmulq_f32(vmulq_f32(v99, vrsqrtsq_f32(v97, vmulq_f32(v99, v99))), v144), (int8x16_t)v144);
  __float2 v101 = __sincosf_stret((float)(v95 * a21) * 0.5);
  float32x4_t v102 = vmulq_n_f32(v145, v101.__sinval);
  float32x4_t v103 = v102;
  v103.i32[3] = LODWORD(v101.__cosval);
  float32x4_t v104 = vmulq_f32(v103, (float32x4_t)xmmword_260C15020);
  int32x4_t v105 = (int32x4_t)vnegq_f32(v104);
  int8x16_t v106 = (int8x16_t)vtrn2q_s32((int32x4_t)v104, vtrn1q_s32((int32x4_t)v104, v105));
  float32x4_t v107 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v104, (int8x16_t)v105, 8uLL), *(float32x2_t *)a23.f32, 1);
  float32x4_t v108 = (float32x4_t)vrev64q_s32((int32x4_t)v104);
  v108.i32[0] = v105.i32[1];
  v108.i32[3] = v105.i32[2];
  float32x4_t v109 = vmlaq_laneq_f32(vmlaq_n_f32(v107, (float32x4_t)vextq_s8(v106, v106, 8uLL), a23.f32[0]), v108, a23, 2);
  int32x4_t v110 = (int32x4_t)vnegq_f32(v109);
  int8x16_t v111 = (int8x16_t)vtrn2q_s32((int32x4_t)v109, vtrn1q_s32((int32x4_t)v109, v110));
  float32x4_t v112 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v109, (int8x16_t)v110, 8uLL), *(float32x2_t *)v102.f32, 1), (float32x4_t)vextq_s8(v111, v111, 8uLL), v102.f32[0]);
  float32x4_t v113 = (float32x4_t)vrev64q_s32((int32x4_t)v109);
  v113.i32[0] = v110.i32[1];
  v113.i32[3] = v110.i32[2];
  float32x4_t v114 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v109, v103, 3), v113, v102, 2), v112);
  float32x4_t v115 = vmulq_f32(v114, v114);
  v115.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v115, 2), vaddq_f32(v115, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 1))).u64[0];
  float32x4_t v116 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 0);
  v116.i32[3] = 0;
  float32x4_t v117 = vrsqrteq_f32(v116);
  float32x4_t v118 = vmulq_f32(v117, vrsqrtsq_f32(v116, vmulq_f32(v117, v117)));
  int32x4_t v119 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v115.f32[0] != 0.0)), 0x1FuLL));
  v119.i32[3] = 0;
  float32x4_t v158 = vmulq_f32(v114, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v119), (int8x16_t)vmulq_f32(v118, vrsqrtsq_f32(v116, vmulq_f32(v118, v118))), v160));
  float v120 = fminf(a24 - a25, a24 + a25);
  int v121 = vfx_script_clock_simulation_index();
  unsigned int v122 = 277803737
       * (((747796405 * (v121 + v42) + 1492984298) >> (((747796405 * (v121 + v42)
                                                                                   + 1492984298) >> 28)
                                                                   + 4)) ^ (747796405 * (v121 + v42) + 1492984298));
  float v123 = v120
       + (float)((float)(COERCE_FLOAT((v122 >> 31) ^ (v122 >> 9) | 0x3F800000) + -1.0)
               * (float)(fmaxf(a24 - a25, a24 + a25) - v120));
  unsigned __int32 v146 = LODWORD(v123);
  float32x4_t v124 = vmulq_f32(v158, v158);
  int32x2_t v125 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v124, 2), vaddq_f32(v124, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v124.f32, 1))).u64[0];
  unsigned int v126 = *(float *)v125.i32 != 0.0;
  if (a26 == 1) {
    float v127 = 0.0;
  }
  else {
    float v127 = v123;
  }
  float v128 = v123 * 0.5;
  float32x4_t v129 = (float32x4_t)vdupq_lane_s32(v125, 0);
  v129.i32[3] = 0;
  float32x4_t v130 = vrsqrteq_f32(v129);
  float32x4_t v131 = vmulq_f32(v130, vrsqrtsq_f32(v129, vmulq_f32(v130, v130)));
  int8x16_t v132 = (int8x16_t)vmulq_f32(v131, vrsqrtsq_f32(v129, vmulq_f32(v131, v131)));
  int32x4_t v133 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v126)), 0x1FuLL));
  v133.i32[3] = 0;
  float32x4_t v161 = vmulq_f32(v158, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v133), v132, v160));
  if (a26 == 1) {
    float v134 = v128;
  }
  else {
    float v134 = 0.0;
  }
  __float2 v135 = __sincosf_stret(v134);
  float32x4_t v136 = vmulq_n_f32(v161, v135.__sinval);
  v136.i32[3] = LODWORD(v135.__cosval);
  float32x4_t v162 = v136;
  vfx_script_clock_time();
  *(float *)&long long v137 = *(double *)&v137;
  *a27 = v148;
  *a28 = v148;
  *a29 = v152;
  *a31 = LODWORD(v150);
  *a33 = v127;
  *(void *)((char *)&v137 + 4) = *(void *)((char *)&v154 + 4);
  *a34 = v162;
  *a35 = v137;
  *(void *)&long long v137 = __PAIR64__(LODWORD(a7), LODWORD(a6));
  *((void *)&v137 + 1) = __PAIR64__(LODWORD(v150), LODWORD(v153));
  *a30 = v137;
  __n128 result = (__n128)v158;
  result.n128_u32[3] = v146;
  *a32 = result;
  return result;
}

uint64_t __vfx_script_comAppleRealitykitVfxGeneral_particleInit_65()
{
  return vfx_script_get_arguments_buffer();
}

void ParticleUpdate_comAppleRealitykitVfxGeneral_particleUpdate_19(float32x4_t a1, float32x4_t a2, float a3, __n128 a4, float32x4_t a5, float a6, float a7, float a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, float32x4_t *a13, float *a14, float *a15, float32x4_t *a16, float32x4_t a17, float *a18)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  float v58 = 1.0 - a3;
  float v59 = a3;
  float v60 = sinf(a3 * 3.1416);
  float v61 = v60 * v60;
  float v62 = v59 * v59;
  float v63 = 1.0 - (float)(v59 * v59);
  int v64 = 1065353216;
  float32x4_t v27 = vmlaq_n_f32(a1, vsubq_f32(a2, a1), powf(v59, a4.n128_f32[1]));
  float v28 = fminf(fmaxf(v27.f32[3], 0.0), 1.0) * *(&v58 + (unint64_t)a4.n128_f32[2]);
  float32x4_t v29 = vmulq_n_f32(v27, v28);
  v29.f32[3] = v28;
  float32x4_t v54 = v29;
  float v30 = a5.f32[1] + (float)((float)(vmuls_lane_f32(a6, *(float32x2_t *)a5.f32, 1) - a5.f32[1]) * powf(v59, a7));
  vfx_script_clock_time();
  *(float *)&double v31 = v31;
  float v32 = *(float *)&v31 - a4.n128_f32[0];
  float32x4_t v33 = vmulq_f32(a17, a17);
  v33.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).u64[0];
  unsigned int v34 = v33.f32[0] != 0.0;
  float v35 = (float)(a17.f32[3] + (float)((float)(*(float *)&v31 - a4.n128_f32[0]) * a5.f32[0])) * 0.5;
  float32x4_t v36 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 0);
  v36.i32[3] = 0;
  float32x4_t v37 = vrsqrteq_f32(v36);
  float32x4_t v38 = vmulq_f32(v37, vrsqrtsq_f32(v36, vmulq_f32(v37, v37)));
  float32x4_t v39 = vrsqrtsq_f32(v36, vmulq_f32(v38, v38));
  uint16x4_t v40 = (uint16x4_t)vdup_n_s16(v34);
  if (a11 == 1) {
    a8 = 0.0;
  }
  int32x4_t v41 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16(v40), 0x1FuLL));
  v41.i32[3] = 0;
  int8x16_t v42 = (int8x16_t)vmulq_f32(v38, v39);
  int8x16_t v43 = (int8x16_t)vcltzq_s32(v41);
  __asm { FMOV            V3.4S, #1.0 }
  float32x4_t v57 = vmulq_f32((float32x4_t)vbslq_s8(v43, v42, _Q3), a17);
  if (!_ZF) {
    float v35 = 0.0;
  }
  __float2 v49 = __sincosf_stret(v35);
  float32x4_t v50 = vmulq_n_f32(v57, v49.__sinval);
  v50.i32[3] = LODWORD(v49.__cosval);
  float v51 = vmuls_lane_f32(v32, a5, 2);
  if (!a12) {
    float v51 = 0.0;
  }
  *a13 = v54;
  *a14 = v30;
  *a15 = a8;
  *a16 = v50;
  *a18 = a5.f32[3] + v51;
}

void __vfx_script_comAppleRealitykitVfxGeneral_particleUpdate_19()
{
}

void ParticleUpdate_comAppleRealitykitVfxGeneral_particleUpdate_12(float32x4_t a1, float32x4_t a2, float a3, float a4, float32x4_t a5, float a6, float a7, float a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, uint64_t a13, float32x4_t *a14, float *a15, float *a16, float a17, uint64_t a18, float32x4_t a19, float *a20,float32x4_t *a21)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  float v63 = 1.0 - a3;
  float v64 = a3;
  float v65 = sinf(a3 * 3.1416);
  float v66 = v65 * v65;
  float v67 = v64 * v64;
  float v68 = 1.0 - (float)(v64 * v64);
  int v69 = 1065353216;
  float32x4_t v30 = vmlaq_n_f32(a1, vsubq_f32(a2, a1), powf(v64, a4));
  float v31 = fminf(fmaxf(v30.f32[3], 0.0), 1.0) * *(&v63 + a11);
  float32x4_t v32 = vmulq_n_f32(v30, v31);
  v32.f32[3] = v31;
  float32x4_t v59 = v32;
  float v33 = a5.f32[1] + (float)((float)(vmuls_lane_f32(a6, *(float32x2_t *)a5.f32, 1) - a5.f32[1]) * powf(v64, a7));
  vfx_script_clock_time();
  *(float *)&double v34 = v34;
  float v35 = *(float *)&v34 - a8;
  float v36 = vmuls_lane_f32(v35, a5, 2);
  if (!a12) {
    float v36 = 0.0;
  }
  float v37 = a5.f32[3] + v36;
  float32x4_t v38 = vmulq_f32(a19, a19);
  v38.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).u64[0];
  unsigned int v39 = v38.f32[0] != 0.0;
  float v40 = (float)(a19.f32[3] + (float)(v35 * a5.f32[0])) * 0.5;
  float32x4_t v41 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 0);
  v41.i32[3] = 0;
  float32x4_t v42 = vrsqrteq_f32(v41);
  float32x4_t v43 = vmulq_f32(v42, vrsqrtsq_f32(v41, vmulq_f32(v42, v42)));
  float32x4_t v44 = vrsqrtsq_f32(v41, vmulq_f32(v43, v43));
  uint16x4_t v45 = (uint16x4_t)vdup_n_s16(v39);
  if (a13 == 1) {
    float v46 = 0.0;
  }
  else {
    float v46 = a17;
  }
  int32x4_t v47 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16(v45), 0x1FuLL));
  v47.i32[3] = 0;
  int8x16_t v48 = (int8x16_t)vmulq_f32(v43, v44);
  int8x16_t v49 = (int8x16_t)vcltzq_s32(v47);
  __asm { FMOV            V3.4S, #1.0 }
  float32x4_t v62 = vmulq_f32((float32x4_t)vbslq_s8(v49, v48, _Q3), a19);
  if (!_ZF) {
    float v40 = 0.0;
  }
  __float2 v55 = __sincosf_stret(v40);
  float32x4_t v56 = vmulq_n_f32(v62, v55.__sinval);
  v56.i32[3] = LODWORD(v55.__cosval);
  *a14 = v59;
  *a15 = v33;
  *a16 = v37;
  *a20 = v46;
  *a21 = v56;
}

void __vfx_script_comAppleRealitykitVfxGeneral_particleUpdate_12()
{
}

char **__vfx_get_script_table_comAppleRealitykitVfxGeneral()
{
  return &__vfx_get_script_table_comAppleRealitykitVfxGeneral::scriptTable;
}

void Spawn_comAppleVfxConfetti_graph_5(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4)
{
  if (a2 >= a3) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = a2;
  }
  if (a2 <= a3) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = a2;
  }
  *a4 = v4;
  a4[1] = v5;
}

uint64_t __vfx_script_comAppleVfxConfetti_graph_5(uint64_t a1)
{
  unsafe_script_context = a1;
  vfx_script_clock_time();
  vfx_script_clock_delta_time();
  uint64_t result = vfx_script_get_arguments_buffer();
  uint64_t v2 = *(void **)(result + 24);
  unint64_t v3 = **(void **)(result + 8);
  unint64_t v4 = **(void **)(result + 16);
  if (v3 >= v4) {
    uint64_t v5 = **(void **)(result + 16);
  }
  else {
    uint64_t v5 = **(void **)(result + 8);
  }
  if (v3 <= v4) {
    unint64_t v3 = **(void **)(result + 16);
  }
  void *v2 = v5;
  v2[1] = v3;
  return result;
}

uint64_t sub_260C110C4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D70);
  sub_260C14BE0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_260C14FF0;
  uint64_t result = sub_260C14BB0();
  off_26A8E1D40 = (_UNKNOWN *)v0;
  return result;
}

id sub_260C111A0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D80);
  MEMORY[0x270FA5388]();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260C112B0((uint64_t)v1);
  uint64_t v2 = sub_260C14B40();
  uint64_t v3 = *(void *)(v2 - 8);
  unint64_t v4 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    unint64_t v4 = (void *)sub_260C14B20();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v1, v2);
  }
  return v4;
}

uint64_t sub_260C112B0@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for comAppleVfxConfetti();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  unint64_t v4 = (void *)sub_260C14C20();
  uint64_t v5 = (void *)sub_260C14C20();
  id v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_260C14B30();

    uint64_t v7 = sub_260C14B40();
    float32x4_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a1;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_260C14B40();
    float32x4_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a1;
    uint64_t v11 = 1;
  }
  return v8(v10, v11, 1, v9);
}

void *sub_260C11410()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D80);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_260C14B40();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - v8;
  sub_260C112B0((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_260C11FAC((uint64_t)v2);
    uint64_t v10 = (void *)sub_260C14B90();
    sub_260C1200C();
    swift_allocError();
    *uint64_t v11 = 0xD00000000000001ALL;
    v11[1] = 0x8000000260C15830;
    (*(void (**)(void *, void, void *))(*(v10 - 1) + 104))(v11, *MEMORY[0x263F845E8], v10);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    uint64_t v10 = objc_allocWithZone((Class)sub_260C14C00());
    uint64_t v12 = sub_260C14BA0();
    if (!v0) {
      uint64_t v10 = (void *)v12;
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  return v10;
}

id sub_260C1168C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260C1190C(a1, a2, a3, (uint64_t (*)(void))sub_260C11410);
}

uint64_t sub_260C116A4()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D80);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_260C14B40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260C112B0((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_260C11FAC((uint64_t)v4);
    uint64_t v9 = sub_260C14B90();
    sub_260C1200C();
    swift_allocError();
    void *v10 = 0xD00000000000001ALL;
    v10[1] = 0x8000000260C15830;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v10, *MEMORY[0x263F845E8], v9);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    id v11 = objc_msgSend(objc_allocWithZone((Class)sub_260C14C00()), sel_init);
    uint64_t v12 = sub_260C14BF0();
    if (!v0) {
      uint64_t v1 = v12;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v1;
}

id sub_260C118F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260C1190C(a1, a2, a3, sub_260C116A4);
}

id sub_260C1190C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = (void *)a4();
  return v4;
}

id sub_260C11994()
{
  sub_260C11F70(0, &qword_26A8E1D78);
  uint64_t v0 = (void *)sub_260C14C40();
  return v0;
}

id sub_260C119E4()
{
  sub_260C11B64();
  sub_260C11F70(0, &qword_26A8E1D68);
  uint64_t v0 = (void *)sub_260C14C10();
  swift_bridgeObjectRelease();
  return v0;
}

id sub_260C11A60()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for comAppleVfxConfetti();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __vfx_get_effect_class_comAppleVfxConfetti()
{
  type metadata accessor for comAppleVfxConfetti();
  return swift_getObjCClassFromMetadata();
}

uint64_t __vfx_get_effect_class_comAppleVfxConfetti()()
{
  return type metadata accessor for comAppleVfxConfetti();
}

uint64_t type metadata accessor for comAppleVfxConfetti()
{
  uint64_t result = qword_26A8E1D58;
  if (!qword_26A8E1D58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_260C11B1C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_260C11B5C()
{
  return type metadata accessor for comAppleVfxConfetti();
}

uint64_t sub_260C11B64()
{
  uint64_t v0 = sub_260C14BE0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A8E1D38 != -1) {
LABEL_29:
  }
    swift_once();
  uint64_t v4 = (char *)off_26A8E1D40;
  uint64_t v5 = *((void *)off_26A8E1D40 + 2);
  if (v5)
  {
    uint64_t v6 = self;
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
    uint64_t v7 = v1 + 16;
    float v40 = v8;
    id v41 = v6;
    uint64_t v9 = &v4[(*(unsigned __int8 *)(v7 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 64)];
    uint64_t v42 = v7;
    uint64_t v37 = *(void *)(v7 + 56);
    float32x4_t v38 = (void (**)(char *, uint64_t))(v7 - 8);
    v35[1] = v4;
    swift_bridgeObjectRetain();
    uint64_t v1 = MEMORY[0x263F8EE80];
    uint64_t v36 = v0;
    unsigned int v39 = v3;
    while (1)
    {
      uint64_t v12 = (char *)v1;
      v40(v3, v9, v0);
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_260C14BC0();
      uint64_t v15 = v14;
      id v16 = objc_msgSend(v41, sel_valueWithPointer_, sub_260C14BD0());
      if (!v16)
      {
        swift_bridgeObjectRetain();
        unint64_t v25 = sub_260C13F88(v13, v15);
        char v27 = v26;
        swift_bridgeObjectRelease();
        if (v27)
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          float32x4_t v43 = v12;
          uint64_t v1 = (uint64_t)v12;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_260C145AC();
            uint64_t v1 = (uint64_t)v43;
          }
          swift_bridgeObjectRelease();
          float32x4_t v29 = *(void **)(*(void *)(v1 + 56) + 8 * v25);
          sub_260C142F0(v25, v1);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v1 = (uint64_t)v12;
        }
        goto LABEL_6;
      }
      id v17 = v16;
      uint64_t v1 = swift_isUniquelyReferenced_nonNull_native();
      float32x4_t v43 = v12;
      uint64_t v3 = v12;
      unint64_t v19 = sub_260C13F88(v13, v15);
      uint64_t v20 = *((void *)v12 + 2);
      BOOL v21 = (v18 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v0 = v18;
      if (*((void *)v12 + 3) >= v22)
      {
        if (v1)
        {
          uint64_t v1 = (uint64_t)v43;
          if ((v18 & 1) == 0) {
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t v3 = (char *)&v43;
          sub_260C145AC();
          uint64_t v1 = (uint64_t)v43;
          if ((v0 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
      else
      {
        sub_260C14000(v22, v1);
        uint64_t v3 = v43;
        unint64_t v23 = sub_260C13F88(v13, v15);
        if ((v0 & 1) != (v24 & 1))
        {
          uint64_t result = sub_260C14C90();
          __break(1u);
          return result;
        }
        unint64_t v19 = v23;
        uint64_t v1 = (uint64_t)v43;
        if ((v0 & 1) == 0)
        {
LABEL_19:
          *(void *)(v1 + 8 * (v19 >> 6) + 64) |= 1 << v19;
          float32x4_t v30 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
          *float32x4_t v30 = v13;
          v30[1] = v15;
          *(void *)(*(void *)(v1 + 56) + 8 * v19) = v17;
          uint64_t v31 = *(void *)(v1 + 16);
          BOOL v32 = __OFADD__(v31, 1);
          uint64_t v33 = v31 + 1;
          if (v32) {
            goto LABEL_28;
          }
          *(void *)(v1 + 16) = v33;
          swift_bridgeObjectRetain();
          goto LABEL_5;
        }
      }
      uint64_t v10 = *(void *)(v1 + 56);
      id v11 = *(void **)(v10 + 8 * v19);
      *(void *)(v10 + 8 * v19) = v17;

LABEL_5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v0 = v36;
LABEL_6:
      uint64_t v3 = v39;
      (*v38)(v39, v0);
      swift_bridgeObjectRelease();
      v9 += v37;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        return v1;
      }
    }
  }
  return MEMORY[0x263F8EE80];
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_260C11F70(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_260C11FAC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_260C1200C()
{
  unint64_t result = qword_26A8E1D88;
  if (!qword_26A8E1D88)
  {
    sub_260C14B90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8E1D88);
  }
  return result;
}

void sub_260C12068(uint64_t a1)
{
  qword_26A8E1D90 = a1;
  sub_260C14B50();
  *(float *)&double v1 = v1;
  dword_26A8E1D98 = LODWORD(v1);
  sub_260C14B60();
  dword_26A8E1D9C = v2;
  uint64_t v3 = (void *)sub_260C14B80();
  if (!v3[1])
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = (_DWORD *)v3[2];
  if (!v4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v5 = (unsigned char *)v3[3];
  if (!v5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v6 = (long long *)v3[4];
  if (!v6)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v7 = (float32x4_t *)v3[5];
  if (!v7)
  {
LABEL_13:
    __break(1u);
    return;
  }
  long long v15 = *v6;
  float32x4_t v8 = vrsqrteq_f32((float32x4_t)xmmword_260C14FB0);
  float32x4_t v9 = vmulq_f32(v8, vrsqrtsq_f32((float32x4_t)xmmword_260C14FB0, vmulq_f32(v8, v8)));
  float32x4_t v14 = vmulq_f32(vmulq_f32(v9, vrsqrtsq_f32((float32x4_t)xmmword_260C14FB0, vmulq_f32(v9, v9))), (float32x4_t)xmmword_260C14FC0);
  float v10 = 1.5708;
  if (!*v5) {
    float v10 = 0.0;
  }
  __float2 v11 = __sincosf_stret(v10);
  float32x4_t v12 = vmulq_n_f32(v14, v11.__sinval);
  v12.i32[3] = LODWORD(v11.__cosval);
  LODWORD(v13) = v15;
  DWORD1(v13) = *v4;
  *uint64_t v7 = v12;
  *((void *)&v13 + 1) = __PAIR64__(1.0, DWORD2(v15));
  *uint64_t v6 = v13;
}

uint64_t sub_260C1218C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D70);
  sub_260C14BE0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_260C150A0;
  sub_260C14BB0();
  sub_260C14BB0();
  sub_260C14BB0();
  sub_260C14BB0();
  uint64_t result = sub_260C14BB0();
  off_26A8E1DA0 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_260C1234C(uint64_t a1)
{
  qword_26A8E1DA8 = a1;
  sub_260C14B50();
  *(float *)&double v1 = v1;
  dword_26A8E1DB0 = LODWORD(v1);
  uint64_t result = qword_26A8E1DA8;
  if (!qword_26A8E1DA8)
  {
    __break(1u);
    goto LABEL_8;
  }
  sub_260C14B60();
  dword_26A8E1DB4 = v3;
  uint64_t result = qword_26A8E1DA8;
  if (!qword_26A8E1DA8)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = sub_260C14B80();
  uint64_t v4 = *(_DWORD **)(result + 8);
  if (!v4)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v5 = *(_DWORD **)(result + 16);
  if (!v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (qword_26A8E1DA8)
  {
    *uint64_t v5 = *v4;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_260C123D8(uint64_t a1)
{
  qword_26A8E1DA8 = a1;
  sub_260C14B50();
  *(float *)&double v1 = v1;
  dword_26A8E1DB0 = LODWORD(v1);
  uint64_t result = qword_26A8E1DA8;
  if (!qword_26A8E1DA8)
  {
    __break(1u);
    goto LABEL_8;
  }
  sub_260C14B60();
  dword_26A8E1DB4 = v3;
  uint64_t result = qword_26A8E1DA8;
  if (!qword_26A8E1DA8)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = sub_260C14B80();
  uint64_t v4 = *(void **)(result + 8);
  if (!v4)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v5 = *(float **)(result + 16);
  if (!v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (qword_26A8E1DA8)
  {
    float v6 = COERCE_FLOAT(*v4) / 3.1416;
    float v7 = COERCE_FLOAT(HIDWORD(*v4)) / 3.1416;
    *uint64_t v5 = fminf(v6, v7);
    v5[1] = fmaxf(v6, v7);
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

void *sub_260C12484(uint64_t a1)
{
  qword_26A8E1DA8 = a1;
  sub_260C14B50();
  *(float *)&double v1 = v1;
  dword_26A8E1DB0 = LODWORD(v1);
  uint64_t result = (void *)qword_26A8E1DA8;
  if (!qword_26A8E1DA8)
  {
    __break(1u);
    goto LABEL_10;
  }
  sub_260C14B60();
  dword_26A8E1DB4 = v3;
  uint64_t result = (void *)qword_26A8E1DA8;
  if (!qword_26A8E1DA8)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = (void *)sub_260C14B80();
  uint64_t v4 = (_DWORD *)result[1];
  if (!v4)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v5 = (int *)result[2];
  if (!v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  float v6 = (_DWORD *)result[3];
  if (!v6)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  float v7 = (_DWORD *)result[4];
  if (!v7)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (qword_26A8E1DA8)
  {
    int v8 = *v5;
    *float v6 = *v4;
    *float v7 = v8;
    return result;
  }
LABEL_15:
  __break(1u);
  return result;
}

float sub_260C12530(uint64_t a1)
{
  qword_26A8E1DA8 = a1;
  sub_260C14B50();
  *(float *)&double v1 = v1;
  dword_26A8E1DB0 = LODWORD(v1);
  if (!qword_26A8E1DA8)
  {
    __break(1u);
    goto LABEL_8;
  }
  sub_260C14B60();
  dword_26A8E1DB4 = v2;
  if (!qword_26A8E1DA8)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
  }
  sub_260C14B70();
  if (!qword_26A8E1DA8) {
    goto LABEL_9;
  }
  if (!*(void *)(sub_260C14B80() + 8)) {
    goto LABEL_10;
  }
  return result;
}

void *sub_260C12648(uint64_t a1)
{
  qword_26A8E1DA8 = a1;
  sub_260C14B50();
  *(float *)&double v1 = v1;
  dword_26A8E1DB0 = LODWORD(v1);
  if (!qword_26A8E1DA8)
  {
    __break(1u);
    goto LABEL_15;
  }
  sub_260C14B60();
  dword_26A8E1DB4 = v2;
  if (!qword_26A8E1DA8)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_260C14B70();
  if (!qword_26A8E1DA8)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  float result = (void *)sub_260C14B80();
  if (!result[1])
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (!result[2])
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (!result[3])
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!result[4])
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (!result[5])
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (!result[6])
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (!result[7])
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (!result[8])
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
  if (!result[9]) {
    goto LABEL_25;
  }
  return result;
}

id sub_260C12894()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D80);
  MEMORY[0x270FA5388](v0 - 8);
  int v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260C129A4((uint64_t)v2);
  uint64_t v3 = sub_260C14B40();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
  {
    uint64_t v5 = (void *)sub_260C14B20();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  return v5;
}

uint64_t sub_260C129A4@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for comAppleSystemEnvironmentsRain();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_260C14C20();
  uint64_t v5 = (void *)sub_260C14C20();
  id v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_260C14B30();

    uint64_t v7 = sub_260C14B40();
    int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a1;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_260C14B40();
    int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a1;
    uint64_t v11 = 1;
  }
  return v8(v10, v11, 1, v9);
}

void *sub_260C12B04()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D80);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_260C14B40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - v9;
  sub_260C129A4((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_260C11FAC((uint64_t)v3);
    uint64_t v11 = (void *)sub_260C14B90();
    sub_260C1200C();
    swift_allocError();
    *uint64_t v12 = 0xD000000000000026;
    v12[1] = 0x8000000260C159B0;
    (*(void (**)(void *, void, void *))(*(v11 - 1) + 104))(v12, *MEMORY[0x263F845E8], v11);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    uint64_t v11 = objc_allocWithZone((Class)sub_260C14C00());
    uint64_t v13 = sub_260C14BA0();
    if (!v0) {
      uint64_t v11 = (void *)v13;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return v11;
}

id sub_260C12D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260C13000(a1, a2, a3, (uint64_t (*)(void))sub_260C12B04);
}

uint64_t sub_260C12D98()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D80);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_260C14B40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260C129A4((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_260C11FAC((uint64_t)v4);
    uint64_t v9 = sub_260C14B90();
    sub_260C1200C();
    swift_allocError();
    void *v10 = 0xD000000000000026;
    v10[1] = 0x8000000260C159B0;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v10, *MEMORY[0x263F845E8], v9);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    id v11 = objc_msgSend(objc_allocWithZone((Class)sub_260C14C00()), sel_init);
    uint64_t v12 = sub_260C14BF0();
    if (!v0) {
      uint64_t v1 = v12;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v1;
}

id sub_260C12FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260C13000(a1, a2, a3, sub_260C12D98);
}

id sub_260C13000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = (void *)a4();
  return v4;
}

id sub_260C13088()
{
  sub_260C11F70(0, &qword_26A8E1D78);
  uint64_t v0 = (void *)sub_260C14C40();
  return v0;
}

id sub_260C130D8()
{
  sub_260C13220();
  sub_260C11F70(0, &qword_26A8E1D68);
  uint64_t v0 = (void *)sub_260C14C10();
  swift_bridgeObjectRelease();
  return v0;
}

id sub_260C13150()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for comAppleSystemEnvironmentsRain();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for comAppleSystemEnvironmentsRain()
{
  uint64_t result = qword_26A8E1DB8;
  if (!qword_26A8E1DB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_260C131D8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_260C13218()
{
  return type metadata accessor for comAppleSystemEnvironmentsRain();
}

uint64_t sub_260C13220()
{
  uint64_t v0 = sub_260C14BE0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A8E1D48 != -1) {
LABEL_29:
  }
    swift_once();
  uint64_t v4 = (char *)off_26A8E1DA0;
  uint64_t v5 = *((void *)off_26A8E1DA0 + 2);
  if (v5)
  {
    uint64_t v6 = self;
    int v8 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
    uint64_t v7 = v1 + 16;
    float v40 = v8;
    id v41 = v6;
    uint64_t v9 = &v4[(*(unsigned __int8 *)(v7 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 64)];
    uint64_t v42 = v7;
    uint64_t v37 = *(void *)(v7 + 56);
    float32x4_t v38 = (void (**)(char *, uint64_t))(v7 - 8);
    v35[1] = v4;
    swift_bridgeObjectRetain();
    uint64_t v1 = MEMORY[0x263F8EE80];
    uint64_t v36 = v0;
    unsigned int v39 = v3;
    while (1)
    {
      uint64_t v12 = (char *)v1;
      v40(v3, v9, v0);
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_260C14BC0();
      uint64_t v15 = v14;
      id v16 = objc_msgSend(v41, sel_valueWithPointer_, sub_260C14BD0());
      if (!v16)
      {
        swift_bridgeObjectRetain();
        unint64_t v25 = sub_260C13F88(v13, v15);
        char v27 = v26;
        swift_bridgeObjectRelease();
        if (v27)
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          float32x4_t v43 = v12;
          uint64_t v1 = (uint64_t)v12;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_260C145AC();
            uint64_t v1 = (uint64_t)v43;
          }
          swift_bridgeObjectRelease();
          float32x4_t v29 = *(void **)(*(void *)(v1 + 56) + 8 * v25);
          sub_260C142F0(v25, v1);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v1 = (uint64_t)v12;
        }
        goto LABEL_6;
      }
      id v17 = v16;
      uint64_t v1 = swift_isUniquelyReferenced_nonNull_native();
      float32x4_t v43 = v12;
      uint64_t v3 = v12;
      unint64_t v19 = sub_260C13F88(v13, v15);
      uint64_t v20 = *((void *)v12 + 2);
      BOOL v21 = (v18 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v0 = v18;
      if (*((void *)v12 + 3) >= v22)
      {
        if (v1)
        {
          uint64_t v1 = (uint64_t)v43;
          if ((v18 & 1) == 0) {
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t v3 = (char *)&v43;
          sub_260C145AC();
          uint64_t v1 = (uint64_t)v43;
          if ((v0 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
      else
      {
        sub_260C14000(v22, v1);
        uint64_t v3 = v43;
        unint64_t v23 = sub_260C13F88(v13, v15);
        if ((v0 & 1) != (v24 & 1))
        {
          uint64_t result = sub_260C14C90();
          __break(1u);
          return result;
        }
        unint64_t v19 = v23;
        uint64_t v1 = (uint64_t)v43;
        if ((v0 & 1) == 0)
        {
LABEL_19:
          *(void *)(v1 + 8 * (v19 >> 6) + 64) |= 1 << v19;
          float32x4_t v30 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
          *float32x4_t v30 = v13;
          v30[1] = v15;
          *(void *)(*(void *)(v1 + 56) + 8 * v19) = v17;
          uint64_t v31 = *(void *)(v1 + 16);
          BOOL v32 = __OFADD__(v31, 1);
          uint64_t v33 = v31 + 1;
          if (v32) {
            goto LABEL_28;
          }
          *(void *)(v1 + 16) = v33;
          swift_bridgeObjectRetain();
          goto LABEL_5;
        }
      }
      uint64_t v10 = *(void *)(v1 + 56);
      id v11 = *(void **)(v10 + 8 * v19);
      *(void *)(v10 + 8 * v19) = v17;

LABEL_5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v0 = v36;
LABEL_6:
      uint64_t v3 = v39;
      (*v38)(v39, v0);
      swift_bridgeObjectRelease();
      v9 += v37;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        return v1;
      }
    }
  }
  return MEMORY[0x263F8EE80];
}

uint64_t type metadata accessor for comAppleVfxPrivateRemoteEdition()
{
  uint64_t result = qword_26A8E1DD0;
  if (!qword_26A8E1DD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_260C13634()
{
  return swift_initClassMetadata2();
}

void sub_260C13674()
{
  off_26A8E1DC8 = (_UNKNOWN *)MEMORY[0x263F8EE78];
}

id sub_260C13688()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D80);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260C13798((uint64_t)v2);
  uint64_t v3 = sub_260C14B40();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
  {
    uint64_t v5 = (void *)sub_260C14B20();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  return v5;
}

uint64_t sub_260C13798@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for comAppleVfxPrivateRemoteEdition();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_260C14C20();
  uint64_t v5 = (void *)sub_260C14C20();
  id v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_260C14B30();

    uint64_t v7 = sub_260C14B40();
    int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a1;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_260C14B40();
    int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a1;
    uint64_t v11 = 1;
  }
  return v8(v10, v11, 1, v9);
}

void *sub_260C138F8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D80);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_260C14B40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - v9;
  sub_260C13798((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_260C11FAC((uint64_t)v3);
    uint64_t v11 = (void *)sub_260C14B90();
    sub_260C1200C();
    swift_allocError();
    *uint64_t v12 = 0xD000000000000027;
    v12[1] = 0x8000000260C15A10;
    (*(void (**)(void *, void, void *))(*(v11 - 1) + 104))(v12, *MEMORY[0x263F845E8], v11);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    uint64_t v11 = objc_allocWithZone((Class)sub_260C14C00());
    uint64_t v13 = sub_260C14BA0();
    if (!v0) {
      uint64_t v11 = (void *)v13;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return v11;
}

id sub_260C13B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260C13DF4(a1, a2, a3, (uint64_t (*)(void))sub_260C138F8);
}

uint64_t sub_260C13B8C()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1D80);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_260C14B40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260C13798((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_260C11FAC((uint64_t)v4);
    uint64_t v9 = sub_260C14B90();
    sub_260C1200C();
    swift_allocError();
    void *v10 = 0xD000000000000027;
    v10[1] = 0x8000000260C15A10;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v10, *MEMORY[0x263F845E8], v9);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    id v11 = objc_msgSend(objc_allocWithZone((Class)sub_260C14C00()), sel_init);
    uint64_t v12 = sub_260C14BF0();
    if (!v0) {
      uint64_t v1 = v12;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v1;
}

id sub_260C13DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260C13DF4(a1, a2, a3, sub_260C13B8C);
}

id sub_260C13DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = (void *)a4();
  return v4;
}

id sub_260C13E7C()
{
  sub_260C11F70(0, &qword_26A8E1D78);
  uint64_t v0 = (void *)sub_260C14C40();
  return v0;
}

id sub_260C13ECC()
{
  sub_260C14748();
  sub_260C11F70(0, &qword_26A8E1D68);
  uint64_t v0 = (void *)sub_260C14C10();
  swift_bridgeObjectRelease();
  return v0;
}

id sub_260C13F44()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for comAppleVfxPrivateRemoteEdition();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_260C13F80()
{
  return type metadata accessor for comAppleVfxPrivateRemoteEdition();
}

unint64_t sub_260C13F88(uint64_t a1, uint64_t a2)
{
  sub_260C14CA0();
  sub_260C14C30();
  uint64_t v4 = sub_260C14CB0();
  return sub_260C144C8(a1, a2, v4);
}

uint64_t sub_260C14000(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1DE0);
  char v38 = a2;
  uint64_t v6 = sub_260C14C70();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v36;
        if ((v38 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v37 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    char v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    float32x4_t v29 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v30 = v29;
    }
    sub_260C14CA0();
    sub_260C14C30();
    uint64_t result = sub_260C14CB0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v33 = v17 == v32;
        if (v17 == v32) {
          unint64_t v17 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v17);
      }
      while (v34 == -1);
      unint64_t v18 = __clz(__rbit64(~v34)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *unint64_t v19 = v28;
    v19[1] = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_260C142F0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_260C14C50();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_260C14CA0();
        swift_bridgeObjectRetain();
        sub_260C14C30();
        uint64_t v9 = sub_260C14CB0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_260C144C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_260C14C80() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_260C14C80() & 1) == 0);
    }
  }
  return v6;
}

id sub_260C145AC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8E1DE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_260C14C60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    BOOL v21 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_260C14748()
{
  uint64_t v0 = sub_260C14BE0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A8E1D50 != -1) {
LABEL_29:
  }
    swift_once();
  uint64_t v4 = (char *)off_26A8E1DC8;
  uint64_t v5 = *((void *)off_26A8E1DC8 + 2);
  if (v5)
  {
    uint64_t v6 = self;
    unint64_t v8 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
    uint64_t v7 = v1 + 16;
    float v40 = v8;
    id v41 = v6;
    int64_t v9 = &v4[(*(unsigned __int8 *)(v7 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 64)];
    uint64_t v42 = v7;
    uint64_t v37 = *(void *)(v7 + 56);
    char v38 = (void (**)(char *, uint64_t))(v7 - 8);
    v35[1] = v4;
    swift_bridgeObjectRetain();
    uint64_t v1 = MEMORY[0x263F8EE80];
    uint64_t v36 = v0;
    unsigned int v39 = v3;
    while (1)
    {
      unint64_t v12 = (char *)v1;
      v40(v3, v9, v0);
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_260C14BC0();
      uint64_t v15 = v14;
      id v16 = objc_msgSend(v41, sel_valueWithPointer_, sub_260C14BD0());
      if (!v16)
      {
        swift_bridgeObjectRetain();
        unint64_t v25 = sub_260C13F88(v13, v15);
        char v27 = v26;
        swift_bridgeObjectRelease();
        if (v27)
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          float32x4_t v43 = v12;
          uint64_t v1 = (uint64_t)v12;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_260C145AC();
            uint64_t v1 = (uint64_t)v43;
          }
          swift_bridgeObjectRelease();
          float32x4_t v29 = *(void **)(*(void *)(v1 + 56) + 8 * v25);
          sub_260C142F0(v25, v1);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v1 = (uint64_t)v12;
        }
        goto LABEL_6;
      }
      id v17 = v16;
      uint64_t v1 = swift_isUniquelyReferenced_nonNull_native();
      float32x4_t v43 = v12;
      uint64_t v3 = v12;
      unint64_t v19 = sub_260C13F88(v13, v15);
      uint64_t v20 = *((void *)v12 + 2);
      BOOL v21 = (v18 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v0 = v18;
      if (*((void *)v12 + 3) >= v22)
      {
        if (v1)
        {
          uint64_t v1 = (uint64_t)v43;
          if ((v18 & 1) == 0) {
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t v3 = (char *)&v43;
          sub_260C145AC();
          uint64_t v1 = (uint64_t)v43;
          if ((v0 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
      else
      {
        sub_260C14000(v22, v1);
        uint64_t v3 = v43;
        unint64_t v23 = sub_260C13F88(v13, v15);
        if ((v0 & 1) != (v24 & 1))
        {
          sub_260C14C90();
          __break(1u);
          return sub_260C14B10();
        }
        unint64_t v19 = v23;
        uint64_t v1 = (uint64_t)v43;
        if ((v0 & 1) == 0)
        {
LABEL_19:
          *(void *)(v1 + 8 * (v19 >> 6) + 64) |= 1 << v19;
          id v30 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
          *id v30 = v13;
          v30[1] = v15;
          *(void *)(*(void *)(v1 + 56) + 8 * v19) = v17;
          uint64_t v31 = *(void *)(v1 + 16);
          BOOL v32 = __OFADD__(v31, 1);
          uint64_t v33 = v31 + 1;
          if (v32) {
            goto LABEL_28;
          }
          *(void *)(v1 + 16) = v33;
          swift_bridgeObjectRetain();
          goto LABEL_5;
        }
      }
      uint64_t v10 = *(void *)(v1 + 56);
      uint64_t v11 = *(void **)(v10 + 8 * v19);
      *(void *)(v10 + 8 * v19) = v17;

LABEL_5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v0 = v36;
LABEL_6:
      uint64_t v3 = v39;
      (*v38)(v39, v0);
      swift_bridgeObjectRelease();
      v9 += v37;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        return v1;
      }
    }
  }
  return MEMORY[0x263F8EE80];
}

uint64_t sub_260C14B10()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_260C14B20()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_260C14B30()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_260C14B40()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_260C14B50()
{
  return MEMORY[0x270F83890]();
}

uint64_t sub_260C14B60()
{
  return MEMORY[0x270F838B8]();
}

uint64_t sub_260C14B70()
{
  return MEMORY[0x270F838D0]();
}

uint64_t sub_260C14B80()
{
  return MEMORY[0x270F838D8]();
}

uint64_t sub_260C14B90()
{
  return MEMORY[0x270F838E0]();
}

uint64_t sub_260C14BA0()
{
  return MEMORY[0x270F838E8]();
}

uint64_t sub_260C14BB0()
{
  return MEMORY[0x270F838F8]();
}

uint64_t sub_260C14BC0()
{
  return MEMORY[0x270F83900]();
}

uint64_t sub_260C14BD0()
{
  return MEMORY[0x270F83908]();
}

uint64_t sub_260C14BE0()
{
  return MEMORY[0x270F83910]();
}

uint64_t sub_260C14BF0()
{
  return MEMORY[0x270F83940]();
}

uint64_t sub_260C14C00()
{
  return MEMORY[0x270F83950]();
}

uint64_t sub_260C14C10()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_260C14C20()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_260C14C30()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_260C14C40()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_260C14C50()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_260C14C60()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_260C14C70()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_260C14C80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_260C14C90()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_260C14CA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_260C14CB0()
{
  return MEMORY[0x270F9FC90]();
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

double drand48(void)
{
  MEMORY[0x270ED9670]();
  return result;
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t vfx_script_clock_delta_time()
{
  return MEMORY[0x270F83970]();
}

uint64_t vfx_script_clock_simulation_index()
{
  return MEMORY[0x270F83978]();
}

uint64_t vfx_script_clock_time()
{
  return MEMORY[0x270F83980]();
}

uint64_t vfx_script_get_arguments_buffer()
{
  return MEMORY[0x270F839B8]();
}