void sub_21DB26A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DB29518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DB29958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DB2BBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21DB2BC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

float32x4_t *CMOQuaternion::operator*@<X0>(uint64_t a1@<X0>, float *a2@<X1>, float32x4_t *a3@<X8>, double a4@<D0>)
{
  float v4 = *(float *)(a1 + 8);
  LODWORD(a4) = *(_DWORD *)(a1 + 12);
  float v5 = a2[1];
  float v6 = *(float *)(a1 + 4);
  float v7 = a2[2];
  float v8 = a2[3];
  float32_t v9 = (float)((float)((float)(v4 * v5) + (float)(*(float *)&a4 * *a2)) - (float)(v6 * v7)) + (float)(*(float *)a1 * v8);
  float32_t v10 = (float)((float)((float)(*(float *)&a4 * v5) - (float)(v4 * *a2)) + (float)(*(float *)a1 * v7))
      + (float)(v6 * v8);
  float32_t v11 = (float)((float)((float)(v6 * *a2) - (float)(*(float *)a1 * v5)) + (float)(*(float *)&a4 * v7))
      + (float)(v4 * v8);
  float v12 = (float)((float)-(float)(v6 * v5) - (float)(*(float *)a1 * *a2)) - (float)(v4 * v7);
  a3->f32[0] = v9;
  a3->f32[1] = v10;
  *(float *)&a4 = v12 + (float)(*(float *)&a4 * v8);
  a3->f32[2] = v11;
  a3->i32[3] = LODWORD(a4);
  return CMOQuaternion::normalize(a3, a4);
}

float32x4_t *CMOQuaternion::conj@<X0>(float32x2_t *this@<X0>, float32x4_t *a2@<X8>, double a3@<D0>)
{
  __int32 v3 = this[1].i32[1];
  *(float *)&a3 = -this[1].f32[0];
  *(float32x2_t *)a2->f32 = vneg_f32(*this);
  a2->i32[2] = LODWORD(a3);
  a2->i32[3] = v3;
  return CMOQuaternion::normalize(a2, a3);
}

float CMOQuaternion::roll(CMOQuaternion *this)
{
  float v1 = *((float *)this + 1);
  float v2 = (float)(*(float *)this * *((float *)this + 2)) - (float)(*((float *)this + 3) * v1);
  return -atan2f(v2 + v2, (float)((float)((float)(v1 * v1) + (float)(*(float *)this * *(float *)this)) * -2.0) + 1.0);
}

float CMOQuaternion::pitch(CMOQuaternion *this)
{
  return asinf((float)((float)(*(float *)this * *((float *)this + 3)) + (float)(*((float *)this + 1) * *((float *)this + 2)))+ (float)((float)(*(float *)this * *((float *)this + 3)) + (float)(*((float *)this + 1) * *((float *)this + 2))));
}

float CMOQuaternion::yaw(CMOQuaternion *this)
{
  float v1 = *((float *)this + 2);
  float v2 = (float)(*(float *)this * *((float *)this + 1)) - (float)(*((float *)this + 3) * v1);
  return -atan2f(v2 + v2, (float)((float)((float)(v1 * v1) + (float)(*(float *)this * *(float *)this)) * -2.0) + 1.0);
}

float CMOQuaternion::gravity(CMOQuaternion *this)
{
  return (float)((float)(*((float *)this + 3) * *((float *)this + 1)) - (float)(*(float *)this * *((float *)this + 2)))
       + (float)((float)(*((float *)this + 3) * *((float *)this + 1)) - (float)(*(float *)this * *((float *)this + 2)));
}

float CMOQuaternion::north(CMOQuaternion *this)
{
  return (float)((float)((float)(*(float *)this * *(float *)this) + (float)(*((float *)this + 3) * *((float *)this + 3)))
               * 2.0)
       + -1.0;
}

float CMOQuaternion::rotateVectorInPlace(float *a1, float *a2)
{
  float v3 = a1[2];
  float v2 = a1[3];
  float v4 = v2 + v2;
  float v5 = *a1;
  float v6 = a1[1];
  float v7 = v6 + v6;
  float v8 = v2 * (float)(v2 + v2);
  float v9 = (float)((float)(v6 + v6) * v6) + -1.0;
  float v10 = (float)((float)(v3 + v3) * v3) + -1.0;
  float v11 = (float)(v5 + v5) * v6;
  float v12 = (float)(v5 + v5) * v3;
  float v13 = v2 * (float)(v5 + v5);
  float v14 = v7 * v3;
  float v15 = v2 * v7;
  float v16 = v4 * v3;
  float v17 = a2[1];
  float v18 = a2[2];
  float v19 = (float)((float)((float)(v11 + v16) * v17)
              + (float)((float)(v8 + (float)((float)((float)(v5 + v5) * v5) + -1.0)) * *a2))
      + (float)((float)(v12 - v15) * v18);
  float v20 = (float)((float)((float)(v8 + v9) * v17) + (float)((float)(v11 - v16) * *a2)) + (float)((float)(v13 + v14) * v18);
  float result = (float)((float)((float)(v14 - v13) * v17) + (float)((float)(v12 + v15) * *a2))
         + (float)((float)(v8 + v10) * v18);
  *a2 = v19;
  a2[1] = v20;
  a2[2] = result;
  return result;
}

float CMOQuaternion::rotateVector(float *a1, float a2, float a3, float a4)
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  CMOQuaternion::rotateVectorInPlace(a1, v5);
  return v5[0];
}

float CMOQuaternion::rotateFrameInPlace(float *a1, float *a2)
{
  float v3 = a1[2];
  float v2 = a1[3];
  float v4 = v2 + v2;
  float v5 = *a1;
  float v6 = a1[1];
  float v7 = v6 + v6;
  float v8 = v2 * (float)(v2 + v2);
  float v9 = (float)((float)(v6 + v6) * v6) + -1.0;
  float v10 = (float)((float)(v3 + v3) * v3) + -1.0;
  float v11 = (float)(v5 + v5) * v6;
  float v12 = (float)(v5 + v5) * v3;
  float v13 = v2 * (float)(v5 + v5);
  float v14 = v7 * v3;
  float v15 = v2 * v7;
  float v16 = v4 * v3;
  float v17 = a2[1];
  float v18 = a2[2];
  float v19 = (float)((float)((float)(v11 - v16) * v17)
              + (float)((float)(v8 + (float)((float)((float)(v5 + v5) * v5) + -1.0)) * *a2))
      + (float)((float)(v12 + v15) * v18);
  float v20 = (float)((float)((float)(v8 + v9) * v17) + (float)((float)(v11 + v16) * *a2)) + (float)((float)(v14 - v13) * v18);
  float result = (float)((float)((float)(v13 + v14) * v17) + (float)((float)(v12 - v15) * *a2))
         + (float)((float)(v8 + v10) * v18);
  *a2 = v19;
  a2[1] = v20;
  a2[2] = result;
  return result;
}

float CMOQuaternion::rotateFrame(float *a1, float a2, float a3, float a4)
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  CMOQuaternion::rotateFrameInPlace(a1, v5);
  return v5[0];
}

void CMOQuaternion::angleAxis(float *a1, float *a2)
{
  uint64_t v4 = 0;
  float v5 = 0.0;
  do
  {
    float v5 = v5 + (float)(a2[v4] * a2[v4]);
    ++v4;
  }
  while (v4 != 3);
  float v6 = sqrtf(v5);
  float v7 = 0.5;
  float v8 = v6 * 0.5;
  if ((float)(v6 * 0.5) > 0.0) {
    float v7 = (float)(sinf(v6 * 0.5) / v8) * 0.5;
  }
  *a1 = v7 * *a2;
  a1[1] = v7 * a2[1];
  a1[2] = v7 * a2[2];
  a1[3] = cosf(v8);
}

float CMOQuaternion::angleAxis(CMOQuaternion *this)
{
  uint64_t v1 = 0;
  float v2 = *(float *)this;
  int v3 = *((_DWORD *)this + 1);
  int v4 = *((_DWORD *)this + 2);
  v9[0] = *(_DWORD *)this;
  v9[1] = v3;
  v9[2] = v4;
  float v5 = 0.0;
  do
  {
    float v5 = v5 + (float)(*(float *)&v9[v1] * *(float *)&v9[v1]);
    ++v1;
  }
  while (v1 != 3);
  float v6 = sqrtf(v5);
  if (v6 >= 0.00000011921)
  {
    float v7 = atan2f(v6, *((float *)this + 3));
    return v2 * (float)((float)(v7 + v7) / v6);
  }
  return v2;
}

BOOL CMOQuaternion::northAndGravity(float *a1, float *a2, uint64_t a3, float a4, float a5, float a6, float a7, float a8, float a9, double a10, double a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, float a18)
{
  unint64_t v174 = __PAIR64__(LODWORD(a5), LODWORD(a4));
  float v175 = a6;
  unint64_t v172 = __PAIR64__(LODWORD(a8), LODWORD(a7));
  float v173 = a9;
  uint64_t v170 = a17;
  float v171 = a18;
  {
    CMOQuaternion::northAndGravity(CMVector<float,3ul>,CMVector<float,3ul>,CMVector<float,3ul>,float const*,CMOQuaternion&,CMMatrix<float,3ul,3ul> &)::kMinSineAngle = 1043452116;
  }
  uint64_t v19 = 0;
  float v20 = 0.0;
  do
  {
    float v20 = v20 + (float)(*(float *)((char *)&v174 + v19) * *(float *)((char *)&v174 + v19));
    v19 += 4;
  }
  while (v19 != 12);
  if (sqrtf(v20) == 0.0) {
    return 0;
  }
  uint64_t v21 = 0;
  float v22 = 0.0;
  do
  {
    float v22 = v22 + (float)(*(float *)((char *)&v172 + v21) * *(float *)((char *)&v172 + v21));
    v21 += 4;
  }
  while (v21 != 12);
  if (sqrtf(v22) == 0.0) {
    return 0;
  }
  uint64_t v23 = 0;
  *(void *)&long long v161 = v174;
  *((float *)&v161 + 2) = v175;
  float v24 = 0.0;
  do
  {
    float v24 = v24 + (float)(*(float *)((char *)&v161 + v23) * *(float *)((char *)&v161 + v23));
    v23 += 4;
  }
  while (v23 != 12);
  uint64_t v25 = 0;
  float v26 = sqrtf(v24);
  float v27 = *(float *)&v174 / v26;
  float v28 = *((float *)&v174 + 1) / v26;
  float v29 = v175 / v26;
  *(float *)&unint64_t v174 = *(float *)&v174 / v26;
  *((float *)&v174 + 1) = *((float *)&v174 + 1) / v26;
  float v175 = v175 / v26;
  float v30 = *((float *)&v172 + 1);
  float v31 = v173;
  *(void *)&long long v161 = v172;
  *((float *)&v161 + 2) = v173;
  float v32 = 0.0;
  do
  {
    float v32 = v32 + (float)(*(float *)((char *)&v161 + v25) * *(float *)((char *)&v161 + v25));
    v25 += 4;
  }
  while (v25 != 12);
  uint64_t v33 = 0;
  float v34 = sqrtf(v32);
  float v36 = *((float *)&v172 + 1) / v34;
  float v37 = v173 / v34;
  *(float *)&unint64_t v172 = *(float *)&v172 / v34;
  float v35 = *(float *)&v172;
  *((float *)&v172 + 1) = *((float *)&v172 + 1) / v34;
  float v173 = v173 / v34;
  float v38 = (float)(v28 * (float)(v31 / v34)) - (float)(v29 * (float)(v30 / v34));
  float v39 = (float)(v29 * *(float *)&v172) - (float)(v27 * (float)(v31 / v34));
  float v40 = (float)(v27 * (float)(v30 / v34)) - (float)(v28 * *(float *)&v172);
  float v167 = v38;
  float v168 = v39;
  float v169 = v40;
  float v41 = 0.0;
  do
  {
    float v41 = v41 + (float)(*(float *)((char *)&v167 + v33) * *(float *)((char *)&v167 + v33));
    v33 += 4;
  }
  while (v33 != 12);
  float v42 = sqrtf(v41);
  if (v42 < *(float *)&CMOQuaternion::northAndGravity(CMVector<float,3ul>,CMVector<float,3ul>,CMVector<float,3ul>,float const*,CMOQuaternion&,CMMatrix<float,3ul,3ul> &)::kMinSineAngle) {
    return 0;
  }
  uint64_t v44 = 0;
  float v45 = v38 / v42;
  float v46 = v39 / v42;
  float v167 = v38 / v42;
  float v168 = v39 / v42;
  float v47 = v40 / v42;
  float v169 = v40 / v42;
  float v48 = *((float *)&v170 + 1);
  float v49 = v171;
  *(void *)&long long v161 = v170;
  *((float *)&v161 + 2) = v171;
  float v50 = 0.0;
  do
  {
    float v50 = v50 + (float)(*(float *)((char *)&v161 + v44) * *(float *)((char *)&v161 + v44));
    v44 += 4;
  }
  while (v44 != 12);
  uint64_t v51 = 0;
  float v52 = sqrtf(v50);
  *(float *)&uint64_t v170 = *(float *)&v170 / v52;
  *((float *)&v170 + 1) = *((float *)&v170 + 1) / v52;
  float v53 = *((float *)&v170 + 1);
  float v171 = v171 / v52;
  float v54 = v171;
  uint64_t v165 = 0;
  int v166 = -1082130432;
  float v55 = (float)((float)(v49 / v52) * -0.0) - (float)(v48 / v52);
  float v109 = -*(float *)&v170;
  float v110 = -(float)(v49 / v52);
  float v56 = 0.0;
  unsigned int v111 = v170;
  *(float *)&long long v161 = v55;
  *((float *)&v161 + 1) = *(float *)&v170 + (float)(v171 * 0.0);
  *((float *)&v161 + 2) = (float)(*((float *)&v170 + 1) * -0.0) + (float)(*(float *)&v170 * 0.0);
  do
  {
    float v56 = v56 + (float)(*(float *)((char *)&v161 + v51) * *(float *)((char *)&v161 + v51));
    v51 += 4;
  }
  while (v51 != 12);
  uint64_t v57 = 0;
  float v58 = sqrtf(v56);
  v164[0] = v55 / v58;
  v164[1] = (float)(*(float *)&v170 + (float)(v171 * 0.0)) / v58;
  v164[2] = (float)((float)(*((float *)&v170 + 1) * -0.0) + (float)(*(float *)&v170 * 0.0)) / v58;
  float v59 = (float)(v36 * v47) - (float)(v37 * v46);
  float v112 = -*(float *)&v172;
  float v60 = (float)(v37 * v45) - (float)(*(float *)&v172 * v47);
  float v61 = (float)(*(float *)&v172 * v46) - (float)(v36 * v45);
  *(void *)&long long v161 = __PAIR64__(LODWORD(v60), LODWORD(v59));
  *((float *)&v161 + 2) = v61;
  float v62 = 0.0;
  do
  {
    float v62 = v62 + (float)(*(float *)((char *)&v161 + v57) * *(float *)((char *)&v161 + v57));
    v57 += 4;
  }
  while (v57 != 12);
  uint64_t v63 = 0;
  float v64 = sqrtf(v62);
  float v65 = v59 / v64;
  float v66 = v60 / v64;
  float v67 = v61 / v64;
  *(float *)&unint64_t v174 = v59 / v64;
  *((float *)&v174 + 1) = v66;
  float v175 = v61 / v64;
  int v163 = 0;
  long long v161 = 0u;
  long long v162 = 0u;
  v68 = &v161;
  do
  {
    uint64_t v69 = 0;
    float v70 = *((float *)&v174 + v63);
    v71 = (float *)v68;
    do
    {
      float *v71 = v70 * *(float *)((char *)&v170 + v69);
      v71 += 3;
      v69 += 4;
    }
    while (v69 != 12);
    ++v63;
    v68 = (long long *)((char *)v68 + 4);
  }
  while (v63 != 3);
  uint64_t v72 = 0;
  int v160 = 0;
  long long v158 = 0u;
  long long v159 = 0u;
  v73 = &v158;
  do
  {
    uint64_t v74 = 0;
    float v75 = *((float *)&v172 + v72);
    v76 = (float *)v73;
    do
    {
      float *v76 = v75 * *(float *)((char *)&v165 + v74);
      v76 += 3;
      v74 += 4;
    }
    while (v74 != 12);
    ++v72;
    v73 = (long long *)((char *)v73 + 4);
  }
  while (v72 != 3);
  uint64_t v77 = 0;
  int v157 = 0;
  long long v155 = 0u;
  long long v156 = 0u;
  v78 = &v155;
  do
  {
    uint64_t v79 = 0;
    float v80 = *(&v167 + v77);
    v81 = (float *)v78;
    do
    {
      float *v81 = v80 * v164[v79];
      v81 += 3;
      ++v79;
    }
    while (v79 != 3);
    ++v77;
    v78 = (long long *)((char *)v78 + 4);
  }
  while (v77 != 3);
  float v82 = *a1;
  float v83 = (float)((float)(a1[1] * a1[1]) + (float)(v82 * v82)) + (float)((float)(v82 + v82) * a1[1]);
  v153[0] = v155;
  v153[1] = v156;
  int v154 = v157;
  long long v144 = v161;
  long long v145 = v162;
  int v146 = v163;
  int v132 = 0;
  float v133 = v67;
  float v134 = -v66;
  float v113 = v83;
  float v84 = sqrtf(v83);
  float v135 = -v67;
  int v136 = 0;
  float v137 = v65;
  float v138 = v66;
  float v139 = -v65;
  int v140 = 0;
  operator*<float,3ul,3ul,3ul>((uint64_t)&v132, (uint64_t)&v155, (uint64_t)v141);
  LODWORD(v129) = 0;
  *((float *)&v129 + 1) = v54;
  *((float *)&v129 + 2) = -v53;
  *((float *)&v129 + 3) = v110;
  LODWORD(v130) = 0;
  *(void *)((char *)&v130 + 4) = __PAIR64__(LODWORD(v53), v111);
  *((float *)&v130 + 3) = v109;
  int v131 = 0;
  operator*<float,3ul,3ul,3ul>((uint64_t)v141, (uint64_t)&v129, (uint64_t)v142);
  for (uint64_t i = 0; i != 36; i += 4)
    *(float *)((char *)&v144 + i) = *(float *)((char *)&v144 + i) - *(float *)((char *)v142 + i);
  uint64_t v86 = 0;
  float v87 = 1.0 / v84;
  long long v147 = v144;
  long long v148 = v145;
  int v149 = v146;
  do
  {
    *(float *)((char *)&v147 + v86) = (float)(v82 * (float)(1.0 / v84)) * *(float *)((char *)&v147 + v86);
    v86 += 4;
  }
  while (v86 != 36);
  uint64_t v88 = 0;
  long long v150 = v147;
  long long v151 = v148;
  int v152 = v149;
  do
  {
    *(float *)((char *)v153 + v88) = *(float *)((char *)&v150 + v88) + *(float *)((char *)v153 + v88);
    v88 += 4;
  }
  while (v88 != 36);
  float v89 = a1[1];
  long long v123 = v158;
  long long v124 = v159;
  int v125 = v160;
  int v132 = 0;
  float v133 = v37;
  float v134 = -v36;
  float v135 = -v37;
  int v136 = 0;
  float v137 = v35;
  float v138 = v36;
  float v139 = v112;
  int v140 = 0;
  operator*<float,3ul,3ul,3ul>((uint64_t)&v132, (uint64_t)&v155, (uint64_t)v141);
  long long v129 = xmmword_21DBB2090;
  long long v130 = xmmword_21DBB20A0;
  int v131 = 0;
  operator*<float,3ul,3ul,3ul>((uint64_t)v141, (uint64_t)&v129, (uint64_t)v142);
  for (uint64_t j = 0; j != 36; j += 4)
    *(float *)((char *)&v123 + j) = *(float *)((char *)&v123 + j) - *(float *)((char *)v142 + j);
  uint64_t v91 = 0;
  long long v126 = v123;
  long long v127 = v124;
  int v128 = v125;
  do
  {
    *(float *)((char *)&v126 + v91) = (float)(v87 * v89) * *(float *)((char *)&v126 + v91);
    v91 += 4;
  }
  while (v91 != 36);
  uint64_t v92 = 0;
  long long v150 = v126;
  long long v151 = v127;
  int v152 = v128;
  do
  {
    *(float *)((char *)v153 + v92) = *(float *)((char *)&v150 + v92) + *(float *)((char *)v153 + v92);
    v92 += 4;
  }
  while (v92 != 36);
  CMOQuaternion::rotationMatrix(a2, (float *)v153);
  uint64_t v93 = 0;
  float v94 = *a1;
  long long v117 = v161;
  long long v118 = v162;
  int v119 = v163;
  do
  {
    *(float *)((char *)&v117 + v93) = v94 * *(float *)((char *)&v117 + v93);
    v93 += 4;
  }
  while (v93 != 36);
  uint64_t v95 = 0;
  int v122 = v119;
  long long v120 = v117;
  long long v121 = v118;
  float v96 = a1[1];
  int v116 = v160;
  long long v114 = v158;
  long long v115 = v159;
  do
  {
    *(float *)((char *)&v114 + v95) = v96 * *(float *)((char *)&v114 + v95);
    v95 += 4;
  }
  while (v95 != 36);
  uint64_t v97 = 0;
  v142[0] = v114;
  v142[1] = v115;
  int v143 = v116;
  do
  {
    *(float *)((char *)&v120 + v97) = *(float *)((char *)v142 + v97) + *(float *)((char *)&v120 + v97);
    v97 += 4;
  }
  while (v97 != 36);
  uint64_t v98 = 0;
  long long v150 = v120;
  long long v151 = v121;
  int v152 = v122;
  float v99 = 0.0;
  do
  {
    float v99 = v99 + (float)(*(float *)((char *)&v150 + v98) * *(float *)((char *)&v150 + v98));
    v98 += 4;
  }
  while (v98 != 36);
  float v100 = sqrtf(v99);
  float v101 = (float)(v113 - (float)(v100 * v100)) * 0.5;
  BOOL result = v101 != 0.0;
  if (v101 != 0.0)
  {
    uint64_t v102 = 0;
    float v103 = v87 * (float)(1.0 / v101);
    v104 = &v150;
    do
    {
      uint64_t v105 = 0;
      v106 = &v150;
      do
      {
        uint64_t v107 = 0;
        float v108 = 0.0;
        do
        {
          float v108 = v108 + (float)(*(float *)((char *)v104 + v107) * *(float *)((char *)v106 + v107));
          v107 += 12;
        }
        while (v107 != 36);
        *(float *)(a3 + 4 * (3 * v105++ + v102)) = v103 * v108;
        v106 = (long long *)((char *)v106 + 4);
      }
      while (v105 != 3);
      *(float *)(a3 + 16 * v102) = v87 + *(float *)(a3 + 16 * v102);
      ++v102;
      v104 = (long long *)((char *)v104 + 4);
    }
    while (v102 != 3);
  }
  return result;
}

uint64_t operator*<float,3ul,3ul,3ul>@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = 0;
  *(_DWORD *)(a3 + 32) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  int v4 = (float *)(result + 12);
  do
  {
    uint64_t v5 = 0;
    float v6 = *(float *)(result + 4 * v3);
    uint64_t v7 = a2 + 4;
    do
    {
      uint64_t v8 = 0;
      float v9 = v6 * *(float *)(a2 + 12 * v5);
      float v10 = v4;
      do
      {
        float v11 = *v10;
        v10 += 3;
        float v9 = v9 + (float)(v11 * *(float *)(v7 + v8));
        v8 += 4;
      }
      while (v8 != 8);
      *(float *)(a3 + 4 * (3 * v5++ + v3)) = v9;
      v7 += 12;
    }
    while (v5 != 3);
    ++v3;
    ++v4;
  }
  while (v3 != 3);
  return result;
}

float CMOQuaternion::rotationMatrix(float *a1, float *a2)
{
  float v2 = *a2;
  float v3 = a2[4];
  float v4 = a2[8];
  float v5 = (float)(*a2 + v3) + v4;
  if (v5 <= 0.0)
  {
    if (v2 > v3)
    {
      BOOL v8 = v2 == v4;
      BOOL v9 = v2 < v4;
    }
    else
    {
      BOOL v8 = 1;
      BOOL v9 = 0;
    }
    if (v9 || v8)
    {
      if (v3 <= v4)
      {
        float v14 = (float)((float)((float)-v2 - v3) + v4) + 1.0;
        float v15 = 0.5 / sqrtf(v14);
        a1[2] = v14 * v15;
        a1[3] = v15 * (float)(a2[3] - a2[1]);
        *a1 = v15 * (float)(a2[2] + a2[6]);
        float result = v15 * (float)(a2[7] + a2[5]);
        a1[1] = result;
      }
      else
      {
        float v10 = (float)((float)(v3 - v2) - v4) + 1.0;
        float v11 = 0.5 / sqrtf(v10);
        a1[1] = v10 * v11;
        *a1 = v11 * (float)(a2[3] + a2[1]);
        a1[3] = v11 * (float)(a2[2] - a2[6]);
        float result = v11 * (float)(a2[7] + a2[5]);
        a1[2] = result;
      }
    }
    else
    {
      float v12 = (float)((float)(v2 - v3) - v4) + 1.0;
      float v13 = 0.5 / sqrtf(v12);
      *a1 = v12 * v13;
      a1[1] = v13 * (float)(a2[3] + a2[1]);
      a1[2] = v13 * (float)(a2[2] + a2[6]);
      float result = v13 * (float)(a2[7] - a2[5]);
      a1[3] = result;
    }
  }
  else
  {
    float v6 = 0.5 / sqrtf(v5 + 1.0);
    a1[3] = (float)(v5 + 1.0) * v6;
    a1[2] = v6 * (float)(a2[3] - a2[1]);
    a1[1] = v6 * (float)(a2[2] - a2[6]);
    float result = v6 * (float)(a2[7] - a2[5]);
    *a1 = result;
  }
  return result;
}

float CMOQuaternion::rotationMatrix@<S0>(CMOQuaternion *this@<X0>, float *a2@<X8>)
{
  float v3 = *((float *)this + 2);
  float v2 = *((float *)this + 3);
  float v4 = v2 + v2;
  float v5 = *(float *)this;
  float v6 = *((float *)this + 1);
  float v7 = v6 + v6;
  float v8 = v2 * (float)(v2 + v2);
  float v9 = (float)((float)(v6 + v6) * v6) + -1.0;
  float v10 = (float)((float)(v3 + v3) * v3) + -1.0;
  float v11 = (float)(v5 + v5) * v6;
  float v12 = (float)(v5 + v5) * v3;
  float v13 = v2 * (float)(v5 + v5);
  float v14 = v7 * v3;
  float v15 = v2 * v7;
  float v16 = v4 * v3;
  float v17 = v12 + v15;
  float result = v12 - v15;
  *a2 = v8 + (float)((float)((float)(*(float *)this + *(float *)this) * *(float *)this) + -1.0);
  a2[1] = v11 - v16;
  a2[2] = v17;
  a2[3] = v11 + v16;
  a2[4] = v8 + v9;
  a2[5] = v14 - v13;
  a2[6] = result;
  a2[7] = v13 + v14;
  a2[8] = v8 + v10;
  return result;
}

float CMOQuaternion::rotationMatrixTranspose@<S0>(CMOQuaternion *this@<X0>, float *a2@<X8>)
{
  float v3 = *((float *)this + 2);
  float v2 = *((float *)this + 3);
  float v4 = v2 + v2;
  float v5 = *(float *)this;
  float v6 = *((float *)this + 1);
  float v7 = v6 + v6;
  float v8 = v2 * (float)(v2 + v2);
  float v9 = (float)((float)(v6 + v6) * v6) + -1.0;
  float v10 = (float)((float)(v3 + v3) * v3) + -1.0;
  float v11 = (float)(v5 + v5) * v6;
  float v12 = (float)(v5 + v5) * v3;
  float v13 = v2 * (float)(v5 + v5);
  float v14 = v7 * v3;
  float v15 = v2 * v7;
  float v16 = v4 * v3;
  float v17 = v12 - v15;
  float result = v12 + v15;
  *a2 = v8 + (float)((float)((float)(*(float *)this + *(float *)this) * *(float *)this) + -1.0);
  a2[1] = v11 + v16;
  a2[2] = v17;
  a2[3] = v11 - v16;
  a2[4] = v8 + v9;
  a2[5] = v13 + v14;
  a2[6] = result;
  a2[7] = v14 - v13;
  a2[8] = v8 + v10;
  return result;
}

float32x4_t *CMOQuaternion::normalize(float32x4_t *this, double a2)
{
  *(float *)&a2 = sqrtf((float)((float)((float)(this->f32[1] * this->f32[1]) + (float)(this->f32[0] * this->f32[0]))+ (float)(this->f32[2] * this->f32[2]))+ (float)(this->f32[3] * this->f32[3]));
  if (fabsf(*(float *)&a2 + -1.0) >= 0.00000011921)
  {
    if (*(float *)&a2 == 0.0) {
      float32x4_t v2 = (float32x4_t)xmmword_21DBB20B0;
    }
    else {
      float32x4_t v2 = vdivq_f32(*this, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0));
    }
    *this = v2;
  }
  return this;
}

BOOL CMOQuaternion::inverted(CMOQuaternion *this)
{
  float v1 = *((float *)this + 2);
  float v2 = *((float *)this + 3);
  float v3 = *((float *)this + 1);
  float v4 = (float)((float)(v2 * v3) - (float)(*(float *)this * v1))
     + (float)((float)(v2 * v3) - (float)(*(float *)this * v1));
  float v5 = (float)-(float)(v2 * *(float *)this) - (float)(v3 * v1);
  return (float)((float)((float)((float)(v3 * v3) + (float)(*(float *)this * *(float *)this)) * 2.0) + -1.0) > sqrtf((float)((float)(v5 + v5) * (float)(v5 + v5)) + (float)(v4 * v4));
}

void CMOQuaternion::headingReference(CMOQuaternion *this)
{
  p_inst_props = &OBJC_PROTOCOL___SFAirDropActivityViewControllerDelegate.inst_props;
  {
    float v22 = this;
    p_inst_props = &OBJC_PROTOCOL___SFAirDropActivityViewControllerDelegate.inst_props;
    int v21 = v20;
    this = v22;
    if (v21)
    {
      CMOQuaternion::headingReference(void)const::kMinSineAngle = 1043452116;
      p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___SFAirDropActivityViewControllerDelegate + 56);
      this = v22;
    }
  }
  uint64_t v2 = 0;
  float v3 = *((float *)this + 2);
  float v4 = *((float *)this + 3);
  float v5 = *((float *)this + 1);
  float v6 = (float)((float)(v4 * v5) - (float)(*(float *)this * v3))
     + (float)((float)(v4 * v5) - (float)(*(float *)this * v3));
  float v7 = (float)-(float)(v4 * *(float *)this) - (float)(v5 * v3);
  float v8 = v7 + v7;
  float v9 = (float)((float)((float)(v5 * v5) + (float)(*(float *)this * *(float *)this)) * 2.0) + -1.0;
  float v10 = sqrtf((float)(v8 * v8) + (float)(v6 * v6));
  float v11 = 1.0;
  if (v9 <= v10) {
    float v11 = -1.0;
  }
  int v26 = 0;
  uint64_t v27 = 1065353216;
  float v12 = v9 * v11;
  float v13 = (float)(v9 * -0.0) + (float)(v8 * v11);
  float v14 = -(float)(v6 * v11);
  float v15 = 0.0;
  float v16 = v14 + (float)(v9 * 0.0);
  float v17 = (float)(v8 * -0.0) + (float)(v6 * 0.0);
  *(float *)uint64_t v25 = v13;
  *(float *)&v25[1] = v16;
  *(float *)&v25[2] = v17;
  do
  {
    float v15 = v15 + (float)(*(float *)&v25[v2] * *(float *)&v25[v2]);
    ++v2;
  }
  while (v2 != 3);
  float v18 = sqrtf(v15);
  if (v18 > *((float *)p_inst_props + 934))
  {
    v24[0] = 0;
    v24[1] = 0;
    float v19 = (float)-atan2f(v10, v12) / v18;
    v23[0] = v13 * v19;
    v23[1] = v19 * v16;
    v23[2] = v19 * v17;
    CMOQuaternion::angleAxis((float *)v24, v23);
    CMOQuaternion::rotateFrameInPlace((float *)v24, (float *)&v26);
  }
}

float CMOQuaternion::heading(CMOQuaternion *this)
{
  CMOQuaternion::headingReference(this);
  float v6 = v2;
  float v7 = v3;
  int v8 = v4;
  CMOQuaternion::rotateFrameInPlace((float *)this, &v6);
  for (float result = atan2f(-v7, v6) * 57.296; result < 0.0; float result = result + 360.0)
    ;
  for (; result >= 360.0; float result = result + -360.0)
    ;
  return result;
}

float *CMMath::wrap(float *this, float *a2)
{
  float v2 = *this;
  if (*this < 0.0)
  {
    do
      float v2 = v2 + 360.0;
    while (v2 < 0.0);
    *this = v2;
  }
  if (v2 >= 360.0)
  {
    do
      float v2 = v2 + -360.0;
    while (v2 >= 360.0);
    *this = v2;
  }
  return this;
}

Class initAMSMediaTask()
{
  if (AppleMediaServicesLibrary_sOnce != -1) {
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  }
  Class result = objc_getClass("AMSMediaTask");
  classAMSMediaTask = (uint64_t)result;
  getAMSMediaTaskClass = (uint64_t (*)())AMSMediaTaskFunction;
  return result;
}

id AMSMediaTaskFunction()
{
  return (id)classAMSMediaTask;
}

void *__AppleMediaServicesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AppleMediaServices.framework/AppleMediaServices", 2);
  AppleMediaServicesLibrary_sLib = (uint64_t)result;
  return result;
}

Class initAMSBagKeySet()
{
  if (AppleMediaServicesLibrary_sOnce != -1) {
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  }
  Class result = objc_getClass("AMSBagKeySet");
  classAMSBagKeySet = (uint64_t)result;
  getAMSBagKeySetClass = (uint64_t (*)())AMSBagKeySetFunction;
  return result;
}

id AMSBagKeySetFunction()
{
  return (id)classAMSBagKeySet;
}

Class initAMSBag()
{
  if (AppleMediaServicesLibrary_sOnce != -1) {
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  }
  Class result = objc_getClass("AMSBag");
  classAMSBag = (uint64_t)result;
  getAMSBagClass = (uint64_t (*)())AMSBagFunction;
  return result;
}

id AMSBagFunction()
{
  return (id)classAMSBag;
}

Class initACAccountStore()
{
  if (AccountsLibrary_sOnce != -1) {
    dispatch_once(&AccountsLibrary_sOnce, &__block_literal_global_290);
  }
  Class result = objc_getClass("ACAccountStore");
  classACAccountStore = (uint64_t)result;
  getACAccountStoreClass = (uint64_t (*)())ACAccountStoreFunction;
  return result;
}

id ACAccountStoreFunction()
{
  return (id)classACAccountStore;
}

void *__AccountsLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 2);
  AccountsLibrary_sLib = (uint64_t)result;
  return result;
}

id initValACAccountTypeIdentifieriTunesStore()
{
  if (AccountsLibrary_sOnce != -1) {
    dispatch_once(&AccountsLibrary_sOnce, &__block_literal_global_290);
  }
  v0 = (id *)dlsym((void *)AccountsLibrary_sLib, "ACAccountTypeIdentifieriTunesStore");
  if (v0) {
    objc_storeStrong((id *)&constantValACAccountTypeIdentifieriTunesStore, *v0);
  }
  getACAccountTypeIdentifieriTunesStore = (uint64_t (*)())ACAccountTypeIdentifieriTunesStoreFunction;
  float v1 = (void *)constantValACAccountTypeIdentifieriTunesStore;
  return v1;
}

id ACAccountTypeIdentifieriTunesStoreFunction()
{
  return (id)constantValACAccountTypeIdentifieriTunesStore;
}

Class initAMSMediaArtwork()
{
  if (AppleMediaServicesLibrary_sOnce != -1) {
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  }
  Class result = objc_getClass("AMSMediaArtwork");
  classAMSMediaArtwork = (uint64_t)result;
  getAMSMediaArtworkClass = (uint64_t (*)())AMSMediaArtworkFunction;
  return result;
}

id AMSMediaArtworkFunction()
{
  return (id)classAMSMediaArtwork;
}

uint64_t initValAMSMediaArtworkCropStyleBoundedBox()
{
  if (AppleMediaServicesLibrary_sOnce != -1) {
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  }
  v0 = (uint64_t *)dlsym((void *)AppleMediaServicesLibrary_sLib, "AMSMediaArtworkCropStyleBoundedBox");
  if (v0)
  {
    uint64_t result = *v0;
    constantValAMSMediaArtworkCropStyleBoundedBox = result;
  }
  else
  {
    uint64_t result = constantValAMSMediaArtworkCropStyleBoundedBox;
  }
  getAMSMediaArtworkCropStyleBoundedBox = AMSMediaArtworkCropStyleBoundedBoxFunction;
  return result;
}

uint64_t AMSMediaArtworkCropStyleBoundedBoxFunction()
{
  return constantValAMSMediaArtworkCropStyleBoundedBox;
}

uint64_t initValAMSMediaArtworkFormatPNG()
{
  if (AppleMediaServicesLibrary_sOnce != -1) {
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_0);
  }
  v0 = (uint64_t *)dlsym((void *)AppleMediaServicesLibrary_sLib, "AMSMediaArtworkFormatPNG");
  if (v0)
  {
    uint64_t result = *v0;
    constantValAMSMediaArtworkFormatPNG = result;
  }
  else
  {
    uint64_t result = constantValAMSMediaArtworkFormatPNG;
  }
  getAMSMediaArtworkFormatPNG = AMSMediaArtworkFormatPNGFunction;
  return result;
}

uint64_t AMSMediaArtworkFormatPNGFunction()
{
  return constantValAMSMediaArtworkFormatPNG;
}

Class initISIcon()
{
  if (IconServicesLibrary_sOnce != -1) {
    dispatch_once(&IconServicesLibrary_sOnce, &__block_literal_global_298);
  }
  Class result = objc_getClass("ISIcon");
  classISIcon = (uint64_t)result;
  getISIconClass = (uint64_t (*)())ISIconFunction;
  return result;
}

id ISIconFunction()
{
  return (id)classISIcon;
}

void *__IconServicesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2);
  IconServicesLibrary_sLib = (uint64_t)result;
  return result;
}

Class initISImageDescriptor()
{
  if (IconServicesLibrary_sOnce != -1) {
    dispatch_once(&IconServicesLibrary_sOnce, &__block_literal_global_298);
  }
  Class result = objc_getClass("ISImageDescriptor");
  classISImageDescriptor = (uint64_t)result;
  getISImageDescriptorClass = (uint64_t (*)())ISImageDescriptorFunction;
  return result;
}

id ISImageDescriptorFunction()
{
  return (id)classISImageDescriptor;
}

void sub_21DB2F514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21DB2F584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  float v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SFAirDropMagicHeadViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_21DB2F738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DB2F7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB2F864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21DB30204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_21DB3065C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB30858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB30C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21DB31150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_21DB31294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21DB3131C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB31408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21DB31504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21DB316B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21DB31768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB317D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB3182C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB31888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB31938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB31A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21DB31B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21DB31C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21DB31D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB320E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_21DB3221C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21DB32280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB32338(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21DB3239C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB32410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB32490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB32510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21DB32634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class initCMMotionManager(void)
{
  if (CoreMotionLibrary(void)::sOnce != -1) {
    dispatch_once(&CoreMotionLibrary(void)::sOnce, &__block_literal_global_1);
  }
  Class result = objc_getClass("CMMotionManager");
  classCMMotionManager = (uint64_t)result;
  getCMMotionManagerClass = (uint64_t (*)(void))CMMotionManagerFunction;
  return result;
}

id CMMotionManagerFunction(void)
{
  return (id)classCMMotionManager;
}

void *___ZL17CoreMotionLibraryv_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/CoreMotion.framework/CoreMotion", 2);
  CoreMotionLibrary(void)::sLib = (uint64_t)result;
  return result;
}

id SFAdjustmentFiltersForAssetTypeAndURL(int a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_opt_new();
  float v5 = [NSDictionary dictionaryWithContentsOfURL:v3 error:0];

  if (v5)
  {
    if (a1 == 1 || a1 == 2)
    {
      CFDictionaryGetTypeID();
      float v6 = CFDictionaryGetTypedValue();
    }
    else
    {
      float v6 = 0;
    }
    int v26 = 0;
    CFDictionaryGetDouble();
    float v8 = v7;
    id v9 = objc_alloc(MEMORY[0x263F157C8]);
    float v10 = (void *)[v9 initWithType:*MEMORY[0x263F15B40]];
    float v18 = v8;
    long long v19 = *(_OWORD *)(MEMORY[0x263F15720] + 4);
    int v20 = *(_DWORD *)(MEMORY[0x263F15720] + 20);
    float v21 = v8;
    long long v22 = *(_OWORD *)(MEMORY[0x263F15720] + 28);
    int v23 = *(_DWORD *)(MEMORY[0x263F15720] + 44);
    float v24 = v8;
    *(_OWORD *)uint64_t v25 = *(_OWORD *)(MEMORY[0x263F15720] + 52);
    *(_OWORD *)&v25[12] = *(_OWORD *)(MEMORY[0x263F15720] + 64);
    float v11 = [MEMORY[0x263F08D40] valueWithCAColorMatrix:&v18];
    [v10 setValue:v11 forKey:@"inputColorMatrix"];

    [v4 addObject:v10];
    CFDictionaryGetDouble();
    if (!v26)
    {
      double v13 = v12;
      id v14 = objc_alloc(MEMORY[0x263F157C8]);
      float v15 = (void *)[v14 initWithType:*MEMORY[0x263F15AE0]];
      float v16 = [NSNumber numberWithDouble:v13];
      [v15 setValue:v16 forKey:@"inputAmount"];

      [v4 addObject:v15];
    }
  }
  return v4;
}

id SFPlaybackTimeRangesFromFeaturesTimeURL(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v1 = a1;
  float v2 = objc_opt_new();
  [MEMORY[0x263EFF8C0] arrayWithContentsOfURL:v1 error:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v20 != v6) {
        objc_enumerationMutation(v3);
      }
      int v18 = 0;
      CFDictionaryGetDouble();
      if (v18) {
        break;
      }
      Float64 v9 = v8;
      CFDictionaryGetDouble();
      if (v18) {
        break;
      }
      Float64 v11 = v10;
      memset(&v17, 0, sizeof(v17));
      CMTimeMakeWithSeconds(&start, v9, 1000);
      CMTimeMakeWithSeconds(&duration, v11, 1000);
      CMTimeRangeMake(&v17, &start, &duration);
      CMTimeRange v14 = v17;
      double v12 = [MEMORY[0x263F08D40] valueWithCMTimeRange:&v14];
      [v2 addObject:v12];

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v2;
}

void sub_21DB35F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a33);
  _Unwind_Resume(a1);
}

void sub_21DB36D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_21DB38E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DB3982C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DB39FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initLPLinkMetadataObserver()
{
  if (LinkPresentationLibrary_sOnce != -1) {
    dispatch_once(&LinkPresentationLibrary_sOnce, &__block_literal_global_3);
  }
  Class result = objc_getClass("LPLinkMetadataObserver");
  classLPLinkMetadataObserver = (uint64_t)result;
  getLPLinkMetadataObserverClass = (uint64_t (*)())LPLinkMetadataObserverFunction;
  return result;
}

id LPLinkMetadataObserverFunction()
{
  return (id)classLPLinkMetadataObserver;
}

void *__LinkPresentationLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/LinkPresentation.framework/LinkPresentation", 2);
  LinkPresentationLibrary_sLib = (uint64_t)result;
  return result;
}

id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t operationCallBack(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 handleOperationCallback:a1 event:a2 withResults:a3];
}

__CFString *SFOperationEventToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xE) {
    return @"?";
  }
  else {
    return off_2644725F0[a1 - 1];
  }
}

void sub_21DB3C5F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class initNFHardwareManager()
{
  if (NearFieldLibrary_sOnce != -1) {
    dispatch_once(&NearFieldLibrary_sOnce, &__block_literal_global_376);
  }
  Class result = objc_getClass("NFHardwareManager");
  classNFHardwareManager = (uint64_t)result;
  getNFHardwareManagerClass = (uint64_t (*)())NFHardwareManagerFunction;
  return result;
}

id NFHardwareManagerFunction()
{
  return (id)classNFHardwareManager;
}

void *__NearFieldLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 2);
  NearFieldLibrary_sLib = (uint64_t)result;
  return result;
}

Class initUMUserManager()
{
  if (UserManagementLibrary_sOnce != -1) {
    dispatch_once(&UserManagementLibrary_sOnce, &__block_literal_global_380);
  }
  Class result = objc_getClass("UMUserManager");
  classUMUserManager = (uint64_t)result;
  getUMUserManagerClass = (uint64_t (*)())UMUserManagerFunction;
  return result;
}

id UMUserManagerFunction()
{
  return (id)classUMUserManager;
}

void *__UserManagementLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  UserManagementLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_21DB3CEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DB4241C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_21DB456BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DB462CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DB463A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DB46778(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DB46E08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DB47588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DB477F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DB47A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DB48090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DB486B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t operationCallBack_0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 handleOperationCallback:a1 event:a2 withResults:a3];
}

Class __getPLPhotoLibraryClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __PhotoLibraryServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2644729C8;
    uint64_t v5 = 0;
    PhotoLibraryServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary) {
    __getPLPhotoLibraryClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PLPhotoLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPLPhotoLibraryClass_block_invoke_cold_2();
  }
  getPLPhotoLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PhotoLibraryServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoLibraryServicesLibraryCore_frameworkLibrary = result;
  return result;
}

BOOL cnCropStyleFromSFCropStyle(uint64_t a1)
{
  return a1 == 2;
}

uint64_t cnBackgroundStyleFromSFBackgroundStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) >= 3) {
    return 0;
  }
  else {
    return a1 - 1;
  }
}

void sub_21DB49F84(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_21DB4B548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_21DB4BD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

id getCachedPreferredItemSizesByString()
{
  v0 = (void *)__cachedPreferredItemSizesByString;
  if (!__cachedPreferredItemSizesByString)
  {
    id v1 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    float v2 = (void *)__cachedPreferredItemSizesByString;
    __cachedPreferredItemSizesByString = (uint64_t)v1;

    v0 = (void *)__cachedPreferredItemSizesByString;
  }
  return v0;
}

id createNameLabel(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F828E0];
  float v2 = a1;
  id v3 = objc_alloc_init(v1);
  long long v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 6) {
    [MEMORY[0x263F825C8] systemWhiteColor];
  }
  else {
  uint64_t v6 = [MEMORY[0x263F825C8] labelColor];
  }
  [v3 setTextColor:v6];

  uint64_t v7 = [v3 _screen];
  double v8 = _SFPersonLabelFont();
  [v3 setFont:v8];

  uint64_t v9 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v9];

  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83440], v2);
  if (v10 == NSOrderedAscending) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 1;
  }
  [v3 setTextAlignment:v11];
  [v3 setNumberOfLines:2];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v3;
}

double getChickletSize()
{
  v0 = [MEMORY[0x263F6BC80] _activityImageForActionRepresentationImage:0];
  [v0 size];
  double v2 = v1;

  return v2;
}

void sub_21DB4F0FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_21DB4F290(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21DB4F390(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21DB4F514(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _SFPersonLabelFont()
{
  v0 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 6)
  {
    uint64_t v2 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835B8] weight:*MEMORY[0x263F81828]];
  }
  else
  {
    id v3 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83590]];
    uint64_t v2 = [MEMORY[0x263F81708] fontWithDescriptor:v3 size:0.0];
  }
  return v2;
}

id _SFPersonCollectionViewMaximumSizeCategory(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___SFPersonCollectionViewMaximumSizeCategory_block_invoke;
  block[3] = &unk_264471EE0;
  id v7 = v1;
  uint64_t v2 = _SFPersonCollectionViewMaximumSizeCategory_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&_SFPersonCollectionViewMaximumSizeCategory_onceToken, block);
  }
  id v4 = (id)_SFPersonCollectionViewMaximumSizeCategory_maxCategory;

  return v4;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_21DB53380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DB53824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SFFontForTextStyleWithAdditionalSymbolicTraits(void *a1, int a2)
{
  return SFFontForTextStyleWithAdditionalSymbolicTraitsOfSize(a1, a2, 0.0);
}

id SFFontForTextStyleWithAdditionalSymbolicTraitsOfSize(void *a1, int a2, double a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F82DA0];
  uint64_t v6 = *MEMORY[0x263F83470];
  id v7 = a1;
  double v8 = [v5 traitCollectionWithPreferredContentSizeCategory:v6];
  uint64_t v9 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v7 compatibleWithTraitCollection:v8];

  NSComparisonResult v10 = objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v9, "symbolicTraits") | a2);

  uint64_t v11 = [MEMORY[0x263F81708] fontWithDescriptor:v10 size:a3];

  return v11;
}

id SFVisualEffectViewWrapperForView(void *a1, void *a2)
{
  v23[4] = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F82E50];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = (void *)[[v3 alloc] initWithEffect:v4];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [v6 contentView];
  [v7 addSubview:v5];

  int v18 = (void *)MEMORY[0x263F08938];
  long long v22 = [v6 leftAnchor];
  long long v21 = [v5 leftAnchor];
  long long v20 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v20;
  long long v19 = [v6 topAnchor];
  double v8 = [v5 topAnchor];
  uint64_t v9 = [v19 constraintEqualToAnchor:v8];
  v23[1] = v9;
  NSComparisonResult v10 = [v6 rightAnchor];
  uint64_t v11 = [v5 rightAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v23[2] = v12;
  double v13 = [v6 bottomAnchor];
  CMTimeRange v14 = [v5 bottomAnchor];

  float v15 = [v13 constraintEqualToAnchor:v14];
  float v23[3] = v15;
  float v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  [v18 activateConstraints:v16];

  return v6;
}

id SFImageStackFromImages(void *a1, CGFloat a2)
{
  id v3 = a1;
  id v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  double v6 = v5;

  unint64_t v7 = [v3 count];
  if (v7 >= 3) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = v7;
  }
  double v9 = a2 - (float)((float)v8 * 5.0);
  uint64_t v10 = 2;
  if (v8 > 2) {
    uint64_t v10 = v8;
  }
  uint64_t v11 = objc_msgSend(objc_alloc(getPUStackViewClass()), "initWithFrame:", 0.0, 15.0, v9, (float)((float)(v10 - 2) * 5.0) + a2);
  [v11 setStyle:0];
  id v12 = objc_alloc_init(getPUPhotoDecorationClass());
  double v13 = [MEMORY[0x263F825C8] whiteColor];
  [v12 setBorderColor:v13];

  [v12 setBorderWidth:1.0 / v6];
  CMTimeRange v14 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.0];
  [v12 setForegroundColor:v14];

  [v11 setPhotoDecoration:v12];
  objc_msgSend(v11, "setStackSize:", v9 + 1.0 / v6 * -2.0, v9 + 1.0 / v6 * -2.0);
  objc_msgSend(v11, "setStackPerspectiveOffset:", 0.0, -10.0);
  objc_msgSend(v11, "setStackPerspectiveInsets:", 5.0, 5.0, 5.0, 5.0);
  [v11 setNumberOfVisibleItems:v8];
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      float v16 = [v3 objectAtIndexedSubscript:i];
      [v11 setImage:v16 forItemAtIndex:i];
      [v16 size];
      objc_msgSend(v11, "setImageSize:forItemAtIndex:", i);
    }
  }
  v21.width = a2 - (float)((float)v8 * 5.0);
  v21.height = a2;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v6);
  CMTimeRange v17 = [v11 layer];
  [v17 renderInContext:UIGraphicsGetCurrentContext()];

  int v18 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v18;
}

id SFScaleAndRotateImage(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 imageOrientation];
  id v5 = v3;
  double v6 = (CGImage *)[v5 CGImage];
  double Width = (double)CGImageGetWidth(v6);
  size_t Height = CGImageGetHeight(v6);
  double v9 = (double)Height;
  BOOL v10 = Width <= a2 && v9 <= a2;
  double v11 = Width;
  double v12 = (double)Height;
  if (!v10)
  {
    double v13 = Width / v9;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    if (Width / v9 <= 1.0)
    {
      double v18 = Width;
      double v19 = a2;
      double v11 = v13 * CGRectGetHeight(*(CGRect *)&v14);
      double v12 = a2;
    }
    else
    {
      double v16 = a2;
      double v17 = (double)Height;
      double v11 = a2;
      double v12 = CGRectGetWidth(*(CGRect *)&v14) / v13;
    }
  }
  v44.origin.x = 0.0;
  v44.origin.y = 0.0;
  v44.size.width = v11;
  v44.size.height = v12;
  double v20 = CGRectGetWidth(v44) / Width;
  long long v37 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v38 = *MEMORY[0x263F000D0];
  *(_OWORD *)&v41.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v41.c = v37;
  long long v36 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v41.tx = v36;
  v45.origin.x = 0.0;
  v45.origin.y = 0.0;
  v45.size.width = v11;
  v45.size.height = v12;
  CGFloat v21 = CGRectGetHeight(v45);
  switch(v4)
  {
    case 1:
      CGAffineTransformMakeTranslation(&v41, Width, v9);
      CGAffineTransform v39 = v41;
      CGAffineTransformRotate(&transform, &v39, 3.14159265);
      goto LABEL_16;
    case 2:
      v46.origin.x = 0.0;
      v46.origin.y = 0.0;
      v46.size.width = v11;
      v46.size.height = v12;
      double v12 = CGRectGetWidth(v46);
      CGAffineTransformMakeTranslation(&v41, 0.0, Width);
      *(_OWORD *)&v39.a = *(_OWORD *)&v41.a;
      *(_OWORD *)&v39.c = *(_OWORD *)&v41.c;
      long long v23 = *(_OWORD *)&v41.tx;
      goto LABEL_19;
    case 3:
      v47.origin.x = 0.0;
      v47.origin.y = 0.0;
      v47.size.width = v11;
      v47.size.height = v12;
      double v12 = CGRectGetWidth(v47);
      CGAffineTransformMakeTranslation(&v41, v9, 0.0);
      goto LABEL_21;
    case 4:
      CGAffineTransformMakeTranslation(&v41, Width, 0.0);
      CGAffineTransform v39 = v41;
      CGFloat v24 = -1.0;
      CGFloat v25 = 1.0;
      goto LABEL_15;
    case 5:
      CGAffineTransformMakeTranslation(&v41, 0.0, v9);
      CGAffineTransform v39 = v41;
      CGFloat v24 = 1.0;
      CGFloat v25 = -1.0;
LABEL_15:
      CGAffineTransformScale(&transform, &v39, v24, v25);
LABEL_16:
      *(_OWORD *)&v41.a = *(_OWORD *)&transform.a;
      *(_OWORD *)&v41.c = *(_OWORD *)&transform.c;
      long long v22 = *(_OWORD *)&transform.tx;
      goto LABEL_17;
    case 6:
      v48.origin.x = 0.0;
      v48.origin.y = 0.0;
      v48.size.width = v11;
      v48.size.height = v12;
      double v12 = CGRectGetWidth(v48);
      CGAffineTransformMakeTranslation(&v41, v9, Width);
      CGAffineTransform v39 = v41;
      CGAffineTransformScale(&transform, &v39, -1.0, 1.0);
      long long v23 = *(_OWORD *)&transform.tx;
      CGAffineTransform v41 = transform;
      *(_OWORD *)&v39.a = *(_OWORD *)&transform.a;
      *(_OWORD *)&v39.c = *(_OWORD *)&transform.c;
LABEL_19:
      *(_OWORD *)&v39.tx = v23;
      CGFloat v26 = 4.71238898;
      goto LABEL_22;
    case 7:
      v49.origin.x = 0.0;
      v49.origin.y = 0.0;
      v49.size.width = v11;
      v49.size.height = v12;
      double v12 = CGRectGetWidth(v49);
      CGAffineTransformMakeScale(&v41, -1.0, 1.0);
LABEL_21:
      CGAffineTransform v39 = v41;
      CGFloat v26 = 1.57079633;
LABEL_22:
      CGAffineTransformRotate(&transform, &v39, v26);
      CGAffineTransform v41 = transform;
      double v11 = v21;
      break;
    default:
      *(_OWORD *)&v41.a = v38;
      *(_OWORD *)&v41.c = v37;
      long long v22 = v36;
LABEL_17:
      *(_OWORD *)&v41.tx = v22;
      break;
  }
  if (v20 == 1.0 && (CGAffineTransform transform = v41, CGAffineTransformIsIdentity(&transform))
    || (v11 == *MEMORY[0x263F001B0] ? (BOOL v27 = v12 == *(double *)(MEMORY[0x263F001B0] + 8)) : (BOOL v27 = 0), v27))
  {
    id v33 = v5;
  }
  else
  {
    v43.width = v11;
    v43.height = v12;
    UIGraphicsBeginImageContext(v43);
    CurrentContext = UIGraphicsGetCurrentContext();
    float v29 = CurrentContext;
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      CGContextScaleCTM(CurrentContext, -v20, v20);
      double v30 = 0.0;
      float v31 = v29;
      double v32 = -v9;
    }
    else
    {
      CGContextScaleCTM(CurrentContext, v20, -v20);
      double v32 = 0.0;
      float v31 = v29;
      double v30 = -v9;
    }
    CGContextTranslateCTM(v31, v32, v30);
    CGAffineTransform transform = v41;
    CGContextConcatCTM(v29, &transform);
    float v34 = UIGraphicsGetCurrentContext();
    v50.origin.x = 0.0;
    v50.origin.y = 0.0;
    v50.size.width = Width;
    v50.size.height = v9;
    CGContextDrawImage(v34, v50, v6);
    UIGraphicsGetImageFromCurrentImageContext();
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v33;
}

double SFRoundToScreen(double a1)
{
  uint64_t v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = round(v3 * a1);
  id v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 scale];
  double v7 = v4 / v6;

  return v7;
}

id activityImageForCurrentTraitCollectionWithName(void *a1)
{
  v15[2] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F827E8];
  uint64_t v2 = (void *)MEMORY[0x263F086E0];
  id v3 = a1;
  double v4 = [v2 bundleWithIdentifier:@"com.apple.Sharing"];
  id v5 = (void *)MEMORY[0x263F82DA0];
  double v6 = [MEMORY[0x263F82B60] mainScreen];
  double v7 = [v6 traitCollection];
  v15[0] = v7;
  uint64_t v8 = (void *)MEMORY[0x263F82DA0];
  double v9 = [MEMORY[0x263F82670] currentDevice];
  BOOL v10 = objc_msgSend(v8, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v9, "userInterfaceIdiom"));
  v15[1] = v10;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  double v12 = [v5 traitCollectionWithTraitsFromCollections:v11];
  double v13 = [v1 imageNamed:v3 inBundle:v4 compatibleWithTraitCollection:v12];

  return v13;
}

id SFDeviceImageFromDeviceModel(CGFloat a1, CGFloat a2)
{
  double v4 = SFAirDropModelImageNameFromModelString();
  id v5 = SFDeviceImageFromImageName(v4, a1, a2);

  return v5;
}

id SFDeviceImageFromImageName(void *a1, CGFloat a2, CGFloat a3)
{
  id v5 = (void *)MEMORY[0x263F827E8];
  double v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a1;
  uint64_t v8 = [v6 bundleForClass:objc_opt_class()];
  double v9 = [v5 imageNamed:v7 inBundle:v8];

  [v9 size];
  [v9 scale];
  UIRectCenteredAboutPointScale();
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v18 = [MEMORY[0x263F82B60] mainScreen];
  [v18 scale];
  CGFloat v20 = v19;
  v30.width = a2;
  v30.height = a3;
  UIGraphicsBeginImageContextWithOptions(v30, 0, v20);

  CurrentContext = UIGraphicsGetCurrentContext();
  v28.b = 0.0;
  v28.c = 0.0;
  v28.a = 1.0;
  *(_OWORD *)&v28.d = xmmword_21DBB22F0;
  v28.ty = a3;
  CGContextConcatCTM(CurrentContext, &v28);
  id v22 = [MEMORY[0x263F825C8] whiteColor];
  Components = CGColorGetComponents((CGColorRef)[v22 CGColor]);
  CGContextSetFillColor(CurrentContext, Components);

  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = a2;
  v31.size.height = a3;
  CGContextFillEllipseInRect(CurrentContext, v31);
  id v24 = v9;
  CGFloat v25 = (CGImage *)[v24 CGImage];
  v32.origin.x = v11;
  v32.origin.y = v13;
  v32.size.width = v15;
  v32.size.height = v17;
  CGContextDrawImage(CurrentContext, v32, v25);
  CGFloat v26 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v26;
}

double SFMathMap(double a1, double a2, double a3, double a4, double a5)
{
  return a4 + (a5 - a4) * ((a1 - a2) / (a3 - a2));
}

double SFMathClampedMap(double a1, double a2, double a3, double a4, double a5)
{
  double result = a4 + (a5 - a4) * ((a1 - a2) / (a3 - a2));
  if (result >= a5) {
    double result = a5;
  }
  if (result < a4) {
    return a4;
  }
  return result;
}

double SFMathClamp(double result, double a2, double a3)
{
  if (result >= a3) {
    double result = a3;
  }
  if (result < a2) {
    return a2;
  }
  return result;
}

double SFMathTransition(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

double SFMathProgress(double a1, double a2, double a3)
{
  return (a1 - a2) / (a3 - a2) + 0.0;
}

double SFMathClampedProgress(double a1, double a2, double a3)
{
  double result = fmin((a1 - a2) / (a3 - a2) + 0.0, 1.0);
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

double SFMathAddToValueWithRubberbanding(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = -a5;
  if (a1 >= a3) {
    double v7 = a6;
  }
  else {
    double v7 = v6;
  }
  if (a3 >= a1) {
    double v8 = a3;
  }
  else {
    double v8 = a1;
  }
  if (v8 > a4) {
    double v8 = a4;
  }
  double v9 = -v7;
  if (v7 >= 0.0) {
    double v9 = v7;
  }
  if (v9 != 0.0) {
    double v8 = v8 + (-1.0 / ((a1 - v8) / v7 + -1.0) + -1.0) / 0.55 * v7;
  }
  double v10 = v8 + a2;
  if (v10 >= a3) {
    double v11 = a6;
  }
  else {
    double v11 = v6;
  }
  if (v10 <= a3) {
    double result = a3;
  }
  else {
    double result = v10;
  }
  if (result > a4) {
    double result = a4;
  }
  double v13 = -v11;
  if (v11 >= 0.0) {
    double v13 = v11;
  }
  if (v13 != 0.0) {
    return result + (1.0 - 1.0 / ((v10 - result) / v11 * 0.55 + 1.0)) * v11;
  }
  return result;
}

double SFMathUnrubberband(double result, double a2, double a3, double a4, double a5)
{
  double v5 = result;
  if (result >= a2) {
    double v6 = a5;
  }
  else {
    double v6 = -a4;
  }
  if (a2 >= result) {
    double result = a2;
  }
  if (result > a3) {
    double result = a3;
  }
  double v7 = -v6;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  if (v7 != 0.0) {
    return result + (-1.0 / ((v5 - result) / v6 + -1.0) + -1.0) / 0.55 * v6;
  }
  return result;
}

double SFMathRubberband(double result, double a2, double a3, double a4, double a5)
{
  double v5 = result;
  if (result >= a2) {
    double v6 = a5;
  }
  else {
    double v6 = -a4;
  }
  if (a2 >= result) {
    double result = a2;
  }
  if (result > a3) {
    double result = a3;
  }
  double v7 = -v6;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  if (v7 != 0.0) {
    return result + (1.0 - 1.0 / ((v5 - result) / v6 * 0.55 + 1.0)) * v6;
  }
  return result;
}

double SFSpringConvertMassStiffnessDampingToDampingRatioResponse(double *a1, double *a2, double result, double a4, double a5)
{
  if (a1)
  {
    double v5 = sqrt(result * a4);
    *a1 = a5 / (v5 + v5);
  }
  if (a2)
  {
    double result = 6.28318531 / sqrt(a4 / result);
    *a2 = result;
  }
  return result;
}

double SFSpringConvertDampingRatioResponseToStiffnessDamping(double *a1, double *a2, double result, double a4)
{
  double v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1) {
    *a1 = v4;
  }
  if (a2)
  {
    double v5 = sqrt(v4);
    double result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

double SFSpringConvertStiffnessDampingToDampingRatioResponse(double *a1, double *a2, double a3, double a4)
{
  double result = sqrt(a3);
  if (a1) {
    *a1 = a4 / (result + result);
  }
  if (a2)
  {
    double result = 6.28318531 / result;
    *a2 = result;
  }
  return result;
}

double SFSpringConvertMassStiffnessDampingToStiffnessDamping(double *a1, double *a2, double result, double a4, double a5)
{
  double v5 = sqrt(a4 / result);
  double v6 = 6.28318531 / (6.28318531 / v5) * (6.28318531 / (6.28318531 / v5));
  if (a1) {
    *a1 = v6;
  }
  if (a2)
  {
    double v7 = sqrt(result * a4);
    double v8 = sqrt(v6);
    double result = a5 / (v7 + v7) * (v8 + v8);
    *a2 = result;
  }
  return result;
}

double SFScreenScale()
{
  v0 = [MEMORY[0x263F82B60] mainScreen];
  [v0 scale];
  double v2 = v1;

  return v2;
}

CGImageSource *SFCreateThumbnailImage(void *a1, double a2, double a3, double a4)
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v19 = *MEMORY[0x263F0F600];
  v20[0] = MEMORY[0x263EFFA80];
  double v7 = NSDictionary;
  CFURLRef v8 = a1;
  CFDictionaryRef v9 = [v7 dictionaryWithObjects:v20 forKeys:&v19 count:1];
  double v10 = CGImageSourceCreateWithURL(v8, v9);

  if (v10)
  {
    if (a2 >= a3) {
      double v11 = a2;
    }
    else {
      double v11 = a3;
    }
    uint64_t v12 = *MEMORY[0x263F0F608];
    v17[0] = *MEMORY[0x263F0F5A8];
    v17[1] = v12;
    v18[0] = MEMORY[0x263EFFA88];
    v18[1] = MEMORY[0x263EFFA88];
    v18[2] = MEMORY[0x263EFFA88];
    uint64_t v13 = *MEMORY[0x263F0F638];
    v17[2] = *MEMORY[0x263F0F5B8];
    v17[3] = v13;
    double v14 = [NSNumber numberWithDouble:v11 * a4];
    v18[3] = v14;
    CFDictionaryRef v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

    objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:", CGImageSourceCreateThumbnailAtIndex(v10, 0, v15));
    double v10 = (CGImageSource *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

void SFGenerateWebPreviewImage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    if (![v3 isFileURL])
    {
      id v7 = objc_alloc_init(getLPMetadataProviderClass());
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __SFGenerateWebPreviewImage_block_invoke;
      v8[3] = &unk_264472C20;
      id v9 = v3;
      id v10 = v4;
      [v7 startFetchingMetadataForURL:v9 completionHandler:v8];

      goto LABEL_10;
    }
    double v5 = sharing_ui_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v6 = "Unable to generate web preview for fileURL";
LABEL_7:
      _os_log_impl(&dword_21DB23000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
  }
  else
  {
    double v5 = sharing_ui_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v6 = "Unable to generate web preview for nil URL";
      goto LABEL_7;
    }
  }

  (*((void (**)(id, void))v4 + 2))(v4, 0);
LABEL_10:
}

void __SFGenerateWebPreviewImage_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    CFURLRef v8 = sharing_ui_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      double v16 = v7;
      _os_log_impl(&dword_21DB23000, v8, OS_LOG_TYPE_DEFAULT, "Unable to fetch metadata for URL %@: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __SFGenerateWebPreviewImage_block_invoke_14;
    v10[3] = &unk_264472BF8;
    id v11 = v5;
    id v12 = *(id *)(a1 + 40);
    [v11 _loadAsynchronousFieldsWithUpdateHandler:v10];
  }
}

void __SFGenerateWebPreviewImage_block_invoke_14(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) image];
    id v4 = [v3 platformImage];
    id v5 = v4;
    if (v4)
    {
      id v7 = v4;
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) icon];
      id v7 = [v6 platformImage];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

Class initPUStackView()
{
  if (PhotosUIPrivateLibrary_sOnce != -1) {
    dispatch_once(&PhotosUIPrivateLibrary_sOnce, &__block_literal_global_10);
  }
  Class result = objc_getClass("PUStackView");
  classPUStackView = (uint64_t)result;
  getPUStackViewClass = (uint64_t (*)())PUStackViewFunction;
  return result;
}

id PUStackViewFunction()
{
  return (id)classPUStackView;
}

void *__PhotosUIPrivateLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/PhotosUIPrivate.framework/PhotosUIPrivate", 2);
  PhotosUIPrivateLibrary_sLib = (uint64_t)result;
  return result;
}

Class initPUPhotoDecoration()
{
  if (PhotosUIPrivateLibrary_sOnce != -1) {
    dispatch_once(&PhotosUIPrivateLibrary_sOnce, &__block_literal_global_10);
  }
  Class result = objc_getClass("PUPhotoDecoration");
  classPUPhotoDecoration = (uint64_t)result;
  getPUPhotoDecorationClass = (uint64_t (*)())PUPhotoDecorationFunction;
  return result;
}

id PUPhotoDecorationFunction()
{
  return (id)classPUPhotoDecoration;
}

Class initLPMetadataProvider()
{
  if (LinkPresentationLibrary_sOnce_0 != -1) {
    dispatch_once(&LinkPresentationLibrary_sOnce_0, &__block_literal_global_23);
  }
  Class result = objc_getClass("LPMetadataProvider");
  classLPMetadataProvider = (uint64_t)result;
  getLPMetadataProviderClass = (uint64_t (*)())LPMetadataProviderFunction;
  return result;
}

id LPMetadataProviderFunction()
{
  return (id)classLPMetadataProvider;
}

void *__LinkPresentationLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/LinkPresentation.framework/LinkPresentation", 2);
  LinkPresentationLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void sub_21DB55868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SFUILinkMetadataSerializationForLocalUseOnly(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = dispatch_get_global_queue(25, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __SFUILinkMetadataSerializationForLocalUseOnly_block_invoke;
  v8[3] = &unk_2644721A8;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void __SFUILinkMetadataSerializationForLocalUseOnly_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v2 = [MEMORY[0x263EFF980] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        CFURLRef v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "dataRepresentationForLocalUseOnly", (void)v9);
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id SFUILinkMetadataSerializationForLocalLowFidelityUseOnly(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  double v2 = [MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        CFURLRef v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "dataRepresentationForLocalLowFidelityUseOnly", (void)v10);
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

double avatarImageScale()
{
  v0 = [MEMORY[0x263F82B60] mainScreen];
  [v0 scale];
  double v2 = v1;

  return v2;
}

void sub_21DB58340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

Class initMTMaterialView()
{
  if (MaterialKitLibrary_sOnce != -1) {
    dispatch_once(&MaterialKitLibrary_sOnce, &__block_literal_global_11);
  }
  Class result = objc_getClass("MTMaterialView");
  classMTMaterialView = (uint64_t)result;
  getMTMaterialViewClass = (uint64_t (*)())MTMaterialViewFunction;
  return result;
}

id MTMaterialViewFunction()
{
  return (id)classMTMaterialView;
}

void *__MaterialKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/MaterialKit.framework/MaterialKit", 2);
  MaterialKitLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t IntentsLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = IntentsLibraryCore_frameworkLibrary;
  uint64_t v5 = IntentsLibraryCore_frameworkLibrary;
  if (!IntentsLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_264472DC0;
    long long v7 = *(_OWORD *)&off_264472DD0;
    v3[3] = _sl_dlopen();
    IntentsLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_21DB5F69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __IntentsLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  IntentsLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IntentsLibrary()
{
  double v1 = 0;
  uint64_t result = IntentsLibraryCore();
  if (!result) {
    IntentsLibrary_cold_1(&v1);
  }
  return result;
}

id getINImageClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getINImageClass_softClass;
  uint64_t v7 = getINImageClass_softClass;
  if (!getINImageClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getINImageClass_block_invoke;
    v3[3] = &unk_2644729A8;
    v3[4] = &v4;
    __getINImageClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DB5F864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINImageClass_block_invoke(uint64_t a1)
{
  IntentsLibrary();
  Class result = objc_getClass("INImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getINImageClass_block_invoke_cold_1();
  }
  getINImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getINImageServiceConnectionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getINImageServiceConnectionClass_softClass;
  uint64_t v7 = getINImageServiceConnectionClass_softClass;
  if (!getINImageServiceConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getINImageServiceConnectionClass_block_invoke;
    v3[3] = &unk_2644729A8;
    v3[4] = &v4;
    __getINImageServiceConnectionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DB5F9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINImageServiceConnectionClass_block_invoke(uint64_t a1)
{
  IntentsLibrary();
  Class result = objc_getClass("INImageServiceConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getINImageServiceConnectionClass_block_invoke_cold_1();
  }
  getINImageServiceConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getINImageDefaultScaledSizeSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getINImageDefaultScaledSizeSymbolLoc_ptr;
  uint64_t v6 = getINImageDefaultScaledSizeSymbolLoc_ptr;
  if (!getINImageDefaultScaledSizeSymbolLoc_ptr)
  {
    id v1 = (void *)IntentsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "INImageDefaultScaledSize");
    getINImageDefaultScaledSizeSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21DB5FAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getINImageDefaultScaledSizeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IntentsLibrary();
  Class result = dlsym(v2, "INImageDefaultScaledSize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getINImageDefaultScaledSizeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

double getINImageDefaultScaledSize()
{
  uint64_t INImageDefaultScaledSizeSymbolLoc = getINImageDefaultScaledSizeSymbolLoc();
  if (!INImageDefaultScaledSizeSymbolLoc) {
    getINImageDefaultScaledSize_cold_1();
  }
  return *(double *)INImageDefaultScaledSizeSymbolLoc;
}

uint64_t ContactsUILibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = ContactsUILibraryCore_frameworkLibrary;
  uint64_t v5 = ContactsUILibraryCore_frameworkLibrary;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_264472E08;
    long long v7 = *(_OWORD *)&off_264472E18;
    v3[3] = _sl_dlopen();
    ContactsUILibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_21DB5FC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ContactsUILibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  ContactsUILibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ContactsUILibrary()
{
  id v1 = 0;
  uint64_t result = ContactsUILibraryCore();
  if (!result) {
    ContactsUILibrary_cold_1(&v1);
  }
  return result;
}

id getCNAvatarImageRendererClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCNAvatarImageRendererClass_softClass;
  uint64_t v7 = getCNAvatarImageRendererClass_softClass;
  if (!getCNAvatarImageRendererClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCNAvatarImageRendererClass_block_invoke;
    v3[3] = &unk_2644729A8;
    v3[4] = &v4;
    __getCNAvatarImageRendererClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DB5FE4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNAvatarImageRendererClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  Class result = objc_getClass("CNAvatarImageRenderer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAvatarImageRendererClass_block_invoke_cold_1();
  }
  getCNAvatarImageRendererClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNAvatarImageRenderingScopeClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
  uint64_t v7 = getCNAvatarImageRenderingScopeClass_softClass;
  if (!getCNAvatarImageRenderingScopeClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCNAvatarImageRenderingScopeClass_block_invoke;
    v3[3] = &unk_2644729A8;
    v3[4] = &v4;
    __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DB5FF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNAvatarImageRenderingScopeClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  Class result = objc_getClass("CNAvatarImageRenderingScope");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAvatarImageRenderingScopeClass_block_invoke_cold_1();
  }
  getCNAvatarImageRenderingScopeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNAvatarImageRendererSettingsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCNAvatarImageRendererSettingsClass_softClass;
  uint64_t v7 = getCNAvatarImageRendererSettingsClass_softClass;
  if (!getCNAvatarImageRendererSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCNAvatarImageRendererSettingsClass_block_invoke;
    v3[3] = &unk_2644729A8;
    v3[4] = &v4;
    __getCNAvatarImageRendererSettingsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DB600C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNAvatarImageRendererSettingsClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  Class result = objc_getClass("CNAvatarImageRendererSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNAvatarImageRendererSettingsClass_block_invoke_cold_1();
  }
  getCNAvatarImageRendererSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_21DB60194()
{
  return sub_21DBAD3D8();
}

uint64_t sub_21DB601B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v20 = a5;
  uint64_t v23 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v25 = a4;
  CGSize v30 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a4;
  uint64_t v21 = *(void *)(a4 - 8);
  uint64_t v22 = a4 - 8;
  unint64_t v16 = (*(void *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a1);
  uint64_t v17 = (char *)&v16 - v16;
  uint64_t v26 = type metadata accessor for TimelineEntry();
  uint64_t v5 = MEMORY[0x270FA5388](v17);
  uint64_t v24 = (uint64_t)&v16 - v6;
  CGSize v30 = (char *)&v16 - v6;
  uint64_t v29 = v7;
  uint64_t v27 = v18;
  uint64_t v28 = v19;
  (*(void (**)(uint64_t))(v21 + 16))(v5);
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v24, v17, v25);
  uint64_t v8 = v19;
  uint64_t v9 = v20;
  uint64_t v10 = v25;
  uint64_t v11 = v26;
  uint64_t v12 = v24;
  long long v13 = (void *)(v24 + *(int *)(v26 + 28));
  *long long v13 = v18;
  v13[1] = v8;
  __n128 v14 = sub_21DB603D0(v12, v9, v10, v11);
  (*(void (**)(uint64_t, uint64_t, __n128))(v21 + 8))(v23, v25, v14);
  uint64_t result = v24;
  sub_21DB6044C(v24, v25);
  return result;
}

uint64_t type metadata accessor for TimelineEntry()
{
  return __swift_instantiateGenericMetadata();
}

__n128 sub_21DB603D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void))(*(void *)(a3 - 8) + 16))();
  __n128 result = *(__n128 *)(a1 + *(int *)(a4 + 28));
  *(__n128 *)(a2 + *(int *)(a4 + 28)) = result;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21DB6044C(uint64_t a1, uint64_t a2)
{
}

uint64_t SFShockwaveEffectState.isLogicallyComplete.getter()
{
  uint64_t v10 = 0;
  uint64_t v7 = sub_21DBACB48();
  uint64_t v5 = *(void *)(v7 - 8);
  uint64_t v6 = v7 - 8;
  unint64_t v4 = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = (char *)&v2 - v4;
  uint64_t v10 = v0;
  (*(void (**)(void))(v5 + 16))();
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v7);
  if (v9 == *MEMORY[0x263F6C090]
    || v9 == *MEMORY[0x263F6C088]
    || v9 == *MEMORY[0x263F6C078]
    || v9 == *MEMORY[0x263F6C098])
  {
    int v3 = 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v7);
    int v3 = 0;
  }
  return v3 & 1;
}

uint64_t SFShockwaveEffectState.isRemoved.getter()
{
  uint64_t v8 = 0;
  uint64_t v6 = sub_21DBACB48();
  uint64_t v4 = *(void *)(v6 - 8);
  uint64_t v5 = v6 - 8;
  unint64_t v3 = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = (char *)&v2 - v3;
  uint64_t v8 = v0;
  (*(void (**)(void))(v4 + 16))();
  if ((*(unsigned int (**)(char *, uint64_t))(v4 + 88))(v7, v6) == *MEMORY[0x263F6C098])
  {
    HIDWORD(v2) = 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v6);
    HIDWORD(v2) = 0;
  }
  return BYTE4(v2) & 1;
}

uint64_t SFShockwaveEffectState.assetState.getter()
{
  uint64_t v20 = 0;
  uint64_t v17 = sub_21DBACB48();
  uint64_t v15 = *(void *)(v17 - 8);
  uint64_t v16 = v17 - 8;
  uint64_t v12 = *(void *)(v15 + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]();
  long long v13 = (char *)v5 - v11;
  unint64_t v14 = v11;
  MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)v5 - v14;
  uint64_t v20 = v0;
  (*(void (**)(void))(v15 + 16))();
  int v19 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v18, v17);
  if (v19 == *MEMORY[0x263F6C080]
    || v19 == *MEMORY[0x263F6C090]
    || v19 == *MEMORY[0x263F6C0A0]
    || v19 == *MEMORY[0x263F6C088]
    || v19 == *MEMORY[0x263F6C078]
    || v19 == *MEMORY[0x263F6C098])
  {
    uint64_t v9 = sub_21DBACD38();
    uint64_t v10 = v1;
  }
  else
  {
    uint64_t v2 = (*(uint64_t (**)(char *, void, uint64_t))(v15 + 104))(v13, *MEMORY[0x263F6C078], v17);
    uint64_t v7 = SFShockwaveEffectState.assetState.getter(v2);
    uint64_t v8 = v3;
    uint64_t v6 = *(void (**)(char *, uint64_t))(v15 + 8);
    v5[1] = v15 + 8;
    v6(v13, v17);
    v6(v18, v17);
    uint64_t v9 = v7;
    uint64_t v10 = v8;
  }
  return v9;
}

uint64_t sub_21DB60B2C()
{
  return sub_21DB60B44();
}

uint64_t sub_21DB60B44()
{
  id v33 = &v38;
  uint64_t v38 = 0;
  uint64_t v28 = sub_21DBACB48();
  uint64_t v10 = *(void *)(v28 - 8);
  uint64_t v11 = v28 - 8;
  unint64_t v9 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v28);
  uint64_t v29 = (uint64_t)&v9 - v9;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E770);
  uint64_t v31 = sub_21DBAD308();
  uint64_t v27 = v0;
  uint64_t v1 = *MEMORY[0x263F6C080];
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 104);
  uint64_t v24 = v10 + 104;
  v25(v29, v1, v28);
  uint64_t v12 = &v37;
  uint64_t v37 = 1000;
  unint64_t v18 = sub_21DB6A144();
  uint64_t v17 = MEMORY[0x263F8D6C8];
  uint64_t v13 = sub_21DBAD3C8();
  sub_21DB601B8(v29, v13, v2, v28, v27);
  uint64_t v23 = *(void *)(*(void *)(v32 - 8) + 72);
  uint64_t v14 = v23;
  v25(v29, *MEMORY[0x263F6C0A0], v28);
  uint64_t v36 = 480;
  uint64_t v15 = sub_21DBAD3C8();
  sub_21DB601B8(v29, v15, v3, v28, v27 + v14);
  uint64_t v16 = 2;
  uint64_t v19 = 2 * v23;
  v25(v29, *MEMORY[0x263F6C088], v28);
  uint64_t v35 = v16;
  uint64_t v20 = sub_21DBAD3F8();
  sub_21DB601B8(v29, v20, v4, v28, v27 + v19);
  uint64_t v21 = 3 * v23;
  v25(v29, *MEMORY[0x263F6C078], v28);
  uint64_t v22 = sub_21DBAD3E8();
  sub_21DB601B8(v29, v22, v5, v28, v27 + v21);
  uint64_t v26 = 4 * v23;
  v25(v29, *MEMORY[0x263F6C098], v28);
  uint64_t v30 = sub_21DB60194();
  sub_21DB601B8(v29, v30, v6, v28, v27 + v26);
  uint64_t v7 = v31;
  sub_21DB6120C();
  uint64_t v34 = v7;
  swift_bridgeObjectRetain();
  uint64_t v38 = v34;
  sub_21DB6DE48();
  return v34;
}

uint64_t sub_21DB60E9C()
{
  return sub_21DB60EB4();
}

uint64_t sub_21DB60EB4()
{
  id v33 = &v38;
  uint64_t v38 = 0;
  uint64_t v28 = sub_21DBACB48();
  uint64_t v10 = *(void *)(v28 - 8);
  uint64_t v11 = v28 - 8;
  unint64_t v9 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v28);
  uint64_t v29 = (uint64_t)&v9 - v9;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E770);
  uint64_t v31 = sub_21DBAD308();
  uint64_t v27 = v0;
  uint64_t v1 = *MEMORY[0x263F6C080];
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 104);
  uint64_t v24 = v10 + 104;
  v25(v29, v1, v28);
  uint64_t v12 = &v37;
  uint64_t v37 = 50;
  unint64_t v18 = sub_21DB6A144();
  uint64_t v17 = MEMORY[0x263F8D6C8];
  uint64_t v13 = sub_21DBAD3C8();
  sub_21DB601B8(v29, v13, v2, v28, v27);
  uint64_t v23 = *(void *)(*(void *)(v32 - 8) + 72);
  uint64_t v14 = v23;
  v25(v29, *MEMORY[0x263F6C0A0], v28);
  uint64_t v36 = 480;
  uint64_t v15 = sub_21DBAD3C8();
  sub_21DB601B8(v29, v15, v3, v28, v27 + v14);
  uint64_t v16 = 2;
  uint64_t v19 = 2 * v23;
  v25(v29, *MEMORY[0x263F6C088], v28);
  uint64_t v35 = v16;
  uint64_t v20 = sub_21DBAD3F8();
  sub_21DB601B8(v29, v20, v4, v28, v27 + v19);
  uint64_t v21 = 3 * v23;
  v25(v29, *MEMORY[0x263F6C078], v28);
  uint64_t v22 = sub_21DBAD3E8();
  sub_21DB601B8(v29, v22, v5, v28, v27 + v21);
  uint64_t v26 = 4 * v23;
  v25(v29, *MEMORY[0x263F6C098], v28);
  uint64_t v30 = sub_21DB60194();
  sub_21DB601B8(v29, v30, v6, v28, v27 + v26);
  uint64_t v7 = v31;
  sub_21DB6120C();
  uint64_t v34 = v7;
  swift_bridgeObjectRetain();
  uint64_t v38 = v34;
  sub_21DB6DE48();
  return v34;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21DB6120C()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21DB61250()
{
}

uint64_t sub_21DB61278()
{
  uint64_t result = *v0;
  sub_21DB61250();
  return result;
}

uint64_t sub_21DB61294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = a2;
  uint64_t v9 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = sub_21DBACB48();
  uint64_t v7 = *(void *)(v10 - 8);
  uint64_t v8 = v10 - 8;
  unint64_t v4 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint64_t v6 = (uint64_t)&v4 - v4;
  uint64_t v11 = v2;
  (*(void (**)(void))(v7 + 16))();
  sub_21DB68E08(v6, v10, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v9, v10);
}

uint64_t sub_21DB61390@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = a2;
  uint64_t v3 = a1;
  uint64_t v10 = sub_21DBACB48();
  uint64_t v6 = *(void *)(v10 - 8);
  uint64_t v7 = v10 - 8;
  unint64_t v4 = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = (char *)&v3 - v4;
  uint64_t v5 = *(void *)MEMORY[0x270FA5388](v3);
  swift_retain();
  uint64_t v12 = v5;
  uint64_t v11 = v5;
  sub_21DB61564();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v8, v9, v10);
  return swift_release();
}

uint64_t sub_21DB61484(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = a1;
  uint64_t v7 = a2;
  uint64_t v2 = sub_21DBACB48();
  uint64_t v6 = *(void *)(v2 - 8);
  unint64_t v5 = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint64_t v8 = (uint64_t)&v4 - v5;
  (*(void (**)(char *))(v6 + 16))((char *)&v4 - v5);
  uint64_t v9 = *v7;
  swift_retain();
  uint64_t v11 = v9;
  uint64_t v10 = v9;
  sub_21DB615F8(v8);
  return swift_release();
}

uint64_t sub_21DB61564()
{
  return swift_release();
}

uint64_t sub_21DB615F8(uint64_t a1)
{
  uint64_t v8 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v9 = sub_21DBACB48();
  uint64_t v6 = *(void *)(v9 - 8);
  uint64_t v7 = v9 - 8;
  v4[0] = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](v4[2]);
  unint64_t v5 = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  swift_retain();
  v4[3] = swift_getKeyPath();
  v4[4] = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v5, v8, v9);
  sub_21DBAC968();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v8, v9);
}

void (*sub_21DB6174C(void *a1))(void (***a1)(void, void))
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v2;
  swift_retain();
  void v3[5] = swift_getKeyPath();
  v3[6] = swift_getKeyPath();
  v3[7] = sub_21DBAC948();
  return sub_21DB61824;
}

void sub_21DB61824(void (***a1)(void, void))
{
  uint64_t v1 = *a1;
  v1[7](v1, 0);
  swift_release();
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_21DB61900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = a2;
  uint64_t v3 = a1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E410);
  uint64_t v6 = *(void *)(v10 - 8);
  uint64_t v7 = v10 - 8;
  unint64_t v4 = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = (char *)&v3 - v4;
  uint64_t v5 = *(void *)MEMORY[0x270FA5388](v3);
  swift_retain();
  uint64_t v12 = v5;
  uint64_t v11 = v5;
  sub_21DB61ADC();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v8, v9, v10);
  return swift_release();
}

uint64_t sub_21DB619F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = a1;
  uint64_t v7 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E410);
  uint64_t v6 = *(void *)(v2 - 8);
  unint64_t v5 = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint64_t v8 = (uint64_t)&v4 - v5;
  (*(void (**)(char *))(v6 + 16))((char *)&v4 - v5);
  uint64_t v9 = *v7;
  swift_retain();
  uint64_t v11 = v9;
  uint64_t v10 = v9;
  sub_21DB61B50(v8);
  return swift_release();
}

uint64_t sub_21DB61ADC()
{
  return swift_endAccess();
}

uint64_t sub_21DB61B50(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E410);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E408);
  sub_21DBAC938();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_21DB61C94(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  *uint64_t v6 = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E410);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  v6[2] = v4;
  size_t __size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_21DB61ADC();
  return sub_21DB61D9C;
}

void sub_21DB61D9C(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_21DB61B50((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_21DB61B50((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

uint64_t sub_21DB61E98()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9SharingUI29ShockwaveAnimationCoordinator_animationTask);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_retain();
  swift_endAccess();
  return v3;
}

uint64_t sub_21DB61F00(uint64_t a1)
{
  swift_retain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC9SharingUI29ShockwaveAnimationCoordinator_animationTask);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*sub_21DB61F80())()
{
  return sub_21DB61FEC;
}

uint64_t sub_21DB61FEC()
{
  return swift_endAccess();
}

uint64_t ShockwaveAnimationCoordinator.__allocating_init()()
{
  return ShockwaveAnimationCoordinator.init()();
}

uint64_t ShockwaveAnimationCoordinator.init()()
{
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  uint64_t v1 = sub_21DBACB48();
  uint64_t v7 = *(void *)(v1 - 8);
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = v7;
  uint64_t v9 = (uint64_t)&v4 - v5;
  uint64_t v13 = v0;
  *(void *)(v0 + OBJC_IVAR____TtC9SharingUI29ShockwaveAnimationCoordinator_animationTask) = 0;
  (*(void (**)(void))(v2 + 104))();
  uint64_t v8 = v0 + OBJC_IVAR____TtC9SharingUI29ShockwaveAnimationCoordinator__state;
  uint64_t v10 = &v12;
  swift_beginAccess();
  sub_21DB61294(v9, v8);
  swift_endAccess();
  return v11;
}

uint64_t sub_21DB62174(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v24 = MEMORY[0x263F8F500];
  uint64_t v19 = 0;
  uint64_t v34 = &unk_267D1E430;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
  uint64_t v37 = 0;
  uint64_t v29 = sub_21DBAD158();
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v26 = v29 - 8;
  uint64_t v20 = v25;
  uint64_t v21 = *(void *)(v25 + 64);
  unint64_t v15 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v29);
  uint64_t v28 = (char *)&v15 - v15;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1E420) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v19);
  uint64_t v33 = (uint64_t)&v15 - v16;
  uint64_t v39 = v3;
  uint64_t v38 = v4;
  uint64_t v37 = v2;
  uint64_t v5 = sub_21DBACEC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v33, 1);
  uint64_t v22 = 7;
  uint64_t v32 = swift_allocObject();
  swift_retain();
  swift_weakInit();
  swift_release();
  swift_retain();
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, v17, v29);
  uint64_t v31 = v36;
  sub_21DB68FA8(v18, (uint64_t)v36);
  sub_21DBACEA8();
  uint64_t v23 = sub_21DBACE98();
  unint64_t v27 = (*(unsigned __int8 *)(v20 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v30 = (v27 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = (void *)swift_allocObject();
  uint64_t v7 = v24;
  uint64_t v8 = v25;
  unint64_t v9 = v27;
  uint64_t v10 = v28;
  uint64_t v11 = v29;
  uint64_t v12 = v32;
  uint64_t v35 = v6;
  v6[2] = v23;
  v6[3] = v7;
  v6[4] = v12;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))((char *)v6 + v9, v10, v11);
  sub_21DB691D4(v31, (char *)v35 + v30);
  swift_release();
  uint64_t v13 = sub_21DB64240(v33, (uint64_t)v34, (uint64_t)v35);
  return sub_21DB61F00(v13);
}

uint64_t sub_21DB624A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[19] = a6;
  v6[18] = a5;
  v6[17] = a4;
  v6[10] = v6;
  v6[11] = 0;
  v6[12] = 0;
  v6[13] = 0;
  v6[14] = 0;
  v6[8] = 0;
  v6[9] = 0;
  uint64_t v7 = sub_21DBAD178();
  v6[20] = v7;
  v6[21] = *(void *)(v7 - 8);
  v6[22] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E770);
  v6[23] = v8;
  v6[24] = *(void *)(v8 - 8);
  v6[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E740);
  v6[26] = swift_task_alloc();
  uint64_t v9 = sub_21DBACB48();
  v6[27] = v9;
  v6[28] = *(void *)(v9 - 8);
  v6[29] = swift_task_alloc();
  v6[30] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E778);
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  uint64_t v10 = sub_21DBAD158();
  v6[33] = v10;
  v6[34] = *(void *)(v10 - 8);
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  v6[38] = swift_task_alloc();
  v6[11] = a4 + 16;
  v6[12] = a5;
  v6[13] = a6;
  sub_21DBACEA8();
  v6[39] = sub_21DBACE98();
  uint64_t v16 = sub_21DBACE58();
  v6[40] = v16;
  v6[41] = v11;
  return MEMORY[0x270FA2498](sub_21DB62844, v16);
}

uint64_t sub_21DB62844()
{
  *(void *)(v0 + 80) = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 336) = Strong;
  uint64_t v54 = Strong;
  swift_endAccess();
  if (v54)
  {
    uint64_t v2 = *(void *)(v53 + 304);
    uint64_t v3 = *(void *)(v53 + 272);
    uint64_t v4 = *(void *)(v53 + 264);
    CGRect v50 = *(void **)(v53 + 152);
    uint64_t v5 = *(void *)(v53 + 144);
    *(void *)(v53 + 112) = v54;
    uint64_t v6 = v3 + 16;
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    *(void *)(v53 + 344) = v7;
    *(void *)(v53 + 352) = v6 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v7(v2, v5, v4);
    uint64_t v52 = v50[3];
    uint64_t v51 = v50[4];
    __swift_project_boxed_opaque_existential_1(v50, v52);
    *(void *)(v53 + 120) = (*(uint64_t (**)(uint64_t))(v51 + 8))(v52);
    *(void *)(v53 + 360) = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E780);
    sub_21DB6DDC4();
    sub_21DBACF68();
    while (1)
    {
      uint64_t v47 = *(void *)(v53 + 256);
      uint64_t v48 = *(void *)(v53 + 184);
      uint64_t v46 = *(void *)(v53 + 192);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E790);
      sub_21DBAD198();
      CGRect v49 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48);
      if (v49(v47, 1, v48) == 1)
      {
        uint64_t v44 = *(void *)(v53 + 248);
        uint64_t v45 = *(void *)(v53 + 184);
        float v40 = *(void **)(v53 + 152);
        sub_21DB6DE48();
        uint64_t v42 = v40[3];
        uint64_t v41 = v40[4];
        __swift_project_boxed_opaque_existential_1(v40, v42);
        uint64_t v43 = (*(uint64_t (**)(uint64_t))(v41 + 8))(v42);
        swift_bridgeObjectRetain();
        *(void *)(v53 + 128) = v43;
        sub_21DB6DE74();
        sub_21DBACC88();
        sub_21DB6DE48();
        swift_bridgeObjectRelease();
        if (v49(v44, 1, v45) == 1)
        {
          uint64_t v25 = *(void *)(v53 + 216);
          uint64_t v26 = *(void *)(v53 + 208);
          uint64_t v24 = *(void *)(v53 + 224);
          sub_21DB6DEF8(*(void *)(v53 + 248));
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56))(v26, 1, 1, v25);
        }
        else
        {
          uint64_t v20 = *(void *)(v53 + 248);
          uint64_t v22 = *(void *)(v53 + 216);
          uint64_t v23 = *(void *)(v53 + 208);
          uint64_t v21 = *(void *)(v53 + 224);
          (*(void (**)(void))(v21 + 16))();
          sub_21DB6E058(v20);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56))(v23, 0, 1, v22);
        }
        if ((*(unsigned int (**)(void, uint64_t, void))(*(void *)(v53 + 224) + 48))(*(void *)(v53 + 208), 1, *(void *)(v53 + 216)) == 1)
        {
          uint64_t v19 = *(void *)(v53 + 208);
          (*(void (**)(void, void, void))(*(void *)(v53 + 224) + 104))(*(void *)(v53 + 240), *MEMORY[0x263F6C098], *(void *)(v53 + 216));
          sub_21DB6DFA8(v19);
        }
        else
        {
          (*(void (**)(void, void, void))(*(void *)(v53 + 224) + 32))(*(void *)(v53 + 240), *(void *)(v53 + 208), *(void *)(v53 + 216));
        }
        uint64_t v17 = *(void *)(v53 + 304);
        uint64_t v18 = *(void *)(v53 + 264);
        uint64_t v16 = *(void *)(v53 + 272);
        sub_21DB615F8(*(void *)(v53 + 240));
        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
        swift_release();
        goto LABEL_17;
      }
      sub_21DB6E0B4(*(void *)(v53 + 256), *(void *)(v53 + 200));
      sub_21DBACEE8();
      uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 344);
      uint64_t v33 = *(void *)(v53 + 304);
      uint64_t v37 = *(void *)(v53 + 296);
      uint64_t v36 = *(void *)(v53 + 288);
      uint64_t v8 = *(void *)(v53 + 264);
      uint64_t v35 = *(void *)(v53 + 272);
      uint64_t v9 = (uint64_t *)(*(void *)(v53 + 200) + *(int *)(*(void *)(v53 + 184) + 28));
      sub_21DB64114(v33, *v9, v9[1]);
      v34(v37, v33, v8);
      sub_21DBAD128();
      sub_21DB6E13C();
      char v39 = sub_21DBACC98();
      uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      *(void *)(v53 + 368) = v38;
      *(void *)(v53 + 376) = (v35 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v38(v36, v8);
      v38(v37, v8);
      if (v39) {
        break;
      }
      sub_21DB6E058(*(void *)(v53 + 200));
    }
    uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 344);
    uint64_t v29 = *(void *)(v53 + 304);
    uint64_t v28 = *(void *)(v53 + 280);
    uint64_t v30 = *(void *)(v53 + 264);
    uint64_t v27 = *(void *)(v53 + 232);
    (*(void (**)(void))(*(void *)(v53 + 224) + 16))();
    sub_21DB615F8(v27);
    v31(v28, v29, v30);
    *(void *)(v53 + 40) = 0;
    *(void *)(v53 + 48) = 0;
    *(unsigned char *)(v53 + 56) = 1;
    unint64_t v32 = sub_21DB6DB28();
    sub_21DB6421C();
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v53 + 384) = v10;
    *uint64_t v10 = *(void *)(v53 + 80);
    v10[1] = sub_21DB63360;
    uint64_t v11 = *(void *)(v53 + 280);
    uint64_t v12 = *(void *)(v53 + 176);
    uint64_t v13 = *(void *)(v53 + 160);
    return MEMORY[0x270FA1FF8](v11, v53 + 40, v12, v13, v32);
  }
  else
  {
LABEL_17:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void))(*(void *)(v53 + 80) + 8);
    return v14();
  }
}

uint64_t sub_21DB63360()
{
  uint64_t v8 = (void *)*v1;
  v8[10] = *v1;
  v8[49] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = v8[40];
    uint64_t v3 = sub_21DB63F0C;
  }
  else
  {
    uint64_t v7 = (void (*)(uint64_t, uint64_t))v8[46];
    uint64_t v5 = v8[35];
    uint64_t v6 = v8[33];
    (*(void (**)(void, void))(v8[21] + 8))(v8[22], v8[20]);
    v7(v5, v6);
    uint64_t v2 = v8[40];
    uint64_t v3 = sub_21DB63530;
  }
  return MEMORY[0x270FA2498](v3, v2);
}

uint64_t sub_21DB63530()
{
  uint64_t v1 = v0[25];
  v0[10] = v0;
  sub_21DB6E058(v1);
  for (uint64_t i = v0[49]; ; uint64_t i = 0)
  {
    uint64_t v44 = *(void *)(v47 + 256);
    uint64_t v45 = *(void *)(v47 + 184);
    uint64_t v43 = *(void *)(v47 + 192);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E790);
    sub_21DBAD198();
    uint64_t v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48);
    if (v46(v44, 1, v45) == 1)
    {
      uint64_t v41 = *(void *)(v47 + 248);
      uint64_t v42 = *(void *)(v47 + 184);
      uint64_t v37 = *(void **)(v47 + 152);
      sub_21DB6DE48();
      uint64_t v39 = v37[3];
      uint64_t v38 = v37[4];
      __swift_project_boxed_opaque_existential_1(v37, v39);
      uint64_t v40 = (*(uint64_t (**)(uint64_t))(v38 + 8))(v39);
      swift_bridgeObjectRetain();
      *(void *)(v47 + 128) = v40;
      sub_21DB6DE74();
      sub_21DBACC88();
      sub_21DB6DE48();
      swift_bridgeObjectRelease();
      if (v46(v41, 1, v42) == 1)
      {
        uint64_t v22 = *(void *)(v47 + 216);
        uint64_t v23 = *(void *)(v47 + 208);
        uint64_t v21 = *(void *)(v47 + 224);
        sub_21DB6DEF8(*(void *)(v47 + 248));
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56))(v23, 1, 1, v22);
      }
      else
      {
        uint64_t v17 = *(void *)(v47 + 248);
        uint64_t v19 = *(void *)(v47 + 216);
        uint64_t v20 = *(void *)(v47 + 208);
        uint64_t v18 = *(void *)(v47 + 224);
        (*(void (**)(void))(v18 + 16))();
        sub_21DB6E058(v17);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v20, 0, 1, v19);
      }
      if ((*(unsigned int (**)(void, uint64_t, void))(*(void *)(v47 + 224) + 48))(*(void *)(v47 + 208), 1, *(void *)(v47 + 216)) == 1)
      {
        uint64_t v16 = *(void *)(v47 + 208);
        (*(void (**)(void, void, void))(*(void *)(v47 + 224) + 104))(*(void *)(v47 + 240), *MEMORY[0x263F6C098], *(void *)(v47 + 216));
        sub_21DB6DFA8(v16);
      }
      else
      {
        (*(void (**)(void, void, void))(*(void *)(v47 + 224) + 32))(*(void *)(v47 + 240), *(void *)(v47 + 208), *(void *)(v47 + 216));
      }
      uint64_t v14 = *(void *)(v47 + 304);
      uint64_t v15 = *(void *)(v47 + 264);
      uint64_t v13 = *(void *)(v47 + 272);
      sub_21DB615F8(*(void *)(v47 + 240));
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
      swift_release();
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(v47 + 80) + 8);
      return v8();
    }
    sub_21DB6E0B4(*(void *)(v47 + 256), *(void *)(v47 + 200));
    sub_21DBACEE8();
    if (i)
    {
      uint64_t v12 = *(void *)(v47 + 304);
      uint64_t v11 = *(void *)(v47 + 264);
      uint64_t v10 = *(void *)(v47 + 272);
      sub_21DB6E058(*(void *)(v47 + 200));
      sub_21DB6DE48();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v11);
      swift_release();
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(v47 + 80) + 8);
      return v8();
    }
    uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 344);
    uint64_t v30 = *(void *)(v47 + 304);
    uint64_t v34 = *(void *)(v47 + 296);
    uint64_t v33 = *(void *)(v47 + 288);
    uint64_t v2 = *(void *)(v47 + 264);
    uint64_t v32 = *(void *)(v47 + 272);
    uint64_t v3 = (uint64_t *)(*(void *)(v47 + 200) + *(int *)(*(void *)(v47 + 184) + 28));
    sub_21DB64114(v30, *v3, v3[1]);
    v31(v34, v30, v2);
    sub_21DBAD128();
    sub_21DB6E13C();
    char v36 = sub_21DBACC98();
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    *(void *)(v47 + 368) = v35;
    *(void *)(v47 + 376) = (v32 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v35(v33, v2);
    v35(v34, v2);
    if (v36) {
      break;
    }
    sub_21DB6E058(*(void *)(v47 + 200));
  }
  uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 344);
  uint64_t v26 = *(void *)(v47 + 304);
  uint64_t v25 = *(void *)(v47 + 280);
  uint64_t v27 = *(void *)(v47 + 264);
  uint64_t v24 = *(void *)(v47 + 232);
  (*(void (**)(void))(*(void *)(v47 + 224) + 16))();
  sub_21DB615F8(v24);
  v28(v25, v26, v27);
  *(void *)(v47 + 40) = 0;
  *(void *)(v47 + 48) = 0;
  *(unsigned char *)(v47 + 56) = 1;
  unint64_t v29 = sub_21DB6DB28();
  sub_21DB6421C();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v47 + 384) = v4;
  *uint64_t v4 = *(void *)(v47 + 80);
  v4[1] = sub_21DB63360;
  uint64_t v5 = *(void *)(v47 + 280);
  uint64_t v6 = *(void *)(v47 + 176);
  uint64_t v7 = *(void *)(v47 + 160);
  return MEMORY[0x270FA1FF8](v5, v47 + 40, v6, v7, v29);
}

uint64_t sub_21DB63F0C()
{
  uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[46];
  uint64_t v10 = v0[38];
  uint64_t v6 = v0[35];
  uint64_t v8 = v0[33];
  uint64_t v7 = v0[25];
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[20];
  v0[10] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v9(v6, v8);
  sub_21DB6E058(v7);
  sub_21DB6DE48();
  v9(v10, v8);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0[10] + 8);
  return v4();
}

uint64_t sub_21DB64114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = a1;
  uint64_t v6 = a2;
  uint64_t v5 = a3;
  uint64_t v12 = sub_21DBAD158();
  uint64_t v8 = *(void *)(v12 - 8);
  uint64_t v9 = v12 - 8;
  unint64_t v7 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v5 - v7;
  MEMORY[0x223C130A0](v3);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v12);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v10, v11, v12);
}

uint64_t sub_21DB6421C()
{
  return sub_21DBAD168();
}

uint64_t sub_21DB64240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_21DBACEC8();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 48))(a1, 1) == 1)
  {
    sub_21DB6BD64(a1);
  }
  else
  {
    sub_21DBACEB8();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  }
  uint64_t v4 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v4)
  {
    swift_getObjectType();
    sub_21DBACE58();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_21DB64458@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21DB60B2C();
  a1[3] = (uint64_t)&unk_26CE70130;
  a1[4] = (uint64_t)&off_26CE702B0;
  *a1 = result;
  return result;
}

uint64_t sub_21DB644A0()
{
  return 0;
}

uint64_t *sub_21DB644AC(uint64_t a1, const void *a2, int a3)
{
  uint64_t v162 = a1;
  long long v161 = a2;
  int v160 = a3;
  uint64_t v155 = 0;
  int v131 = sub_21DB696DC;
  int v132 = sub_21DB6B8C0;
  float v133 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  float v134 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  float v135 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  int v136 = sub_21DB6BA24;
  float v137 = sub_21DB696DC;
  float v138 = sub_21DB6B8C0;
  float v139 = sub_21DB6BADC;
  int v140 = sub_21DB6B8C0;
  v141 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  v142 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  int v143 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  long long v144 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  long long v145 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  int v146 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  v196 = 0;
  uint64_t v195 = 0;
  uint64_t v194 = 0;
  char v193 = 0;
  uint64_t v192 = 0;
  uint64_t v147 = 0;
  uint64_t v148 = sub_21DBAC8A8();
  uint64_t v149 = *(void *)(v148 - 8);
  uint64_t v150 = v148 - 8;
  unint64_t v151 = (*(void *)(v149 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v148);
  int v152 = (char *)v56 - v151;
  unint64_t v153 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v56 - v151);
  int v154 = (char *)v56 - v153;
  unint64_t v156 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1E438) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v155);
  int v157 = (char *)v56 - v156;
  unint64_t v158 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5);
  long long v159 = (char *)v56 - v158;
  uint64_t v163 = sub_21DBAD158();
  uint64_t v165 = *(void *)(v163 - 8);
  uint64_t v164 = v163 - 8;
  uint64_t v166 = v165;
  uint64_t v167 = *(void *)(v165 + 64);
  unint64_t v168 = (v167 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v162);
  uint64_t v169 = (uint64_t)v56 - v168;
  unint64_t v170 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  float v171 = (char *)v56 - v170;
  unint64_t v172 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  float v173 = (char *)v56 - v172;
  v196 = (char *)v56 - v172;
  uint64_t v195 = v11;
  uint64_t v194 = v12;
  char v193 = v13 & 1;
  uint64_t v192 = v3;
  if (v13)
  {
    uint64_t v174 = sub_21DB61E98();
    if (v174)
    {
      long long v129 = &v174;
      uint64_t v130 = v174;
      swift_retain();
      sub_21DB69498();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E468);
      sub_21DBACED8();
      swift_release();
    }
    else
    {
      sub_21DB69498();
    }
    sub_21DB61F00(0);
  }
  uint64_t v191 = sub_21DB61E98();
  BOOL v128 = v191 == 0;
  BOOL v127 = v128;
  uint64_t result = &v191;
  sub_21DB69498();
  if (v127)
  {
    sub_21DB694C4(v161, v159);
    int v125 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v165 + 48);
    uint64_t v126 = v165 + 48;
    if (v125(v159, 1, v163) == 1)
    {
      uint64_t v42 = v152;
      sub_21DB695EC((uint64_t)v159);
      uint64_t v43 = sub_21DB76218();
      (*(void (**)(char *, uint64_t, uint64_t))(v149 + 16))(v42, v43, v148);
      float v64 = v190;
      sub_21DB68FA8(v162, (uint64_t)v190);
      uint64_t v71 = 7;
      uint64_t v72 = swift_allocObject();
      sub_21DB691D4(v64, (void *)(v72 + 16));
      float v80 = sub_21DBAC888();
      int v81 = sub_21DBACF98();
      float v67 = &v188;
      uint64_t v188 = 12;
      unint64_t v65 = sub_21DB6A04C();
      unint64_t v66 = sub_21DB6A0C8();
      sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t v68 = v189;
      uint64_t v69 = 17;
      uint64_t v74 = swift_allocObject();
      *(unsigned char *)(v74 + 16) = 32;
      uint64_t v75 = swift_allocObject();
      *(unsigned char *)(v75 + 16) = 8;
      uint64_t v70 = 32;
      uint64_t v44 = swift_allocObject();
      uint64_t v45 = v72;
      uint64_t v73 = v44;
      *(void *)(v44 + 16) = v131;
      *(void *)(v44 + 24) = v45;
      uint64_t v46 = swift_allocObject();
      uint64_t v47 = v73;
      uint64_t v77 = v46;
      *(void *)(v46 + 16) = v132;
      *(void *)(v46 + 24) = v47;
      uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      uint64_t v76 = sub_21DBAD308();
      v78 = v48;
      swift_retain();
      uint64_t v49 = v74;
      CGRect v50 = v78;
      long long *v78 = v133;
      v50[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v49;
      swift_retain();
      uint64_t v51 = v75;
      uint64_t v52 = v78;
      v78[2] = v134;
      v52[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v51;
      swift_retain();
      uint64_t v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v77;
      uint64_t v54 = v78;
      v78[4] = v135;
      v54[5] = v53;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v80, (os_log_type_t)v81))
      {
        uint64_t v55 = v147;
        uint64_t v57 = (uint8_t *)sub_21DBAD038();
        v56[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v58 = sub_21DB6A1C0(0);
        uint64_t v59 = sub_21DB6A1C0(1);
        float v60 = &v187;
        v187 = v57;
        float v61 = &v186;
        uint64_t v186 = v58;
        float v62 = &v185;
        uint64_t v185 = v59;
        sub_21DB6A21C(2, &v187);
        sub_21DB6A21C(1, v60);
        v183 = v133;
        uint64_t v184 = v74;
        sub_21DB6A230(&v183, (uint64_t)v60, (uint64_t)v61, (uint64_t)v62);
        uint64_t v63 = v55;
        if (v55)
        {
          __break(1u);
        }
        else
        {
          v183 = v134;
          uint64_t v184 = v75;
          sub_21DB6A230(&v183, (uint64_t)&v187, (uint64_t)&v186, (uint64_t)&v185);
          v56[1] = 0;
          v183 = v135;
          uint64_t v184 = v77;
          sub_21DB6A230(&v183, (uint64_t)&v187, (uint64_t)&v186, (uint64_t)&v185);
          _os_log_impl(&dword_21DB23000, v80, (os_log_type_t)v81, "Starting %s for nearby sharing interaction without a time to coordinate from", v57, v68);
          sub_21DB6A27C(v58);
          sub_21DB6A27C(v59);
          sub_21DBAD018();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v149 + 8))(v152, v148);
    }
    else
    {
      uint64_t v15 = v154;
      uint64_t v96 = v166;
      float v99 = *(void (**)(char *, char *, uint64_t))(v165 + 32);
      uint64_t v98 = v165 + 32;
      v99(v173, v159, v163);
      uint64_t v16 = sub_21DB76218();
      (*(void (**)(char *, uint64_t, uint64_t))(v149 + 16))(v15, v16, v148);
      uint64_t v95 = v182;
      sub_21DB68FA8(v162, (uint64_t)v182);
      uint64_t v111 = 7;
      uint64_t v105 = swift_allocObject();
      sub_21DB691D4(v95, (void *)(v105 + 16));
      (*(void (**)(char *, char *, uint64_t))(v165 + 16))(v171, v173, v163);
      unint64_t v97 = (*(unsigned __int8 *)(v96 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80);
      uint64_t v100 = swift_allocObject();
      v99((char *)(v100 + v97), v171, v163);
      swift_retain();
      uint64_t v110 = 32;
      uint64_t v17 = swift_allocObject();
      uint64_t v18 = v100;
      uint64_t v112 = v17;
      *(void *)(v17 + 16) = v136;
      *(void *)(v17 + 24) = v18;
      swift_release();
      long long v123 = sub_21DBAC888();
      int v124 = sub_21DBACFA8();
      float v103 = &v180;
      uint64_t v180 = 22;
      unint64_t v101 = sub_21DB6A04C();
      unint64_t v102 = sub_21DB6A0C8();
      sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t v104 = v181;
      uint64_t v108 = 17;
      uint64_t v114 = swift_allocObject();
      int v107 = 32;
      *(unsigned char *)(v114 + 16) = 32;
      uint64_t v115 = swift_allocObject();
      int v109 = 8;
      *(unsigned char *)(v115 + 16) = 8;
      uint64_t v19 = swift_allocObject();
      uint64_t v20 = v105;
      uint64_t v106 = v19;
      *(void *)(v19 + 16) = v137;
      *(void *)(v19 + 24) = v20;
      uint64_t v21 = swift_allocObject();
      uint64_t v22 = v106;
      uint64_t v116 = v21;
      *(void *)(v21 + 16) = v138;
      *(void *)(v21 + 24) = v22;
      uint64_t v117 = swift_allocObject();
      *(unsigned char *)(v117 + 16) = v107;
      uint64_t v118 = swift_allocObject();
      *(unsigned char *)(v118 + 16) = v109;
      uint64_t v23 = swift_allocObject();
      uint64_t v24 = v112;
      uint64_t v113 = v23;
      *(void *)(v23 + 16) = v139;
      *(void *)(v23 + 24) = v24;
      uint64_t v25 = swift_allocObject();
      uint64_t v26 = v113;
      uint64_t v120 = v25;
      *(void *)(v25 + 16) = v140;
      *(void *)(v25 + 24) = v26;
      uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      uint64_t v119 = sub_21DBAD308();
      long long v121 = v27;
      swift_retain();
      uint64_t v28 = v114;
      unint64_t v29 = v121;
      *long long v121 = v141;
      v29[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v28;
      swift_retain();
      uint64_t v30 = v115;
      uint64_t v31 = v121;
      v121[2] = v142;
      v31[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v30;
      swift_retain();
      uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v116;
      uint64_t v33 = v121;
      v121[4] = v143;
      v33[5] = v32;
      swift_retain();
      uint64_t v34 = v117;
      uint64_t v35 = v121;
      v121[6] = v144;
      v35[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v34;
      swift_retain();
      uint64_t v36 = v118;
      uint64_t v37 = v121;
      v121[8] = v145;
      v37[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v36;
      swift_retain();
      uint64_t v38 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v120;
      uint64_t v39 = v121;
      v121[10] = v146;
      v39[11] = v38;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v123, (os_log_type_t)v124))
      {
        uint64_t v40 = v147;
        float v87 = (uint8_t *)sub_21DBAD038();
        uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v88 = sub_21DB6A1C0(0);
        uint64_t v89 = sub_21DB6A1C0(2);
        uint64_t v91 = &v179;
        v179 = v87;
        uint64_t v92 = &v178;
        uint64_t v178 = v88;
        uint64_t v93 = &v177;
        uint64_t v177 = v89;
        unsigned int v90 = 2;
        sub_21DB6A21C(2, &v179);
        sub_21DB6A21C(v90, v91);
        float v175 = v141;
        uint64_t v176 = v114;
        sub_21DB6A230(&v175, (uint64_t)v91, (uint64_t)v92, (uint64_t)v93);
        uint64_t v94 = v40;
        if (v40)
        {
          __break(1u);
        }
        else
        {
          float v175 = v142;
          uint64_t v176 = v115;
          sub_21DB6A230(&v175, (uint64_t)&v179, (uint64_t)&v178, (uint64_t)&v177);
          uint64_t v85 = 0;
          uint64_t v41 = v85;
          float v175 = v143;
          uint64_t v176 = v116;
          sub_21DB6A230(&v175, (uint64_t)&v179, (uint64_t)&v178, (uint64_t)&v177);
          uint64_t v84 = v41;
          float v175 = v144;
          uint64_t v176 = v117;
          sub_21DB6A230(&v175, (uint64_t)&v179, (uint64_t)&v178, (uint64_t)&v177);
          uint64_t v83 = 0;
          float v175 = v145;
          uint64_t v176 = v118;
          sub_21DB6A230(&v175, (uint64_t)&v179, (uint64_t)&v178, (uint64_t)&v177);
          uint64_t v82 = 0;
          float v175 = v146;
          uint64_t v176 = v120;
          sub_21DB6A230(&v175, (uint64_t)&v179, (uint64_t)&v178, (uint64_t)&v177);
          _os_log_impl(&dword_21DB23000, v123, (os_log_type_t)v124, "Starting coordinated %s for nearby sharing interaction %s after connecting", v87, v104);
          sub_21DB6A27C(v88);
          sub_21DB6A27C(v89);
          sub_21DBAD018();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v149 + 8))(v154, v148);
      (*(void (**)(char *, uint64_t))(v165 + 8))(v173, v163);
    }
    sub_21DB694C4(v161, v157);
    if (v125(v157, 1, v163) == 1)
    {
      sub_21DBAD128();
      sub_21DB695EC((uint64_t)v157);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v165 + 32))(v169, v157, v163);
    }
    sub_21DB62174(v162, v169);
    return (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(v165 + 8))(v169, v163);
  }
  return result;
}

uint64_t sub_21DB65D4C(void *a1)
{
  return sub_21DBAD408();
}

uint64_t sub_21DB65D90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v8 = a1;
  uint64_t v12 = sub_21DBAD158();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v7 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v12);
  uint64_t v11 = (char *)&v6 - v7;
  sub_21DBAD128();
  uint64_t v13 = sub_21DB65E78();
  uint64_t v15 = v2;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v12);
  uint64_t result = v13;
  uint64_t v4 = v14;
  uint64_t v5 = v15;
  uint64_t *v14 = v13;
  v4[1] = v5;
  return result;
}

uint64_t sub_21DB65E78()
{
  return sub_21DBAD148();
}

uint64_t sub_21DB65E9C(uint64_t a1, uint64_t a2)
{
  v3[13] = v2;
  v3[12] = a2;
  v3[11] = a1;
  v3[4] = v3;
  v3[2] = 0;
  v3[3] = 0;
  void v3[5] = 0;
  uint64_t v4 = sub_21DBAC8A8();
  v3[14] = v4;
  v3[15] = *(void *)(v4 - 8);
  v3[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E420);
  v3[17] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E478);
  v3[18] = v5;
  v3[19] = *(void *)(v5 - 8);
  v3[20] = swift_task_alloc();
  v3[21] = swift_task_alloc();
  uint64_t v6 = sub_21DBACB48();
  v3[22] = v6;
  v3[23] = *(void *)(v6 - 8);
  v3[24] = swift_task_alloc();
  v3[2] = a1;
  v3[3] = a2;
  void v3[5] = v2;
  return MEMORY[0x270FA2498](sub_21DB660EC, 0);
}

uint64_t sub_21DB660EC()
{
  uint64_t v15 = v0[24];
  uint64_t v13 = v0[23];
  uint64_t v14 = v0[22];
  v0[4] = v0;
  sub_21DB61564();
  char v16 = SFShockwaveEffectState.isRemoved.getter();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v14);
  if (v16)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v12[4] + 8);
    return v9();
  }
  else
  {
    uint64_t v11 = v12[17];
    uint64_t v1 = sub_21DBACEC8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 56))(v11, 1);
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    v12[25] = v2;
    *uint64_t v2 = v12[4];
    v2[1] = sub_21DB66354;
    uint64_t v3 = v12[21];
    uint64_t v4 = v12[17];
    uint64_t v5 = v12[13];
    uint64_t v6 = v12[12];
    uint64_t v7 = v12[11];
    uint64_t v8 = MEMORY[0x263F8EE60] + 8;
    return MEMORY[0x270F634B8](v3, v7, v6, v4, &unk_267D1E488, v5, v8);
  }
}

uint64_t sub_21DB66354()
{
  uint64_t v4 = (void *)*v1;
  v4[4] = *v1;
  v4[26] = v0;
  uint64_t result = swift_task_dealloc();
  if (!v0)
  {
    uint64_t v3 = v4[17];
    swift_release();
    sub_21DB6BD64(v3);
    return MEMORY[0x270FA2498](sub_21DB664C8, 0);
  }
  return result;
}

uint64_t sub_21DB664C8()
{
  uint64_t v22 = v0[20];
  uint64_t v20 = v0[19];
  uint64_t v21 = v0[18];
  v0[4] = v0;
  (*(void (**)(void))(v20 + 16))();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 88))(v22, v21) == *MEMORY[0x263F6C070])
  {
    uint64_t v1 = *(void *)(v19 + 128);
    uint64_t v14 = *(void *)(v19 + 112);
    uint64_t v13 = *(void *)(v19 + 120);
    (*(void (**)(void, void))(*(void *)(v19 + 152) + 8))(*(void *)(v19 + 160), *(void *)(v19 + 144));
    uint64_t v2 = sub_21DB76218();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v1, v2, v14);
    uint64_t v17 = sub_21DBAC888();
    os_log_type_t v16 = sub_21DBACF98();
    *(void *)(v19 + 48) = 2;
    sub_21DB6A04C();
    sub_21DB6A0C8();
    sub_21DB6A144();
    sub_21DBACDD8();
    uint32_t v15 = *(_DWORD *)(v19 + 216);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
    uint64_t v18 = sub_21DBAD308();
    if (os_log_type_enabled(v17, v16))
    {
      uint64_t v3 = *(void *)(v19 + 208);
      buf = (uint8_t *)sub_21DBAD038();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
      uint64_t v10 = sub_21DB6A1C0(0);
      uint64_t v11 = sub_21DB6A1C0(0);
      *(void *)(v19 + 56) = buf;
      *(void *)(v19 + 64) = v10;
      *(void *)(v19 + 72) = v11;
      sub_21DB6A21C(0, (unsigned char **)(v19 + 56));
      sub_21DB6A21C(0, (unsigned char **)(v19 + 56));
      *(void *)(v19 + 80) = v18;
      uint64_t v12 = (void *)swift_task_alloc();
      v12[2] = v19 + 56;
      v12[3] = v19 + 64;
      v12[4] = v19 + 72;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E490);
      sub_21DB6BE44();
      uint64_t result = sub_21DBACDB8();
      if (v3) {
        return result;
      }
      swift_task_dealloc();
      _os_log_impl(&dword_21DB23000, v17, v16, "Timed out waiting for shockwave animation to complete", buf, v15);
      sub_21DB6A27C(v10);
      sub_21DB6A27C(v11);
      sub_21DBAD018();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v7 = *(void *)(v19 + 128);
    uint64_t v8 = *(void *)(v19 + 112);
    uint64_t v6 = *(void *)(v19 + 120);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v19 + 152) + 8))(*(void *)(v19 + 160), *(void *)(v19 + 144));
  }
  (*(void (**)(void, void))(*(void *)(v19 + 152) + 8))(*(void *)(v19 + 168), *(void *)(v19 + 144));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v19 + 32) + 8);
  return v5();
}

uint64_t sub_21DB669F4(uint64_t a1, uint64_t a2)
{
  v2[4] = a2;
  v2[2] = v2;
  v2[3] = 0;
  uint64_t v3 = sub_21DBACB48();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E740);
  v2[8] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E748);
  v2[9] = v4;
  v2[10] = *(void *)(v4 - 8);
  v2[11] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E410);
  v2[12] = v5;
  v2[13] = *(void *)(v5 - 8);
  v2[14] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E750);
  v2[15] = v6;
  v2[16] = *(void *)(v6 - 8);
  v2[17] = swift_task_alloc();
  v2[3] = a2;
  return MEMORY[0x270FA2498](sub_21DB66C64, 0);
}

uint64_t sub_21DB66C64()
{
  uint64_t v8 = v0[14];
  uint64_t v7 = v0[13];
  uint64_t v9 = v0[12];
  uint64_t v11 = v0[11];
  uint64_t v10 = v0[10];
  uint64_t v12 = v0[9];
  v0[2] = v0;
  sub_21DB61ADC();
  unint64_t v1 = sub_21DB6DBAC();
  MEMORY[0x223C128F0](v9, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  sub_21DBAC8F8();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
  uint64_t v2 = (void *)swift_task_alloc();
  v13[18] = v2;
  unint64_t v3 = sub_21DB6DC30();
  *uint64_t v2 = v13[2];
  v2[1] = sub_21DB66DE0;
  uint64_t v4 = v13[15];
  uint64_t v5 = v13[8];
  return ((uint64_t (*)(uint64_t, void, void, uint64_t, unint64_t))MEMORY[0x270FA1E90])(v5, 0, 0, v4, v3);
}

uint64_t sub_21DB66DE0()
{
  *(void *)(*(void *)v1 + 16) = *(void *)v1;
  uint64_t result = swift_task_dealloc();
  if (!v0)
  {
    return MEMORY[0x270FA2498](sub_21DB66F20, 0);
  }
  return result;
}

uint64_t sub_21DB66F20()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[5];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    (*(void (**)(void, void))(v13[16] + 8))(v13[17], v13[15]);
LABEL_8:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v13[2] + 8);
    return v8();
  }
  (*(void (**)(void, void, void))(v13[6] + 32))(v13[7], v13[8], v13[5]);
  if (SFShockwaveEffectState.isRemoved.getter())
  {
    uint64_t v11 = v13[17];
    uint64_t v12 = v13[15];
    uint64_t v10 = v13[16];
    (*(void (**)(void, void))(v13[6] + 8))(v13[7], v13[5]);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    goto LABEL_8;
  }
  (*(void (**)(void, void))(v13[6] + 8))(v13[7], v13[5]);
  uint64_t v4 = (void *)swift_task_alloc();
  v13[18] = v4;
  unint64_t v5 = sub_21DB6DC30();
  *uint64_t v4 = v13[2];
  v4[1] = sub_21DB66DE0;
  uint64_t v6 = v13[15];
  uint64_t v7 = v13[8];
  return ((uint64_t (*)(uint64_t, void, void, uint64_t, unint64_t))MEMORY[0x270FA1E90])(v7, 0, 0, v6, v5);
}

uint64_t sub_21DB671D8()
{
  uint64_t v15 = MEMORY[0x263F8F500];
  os_log_type_t v16 = &unk_267D1E4A8;
  uint64_t v20 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E420);
  unint64_t v17 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  uint64_t v18 = (uint64_t)v9 - v17;
  uint64_t v20 = v0;
  uint64_t v19 = sub_21DB61E98();
  if (v19)
  {
    uint64_t v13 = &v19;
    uint64_t v14 = v19;
    swift_retain();
    sub_21DB69498();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E468);
    sub_21DBACED8();
    swift_release();
  }
  else
  {
    sub_21DB69498();
  }
  v9[2] = 0;
  uint64_t v2 = sub_21DBACEC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v18, 1);
  _DWORD v9[3] = 7;
  uint64_t v11 = swift_allocObject();
  v9[1] = v11 + 16;
  swift_retain();
  swift_weakInit();
  swift_release();
  swift_retain();
  sub_21DBACEA8();
  uint64_t v10 = sub_21DBACE98();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = v15;
  unint64_t v5 = (void *)v3;
  uint64_t v6 = v11;
  uint64_t v12 = v5;
  void v5[2] = v10;
  float v5[3] = v4;
  v5[4] = v6;
  swift_release();
  uint64_t v7 = sub_21DB64240(v18, (uint64_t)v16, (uint64_t)v12);
  return sub_21DB61F00(v7);
}

uint64_t sub_21DB67410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a4;
  v4[10] = v4;
  v4[11] = 0;
  v4[12] = 0;
  uint64_t v5 = sub_21DBAD178();
  v4[14] = v5;
  v4[15] = *(void *)(v5 - 8);
  v4[16] = swift_task_alloc();
  uint64_t v6 = sub_21DBACB48();
  v4[17] = v6;
  v4[18] = *(void *)(v6 - 8);
  v4[19] = swift_task_alloc();
  v4[11] = a4 + 16;
  sub_21DBACEA8();
  v4[20] = sub_21DBACE98();
  uint64_t v10 = sub_21DBACE58();
  v4[21] = v10;
  v4[22] = v7;
  return MEMORY[0x270FA2498](sub_21DB675BC, v10);
}

uint64_t sub_21DB675BC()
{
  *(void *)(v0 + 80) = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 184) = Strong;
  uint64_t v15 = Strong;
  swift_endAccess();
  if (v15)
  {
    uint64_t v11 = *(void *)(v14 + 152);
    uint64_t v2 = *(void *)(v14 + 144);
    *(void *)(v14 + 96) = v15;
    uint64_t v3 = v2 + 104;
    uint64_t v4 = *(void (**)(void))(v2 + 104);
    *(void *)(v14 + 192) = v4;
    *(void *)(v14 + 200) = v3 & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v4();
    sub_21DB615F8(v11);
    *(void *)(v14 + 64) = sub_21DBAD3E8();
    *(void *)(v14 + 72) = v5;
    *(void *)(v14 + 40) = 0;
    *(void *)(v14 + 48) = 0;
    *(unsigned char *)(v14 + 56) = 1;
    unint64_t v12 = sub_21DB6DB28();
    sub_21DB6421C();
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))((char *)&dword_267D1E730
                                                                                       + dword_267D1E730);
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v14 + 208) = v6;
    *uint64_t v6 = *(void *)(v14 + 80);
    v6[1] = sub_21DB67854;
    uint64_t v7 = *(void *)(v14 + 128);
    uint64_t v8 = *(void *)(v14 + 112);
    return v13(v14 + 64, v14 + 40, v7, v8, v12);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(*(void *)(v14 + 80) + 8);
    return v10();
  }
}

uint64_t sub_21DB67854()
{
  uint64_t v5 = (void *)*v1;
  v5[10] = *v1;
  v5[27] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = v5[21];
    uint64_t v3 = sub_21DB67AF0;
  }
  else
  {
    (*(void (**)(void, void))(v5[15] + 8))(v5[16], v5[14]);
    uint64_t v2 = v5[21];
    uint64_t v3 = sub_21DB679F4;
  }
  return MEMORY[0x270FA2498](v3, v2);
}

uint64_t sub_21DB679F4()
{
  uint64_t v1 = (void (*)(void))v0[24];
  uint64_t v4 = v0[19];
  v0[10] = v0;
  v1();
  sub_21DB615F8(v4);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[10] + 8);
  return v2();
}

uint64_t sub_21DB67AF0()
{
  uint64_t v1 = *(void *)(v0 + 120);
  *(void *)(v0 + 80) = v0;
  (*(void (**)(void))(v1 + 8))();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v0 + 80) + 8);
  return v2();
}

uint64_t sub_21DB67BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = v5;
  *(void *)(v5 + 16) = v5;
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_267D1E738 + dword_267D1E738);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v8 + 24) = v6;
  *uint64_t v6 = *(void *)(v8 + 16);
  v6[1] = sub_21DB67CD4;
  return v12(a1, a2, a4, a5);
}

uint64_t sub_21DB67CD4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = *v1;
  uint64_t v5 = v2 + 16;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)v5 + 8);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)v5 + 8);
  }
  return v3();
}

uint64_t sub_21DB67E68(uint64_t a1)
{
  uint64_t v9 = a1;
  uint64_t v18 = 0;
  uint64_t v17 = 0;
  uint64_t v5 = 0;
  uint64_t v8 = sub_21DBACBB8();
  uint64_t v11 = *(void *)(v8 - 8);
  uint64_t v7 = v8 - 8;
  unint64_t v6 = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  unint64_t v12 = (char *)&v5 - v6;
  uint64_t v16 = sub_21DBAC9D8();
  uint64_t v13 = *(void *)(v16 - 8);
  uint64_t v14 = v16 - 8;
  unint64_t v10 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t)&v5 - v10;
  uint64_t v18 = v3;
  uint64_t v17 = v1;
  (*(void (**)(uint64_t))(v11 + 16))(v2);
  sub_21DBAC9E8();
  sub_21DB67FE4(v15);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v15, v16);
}

uint64_t sub_21DB67FE4(uint64_t a1)
{
  uint64_t v41 = a1;
  uint64_t v54 = 0;
  uint64_t v53 = 0;
  uint64_t v55 = 0;
  uint64_t v35 = 0;
  uint64_t v23 = sub_21DBAC998();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = v23 - 8;
  unint64_t v26 = (*(void *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v27 = (char *)&v14 - v26;
  uint64_t v28 = sub_21DBACB98();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = v28 - 8;
  unint64_t v31 = (*(void *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v14 - v31;
  uint64_t v55 = (char *)&v14 - v31;
  unint64_t v33 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1E438) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v35);
  uint64_t v34 = (char *)&v14 - v33;
  uint64_t v36 = sub_21DBACBA8();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = v36 - 8;
  unint64_t v39 = (*(void *)(v37 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v35);
  uint64_t v40 = (char *)&v14 - v39;
  uint64_t v45 = sub_21DBACB48();
  uint64_t v43 = *(void *)(v45 - 8);
  uint64_t v44 = v45 - 8;
  unint64_t v42 = (*(void *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v41);
  uint64_t v46 = (uint64_t)&v14 - v42;
  uint64_t v54 = v2;
  uint64_t v53 = v1;
  sub_21DB61564();
  unsigned int v47 = SFShockwaveEffectState.isLogicallyComplete.getter();
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v46, v45);
  uint64_t result = v47;
  if ((v47 & 1) == 0)
  {
    sub_21DBAC9C8();
    int v22 = (*(uint64_t (**)(char *, uint64_t))(v37 + 88))(v40, v36);
    if (v22 == *MEMORY[0x263F6C0E0])
    {
      (*(void (**)(char *, uint64_t))(v37 + 96))(v40, v36);
      (*(void (**)(uint64_t, void, uint64_t))(v43 + 104))(v46, *MEMORY[0x263F6C080], v45);
      sub_21DB615F8(v46);
      uint64_t v4 = sub_21DBACB78();
      return (*(uint64_t (**)(char *))(*(void *)(v4 - 8) + 8))(v40);
    }
    else if (v22 == *MEMORY[0x263F6C0F0])
    {
      (*(void (**)(char *, uint64_t))(v37 + 96))(v40, v36);
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v32, v40, v28);
      uint64_t v55 = v32;
      sub_21DBAC9B8();
      int v20 = (*(uint64_t (**)(char *, uint64_t))(v24 + 88))(v27, v23);
      if (v20 == *MEMORY[0x263F6BDB8])
      {
        v50[5] = sub_21DBACB88();
        v50[6] = v6;
        BOOL v19 = v6 != 0;
        BOOL v18 = v19;
        sub_21DB6C060();
        if (v18)
        {
          uint64_t v7 = sub_21DB60E9C();
          uint64_t v17 = v49;
          v49[3] = &unk_26CE70158;
          v49[4] = &off_26CE702C0;
          v49[0] = v7;
          sub_21DBAC9A8();
          sub_21DB644AC((uint64_t)v17, v34, 1);
          sub_21DB695EC((uint64_t)v34);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
        }
        else
        {
          sub_21DBAC9A8();
          uint64_t v16 = v50;
          sub_21DB64458(v50);
          char v8 = sub_21DB644A0();
          sub_21DB644AC((uint64_t)v16, v34, v8 & 1);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
          sub_21DB695EC((uint64_t)v34);
        }
      }
      else if (v20 == *MEMORY[0x263F6BDC0])
      {
        uint64_t v9 = sub_21DB60E9C();
        uint64_t v15 = v51;
        v51[3] = &unk_26CE70158;
        v51[4] = &off_26CE702C0;
        v51[0] = v9;
        sub_21DBAD128();
        uint64_t v10 = sub_21DBAD158();
        (*(void (**)(char *, void, uint64_t))(*(void *)(v10 - 8) + 56))(v34, 0, 1);
        char v11 = sub_21DB644A0();
        sub_21DB644AC((uint64_t)v15, v34, v11 & 1);
        sub_21DB695EC((uint64_t)v34);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      }
      else
      {
        sub_21DBAC9A8();
        uint64_t v14 = &v52;
        sub_21DB64458(&v52);
        char v12 = sub_21DB644A0();
        sub_21DB644AC((uint64_t)v14, v34, v12 & 1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
        sub_21DB695EC((uint64_t)v34);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
      }
      return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v32, v28);
    }
    else if (v22 == *MEMORY[0x263F6C0E8])
    {
      (*(void (**)(char *, uint64_t))(v37 + 96))(v40, v36);
      sub_21DB671D8();
      uint64_t v13 = sub_21DBACB68();
      return (*(uint64_t (**)(char *))(*(void *)(v13 - 8) + 8))(v40);
    }
    else if (v22 == *MEMORY[0x263F6C0D8])
    {
      sub_21DBAC9A8();
      uint64_t v21 = &v48;
      sub_21DB64458(&v48);
      char v5 = sub_21DB644A0();
      sub_21DB644AC((uint64_t)v21, v34, v5 & 1);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      return sub_21DB695EC((uint64_t)v34);
    }
    else
    {
      (*(void (**)(uint64_t, void, uint64_t))(v43 + 104))(v46, *MEMORY[0x263F6C098], v45);
      sub_21DB615F8(v46);
      return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v40, v36);
    }
  }
  return result;
}

uint64_t sub_21DB68AB8()
{
  uint64_t v14 = 0;
  uint64_t v10 = sub_21DBACB48();
  uint64_t v6 = *(void *)(v10 - 8);
  uint64_t v7 = v10 - 8;
  unint64_t v4 = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  char v8 = (char *)&v3 - v4;
  unint64_t v5 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v3 - v4);
  uint64_t v9 = (char *)&v3 - v5;
  uint64_t v14 = v0;
  sub_21DB61564();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F6C080], v10);
  unsigned int v13 = sub_21DBACB38();
  char v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v11 = v6 + 8;
  v12(v8, v10);
  v12(v9, v10);
  uint64_t result = v13;
  if (v13) {
    return sub_21DB671D8();
  }
  return result;
}

uint64_t ShockwaveAnimationCoordinator.deinit()
{
  uint64_t v3 = OBJC_IVAR____TtC9SharingUI29ShockwaveAnimationCoordinator__state;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E408);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
  sub_21DB69498();
  return v4;
}

uint64_t ShockwaveAnimationCoordinator.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_21DB68D34@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ShockwaveAnimationCoordinator();
  uint64_t result = sub_21DBAC908();
  *a1 = result;
  return result;
}

uint64_t static ShockwaveAnimationCoordinator.== infix(_:_:)()
{
  return sub_21DBACCA8() & 1;
}

uint64_t sub_21DB68DE4()
{
  return static ShockwaveAnimationCoordinator.== infix(_:_:)() & 1;
}

uint64_t sub_21DB68E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v4[1] = a3;
  uint64_t v7 = a1;
  uint64_t v8 = a2;
  uint64_t v9 = a2;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = a2 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a1);
  v4[2] = (char *)v4 - v4[0];
  (*(void (**)(void))(v5 + 16))();
  sub_21DBAC918();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t sub_21DB68F68()
{
  return swift_deallocObject();
}

uint64_t sub_21DB68FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t sub_21DB69014()
{
  uint64_t v4 = sub_21DBAD158();
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v5 = (v3 + *(void *)(v2 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  __swift_destroy_boxed_opaque_existential_1(v0 + v5);
  return swift_deallocObject();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

void *sub_21DB691D4(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t sub_21DB69210(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v5 = *(void *)(sub_21DBAD158() - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v11 = (v10 + *(void *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *unint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_21DB6936C;
  return sub_21DB624A0(a1, v7, v8, v9, (uint64_t)v1 + v10, (uint64_t)v1 + v11);
}

uint64_t sub_21DB6936C()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21DB69498()
{
}

void *sub_21DB694C4(const void *a1, void *a2)
{
  uint64_t v6 = sub_21DBAD158();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E438);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_21DB695EC(uint64_t a1)
{
  uint64_t v3 = sub_21DBAD158();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_21DB6969C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_21DB696DC()
{
  return sub_21DB65D4C((void *)(v0 + 16));
}

uint64_t sub_21DB696E4()
{
  return sub_21DBAD218();
}

uint64_t sub_21DB69724()
{
  return sub_21DBAD248();
}

uint64_t sub_21DB6976C()
{
  return sub_21DBAD228();
}

uint64_t sub_21DB697B4()
{
  return sub_21DBAD288();
}

uint64_t sub_21DB697F0()
{
  return sub_21DBAD258();
}

uint64_t sub_21DB6983C()
{
  return sub_21DBAD268() & 1;
}

uint64_t sub_21DB6988C()
{
  return sub_21DBAD278();
}

uint64_t sub_21DB698D8()
{
  return sub_21DBAD288();
}

uint64_t sub_21DB69914()
{
  return sub_21DBAD258();
}

uint64_t sub_21DB69960()
{
  return sub_21DBAD268() & 1;
}

uint64_t sub_21DB699B0()
{
  return sub_21DBAD278();
}

uint64_t sub_21DB699FC()
{
  return sub_21DBAD288();
}

uint64_t sub_21DB69A38()
{
  return sub_21DBAD258();
}

uint64_t sub_21DB69A84()
{
  return sub_21DBAD268() & 1;
}

uint64_t sub_21DB69AD4()
{
  return sub_21DBAD278();
}

uint64_t sub_21DB69B20()
{
  return sub_21DBAD218();
}

uint64_t sub_21DB69B60()
{
  return sub_21DBAD248();
}

uint64_t sub_21DB69BA8()
{
  return sub_21DBAD228();
}

void sub_21DB69BF0(uint64_t a1@<X8>)
{
  sub_21DB69C2C();
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = v2 & 1;
}

void sub_21DB69C50(void *a1@<X8>)
{
  sub_21DB69C80();
  *a1 = v1;
}

uint64_t sub_21DB69C9C()
{
  return sub_21DBAD318() & 1;
}

uint64_t sub_21DB69CE8()
{
  return sub_21DBAD318() & 1;
}

void *sub_21DB69D34@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_21DB69D6C();
  *a1 = result;
  return result;
}

void *sub_21DB69D6C()
{
  swift_bridgeObjectRetain();
  char v2 = (void *)sub_21DBACCC8();
  id v0 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_21DB69DC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21DB69DFC(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21DB69DFC(void *a1)
{
  id v1 = a1;
  uint64_t v4 = sub_21DBACCD8();

  return v4;
}

uint64_t sub_21DB69E4C()
{
  return sub_21DBAD238();
}

uint64_t sub_21DB69E98()
{
  return sub_21DBAD238();
}

uint64_t sub_21DB69EE4()
{
  return sub_21DBAD238();
}

uint64_t sub_21DB69F30()
{
  return sub_21DBAD218();
}

uint64_t sub_21DB69F70()
{
  return sub_21DBAD248();
}

uint64_t sub_21DB69FB8()
{
  return sub_21DBAD228();
}

uint64_t sub_21DB6A000()
{
  return sub_21DBAD318() & 1;
}

unint64_t sub_21DB6A04C()
{
  uint64_t v2 = qword_267D1E440;
  if (!qword_267D1E440)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E440);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6A0C8()
{
  uint64_t v2 = qword_267D1E448;
  if (!qword_267D1E448)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E448);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6A144()
{
  uint64_t v2 = qword_267D1E450;
  if (!qword_267D1E450)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E450);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DB6A1C0(uint64_t a1)
{
  if (a1) {
    return sub_21DBAD038();
  }
  else {
    return 0;
  }
}

uint64_t sub_21DB6A21C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21DB6A230(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21DB6A27C(uint64_t result)
{
  if (result)
  {
    sub_21DBAD028();
    return sub_21DBAD018();
  }
  return result;
}

uint64_t sub_21DB6A2EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a3;
  v7[1] = a4;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = a3 - 8;
  v7[0] = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (void (*)(void))MEMORY[0x270FA5388](a1);
  unint64_t v10 = (char *)v7 - v7[0];
  v4();
  uint64_t v12 = sub_21DBAD298();
  uint64_t v13 = v5;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v11);
  return v12;
}

void sub_21DB6A3D0()
{
  void *v0 = *v0;
}

uint64_t sub_21DB6A3DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = v4;
  v5[6] = a4;
  v5[5] = a3;
  v5[4] = a2;
  float v5[3] = a1;
  void v5[2] = v5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5[8] = AssociatedTypeWitness;
  v5[9] = *(void *)(AssociatedTypeWitness - 8);
  v5[10] = swift_task_alloc();
  v5[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21DB6A508, 0);
}

uint64_t sub_21DB6A508()
{
  uint64_t v9 = v0[10];
  uint64_t v8 = v0[9];
  uint64_t v10 = v0[8];
  v0[2] = v0;
  sub_21DBAD358();
  swift_getAssociatedConformanceWitness();
  sub_21DBAD188();
  id v1 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v0[12] = v1;
  v0[13] = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v1(v9, v10);
  uint64_t v2 = (void *)swift_task_alloc();
  v11[14] = v2;
  *uint64_t v2 = v11[2];
  v2[1] = sub_21DB6A670;
  uint64_t v3 = v11[11];
  uint64_t v4 = v11[6];
  uint64_t v5 = v11[5];
  uint64_t v6 = v11[4];
  return MEMORY[0x270FA2380](v3, v6, v5, v4);
}

uint64_t sub_21DB6A670()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v4 + 96))(*(void *)(v4 + 88), *(void *)(v4 + 64));
    return MEMORY[0x270FA2498](sub_21DB6A844, 0);
  }
  else
  {
    (*(void (**)(void))(v4 + 96))();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v4 + 16) + 8);
    return v2();
  }
}

uint64_t sub_21DB6A844()
{
  *(void *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_21DB6A8F0(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_21DB6A918(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  sub_21DB6A99C(v4, v5, a3);
  uint64_t v8 = *a1;
  sub_21DBAD058();
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t sub_21DB6A99C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_21DB6AB10((uint64_t)&v17, 0, 0, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      sub_21DB6DD2C((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x263F8DBE0];
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_21DB6DD2C((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  return v11;
}

uint64_t sub_21DB6AB10(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }
      else
      {
        int64_t v16 = 0;
      }
      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_21DB6AE88(v21, v15, a2);
          sub_21DBAD068();
          *uint64_t v17 = a2;
          uint64_t v11 = 0;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          char v22 = v13 & 1;
          char v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    uint64_t v6 = sub_21DB6AEC8(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  uint64_t result = sub_21DBAD0C8();
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_21DB6AE88(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_21DB6AEC8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_21DB6AF7C(a1, a2);
  sub_21DB6B0F8();
  uint64_t v4 = v6[2];
  sub_21DB6B170(v4);
  sub_21DB6B1F4(v4, 0);
  sub_21DB6A3D0();
  swift_retain();
  uint64_t v5 = sub_21DB6B264((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_21DB6AF7C(uint64_t a1, uint64_t a2)
{
  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = sub_21DBACD68();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7) {
    return (void *)sub_21DB6B3E8();
  }
  uint64_t v5 = sub_21DB6B27C(v7, 0);
  swift_retain();
  swift_release();
  uint64_t result = (void *)sub_21DBAD0B8();
  uint64_t v6 = result;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_21DB6C060();
    if (v6 == (void *)v7) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21DB6B0F8()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_21DB6B264(*v3);
    uint64_t result = sub_21DB6B418(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }
  return result;
}

uint64_t sub_21DB6B170(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24) >> 1 < result + 1)
  {
    uint64_t result = sub_21DB6B418(*(void *)(*(void *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_21DB6B1F4(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(unsigned char *)(v6 + 32 + a1) = a2;
  return swift_release();
}

uint64_t sub_21DB6B264(uint64_t a1)
{
  return sub_21DB6B718(a1);
}

void *sub_21DB6B27C(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E768);
    uint64_t v6 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    swift_retain();
    return (void *)v3;
  }
}

uint64_t sub_21DB6B3E8()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  swift_retain();
  return v1;
}

uint64_t sub_21DB6B418(char a1, uint64_t a2, char a3, uint64_t a4)
{
  swift_retain();
  uint64_t result = swift_retain();
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if (a3)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E768);
    uint64_t v8 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * (v6 - (void)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * v9;
    }
    swift_release();
    uint64_t v7 = (char *)v8;
  }
  else
  {
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    swift_retain();
    uint64_t v7 = v5;
  }
  if (a1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_21DB6B758((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    sub_21DB6B720((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t sub_21DB6B718(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_21DB6B720(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_21DB6B758(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

unsigned char **sub_21DB6B80C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  *size_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_21DB6B820()
{
  return swift_deallocObject();
}

unsigned char **sub_21DB6B84C(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_21DB6B80C(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_21DB6B854()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6B880()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6B8C0()
{
  return sub_21DB6A8F0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_21DB6B8CC()
{
  return swift_deallocObject();
}

void *sub_21DB6B90C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_21DB6A918(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_21DB6B918()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_21DB6B958()
{
  uint64_t v2 = *(void *)(sub_21DBAD158() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_21DB6BA24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_21DBAD158();
  uint64_t v3 = v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));
  return sub_21DB65D90(v3, a1);
}

uint64_t sub_21DB6BA9C()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6BADC()
{
  return sub_21DB6A2EC(*(void *)(v0 + 16), *(void *)(v0 + 24), MEMORY[0x263F8ED48], MEMORY[0x263F8ED70]);
}

uint64_t sub_21DB6BAF8()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6BB24()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6BB50()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6BB90()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6BBD0()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6BBFC()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6BC28()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6BC68()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6BCA8(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_21DB6936C;
  return sub_21DB669F4(a1, v5);
}

uint64_t sub_21DB6BD64(uint64_t a1)
{
  uint64_t v3 = sub_21DBACEC8();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_21DB6BE14(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_21DB6A230(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_21DB6BE44()
{
  uint64_t v2 = qword_267D1EB00;
  if (!qword_267D1EB00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_267D1E490);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EB00);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

uint64_t sub_21DB6BF40()
{
  return swift_deallocObject();
}

uint64_t sub_21DB6BF88(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_21DB6936C;
  return sub_21DB67410(a1, v6, v7, v8);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21DB6C060()
{
}

uint64_t type metadata accessor for ShockwaveAnimationCoordinator()
{
  uint64_t v1 = qword_267D1E658;
  if (!qword_267D1E658) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_21DB6C104()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_21DB6C110()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21DB6C140()
{
  uint64_t v2 = swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

unint64_t sub_21DB6C224(void *a1, uint64_t *a2, uint64_t a3)
{
  int v9 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v9 & 0x20000) != 0)
  {
    uint64_t v4 = *a2;
    swift_retain();
    *a1 = v4;
    return *a1 + ((v9 + 16) & ~(unint64_t)v9);
  }
  else
  {
    (*(void (**)(void *, uint64_t *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1, a2);
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
    return (unint64_t)a1;
  }
}

uint64_t sub_21DB6C330(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

__n128 sub_21DB6C380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 16) - 8) + 16))();
  __n128 result = *(__n128 *)(a2 + *(int *)(a3 + 28));
  *(__n128 *)(a1 + *(int *)(a3 + 28)) = result;
  return result;
}

uint64_t sub_21DB6C3F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 16) - 8) + 24))();
  uint64_t result = a1;
  uint64_t v4 = (void *)(a2 + *(int *)(a3 + 28));
  uint64_t v5 = (void *)(a1 + *(int *)(a3 + 28));
  *uint64_t v5 = *v4;
  v5[1] = v4[1];
  return result;
}

__n128 sub_21DB6C480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 16) - 8) + 32))();
  __n128 result = *(__n128 *)(a2 + *(int *)(a3 + 28));
  *(__n128 *)(a1 + *(int *)(a3 + 28)) = result;
  return result;
}

uint64_t sub_21DB6C4F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 16) - 8) + 40))();
  uint64_t result = a1;
  uint64_t v4 = (void *)(a2 + *(int *)(a3 + 28));
  uint64_t v5 = (void *)(a1 + *(int *)(a3 + 28));
  *uint64_t v5 = *v4;
  v5[1] = v4[1];
  return result;
}

uint64_t sub_21DB6C580()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21DB6C5A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a3 + 16) - 8) + 48))();
}

uint64_t sub_21DB6C5F8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21DB6C620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a4 + 16) - 8) + 56))(a1, a2);
}

uint64_t dispatch thunk of ShockwaveAnimation.timeline.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void *type metadata accessor for DefaultShockewaveAnimation()
{
  return &unk_26CE70130;
}

void *type metadata accessor for FastShockwaveAnimation()
{
  return &unk_26CE70158;
}

uint64_t sub_21DB6C6C8()
{
  return type metadata accessor for ShockwaveAnimationCoordinator();
}

uint64_t sub_21DB6C6E4()
{
  uint64_t updated = sub_21DB6CA7C();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t method lookup function for ShockwaveAnimationCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ShockwaveAnimationCoordinator.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of ShockwaveAnimationCoordinator.$state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ShockwaveAnimationCoordinator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of ShockwaveAnimationCoordinator.waitUntilAnimationCompletes(timeout:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 192) + **(int **)(*(void *)v2 + 192));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_21DB6936C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of ShockwaveAnimationCoordinator.update(using:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of ShockwaveAnimationCoordinator.stopIfNecessary()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t sub_21DB6CA7C()
{
  uint64_t v4 = qword_267D1E670;
  if (!qword_267D1E670)
  {
    sub_21DBACB48();
    unint64_t v3 = sub_21DBAC978();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_267D1E670);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for UIInterfaceOrientationMask()
{
  uint64_t v4 = qword_267D1E678;
  if (!qword_267D1E678)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D1E678);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for SFUIUserInterfaceLayoutDirection()
{
  uint64_t v4 = qword_267D1E680;
  if (!qword_267D1E680)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D1E680);
      return v1;
    }
  }
  return v4;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_21DB6CC7C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      int v3 = *(_OWORD *)a1;
    }
    else {
      int v3 = -1;
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t sub_21DB6CDA8(uint64_t result, int a2, int a3)
{
  BOOL v3 = a3 != 0;
  if (a2)
  {
    *(_OWORD *)__n128 result = (a2 - 1);
    if (a3)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else if (a3)
  {
    if (v3) {
      *(unsigned char *)(result + 16) = 0;
    }
    else {
      __break(1u);
    }
  }
  return result;
}

uint64_t type metadata accessor for CGSize()
{
  uint64_t v4 = qword_267D1E688;
  if (!qword_267D1E688)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D1E688);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for DocumentType()
{
  uint64_t v4 = qword_267D1E690;
  if (!qword_267D1E690)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D1E690);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for DocumentAttributeKey()
{
  uint64_t v4 = qword_267D1E698;
  if (!qword_267D1E698)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D1E698);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for URLResourceKey()
{
  uint64_t v4 = qword_267D1E6A0;
  if (!qword_267D1E6A0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D1E6A0);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_21DB6D220()
{
  return sub_21DB6D238();
}

unint64_t sub_21DB6D238()
{
  uint64_t v2 = qword_267D1E6A8;
  if (!qword_267D1E6A8)
  {
    type metadata accessor for URLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D2BC()
{
  return sub_21DB6D2D4();
}

unint64_t sub_21DB6D2D4()
{
  uint64_t v2 = qword_267D1E6B0;
  if (!qword_267D1E6B0)
  {
    type metadata accessor for URLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6B0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D358()
{
  return sub_21DB6D370();
}

unint64_t sub_21DB6D370()
{
  uint64_t v2 = qword_267D1E6B8;
  if (!qword_267D1E6B8)
  {
    type metadata accessor for DocumentAttributeKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6B8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D3F4()
{
  return sub_21DB6D40C();
}

unint64_t sub_21DB6D40C()
{
  uint64_t v2 = qword_267D1E6C0;
  if (!qword_267D1E6C0)
  {
    type metadata accessor for DocumentAttributeKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D490()
{
  return sub_21DB6D4A8();
}

unint64_t sub_21DB6D4A8()
{
  uint64_t v2 = qword_267D1E6C8;
  if (!qword_267D1E6C8)
  {
    type metadata accessor for DocumentType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6C8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D52C()
{
  return sub_21DB6D544();
}

unint64_t sub_21DB6D544()
{
  uint64_t v2 = qword_267D1E6D0;
  if (!qword_267D1E6D0)
  {
    type metadata accessor for DocumentType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6D0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D5C8()
{
  return sub_21DB6D5E0();
}

unint64_t sub_21DB6D5E0()
{
  uint64_t v2 = qword_267D1E6D8;
  if (!qword_267D1E6D8)
  {
    type metadata accessor for DocumentType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D664()
{
  return sub_21DB6D67C();
}

unint64_t sub_21DB6D67C()
{
  uint64_t v2 = qword_267D1E6E0;
  if (!qword_267D1E6E0)
  {
    type metadata accessor for DocumentAttributeKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D700()
{
  return sub_21DB6D718();
}

unint64_t sub_21DB6D718()
{
  uint64_t v2 = qword_267D1E6E8;
  if (!qword_267D1E6E8)
  {
    type metadata accessor for URLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6E8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D79C()
{
  uint64_t v2 = qword_267D1E6F0;
  if (!qword_267D1E6F0)
  {
    type metadata accessor for URLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6F0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D820()
{
  uint64_t v2 = qword_267D1E6F8;
  if (!qword_267D1E6F8)
  {
    type metadata accessor for DocumentAttributeKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E6F8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D8A4()
{
  uint64_t v2 = qword_267D1E700;
  if (!qword_267D1E700)
  {
    type metadata accessor for DocumentType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E700);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D928()
{
  uint64_t v2 = qword_267D1E708;
  if (!qword_267D1E708)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E708);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6D99C()
{
  uint64_t v2 = qword_267D1E710;
  if (!qword_267D1E710)
  {
    type metadata accessor for DocumentType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E710);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6DA20()
{
  uint64_t v2 = qword_267D1EAF0;
  if (!qword_267D1EAF0)
  {
    type metadata accessor for DocumentAttributeKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EAF0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6DAA4()
{
  uint64_t v2 = qword_267D1E720;
  if (!qword_267D1E720)
  {
    type metadata accessor for URLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E720);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6DB28()
{
  uint64_t v2 = qword_267D1E728;
  if (!qword_267D1E728)
  {
    sub_21DBAD178();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E728);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6DBAC()
{
  uint64_t v2 = qword_267D1E758;
  if (!qword_267D1E758)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1E410);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E758);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB6DC30()
{
  uint64_t v2 = qword_267D1E760;
  if (!qword_267D1E760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1E750);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E760);
    return WitnessTable;
  }
  return v2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

uint64_t sub_21DB6DD2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

unint64_t sub_21DB6DDC4()
{
  uint64_t v2 = qword_267D1E788;
  if (!qword_267D1E788)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1E780);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E788);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21DB6DE48()
{
}

unint64_t sub_21DB6DE74()
{
  uint64_t v2 = qword_267D1E798;
  if (!qword_267D1E798)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1E780);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E798);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DB6DEF8(uint64_t a1)
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E770);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 48))(a1, 1))
  {
    uint64_t v2 = sub_21DBACB48();
    (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
  return a1;
}

uint64_t sub_21DB6DFA8(uint64_t a1)
{
  uint64_t v3 = sub_21DBACB48();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_21DB6E058(uint64_t a1)
{
  uint64_t v1 = sub_21DBACB48();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

__n128 sub_21DB6E0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_21DBACB48();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E770);
  __n128 result = *(__n128 *)(a1 + *(int *)(v3 + 28));
  *(__n128 *)(a2 + *(int *)(v3 + 28)) = result;
  return result;
}

unint64_t sub_21DB6E13C()
{
  uint64_t v2 = qword_267D1E7A0;
  if (!qword_267D1E7A0)
  {
    sub_21DBAD158();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E7A0);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

BOOL static SFRemoteAlertPresentationRequest.PresentationType.== infix(_:_:)(unsigned char *a1, unsigned char *a2)
{
  return ((*a1 & 1) != 0) == (unint64_t)((*a2 & 1) != 0);
}

uint64_t SFRemoteAlertPresentationRequest.PresentationType.hash(into:)()
{
  return sub_21DBAD3B8();
}

uint64_t SFRemoteAlertPresentationRequest.PresentationType.hashValue.getter()
{
  return sub_21DBAD0A8();
}

unint64_t sub_21DB6E36C()
{
  uint64_t v2 = qword_267D1E938;
  if (!qword_267D1E938)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E938);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_21DB6E3EC(unsigned char *a1, unsigned char *a2)
{
  return static SFRemoteAlertPresentationRequest.PresentationType.== infix(_:_:)(a1, a2);
}

uint64_t sub_21DB6E408()
{
  return SFRemoteAlertPresentationRequest.PresentationType.hashValue.getter();
}

uint64_t sub_21DB6E420()
{
  return SFRemoteAlertPresentationRequest.PresentationType.hash(into:)();
}

uint64_t sub_21DB6E438()
{
  return sub_21DBACC78();
}

uint64_t SFRemoteAlertPresentationRequest.id.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SFRemoteAlertPresentationRequest.id.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  *uint64_t v2 = a1;
  v2[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*SFRemoteAlertPresentationRequest.id.modify())()
{
  return sub_21DB6E53C;
}

void SFRemoteAlertPresentationRequest.presentationType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16) & 1;
}

unsigned char *SFRemoteAlertPresentationRequest.presentationType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result & 1;
  return result;
}

void (*SFRemoteAlertPresentationRequest.presentationType.modify())()
{
  return sub_21DB6E53C;
}

void *SFRemoteAlertPresentationRequest.viewControllerToPresent.getter()
{
  uint64_t v3 = *(void **)(v0 + 24);
  id v1 = v3;
  return v3;
}

void SFRemoteAlertPresentationRequest.viewControllerToPresent.setter(void *a1)
{
  id v2 = a1;
  uint64_t v3 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = a1;
}

void (*SFRemoteAlertPresentationRequest.viewControllerToPresent.modify())()
{
  return sub_21DB6E53C;
}

uint64_t SFRemoteAlertPresentationRequest.animated.getter()
{
  return *(unsigned char *)(v0 + 32) & 1;
}

uint64_t SFRemoteAlertPresentationRequest.animated.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result & 1;
  return result;
}

void (*SFRemoteAlertPresentationRequest.animated.modify())()
{
  return sub_21DB6E53C;
}

uint64_t SFRemoteAlertPresentationRequest.contentOverlaysStatusBar.getter()
{
  return *(unsigned char *)(v0 + 33) & 1;
}

uint64_t SFRemoteAlertPresentationRequest.contentOverlaysStatusBar.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 33) = result & 1;
  return result;
}

void (*SFRemoteAlertPresentationRequest.contentOverlaysStatusBar.modify())()
{
  return sub_21DB6E53C;
}

uint64_t SFRemoteAlertPresentationRequest.supportedInterfaceOrientations.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t SFRemoteAlertPresentationRequest.supportedInterfaceOrientations.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

void (*SFRemoteAlertPresentationRequest.supportedInterfaceOrientations.modify())()
{
  return sub_21DB6E53C;
}

uint64_t SFRemoteAlertPresentationRequest.hideViewController.getter()
{
  return *(unsigned char *)(v0 + 48) & 1;
}

uint64_t SFRemoteAlertPresentationRequest.hideViewController.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 48) = result & 1;
  return result;
}

void (*SFRemoteAlertPresentationRequest.hideViewController.modify())()
{
  return sub_21DB6E53C;
}

uint64_t sub_21DB6E878()
{
  uint64_t v7 = sub_21DBAC758();
  uint64_t v4 = *(void *)(v7 - 8);
  uint64_t v5 = v7 - 8;
  unint64_t v3 = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7);
  uint64_t v6 = (char *)&v2 - v3;
  sub_21DBAC748();
  uint64_t v8 = sub_21DBAC738();
  uint64_t v9 = v0;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v7);
  return v8;
}

uint64_t sub_21DB6E950@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  char v9 = *a3;
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = v9 & 1;
  *(void *)(a9 + 24) = a4;
  *(unsigned char *)(a9 + 32) = a5 & 1;
  *(unsigned char *)(a9 + 33) = a6 & 1;
  *(void *)(a9 + 40) = a7;
  *(unsigned char *)(a9 + 48) = a8 & 1;
  return result;
}

uint64_t sub_21DB6E990@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  id v7 = *(id *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  char v9 = *(unsigned char *)(v1 + 49);
  uint64_t v10 = *(void *)(v1 + 56);
  char v11 = *(unsigned char *)(v1 + 64);
  swift_bridgeObjectRetain();
  id v2 = v7;
  uint64_t result = swift_endAccess();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8 & 1;
  *(unsigned char *)(a1 + 33) = v9 & 1;
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = v11 & 1;
  return result;
}

void sub_21DB6EA84(uint64_t a1)
{
  memset(__b, 0, 0x31uLL);
  uint64_t v11 = *(void *)(a1 + 8);
  char v5 = *(unsigned char *)(a1 + 16);
  id v12 = *(id *)(a1 + 24);
  char v6 = *(unsigned char *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 33);
  uint64_t v8 = *(void *)(a1 + 40);
  char v9 = *(unsigned char *)(a1 + 48);
  __b[0] = *(void *)a1;
  uint64_t v4 = __b[0];
  __b[1] = v11;
  LOBYTE(__b[2]) = v5 & 1;
  __b[3] = v12;
  LOBYTE(__b[4]) = v6 & 1;
  BYTE1(__b[4]) = v7 & 1;
  __b[5] = v8;
  LOBYTE(__b[6]) = v9 & 1;
  swift_bridgeObjectRetain();
  id v2 = v12;
  swift_beginAccess();
  id v10 = *(id *)(v1 + 40);
  *(void *)(v1 + 16) = v4;
  *(void *)(v1 + 24) = v11;
  *(unsigned char *)(v1 + 32) = v5 & 1;
  *(void *)(v1 + 40) = v12;
  *(unsigned char *)(v1 + 48) = v6 & 1;
  *(unsigned char *)(v1 + 49) = v7 & 1;
  *(void *)(v1 + 56) = v8;
  *(unsigned char *)(v1 + 64) = v9 & 1;
  swift_bridgeObjectRelease();

  swift_endAccess();
  swift_bridgeObjectRelease();
}

uint64_t (*sub_21DB6EBEC())()
{
  return sub_21DB61FEC;
}

void *sub_21DB6EC50()
{
  swift_beginAccess();
  unint64_t v3 = *(void **)(v0 + 72);
  id v1 = v3;
  swift_endAccess();
  return v3;
}

void sub_21DB6ECAC(void *a1)
{
  id v2 = a1;
  swift_beginAccess();
  unint64_t v3 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = a1;

  swift_endAccess();
}

uint64_t (*sub_21DB6ED24())()
{
  return sub_21DB61FEC;
}

uint64_t sub_21DB6ED88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SFRemoteAlertPresentationRequest.id.getter();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_21DB6EDB8@<X0>(uint64_t (**a1)()@<X8>)
{
  swift_retain();
  uint64_t v7 = sub_21DB6F038();
  uint64_t v8 = v1;
  if (v7)
  {
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v7;
    *(void *)(v2 + 24) = v8;
    uint64_t v4 = sub_21DB76124;
    uint64_t v5 = v2;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  *a1 = v4;
  a1[1] = (uint64_t (*)())v5;
  return swift_release();
}

uint64_t sub_21DB6EEC4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21DB6EEEC(uint64_t *a1)
{
  sub_21DB76018(a1, v7);
  uint64_t v5 = v7[0];
  uint64_t v6 = v7[1];
  if (v7[0])
  {
    uint64_t v1 = swift_allocObject();
    *(void *)(v1 + 16) = v5;
    *(void *)(v1 + 24) = v6;
    unint64_t v3 = sub_21DB760D8;
    uint64_t v4 = v1;
  }
  else
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  swift_retain();
  sub_21DB6F0DC((uint64_t)v3, v4);
  return swift_release();
}

uint64_t sub_21DB6F010(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21DB6F038()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 80);
  sub_21DB6F0A0(v2);
  swift_endAccess();
  return v2;
}

uint64_t sub_21DB6F0A0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_21DB6F0DC(uint64_t a1, uint64_t a2)
{
  sub_21DB6F0A0(a1);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 80);
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  sub_21DB6F16C(v3);
  swift_endAccess();
  return sub_21DB6F16C(a1);
}

uint64_t sub_21DB6F16C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*sub_21DB6F1A8())()
{
  return sub_21DB61FEC;
}

uint64_t sub_21DB6F20C@<X0>(uint64_t (**a1)()@<X8>)
{
  swift_retain();
  uint64_t v7 = sub_21DB6F43C();
  uint64_t v8 = v1;
  if (v7)
  {
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v7;
    *(void *)(v2 + 24) = v8;
    uint64_t v4 = sub_21DB76124;
    uint64_t v5 = v2;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  *a1 = v4;
  a1[1] = (uint64_t (*)())v5;
  return swift_release();
}

uint64_t sub_21DB6F318(uint64_t *a1)
{
  sub_21DB76018(a1, v7);
  uint64_t v5 = v7[0];
  uint64_t v6 = v7[1];
  if (v7[0])
  {
    uint64_t v1 = swift_allocObject();
    *(void *)(v1 + 16) = v5;
    *(void *)(v1 + 24) = v6;
    uint64_t v3 = sub_21DB760D8;
    uint64_t v4 = v1;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  swift_retain();
  sub_21DB6F4A4((uint64_t)v3, v4);
  return swift_release();
}

uint64_t sub_21DB6F43C()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 96);
  sub_21DB6F0A0(v2);
  swift_endAccess();
  return v2;
}

uint64_t sub_21DB6F4A4(uint64_t a1, uint64_t a2)
{
  sub_21DB6F0A0(a1);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 96);
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  sub_21DB6F16C(v3);
  swift_endAccess();
  return sub_21DB6F16C(a1);
}

uint64_t (*sub_21DB6F534())()
{
  return sub_21DB61FEC;
}

uint64_t sub_21DB6F598(unsigned int a1)
{
  char v12 = a1 & 1;
  uint64_t v11 = v1;
  swift_beginAccess();
  char v9 = *(unsigned char *)(v1 + 112);
  swift_endAccess();
  uint64_t result = a1;
  if ((a1 & 1) != (v9 & 1))
  {
    swift_beginAccess();
    char v6 = *(unsigned char *)(v7 + 112);
    uint64_t result = swift_endAccess();
    if (v6)
    {
      v10[0] = sub_21DB6F43C();
      v10[1] = v3;
      if (v10[0])
      {
        uint64_t v5 = (void (*)(void *))v10[0];
        swift_retain();
        uint64_t v4 = sub_21DB6F6FC(v10);
        v5(v4);
        swift_release();
      }
      else
      {
        sub_21DB6F6FC(v10);
      }
      return sub_21DB6F4A4(0, 0);
    }
  }
  return result;
}

void *sub_21DB6F6FC(void *a1)
{
  if (*a1) {
    swift_release();
  }
  return a1;
}

uint64_t sub_21DB6F744()
{
  swift_beginAccess();
  char v2 = *(unsigned char *)(v0 + 112);
  swift_endAccess();
  return v2 & 1;
}

uint64_t sub_21DB6F7A0(char a1)
{
  swift_beginAccess();
  char v4 = *(unsigned char *)(v1 + 112);
  swift_endAccess();
  swift_beginAccess();
  *(unsigned char *)(v1 + 112) = a1 & 1;
  swift_endAccess();
  return sub_21DB6F598(v4 & 1);
}

void (*sub_21DB6F854(void *a1))(uint64_t a1)
{
  char v4 = malloc(0x28uLL);
  *a1 = v4;
  void v4[3] = v1;
  swift_beginAccess();
  char v3 = *(unsigned char *)(v1 + 112);
  swift_endAccess();
  *((unsigned char *)v4 + 32) = v3 & 1;
  return sub_21DB6F8FC;
}

void sub_21DB6F8FC(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  sub_21DB6F7A0(*(unsigned char *)(*(void *)a1 + 32) & 1);
  free(v1);
}

uint64_t sub_21DB6F968()
{
  swift_beginAccess();
  char v2 = *(unsigned char *)(v0 + 113);
  swift_endAccess();
  return v2 & 1;
}

uint64_t sub_21DB6F9C4(char a1)
{
  swift_beginAccess();
  *(unsigned char *)(v1 + 113) = a1 & 1;
  return swift_endAccess();
}

uint64_t (*sub_21DB6FA3C())()
{
  return sub_21DB61FEC;
}

uint64_t sub_21DB6FAA0(uint64_t a1, void *a2)
{
  return sub_21DB6FAF4(a1, a2);
}

uint64_t sub_21DB6FAF4(uint64_t a1, void *a2)
{
  memset(__b, 0, 0x31uLL);
  uint64_t v14 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  id v15 = *(id *)(a1 + 24);
  char v9 = *(unsigned char *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 33);
  uint64_t v11 = *(void *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 48);
  __b[0] = *(void *)a1;
  uint64_t v7 = __b[0];
  __b[1] = v14;
  LOBYTE(__b[2]) = v8 & 1;
  __b[3] = v15;
  LOBYTE(__b[4]) = v9 & 1;
  BYTE1(__b[4]) = v10 & 1;
  __b[5] = v11;
  LOBYTE(__b[6]) = v12 & 1;
  *(void *)(v2 + 80) = 0;
  *(void *)(v2 + 88) = 0;
  *(void *)(v2 + 96) = 0;
  *(void *)(v2 + 104) = 0;
  *(unsigned char *)(v2 + 112) = 0;
  *(unsigned char *)(v2 + 113) = 0;
  swift_bridgeObjectRetain();
  id v3 = v15;
  *(void *)(v2 + 16) = v7;
  *(void *)(v2 + 24) = v14;
  *(unsigned char *)(v2 + 32) = v8 & 1;
  *(void *)(v2 + 40) = v15;
  *(unsigned char *)(v2 + 48) = v9 & 1;
  *(unsigned char *)(v2 + 49) = v10 & 1;
  *(void *)(v2 + 56) = v11;
  *(unsigned char *)(v2 + 64) = v12 & 1;
  id v4 = a2;
  *(void *)(v2 + 72) = a2;

  swift_bridgeObjectRelease();
  return v16;
}

void sub_21DB6FC68(unsigned int a1, uint64_t a2, uint64_t a3)
{
  unsigned int v94 = a1;
  uint64_t v93 = a2;
  uint64_t v92 = a3;
  uint64_t v112 = sub_21DB70908;
  uint64_t v115 = sub_21DB6B8C0;
  uint64_t v117 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v119 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v122 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  uint64_t v85 = sub_21DB70908;
  uint64_t v86 = sub_21DB6B8C0;
  float v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v88 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v89 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  unsigned int v90 = sub_21DB74794;
  char v155 = 0;
  uint64_t v153 = 0;
  uint64_t v154 = 0;
  uint64_t v152 = 0;
  id v147 = 0;
  uint64_t v91 = 0;
  uint64_t v102 = sub_21DBAC8A8();
  uint64_t v100 = *(void **)(v102 - 8);
  uint64_t v101 = v102 - 8;
  uint64_t v96 = v100[8];
  unint64_t v95 = (v96 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v94);
  unint64_t v97 = (char *)&v43 - v95;
  unint64_t v98 = v95;
  char v4 = MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v43 - v98;
  float v99 = (char *)&v43 - v98;
  char v155 = v4 & 1;
  uint64_t v153 = v6;
  uint64_t v154 = v7;
  uint64_t v152 = v8;
  uint64_t v9 = sub_21DB76288();
  float v103 = (void (*)(char *, uint64_t, uint64_t))v100[2];
  uint32_t v104 = v100 + 2;
  v103(v5, v9, v102);
  swift_retain();
  uint64_t v126 = sub_21DBAC888();
  int v127 = sub_21DBACFA8();
  int v107 = &v150;
  uint64_t v150 = 12;
  unint64_t v105 = sub_21DB6A04C();
  unint64_t v106 = sub_21DB6A0C8();
  unint64_t v108 = sub_21DB6A144();
  sub_21DBACDD8();
  uint64_t v10 = v109;
  uint32_t v110 = v151;
  uint64_t v111 = 17;
  uint64_t v114 = 7;
  uint64_t v118 = swift_allocObject();
  *(unsigned char *)(v118 + 16) = 32;
  uint64_t v120 = swift_allocObject();
  *(unsigned char *)(v120 + 16) = 8;
  uint64_t v113 = 32;
  uint64_t v11 = swift_allocObject();
  uint64_t v116 = v11;
  *(void *)(v11 + 16) = v112;
  *(void *)(v11 + 24) = v10;
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v116;
  uint64_t v123 = v12;
  *(void *)(v12 + 16) = v115;
  *(void *)(v12 + 24) = v13;
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
  uint64_t v121 = sub_21DBAD308();
  int v124 = v14;
  swift_retain();
  uint64_t v15 = v118;
  uint64_t v16 = v124;
  *int v124 = v117;
  v16[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v15;
  swift_retain();
  uint64_t v17 = v120;
  BOOL v18 = v124;
  v124[2] = v119;
  v18[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v17;
  swift_retain();
  BOOL v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v123;
  int v20 = v124;
  v124[4] = v122;
  v20[5] = v19;
  sub_21DB6120C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v126, (os_log_type_t)v127))
  {
    uint64_t v21 = v91;
    v78 = (uint8_t *)sub_21DBAD038();
    uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
    uint64_t v79 = sub_21DB6A1C0(0);
    uint64_t v80 = sub_21DB6A1C0(1);
    int v81 = &v132;
    int v132 = v78;
    uint64_t v82 = &v131;
    uint64_t v131 = v79;
    uint64_t v83 = &v130;
    uint64_t v130 = v80;
    sub_21DB6A21C(2, &v132);
    sub_21DB6A21C(1, v81);
    BOOL v128 = v117;
    uint64_t v129 = v118;
    sub_21DB6A230(&v128, (uint64_t)v81, (uint64_t)v82, (uint64_t)v83);
    uint64_t v84 = v21;
    if (v21)
    {
      __break(1u);
    }
    else
    {
      BOOL v128 = v119;
      uint64_t v129 = v120;
      sub_21DB6A230(&v128, (uint64_t)&v132, (uint64_t)&v131, (uint64_t)&v130);
      uint64_t v75 = 0;
      uint64_t v23 = v75;
      BOOL v128 = v122;
      uint64_t v129 = v123;
      sub_21DB6A230(&v128, (uint64_t)&v132, (uint64_t)&v131, (uint64_t)&v130);
      uint64_t v74 = v23;
      _os_log_impl(&dword_21DB23000, v126, (os_log_type_t)v127, "Received request to dismiss remote alert with ID: %s", v78, v110);
      sub_21DB6A27C(v79);
      sub_21DB6A27C(v80);
      sub_21DBAD018();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v76 = v74;
    }
  }
  else
  {
    uint64_t v22 = v91;
    swift_release();
    swift_release();
    swift_release();
    uint64_t v76 = v22;
  }
  uint64_t v69 = v76;

  uint64_t v70 = (void (*)(char *, uint64_t))v100[1];
  uint64_t v71 = v100 + 1;
  v70(v99, v102);
  uint64_t v72 = v148;
  sub_21DB6E990((uint64_t)v148);
  id v73 = v149;
  id v24 = v149;
  sub_21DB745F0((uint64_t)v72);
  id v147 = v73;
  id v146 = objc_msgSend(v73, sel_presentingViewController);
  BOOL v68 = v146 != 0;
  BOOL v67 = v68;
  sub_21DB74628(&v146);
  if (v67)
  {
    if ((sub_21DB6F968() & 1) == 0)
    {
      sub_21DB6F9C4(1);
      sub_21DB6F0A0(v93);
      swift_retain();
      uint64_t v25 = (void *)swift_allocObject();
      uint64_t v26 = v92;
      uint64_t v27 = v109;
      uint64_t v28 = v90;
      v25[2] = v93;
      _DWORD v25[3] = v26;
      v25[4] = v27;
      float v138 = v28;
      float v139 = v25;
      uint64_t aBlock = MEMORY[0x263EF8330];
      int v134 = 1107296256;
      int v135 = 0;
      int v136 = sub_21DB709C8;
      float v137 = &block_descriptor_0;
      unint64_t v66 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v73, sel_dismissViewControllerAnimated_completion_, v94 & 1, v66);
      _Block_release(v66);
    }
  }
  else
  {
    uint64_t v29 = v97;
    uint64_t v30 = sub_21DB76288();
    v103(v29, v30, v102);
    swift_retain();
    float v64 = sub_21DBAC888();
    int v65 = sub_21DBACFA8();
    v144[1] = (unsigned char *)12;
    sub_21DBACDD8();
    uint32_t v54 = v145;
    uint64_t v55 = 17;
    uint64_t v57 = 7;
    uint64_t v59 = swift_allocObject();
    *(unsigned char *)(v59 + 16) = 32;
    uint64_t v60 = swift_allocObject();
    *(unsigned char *)(v60 + 16) = 8;
    uint64_t v56 = 32;
    uint64_t v31 = swift_allocObject();
    uint64_t v32 = v109;
    uint64_t v58 = v31;
    *(void *)(v31 + 16) = v85;
    *(void *)(v31 + 24) = v32;
    uint64_t v33 = swift_allocObject();
    uint64_t v34 = v58;
    uint64_t v62 = v33;
    *(void *)(v33 + 16) = v86;
    *(void *)(v33 + 24) = v34;
    uint64_t v61 = sub_21DBAD308();
    uint64_t v63 = v35;
    swift_retain();
    uint64_t v36 = v59;
    uint64_t v37 = v63;
    *uint64_t v63 = v87;
    v37[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v36;
    swift_retain();
    uint64_t v38 = v60;
    unint64_t v39 = v63;
    v63[2] = v88;
    v39[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v38;
    swift_retain();
    uint64_t v40 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v62;
    uint64_t v41 = v63;
    v63[4] = v89;
    v41[5] = v40;
    sub_21DB6120C();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v64, (os_log_type_t)v65))
    {
      uint64_t v42 = v69;
      unsigned int v47 = (uint8_t *)sub_21DBAD038();
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
      uint64_t v48 = sub_21DB6A1C0(0);
      uint64_t v49 = sub_21DB6A1C0(1);
      CGRect v50 = v144;
      v144[0] = v47;
      uint64_t v51 = &v143;
      uint64_t v143 = v48;
      uint64_t v52 = &v142;
      uint64_t v142 = v49;
      sub_21DB6A21C(2, v144);
      sub_21DB6A21C(1, v50);
      int v140 = v87;
      uint64_t v141 = v59;
      sub_21DB6A230(&v140, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52);
      uint64_t v53 = v42;
      if (v42)
      {
        __break(1u);
      }
      else
      {
        int v140 = v88;
        uint64_t v141 = v60;
        sub_21DB6A230(&v140, (uint64_t)v144, (uint64_t)&v143, (uint64_t)&v142);
        uint64_t v45 = 0;
        int v140 = v89;
        uint64_t v141 = v62;
        sub_21DB6A230(&v140, (uint64_t)v144, (uint64_t)&v143, (uint64_t)&v142);
        _os_log_impl(&dword_21DB23000, v64, (os_log_type_t)v65, "Invalidating handle for remote alert which is not yet presented with ID: %s", v47, v54);
        sub_21DB6A27C(v48);
        sub_21DB6A27C(v49);
        sub_21DBAD018();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    v70(v97, v102);
    id v44 = sub_21DB6EC50();
    objc_msgSend(v44, sel_invalidate);
  }
}

uint64_t sub_21DB708A4()
{
  sub_21DB6E990((uint64_t)v3);
  uint64_t v2 = v3[0];
  id v1 = (id)v3[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_21DB70908()
{
  return sub_21DB708A4();
}

void sub_21DB70910(void (*a1)(void))
{
  sub_21DB6F0A0((uint64_t)a1);
  if (a1)
  {
    a1();
    swift_release();
  }
  id v1 = sub_21DB6EC50();
  objc_msgSend(v1, sel_invalidate);
}

uint64_t sub_21DB709C8(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t SFRemoteAlertPresentationHandle.deinit()
{
  sub_21DB745F0(v0 + 16);

  sub_21DB6F6FC((void *)(v0 + 80));
  sub_21DB6F6FC((void *)(v0 + 96));
  return v2;
}

uint64_t SFRemoteAlertPresentationHandle.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_21DB70AA8()
{
  id v0 = (id)*sub_21DB70AF8();
  return swift_dynamicCastClassUnconditional();
}

uint64_t *sub_21DB70AF8()
{
  if (qword_267D1E3A0 != -1) {
    swift_once();
  }
  return &qword_267D1E930;
}

uint64_t sub_21DB70B5C()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9SharingUI32SFRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_21DB70BC4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC9SharingUI32SFRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21DB70C48())()
{
  return sub_21DB61FEC;
}

uint64_t sub_21DB70CB4(uint64_t a1)
{
  uint64_t v103 = a1;
  uint64_t v122 = sub_21DB74890;
  int v124 = sub_21DB6B8C0;
  BOOL v128 = sub_21DB748E0;
  int v132 = sub_21DB74A80;
  int v134 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  int v136 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  float v138 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  int v140 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v142 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint32_t v145 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
  uint64_t v101 = sub_21DB6BE14;
  id v174 = 0;
  uint64_t v102 = 0;
  id v166 = 0;
  id v165 = 0;
  id v164 = 0;
  uint64_t v162 = 0;
  id v158 = 0;
  uint64_t v156 = 0;
  uint64_t v111 = sub_21DBAC8A8();
  uint64_t v109 = *(void **)(v111 - 8);
  uint64_t v110 = v111 - 8;
  unint64_t v104 = (v109[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v111);
  unint64_t v105 = (char *)&v40 - v104;
  unint64_t v106 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v40 - v104);
  uint64_t v2 = (char *)&v40 - v106;
  int v107 = (char *)&v40 - v106;
  uint64_t v115 = __dst;
  size_t v116 = 49;
  memcpy(__dst, v3, sizeof(__dst));
  id v174 = v108;
  uint64_t v4 = sub_21DB76288();
  uint64_t v112 = (void (*)(char *, uint64_t, uint64_t))v109[2];
  uint64_t v113 = v109 + 2;
  v112(v2, v4, v111);
  sub_21DB74808((uint64_t)v115);
  uint64_t v114 = 65;
  uint64_t v130 = 7;
  uint64_t v123 = swift_allocObject();
  memcpy((void *)(v123 + 16), v115, v116);
  sub_21DB74808((uint64_t)v115);
  uint64_t v131 = swift_allocObject();
  memcpy((void *)(v131 + 16), v115, v116);
  id v149 = sub_21DBAC888();
  int v150 = sub_21DBACFA8();
  uint64_t v119 = &v172;
  uint64_t v172 = 22;
  unint64_t v117 = sub_21DB6A04C();
  unint64_t v118 = sub_21DB6A0C8();
  unint64_t v120 = sub_21DB6A144();
  sub_21DBACDD8();
  uint32_t v121 = v173;
  uint64_t v126 = 17;
  uint64_t v135 = swift_allocObject();
  *(unsigned char *)(v135 + 16) = 32;
  uint64_t v137 = swift_allocObject();
  int v127 = 8;
  *(unsigned char *)(v137 + 16) = 8;
  uint64_t v129 = 32;
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = v123;
  uint64_t v125 = v5;
  *(void *)(v5 + 16) = v122;
  *(void *)(v5 + 24) = v6;
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v125;
  uint64_t v139 = v7;
  *(void *)(v7 + 16) = v124;
  *(void *)(v7 + 24) = v8;
  uint64_t v141 = swift_allocObject();
  *(unsigned char *)(v141 + 16) = 64;
  uint64_t v143 = swift_allocObject();
  *(unsigned char *)(v143 + 16) = v127;
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v131;
  uint64_t v133 = v9;
  *(void *)(v9 + 16) = v128;
  *(void *)(v9 + 24) = v10;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v133;
  uint64_t v146 = v11;
  *(void *)(v11 + 16) = v132;
  *(void *)(v11 + 24) = v12;
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
  uint64_t v144 = sub_21DBAD308();
  id v147 = v13;
  swift_retain();
  uint64_t v14 = v135;
  uint64_t v15 = v147;
  *id v147 = v134;
  v15[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v14;
  swift_retain();
  uint64_t v16 = v137;
  uint64_t v17 = v147;
  v147[2] = v136;
  v17[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v16;
  swift_retain();
  BOOL v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v139;
  BOOL v19 = v147;
  v147[4] = v138;
  v19[5] = v18;
  swift_retain();
  uint64_t v20 = v141;
  uint64_t v21 = v147;
  v147[6] = v140;
  v21[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20;
  swift_retain();
  uint64_t v22 = v143;
  uint64_t v23 = v147;
  v147[8] = v142;
  v23[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v22;
  swift_retain();
  id v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v146;
  uint64_t v25 = v147;
  v147[10] = v145;
  v25[11] = v24;
  sub_21DB6120C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v149, (os_log_type_t)v150))
  {
    uint64_t v26 = v102;
    uint64_t v93 = (uint8_t *)sub_21DBAD038();
    uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
    uint64_t v92 = 1;
    uint64_t v94 = sub_21DB6A1C0(1);
    uint64_t v95 = sub_21DB6A1C0(v92);
    unint64_t v97 = &v155;
    char v155 = v93;
    unint64_t v98 = &v154;
    uint64_t v154 = v94;
    float v99 = &v153;
    uint64_t v153 = v95;
    unsigned int v96 = 2;
    sub_21DB6A21C(2, &v155);
    sub_21DB6A21C(v96, v97);
    uint32_t v151 = v134;
    uint64_t v152 = v135;
    sub_21DB6A230(&v151, (uint64_t)v97, (uint64_t)v98, (uint64_t)v99);
    uint64_t v100 = v26;
    if (v26)
    {
      __break(1u);
    }
    else
    {
      uint32_t v151 = v136;
      uint64_t v152 = v137;
      sub_21DB6A230(&v151, (uint64_t)&v155, (uint64_t)&v154, (uint64_t)&v153);
      uint64_t v89 = 0;
      uint64_t v28 = v89;
      uint32_t v151 = v138;
      uint64_t v152 = v139;
      sub_21DB6A230(&v151, (uint64_t)&v155, (uint64_t)&v154, (uint64_t)&v153);
      uint64_t v88 = v28;
      uint32_t v151 = v140;
      uint64_t v152 = v141;
      sub_21DB6A230(&v151, (uint64_t)&v155, (uint64_t)&v154, (uint64_t)&v153);
      uint64_t v87 = 0;
      uint32_t v151 = v142;
      uint64_t v152 = v143;
      sub_21DB6A230(&v151, (uint64_t)&v155, (uint64_t)&v154, (uint64_t)&v153);
      uint64_t v86 = 0;
      uint32_t v151 = v145;
      uint64_t v152 = v146;
      sub_21DB6A230(&v151, (uint64_t)&v155, (uint64_t)&v154, (uint64_t)&v153);
      uint64_t v85 = 0;
      _os_log_impl(&dword_21DB23000, v149, (os_log_type_t)v150, "Asked to present remote alert using request: %s view controller to present: %@", v93, v121);
      uint64_t v84 = 1;
      sub_21DB6A27C(v94);
      sub_21DB6A27C(v95);
      sub_21DBAD018();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v90 = v85;
    }
  }
  else
  {
    uint64_t v27 = v102;
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v90 = v27;
  }
  uint64_t v80 = v90;

  int v81 = (void (*)(char *, uint64_t))v109[1];
  uint64_t v82 = v109 + 1;
  v81(v107, v111);
  id v83 = objc_msgSend(self, sel_identityOfCurrentProcess);
  if (v83)
  {
    id v79 = v83;
    int v65 = v83;
    id v166 = v83;
    uint64_t v76 = 0;
    sub_21DB74C1C();
    id v29 = v65;
    BOOL v68 = __dst;
    long long v66 = *(_OWORD *)__dst;
    swift_bridgeObjectRetain();
    id v67 = sub_21DB71B58(v65, v66, *((uint64_t *)&v66 + 1));
    id v165 = v67;
    id v69 = objc_msgSend(self, sel_newHandleWithDefinition_configurationContext_, v67, 0);
    id v164 = v69;
    type metadata accessor for SFRemoteAlertPresentationHandle();
    sub_21DB74808((uint64_t)v68);
    uint64_t v70 = v163;
    memcpy(v163, v68, 0x31uLL);
    id v30 = v69;
    uint64_t v71 = sub_21DB6FAA0((uint64_t)v70, v69);
    uint64_t v162 = v71;
    long long v177 = *(_OWORD *)__dst;
    sub_21DB74CAC();
    swift_retain();
    id v73 = &v161;
    uint64_t v161 = v71;
    uint64_t v72 = &v160;
    long long v160 = v177;
    uint64_t v74 = &v159;
    uint64_t v75 = sub_21DB70C48();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E958);
    sub_21DBACC68();
    v75();
    sub_21DB74CD8();
    id v77 = sub_21DB71BA8();
    id v158 = v77;
    uint64_t v176 = *(void *)&__dst[40];
    objc_msgSend(v77, sel_setInitialSupportedInterfaceOrientations_, *(void *)&__dst[40]);
    id v31 = v108;
    int v157 = &unk_26CEB3DA8;
    uint64_t v78 = swift_dynamicCastObjCProtocolConditional();
    if (v78)
    {
      uint64_t v64 = v78;
    }
    else
    {
      uint64_t v63 = 0;

      uint64_t v64 = v63;
    }
    uint64_t v62 = v64;
    if (v64)
    {
      uint64_t v61 = v62;
      uint64_t v60 = v62;
      uint64_t v156 = v62;
      objc_msgSend(v69, sel_registerObserver_);
      swift_unknownObjectRelease();
    }
    id v32 = v77;
    objc_msgSend(v69, sel_activateWithContext_, v77);

    return v71;
  }
  else
  {
    uint64_t v33 = v105;
    uint64_t v34 = sub_21DB76288();
    v112(v33, v34, v111);
    uint64_t v57 = sub_21DBAC888();
    int v56 = sub_21DBACF98();
    v170[1] = (unsigned char *)2;
    sub_21DBACDD8();
    uint32_t v55 = v171;
    uint64_t v58 = sub_21DBAD308();
    if (os_log_type_enabled(v57, (os_log_type_t)v56))
    {
      uint64_t v35 = v80;
      uint64_t v45 = (uint8_t *)sub_21DBAD038();
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
      uint64_t v44 = 0;
      uint64_t v46 = sub_21DB6A1C0(0);
      uint64_t v47 = sub_21DB6A1C0(v44);
      uint64_t v51 = v170;
      v170[0] = v45;
      uint64_t v52 = &v169;
      uint64_t v169 = v46;
      uint64_t v49 = &v168;
      uint64_t v168 = v47;
      unsigned int v48 = 0;
      sub_21DB6A21C(0, v170);
      sub_21DB6A21C(v48, v51);
      uint64_t v167 = v58;
      CGRect v50 = &v40;
      MEMORY[0x270FA5388](&v40);
      uint64_t v36 = v52;
      uint64_t v37 = &v40 - 6;
      uint64_t v53 = &v40 - 6;
      v37[2] = (uint64_t)v51;
      v37[3] = (uint64_t)v36;
      v37[4] = v38;
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E490);
      sub_21DB6BE44();
      sub_21DBACDB8();
      if (v35)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_21DB23000, v57, (os_log_type_t)v56, "Failed to get process identity of the current process, dropping request to present view controller", v45, v55);
        uint64_t v42 = 0;
        sub_21DB6A27C(v46);
        sub_21DB6A27C(v47);
        sub_21DBAD018();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v41 = 0;

    v81(v105, v111);
    return v41;
  }
}

uint64_t sub_21DB71AF4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_21DB71B2C(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 24);
  id v1 = v3;
  return v3;
}

id sub_21DB71B58(void *a1, uint64_t a2, uint64_t a3)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21DB7428C(a1, a2, a3);
}

id sub_21DB71BA8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21DB7434C();
}

uint64_t sub_21DB71BD8(void *a1, char a2, char a3, uint64_t a4, char a5, unsigned char *a6)
{
  char v37 = 0;
  uint64_t v36 = 0;
  memset(__b, 0, sizeof(__b));
  uint64_t v42 = a1;
  char v41 = a2 & 1;
  char v40 = a3 & 1;
  uint64_t v39 = a4;
  char v38 = a5 & 1;
  char v37 = *a6 & 1;
  uint64_t v36 = v6;
  char v27 = v37;
  id v7 = a1;
  uint64_t v8 = sub_21DB6E878();
  sub_21DB6E950(v8, v9, &v27, (uint64_t)a1, a2 & 1, a3 & 1, a4, a5 & 1, (uint64_t)&v28);
  id v17 = v31;
  *(void *)__b = v28;
  *(void *)&__b[8] = v29;
  __b[16] = v30 & 1;
  *(void *)&__b[24] = v31;
  __b[32] = v32 & 1;
  __b[33] = v33 & 1;
  *(void *)&__b[40] = v34;
  __b[48] = v35 & 1;
  v19[0] = v28;
  v19[1] = v29;
  char v20 = v30 & 1;
  uint64_t v21 = v31;
  char v22 = v32 & 1;
  char v23 = v33 & 1;
  uint64_t v24 = v34;
  char v25 = v35 & 1;
  uint64_t v18 = sub_21DB70CB4((uint64_t)v19);
  swift_bridgeObjectRelease();

  return v18;
}

uint64_t sub_21DB71DA0(void *a1, char a2, char a3, uint64_t a4, char a5, char *a6, uint64_t a7, uint64_t a8)
{
  char v18 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v15 = 0;
  char v23 = a1;
  char v22 = a2 & 1;
  char v21 = a3 & 1;
  uint64_t v20 = a4;
  char v19 = a5 & 1;
  char v9 = *a6;
  char v18 = *a6 & 1;
  uint64_t v16 = a7;
  uint64_t v17 = a8;
  uint64_t v15 = v8;
  char v14 = v9 & 1;
  uint64_t v13 = sub_21DB71BD8(a1, a2 & 1, a3 & 1, a4, a5 & 1, &v14);
  swift_retain();
  if (v13)
  {
    sub_21DB6F0A0(a7);
    sub_21DB6F4A4(a7, a8);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21DB71EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1;
  uint64_t v13 = a2;
  uint64_t v11 = v2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_21DB70B5C();
  v9[0] = a1;
  v9[1] = a2;
  uint64_t v3 = type metadata accessor for SFRemoteAlertPresentationHandle();
  MEMORY[0x223C12BC0](&v10, v9, v7, MEMORY[0x263F8D310], v3, MEMORY[0x263F8D320]);
  sub_21DB6C060();
  uint64_t v8 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21DB71F84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v27 = v3;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_21DB70B5C();
  v25[0] = a1;
  v25[1] = a2;
  uint64_t v4 = type metadata accessor for SFRemoteAlertPresentationHandle();
  MEMORY[0x223C12BC0](&v26, v25, v17, MEMORY[0x263F8D310], v4, MEMORY[0x263F8D320]);
  sub_21DB6C060();
  if (v26)
  {
    swift_retain();
    sub_21DB69498();
    sub_21DB6E990((uint64_t)v18);
    uint64_t v10 = v18[0];
    uint64_t v11 = v18[1];
    char v6 = v19;
    uint64_t v12 = v20;
    char v7 = v21;
    char v8 = v22;
    uint64_t v13 = v23;
    char v9 = v24;
    swift_release();
    *(void *)a3 = v10;
    *(void *)(a3 + 8) = v11;
    *(void *)(a3 + 16) = v6 & 1;
    *(void *)(a3 + 24) = v12;
    *(void *)(a3 + 32) = v7 & 1 | ((unint64_t)(v8 & 1) << 8);
    *(void *)(a3 + 40) = v13;
    *(unsigned char *)(a3 + 48) = v9 & 1;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_21DB69498();
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(void *)(a3 + 32) = 0;
    *(void *)(a3 + 40) = 0;
    *(unsigned char *)(a3 + 48) = 0;
  }
  return result;
}

id SFRemoteAlertPresentationManager.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SFRemoteAlertPresentationManager.init()()
{
  id v1 = v0;
  char v8 = v0;
  uint64_t v4 = OBJC_IVAR____TtC9SharingUI32SFRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E9C8);
  sub_21DBAD308();
  type metadata accessor for SFRemoteAlertPresentationHandle();
  *(void *)&v5[v4] = sub_21DBACC38();

  v7.receiver = v8;
  v7.super_class = (Class)type metadata accessor for SFRemoteAlertPresentationManager();
  id v6 = objc_msgSendSuper2(&v7, sel_init);
  id v2 = v6;
  char v8 = v6;

  return v6;
}

id SFRemoteAlertPresentationManager.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFRemoteAlertPresentationManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21DB72300(void *a1)
{
  sub_21DB70B5C();
  type metadata accessor for SFRemoteAlertPresentationHandle();
  sub_21DBACC48();
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E9D0);
  sub_21DB74D94();
  sub_21DBACD98();

  sub_21DB6DE48();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21DB72414()
{
  sub_21DB761B0();
  id v1 = sub_21DB6EC50();
  char v2 = sub_21DBACFF8();

  return v2 & 1;
}

void SFRemoteAlertPresentationManager.remoteAlertHandleDidActivate(_:)(uint64_t a1)
{
  uint64_t v69 = a1;
  uint64_t v58 = sub_21DB70908;
  uint64_t v59 = sub_21DB6B8C0;
  uint64_t v60 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v61 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v62 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  uint64_t v83 = 0;
  uint64_t v82 = 0;
  int v81 = 0;
  uint64_t v80 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = sub_21DBAC8A8();
  uint64_t v65 = *(void *)(v64 - 8);
  uint64_t v66 = v64 - 8;
  unint64_t v67 = (*(void *)(v65 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  BOOL v68 = (char *)&v18 - v67;
  uint64_t v83 = MEMORY[0x270FA5388](v69);
  uint64_t v82 = v1;
  swift_unknownObjectRetain();
  self;
  uint64_t v70 = swift_dynamicCastObjCClass();
  if (v70)
  {
    uint64_t v57 = (void *)v70;
  }
  else
  {
    int v56 = 0;
    swift_unknownObjectRelease();
    uint64_t v57 = v56;
  }
  uint32_t v55 = v57;
  if (v57)
  {
    uint64_t v54 = v55;
    id v52 = v55;
    int v81 = v55;
    uint64_t v53 = sub_21DB72300(v55);
    if (v53)
    {
      uint64_t v51 = v53;
      char v2 = v68;
      uint64_t v39 = v53;
      uint64_t v80 = v53;
      uint64_t v3 = sub_21DB76288();
      (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v2, v3, v64);
      swift_retain();
      uint64_t v49 = sub_21DBAC888();
      int v50 = sub_21DBACFA8();
      uint64_t v36 = &v78;
      uint64_t v78 = 12;
      unint64_t v34 = sub_21DB6A04C();
      unint64_t v35 = sub_21DB6A0C8();
      sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t v37 = v79;
      uint64_t v38 = 17;
      uint64_t v41 = 7;
      uint64_t v43 = swift_allocObject();
      *(unsigned char *)(v43 + 16) = 32;
      uint64_t v44 = swift_allocObject();
      *(unsigned char *)(v44 + 16) = 8;
      uint64_t v40 = 32;
      uint64_t v4 = swift_allocObject();
      uint64_t v5 = v39;
      uint64_t v42 = v4;
      *(void *)(v4 + 16) = v58;
      *(void *)(v4 + 24) = v5;
      uint64_t v6 = swift_allocObject();
      uint64_t v7 = v42;
      uint64_t v46 = v6;
      *(void *)(v6 + 16) = v59;
      *(void *)(v6 + 24) = v7;
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      uint64_t v45 = sub_21DBAD308();
      uint64_t v47 = v8;
      swift_retain();
      uint64_t v9 = v43;
      uint64_t v10 = v47;
      *uint64_t v47 = v60;
      v10[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v9;
      swift_retain();
      uint64_t v11 = v44;
      uint64_t v12 = v47;
      v47[2] = v61;
      v12[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v11;
      swift_retain();
      uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v46;
      char v14 = v47;
      v47[4] = v62;
      v14[5] = v13;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v49, (os_log_type_t)v50))
      {
        uint64_t v15 = v63;
        uint64_t v27 = (uint8_t *)sub_21DBAD038();
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v28 = sub_21DB6A1C0(0);
        uint64_t v29 = sub_21DB6A1C0(1);
        char v30 = &v75;
        uint64_t v75 = v27;
        id v31 = &v74;
        uint64_t v74 = v28;
        char v32 = &v73;
        uint64_t v73 = v29;
        sub_21DB6A21C(2, &v75);
        sub_21DB6A21C(1, v30);
        uint64_t v71 = v60;
        uint64_t v72 = v43;
        sub_21DB6A230(&v71, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32);
        uint64_t v33 = v15;
        if (v15)
        {
          __break(1u);
        }
        else
        {
          uint64_t v71 = v61;
          uint64_t v72 = v44;
          sub_21DB6A230(&v71, (uint64_t)&v75, (uint64_t)&v74, (uint64_t)&v73);
          uint64_t v25 = 0;
          uint64_t v71 = v62;
          uint64_t v72 = v46;
          sub_21DB6A230(&v71, (uint64_t)&v75, (uint64_t)&v74, (uint64_t)&v73);
          _os_log_impl(&dword_21DB23000, v49, (os_log_type_t)v50, "SFRemoteAlertPresentationManager did activate alert for request: %s", v27, v37);
          sub_21DB6A27C(v28);
          sub_21DB6A27C(v29);
          sub_21DBAD018();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v65 + 8))(v68, v64);
      uint64_t v23 = sub_21DB6F038();
      uint64_t v24 = v16;
      if (v23)
      {
        uint64_t v21 = v23;
        uint64_t v22 = v24;
        uint64_t v20 = v24;
        char v19 = (void (*)(uint64_t))v23;
        uint64_t v76 = v23;
        uint64_t v77 = v24;
        uint64_t v17 = swift_retain();
        v19(v17);
        swift_release();
        swift_release();
      }
      swift_release();
    }
    else
    {
    }
  }
}

void SFRemoteAlertPresentationManager.remoteAlertHandleDidDeactivate(_:)(uint64_t a1)
{
  uint64_t v59 = a1;
  uint64_t v48 = sub_21DB70908;
  uint64_t v49 = sub_21DB6B8C0;
  int v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v51 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  id v52 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  uint64_t v71 = 0;
  uint64_t v70 = 0;
  uint64_t v69 = 0;
  uint64_t v68 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = sub_21DBAC8A8();
  uint64_t v55 = *(void *)(v54 - 8);
  uint64_t v56 = v54 - 8;
  unint64_t v57 = (*(void *)(v55 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v58 = (char *)v16 - v57;
  uint64_t v71 = MEMORY[0x270FA5388](v59);
  uint64_t v70 = v1;
  swift_unknownObjectRetain();
  self;
  uint64_t v60 = swift_dynamicCastObjCClass();
  if (v60)
  {
    uint64_t v47 = (void *)v60;
  }
  else
  {
    uint64_t v46 = 0;
    swift_unknownObjectRelease();
    uint64_t v47 = v46;
  }
  uint64_t v45 = v47;
  if (v47)
  {
    uint64_t v44 = v45;
    id v42 = v45;
    uint64_t v69 = v45;
    uint64_t v43 = sub_21DB72300(v45);
    if (v43)
    {
      uint64_t v41 = v43;
      char v2 = v58;
      uint64_t v29 = v43;
      uint64_t v68 = v43;
      uint64_t v3 = sub_21DB76288();
      (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v2, v3, v54);
      swift_retain();
      uint64_t v39 = sub_21DBAC888();
      int v40 = sub_21DBACFA8();
      uint64_t v26 = &v66;
      uint64_t v66 = 12;
      unint64_t v24 = sub_21DB6A04C();
      unint64_t v25 = sub_21DB6A0C8();
      sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t v27 = v67;
      uint64_t v28 = 17;
      uint64_t v31 = 7;
      uint64_t v33 = swift_allocObject();
      *(unsigned char *)(v33 + 16) = 32;
      uint64_t v34 = swift_allocObject();
      *(unsigned char *)(v34 + 16) = 8;
      uint64_t v30 = 32;
      uint64_t v4 = swift_allocObject();
      uint64_t v5 = v29;
      uint64_t v32 = v4;
      *(void *)(v4 + 16) = v48;
      *(void *)(v4 + 24) = v5;
      uint64_t v6 = swift_allocObject();
      uint64_t v7 = v32;
      uint64_t v36 = v6;
      *(void *)(v6 + 16) = v49;
      *(void *)(v6 + 24) = v7;
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      uint64_t v35 = sub_21DBAD308();
      uint32_t v37 = v8;
      swift_retain();
      uint64_t v9 = v33;
      uint64_t v10 = v37;
      *uint32_t v37 = v50;
      v10[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v9;
      swift_retain();
      uint64_t v11 = v34;
      uint64_t v12 = v37;
      v37[2] = v51;
      v12[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v11;
      swift_retain();
      uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v36;
      char v14 = v37;
      v37[4] = v52;
      v14[5] = v13;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v39, (os_log_type_t)v40))
      {
        uint64_t v15 = v53;
        uint64_t v17 = (uint8_t *)sub_21DBAD038();
        v16[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v18 = sub_21DB6A1C0(0);
        uint64_t v19 = sub_21DB6A1C0(1);
        uint64_t v20 = &v65;
        uint64_t v65 = v17;
        uint64_t v21 = &v64;
        uint64_t v64 = v18;
        uint64_t v22 = &v63;
        uint64_t v63 = v19;
        sub_21DB6A21C(2, &v65);
        sub_21DB6A21C(1, v20);
        uint64_t v61 = v50;
        uint64_t v62 = v33;
        sub_21DB6A230(&v61, (uint64_t)v20, (uint64_t)v21, (uint64_t)v22);
        uint64_t v23 = v15;
        if (v15)
        {
          __break(1u);
        }
        else
        {
          uint64_t v61 = v51;
          uint64_t v62 = v34;
          sub_21DB6A230(&v61, (uint64_t)&v65, (uint64_t)&v64, (uint64_t)&v63);
          v16[1] = 0;
          uint64_t v61 = v52;
          uint64_t v62 = v36;
          sub_21DB6A230(&v61, (uint64_t)&v65, (uint64_t)&v64, (uint64_t)&v63);
          _os_log_impl(&dword_21DB23000, v39, (os_log_type_t)v40, "SFRemoteAlertPresentationManager did deactivate for request: %s", v17, v27);
          sub_21DB6A27C(v18);
          sub_21DB6A27C(v19);
          sub_21DBAD018();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v55 + 8))(v58, v54);
      objc_msgSend(v42, sel_invalidate);
      swift_release();
    }
    else
    {
    }
  }
}

void SFRemoteAlertPresentationManager.remoteAlertHandle(_:didInvalidateWithError:)(uint64_t a1, void *a2)
{
  uint64_t v97 = a1;
  id v91 = a2;
  uint64_t v80 = sub_21DB70908;
  int v81 = sub_21DB6B8C0;
  uint64_t v82 = sub_21DB75008;
  uint64_t v83 = sub_21DB75180;
  uint64_t v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v86 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  uint64_t v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v88 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v89 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
  uint64_t v114 = 0;
  uint64_t v113 = 0;
  uint64_t v112 = 0;
  uint64_t v111 = 0;
  uint64_t v110 = 0;
  uint64_t v90 = 0;
  uint64_t v92 = sub_21DBAC8A8();
  uint64_t v93 = *(void *)(v92 - 8);
  uint64_t v94 = v92 - 8;
  unint64_t v95 = (*(void *)(v93 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  unsigned int v96 = (char *)v30 - v95;
  uint64_t v114 = MEMORY[0x270FA5388](v97);
  uint64_t v113 = v3;
  uint64_t v112 = v2;
  swift_unknownObjectRetain();
  self;
  uint64_t v98 = swift_dynamicCastObjCClass();
  if (v98)
  {
    uint32_t v79 = (void *)v98;
  }
  else
  {
    uint64_t v78 = 0;
    swift_unknownObjectRelease();
    uint32_t v79 = v78;
  }
  uint64_t v77 = v79;
  if (v79)
  {
    uint64_t v76 = v77;
    id v74 = v77;
    uint64_t v111 = v77;
    uint64_t v75 = sub_21DB72300(v77);
    if (v75)
    {
      uint64_t v73 = v75;
      uint64_t v4 = v96;
      uint64_t v54 = v75;
      uint64_t v110 = v75;
      uint64_t v5 = sub_21DB76288();
      (*(void (**)(char *, uint64_t, uint64_t))(v93 + 16))(v4, v5, v92);
      swift_retain();
      id v6 = v91;
      uint64_t v59 = 7;
      uint64_t v60 = swift_allocObject();
      *(void *)(v60 + 16) = v91;
      sub_21DB7422C();
      swift_bridgeObjectRelease();
      uint64_t v71 = sub_21DBAC888();
      int v72 = sub_21DBACFA8();
      id v52 = &v108;
      uint64_t v108 = 22;
      unint64_t v50 = sub_21DB6A04C();
      unint64_t v51 = sub_21DB6A0C8();
      sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t v53 = v109;
      uint64_t v56 = 17;
      uint64_t v62 = swift_allocObject();
      *(unsigned char *)(v62 + 16) = 32;
      uint64_t v63 = swift_allocObject();
      int v57 = 8;
      *(unsigned char *)(v63 + 16) = 8;
      uint64_t v58 = 32;
      uint64_t v7 = swift_allocObject();
      uint64_t v8 = v54;
      uint64_t v55 = v7;
      *(void *)(v7 + 16) = v80;
      *(void *)(v7 + 24) = v8;
      uint64_t v9 = swift_allocObject();
      uint64_t v10 = v55;
      uint64_t v64 = v9;
      *(void *)(v9 + 16) = v81;
      *(void *)(v9 + 24) = v10;
      uint64_t v65 = swift_allocObject();
      *(unsigned char *)(v65 + 16) = 64;
      uint64_t v66 = swift_allocObject();
      *(unsigned char *)(v66 + 16) = v57;
      uint64_t v11 = swift_allocObject();
      uint64_t v12 = v60;
      uint64_t v61 = v11;
      *(void *)(v11 + 16) = v82;
      *(void *)(v11 + 24) = v12;
      uint64_t v13 = swift_allocObject();
      uint64_t v14 = v61;
      uint64_t v68 = v13;
      *(void *)(v13 + 16) = v83;
      *(void *)(v13 + 24) = v14;
      uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      uint64_t v67 = sub_21DBAD308();
      uint64_t v69 = v15;
      swift_retain();
      uint64_t v16 = v62;
      uint64_t v17 = v69;
      *uint64_t v69 = v84;
      v17[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v16;
      swift_retain();
      uint64_t v18 = v63;
      uint64_t v19 = v69;
      v69[2] = v85;
      v19[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18;
      swift_retain();
      uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v64;
      uint64_t v21 = v69;
      v69[4] = v86;
      v21[5] = v20;
      swift_retain();
      uint64_t v22 = v65;
      uint64_t v23 = v69;
      v69[6] = v87;
      v23[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v22;
      swift_retain();
      uint64_t v24 = v66;
      unint64_t v25 = v69;
      v69[8] = v88;
      v25[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v24;
      swift_retain();
      uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v68;
      uint32_t v27 = v69;
      v69[10] = v89;
      v27[11] = v26;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v71, (os_log_type_t)v72))
      {
        uint64_t v28 = v90;
        id v42 = (uint8_t *)sub_21DBAD038();
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v41 = 1;
        uint64_t v43 = sub_21DB6A1C0(1);
        uint64_t v44 = sub_21DB6A1C0(v41);
        uint64_t v46 = &v103;
        uint64_t v103 = v42;
        uint64_t v47 = &v102;
        uint64_t v102 = v43;
        uint64_t v48 = &v101;
        uint64_t v101 = v44;
        unsigned int v45 = 2;
        sub_21DB6A21C(2, &v103);
        sub_21DB6A21C(v45, v46);
        float v99 = v84;
        uint64_t v100 = v62;
        sub_21DB6A230(&v99, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48);
        uint64_t v49 = v28;
        if (v28)
        {
          __break(1u);
        }
        else
        {
          float v99 = v85;
          uint64_t v100 = v63;
          sub_21DB6A230(&v99, (uint64_t)&v103, (uint64_t)&v102, (uint64_t)&v101);
          uint64_t v39 = 0;
          uint64_t v29 = v39;
          float v99 = v86;
          uint64_t v100 = v64;
          sub_21DB6A230(&v99, (uint64_t)&v103, (uint64_t)&v102, (uint64_t)&v101);
          uint64_t v38 = v29;
          float v99 = v87;
          uint64_t v100 = v65;
          sub_21DB6A230(&v99, (uint64_t)&v103, (uint64_t)&v102, (uint64_t)&v101);
          uint64_t v37 = 0;
          float v99 = v88;
          uint64_t v100 = v66;
          sub_21DB6A230(&v99, (uint64_t)&v103, (uint64_t)&v102, (uint64_t)&v101);
          uint64_t v36 = 0;
          float v99 = v89;
          uint64_t v100 = v68;
          sub_21DB6A230(&v99, (uint64_t)&v103, (uint64_t)&v102, (uint64_t)&v101);
          _os_log_impl(&dword_21DB23000, v71, (os_log_type_t)v72, "SFRemoteAlertPresentationManager did invalidate for request: %s with error: %@", v42, v53);
          uint64_t v35 = 1;
          sub_21DB6A27C(v43);
          sub_21DB6A27C(v44);
          sub_21DBAD018();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v93 + 8))(v96, v92);
      sub_21DB6E990((uint64_t)v107);
      v30[0] = v107[0];
      uint64_t v32 = v107[1];
      id v33 = (id)v107[3];
      swift_bridgeObjectRetain();
      v30[2] = &v106;
      uint64_t v106 = 0;
      v30[1] = v105;
      v105[0] = v30[0];
      v105[1] = v32;
      v30[3] = &v104;
      uint64_t v31 = sub_21DB70C48();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E958);
      sub_21DBACC68();
      int v34 = 1;
      v31();
      swift_bridgeObjectRelease();

      sub_21DB6F7A0(v34 & 1);
      swift_release();
    }
    else
    {
    }
  }
}

void *sub_21DB74204(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t sub_21DB7422C()
{
  return sub_21DBACD38();
}

id sub_21DB74258()
{
  type metadata accessor for SFRemoteAlertPresentationManager();
  id result = SFRemoteAlertPresentationManager.__allocating_init()();
  qword_267D1E930 = (uint64_t)result;
  return result;
}

id sub_21DB7428C(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = sub_21DBACCC8();
    swift_bridgeObjectRelease();
    id v6 = (void *)v5;
  }
  else
  {
    id v6 = 0;
  }
  id v4 = objc_msgSend(v8, sel_initWithSceneProvidingProcess_configurationIdentifier_, a1);

  return v4;
}

id sub_21DB7434C()
{
  return objc_msgSend(v0, sel_init);
}

uint64_t sub_21DB74370(uint64_t (*a1)(void))
{
  id v2 = (id)a1();
  uint64_t v3 = sub_21DB74438((void (*)(uint64_t *__return_ptr, void **))sub_21DB743F4, 0, v2);

  return v3;
}

uint64_t sub_21DB743F4@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2 = *a1;
  uint64_t result = _swift_stdlib_bridgeErrorToNSError();
  *a2 = result;
  return result;
}

uint64_t sub_21DB74438(void (*a1)(uint64_t *__return_ptr, void **), uint64_t a2, void *a3)
{
  if (!a3) {
    return 0;
  }
  uint64_t v9 = a3;
  id v3 = a3;
  a1(&v10, &v9);
  if (v8)
  {

    return v5;
  }

  return v10;
}

uint64_t sub_21DB74518()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74544()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74570()
{
  return swift_deallocObject();
}

uint64_t sub_21DB745B0()
{
  return swift_deallocObject();
}

uint64_t sub_21DB745F0(uint64_t a1)
{
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21DB74628(id *a1)
{
}

uint64_t sub_21DB74654()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74680()
{
  return swift_deallocObject();
}

uint64_t sub_21DB746AC()
{
  return swift_deallocObject();
}

uint64_t sub_21DB746EC()
{
  return swift_deallocObject();
}

uint64_t sub_21DB7472C()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();
  return swift_deallocObject();
}

void sub_21DB74794()
{
  sub_21DB70910(*(void (**)(void))(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_21DB74808(uint64_t a1)
{
  id v3 = *(id *)(a1 + 24);
  swift_bridgeObjectRetain();
  id v1 = v3;
  return a1;
}

uint64_t sub_21DB74848()
{
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_21DB74890()
{
  return sub_21DB71AF4((uint64_t *)(v0 + 16));
}

uint64_t sub_21DB74898()
{
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void *sub_21DB748E0()
{
  return sub_21DB71B2C(v0 + 16);
}

uint64_t sub_21DB748E8()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74914()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74940()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74980()
{
  return swift_deallocObject();
}

uint64_t sub_21DB749C0()
{
  return swift_deallocObject();
}

uint64_t sub_21DB749EC()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74A18(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21DB74A40()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74A80()
{
  return sub_21DB74A18(*(uint64_t (**)(void))(v0 + 16));
}

void sub_21DB74A8C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v7 = (id)a4();
  uint64_t v8 = *a1;
  sub_21DBAD058();
  *a1 = v8 + 8;
  uint64_t v4 = *a2;
  if (*a2)
  {
    *uint64_t v4 = v7;
    *a2 = v4 + 1;
  }
  else
  {
  }
}

uint64_t sub_21DB74BD0()
{
  return swift_deallocObject();
}

void sub_21DB74C10(uint64_t *a1, void **a2, uint64_t a3)
{
  sub_21DB74A8C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_21DB74C1C()
{
  uint64_t v2 = qword_267D1E950;
  if (!qword_267D1E950)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1E950);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for SFRemoteAlertPresentationHandle()
{
  return self;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21DB74CAC()
{
}

unint64_t sub_21DB74CD8()
{
  uint64_t v2 = qword_267D1E960;
  if (!qword_267D1E960)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1E960);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for SFRemoteAlertPresentationManager()
{
  return self;
}

uint64_t sub_21DB74D68()
{
  return sub_21DB72414() & 1;
}

unint64_t sub_21DB74D94()
{
  uint64_t v2 = qword_267D1E9D8;
  if (!qword_267D1E9D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1E9D0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E9D8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DB74E18()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74E44()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74E70()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74EB0()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74EF0()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74F1C()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74F48()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74F88()
{
  return swift_deallocObject();
}

uint64_t sub_21DB74FC8()
{
  return swift_deallocObject();
}

void *sub_21DB75008()
{
  return sub_21DB74204(*(void **)(v0 + 16));
}

uint64_t sub_21DB75010()
{
  return swift_deallocObject();
}

uint64_t sub_21DB7503C()
{
  return swift_deallocObject();
}

uint64_t sub_21DB75068()
{
  return swift_deallocObject();
}

uint64_t sub_21DB750A8()
{
  return swift_deallocObject();
}

uint64_t sub_21DB750E8()
{
  return swift_deallocObject();
}

uint64_t sub_21DB75114()
{
  return swift_deallocObject();
}

uint64_t sub_21DB75140()
{
  return swift_deallocObject();
}

uint64_t sub_21DB75180()
{
  return sub_21DB74370(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_21DB7518C()
{
  return swift_deallocObject();
}

unint64_t sub_21DB751CC()
{
  return sub_21DB751E4();
}

unint64_t sub_21DB751E4()
{
  uint64_t v2 = qword_267D1E9E0;
  if (!qword_267D1E9E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1E9E0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DB75264()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_21DB75270@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_21DB6EDB8(a1);
}

uint64_t sub_21DB75288(uint64_t *a1)
{
  return sub_21DB6EEEC(a1);
}

uint64_t sub_21DB752A0@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_21DB6F20C(a1);
}

uint64_t sub_21DB752B8(uint64_t *a1)
{
  return sub_21DB6F318(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for SFRemoteAlertPresentationRequest(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

void destroy for SFRemoteAlertPresentationRequest(uint64_t a1)
{
}

uint64_t initializeWithCopy for SFRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16) & 1;
  uint64_t v5 = *(void **)(a2 + 24);
  id v2 = v5;
  uint64_t result = a1;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return result;
}

uint64_t assignWithCopy for SFRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16) & 1;
  id v6 = *(void **)(a2 + 24);
  id v2 = v6;
  uint64_t v3 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v6;

  uint64_t result = a1;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32) & 1;
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33) & 1;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48) & 1;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy49_8(void *a1, const void *a2)
{
}

uint64_t assignWithTake for SFRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16) & 1;
  id v2 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  uint64_t result = a1;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32) & 1;
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33) & 1;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48) & 1;
  return result;
}

uint64_t getEnumTagSinglePayload for SFRemoteAlertPresentationRequest(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 49))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)(a1 + 8))) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SFRemoteAlertPresentationRequest(uint64_t result, int a2, int a3)
{
  int v3 = (unsigned char *)(result + 49);
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 8) = 0;
    *(void *)uint64_t result = a2 + 0x80000000;
    *(unsigned char *)(result + 48) = 0;
    if (a3 < 0) {
      *int v3 = 1;
    }
  }
  else
  {
    if (a3 < 0) {
      *int v3 = 0;
    }
    if (a2) {
      *(void *)(result + 8) = (a2 - 1);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SFRemoteAlertPresentationRequest()
{
  return &type metadata for SFRemoteAlertPresentationRequest;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SFRemoteAlertPresentationRequest.PresentationType(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 1) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SFRemoteAlertPresentationRequest.PresentationType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 1) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_21DB75C58(unsigned char *a1)
{
  return *a1 & 1;
}

unsigned char *sub_21DB75C68(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SFRemoteAlertPresentationRequest.PresentationType()
{
  return &type metadata for SFRemoteAlertPresentationRequest.PresentationType;
}

uint64_t method lookup function for SFRemoteAlertPresentationHandle()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onActivate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onActivate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onActivate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onDismiss.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onDismiss.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.onDismiss.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationHandle.dismiss(animated:completion:)(char a1)
{
  return (*(uint64_t (**)(void))(*(void *)v1 + 280))(a1 & 1);
}

uint64_t method lookup function for SFRemoteAlertPresentationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SFRemoteAlertPresentationManager.shared.getter()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:hideViewController:presentationType:)(uint64_t a1, char a2, char a3, uint64_t a4, char a5)
{
  return (*(uint64_t (**)(uint64_t, void, void, uint64_t, void))((*v5 & *MEMORY[0x263F8EED0]) + 0x80))(a1, a2 & 1, a3 & 1, a4, a5 & 1);
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:hideViewController:presentationType:onDismiss:)(uint64_t a1, char a2, char a3, uint64_t a4, char a5)
{
  return (*(uint64_t (**)(uint64_t, void, void, uint64_t, void))((*v5 & *MEMORY[0x263F8EED0]) + 0x88))(a1, a2 & 1, a3 & 1, a4, a5 & 1);
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.presentationHandle(for:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x90))();
}

uint64_t dispatch thunk of SFRemoteAlertPresentationManager.presentationRequest(for:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x98))();
}

void *type metadata accessor for SFRemoteAlertPresentationManager.Static()
{
  return &unk_26CE709D0;
}

void *sub_21DB76018(uint64_t *a1, void *a2)
{
  if (*a1)
  {
    uint64_t v3 = *a1;
    uint64_t v4 = a1[1];
    swift_retain();
    *a2 = v3;
    a2[1] = v4;
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
  }
  return a2;
}

uint64_t sub_21DB76098()
{
  return swift_deallocObject();
}

uint64_t sub_21DB760D8()
{
  return sub_21DB6F010(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_21DB760E4()
{
  return swift_deallocObject();
}

uint64_t sub_21DB76124()
{
  return sub_21DB6EEC4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_21DB76130()
{
  return swift_deallocObject();
}

uint64_t sub_21DB76170()
{
  return swift_deallocObject();
}

unint64_t sub_21DB761B0()
{
  uint64_t v2 = qword_267D1E9F0;
  if (!qword_267D1E9F0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1E9F0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_21DB76218()
{
  if (qword_267D1E3B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21DBAC8A8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_267D1FD58);
}

uint64_t sub_21DB76288()
{
  if (qword_267D1E3A8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21DBAC8A8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_267D1FD40);
}

uint64_t sub_21DB762F8()
{
  uint64_t v1 = sub_21DBAC8A8();
  __swift_allocate_value_buffer(v1, qword_267D1FD40);
  __swift_project_value_buffer(v1, (uint64_t)qword_267D1FD40);
  sub_21DBACD38();
  sub_21DBACD38();
  return sub_21DBAC898();
}

uint64_t sub_21DB7639C()
{
  uint64_t v1 = sub_21DBAC8A8();
  __swift_allocate_value_buffer(v1, qword_267D1FD58);
  __swift_project_value_buffer(v1, (uint64_t)qword_267D1FD58);
  sub_21DBACD38();
  sub_21DBACD38();
  return sub_21DBAC898();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  unsigned int v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_21DB7654C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21DB765C0(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_21DB765C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_bridgeObjectRetain();
  v6[2] = a1;
  v6[3] = a2;
  swift_bridgeObjectRetain();
  v6[4] = a3;
  v6[5] = a4;
  swift_bridgeObjectRetain();
  v6[6] = a5;
  v6[7] = a6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_21DB766A0()
{
  type metadata accessor for TTRReportComponent();
  uint64_t v7 = sub_21DBACD38();
  uint64_t v8 = v0;
  uint64_t v5 = sub_21DBACD38();
  uint64_t v6 = v1;
  uint64_t v2 = sub_21DBACD38();
  return sub_21DB7654C(v7, v8, v5, v6, v2, v3);
}

uint64_t type metadata accessor for TTRReportComponent()
{
  return self;
}

uint64_t sub_21DB76784()
{
  sub_21DB6C060();
  sub_21DB6C060();
  sub_21DB6C060();
  return v1;
}

uint64_t sub_21DB767D0()
{
  return swift_deallocClassInstance();
}

id sub_21DB76810()
{
  type metadata accessor for TTRReport();
  uint64_t v7 = sub_21DBACD38();
  uint64_t v4 = v0;
  uint64_t v5 = sub_21DBACD38();
  uint64_t v6 = v1;
  type metadata accessor for TTRReportComponent();
  uint64_t v2 = sub_21DB766A0();
  return sub_21DB768F0(v7, v4, v5, v6, v2);
}

uint64_t type metadata accessor for TTRReport()
{
  return self;
}

id sub_21DB768F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = objc_allocWithZone(v5);
  return sub_21DB76998(a1, a2, a3, a4, a5);
}

id sub_21DB76998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v21 = a5;
  id v6 = v5;
  id v7 = v5;
  id v8 = v5;
  id v26 = v5;
  swift_bridgeObjectRetain();
  uint64_t v9 = &v15[OBJC_IVAR___TTRReport_title];
  *(void *)uint64_t v9 = a1;
  *((void *)v9 + 1) = a2;

  swift_bridgeObjectRetain();
  uint64_t v10 = &v15[OBJC_IVAR___TTRReport_desc];
  *(void *)uint64_t v10 = a3;
  *((void *)v10 + 1) = a4;

  swift_retain();
  *(void *)&v15[OBJC_IVAR___TTRReport_component] = a5;

  v20.receiver = v26;
  v20.super_class = (Class)type metadata accessor for TTRReport();
  id v19 = objc_msgSendSuper2(&v20, sel_init);
  id v11 = v19;
  id v26 = v19;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v19;
}

id sub_21DB76B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_21DBACD38();
  uint64_t v8 = v3;
  swift_retain();
  id v11 = sub_21DB768F0(a1, a2, v7, v8, a3);
  id v4 = v11;
  swift_release();
  swift_bridgeObjectRelease();

  return v11;
}

id sub_21DB76BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21DBACD38();
  uint64_t v7 = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  id v11 = sub_21DB768F0(v6, v7, a1, a2, a3);
  id v4 = v11;
  swift_release();
  swift_bridgeObjectRelease();

  return v11;
}

id sub_21DB76C78(uint64_t a1)
{
  uint64_t v5 = sub_21DBACD38();
  uint64_t v6 = v1;
  uint64_t v7 = sub_21DBACD38();
  uint64_t v8 = v2;
  swift_retain();
  id v10 = sub_21DB768F0(v5, v6, v7, v8, a1);
  id v3 = v10;
  swift_release();

  return v10;
}

uint64_t sub_21DB76D38()
{
  if (!"SharingUI.TTRReport")
  {
    sub_21DBAD1B8();
    __break(1u);
  }
  uint64_t result = sub_21DBA65F8((uint64_t)"SharingUI.TTRReport", 19, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/TTRReporter.swift", 27, 2, v1, 0x1FuLL, 7uLL);
  __break(1u);
  return result;
}

id sub_21DB76E70()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRReport();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_21DB76F20(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return sub_21DB76F5C(a1);
}

id sub_21DB76F5C(void *a1)
{
  id v10 = a1;
  id v2 = v1;
  id v11 = v1;
  id v3 = a1;
  *(void *)&v6[OBJC_IVAR___TTRReporter_report] = a1;

  v9.receiver = v11;
  v9.super_class = (Class)type metadata accessor for TTRReporter();
  id v8 = objc_msgSendSuper2(&v9, sel_init);
  id v4 = v8;
  id v11 = v8;

  return v8;
}

uint64_t type metadata accessor for TTRReporter()
{
  return self;
}

uint64_t sub_21DB77070()
{
  uint64_t v167 = 0;
  int v150 = sub_21DB6BE14;
  uint32_t v151 = sub_21DB7A058;
  uint64_t v152 = sub_21DB7A110;
  uint64_t v153 = sub_21DB6B8C0;
  uint64_t v154 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  char v155 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v156 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  int v157 = sub_21DB75008;
  id v158 = sub_21DB79F00;
  uint64_t v159 = sub_21DB74A80;
  long long v160 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v161 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v162 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
  uint64_t v163 = "Fatal error";
  id v164 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  id v165 = "SharingUI/TTRReporter.swift";
  v209[1] = *MEMORY[0x263EF8340];
  uint64_t v202 = 0;
  v201 = 0;
  uint64_t v166 = 0;
  id v196 = 0;
  uint64_t v168 = sub_21DBAC8A8();
  uint64_t v169 = *(void *)(v168 - 8);
  uint64_t v170 = v168 - 8;
  unint64_t v171 = (*(void *)(v169 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](0);
  uint64_t v172 = (char *)v53 - v171;
  unint64_t v173 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  id v174 = (char *)v53 - v173;
  unint64_t v175 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v3);
  uint64_t v176 = (char *)v53 - v175;
  uint64_t v202 = v0;
  uint64_t v185 = sub_21DBAC708();
  uint64_t v182 = *(void *)(v185 - 8);
  uint64_t v183 = v185 - 8;
  uint64_t v177 = v182;
  uint64_t v178 = *(void *)(v182 + 64);
  unint64_t v179 = (v178 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v185);
  uint64_t v180 = (char *)v53 - v179;
  v201 = (char *)v53 - v179;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0);
  unint64_t v181 = (*(void *)(*(void *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5);
  uint64_t v184 = (uint64_t)v53 - v181;
  sub_21DB78A3C((char *)v53 - v181);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v182 + 48))(v184, 1, v185) == 1)
  {
    id v26 = v174;
    sub_21DB79AD0(v184);
    uint64_t v27 = sub_21DB76288();
    (*(void (**)(char *, uint64_t, uint64_t))(v169 + 16))(v26, v27, v168);
    uint64_t v100 = sub_21DBAC888();
    int v99 = sub_21DBACF98();
    uint64_t v97 = &v199;
    uint64_t v199 = 2;
    unint64_t v95 = sub_21DB6A04C();
    unint64_t v96 = sub_21DB6A0C8();
    sub_21DB6A144();
    sub_21DBACDD8();
    uint32_t v98 = v200;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
    uint64_t v101 = (void *)sub_21DBAD308();
    if (os_log_type_enabled(v100, (os_log_type_t)v99))
    {
      uint64_t v28 = v166;
      uint64_t v85 = (uint8_t *)sub_21DBAD038();
      uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
      uint64_t v84 = 0;
      uint64_t v86 = sub_21DB6A1C0(0);
      uint64_t v87 = sub_21DB6A1C0(v84);
      id v91 = &v198;
      v198 = v85;
      uint64_t v92 = v209;
      v209[0] = v86;
      uint64_t v89 = &v208;
      uint64_t v208 = v87;
      unsigned int v88 = 0;
      sub_21DB6A21C(0, &v198);
      sub_21DB6A21C(v88, v91);
      v197[1] = v101;
      uint64_t v90 = v53;
      MEMORY[0x270FA5388](v53);
      uint64_t v29 = v92;
      uint64_t v30 = &v53[-6];
      uint64_t v93 = &v53[-6];
      v30[2] = v91;
      v30[3] = v29;
      void v30[4] = v31;
      uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E490);
      sub_21DB6BE44();
      sub_21DBACDB8();
      if (v28)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_21DB23000, v100, (os_log_type_t)v99, "TTR: failed getting a scheme url to report.", v85, v98);
        uint64_t v82 = 0;
        sub_21DB6A27C(v86);
        sub_21DB6A27C(v87);
        sub_21DBAD018();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v169 + 8))(v174, v168);
  }
  else
  {
    id v147 = *(void (**)(char *, uint64_t, uint64_t))(v182 + 32);
    uint64_t v148 = v182 + 32;
    v147(v180, v184, v185);
    v207 = 0;
    id v149 = objc_msgSend(self, sel_defaultWorkspace);
    if (v149)
    {
      uint64_t v146 = v149;
    }
    else
    {
      char v50 = 2;
      uint64_t v51 = 72;
      int v52 = 0;
      sub_21DBAD1B8();
      __break(1u);
    }
    id v144 = v146;
    uint64_t v141 = v53;
    unint64_t v135 = (v178 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](v53);
    float v138 = (char *)v53 - v135;
    int v136 = *(void (**)(char *))(v182 + 16);
    uint64_t v137 = v182 + 16;
    v136((char *)v53 - v135);
    id v143 = (id)sub_21DBAC688();
    uint64_t v139 = *(void (**)(char *, uint64_t))(v182 + 8);
    uint64_t v140 = v182 + 8;
    v139(v138, v185);
    v197[0] = v207;
    id v145 = objc_msgSend(v144, sel_openURL_configuration_error_, v143, 0, v197);
    id v142 = v197[0];
    id v6 = v197[0];
    uint64_t v7 = v207;
    v207 = v142;

    if (v145)
    {
      id v134 = v145;
      id v8 = v176;
      id v111 = v145;
      sub_21DBACC28();
      swift_bridgeObjectRelease();

      uint64_t v9 = sub_21DB76288();
      (*(void (**)(char *, uint64_t, uint64_t))(v169 + 16))(v8, v9, v168);
      uint64_t v115 = v53;
      unint64_t v112 = (v178 + 15) & 0xFFFFFFFFFFFFFFF0;
      MEMORY[0x270FA5388](v53);
      uint64_t v114 = (char *)v53 - v112;
      v10();
      unint64_t v113 = (*(unsigned __int8 *)(v177 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v177 + 80);
      uint64_t v123 = 7;
      uint64_t v116 = swift_allocObject();
      v147((char *)(v116 + v113), (uint64_t)v114, v185);
      swift_retain();
      uint64_t v122 = 32;
      uint64_t v11 = swift_allocObject();
      uint64_t v12 = v116;
      uint64_t v124 = v11;
      *(void *)(v11 + 16) = v151;
      *(void *)(v11 + 24) = v12;
      swift_release();
      int v132 = sub_21DBAC888();
      int v133 = sub_21DBACFA8();
      uint64_t v119 = &v189;
      uint64_t v189 = 12;
      unint64_t v117 = sub_21DB6A04C();
      unint64_t v118 = sub_21DB6A0C8();
      sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t v120 = v190;
      uint64_t v121 = 17;
      uint64_t v126 = swift_allocObject();
      *(unsigned char *)(v126 + 16) = 32;
      uint64_t v127 = swift_allocObject();
      *(unsigned char *)(v127 + 16) = 8;
      uint64_t v13 = swift_allocObject();
      uint64_t v14 = v124;
      uint64_t v125 = v13;
      *(void *)(v13 + 16) = v152;
      *(void *)(v13 + 24) = v14;
      uint64_t v15 = swift_allocObject();
      uint64_t v16 = v125;
      uint64_t v129 = v15;
      *(void *)(v15 + 16) = v153;
      *(void *)(v15 + 24) = v16;
      uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      uint64_t v128 = sub_21DBAD308();
      uint64_t v130 = v17;
      swift_retain();
      uint64_t v18 = v126;
      id v19 = v130;
      *uint64_t v130 = v154;
      v19[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18;
      swift_retain();
      uint64_t v20 = v127;
      uint64_t v21 = v130;
      v130[2] = v155;
      v21[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20;
      swift_retain();
      uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v129;
      uint64_t v23 = v130;
      v130[4] = v156;
      void v23[5] = v22;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v132, (os_log_type_t)v133))
      {
        uint64_t v24 = v166;
        char v104 = (uint8_t *)sub_21DBAD038();
        uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v105 = sub_21DB6A1C0(0);
        uint64_t v106 = sub_21DB6A1C0(1);
        int v107 = &v188;
        uint64_t v188 = v104;
        uint64_t v108 = &v204;
        uint64_t v204 = v105;
        uint32_t v109 = &v203;
        uint64_t v203 = v106;
        sub_21DB6A21C(2, &v188);
        sub_21DB6A21C(1, v107);
        uint64_t v186 = v154;
        uint64_t v187 = v126;
        sub_21DB6A230(&v186, (uint64_t)v107, (uint64_t)v108, (uint64_t)v109);
        uint64_t v110 = v24;
        if (v24)
        {
          __break(1u);
        }
        else
        {
          uint64_t v186 = v155;
          uint64_t v187 = v127;
          sub_21DB6A230(&v186, (uint64_t)&v188, (uint64_t)&v204, (uint64_t)&v203);
          uint64_t v102 = 0;
          uint64_t v186 = v156;
          uint64_t v187 = v129;
          sub_21DB6A230(&v186, (uint64_t)&v188, (uint64_t)&v204, (uint64_t)&v203);
          _os_log_impl(&dword_21DB23000, v132, (os_log_type_t)v133, "TTR: reporting scheme url:%s", v104, v120);
          sub_21DB6A27C(v105);
          sub_21DB6A27C(v106);
          sub_21DBAD018();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v169 + 8))(v176, v168);
    }
    else
    {
      id v61 = v207;
      id v63 = (id)sub_21DBAC608();

      swift_willThrow();
      uint64_t v32 = v172;
      uint64_t v62 = 0;
      id v33 = v63;
      id v196 = v63;
      uint64_t v34 = sub_21DB76288();
      (*(void (**)(char *, uint64_t, uint64_t))(v169 + 16))(v32, v34, v168);
      id v35 = v63;
      uint64_t v71 = 7;
      uint64_t v69 = swift_allocObject();
      *(void *)(v69 + 16) = v63;
      sub_21DB7422C();
      swift_bridgeObjectRelease();
      uint64_t v80 = sub_21DBAC888();
      int v81 = sub_21DBACF98();
      uint64_t v66 = &v194;
      uint64_t v194 = 12;
      unint64_t v64 = sub_21DB6A04C();
      unint64_t v65 = sub_21DB6A0C8();
      sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t v67 = v195;
      uint64_t v68 = 17;
      uint64_t v74 = swift_allocObject();
      *(unsigned char *)(v74 + 16) = 64;
      uint64_t v75 = swift_allocObject();
      *(unsigned char *)(v75 + 16) = 8;
      uint64_t v70 = 32;
      uint64_t v36 = swift_allocObject();
      uint64_t v37 = v69;
      uint64_t v72 = v36;
      *(void *)(v36 + 16) = v157;
      *(void *)(v36 + 24) = v37;
      uint64_t v38 = swift_allocObject();
      uint64_t v39 = v72;
      uint64_t v73 = v38;
      *(void *)(v38 + 16) = v158;
      *(void *)(v38 + 24) = v39;
      uint64_t v40 = swift_allocObject();
      uint64_t v41 = v73;
      uint64_t v77 = v40;
      *(void *)(v40 + 16) = v159;
      *(void *)(v40 + 24) = v41;
      uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      uint64_t v76 = sub_21DBAD308();
      uint64_t v78 = v42;
      swift_retain();
      uint64_t v43 = v74;
      uint64_t v44 = v78;
      void *v78 = v160;
      v44[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v43;
      swift_retain();
      uint64_t v45 = v75;
      uint64_t v46 = v78;
      v78[2] = v161;
      v46[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v45;
      swift_retain();
      uint64_t v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v77;
      uint64_t v48 = v78;
      v78[4] = v162;
      v48[5] = v47;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v80, (os_log_type_t)v81))
      {
        uint64_t v49 = v62;
        uint64_t v54 = (uint8_t *)sub_21DBAD038();
        v53[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v55 = sub_21DB6A1C0(1);
        uint64_t v56 = sub_21DB6A1C0(0);
        int v57 = &v193;
        char v193 = v54;
        uint64_t v58 = &v206;
        uint64_t v206 = v55;
        uint64_t v59 = &v205;
        uint64_t v205 = v56;
        sub_21DB6A21C(2, &v193);
        sub_21DB6A21C(1, v57);
        uint64_t v191 = v160;
        uint64_t v192 = v74;
        sub_21DB6A230(&v191, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59);
        uint64_t v60 = v49;
        if (v49)
        {
          __break(1u);
        }
        else
        {
          uint64_t v191 = v161;
          uint64_t v192 = v75;
          sub_21DB6A230(&v191, (uint64_t)&v193, (uint64_t)&v206, (uint64_t)&v205);
          v53[0] = 0;
          uint64_t v191 = v162;
          uint64_t v192 = v77;
          sub_21DB6A230(&v191, (uint64_t)&v193, (uint64_t)&v206, (uint64_t)&v205);
          _os_log_impl(&dword_21DB23000, v80, (os_log_type_t)v81, "TTR: failed opening scheme url:%@", v54, v67);
          sub_21DB6A27C(v55);
          sub_21DB6A27C(v56);
          sub_21DBAD018();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v169 + 8))(v172, v168);
    }
    return ((uint64_t (*)(char *, uint64_t))v139)(v180, v185);
  }
}

uint64_t sub_21DB7899C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = sub_21DBAC708();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
}

uint64_t *sub_21DB78A3C@<X0>(void *a1@<X8>)
{
  uint64_t v122 = a1;
  uint64_t v137 = 0;
  int v136 = 0;
  unint64_t v135 = 0;
  id v134 = 0;
  uint64_t v132 = 0;
  uint64_t v133 = 0;
  uint64_t v131 = 0;
  uint64_t v129 = 0;
  uint64_t v130 = 0;
  uint64_t v128 = 0;
  uint64_t v139 = v1;
  uint64_t v124 = sub_21DBAC5D8();
  uint64_t v138 = sub_21DBACC08();
  uint64_t v126 = *(char **)(v1 + OBJC_IVAR___TTRReporter_report);
  uint64_t v2 = v126;
  uint64_t v125 = *(void *)&v126[OBJC_IVAR___TTRReport_title];
  uint64_t v127 = *(void *)&v126[OBJC_IVAR___TTRReport_title + 8];
  swift_bridgeObjectRetain();

  if (v127)
  {
    uint64_t v120 = v125;
    uint64_t v121 = v127;
    uint64_t v119 = v127;
    uint64_t v109 = v125;
    uint64_t v129 = v125;
    uint64_t v130 = v127;
    uint64_t v115 = *(void *)(v124 - 8);
    uint64_t v116 = v124 - 8;
    uint64_t v111 = *(void *)(v115 + 64);
    unint64_t v118 = &v22;
    unint64_t v107 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](&v22);
    unint64_t v117 = (char *)&v22 - v107;
    uint64_t v128 = (char *)&v22 - v107;
    uint64_t v108 = sub_21DBACD38();
    uint64_t v110 = v3;
    swift_bridgeObjectRetain();
    sub_21DBAC5C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v114 = &v22;
    unint64_t v112 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](&v22);
    unint64_t v113 = (char *)&v22 - v112;
    (*(void (**)(void))(v115 + 16))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EA28);
    sub_21DBACE38();
    (*(void (**)(char *, uint64_t))(v115 + 8))(v117, v124);
    swift_bridgeObjectRelease();
  }
  uint64_t v105 = *(char **)(v123 + OBJC_IVAR___TTRReporter_report);
  uint64_t v4 = v105;
  uint64_t v104 = *(void *)&v105[OBJC_IVAR___TTRReport_desc];
  uint64_t v106 = *(void *)&v105[OBJC_IVAR___TTRReport_desc + 8];
  swift_bridgeObjectRetain();

  if (v106)
  {
    uint64_t v102 = v104;
    uint64_t v103 = v106;
    uint64_t v101 = v106;
    uint64_t v91 = v104;
    uint64_t v132 = v104;
    uint64_t v133 = v106;
    uint64_t v97 = *(void *)(v124 - 8);
    uint64_t v98 = v124 - 8;
    uint64_t v93 = *(void *)(v97 + 64);
    uint64_t v100 = &v22;
    unint64_t v89 = (v93 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](&v22);
    int v99 = (char *)&v22 - v89;
    uint64_t v131 = (char *)&v22 - v89;
    uint64_t v90 = sub_21DBACD38();
    uint64_t v92 = v5;
    swift_bridgeObjectRetain();
    sub_21DBAC5C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v96 = &v22;
    unint64_t v94 = (v93 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](&v22);
    unint64_t v95 = (char *)&v22 - v94;
    (*(void (**)(void))(v97 + 16))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EA28);
    sub_21DBACE38();
    (*(void (**)(char *, uint64_t))(v97 + 8))(v99, v124);
    swift_bridgeObjectRelease();
  }
  uint64_t v71 = *(void **)(v124 - 8);
  uint64_t v68 = v124 - 8;
  uint64_t v79 = v71[8];
  id v42 = &v22;
  unint64_t v43 = (v79 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v22);
  uint64_t v69 = (char *)&v22 - v43;
  uint64_t v137 = (char *)&v22 - v43;
  int v87 = 1;
  uint64_t v46 = sub_21DBACD38();
  uint64_t v49 = v6;
  p_inst_props = &OBJC_PROTOCOL___SFAirDropActivityViewControllerDelegate.inst_props;
  uint64_t v44 = *(char **)(v123 + OBJC_IVAR___TTRReporter_report);
  uint64_t v7 = v44;
  id v61 = &OBJC_PROTOCOL___SFAirDropActivityViewControllerDelegate.inst_props;
  uint64_t v45 = *(void *)&v44[OBJC_IVAR___TTRReport_component];
  swift_retain();

  uint64_t v47 = *(void *)(v45 + 16);
  uint64_t v48 = *(void *)(v45 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  sub_21DBAC5C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v50 = &v22;
  unint64_t v51 = (v79 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v22);
  uint64_t v74 = (char *)&v22 - v51;
  int v136 = (char *)&v22 - v51;
  uint64_t v54 = sub_21DBACD38();
  uint64_t v57 = v8;
  int v52 = *(char **)((char *)p_inst_props[323] + v123);
  uint64_t v9 = v52;
  uint64_t v53 = *(uint64_t *)((char *)v61[322] + (void)v52);
  swift_retain();

  uint64_t v55 = *(void *)(v53 + 32);
  uint64_t v56 = *(void *)(v53 + 40);
  swift_bridgeObjectRetain();
  swift_release();
  sub_21DBAC5C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v58 = &v22;
  unint64_t v59 = (v79 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v22);
  uint64_t v80 = (char *)&v22 - v59;
  unint64_t v135 = (char *)&v22 - v59;
  uint64_t v64 = sub_21DBACD38();
  uint64_t v67 = v10;
  uint64_t v62 = *(char **)((char *)p_inst_props[323] + v123);
  uint64_t v11 = v62;
  uint64_t v63 = *(uint64_t *)((char *)v61[322] + (void)v62);
  swift_retain();

  uint64_t v65 = *(void *)(v63 + 48);
  uint64_t v66 = *(void *)(v63 + 56);
  swift_bridgeObjectRetain();
  swift_release();
  sub_21DBAC5C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v73 = &v22;
  unint64_t v70 = (v79 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v22);
  uint64_t v72 = (char *)&v22 - v70;
  int v81 = (void (*)(void))v71[2];
  uint64_t v83 = v71 + 2;
  v81();
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EA28);
  uint64_t v77 = &v138;
  sub_21DBACE38();
  uint64_t v78 = &v22;
  unint64_t v75 = (v79 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v22);
  uint64_t v76 = (char *)&v22 - v75;
  v12();
  sub_21DBACE38();
  uint64_t v86 = &v22;
  unint64_t v82 = (v79 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v22);
  uint64_t v85 = (char *)&v22 - v82;
  v13();
  sub_21DBACE38();
  sub_21DB7A2C0();
  sub_21DBACD38();
  id v88 = sub_21DB79B80();
  id v134 = v88;
  id v14 = v88;
  if (v88)
  {
    id v41 = v88;
    id v40 = v88;
    uint64_t v38 = v138;
    swift_bridgeObjectRetain();
    id v39 = (id)sub_21DBACDE8();
    swift_bridgeObjectRelease();
    objc_msgSend(v40, sel_setQueryItems_, v39);
  }
  id v15 = v88;
  if (v88)
  {
    id v37 = v88;
    id v32 = v88;
    id v33 = [v88 URL];
    uint64_t v16 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0) - 8) + 64);
    uint64_t v34 = &v22;
    unint64_t v35 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v17 = MEMORY[0x270FA5388](v33);
    uint64_t v36 = (char *)&v22 - v35;
    if (v17)
    {
      id v31 = v33;
      id v30 = v33;
      uint64_t v28 = sub_21DBAC708();
      uint64_t v26 = *(void *)(v28 - 8);
      uint64_t v27 = v28 - 8;
      uint64_t v18 = *(void *)(v26 + 64);
      uint64_t v29 = &v22;
      unint64_t v24 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
      MEMORY[0x270FA5388](v30);
      uint64_t v25 = (char *)&v22 - v24;
      sub_21DBAC6C8();
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v36, v25, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v36, 0, 1, v28);
    }
    else
    {
      uint64_t v19 = sub_21DBAC708();
      (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 56))(v36, 1);
    }
    sub_21DB7A328(v36, v122);
  }
  else
  {
    uint64_t v21 = sub_21DBAC708();
    (*(void (**)(void *, uint64_t))(*(void *)(v21 - 8) + 56))(v122, 1);
  }

  uint64_t v23 = (void (*)(char *, uint64_t))v71[1];
  uint64_t v22 = v71 + 1;
  v23(v80, v124);
  v23(v74, v124);
  v23(v69, v124);
  uint64_t result = &v138;
  sub_21DB6DE48();
  return result;
}

uint64_t sub_21DB79AD0(uint64_t a1)
{
  uint64_t v3 = sub_21DBAC708();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

id sub_21DB79B80()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21DB79D84();
}

uint64_t sub_21DB79BC8()
{
  if (!"SharingUI.TTRReporter")
  {
    sub_21DBAD1B8();
    __break(1u);
  }
  uint64_t result = sub_21DBA65F8((uint64_t)"SharingUI.TTRReporter", 21, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/TTRReporter.swift", 27, 2, v1, 0x3DuLL, 7uLL);
  __break(1u);
  return result;
}

id sub_21DB79D00()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRReporter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_21DB79D84()
{
  id v2 = (id)sub_21DBACCC8();
  id v3 = objc_msgSend(v1, sel_initWithString_);

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_21DB79DE0()
{
  return swift_deallocObject();
}

void *sub_21DB79E20(void (*a1)(void))
{
  a1();
  id v3 = (void *)_swift_stdlib_bridgeErrorToNSError();
  id v1 = v3;
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_21DB79E68()
{
  return swift_deallocObject();
}

uint64_t sub_21DB79E94()
{
  return swift_deallocObject();
}

uint64_t sub_21DB79EC0()
{
  return swift_deallocObject();
}

void *sub_21DB79F00()
{
  return sub_21DB79E20(*(void (**)(void))(v0 + 16));
}

uint64_t sub_21DB79F0C()
{
  return swift_deallocObject();
}

uint64_t sub_21DB79F4C()
{
  return swift_deallocObject();
}

uint64_t sub_21DB79F8C()
{
  uint64_t v2 = *(void *)(sub_21DBAC708() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_21DB7A058@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_21DBAC708();
  uint64_t v3 = v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));
  return sub_21DB7899C(v3, a1);
}

uint64_t sub_21DB7A0D0()
{
  return swift_deallocObject();
}

uint64_t sub_21DB7A110()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = sub_21DBAC708();
  unint64_t v1 = sub_21DB7A16C();
  return sub_21DB6A2EC(v5, v3, v4, v1);
}

unint64_t sub_21DB7A16C()
{
  uint64_t v2 = qword_267D1EA20;
  if (!qword_267D1EA20)
  {
    sub_21DBAC708();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EA20);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DB7A1E8()
{
  return swift_deallocObject();
}

uint64_t sub_21DB7A214()
{
  return swift_deallocObject();
}

uint64_t sub_21DB7A240()
{
  return swift_deallocObject();
}

uint64_t sub_21DB7A280()
{
  return swift_deallocObject();
}

unint64_t sub_21DB7A2C0()
{
  uint64_t v2 = qword_267D1EA30;
  if (!qword_267D1EA30)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EA30);
    return ObjCClassMetadata;
  }
  return v2;
}

void *sub_21DB7A328(const void *a1, void *a2)
{
  uint64_t v6 = sub_21DBAC708();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t static SFSecureWindow._isSecure()()
{
  return 1;
}

id SFSecureWindow.__allocating_init(windowScene:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithWindowScene_, a1);

  return v4;
}

id SFSecureWindow.init(windowScene:)(void *a1)
{
  id v7 = 0;
  uint64_t v6 = a1;
  v5.receiver = 0;
  v5.super_class = (Class)type metadata accessor for SFSecureWindow();
  id v4 = objc_msgSendSuper2(&v5, sel_initWithWindowScene_, a1);
  id v1 = v4;
  id v7 = v4;

  return v4;
}

uint64_t type metadata accessor for SFSecureWindow()
{
  return self;
}

id SFSecureWindow.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id SFSecureWindow.init(frame:)(double a1, double a2, double a3, double a4)
{
  id v16 = 0;
  double v12 = a1;
  double v13 = a2;
  double v14 = a3;
  double v15 = a4;
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for SFSecureWindow();
  id v10 = objc_msgSendSuper2(&v11, sel_initWithFrame_, a1, a2, a3, a4);
  id v4 = v10;
  id v16 = v10;

  return v10;
}

id SFSecureWindow.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id SFSecureWindow.init(coder:)(void *a1)
{
  id v8 = 0;
  id v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for SFSecureWindow();
  id v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id SFSecureWindow.__allocating_init(contentRect:)(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(objc_allocWithZone(v4), sel_initWithContentRect_, a1, a2, a3, a4);
}

id SFSecureWindow.init(contentRect:)(double a1, double a2, double a3, double a4)
{
  id v17 = 0;
  double v13 = a1;
  double v14 = a2;
  double v15 = a3;
  double v16 = a4;
  v12.receiver = 0;
  v12.super_class = (Class)type metadata accessor for SFSecureWindow();
  id v11 = objc_msgSendSuper2(&v12, sel_initWithContentRect_, a1, a2, a3, a4);
  if (v11)
  {
    id v4 = v11;
    id v17 = v11;

    return v11;
  }
  else
  {

    return 0;
  }
}

id SFSecureWindow.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFSecureWindow();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21DB7AAE0()
{
  uint64_t v1 = sub_21DBAC8A8();
  __swift_allocate_value_buffer(v1, qword_267D1EA38);
  __swift_project_value_buffer(v1, (uint64_t)qword_267D1EA38);
  return sub_21DBAC878();
}

uint64_t sub_21DB7AB2C()
{
  if (qword_267D1E3B8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21DBAC8A8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_267D1EA38);
}

uint64_t static SCUIInterventionViewController.sf_platformSupportsUserSafety.getter()
{
  return 1;
}

id static SCUIInterventionViewController.openChatWithParents()()
{
  return objc_msgSend(self, sel_openChatWithParents);
}

uint64_t sub_21DB7ABF4()
{
  uint64_t v2 = sub_21DBAC8A8();
  __swift_allocate_value_buffer(v2, qword_267D1EA50);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267D1EA50);
  uint64_t v0 = sub_21DB76288();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(v3, v0);
}

uint64_t sub_21DB7AC74()
{
  if (qword_267D1E3C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21DBAC8A8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_267D1EA50);
}

void sub_21DB7ACE4()
{
  double v1 = sub_21DB9ECC8(106);
  double v0 = sub_21DB9ECC8(106);
  qword_267D1EA68 = *(void *)&v1;
  qword_267D1EA70 = *(void *)&v0;
}

uint64_t *sub_21DB7AD34()
{
  if (qword_267D1E3C8 != -1) {
    swift_once();
  }
  return &qword_267D1EA68;
}

double static SFAirDropUtilities.defaultPreviewIconSize.getter()
{
  return *(double *)sub_21DB7AD34();
}

uint64_t SFAirDropUtilities.FileLoadResult.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = sub_21DBACB08();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v1 - 8) + 16))(a1);
}

uint64_t SFAirDropUtilities.FileLoadResult.dataType.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for SFAirDropUtilities.FileLoadResult() + 20));
  swift_bridgeObjectRetain();
  return v2;
}

void *SFAirDropUtilities.FileLoadResult.previewImage.getter()
{
  uint64_t v3 = *(void **)(v0 + *(int *)(type metadata accessor for SFAirDropUtilities.FileLoadResult() + 24));
  id v1 = v3;
  return v3;
}

uint64_t SFAirDropUtilities.FileLoadResult.wasString.getter()
{
  return *(unsigned char *)(v0 + *(int *)(type metadata accessor for SFAirDropUtilities.FileLoadResult() + 28)) & 1;
}

int *sub_21DB7AF00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v6 = sub_21DBACB08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a6, a1);
  uint64_t result = (int *)type metadata accessor for SFAirDropUtilities.FileLoadResult();
  id v8 = (void *)(a6 + result[5]);
  *id v8 = a2;
  v8[1] = a3;
  *(void *)(a6 + result[6]) = a4;
  *(unsigned char *)(a6 + result[7]) = a5 & 1;
  return result;
}

uint64_t sub_21DB7AFB8()
{
  return sub_21DBAD398();
}

uint64_t sub_21DB7AFD0()
{
  return sub_21DBAD388();
}

uint64_t sub_21DB7AFE8()
{
  return sub_21DBAD3A8();
}

uint64_t sub_21DB7B000()
{
  return sub_21DBAD378();
}

uint64_t *sub_21DB7B018()
{
  uint64_t v8 = sub_21DBAC858();
  uint64_t v7 = sub_21DBAD308();
  uint64_t v6 = v0;
  sub_21DBAC7C8();
  uint64_t v4 = *(void *)(v8 - 8);
  uint64_t v5 = *(void *)(v4 + 72);
  uint64_t v1 = sub_21DB7B234();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6 + v5, v1, v8);
  sub_21DBAC838();
  sub_21DBAC808();
  sub_21DBAC7F8();
  sub_21DBAC7B8();
  sub_21DBAC848();
  sub_21DBAC7D8();
  sub_21DBAC788();
  sub_21DB6120C();
  uint64_t v12 = v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EA80);
  unint64_t v2 = sub_21DB9ED48();
  uint64_t v11 = sub_21DB7B2F4((void (*)(char *, char *))sub_21DB7B2A4, 0, v9, MEMORY[0x263F8D310], MEMORY[0x263F8E628], v2, MEMORY[0x263F8E658], v10);
  uint64_t result = &v12;
  sub_21DB6DE48();
  qword_267D1EA78 = v11;
  return result;
}

uint64_t sub_21DB7B234()
{
  if (qword_267D1E3D8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21DBAC858();
  return __swift_project_value_buffer(v0, (uint64_t)qword_267D1FD70);
}

uint64_t sub_21DB7B2A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21DBAC778();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_21DB7B2F4(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v30 = a1;
  uint64_t v31 = a2;
  uint64_t v55 = a3;
  uint64_t v45 = a4;
  uint64_t v32 = a5;
  uint64_t v54 = a6;
  uint64_t v34 = a8;
  unint64_t v35 = "Fatal error";
  uint64_t v36 = "Index out of bounds";
  id v37 = "Swift/Collection.swift";
  uint64_t v38 = "Range requires lowerBound <= upperBound";
  id v39 = "Swift/Range.swift";
  id v40 = "Index out of range";
  uint64_t v70 = a3;
  uint64_t v69 = a4;
  uint64_t v68 = a5;
  uint64_t v41 = *(void *)(a5 - 8);
  uint64_t v42 = a5 - 8;
  unint64_t v43 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a1);
  uint64_t v44 = (char *)&v15 - v43;
  uint64_t v46 = 0;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v48 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v49 = AssociatedTypeWitness - 8;
  unint64_t v50 = (*(void *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v46);
  unint64_t v51 = (char *)&v15 - v50;
  unint64_t v52 = (*(void *)(*(void *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v53 = (char *)&v15 - v52;
  uint64_t v56 = swift_getAssociatedTypeWitness();
  uint64_t v57 = *(void *)(v56 - 8);
  uint64_t v58 = v56 - 8;
  unint64_t v59 = (*(void *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v55);
  uint64_t v60 = (char *)&v15 - v59;
  unint64_t v61 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint64_t v62 = (char *)&v15 - v61;
  uint64_t v63 = sub_21DBACF28();
  if (v63)
  {
    uint64_t v67 = sub_21DBACC08();
    uint64_t v29 = sub_21DBAD118();
    sub_21DBAD0E8();
    uint64_t result = sub_21DBACF18();
    if (v63 >= 0)
    {
      uint64_t v27 = 0;
      for (uint64_t i = v33; ; uint64_t i = v18)
      {
        uint64_t v25 = i;
        uint64_t v26 = v27;
        if (v27 == v63) {
          goto LABEL_17;
        }
        if (v26 < 0 || v26 >= v63) {
          goto LABEL_16;
        }
        uint64_t v65 = v26;
        if (v63 < 0) {
          goto LABEL_15;
        }
        if (v26 >= v63) {
          break;
        }
        uint64_t v24 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          return result;
        }
        char v66 = 0;
        uint64_t v23 = v24;
LABEL_18:
        uint64_t v22 = v23;
        if (v66)
        {
          (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v60, v62, v56);
          sub_21DBAD098();
          (*(void (**)(char *, uint64_t))(v57 + 8))(v60, v56);
          uint64_t v19 = v67;
          swift_retain();
          swift_release();
          uint64_t v20 = v19;
          uint64_t v21 = v25;
          return v20;
        }
        id v17 = &v64;
        double v16 = (void (*)(void))sub_21DBACF78();
        (*(void (**)(char *))(v48 + 16))(v51);
        v16();
        uint64_t v14 = v25;
        v30(v51, v44);
        uint64_t v18 = v14;
        if (v14)
        {
          (*(void (**)(char *, uint64_t))(v48 + 8))(v51, AssociatedTypeWitness);
          (*(void (**)(char *, uint64_t))(v57 + 8))(v62, v56);
          sub_21DB69498();
          (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v34, v44, v32);
          return v15;
        }
        (*(void (**)(char *, uint64_t))(v48 + 8))(v51, AssociatedTypeWitness);
        sub_21DBAD0F8();
        sub_21DBACF38();
        uint64_t result = v18;
        uint64_t v27 = v22;
      }
      sub_21DBAD1B8();
      __break(1u);
LABEL_15:
      sub_21DBAD1B8();
      __break(1u);
LABEL_16:
      sub_21DBAD208();
      __break(1u);
LABEL_17:
      uint64_t v65 = 0;
      char v66 = 1;
      uint64_t v23 = v26;
      goto LABEL_18;
    }
    sub_21DBAD1B8();
    __break(1u);
  }
  uint64_t v20 = sub_21DBACE18();
  uint64_t v21 = v33;
  return v20;
}

uint64_t *sub_21DB7BC30()
{
  if (qword_267D1E3D0 != -1) {
    swift_once();
  }
  return &qword_267D1EA78;
}

uint64_t static SFAirDropUtilities.standardTypeIdentifiers.getter()
{
  uint64_t v1 = *sub_21DB7BC30();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21DB7BCCC(void *a1, id a2, void *a3)
{
  id v3 = a2;
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E468);
    if (swift_dynamicCast())
    {
      uint64_t v22 = v27;
      char v23 = v28;
    }
    else
    {
      uint64_t v22 = 0;
      char v23 = -1;
    }
    uint64_t v20 = v22;
    unsigned __int8 v21 = v23;
  }
  else
  {
    uint64_t v20 = 0;
    unsigned __int8 v21 = -1;
  }
  if (v21 == 255)
  {
    id v5 = a2;
    if (a2)
    {
      id v6 = a2;
      sub_21DB9EDCC();
      uint64_t v17 = swift_allocError();
      *(void *)uint64_t v7 = a2;
      *(unsigned char *)(v7 + 8) = 0;

      return v17;
    }
    else
    {
      id v8 = a3;
      if (a3)
      {
        id v9 = a3;
        sub_21DB9EDCC();
        uint64_t v16 = swift_allocError();
        *(void *)uint64_t v10 = a3;
        *(unsigned char *)(v10 + 8) = 0;

        return v16;
      }
      else
      {
        id v14 = objc_msgSend(a1, sel_registeredTypeIdentifiers);
        uint64_t v13 = sub_21DBACDF8();
        sub_21DB9EDCC();
        uint64_t v15 = swift_allocError();
        *(void *)uint64_t v11 = v13;
        *(unsigned char *)(v11 + 8) = 1;

        return v15;
      }
    }
  }
  else
  {
    sub_21DB9EE4C(v20, v21);
    sub_21DB9EDCC();
    uint64_t v18 = swift_allocError();
    *(void *)uint64_t v4 = v20;
    *(unsigned char *)(v4 + 8) = v21;
    sub_21DB9EEB0(v20, v21);
    return v18;
  }
}

uint64_t static SFAirDropUtilities.suggestedAirDropThumbnailSize()()
{
  id v1 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v1, sel_scale);

  return SFSuggestedAirDropThumbnailSize();
}

CGImageSource *static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(uint64_t a1, double a2, double a3)
{
  uint64_t v203 = a1;
  double v219 = a2;
  double v220 = a3;
  uint64_t v4 = v3;
  uint64_t v5 = v203;
  uint64_t v221 = v4;
  uint64_t v216 = 0;
  uint64_t v204 = sub_21DB7A058;
  uint64_t v205 = sub_21DB7A110;
  uint64_t v206 = sub_21DB6B8C0;
  v207 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v208 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  v209 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  v255 = 0;
  uint64_t v254 = 0;
  double v252 = 0.0;
  uint64_t v253 = 0;
  uint64_t v251 = 0;
  v249 = 0;
  v210 = 0;
  id v240 = 0;
  v239 = 0;
  id v236 = 0;
  uint64_t v234 = 0;
  uint64_t v235 = 0;
  uint64_t v211 = sub_21DBAC8A8();
  uint64_t v212 = *(void *)(v211 - 8);
  uint64_t v213 = v211 - 8;
  unint64_t v214 = (*(void *)(v212 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v211);
  v215 = (char *)&v57 - v214;
  unint64_t v217 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v216);
  uint64_t v218 = (uint64_t)&v57 - v217;
  uint64_t v222 = sub_21DBAC858();
  uint64_t v223 = *(void *)(v222 - 8);
  uint64_t v224 = v222 - 8;
  uint64_t v226 = *(void *)(v223 + 64);
  unint64_t v225 = (v226 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v222);
  v227 = (char *)&v57 - v225;
  unint64_t v228 = (v226 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v6 = MEMORY[0x270FA5388]((char *)&v57 - v225);
  v229 = (char *)&v57 - v228;
  v255 = (char *)&v57 - v228;
  uint64_t v254 = v5;
  double v252 = v6;
  uint64_t v253 = v7;
  uint64_t v251 = v8;
  if (sub_21DBAC618())
  {
    id v9 = v210;
    uint64_t v189 = 0;
    v250 = 0;
    uint64_t v190 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA8) - 8) + 64);
    uint64_t v191 = &v57;
    unint64_t v192 = (v190 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](v189);
    uint64_t v198 = (uint64_t)&v57 - v192;
    v249 = (char *)&v57 - v192;
    uint64_t v194 = type metadata accessor for URLResourceKey();
    uint64_t v193 = sub_21DBAD308();
    sub_21DB9EF14(MEMORY[0x263EFF600], v10);
    uint64_t v11 = v193;
    sub_21DB6120C();
    v197 = &v248;
    uint64_t v248 = v11;
    uint64_t v195 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1EAB0);
    unint64_t v196 = sub_21DB6DAA4();
    sub_21DB9EF4C();
    uint64_t v199 = sub_21DBACF08();
    sub_21DBAC648();
    uint64_t v200 = (uint64_t)v9;
    v201 = v9;
    if (v9)
    {
      id v58 = v201;
      uint64_t v59 = 0;
      swift_bridgeObjectRelease();

      uint64_t v56 = sub_21DBAC5F8();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v198, 1);
      uint64_t v188 = v59;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_21DBAC5F8();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v12 - 8) + 56))(v198, 0, 1);
      uint64_t v188 = v200;
    }
    uint64_t v181 = v188;
    uint64_t v182 = &v57;
    unint64_t v183 = (v190 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](v198);
    uint64_t v184 = (uint64_t)&v57 - v183;
    sub_21DB9EFD0(v13, (char *)&v57 - v183);
    uint64_t v185 = sub_21DBAC5F8();
    uint64_t v186 = *(void *)(v185 - 8);
    uint64_t v187 = v185 - 8;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v186 + 48))(v184, 1) == 1)
    {
      sub_21DB9F0F8(v184);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v223 + 56))(v218, 1, 1, v222);
    }
    else
    {
      sub_21DBAC5E8();
      (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v184, v185);
    }
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v223 + 48))(v218, 1, v222) == 1)
    {
      id v37 = v215;
      sub_21DB9F1A8(v218);
      uint64_t v38 = sub_21DB7AC74();
      (*(void (**)(char *, uint64_t, uint64_t))(v212 + 16))(v37, v38, v211);
      uint64_t v78 = sub_21DBAC708();
      uint64_t v75 = *(void *)(v78 - 8);
      uint64_t v76 = v78 - 8;
      uint64_t v72 = v75;
      uint64_t v73 = *(void *)(v75 + 64);
      uint64_t v79 = &v57;
      unint64_t v71 = (v73 + 15) & 0xFFFFFFFFFFFFFFF0;
      double v39 = MEMORY[0x270FA5388](&v57);
      uint64_t v77 = (char *)&v57 - v71;
      (*(void (**)(double))(v75 + 16))(v39);
      unint64_t v74 = (*(unsigned __int8 *)(v72 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
      uint64_t v87 = 7;
      uint64_t v80 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v75 + 32))(v80 + v74, v77, v78);
      swift_retain();
      uint64_t v86 = 32;
      uint64_t v40 = swift_allocObject();
      uint64_t v41 = v80;
      uint64_t v88 = v40;
      *(void *)(v40 + 16) = v204;
      *(void *)(v40 + 24) = v41;
      swift_release();
      unint64_t v96 = sub_21DBAC888();
      int v97 = sub_21DBACF98();
      uint64_t v83 = &v246;
      uint64_t v246 = 12;
      unint64_t v81 = sub_21DB6A04C();
      unint64_t v82 = sub_21DB6A0C8();
      sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t v84 = v247;
      uint64_t v85 = 17;
      uint64_t v90 = swift_allocObject();
      *(unsigned char *)(v90 + 16) = 32;
      uint64_t v91 = swift_allocObject();
      *(unsigned char *)(v91 + 16) = 8;
      uint64_t v42 = swift_allocObject();
      uint64_t v43 = v88;
      uint64_t v89 = v42;
      *(void *)(v42 + 16) = v205;
      *(void *)(v42 + 24) = v43;
      uint64_t v44 = swift_allocObject();
      uint64_t v45 = v89;
      uint64_t v93 = v44;
      *(void *)(v44 + 16) = v206;
      *(void *)(v44 + 24) = v45;
      uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      uint64_t v92 = sub_21DBAD308();
      unint64_t v94 = v46;
      swift_retain();
      uint64_t v47 = v90;
      uint64_t v48 = v94;
      *unint64_t v94 = v207;
      v48[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v47;
      swift_retain();
      uint64_t v49 = v91;
      unint64_t v50 = v94;
      v94[2] = v208;
      v50[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v49;
      swift_retain();
      unint64_t v51 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v93;
      unint64_t v52 = v94;
      v94[4] = v209;
      v52[5] = v51;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v96, (os_log_type_t)v97))
      {
        uint64_t v53 = v181;
        char v64 = (uint8_t *)sub_21DBAD038();
        uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v65 = sub_21DB6A1C0(0);
        uint64_t v66 = sub_21DB6A1C0(1);
        uint64_t v67 = &v245;
        v245 = v64;
        uint64_t v68 = &v244;
        uint64_t v244 = v65;
        uint64_t v69 = &v243;
        uint64_t v243 = v66;
        sub_21DB6A21C(2, &v245);
        sub_21DB6A21C(1, v67);
        v241 = v207;
        uint64_t v242 = v90;
        sub_21DB6A230(&v241, (uint64_t)v67, (uint64_t)v68, (uint64_t)v69);
        uint64_t v70 = v53;
        if (v53)
        {
          __break(1u);
        }
        else
        {
          v241 = v208;
          uint64_t v242 = v91;
          sub_21DB6A230(&v241, (uint64_t)&v245, (uint64_t)&v244, (uint64_t)&v243);
          uint64_t v62 = 0;
          v241 = v209;
          uint64_t v242 = v93;
          sub_21DB6A230(&v241, (uint64_t)&v245, (uint64_t)&v244, (uint64_t)&v243);
          _os_log_impl(&dword_21DB23000, v96, (os_log_type_t)v97, "Could not find content type for URL %s", v64, v84);
          sub_21DB6A27C(v65);
          sub_21DB6A27C(v66);
          sub_21DBAD018();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v212 + 8))(v215, v211);
      goto LABEL_43;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v223 + 32))(v229, v218, v222);
    sub_21DBAC7F8();
    int v180 = sub_21DBAC818();
    uint64_t v178 = *(void (**)(char *, uint64_t))(v223 + 8);
    uint64_t v179 = v223 + 8;
    v178(v227, v222);
    if (v180)
    {
      uint64_t v173 = sub_21DBAC708();
      uint64_t v171 = *(void *)(v173 - 8);
      uint64_t v172 = v173 - 8;
      uint64_t v14 = *(void *)(v171 + 64);
      unint64_t v175 = &v57;
      unint64_t v170 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
      double v15 = MEMORY[0x270FA5388](&v57);
      id v174 = (char *)&v57 - v170;
      (*(void (**)(char *, double))(v171 + 16))((char *)&v57 - v170, v15);
      uint64_t v176 = (void *)sub_21DBAC688();
      (*(void (**)(char *, uint64_t))(v171 + 8))(v174, v173);
      double v16 = SFScreenScale();
      double v230 = v219;
      double v231 = v220;
      uint64_t v177 = SFCreateThumbnailImage(v176, v219, v220, v16);

      uint64_t v17 = v250;
      v250 = v177;

LABEL_35:
      v178(v229, v222);
LABEL_43:
      uint64_t v60 = (id *)&v250;
      unint64_t v61 = v250;
      uint64_t v54 = v250;
      sub_21DB9F0F8(v198);
      sub_21DB74628(v60);
      return v61;
    }
    uint64_t v157 = 0;
    sub_21DB9F62C();
    uint64_t v158 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0) - 8) + 64);
    uint64_t v168 = &v57;
    unint64_t v159 = (v158 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](v157);
    uint64_t v167 = (uint64_t)&v57 - v159;
    uint64_t v164 = sub_21DBAC708();
    uint64_t v162 = *(void *)(v164 - 8);
    uint64_t v163 = v164 - 8;
    long long v160 = *(void (**)(uint64_t, uint64_t))(v162 + 16);
    uint64_t v161 = v162 + 16;
    v160(v167, v203);
    id v165 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v162 + 56);
    uint64_t v166 = v162 + 56;
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v165)(v167, 0, 1, v164);
    id v169 = sub_21DB7DFB8(v167);
    if (v169)
    {
      id v156 = v169;
      id v154 = v169;
      id v236 = v169;
      id v155 = objc_msgSend(v169, sel_imagePath);
      if (v155)
      {
        id v153 = v155;
        id v148 = v155;
        uint64_t v149 = sub_21DBACCD8();
        uint64_t v150 = v18;

        uint64_t v151 = v149;
        uint64_t v152 = v150;
      }
      else
      {
        uint64_t v151 = 0;
        uint64_t v152 = 0;
      }
      uint64_t v146 = v152;
      uint64_t v147 = v151;
      if (v152)
      {
        uint64_t v144 = v147;
        uint64_t v145 = v146;
        uint64_t v143 = v146;
        uint64_t v234 = v147;
        uint64_t v235 = v146;
        uint64_t v19 = *(void *)(v162 + 64);
        uint64_t v140 = &v57;
        unint64_t v138 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
        MEMORY[0x270FA5388](v147);
        uint64_t v139 = (char *)&v57 - v138;
        sub_21DBAC658();
        uint64_t v141 = (void *)sub_21DBAC688();
        (*(void (**)(char *, uint64_t))(v162 + 8))(v139, v164);
        double v20 = SFScreenScale();
        double v232 = v219;
        double v233 = v220;
        id v142 = SFCreateThumbnailImage(v141, v219, v220, v20);

        unsigned __int8 v21 = v250;
        v250 = v142;

        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
    }
    sub_21DB9F694();
    uint64_t v133 = *(void *)(v162 + 64);
    int v136 = &v57;
    unint64_t v134 = (v133 + 15) & 0xFFFFFFFFFFFFFFF0;
    double v22 = MEMORY[0x270FA5388](&v57);
    uint64_t v135 = (uint64_t)&v57 - v134;
    v23(v22);
    id v137 = sub_21DB7DFF8(v135);
    if (v137)
    {
      id v132 = v137;
      id v121 = v137;
      id v240 = v137;
      uint64_t v122 = &v57;
      unint64_t v123 = (v133 + 15) & 0xFFFFFFFFFFFFFFF0;
      MEMORY[0x270FA5388](v137);
      uint64_t v124 = (char *)&v57 - v123;
      v239 = (char *)&v57 - v123;
      uint64_t v125 = &v57;
      unint64_t v126 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
      double v26 = MEMORY[0x270FA5388](v25);
      uint64_t v127 = (char *)&v57 - v126;
      id v128 = objc_msgSend(v27, sel_photoURL, v26);
      uint64_t v129 = &v57;
      unint64_t v130 = (v158 + 15) & 0xFFFFFFFFFFFFFFF0;
      v29.n128_f64[0] = MEMORY[0x270FA5388](v128);
      uint64_t v131 = (uint64_t)&v57 - v130;
      if (v28)
      {
        id v120 = v128;
        id v119 = v128;
        unint64_t v118 = &v57;
        unint64_t v116 = (v133 + 15) & 0xFFFFFFFFFFFFFFF0;
        MEMORY[0x270FA5388](v128);
        unint64_t v117 = (char *)&v57 - v116;
        sub_21DBAC6C8();
        (*(void (**)(uint64_t, char *, uint64_t))(v162 + 32))(v131, v117, v164);
        ((void (*)(uint64_t, void, uint64_t, uint64_t))v165)(v131, 0, 1, v164);
      }
      else
      {
        v165(v131, 1, 1, v164, v29);
      }
      id v30 = v121;
      uint64_t v114 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v162 + 48);
      uint64_t v115 = v162 + 48;
      if (v114(v131, 1, v164) == 1)
      {
        id v110 = objc_msgSend(v121, sel_fullSizePhotoURL);
        uint64_t v111 = &v57;
        unint64_t v112 = (v158 + 15) & 0xFFFFFFFFFFFFFFF0;
        v31.n128_f64[0] = MEMORY[0x270FA5388](v110);
        unint64_t v113 = (char *)&v57 - v112;
        if (v32)
        {
          id v109 = v110;
          id v108 = v110;
          unint64_t v107 = &v57;
          unint64_t v105 = (v133 + 15) & 0xFFFFFFFFFFFFFFF0;
          MEMORY[0x270FA5388](v110);
          uint64_t v106 = (char *)&v57 - v105;
          sub_21DBAC6C8();
          (*(void (**)(char *, char *, uint64_t))(v162 + 32))(v113, v106, v164);
          ((void (*)(char *, void, uint64_t, uint64_t))v165)(v113, 0, 1, v164);
        }
        else
        {
          v165((uint64_t)v113, 1, 1, v164, v31);
        }
        sub_21DB7A328(v113, v127);
        sub_21DB79AD0(v131);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v162 + 32))(v127, v131, v164);
        ((void (*)(char *, void, uint64_t, uint64_t))v165)(v127, 0, 1, v164);
      }

      if (v114((uint64_t)v127, 1, v164) == 1)
      {
        sub_21DB79AD0((uint64_t)v127);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v162 + 32))(v124, v127, v164);
        uint64_t v100 = &v57;
        unint64_t v98 = (v133 + 15) & 0xFFFFFFFFFFFFFFF0;
        double v33 = MEMORY[0x270FA5388](&v57);
        int v99 = (char *)&v57 - v98;
        v34((char *)&v57 - v98, v33);
        uint64_t v101 = (void *)sub_21DBAC688();
        uint64_t v104 = *(void (**)(char *, uint64_t))(v162 + 8);
        uint64_t v103 = v162 + 8;
        v104(v99, v164);
        double v35 = SFScreenScale();
        double v237 = v219;
        double v238 = v220;
        uint64_t v102 = SFCreateThumbnailImage(v101, v219, v220, v35);

        uint64_t v36 = v250;
        v250 = v102;

        v104(v124, v164);
      }
    }
    goto LABEL_35;
  }
  return 0;
}

id sub_21DB7DFB8(uint64_t a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21DB9E8C8(a1);
}

id sub_21DB7DFF8(uint64_t a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21DB9E9D0(a1);
}

uint64_t sub_21DB7E038(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v292 = a1;
  v284 = a2;
  uint64_t v282 = a3;
  uint64_t v283 = a4;
  uint64_t v276 = 0;
  v262 = sub_21DB6BE14;
  v263 = sub_21DB9FA68;
  v264 = sub_21DB74A80;
  v265 = sub_21DB75008;
  v266 = sub_21DB79F00;
  v267 = sub_21DB74A80;
  v268 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  v269 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  v270 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
  v271 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  v272 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  v273 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
  uint64_t v345 = *MEMORY[0x263EF8340];
  uint64_t v323 = 0;
  uint64_t v322 = 0;
  uint64_t v343 = 0;
  uint64_t v344 = 0;
  uint64_t v321 = 0;
  uint64_t v335 = 0;
  unint64_t v336 = 0;
  uint64_t v333 = 0;
  unint64_t v334 = 0;
  v316 = 0;
  uint64_t v314 = 0;
  uint64_t v315 = 0;
  v313 = 0;
  uint64_t v309 = 0;
  id v310 = 0;
  uint64_t v308 = 0;
  uint64_t v306 = 0;
  uint64_t v307 = 0;
  id v304 = 0;
  uint64_t v326 = 0;
  unint64_t v327 = 0;
  uint64_t v298 = 0;
  uint64_t v299 = 0;
  unint64_t v274 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  v275 = (char *)v77 - v274;
  uint64_t v277 = sub_21DBAC858();
  uint64_t v278 = *(void *)(v277 - 8);
  uint64_t v279 = v277 - 8;
  unint64_t v280 = (*(void *)(v278 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v276);
  v281 = (char *)v77 - v280;
  uint64_t v285 = sub_21DBAC8A8();
  v286 = *(void **)(v285 - 8);
  uint64_t v287 = v285 - 8;
  unint64_t v288 = (v286[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v292);
  v289 = (char *)v77 - v288;
  unint64_t v290 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  v291 = (char *)v77 - v290;
  uint64_t v323 = v7;
  uint64_t v322 = v8;
  uint64_t v343 = v9;
  uint64_t v344 = v10;
  uint64_t v321 = v4;
  uint64_t v341 = 0;
  unint64_t v342 = 0xF000000000000000;
  uint64_t v339 = 0;
  uint64_t v340 = 0;
  swift_unknownObjectRetain();
  self;
  uint64_t v293 = swift_dynamicCastObjCClass();
  if (v293)
  {
    v260 = (void *)v293;
  }
  else
  {
    v259 = 0;
    swift_unknownObjectRelease();
    v260 = v259;
  }
  v258 = v260;
  if (v260)
  {
    v257 = v258;
    uint64_t v11 = v291;
    id v245 = v258;
    v313 = v258;
    uint64_t v12 = sub_21DB7AC74();
    uint64_t v246 = (void (*)(char *, uint64_t, uint64_t))v286[2];
    uint32_t v247 = v286 + 2;
    v246(v11, v12, v285);
    v255 = sub_21DBAC888();
    int v254 = sub_21DBACF88();
    v250 = &v311;
    uint64_t v311 = 2;
    unint64_t v248 = sub_21DB6A04C();
    unint64_t v249 = sub_21DB6A0C8();
    unint64_t v251 = sub_21DB6A144();
    sub_21DBACDD8();
    uint32_t v252 = v312;
    uint64_t v253 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
    uint64_t v256 = sub_21DBAD308();
    if (os_log_type_enabled(v255, (os_log_type_t)v254))
    {
      uint64_t v234 = (uint8_t *)sub_21DBAD038();
      uint64_t v232 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
      uint64_t v233 = 0;
      uint64_t v235 = sub_21DB6A1C0(0);
      uint64_t v236 = sub_21DB6A1C0(v233);
      id v240 = &v297;
      v297 = v234;
      v241 = &v325;
      uint64_t v325 = v235;
      double v238 = &v324;
      uint64_t v324 = v236;
      unsigned int v237 = 0;
      sub_21DB6A21C(0, &v297);
      sub_21DB6A21C(v237, v240);
      uint64_t v296 = v256;
      v239 = v77;
      MEMORY[0x270FA5388](v77);
      uint64_t v13 = v241;
      uint64_t v14 = &v77[-6];
      uint64_t v242 = &v77[-6];
      v14[2] = v240;
      v14[3] = v13;
      v14[4] = v15;
      uint64_t v243 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E490);
      sub_21DB6BE44();
      uint64_t v16 = v261;
      sub_21DBACDB8();
      uint64_t v244 = v16;
      if (v16)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_21DB23000, v255, (os_log_type_t)v254, "Converting NSAttributedString item to HTML", v234, v252);
        uint64_t v230 = 0;
        sub_21DB6A27C(v235);
        sub_21DB6A27C(v236);
        sub_21DBAD018();
        swift_bridgeObjectRelease();
        uint64_t v231 = v244;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v231 = v261;
    }
    uint64_t v211 = v231;

    uint64_t v212 = (void (*)(char *, uint64_t))v286[1];
    uint64_t v213 = v286 + 1;
    v212(v291, v285);
    id v226 = objc_msgSend(v245, sel_length);
    uint64_t v217 = 0;
    uint64_t v309 = 0;
    id v310 = v226;
    uint64_t v215 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAE8);
    uint64_t v216 = sub_21DBAD308();
    unint64_t v214 = v17 + 1;
    sub_21DB9EF14(MEMORY[0x263F814D0], v17);
    sub_21DB9EF14(MEMORY[0x263F81508], v214);
    uint64_t v18 = v216;
    sub_21DB6120C();
    uint64_t v218 = v18;
    uint64_t v221 = type metadata accessor for DocumentAttributeKey();
    uint64_t v220 = type metadata accessor for DocumentType();
    unint64_t v223 = sub_21DB6DA20();
    uint64_t v225 = sub_21DBACC38();
    uint64_t v308 = v225;
    id v219 = objc_msgSend(v245, sel_string);
    uint64_t v306 = sub_21DBACCD8();
    uint64_t v307 = v19;

    v330 = 0;
    swift_bridgeObjectRetain();
    uint64_t v222 = MEMORY[0x263F8EE58] + 8;
    uint64_t v224 = sub_21DBAD1D8();
    id v228 = (id)sub_21DBACC18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v305 = v330;
    uint64_t v294 = 0;
    id v295 = v226;
    id v229 = objc_msgSend(v245, sel_dataFromRange_documentAttributes_error_, 0, v226, v228, &v305);
    id v227 = v305;
    id v20 = v305;
    unsigned __int8 v21 = v330;
    v330 = v227;

    if (v229)
    {
      id v210 = v229;
      id v202 = v229;
      uint64_t v204 = sub_21DBAC728();
      unint64_t v205 = v22;
      uint64_t v326 = v204;
      unint64_t v327 = v22;

      uint64_t v23 = *(void *)(*(void *)(sub_21DBACD18() - 8) + 64);
      v207 = v77;
      unint64_t v203 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
      MEMORY[0x270FA5388](v77);
      uint64_t v206 = (char *)v77 - v203;
      sub_21DBACD08();
      uint64_t v208 = sub_21DBACCF8();
      uint64_t v209 = v24;
      if (v24)
      {
        uint64_t v200 = v208;
        uint64_t v201 = v209;
        uint64_t v199 = v209;
        uint64_t v198 = v208;
        uint64_t v298 = v208;
        uint64_t v299 = v209;
        swift_bridgeObjectRetain();
        uint64_t v306 = v198;
        uint64_t v307 = v199;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      sub_21DB9F750(v204, v205);
      uint64_t v197 = v211;
    }
    else
    {
      id v94 = v330;
      id v97 = (id)sub_21DBAC608();

      swift_willThrow();
      uint64_t v45 = v289;
      uint64_t v95 = 0;
      id v46 = v97;
      id v304 = v97;
      uint64_t v47 = sub_21DB7AC74();
      v246(v45, v47, v285);
      id v48 = v245;
      uint64_t v96 = 24;
      uint64_t v106 = 7;
      uint64_t v49 = swift_allocObject();
      id v50 = v97;
      uint64_t v99 = v49;
      *(void *)(v49 + 16) = v245;
      id v51 = v50;
      uint64_t v104 = swift_allocObject();
      *(void *)(v104 + 16) = v97;
      sub_21DB7422C();
      swift_bridgeObjectRelease();
      unint64_t v117 = sub_21DBAC888();
      int v118 = sub_21DBACF98();
      v302[1] = (unsigned char *)22;
      sub_21DBACDD8();
      uint32_t v98 = v303;
      uint64_t v102 = 17;
      uint64_t v109 = swift_allocObject();
      int v101 = 64;
      *(unsigned char *)(v109 + 16) = 64;
      uint64_t v110 = swift_allocObject();
      int v103 = 8;
      *(unsigned char *)(v110 + 16) = 8;
      uint64_t v105 = 32;
      uint64_t v52 = swift_allocObject();
      uint64_t v53 = v99;
      uint64_t v100 = v52;
      *(void *)(v52 + 16) = v263;
      *(void *)(v52 + 24) = v53;
      uint64_t v54 = swift_allocObject();
      uint64_t v55 = v100;
      uint64_t v111 = v54;
      *(void *)(v54 + 16) = v264;
      *(void *)(v54 + 24) = v55;
      uint64_t v112 = swift_allocObject();
      *(unsigned char *)(v112 + 16) = v101;
      uint64_t v113 = swift_allocObject();
      *(unsigned char *)(v113 + 16) = v103;
      uint64_t v56 = swift_allocObject();
      uint64_t v57 = v104;
      uint64_t v107 = v56;
      *(void *)(v56 + 16) = v265;
      *(void *)(v56 + 24) = v57;
      uint64_t v58 = swift_allocObject();
      uint64_t v59 = v107;
      uint64_t v108 = v58;
      *(void *)(v58 + 16) = v266;
      *(void *)(v58 + 24) = v59;
      uint64_t v60 = swift_allocObject();
      uint64_t v61 = v108;
      uint64_t v115 = v60;
      *(void *)(v60 + 16) = v267;
      *(void *)(v60 + 24) = v61;
      uint64_t v114 = sub_21DBAD308();
      unint64_t v116 = v62;
      swift_retain();
      uint64_t v63 = v109;
      char v64 = v116;
      *unint64_t v116 = v268;
      v64[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v63;
      swift_retain();
      uint64_t v65 = v110;
      uint64_t v66 = v116;
      v116[2] = v269;
      v66[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v65;
      swift_retain();
      uint64_t v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v111;
      uint64_t v68 = v116;
      v116[4] = v270;
      v68[5] = v67;
      swift_retain();
      uint64_t v69 = v112;
      uint64_t v70 = v116;
      v116[6] = v271;
      v70[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v69;
      swift_retain();
      uint64_t v71 = v113;
      uint64_t v72 = v116;
      v116[8] = v272;
      v72[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v71;
      swift_retain();
      uint64_t v73 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v115;
      unint64_t v74 = v116;
      v116[10] = v273;
      v74[11] = v73;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v117, (os_log_type_t)v118))
      {
        uint64_t v86 = (uint8_t *)sub_21DBAD038();
        uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v87 = sub_21DB6A1C0(2);
        uint64_t v88 = sub_21DB6A1C0(0);
        uint64_t v90 = v302;
        v302[0] = v86;
        uint64_t v91 = &v329;
        uint64_t v329 = v87;
        uint64_t v92 = &v328;
        uint64_t v328 = v88;
        unsigned int v89 = 2;
        sub_21DB6A21C(2, v302);
        sub_21DB6A21C(v89, v90);
        uint64_t v75 = v95;
        v300 = v268;
        uint64_t v301 = v109;
        sub_21DB6A230(&v300, (uint64_t)v90, (uint64_t)v91, (uint64_t)v92);
        uint64_t v93 = v75;
        if (v75)
        {
          __break(1u);
        }
        else
        {
          v300 = v269;
          uint64_t v301 = v110;
          sub_21DB6A230(&v300, (uint64_t)v302, (uint64_t)&v329, (uint64_t)&v328);
          uint64_t v83 = 0;
          uint64_t v76 = v83;
          v300 = v270;
          uint64_t v301 = v111;
          sub_21DB6A230(&v300, (uint64_t)v302, (uint64_t)&v329, (uint64_t)&v328);
          uint64_t v82 = v76;
          v300 = v271;
          uint64_t v301 = v112;
          sub_21DB6A230(&v300, (uint64_t)v302, (uint64_t)&v329, (uint64_t)&v328);
          uint64_t v81 = 0;
          v300 = v272;
          uint64_t v301 = v113;
          sub_21DB6A230(&v300, (uint64_t)v302, (uint64_t)&v329, (uint64_t)&v328);
          uint64_t v80 = 0;
          v300 = v273;
          uint64_t v301 = v115;
          sub_21DB6A230(&v300, (uint64_t)v302, (uint64_t)&v329, (uint64_t)&v328);
          uint64_t v79 = 0;
          _os_log_impl(&dword_21DB23000, v117, (os_log_type_t)v118, "Failed to convert NSAttributedString [%@] to HTML due to: %@", v86, v98);
          sub_21DB6A27C(v87);
          sub_21DB6A27C(v88);
          sub_21DBAD018();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          uint64_t v84 = v79;
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v84 = v95;
      }
      uint64_t v78 = v84;

      v212(v289, v285);
      uint64_t v197 = v78;
    }
    uint64_t v195 = v197;
    sub_21DBAC848();
    uint64_t v182 = sub_21DBAC778();
    uint64_t v183 = v25;
    (*(void (**)(char *, uint64_t))(v278 + 8))(v281, v277);
    uint64_t v339 = v182;
    uint64_t v340 = v183;
    swift_bridgeObjectRelease();
    uint64_t v194 = &v306;
    uint64_t v185 = v306;
    uint64_t v191 = v307;
    swift_bridgeObjectRetain();
    uint64_t v189 = sub_21DBACD18();
    uint64_t v186 = *(void *)(v189 - 8);
    uint64_t v187 = v189 - 8;
    uint64_t v26 = *(void *)(v186 + 64);
    uint64_t v190 = v77;
    unint64_t v184 = (v26 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](v77);
    uint64_t v188 = (char *)v77 - v184;
    sub_21DBACD08();
    sub_21DB644A0();
    uint64_t v192 = sub_21DBACCE8();
    unint64_t v193 = v27;
    (*(void (**)(char *, uint64_t))(v186 + 8))(v188, v189);
    swift_bridgeObjectRelease();
    uint64_t v28 = v341;
    unint64_t v29 = v342;
    uint64_t v341 = v192;
    unint64_t v342 = v193;
    sub_21DB9F868(v28, v29);
    sub_21DB6C060();
    swift_bridgeObjectRelease();

    uint64_t v196 = v195;
  }
  else
  {
    swift_unknownObjectRetain();
    int v180 = &v320;
    uint64_t v320 = v292;
    uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAE0);
    if (swift_dynamicCast())
    {
      uint64_t v178 = v318;
      uint64_t v179 = v319;
    }
    else
    {
      uint64_t v178 = 0;
      uint64_t v179 = 0;
    }
    uint64_t v176 = v179;
    uint64_t v177 = v178;
    if (v179)
    {
      uint64_t v174 = v177;
      uint64_t v175 = v176;
      uint64_t v173 = v176;
      uint64_t v165 = v177;
      uint64_t v314 = v177;
      uint64_t v315 = v176;
      sub_21DBAC848();
      uint64_t v162 = sub_21DBAC778();
      uint64_t v163 = v30;
      (*(void (**)(char *, uint64_t))(v278 + 8))(v281, v277);
      uint64_t v339 = v162;
      uint64_t v340 = v163;
      swift_bridgeObjectRelease();
      uint64_t v169 = sub_21DBACD18();
      uint64_t v166 = *(void *)(v169 - 8);
      uint64_t v167 = v169 - 8;
      uint64_t v31 = *(void *)(v166 + 64);
      unint64_t v170 = v77;
      unint64_t v164 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
      MEMORY[0x270FA5388](v77);
      uint64_t v168 = (char *)v77 - v164;
      sub_21DBACD08();
      sub_21DB644A0();
      uint64_t v171 = sub_21DBACCE8();
      unint64_t v172 = v32;
      (*(void (**)(char *, uint64_t))(v166 + 8))(v168, v169);
      uint64_t v33 = v341;
      unint64_t v34 = v342;
      uint64_t v341 = v171;
      unint64_t v342 = v172;
      sub_21DB9F868(v33, v34);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_unknownObjectRetain();
      self;
      uint64_t v161 = swift_dynamicCastObjCClass();
      if (v161)
      {
        long long v160 = (UIImage *)v161;
      }
      else
      {
        unint64_t v159 = 0;
        swift_unknownObjectRelease();
        long long v160 = v159;
      }
      uint64_t v158 = v160;
      if (v160)
      {
        uint64_t v157 = v158;
        id v155 = v158;
        v316 = v158;
        id v156 = UIImageJPEGRepresentation(v158, 1.0);
        if (v156)
        {
          id v154 = v156;
          uint64_t v149 = v156;
          uint64_t v150 = sub_21DBAC728();
          unint64_t v151 = v35;

          uint64_t v152 = v150;
          unint64_t v153 = v151;
        }
        else
        {
          uint64_t v152 = 0;
          unint64_t v153 = 0xF000000000000000;
        }
        uint64_t v36 = v341;
        unint64_t v37 = v342;
        uint64_t v341 = v152;
        unint64_t v342 = v153;
        sub_21DB9F868(v36, v37);
        sub_21DB9F900(v284, v275);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v278 + 48))(v275, 1, v277) == 1)
        {
          uint64_t v140 = 0;
          sub_21DB9F1A8((uint64_t)v275);
          uint64_t v147 = v140;
          uint64_t v148 = v140;
        }
        else
        {
          uint64_t v145 = sub_21DBAC7A8();
          uint64_t v146 = v38;
          (*(void (**)(char *, uint64_t))(v278 + 8))(v275, v277);
          uint64_t v147 = v145;
          uint64_t v148 = v146;
        }
        uint64_t v331 = v147;
        uint64_t v332 = v148;
        BOOL v144 = v148 == 0;
        BOOL v143 = v144;
        sub_21DB6C060();
        if (v143)
        {
          sub_21DBAC7E8();
          uint64_t v141 = sub_21DBAC778();
          uint64_t v142 = v39;
          (*(void (**)(char *, uint64_t))(v278 + 8))(v281, v277);
          uint64_t v339 = v141;
          uint64_t v340 = v142;
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_unknownObjectRetain();
        uint64_t v317 = v292;
        if (swift_dynamicCast())
        {
          uint64_t v138 = v337;
          unint64_t v139 = v338;
        }
        else
        {
          uint64_t v138 = 0;
          unint64_t v139 = 0xF000000000000000;
        }
        unint64_t v136 = v139;
        uint64_t v137 = v138;
        if ((v139 & 0xF000000000000000) == 0xF000000000000000)
        {
          sub_21DB9EDCC();
          uint64_t v132 = swift_allocError();
          *(void *)uint64_t v40 = 2;
          *(unsigned char *)(v40 + 8) = 2;
          swift_willThrow();
          sub_21DB6C060();
          sub_21DB9F6FC((uint64_t)&v341);
          uint64_t v133 = v132;
          return v77[1];
        }
        uint64_t v134 = v137;
        unint64_t v135 = v136;
        unint64_t v131 = v136;
        uint64_t v130 = v137;
        uint64_t v335 = v137;
        unint64_t v336 = v136;
        sub_21DB9F7DC(v137, v136);
        uint64_t v41 = v341;
        unint64_t v42 = v342;
        uint64_t v341 = v130;
        unint64_t v342 = v131;
        sub_21DB9F868(v41, v42);
        swift_bridgeObjectRetain();
        uint64_t v339 = v282;
        uint64_t v340 = v283;
        swift_bridgeObjectRelease();
        sub_21DB9F750(v130, v131);
      }
    }
    uint64_t v196 = v261;
  }
  uint64_t v127 = v196;
  uint64_t v128 = v341;
  unint64_t v129 = v342;
  sub_21DB9F8B4(v341, v342);
  if ((v129 & 0xF000000000000000) != 0xF000000000000000)
  {
    uint64_t v125 = v128;
    unint64_t v126 = v129;
    unint64_t v120 = v129;
    uint64_t v121 = v128;
    uint64_t v333 = v128;
    unint64_t v334 = v129;
    uint64_t v124 = &v339;
    uint64_t v122 = v339;
    uint64_t v123 = v340;
    swift_bridgeObjectRetain();
    sub_21DB6C060();
    sub_21DB9F6FC((uint64_t)&v341);
    return v121;
  }
  sub_21DB9EDCC();
  uint64_t v119 = swift_allocError();
  *(void *)uint64_t v44 = 0;
  *(unsigned char *)(v44 + 8) = 2;
  swift_willThrow();
  sub_21DB6C060();
  sub_21DB9F6FC((uint64_t)&v341);
  uint64_t v133 = v119;
  return v77[1];
}

void *sub_21DB7FA94(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t sub_21DB7FABC(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, double a6, double a7)
{
  *(void *)(v8 + 240) = v7;
  *(void *)(v8 + 232) = a5;
  *(double *)(v8 + 224) = a7;
  *(double *)(v8 + 216) = a6;
  *(unsigned char *)(v8 + 330) = a4 & 1;
  *(unsigned char *)(v8 + 329) = a3 & 1;
  *(void *)(v8 + 208) = a2;
  *(void *)(v8 + 200) = a1;
  *(void *)(v8 + 152) = v8;
  *(void *)(v8 + 160) = 0;
  *(unsigned char *)(v8 + 328) = 0;
  *(unsigned char *)(v8 + 336) = 0;
  *(void *)(v8 + 120) = 0;
  *(void *)(v8 + 128) = 0;
  *(void *)(v8 + 168) = 0;
  *(void *)(v8 + 176) = 0;
  *(void *)(v8 + 184) = 0;
  *(void *)(v8 + 136) = 0;
  *(void *)(v8 + 144) = 0;
  *(void *)(v8 + 192) = 0;
  sub_21DBACB08();
  *(void *)(v8 + 248) = swift_task_alloc();
  type metadata accessor for SFAirDropUtilities.FileLoadResult();
  *(void *)(v8 + 256) = swift_task_alloc();
  *(void *)(v8 + 160) = a2;
  *(unsigned char *)(v8 + 328) = a3 & 1;
  *(unsigned char *)(v8 + 336) = a4 & 1;
  *(double *)(v8 + 120) = a6;
  *(double *)(v8 + 128) = a7;
  *(void *)(v8 + 168) = a5;
  *(void *)(v8 + 176) = v7;
  return MEMORY[0x270FA2498](sub_21DB7FCAC, 0);
}

uint64_t sub_21DB7FCAC()
{
  char v1 = *(unsigned char *)(v0 + 329);
  *(void *)(v0 + 152) = v0;
  if (v1)
  {
    uint64_t v8 = *(void **)(v9 + 208);
    uint64_t v2 = sub_21DBAC708();
    *(void *)(v9 + 264) = v2;
    uint64_t v6 = *(void *)(v2 - 8);
    *(void *)(v9 + 272) = v6;
    *(void *)(v9 + 280) = *(void *)(v6 + 64);
    *(void *)(v9 + 288) = swift_task_alloc();
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB10);
    *(void *)(v9 + 296) = v7;
    *(void *)(v9 + 304) = *(void *)(*(void *)(v7 - 8) + 64);
    uint64_t v3 = swift_task_alloc();
    *(void *)(v9 + 312) = v3;
    *(_DWORD *)(v9 + 332) = *(_DWORD *)(v7 + 48);
    *(void *)(v9 + 16) = *(void *)(v9 + 152);
    *(void *)(v9 + 56) = v3;
    *(void *)(v9 + 24) = sub_21DB7FFD4;
    *(void *)(v9 + 112) = swift_continuation_init();
    *(void *)(v9 + 80) = MEMORY[0x263EF8330];
    *(_DWORD *)(v9 + 88) = 0x40000000;
    *(_DWORD *)(v9 + 92) = 0;
    *(void *)(v9 + 96) = sub_21DB8083C;
    *(void *)(v9 + 104) = &block_descriptor;
    objc_msgSend(v8, sel_loadFileURLRequiringOpenInPlace_completionHandler_, 0);
    return __swift_continuation_await_point();
  }
  else
  {
    sub_21DB7BCCC(*(void **)(v9 + 208), *(id *)(v9 + 232), 0);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v9 + 152) + 8);
    return v5();
  }
}

uint64_t sub_21DB7FFD4()
{
  uint64_t v4 = (void *)*v0;
  v4[19] = *v0;
  uint64_t v1 = v4[6];
  v4[40] = v1;
  if (v1)
  {
    uint64_t v2 = sub_21DB8069C;
  }
  else
  {
    uint64_t v2 = sub_21DB80124;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB80124()
{
  uint64_t v17 = *(int *)(v0 + 332);
  uint64_t v26 = *(void *)(v0 + 312);
  uint64_t v19 = *(void *)(v0 + 296);
  uint64_t v22 = *(void *)(v0 + 288);
  uint64_t v16 = *(void *)(v0 + 272);
  uint64_t v20 = *(void *)(v0 + 264);
  char v27 = *(unsigned char *)(v0 + 330);
  *(void *)(v0 + 152) = v0;
  uint64_t v25 = swift_task_alloc();
  uint64_t v18 = *(int *)(v19 + 48);
  unsigned __int8 v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
  v21(v25, v26, v20);
  *(_OWORD *)(v25 + v18) = *(_OWORD *)(v26 + v17);
  uint64_t v1 = (uint64_t *)(v25 + *(int *)(v19 + 48));
  uint64_t v23 = *v1;
  uint64_t v24 = v1[1];
  ((void (*)(uint64_t))v21)(v22);
  *(void *)(v0 + 136) = v23;
  *(void *)(v0 + 144) = v24;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v27) {
    uint64_t v14 = static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(*(void *)(v15 + 288), *(double *)(v15 + 216), *(double *)(v15 + 224));
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v11 = *(void *)(v15 + 288);
  uint64_t v12 = *(void *)(v15 + 264);
  uint64_t v10 = *(void *)(v15 + 272);
  *(void *)(v15 + 192) = v14;
  uint64_t v13 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v13, v11, v12);
  sub_21DB644A0();
  sub_21DBACB18();
  uint64_t v7 = *(void *)(v15 + 288);
  uint64_t v6 = *(void *)(v15 + 264);
  uint64_t v8 = *(void *)(v15 + 256);
  uint64_t v9 = *(void *)(v15 + 248);
  uint64_t v4 = *(void *)(v15 + 200);
  uint64_t v5 = *(void *)(v15 + 272);
  swift_task_dealloc();
  sub_21DB7AF00(v9, v23, v24, (uint64_t)v14, 0, v8);
  sub_21DB9FF64(v8, v4);
  sub_21DBA0068(v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v15 + 152) + 8);
  return v2();
}

uint64_t sub_21DB8069C()
{
  v0[19] = v0;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  id v7 = (id)v0[40];
  id v5 = (id)v0[29];
  uint64_t v6 = (void *)v0[26];
  id v1 = v7;
  v0[23] = v7;
  id v2 = v7;
  sub_21DB7BCCC(v6, v5, v7);

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0[19] + 8);
  return v3();
}

void sub_21DB8083C(uint64_t a1, id a2, void *a3, void *a4)
{
  uint64_t v38 = a1;
  id v35 = a2;
  id v36 = a3;
  id v37 = a4;
  id v4 = a2;
  id v5 = v36;
  id v6 = v37;
  uint64_t v39 = *(void *)(v38 + 32);
  if (v37)
  {
    id v34 = v37;
    id v22 = v37;
    id v20 = v37;
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB10);
    sub_21DB80A74(v39, (uint64_t)v37, v21);
  }
  else
  {
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB10);
    uint64_t v7 = *(void *)(*(void *)(v30 - 8) + 64);
    uint64_t v33 = &v22;
    unint64_t v23 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](v35);
    uint64_t v31 = (char *)&v22 - v23;
    id v9 = v8;
    uint64_t v28 = sub_21DBAC708();
    uint64_t v25 = *(void *)(v28 - 8);
    uint64_t v26 = v28 - 8;
    uint64_t v10 = *(void *)(v25 + 64);
    unint64_t v32 = &v22;
    unint64_t v24 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](v35);
    char v27 = (char *)&v22 - v24;
    sub_21DBAC6C8();
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v31, v27, v28);
    unint64_t v29 = &v31[*(int *)(v30 + 48)];
    id v11 = v36;
    uint64_t v12 = sub_21DBACCD8();
    uint64_t v13 = v29;
    uint64_t v14 = v30;
    uint64_t v15 = v12;
    uint64_t v16 = v39;
    uint64_t v18 = v17;
    uint64_t v19 = (uint64_t)v31;
    *(void *)unint64_t v29 = v15;
    *((void *)v13 + 1) = v18;
    sub_21DB80AD0(v16, v19, v14);
  }
}

uint64_t sub_21DB80A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = a3;
  v7[0] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E468);
  return sub_21DB9F3E4((uint64_t)v7, a1, a3, v3);
}

uint64_t sub_21DB80AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21DB9F364(a2, a1, a3);
}

uint64_t sub_21DB80B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8, double a9, double a10)
{
  *(void *)(v11 + 656) = v10;
  *(void *)(v11 + 648) = v33;
  *(void *)(v11 + 640) = v32;
  *(void *)(v11 + 632) = v31;
  *(void *)(v11 + 624) = v30;
  *(void *)(v11 + 616) = v29;
  *(void *)(v11 + 608) = v28;
  *(void *)(v11 + 600) = v27;
  *(double *)(v11 + 592) = a10;
  *(double *)(v11 + 584) = a9;
  *(unsigned char *)(v11 + 313) = v26 & 1;
  *(unsigned char *)(v11 + 299) = a8 & 1;
  *(unsigned char *)(v11 + 298) = a7 & 1;
  *(unsigned char *)(v11 + 297) = a6 & 1;
  *(void *)(v11 + 576) = a5;
  *(void *)(v11 + 568) = a4;
  *(void *)(v11 + 560) = a3;
  *(void *)(v11 + 552) = a2;
  *(void *)(v11 + 544) = a1;
  *(void *)(v11 + 320) = v11;
  *(void *)(v11 + 328) = 0;
  *(void *)(v11 + 336) = 0;
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  *(unsigned char *)(v11 + 1064) = 0;
  *(unsigned char *)(v11 + 1072) = 0;
  *(unsigned char *)(v11 + 1080) = 0;
  *(unsigned char *)(v11 + 1088) = 0;
  *(void *)(v11 + 32) = 0;
  *(void *)(v11 + 40) = 0;
  *(void *)(v11 + 48) = 0;
  *(void *)(v11 + 56) = 0;
  *(void *)(v11 + 64) = 0;
  *(void *)(v11 + 72) = 0;
  *(void *)(v11 + 344) = 0;
  *(void *)(v11 + 352) = 0;
  *(void *)(v11 + 360) = 0;
  *(void *)(v11 + 368) = 0;
  *(void *)(v11 + 80) = 0;
  *(void *)(v11 + 88) = 0;
  *(void *)(v11 + 96) = 0;
  *(void *)(v11 + 104) = 0;
  *(void *)(v11 + 392) = 0;
  *(void *)(v11 + 424) = 0;
  *(void *)(v11 + 448) = 0;
  *(void *)(v11 + 464) = 0;
  *(void *)(v11 + 304) = 0;
  *(unsigned char *)(v11 + 312) = 0;
  *(void *)(v11 + 128) = 0;
  *(void *)(v11 + 136) = 0;
  *(void *)(v11 + 176) = 0;
  *(void *)(v11 + 184) = 0;
  *(void *)(v11 + 192) = 0;
  *(void *)(v11 + 200) = 0;
  *(void *)(v11 + 208) = 0;
  *(void *)(v11 + 216) = 0;
  *(unsigned char *)(v11 + 1096) = 0;
  *(void *)(v11 + 512) = 0;
  *(void *)(v11 + 520) = 0;
  *(void *)(v11 + 528) = 0;
  *(void *)(v11 + 536) = 0;
  *(void *)(v11 + 256) = 0;
  *(void *)(v11 + 264) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0);
  *(void *)(v11 + 664) = swift_task_alloc();
  uint64_t v16 = sub_21DBACB08();
  *(void *)(v11 + 672) = v16;
  *(void *)(v11 + 680) = *(void *)(v16 - 8);
  *(void *)(v11 + 688) = swift_task_alloc();
  *(void *)(v11 + 696) = swift_task_alloc();
  *(void *)(v11 + 704) = swift_task_alloc();
  *(void *)(v11 + 712) = swift_task_alloc();
  uint64_t v17 = sub_21DBAC858();
  *(void *)(v11 + 720) = v17;
  *(void *)(v11 + 728) = *(void *)(v17 - 8);
  *(void *)(v11 + 736) = swift_task_alloc();
  uint64_t v18 = sub_21DBAC8A8();
  *(void *)(v11 + 744) = v18;
  *(void *)(v11 + 752) = *(void *)(v18 - 8);
  *(void *)(v11 + 760) = swift_task_alloc();
  *(void *)(v11 + 768) = swift_task_alloc();
  *(void *)(v11 + 776) = swift_task_alloc();
  type metadata accessor for SFAirDropUtilities.FileLoadResult();
  *(void *)(v11 + 784) = swift_task_alloc();
  *(void *)(v11 + 792) = swift_task_alloc();
  *(void *)(v11 + 800) = swift_task_alloc();
  *(void *)(v11 + 808) = swift_task_alloc();
  *(void *)(v11 + 816) = swift_task_alloc();
  *(void *)(v11 + 824) = swift_task_alloc();
  *(void *)(v11 + 328) = a2;
  *(void *)(v11 + 336) = a3;
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  *(unsigned char *)(v11 + 1064) = a6 & 1;
  *(unsigned char *)(v11 + 1072) = a7 & 1;
  *(unsigned char *)(v11 + 1080) = a8 & 1;
  *(unsigned char *)(v11 + 1088) = v26 & 1;
  *(double *)(v11 + 32) = a9;
  *(double *)(v11 + 40) = a10;
  *(void *)(v11 + 48) = v27;
  *(void *)(v11 + 56) = v28;
  *(void *)(v11 + 64) = v29;
  *(void *)(v11 + 72) = v30;
  *(void *)(v11 + 344) = v31;
  *(void *)(v11 + 352) = v32;
  *(void *)(v11 + 360) = v33;
  *(void *)(v11 + 368) = v10;
  return MEMORY[0x270FA2498](sub_21DB810EC, 0);
}

uint64_t sub_21DB810EC()
{
  uint64_t v100 = v0;
  uint64_t v1 = v0[70];
  id v2 = (void *)v0[69];
  v0[40] = v0;
  uint64_t v87 = static SFAirDropUtilities.highestFidelityDataType(for:conformingToDataTypes:)(v2, v1);
  uint64_t v88 = v3;
  v0[104] = v87;
  v0[105] = v3;
  v0[10] = v87;
  v0[11] = v3;
  swift_bridgeObjectRetain();
  if (v88)
  {
    uint64_t v4 = *(void *)(v86 + 640);
    *(void *)(v86 + 96) = v87;
    *(void *)(v86 + 104) = v88;
    *(void *)(v86 + 376) = v4;
    *(void *)(v86 + 112) = v87;
    *(void *)(v86 + 120) = v88;
    *(void *)(v86 + 848) = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB20);
    sub_21DBA01B4();
    if (sub_21DBACDC8())
    {
      uint64_t v61 = *(void **)(v86 + 648);
      id v62 = *(id *)(v86 + 552);
      id v13 = v61;
      *(void *)(v86 + 384) = v61;
      id v14 = v62;
      if (*(void *)(v86 + 384))
      {
        unsigned int v89 = *(void **)(v86 + 384);
      }
      else
      {
        id v60 = objc_msgSend(*(id *)(v86 + 552), sel_registeredTypeIdentifiers);
        uint64_t v59 = sub_21DBACDF8();
        sub_21DB9EDCC();
        unsigned int v89 = (void *)swift_allocError();
        *(void *)uint64_t v15 = v59;
        *(unsigned char *)(v15 + 8) = 1;

        sub_21DBA0238((id *)(v86 + 384));
      }
      uint64_t v16 = *(void *)(v86 + 768);
      uint64_t v37 = *(void *)(v86 + 744);
      id v38 = *(id *)(v86 + 552);
      uint64_t v36 = *(void *)(v86 + 752);

      *(void *)(v86 + 392) = v89;
      uint64_t v17 = sub_21DB7AC74();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v16, v17, v37);
      swift_bridgeObjectRetain();
      uint64_t v40 = swift_allocObject();
      *(void *)(v40 + 16) = v87;
      *(void *)(v40 + 24) = v88;
      id v18 = v38;
      uint64_t v42 = swift_allocObject();
      *(void *)(v42 + 16) = v38;
      id v19 = v89;
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = v89;
      sub_21DB7422C();
      swift_bridgeObjectRelease();
      log = sub_21DBAC888();
      os_log_type_t v58 = sub_21DBACF98();
      *(void *)(v86 + 400) = 32;
      sub_21DB6A04C();
      sub_21DB6A0C8();
      sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t v39 = *(_DWORD *)(v86 + 300);
      uint64_t v47 = swift_allocObject();
      *(unsigned char *)(v47 + 16) = 32;
      uint64_t v48 = swift_allocObject();
      *(unsigned char *)(v48 + 16) = 8;
      uint64_t v41 = swift_allocObject();
      *(void *)(v41 + 16) = sub_21DBA02A4;
      *(void *)(v41 + 24) = v40;
      uint64_t v49 = swift_allocObject();
      *(void *)(v49 + 16) = sub_21DB6B8C0;
      *(void *)(v49 + 24) = v41;
      uint64_t v50 = swift_allocObject();
      *(unsigned char *)(v50 + 16) = 64;
      uint64_t v51 = swift_allocObject();
      *(unsigned char *)(v51 + 16) = 8;
      uint64_t v43 = swift_allocObject();
      *(void *)(v43 + 16) = sub_21DB9FA68;
      *(void *)(v43 + 24) = v42;
      uint64_t v52 = swift_allocObject();
      *(void *)(v52 + 16) = sub_21DB74A80;
      *(void *)(v52 + 24) = v43;
      uint64_t v53 = swift_allocObject();
      *(unsigned char *)(v53 + 16) = 64;
      uint64_t v54 = swift_allocObject();
      *(unsigned char *)(v54 + 16) = 8;
      uint64_t v45 = swift_allocObject();
      *(void *)(v45 + 16) = sub_21DB75008;
      *(void *)(v45 + 24) = v44;
      uint64_t v46 = swift_allocObject();
      *(void *)(v46 + 16) = sub_21DB79F00;
      *(void *)(v46 + 24) = v45;
      uint64_t v55 = swift_allocObject();
      *(void *)(v55 + 16) = sub_21DB74A80;
      *(void *)(v55 + 24) = v46;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      sub_21DBAD308();
      uint64_t v56 = v20;
      swift_retain();
      *uint64_t v56 = sub_21DB6B84C;
      v56[1] = v47;
      swift_retain();
      v56[2] = sub_21DB6B84C;
      void v56[3] = v48;
      swift_retain();
      v56[4] = sub_21DB6B90C;
      v56[5] = v49;
      swift_retain();
      v56[6] = sub_21DB6B84C;
      v56[7] = v50;
      swift_retain();
      v56[8] = sub_21DB6B84C;
      v56[9] = v51;
      swift_retain();
      v56[10] = sub_21DB74C10;
      v56[11] = v52;
      swift_retain();
      v56[12] = sub_21DB6B84C;
      v56[13] = v53;
      swift_retain();
      v56[14] = sub_21DB6B84C;
      v56[15] = v54;
      swift_retain();
      v56[16] = sub_21DB74C10;
      v56[17] = v55;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(log, v58))
      {
        uint64_t v33 = (uint8_t *)sub_21DBAD038();
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v34 = sub_21DB6A1C0(2);
        uint64_t v35 = sub_21DB6A1C0(1);
        uint64_t v90 = v33;
        uint64_t v91 = v34;
        uint64_t v92 = v35;
        sub_21DB6A21C(2, &v90);
        sub_21DB6A21C(3, &v90);
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v94 = v47;
        sub_21DB6A230(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v94 = v48;
        sub_21DB6A230(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
        uint64_t v94 = v49;
        sub_21DB6A230(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v94 = v50;
        sub_21DB6A230(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v94 = v51;
        sub_21DB6A230(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
        uint64_t v94 = v52;
        sub_21DB6A230(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v94 = v53;
        sub_21DB6A230(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v94 = v54;
        sub_21DB6A230(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
        uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
        uint64_t v94 = v55;
        sub_21DB6A230(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
        _os_log_impl(&dword_21DB23000, log, v58, "Attempting to load data type %s which was already attempted. Aborting load for item provider %@ with error %@", v33, v39);
        sub_21DB6A27C(v34);
        sub_21DB6A27C(v35);
        sub_21DBAD018();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      uint64_t v31 = *(void *)(v86 + 768);
      uint64_t v32 = *(void *)(v86 + 744);
      uint64_t v30 = *(void *)(v86 + 752);

      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v32);
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v21 = *(uint64_t (**)(void))(*(void *)(v86 + 320) + 8);
      return v21();
    }
    else
    {
      uint64_t v5 = *(void *)(v86 + 776);
      uint64_t v70 = *(void *)(v86 + 744);
      id v71 = *(id *)(v86 + 552);
      uint64_t v69 = *(void *)(v86 + 752);
      uint64_t v6 = sub_21DB7AC74();
      uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 16);
      *(void *)(v86 + 856) = v7;
      *(void *)(v86 + 864) = (v69 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v7(v5, v6, v70);
      swift_bridgeObjectRetain();
      uint64_t v73 = swift_allocObject();
      *(void *)(v73 + 16) = v87;
      *(void *)(v73 + 24) = v88;
      id v8 = v71;
      uint64_t v75 = swift_allocObject();
      *(void *)(v75 + 16) = v71;
      oslog = sub_21DBAC888();
      os_log_type_t v85 = sub_21DBACF88();
      *(void *)(v86 + 408) = 22;
      *(void *)(v86 + 872) = sub_21DB6A04C();
      *(void *)(v86 + 880) = sub_21DB6A0C8();
      *(void *)(v86 + 888) = sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t size = *(_DWORD *)(v86 + 316);
      uint64_t v77 = swift_allocObject();
      *(unsigned char *)(v77 + 16) = 32;
      uint64_t v78 = swift_allocObject();
      *(unsigned char *)(v78 + 16) = 8;
      uint64_t v74 = swift_allocObject();
      *(void *)(v74 + 16) = sub_21DBA02A4;
      *(void *)(v74 + 24) = v73;
      uint64_t v79 = swift_allocObject();
      *(void *)(v79 + 16) = sub_21DB6B8C0;
      *(void *)(v79 + 24) = v74;
      uint64_t v80 = swift_allocObject();
      *(unsigned char *)(v80 + 16) = 64;
      uint64_t v81 = swift_allocObject();
      *(unsigned char *)(v81 + 16) = 8;
      uint64_t v76 = swift_allocObject();
      *(void *)(v76 + 16) = sub_21DB9FA68;
      *(void *)(v76 + 24) = v75;
      uint64_t v82 = swift_allocObject();
      *(void *)(v82 + 16) = sub_21DB74A80;
      *(void *)(v82 + 24) = v76;
      *(void *)(v86 + 896) = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      sub_21DBAD308();
      uint64_t v83 = v9;
      swift_retain();
      *uint64_t v83 = sub_21DB6B84C;
      v83[1] = v77;
      swift_retain();
      v83[2] = sub_21DB6B84C;
      v83[3] = v78;
      swift_retain();
      v83[4] = sub_21DB6B90C;
      v83[5] = v79;
      swift_retain();
      v83[6] = sub_21DB6B84C;
      v83[7] = v80;
      swift_retain();
      v83[8] = sub_21DB6B84C;
      v83[9] = v81;
      swift_retain();
      v83[10] = sub_21DB74C10;
      v83[11] = v82;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(oslog, v85))
      {
        buf = (uint8_t *)sub_21DBAD038();
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v67 = sub_21DB6A1C0(1);
        uint64_t v68 = sub_21DB6A1C0(1);
        uint64_t v95 = buf;
        uint64_t v96 = v67;
        uint64_t v97 = v68;
        sub_21DB6A21C(2, &v95);
        sub_21DB6A21C(2, &v95);
        uint32_t v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v99 = v77;
        sub_21DB6A230(&v98, (uint64_t)&v95, (uint64_t)&v96, (uint64_t)&v97);
        uint32_t v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v99 = v78;
        sub_21DB6A230(&v98, (uint64_t)&v95, (uint64_t)&v96, (uint64_t)&v97);
        uint32_t v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
        uint64_t v99 = v79;
        sub_21DB6A230(&v98, (uint64_t)&v95, (uint64_t)&v96, (uint64_t)&v97);
        uint32_t v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v99 = v80;
        sub_21DB6A230(&v98, (uint64_t)&v95, (uint64_t)&v96, (uint64_t)&v97);
        uint32_t v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v99 = v81;
        sub_21DB6A230(&v98, (uint64_t)&v95, (uint64_t)&v96, (uint64_t)&v97);
        uint32_t v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
        uint64_t v99 = v82;
        sub_21DB6A230(&v98, (uint64_t)&v95, (uint64_t)&v96, (uint64_t)&v97);
        _os_log_impl(&dword_21DB23000, oslog, v85, "Loading data type %s from item provider %@", buf, size);
        sub_21DB6A27C(v67);
        sub_21DB6A27C(v68);
        sub_21DBAD018();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      uint64_t v64 = *(void *)(v86 + 776);
      uint64_t v65 = *(void *)(v86 + 744);
      uint64_t v63 = *(void *)(v86 + 752);

      uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
      *(void *)(v86 + 904) = v10;
      *(void *)(v86 + 912) = (v63 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v10(v64, v65);
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v86 + 920) = v11;
      *uint64_t v11 = *(void *)(v86 + 320);
      v11[1] = sub_21DB83510;
      return sub_21DB8D550(v87, v88);
    }
  }
  else
  {
    id v22 = (void *)swift_task_alloc();
    *(void *)(v86 + 1000) = v22;
    *id v22 = *(void *)(v86 + 320);
    v22[1] = sub_21DB88ECC;
    uint64_t v23 = *(void *)(v86 + 792);
    uint64_t v24 = *(void *)(v86 + 648);
    double v25 = *(double *)(v86 + 592);
    double v26 = *(double *)(v86 + 584);
    uint64_t v27 = *(void *)(v86 + 552);
    char v28 = *(unsigned char *)(v86 + 297) & 1;
    char v29 = *(unsigned char *)(v86 + 299) & 1;
    return sub_21DB7FABC(v23, v27, v28, v29, v24, v26, v25);
  }
}

uint64_t sub_21DB83510(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[40] = *v2;
  v5[116] = a1;
  v5[117] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = sub_21DB89708;
  }
  else
  {
    uint64_t v3 = sub_21DB83684;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_21DB83684()
{
  uint64_t v220 = v0;
  uint64_t v209 = v0[116];
  uint64_t v208 = v0[105];
  uint64_t v207 = v0[104];
  v0[40] = v0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v0[52] = v209;
  swift_bridgeObjectRetain();
  v0[16] = v207;
  v0[17] = v208;
  self;
  uint64_t v210 = swift_dynamicCastObjCClass();
  if (v210)
  {
    unint64_t v205 = (void *)v210;
  }
  else
  {
    swift_unknownObjectRelease();
    unint64_t v205 = 0;
  }
  if (v205)
  {
    id v200 = objc_msgSend(v205, sel_string);
    uint64_t v201 = sub_21DBACCD8();
    uint64_t v202 = v1;

    uint64_t v203 = v201;
    uint64_t v204 = v202;
  }
  else
  {
    uint64_t v203 = 0;
    uint64_t v204 = 0;
  }
  *(void *)(v206 + 160) = v203;
  *(void *)(v206 + 168) = v204;
  if (*(void *)(v206 + 168))
  {
    swift_unknownObjectRelease();
    *(_OWORD *)(v206 + 144) = *(_OWORD *)(v206 + 160);
  }
  else
  {
    *(void *)(v206 + 488) = *(void *)(v206 + 928);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAE0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      *(void *)(v206 + 144) = 0;
      *(void *)(v206 + 152) = 0;
    }
    sub_21DB6C060();
  }
  uint64_t v198 = *(void *)(v206 + 144);
  uint64_t v199 = *(void *)(v206 + 152);
  *(void *)(v206 + 944) = v199;
  *(void *)(v206 + 176) = v198;
  *(void *)(v206 + 184) = v199;
  swift_bridgeObjectRetain();
  if (v199)
  {
    *(void *)(v206 + 256) = v198;
    *(void *)(v206 + 264) = v199;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0);
    uint64_t v194 = (const void *)swift_task_alloc();
    sub_21DBAC6E8();
    uint64_t v196 = sub_21DBAC708();
    uint64_t v195 = *(void *)(v196 - 8);
    uint64_t v193 = swift_task_alloc();
    uint64_t v197 = (void *)swift_task_alloc();
    sub_21DBA0BB4(v194, v197);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v195 + 48))(v197, 1, v196) == 1)
    {
      sub_21DB79AD0((uint64_t)v197);
      swift_task_dealloc();
      swift_task_dealloc();
    }
    else
    {
      (*(void (**)(uint64_t, void *, uint64_t))(v195 + 32))(v193, v197, v196);
      swift_task_dealloc();
      *(void *)(v206 + 272) = sub_21DBAC6D8();
      *(void *)(v206 + 280) = v2;
      BOOL v192 = *(void *)(v206 + 280) != 0;
      sub_21DB6C060();
      if (v192)
      {
        uint64_t v187 = *(void *)(v206 + 736);
        uint64_t v188 = *(void *)(v206 + 720);
        uint64_t v186 = *(void *)(v206 + 728);
        uint64_t v185 = swift_task_alloc();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v195 + 16))(v185, v193, v196);
        *(void *)(v206 + 416) = sub_21DBAC688();
        swift_unknownObjectRelease();
        uint64_t v191 = *(void (**)(uint64_t, uint64_t))(v195 + 8);
        v191(v185, v196);
        swift_task_dealloc();
        sub_21DBAC7C8();
        uint64_t v189 = sub_21DBAC778();
        uint64_t v190 = v3;
        (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v187, v188);
        *(void *)(v206 + 128) = v189;
        *(void *)(v206 + 136) = v190;
        swift_bridgeObjectRelease();
        v191(v193, v196);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v195 + 8))(v193, v196);
      }
      swift_task_dealloc();
    }
    sub_21DB79AD0((uint64_t)v194);
    swift_task_dealloc();
    swift_bridgeObjectRelease();
  }
  uint64_t v183 = sub_21DBAC708();
  *(void *)(v206 + 952) = v183;
  uint64_t v180 = *(void *)(v183 - 8);
  *(void *)(v206 + 960) = v180;
  uint64_t v181 = swift_task_alloc();
  *(void *)(v206 + 968) = v181;
  uint64_t v182 = *(void *)(v206 + 416);
  swift_unknownObjectRetain();
  *(void *)(v206 + 496) = v182;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0);
  uint64_t v184 = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAE0);
  if (swift_dynamicCast()) {
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v180 + 56))(v184, 0, 1, v183);
  }
  else {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v180 + 56))(v184, 1, 1, v183);
  }
  uint64_t v179 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v180 + 48);
  if (v179(v184, 1, v183) != 1)
  {
    char v178 = *(unsigned char *)(v206 + 299);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v180 + 32))(v181, v184, v183);
    swift_task_dealloc();
    if (v178) {
      uint64_t v177 = static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(v181, *(double *)(v206 + 584), *(double *)(v206 + 592));
    }
    else {
      uint64_t v177 = 0;
    }
    *(void *)(v206 + 976) = v177;
    char v4 = *(unsigned char *)(v206 + 313);
    *(void *)(v206 + 536) = v177;
    if (v4)
    {
      uint64_t v5 = (void *)swift_task_alloc();
      *(void *)(v206 + 984) = v5;
      *uint64_t v5 = *(void *)(v206 + 320);
      v5[1] = sub_21DB88918;
      uint64_t v6 = *(void *)(v206 + 712);
      uint64_t v7 = *(void *)(v206 + 608);
      uint64_t v8 = *(void *)(v206 + 600);
      return sub_21DB909B0(v6, v181, v8, v7);
    }
    uint64_t v10 = *(void **)(v206 + 936);
    uint64_t v176 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v180 + 16))(v176, v181, v183);
    sub_21DB644A0();
    sub_21DBACB18();
    if (!v10)
    {
      swift_task_dealloc();
      uint64_t v167 = *(void *)(v206 + 976);
      uint64_t v175 = *(void *)(v206 + 968);
      uint64_t v174 = *(void *)(v206 + 952);
      uint64_t v169 = *(void *)(v206 + 824);
      uint64_t v168 = *(void *)(v206 + 816);
      uint64_t v172 = *(void *)(v206 + 712);
      uint64_t v164 = *(void *)(v206 + 704);
      uint64_t v171 = *(void *)(v206 + 672);
      uint64_t v173 = *(void *)(v206 + 960);
      uint64_t v170 = *(void *)(v206 + 680);
      (*(void (**)(void))(v170 + 16))();
      uint64_t v165 = *(void *)(v206 + 128);
      uint64_t v166 = *(void *)(v206 + 136);
      swift_bridgeObjectRetain();
      sub_21DB7AF00(v164, v165, v166, v167, 0, v168);
      __n128 v11 = sub_21DBA0100(v168, v169);
      (*(void (**)(uint64_t, uint64_t, __n128))(v170 + 8))(v172, v171, v11);
      (*(void (**)(uint64_t, uint64_t))(v173 + 8))(v175, v174);
      swift_task_dealloc();
LABEL_80:
      swift_bridgeObjectRelease();
      sub_21DB6C060();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v94 = *(void *)(v206 + 824);
      sub_21DB9FF64(v94, *(void *)(v206 + 544));
      sub_21DBA0068(v94);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v27 = *(uint64_t (**)(void))(*(void *)(v206 + 320) + 8);
      return v27();
    }
    swift_task_dealloc();

    (*(void (**)(uint64_t, uint64_t))(v180 + 8))(v181, v183);
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    sub_21DB6C060();
    swift_unknownObjectRelease();
    id v161 = v10;
    goto LABEL_84;
  }
  char v163 = *(unsigned char *)(v206 + 298);
  sub_21DB79AD0(v184);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_bridgeObjectRetain();
  if (v163)
  {
    uint64_t v218 = v198;
    uint64_t v219 = v199;
    BOOL v162 = v199 != 0;
  }
  else
  {
    BOOL v162 = 0;
  }
  swift_bridgeObjectRelease();
  if (v162)
  {
    sub_21DB9EDCC();
    uint64_t v160 = swift_allocError();
    *(void *)uint64_t v12 = 1;
    *(unsigned char *)(v12 + 8) = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    sub_21DB6C060();
    swift_unknownObjectRelease();
    id v161 = (id)v160;
    goto LABEL_84;
  }
  swift_unknownObjectRetain();
  self;
  uint64_t v159 = swift_dynamicCastObjCClass();
  if (v159)
  {
    uint64_t v158 = (void *)v159;
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v158 = 0;
  }
  if (!v158)
  {
LABEL_65:
    id v18 = *(void **)(v206 + 936);
    int v118 = *(char **)(v206 + 664);
    uint64_t v120 = *(void *)(v206 + 576);
    uint64_t v119 = *(void *)(v206 + 568);
    uint64_t v115 = *(void *)(v206 + 128);
    uint64_t v116 = *(void *)(v206 + 136);
    swift_bridgeObjectRetain();
    sub_21DB915D4(v115, v116, 1, v118);
    uint64_t v117 = *(void *)(v206 + 416);
    swift_unknownObjectRetain();
    uint64_t v121 = sub_21DB7E038(v117, v118, v119, v120);
    unint64_t v122 = v19;
    uint64_t v123 = v20;
    uint64_t v124 = v21;
    if (!v18)
    {
      swift_unknownObjectRelease();
      *(void *)(v206 + 192) = v121;
      *(void *)(v206 + 200) = v122;
      *(void *)(v206 + 208) = v123;
      *(void *)(v206 + 216) = v124;
      swift_bridgeObjectRetain();
      *(void *)(v206 + 240) = v123;
      *(void *)(v206 + 248) = v124;
      if (*(void *)(v206 + 248))
      {
        *(_OWORD *)(v206 + 224) = *(_OWORD *)(v206 + 240);
      }
      else
      {
        sub_21DBA0B4C((void *)(v206 + 128), (void *)(v206 + 224));
        sub_21DB6C060();
      }
      uint64_t v114 = *(void *)(v206 + 608);
      uint64_t v111 = *(void *)(v206 + 224);
      uint64_t v112 = *(void *)(v206 + 232);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      *(void *)(v206 + 128) = v111;
      *(void *)(v206 + 136) = v112;
      swift_bridgeObjectRelease();
      uint64_t v109 = swift_task_alloc();
      sub_21DB9F7DC(v121, v122);
      id v110 = (id)sub_21DBAC718();
      sub_21DB9F750(v121, v122);
      id v113 = (id)sub_21DBACCC8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      if (v114)
      {
        uint64_t v107 = sub_21DBACCC8();
        swift_bridgeObjectRelease();
        uint64_t v108 = (void *)v107;
      }
      else
      {
        uint64_t v108 = 0;
      }
      char v106 = *(unsigned char *)(v206 + 299);
      swift_bridgeObjectRetain();
      id v103 = (id)sub_21DBACCC8();
      swift_bridgeObjectRelease();
      id v105 = (id)SFSaveDataToTempFile();

      uint64_t v104 = swift_task_alloc();
      sub_21DBAC6C8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v180 + 32))(v109, v104, v183);
      swift_task_dealloc();

      *(void *)(v206 + 504) = 0;
      if (v106)
      {
        swift_unknownObjectRetain();
        self;
        uint64_t v102 = swift_dynamicCastObjCClass();
        if (v102)
        {
          uint64_t v101 = (void *)v102;
        }
        else
        {
          swift_unknownObjectRelease();
          uint64_t v101 = 0;
        }
        if (v101)
        {
          *(void *)(v206 + 512) = v101;
          id v22 = v101;
          uint64_t v23 = *(void **)(v206 + 504);
          *(void *)(v206 + 504) = v101;
        }
        else
        {
          uint64_t v24 = static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(v109, *(double *)(v206 + 584), *(double *)(v206 + 592));
          double v25 = *(void **)(v206 + 504);
          *(void *)(v206 + 504) = v24;
        }
      }
      uint64_t v216 = v198;
      uint64_t v217 = v199;
      *(unsigned char *)(v206 + 1096) = v199 != 0;
      uint64_t v100 = swift_task_alloc();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v180 + 16))(v100, v109, v183);
      sub_21DB644A0();
      sub_21DBACB18();
      uint64_t v98 = *(void *)(v206 + 824);
      uint64_t v97 = *(void *)(v206 + 800);
      uint64_t v96 = *(void *)(v206 + 688);
      uint64_t v99 = *(void *)(v206 + 664);
      swift_task_dealloc();
      uint64_t v95 = *(void **)(v206 + 504);
      id v26 = v95;
      sub_21DB7AF00(v96, v111, v112, (uint64_t)v95, v199 != 0, v97);
      sub_21DBA0100(v97, v98);
      sub_21DB74628((id *)(v206 + 504));
      (*(void (**)(uint64_t, uint64_t))(v180 + 8))(v109, v183);
      swift_task_dealloc();
      swift_bridgeObjectRelease();
      sub_21DB9F750(v121, v122);
      sub_21DB9F1A8(v99);
      goto LABEL_80;
    }
    uint64_t v55 = *(void *)(v206 + 664);
    swift_unknownObjectRelease();
    sub_21DB9F1A8(v55);
    swift_bridgeObjectRelease();
    sub_21DB6C060();
    swift_unknownObjectRelease();
    id v161 = v18;
    goto LABEL_84;
  }
  *(void *)(v206 + 520) = v158;
  uint64_t v155 = swift_task_alloc();
  id v156 = objc_msgSend(v158, sel_imageURL);
  uint64_t v13 = swift_task_alloc();
  uint64_t v157 = v13;
  if (v156)
  {
    uint64_t v154 = swift_task_alloc();
    sub_21DBAC6C8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v180 + 32))(v157, v154, v183);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v180 + 56))(v157, 0, 1, v183);
    swift_task_dealloc();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v180 + 56))(v13, 1, 1, v183);
  }
  if (v179(v157, 1, v183) == 1)
  {
    sub_21DB79AD0(v157);
    swift_task_dealloc();
    swift_task_dealloc();

    goto LABEL_65;
  }
  char v153 = *(unsigned char *)(v206 + 299);
  uint64_t v152 = *(void (**)(uint64_t, uint64_t, uint64_t))(v180 + 32);
  v152(v155, v157, v183);
  swift_task_dealloc();
  if (v153) {
    unint64_t v151 = static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(v155, *(double *)(v206 + 584), *(double *)(v206 + 592));
  }
  else {
    unint64_t v151 = 0;
  }
  uint64_t v144 = *(void *)(v206 + 624);
  uint64_t v145 = *(void *)(v206 + 616);
  *(void *)(v206 + 528) = v151;
  uint64_t v143 = swift_task_alloc();
  uint64_t v148 = swift_task_alloc();
  type metadata accessor for SFAirDropUtilities();
  sub_21DB91430(v145, v144, v148);
  id v146 = (id)sub_21DBAC688();
  uint64_t v147 = *(void (**)(uint64_t, uint64_t))(v180 + 8);
  v147(v148, v183);
  swift_task_dealloc();
  id v149 = objc_msgSend(v158, sel_videoURL);
  uint64_t v14 = swift_task_alloc();
  uint64_t v150 = v14;
  if (v149)
  {
    uint64_t v142 = swift_task_alloc();
    sub_21DBAC6C8();
    v152(v150, v142, v183);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v180 + 56))(v150, 0, 1, v183);
    swift_task_dealloc();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v180 + 56))(v14, 1, 1, v183);
  }
  if (v179(v150, 1, v183) == 1)
  {
    uint64_t v141 = 0;
  }
  else
  {
    uint64_t v140 = sub_21DBAC688();
    v147(v150, v183);
    uint64_t v141 = (void *)v140;
  }
  swift_task_dealloc();
  id v138 = objc_msgSend(v158, sel_imageURL);
  uint64_t v15 = swift_task_alloc();
  uint64_t v139 = v15;
  if (v138)
  {
    uint64_t v137 = swift_task_alloc();
    sub_21DBAC6C8();
    v152(v139, v137, v183);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v180 + 56))(v139, 0, 1, v183);
    swift_task_dealloc();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v180 + 56))(v15, 1, 1, v183);
  }
  if (v179(v139, 1, v183) == 1)
  {
    unint64_t v136 = 0;
  }
  else
  {
    uint64_t v135 = sub_21DBAC688();
    v147(v139, v183);
    unint64_t v136 = (void *)v135;
  }
  uint64_t v16 = *(void **)(v206 + 936);
  swift_task_dealloc();
  id v130 = objc_msgSend(v158, sel_uniqueIdentifier);
  sub_21DBACCD8();
  id v131 = (id)sub_21DBACCC8();
  swift_bridgeObjectRelease();

  id v133 = (id)SFCreateLivePhotoBundle();
  uint64_t v132 = swift_task_alloc();
  sub_21DBAC6C8();
  v152(v143, v132, v183);
  swift_task_dealloc();

  uint64_t v134 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v180 + 16))(v134, v143, v183);
  sub_21DB644A0();
  sub_21DBACB18();
  if (!v16)
  {
    uint64_t v129 = *(void *)(v206 + 824);
    uint64_t v128 = *(void *)(v206 + 808);
    uint64_t v125 = *(void *)(v206 + 696);
    swift_task_dealloc();
    uint64_t v126 = *(void *)(v206 + 128);
    uint64_t v127 = *(void *)(v206 + 136);
    swift_bridgeObjectRetain();
    sub_21DB7AF00(v125, v126, v127, (uint64_t)v151, 0, v128);
    __n128 v17 = sub_21DBA0100(v128, v129);
    ((void (*)(uint64_t, uint64_t, __n128))v147)(v143, v183, v17);
    swift_task_dealloc();
    v147(v155, v183);
    swift_task_dealloc();

    goto LABEL_80;
  }
  swift_task_dealloc();
  v147(v143, v183);
  swift_task_dealloc();

  v147(v155, v183);
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  sub_21DB6C060();
  swift_unknownObjectRelease();
  id v161 = v16;
LABEL_84:
  *(void *)(v206 + 1016) = v161;
  uint64_t v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(v206 + 856);
  uint64_t v77 = *(void *)(v206 + 832);
  uint64_t v28 = *(void *)(v206 + 760);
  uint64_t v75 = *(void *)(v206 + 744);
  uint64_t v78 = *(void *)(v206 + 840);
  id v29 = v161;
  *(void *)(v206 + 424) = v161;
  uint64_t v30 = sub_21DB7AC74();
  v76(v28, v30, v75);
  swift_bridgeObjectRetain();
  uint64_t v80 = swift_allocObject();
  *(void *)(v80 + 16) = v77;
  *(void *)(v80 + 24) = v78;
  id v31 = v161;
  uint64_t v82 = swift_allocObject();
  *(void *)(v82 + 16) = v161;
  sub_21DB7422C();
  swift_bridgeObjectRelease();
  oslog = sub_21DBAC888();
  os_log_type_t v93 = sub_21DBACF98();
  *(void *)(v206 + 432) = 22;
  sub_21DBACDD8();
  uint32_t size = *(_DWORD *)(v206 + 1068);
  uint64_t v85 = swift_allocObject();
  *(unsigned char *)(v85 + 16) = 32;
  uint64_t v86 = swift_allocObject();
  *(unsigned char *)(v86 + 16) = 8;
  uint64_t v81 = swift_allocObject();
  *(void *)(v81 + 16) = sub_21DBA02A4;
  *(void *)(v81 + 24) = v80;
  uint64_t v87 = swift_allocObject();
  *(void *)(v87 + 16) = sub_21DB6B8C0;
  *(void *)(v87 + 24) = v81;
  uint64_t v88 = swift_allocObject();
  *(unsigned char *)(v88 + 16) = 64;
  uint64_t v89 = swift_allocObject();
  *(unsigned char *)(v89 + 16) = 8;
  uint64_t v83 = swift_allocObject();
  *(void *)(v83 + 16) = sub_21DB75008;
  *(void *)(v83 + 24) = v82;
  uint64_t v84 = swift_allocObject();
  *(void *)(v84 + 16) = sub_21DB79F00;
  *(void *)(v84 + 24) = v83;
  uint64_t v90 = swift_allocObject();
  *(void *)(v90 + 16) = sub_21DB74A80;
  *(void *)(v90 + 24) = v84;
  sub_21DBAD308();
  uint64_t v91 = v32;
  swift_retain();
  *uint64_t v91 = sub_21DB6B84C;
  v91[1] = v85;
  swift_retain();
  v91[2] = sub_21DB6B84C;
  v91[3] = v86;
  swift_retain();
  v91[4] = sub_21DB6B90C;
  v91[5] = v87;
  swift_retain();
  v91[6] = sub_21DB6B84C;
  v91[7] = v88;
  swift_retain();
  v91[8] = sub_21DB6B84C;
  v91[9] = v89;
  swift_retain();
  v91[10] = sub_21DB74C10;
  v91[11] = v90;
  sub_21DB6120C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v93))
  {
    buf = (uint8_t *)sub_21DBAD038();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
    uint64_t v73 = sub_21DB6A1C0(1);
    uint64_t v74 = sub_21DB6A1C0(1);
    uint64_t v211 = buf;
    uint64_t v212 = v73;
    uint64_t v213 = v74;
    sub_21DB6A21C(2, &v211);
    sub_21DB6A21C(2, &v211);
    unint64_t v214 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v215 = v85;
    sub_21DB6A230(&v214, (uint64_t)&v211, (uint64_t)&v212, (uint64_t)&v213);
    unint64_t v214 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v215 = v86;
    sub_21DB6A230(&v214, (uint64_t)&v211, (uint64_t)&v212, (uint64_t)&v213);
    unint64_t v214 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
    uint64_t v215 = v87;
    sub_21DB6A230(&v214, (uint64_t)&v211, (uint64_t)&v212, (uint64_t)&v213);
    unint64_t v214 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v215 = v88;
    sub_21DB6A230(&v214, (uint64_t)&v211, (uint64_t)&v212, (uint64_t)&v213);
    unint64_t v214 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v215 = v89;
    sub_21DB6A230(&v214, (uint64_t)&v211, (uint64_t)&v212, (uint64_t)&v213);
    unint64_t v214 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
    uint64_t v215 = v90;
    sub_21DB6A230(&v214, (uint64_t)&v211, (uint64_t)&v212, (uint64_t)&v213);
    _os_log_impl(&dword_21DB23000, oslog, v93, "Failed to load item for type identifier %s with error: %@", buf, size);
    sub_21DB6A27C(v73);
    sub_21DB6A27C(v74);
    sub_21DBAD018();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v206 + 904);
  uint64_t v68 = *(void *)(v206 + 832);
  uint64_t v64 = *(void *)(v206 + 760);
  uint64_t v65 = *(void *)(v206 + 744);
  uint64_t v67 = *(void *)(v206 + 560);
  uint64_t v69 = *(void *)(v206 + 840);

  v66(v64, v65);
  swift_bridgeObjectRetain();
  *(void *)(v206 + 440) = v67;
  swift_bridgeObjectRetain();
  uint64_t v70 = swift_task_alloc();
  *(void *)(v70 + 16) = v68;
  *(void *)(v70 + 24) = v69;
  sub_21DBA0AC8();
  uint64_t v71 = sub_21DBAD0D8();
  *(void *)(v206 + 1024) = v71;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  *(void *)(v206 + 448) = v71;
  id v33 = v161;
  *(void *)(v206 + 456) = v161;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E468);
  if (swift_dynamicCast())
  {
    id v62 = *(void **)(v206 + 288);
    unsigned __int8 v63 = *(unsigned char *)(v206 + 296);
  }
  else
  {
    id v62 = 0;
    unsigned __int8 v63 = -1;
  }
  if (v63 == 255) {
    goto LABEL_97;
  }
  *(void *)(v206 + 304) = v62;
  *(unsigned char *)(v206 + 312) = v63;
  sub_21DB9EE4C(v62, v63);
  if (v63 != 2 || v62 != (void *)1)
  {
    sub_21DB9EEB0(v62, v63);
    sub_21DB9EEB0(v62, v63);
LABEL_97:
    uint64_t v57 = *(void *)(v206 + 832);
    id v61 = *(id *)(v206 + 648);
    uint64_t v58 = *(void *)(v206 + 840);
    sub_21DBAD308();
    uint64_t v59 = v36;
    swift_bridgeObjectRetain();
    *uint64_t v59 = v57;
    v59[1] = v58;
    sub_21DB6120C();
    uint64_t v60 = sub_21DBACE08();
    *(void *)(v206 + 1032) = v60;
    swift_bridgeObjectRelease();
    *(void *)(v206 + 464) = v60;
    id v37 = v61;
    *(void *)(v206 + 480) = v61;
    id v38 = v161;
    if (*(void *)(v206 + 480))
    {
      *(void *)(v206 + 472) = *(void *)(v206 + 480);
    }
    else
    {
      id v39 = v161;
      *(void *)(v206 + 472) = v161;
      sub_21DBA0238((id *)(v206 + 480));
    }

    uint64_t v56 = *(void *)(v206 + 472);
    *(void *)(v206 + 1040) = v56;
    uint64_t v40 = (void *)swift_task_alloc();
    *(void *)(v206 + 1048) = v40;
    *uint64_t v40 = *(void *)(v206 + 320);
    v40[1] = sub_21DB89294;
    uint64_t v41 = *(void *)(v206 + 784);
    uint64_t v42 = *(void *)(v206 + 632);
    uint64_t v43 = *(void *)(v206 + 624);
    uint64_t v44 = *(void *)(v206 + 616);
    uint64_t v45 = *(void *)(v206 + 608);
    uint64_t v46 = *(void *)(v206 + 600);
    v47.n128_u64[0] = *(void *)(v206 + 592);
    v48.n128_u64[0] = *(void *)(v206 + 584);
    char v49 = *(unsigned char *)(v206 + 299);
    char v50 = *(unsigned char *)(v206 + 298);
    char v51 = *(unsigned char *)(v206 + 297);
    uint64_t v52 = *(void *)(v206 + 576);
    uint64_t v53 = *(void *)(v206 + 568);
    uint64_t v54 = *(void *)(v206 + 552);
    char v222 = *(unsigned char *)(v206 + 313) & 1;
    uint64_t v223 = v46;
    uint64_t v224 = v45;
    uint64_t v225 = v44;
    uint64_t v226 = v43;
    uint64_t v227 = v42;
    uint64_t v228 = v60;
    uint64_t v229 = v56;
    return sub_21DB80B24(v41, v54, v71, v53, v52, v51 & 1, v50 & 1, v49 & 1, v48, v47);
  }
  sub_21DB9EE4C((id)1, v63);
  sub_21DB9EDCC();
  swift_allocError();
  *(void *)uint64_t v34 = 1;
  *(unsigned char *)(v34 + 8) = v63;
  swift_willThrow();
  sub_21DB9EEB0((void *)1, v63);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(*(void *)(v206 + 320) + 8);
  return v35();
}

uint64_t sub_21DB88918()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 320) = *v1;
  *(void *)(v4 + 992) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_21DB8AF2C;
  }
  else
  {
    uint64_t v2 = sub_21DB88A84;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB88A84()
{
  v0[40] = v0;
  uint64_t v7 = v0[122];
  uint64_t v15 = v0[121];
  uint64_t v13 = v0[120];
  uint64_t v14 = v0[119];
  uint64_t v9 = v0[103];
  uint64_t v8 = v0[102];
  uint64_t v12 = v0[89];
  uint64_t v4 = v0[88];
  uint64_t v10 = v0[85];
  uint64_t v11 = v0[84];
  (*(void (**)(void))(v10 + 16))();
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[17];
  swift_bridgeObjectRetain();
  sub_21DB7AF00(v4, v5, v6, v7, 0, v8);
  __n128 v1 = sub_21DBA0100(v8, v9);
  (*(void (**)(uint64_t, uint64_t, __n128))(v10 + 8))(v12, v11, v1);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v14);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_21DB6C060();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v16 = v0[103];
  sub_21DB9FF64(v16, v0[68]);
  sub_21DBA0068(v16);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[40] + 8);
  return v2();
}

uint64_t sub_21DB88ECC()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 320) = *v1;
  *(void *)(v4 + 1008) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_21DB8CA5C;
  }
  else
  {
    uint64_t v2 = sub_21DB89038;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB89038()
{
  uint64_t v1 = v0[103];
  uint64_t v2 = v0[99];
  v0[40] = v0;
  sub_21DBA0100(v2, v1);
  uint64_t v5 = v0[103];
  sub_21DB9FF64(v5, v0[68]);
  sub_21DBA0068(v5);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0[40] + 8);
  return v3();
}

uint64_t sub_21DB89294()
{
  uint64_t v5 = *v1;
  uint64_t v4 = *v1 + 16;
  *(void *)(v5 + 320) = *v1;
  *(void *)(v5 + 1056) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_21DB8C7C0;
  }
  else
  {

    uint64_t v2 = sub_21DB89418;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB89418()
{
  id v5 = (id)v0[127];
  uint64_t v1 = v0[103];
  uint64_t v2 = v0[98];
  v0[40] = v0;
  sub_21DBA0100(v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v6 = v0[103];
  sub_21DB9FF64(v6, v0[68]);
  sub_21DBA0068(v6);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0[40] + 8);
  return v3();
}

uint64_t sub_21DB89708()
{
  uint64_t v73 = v0;
  *(void *)(v0 + 320) = v0;
  id v52 = *(id *)(v0 + 936);
  *(void *)(v0 + 1016) = v52;
  char v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 856);
  uint64_t v51 = *(void *)(v0 + 840);
  uint64_t v50 = *(void *)(v0 + 832);
  uint64_t v1 = *(void *)(v0 + 760);
  uint64_t v48 = *(void *)(v0 + 744);
  id v2 = v52;
  *(void *)(v0 + 424) = v52;
  uint64_t v3 = sub_21DB7AC74();
  v49(v1, v3, v48);
  swift_bridgeObjectRetain();
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = v50;
  *(void *)(v54 + 24) = v51;
  id v4 = v52;
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = v52;
  sub_21DB7422C();
  swift_bridgeObjectRelease();
  oslog = sub_21DBAC888();
  os_log_type_t v67 = sub_21DBACF98();
  *(void *)(v0 + 432) = 22;
  sub_21DBACDD8();
  uint32_t size = *(_DWORD *)(v0 + 1068);
  uint64_t v59 = swift_allocObject();
  *(unsigned char *)(v59 + 16) = 32;
  uint64_t v60 = swift_allocObject();
  *(unsigned char *)(v60 + 16) = 8;
  uint64_t v55 = swift_allocObject();
  *(void *)(v55 + 16) = sub_21DBA02A4;
  *(void *)(v55 + 24) = v54;
  uint64_t v61 = swift_allocObject();
  *(void *)(v61 + 16) = sub_21DB6B8C0;
  *(void *)(v61 + 24) = v55;
  uint64_t v62 = swift_allocObject();
  *(unsigned char *)(v62 + 16) = 64;
  uint64_t v63 = swift_allocObject();
  *(unsigned char *)(v63 + 16) = 8;
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = sub_21DB75008;
  *(void *)(v57 + 24) = v56;
  uint64_t v58 = swift_allocObject();
  *(void *)(v58 + 16) = sub_21DB79F00;
  *(void *)(v58 + 24) = v57;
  uint64_t v64 = swift_allocObject();
  *(void *)(v64 + 16) = sub_21DB74A80;
  *(void *)(v64 + 24) = v58;
  sub_21DBAD308();
  uint64_t v65 = v5;
  swift_retain();
  *uint64_t v65 = sub_21DB6B84C;
  v65[1] = v59;
  swift_retain();
  v65[2] = sub_21DB6B84C;
  v65[3] = v60;
  swift_retain();
  v65[4] = sub_21DB6B90C;
  v65[5] = v61;
  swift_retain();
  v65[6] = sub_21DB6B84C;
  v65[7] = v62;
  swift_retain();
  v65[8] = sub_21DB6B84C;
  v65[9] = v63;
  swift_retain();
  v65[10] = sub_21DB74C10;
  v65[11] = v64;
  sub_21DB6120C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v67))
  {
    buf = (uint8_t *)sub_21DBAD038();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
    uint64_t v46 = sub_21DB6A1C0(1);
    uint64_t v47 = sub_21DB6A1C0(1);
    uint64_t v68 = buf;
    uint64_t v69 = v46;
    uint64_t v70 = v47;
    sub_21DB6A21C(2, &v68);
    sub_21DB6A21C(2, &v68);
    uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v72 = v59;
    sub_21DB6A230(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v72 = v60;
    sub_21DB6A230(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
    uint64_t v72 = v61;
    sub_21DB6A230(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v72 = v62;
    sub_21DB6A230(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v72 = v63;
    sub_21DB6A230(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
    uint64_t v72 = v64;
    sub_21DB6A230(&v71, (uint64_t)&v68, (uint64_t)&v69, (uint64_t)&v70);
    _os_log_impl(&dword_21DB23000, oslog, v67, "Failed to load item for type identifier %s with error: %@", buf, size);
    sub_21DB6A27C(v46);
    sub_21DB6A27C(v47);
    sub_21DBAD018();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  id v39 = *(void (**)(uint64_t, uint64_t))(v0 + 904);
  uint64_t v41 = *(void *)(v0 + 832);
  uint64_t v37 = *(void *)(v0 + 760);
  uint64_t v38 = *(void *)(v0 + 744);
  uint64_t v40 = *(void *)(v0 + 560);
  uint64_t v42 = *(void *)(v0 + 840);

  v39(v37, v38);
  swift_bridgeObjectRetain();
  *(void *)(v0 + 440) = v40;
  swift_bridgeObjectRetain();
  uint64_t v43 = swift_task_alloc();
  *(void *)(v43 + 16) = v41;
  *(void *)(v43 + 24) = v42;
  sub_21DBA0AC8();
  uint64_t v44 = sub_21DBAD0D8();
  *(void *)(v0 + 1024) = v44;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 448) = v44;
  id v6 = v52;
  *(void *)(v0 + 456) = v52;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E468);
  if (swift_dynamicCast())
  {
    uint64_t v35 = *(void **)(v0 + 288);
    unsigned __int8 v36 = *(unsigned char *)(v0 + 296);
  }
  else
  {
    uint64_t v35 = 0;
    unsigned __int8 v36 = -1;
  }
  if (v36 == 255)
  {
LABEL_14:
    uint64_t v30 = *(void *)(v0 + 832);
    id v34 = *(id *)(v0 + 648);
    uint64_t v31 = *(void *)(v0 + 840);
    sub_21DBAD308();
    uint64_t v32 = v10;
    swift_bridgeObjectRetain();
    *uint64_t v32 = v30;
    v32[1] = v31;
    sub_21DB6120C();
    uint64_t v33 = sub_21DBACE08();
    *(void *)(v0 + 1032) = v33;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 464) = v33;
    id v11 = v34;
    *(void *)(v0 + 480) = v34;
    id v12 = v52;
    if (*(void *)(v0 + 480))
    {
      *(void *)(v0 + 472) = *(void *)(v0 + 480);
    }
    else
    {
      id v13 = v52;
      *(void *)(v0 + 472) = v52;
      sub_21DBA0238((id *)(v0 + 480));
    }

    uint64_t v29 = *(void *)(v0 + 472);
    *(void *)(v0 + 1040) = v29;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 1048) = v14;
    void *v14 = *(void *)(v0 + 320);
    v14[1] = sub_21DB89294;
    uint64_t v15 = *(void *)(v0 + 784);
    uint64_t v16 = *(void *)(v0 + 632);
    uint64_t v17 = *(void *)(v0 + 624);
    uint64_t v18 = *(void *)(v0 + 616);
    uint64_t v19 = *(void *)(v0 + 608);
    uint64_t v20 = *(void *)(v0 + 600);
    v21.n128_u64[0] = *(void *)(v0 + 592);
    v22.n128_u64[0] = *(void *)(v0 + 584);
    char v23 = *(unsigned char *)(v0 + 299);
    char v24 = *(unsigned char *)(v0 + 298);
    char v25 = *(unsigned char *)(v0 + 297);
    uint64_t v26 = *(void *)(v0 + 576);
    uint64_t v27 = *(void *)(v0 + 568);
    uint64_t v28 = *(void *)(v0 + 552);
    char v75 = *(unsigned char *)(v0 + 313) & 1;
    uint64_t v76 = v20;
    uint64_t v77 = v19;
    uint64_t v78 = v18;
    uint64_t v79 = v17;
    uint64_t v80 = v16;
    uint64_t v81 = v33;
    uint64_t v82 = v29;
    return sub_21DB80B24(v15, v28, v44, v27, v26, v25 & 1, v24 & 1, v23 & 1, v22, v21);
  }
  *(void *)(v0 + 304) = v35;
  *(unsigned char *)(v0 + 312) = v36;
  sub_21DB9EE4C(v35, v36);
  if (v36 != 2 || v35 != (void *)1)
  {
    sub_21DB9EEB0(v35, v36);
    sub_21DB9EEB0(v35, v36);
    goto LABEL_14;
  }
  sub_21DB9EE4C((id)1, v36);
  sub_21DB9EDCC();
  swift_allocError();
  *(void *)uint64_t v7 = 1;
  *(unsigned char *)(v7 + 8) = v36;
  swift_willThrow();
  sub_21DB9EEB0((void *)1, v36);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(*(void *)(v0 + 320) + 8);
  return v8();
}

uint64_t sub_21DB8AF2C()
{
  uint64_t v78 = v0;
  uint64_t v1 = (void *)v0[122];
  uint64_t v51 = v0[121];
  uint64_t v49 = v0[120];
  uint64_t v50 = v0[119];
  v0[40] = v0;

  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v51, v50);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_21DB6C060();
  swift_unknownObjectRelease();
  id v56 = *(id *)(v57 + 992);
  *(void *)(v57 + 1016) = v56;
  uint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 856);
  uint64_t v55 = *(void *)(v57 + 840);
  uint64_t v54 = *(void *)(v57 + 832);
  uint64_t v2 = *(void *)(v57 + 760);
  uint64_t v52 = *(void *)(v57 + 744);
  id v3 = v56;
  *(void *)(v57 + 424) = v56;
  uint64_t v4 = sub_21DB7AC74();
  v53(v2, v4, v52);
  swift_bridgeObjectRetain();
  uint64_t v59 = swift_allocObject();
  *(void *)(v59 + 16) = v54;
  *(void *)(v59 + 24) = v55;
  id v5 = v56;
  uint64_t v61 = swift_allocObject();
  *(void *)(v61 + 16) = v56;
  sub_21DB7422C();
  swift_bridgeObjectRelease();
  oslog = sub_21DBAC888();
  os_log_type_t v72 = sub_21DBACF98();
  *(void *)(v57 + 432) = 22;
  sub_21DBACDD8();
  uint32_t size = *(_DWORD *)(v57 + 1068);
  uint64_t v64 = swift_allocObject();
  *(unsigned char *)(v64 + 16) = 32;
  uint64_t v65 = swift_allocObject();
  *(unsigned char *)(v65 + 16) = 8;
  uint64_t v60 = swift_allocObject();
  *(void *)(v60 + 16) = sub_21DBA02A4;
  *(void *)(v60 + 24) = v59;
  uint64_t v66 = swift_allocObject();
  *(void *)(v66 + 16) = sub_21DB6B8C0;
  *(void *)(v66 + 24) = v60;
  uint64_t v67 = swift_allocObject();
  *(unsigned char *)(v67 + 16) = 64;
  uint64_t v68 = swift_allocObject();
  *(unsigned char *)(v68 + 16) = 8;
  uint64_t v62 = swift_allocObject();
  *(void *)(v62 + 16) = sub_21DB75008;
  *(void *)(v62 + 24) = v61;
  uint64_t v63 = swift_allocObject();
  *(void *)(v63 + 16) = sub_21DB79F00;
  *(void *)(v63 + 24) = v62;
  uint64_t v69 = swift_allocObject();
  *(void *)(v69 + 16) = sub_21DB74A80;
  *(void *)(v69 + 24) = v63;
  sub_21DBAD308();
  uint64_t v70 = v6;
  swift_retain();
  *uint64_t v70 = sub_21DB6B84C;
  v70[1] = v64;
  swift_retain();
  v70[2] = sub_21DB6B84C;
  v70[3] = v65;
  swift_retain();
  v70[4] = sub_21DB6B90C;
  v70[5] = v66;
  swift_retain();
  v70[6] = sub_21DB6B84C;
  v70[7] = v67;
  swift_retain();
  v70[8] = sub_21DB6B84C;
  v70[9] = v68;
  swift_retain();
  v70[10] = sub_21DB74C10;
  v70[11] = v69;
  sub_21DB6120C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v72))
  {
    buf = (uint8_t *)sub_21DBAD038();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
    uint64_t v47 = sub_21DB6A1C0(1);
    uint64_t v48 = sub_21DB6A1C0(1);
    uint64_t v73 = buf;
    uint64_t v74 = v47;
    uint64_t v75 = v48;
    sub_21DB6A21C(2, &v73);
    sub_21DB6A21C(2, &v73);
    uint64_t v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v77 = v64;
    sub_21DB6A230(&v76, (uint64_t)&v73, (uint64_t)&v74, (uint64_t)&v75);
    uint64_t v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v77 = v65;
    sub_21DB6A230(&v76, (uint64_t)&v73, (uint64_t)&v74, (uint64_t)&v75);
    uint64_t v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
    uint64_t v77 = v66;
    sub_21DB6A230(&v76, (uint64_t)&v73, (uint64_t)&v74, (uint64_t)&v75);
    uint64_t v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v77 = v67;
    sub_21DB6A230(&v76, (uint64_t)&v73, (uint64_t)&v74, (uint64_t)&v75);
    uint64_t v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v77 = v68;
    sub_21DB6A230(&v76, (uint64_t)&v73, (uint64_t)&v74, (uint64_t)&v75);
    uint64_t v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
    uint64_t v77 = v69;
    sub_21DB6A230(&v76, (uint64_t)&v73, (uint64_t)&v74, (uint64_t)&v75);
    _os_log_impl(&dword_21DB23000, oslog, v72, "Failed to load item for type identifier %s with error: %@", buf, size);
    sub_21DB6A27C(v47);
    sub_21DB6A27C(v48);
    sub_21DBAD018();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v57 + 904);
  uint64_t v42 = *(void *)(v57 + 832);
  uint64_t v38 = *(void *)(v57 + 760);
  uint64_t v39 = *(void *)(v57 + 744);
  uint64_t v41 = *(void *)(v57 + 560);
  uint64_t v43 = *(void *)(v57 + 840);

  v40(v38, v39);
  swift_bridgeObjectRetain();
  *(void *)(v57 + 440) = v41;
  swift_bridgeObjectRetain();
  uint64_t v44 = swift_task_alloc();
  *(void *)(v44 + 16) = v42;
  *(void *)(v44 + 24) = v43;
  sub_21DBA0AC8();
  uint64_t v45 = sub_21DBAD0D8();
  *(void *)(v57 + 1024) = v45;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  *(void *)(v57 + 448) = v45;
  id v7 = v56;
  *(void *)(v57 + 456) = v56;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E468);
  if (swift_dynamicCast())
  {
    unsigned __int8 v36 = *(void **)(v57 + 288);
    unsigned __int8 v37 = *(unsigned char *)(v57 + 296);
  }
  else
  {
    unsigned __int8 v36 = 0;
    unsigned __int8 v37 = -1;
  }
  if (v37 == 255)
  {
LABEL_14:
    uint64_t v31 = *(void *)(v57 + 832);
    id v35 = *(id *)(v57 + 648);
    uint64_t v32 = *(void *)(v57 + 840);
    sub_21DBAD308();
    uint64_t v33 = v11;
    swift_bridgeObjectRetain();
    *uint64_t v33 = v31;
    v33[1] = v32;
    sub_21DB6120C();
    uint64_t v34 = sub_21DBACE08();
    *(void *)(v57 + 1032) = v34;
    swift_bridgeObjectRelease();
    *(void *)(v57 + 464) = v34;
    id v12 = v35;
    *(void *)(v57 + 480) = v35;
    id v13 = v56;
    if (*(void *)(v57 + 480))
    {
      *(void *)(v57 + 472) = *(void *)(v57 + 480);
    }
    else
    {
      id v14 = v56;
      *(void *)(v57 + 472) = v56;
      sub_21DBA0238((id *)(v57 + 480));
    }

    uint64_t v30 = *(void *)(v57 + 472);
    *(void *)(v57 + 1040) = v30;
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v57 + 1048) = v15;
    void *v15 = *(void *)(v57 + 320);
    v15[1] = sub_21DB89294;
    uint64_t v16 = *(void *)(v57 + 784);
    uint64_t v17 = *(void *)(v57 + 632);
    uint64_t v18 = *(void *)(v57 + 624);
    uint64_t v19 = *(void *)(v57 + 616);
    uint64_t v20 = *(void *)(v57 + 608);
    uint64_t v21 = *(void *)(v57 + 600);
    v22.n128_u64[0] = *(void *)(v57 + 592);
    v23.n128_u64[0] = *(void *)(v57 + 584);
    char v24 = *(unsigned char *)(v57 + 299);
    char v25 = *(unsigned char *)(v57 + 298);
    char v26 = *(unsigned char *)(v57 + 297);
    uint64_t v27 = *(void *)(v57 + 576);
    uint64_t v28 = *(void *)(v57 + 568);
    uint64_t v29 = *(void *)(v57 + 552);
    char v80 = *(unsigned char *)(v57 + 313) & 1;
    uint64_t v81 = v21;
    uint64_t v82 = v20;
    uint64_t v83 = v19;
    uint64_t v84 = v18;
    uint64_t v85 = v17;
    uint64_t v86 = v34;
    uint64_t v87 = v30;
    return sub_21DB80B24(v16, v29, v45, v28, v27, v26 & 1, v25 & 1, v24 & 1, v23, v22);
  }
  *(void *)(v57 + 304) = v36;
  *(unsigned char *)(v57 + 312) = v37;
  sub_21DB9EE4C(v36, v37);
  if (v37 != 2 || v36 != (void *)1)
  {
    sub_21DB9EEB0(v36, v37);
    sub_21DB9EEB0(v36, v37);
    goto LABEL_14;
  }
  sub_21DB9EE4C((id)1, v37);
  sub_21DB9EDCC();
  swift_allocError();
  *(void *)uint64_t v8 = 1;
  *(unsigned char *)(v8 + 8) = v37;
  swift_willThrow();
  sub_21DB9EEB0((void *)1, v37);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(v57 + 320) + 8);
  return v9();
}

uint64_t sub_21DB8C7C0()
{
  uint64_t v1 = (void *)v0[130];
  id v4 = (id)v0[127];
  v0[40] = v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[40] + 8);
  return v2();
}

uint64_t sub_21DB8CA5C()
{
  *(void *)(v0 + 320) = v0;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 320) + 8);
  return v1();
}

uint64_t static SFAirDropUtilities.highestFidelityDataType(for:conformingToDataTypes:)(void *a1, uint64_t a2)
{
  id v53 = a1;
  uint64_t v52 = a2;
  uint64_t v61 = sub_21DB9220C;
  uint64_t v81 = 0;
  uint64_t v80 = 0;
  uint64_t v79 = 0;
  uint64_t v78 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v58 = 0;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v66 = 0;
  uint64_t v60 = sub_21DBAC858();
  uint64_t v46 = *(void *)(v60 - 8);
  uint64_t v47 = v60 - 8;
  unint64_t v48 = (*(void *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v60);
  uint64_t v49 = (char *)&v12 - v48;
  unint64_t v50 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v12 - v48);
  uint64_t v51 = (char *)&v12 - v50;
  uint64_t v81 = (char *)&v12 - v50;
  unint64_t v54 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v53);
  uint64_t v55 = (char *)&v12 - v54;
  unint64_t v56 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5);
  uint64_t v57 = (char *)&v12 - v56;
  uint64_t v80 = v6;
  uint64_t v79 = v7;
  uint64_t v78 = v2;
  uint64_t v75 = v7;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB20);
  sub_21DBA01B4();
  uint64_t v8 = sub_21DBACD78();
  uint64_t v62 = 0;
  uint64_t v63 = v8;
  uint64_t v74 = v8;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EA80);
  unint64_t v44 = sub_21DB9ED48();
  sub_21DBACF68();
  for (uint64_t i = v62; ; uint64_t i = v40)
  {
    uint64_t v40 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB48);
    sub_21DBAD198();
    uint64_t v41 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48);
    uint64_t v42 = v46 + 48;
    if (v41(v57, 1, v60) == 1) {
      break;
    }
    uint64_t v9 = v49;
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v51, v57, v60);
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v9, v51, v60);
    id v35 = (id)sub_21DBAC798();
    uint64_t v33 = *(void (**)(char *, uint64_t))(v46 + 8);
    uint64_t v34 = v46 + 8;
    v33(v49, v60);
    id v36 = objc_msgSend(v53, sel_registeredContentTypesConformingToContentType_, v35);

    uint64_t v37 = sub_21DBACDF8();
    uint64_t v66 = v37;

    swift_bridgeObjectRetain();
    uint64_t v38 = &v65;
    uint64_t v65 = v37;
    int v39 = sub_21DBACF58();
    sub_21DB6DE48();
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v32 = &v64;
      uint64_t v64 = v37;
      sub_21DBACF48();
      sub_21DB6DE48();
      if (v41(v55, 1, v60) == 1)
      {
        uint64_t v23 = 0;
        sub_21DB9F1A8((uint64_t)v55);
        uint64_t v30 = v23;
        uint64_t v31 = v23;
      }
      else
      {
        uint64_t v28 = sub_21DBAC778();
        uint64_t v29 = v10;
        v33(v55, v60);
        uint64_t v30 = v28;
        uint64_t v31 = v29;
      }
      uint64_t v25 = v31;
      uint64_t v24 = v30;
      swift_bridgeObjectRelease();
      v33(v51, v60);
      sub_21DB6DE48();
      uint64_t v26 = v24;
      uint64_t v27 = v25;
      return v26;
    }
    swift_bridgeObjectRelease();
    v33(v51, v60);
  }
  sub_21DB6DE48();
  swift_bridgeObjectRetain();
  uint64_t v71 = v52;
  sub_21DBA0CDC();
  sub_21DBACF68();
  for (uint64_t j = v40; ; uint64_t j = v19)
  {
    uint64_t v19 = j;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB58);
    sub_21DBAD198();
    uint64_t v20 = v69;
    uint64_t v21 = v70;
    if (!v70) {
      break;
    }
    uint64_t v17 = v20;
    uint64_t v18 = v21;
    uint64_t v14 = v21;
    uint64_t v13 = v20;
    uint64_t v67 = v20;
    uint64_t v68 = v21;
    swift_bridgeObjectRetain();
    id v15 = (id)sub_21DBACCC8();
    swift_bridgeObjectRelease();
    unsigned int v16 = objc_msgSend(v53, sel_hasItemConformingToTypeIdentifier_, v15);

    if (v16)
    {
      sub_21DB6DE48();
      uint64_t v26 = v13;
      uint64_t v27 = v14;
      return v26;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = 0;
  sub_21DB6DE48();
  uint64_t v26 = v12;
  uint64_t v27 = v12;
  return v26;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21DB8D51C()
{
}

uint64_t sub_21DB8D550(uint64_t a1, uint64_t a2)
{
  v3[60] = v2;
  v3[59] = a2;
  v3[58] = a1;
  v3[47] = v3;
  v3[41] = 0;
  v3[42] = 0;
  v3[48] = 0;
  v3[51] = 0;
  v3[45] = 0;
  v3[46] = 0;
  v3[55] = 0;
  v3[56] = 0;
  uint64_t v4 = sub_21DBAC8A8();
  v3[61] = v4;
  v3[62] = *(void *)(v4 - 8);
  v3[63] = swift_task_alloc();
  uint64_t v5 = sub_21DBAC858();
  v3[64] = v5;
  v3[65] = *(void *)(v5 - 8);
  v3[66] = swift_task_alloc();
  v3[67] = swift_task_alloc();
  v3[68] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0);
  v3[69] = swift_task_alloc();
  v3[70] = swift_task_alloc();
  v3[71] = swift_task_alloc();
  v3[41] = a1;
  v3[42] = a2;
  v3[48] = v2;
  return MEMORY[0x270FA2498](sub_21DB8D7CC, 0);
}

uint64_t sub_21DB8D7CC()
{
  unsigned int v16 = (char *)v0[71];
  uint64_t v19 = (void *)v0[70];
  uint64_t v17 = v0[65];
  uint64_t v18 = v0[64];
  uint64_t v15 = v0[59];
  uint64_t v14 = v0[58];
  v0[47] = v0;
  swift_bridgeObjectRetain();
  sub_21DB915D4(v14, v15, 1, v16);
  sub_21DB9F900(v16, v19);
  uint64_t v1 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48);
  v0[72] = v1;
  v0[73] = (v17 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v1(v19, 1, v18) == 1)
  {
    sub_21DB9F1A8(*(void *)(v13 + 560));
    goto LABEL_9;
  }
  uint64_t v10 = *(void *)(v13 + 536);
  uint64_t v9 = *(void *)(v13 + 512);
  uint64_t v8 = *(void *)(v13 + 520);
  (*(void (**)(void, void))(v8 + 32))(*(void *)(v13 + 544), *(void *)(v13 + 560));
  sub_21DBAC7B8();
  char v12 = sub_21DBAC818();
  id v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  *(void *)(v13 + 592) = v11;
  *(void *)(v13 + 600) = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v11(v10, v9);
  if ((v12 & 1) == 0
    || (id v7 = *(id *)(v13 + 480),
        sub_21DBA0F48(),
        (objc_msgSend(v7, sel_canLoadObjectOfClass_, swift_getObjCClassFromMetadata()) & 1) == 0))
  {
    v11(*(void *)(v13 + 544), *(void *)(v13 + 512));
LABEL_9:
    id v4 = *(id *)(v13 + 480);
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21DBACCC8();
    *(void *)(v13 + 624) = v3;
    swift_bridgeObjectRelease();
    *(void *)(v13 + 16) = *(void *)(v13 + 376);
    *(void *)(v13 + 56) = v13 + 400;
    *(void *)(v13 + 24) = sub_21DB8EEF0;
    *(void *)(v13 + 240) = swift_continuation_init();
    *(void *)(v13 + 208) = MEMORY[0x263EF8330];
    *(_DWORD *)(v13 + 216) = 0x40000000;
    *(_DWORD *)(v13 + 220) = 0;
    *(void *)(v13 + 224) = sub_21DB9D4D0;
    *(void *)(v13 + 232) = &block_descriptor_202;
    objc_msgSend(v4, sel_loadItemForTypeIdentifier_options_completionHandler_, v3, 0);
    return __swift_continuation_await_point();
  }
  id v6 = *(id *)(v13 + 480);
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21DBACCC8();
  *(void *)(v13 + 608) = v5;
  swift_bridgeObjectRelease();
  *(void *)(v13 + 144) = *(void *)(v13 + 376);
  *(void *)(v13 + 184) = v13 + 456;
  *(void *)(v13 + 152) = sub_21DB8DCD0;
  *(void *)(v13 + 320) = swift_continuation_init();
  *(void *)(v13 + 288) = MEMORY[0x263EF8330];
  *(_DWORD *)(v13 + 296) = 0x40000000;
  *(_DWORD *)(v13 + 300) = 0;
  *(void *)(v13 + 304) = sub_21DB9D400;
  *(void *)(v13 + 312) = &block_descriptor_224;
  objc_msgSend(v6, sel_sfui_loadAttributedStringForTypeIdentifier_completionHandler_, v5);
  return __swift_continuation_await_point();
}

uint64_t sub_21DB8DCD0()
{
  uint64_t v4 = *v0;
  uint64_t v5 = *v0;
  *(void *)(v5 + 376) = *v0;
  uint64_t v1 = *(void *)(v4 + 176);
  *(void *)(v5 + 616) = v1;
  if (v1)
  {
    uint64_t v2 = sub_21DB904C8;
  }
  else
  {
    uint64_t v2 = sub_21DB8DE9C;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB8DE9C()
{
  uint64_t v68 = v0;
  v67[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 608);
  uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v0 + 592);
  uint64_t v56 = *(void *)(v0 + 544);
  uint64_t v57 = *(void *)(v0 + 512);
  *(void *)(v0 + 376) = v0;
  *(void *)(v0 + 392) = *(void *)(v0 + 456);

  v58(v56, v57);
  uint64_t v60 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v0 + 576);
  uint64_t v61 = *(void **)(v0 + 552);
  uint64_t v59 = *(void *)(v0 + 512);
  sub_21DB9F900(*(const void **)(v0 + 568), v61);
  if (v60(v61, 1, v59) == 1)
  {
    sub_21DB9F1A8(*(void *)(v55 + 552));
  }
  else
  {
    uint64_t v52 = *(void *)(v55 + 536);
    uint64_t v51 = *(void *)(v55 + 512);
    uint64_t v50 = *(void *)(v55 + 520);
    (*(void (**)(void, void))(v50 + 32))(*(void *)(v55 + 528), *(void *)(v55 + 552));
    sub_21DBAC7C8();
    char v54 = sub_21DBAC818();
    id v53 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
    v53(v52, v51);
    if ((v54 & 1) == 0
      || ((uint64_t v49 = *(void *)(v55 + 392),
           swift_unknownObjectRetain(),
           *(void *)(v55 + 416) = v49,
           __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAE0),
           (swift_dynamicCast() & 1) == 0)
        ? (uint64_t v47 = 0, v48 = 0xF000000000000000)
        : (uint64_t v47 = *(void *)(v55 + 344), v48 = *(void *)(v55 + 352)),
          (v48 & 0xF000000000000000) == 0xF000000000000000))
    {
      v53(*(void *)(v55 + 528), *(void *)(v55 + 512));
    }
    else
    {
      *(void *)(v55 + 360) = v47;
      *(void *)(v55 + 368) = v48;
      id v65 = 0;
      id v42 = self;
      sub_21DB9F7DC(v47, v48);
      id v45 = (id)sub_21DBAC718();
      sub_21DB9F750(v47, v48);
      swift_bridgeObjectRetain();
      id v44 = (id)sub_21DBACCC8();
      swift_bridgeObjectRelease();
      *(void *)(v55 + 424) = 0;
      id v46 = objc_msgSend(v42, sel_objectWithItemProviderData_typeIdentifier_error_, v45, v44, v55 + 424);
      uint64_t v43 = *(void **)(v55 + 424);
      id v2 = v43;
      id v3 = v65;
      id v65 = v43;

      if (v46)
      {
        uint64_t v41 = v46;
      }
      else
      {
        id v14 = (id)sub_21DBAC608();

        swift_willThrow();
        uint64_t v41 = 0;
      }
      if (v41)
      {
        *(void *)(v55 + 448) = v41;
        id v4 = v41;
        *(void *)(v55 + 392) = v41;
        swift_unknownObjectRelease();
      }
      else
      {
        sub_21DBA0D60();
        sub_21DBA0DC8();
        uint64_t v40 = (void *)sub_21DBACFB8();
        if (v40)
        {
          *(void *)(v55 + 440) = v40;
          id v5 = v40;
          *(void *)(v55 + 392) = v40;
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v6 = *(void *)(v55 + 504);
          uint64_t v29 = *(void *)(v55 + 488);
          id v30 = *(id *)(v55 + 480);
          uint64_t v28 = *(void *)(v55 + 496);
          uint64_t v7 = sub_21DB7AC74();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v6, v7, v29);
          id v8 = v30;
          uint64_t v32 = swift_allocObject();
          *(void *)(v32 + 16) = v30;
          oslog = sub_21DBAC888();
          os_log_type_t v39 = sub_21DBACF98();
          *(void *)(v55 + 432) = 12;
          sub_21DB6A04C();
          sub_21DB6A0C8();
          sub_21DB6A144();
          sub_21DBACDD8();
          uint32_t size = *(_DWORD *)(v55 + 688);
          uint64_t v34 = swift_allocObject();
          *(unsigned char *)(v34 + 16) = 64;
          uint64_t v35 = swift_allocObject();
          *(unsigned char *)(v35 + 16) = 8;
          uint64_t v33 = swift_allocObject();
          *(void *)(v33 + 16) = sub_21DB9FA68;
          *(void *)(v33 + 24) = v32;
          uint64_t v36 = swift_allocObject();
          *(void *)(v36 + 16) = sub_21DB74A80;
          *(void *)(v36 + 24) = v33;
          __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
          sub_21DBAD308();
          uint64_t v37 = v9;
          swift_retain();
          *uint64_t v37 = sub_21DB6B84C;
          v37[1] = v34;
          swift_retain();
          v37[2] = sub_21DB6B84C;
          v37[3] = v35;
          swift_retain();
          v37[4] = sub_21DB74C10;
          v37[5] = v36;
          sub_21DB6120C();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(oslog, v39))
          {
            buf = (uint8_t *)sub_21DBAD038();
            __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
            uint64_t v26 = sub_21DB6A1C0(1);
            uint64_t v27 = sub_21DB6A1C0(0);
            uint64_t v62 = buf;
            uint64_t v66 = v26;
            v67[0] = v27;
            sub_21DB6A21C(2, &v62);
            sub_21DB6A21C(1, &v62);
            uint64_t v63 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
            uint64_t v64 = v34;
            sub_21DB6A230(&v63, (uint64_t)&v62, (uint64_t)&v66, (uint64_t)v67);
            uint64_t v63 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
            uint64_t v64 = v35;
            sub_21DB6A230(&v63, (uint64_t)&v62, (uint64_t)&v66, (uint64_t)v67);
            uint64_t v63 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
            uint64_t v64 = v36;
            sub_21DB6A230(&v63, (uint64_t)&v62, (uint64_t)&v66, (uint64_t)v67);
            _os_log_impl(&dword_21DB23000, oslog, v39, "Unable to coerce URL-typed item to an NSURL for item provider: %@", buf, size);
            sub_21DB6A27C(v26);
            sub_21DB6A27C(v27);
            sub_21DBAD018();
            swift_release();
            swift_release();
            swift_release();
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }
          uint64_t v23 = *(void *)(v55 + 504);
          uint64_t v24 = *(void *)(v55 + 488);
          uint64_t v22 = *(void *)(v55 + 496);

          (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
        }
      }
      uint64_t v20 = *(void *)(v55 + 528);
      uint64_t v21 = *(void *)(v55 + 512);
      sub_21DB9F750(v47, v48);
      v53(v20, v21);
    }
  }
  swift_unknownObjectRetain();
  self;
  uint64_t v19 = swift_dynamicCastObjCClass();
  if (v19)
  {
    uint64_t v18 = (void *)v19;
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v18 = 0;
  }
  *(void *)(v55 + 640) = v18;
  if (!v18) {
    goto LABEL_30;
  }
  *(void *)(v55 + 408) = v18;
  if ((objc_msgSend(v18, sel_isFileURL) & 1) == 0)
  {

LABEL_30:
    uint64_t v16 = *(void *)(v55 + 568);
    uint64_t v15 = *(void *)(v55 + 392);
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    sub_21DB9F1A8(v16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(uint64_t))(*(void *)(v55 + 376) + 8);
    return v13(v15);
  }
  uint64_t v10 = sub_21DBAC708();
  *(void *)(v55 + 648) = v10;
  uint64_t v17 = *(void *)(v10 - 8);
  *(void *)(v55 + 656) = v17;
  *(void *)(v55 + 664) = *(void *)(v17 + 64);
  uint64_t v11 = swift_task_alloc();
  *(void *)(v55 + 672) = v11;
  *(void *)(v55 + 80) = *(void *)(v55 + 376);
  *(void *)(v55 + 120) = v11;
  *(void *)(v55 + 88) = sub_21DB900DC;
  *(void *)(v55 + 280) = swift_continuation_init();
  *(void *)(v55 + 248) = MEMORY[0x263EF8330];
  *(_DWORD *)(v55 + 256) = 0x40000000;
  *(_DWORD *)(v55 + 260) = 0;
  *(void *)(v55 + 264) = sub_21DB9D5EC;
  *(void *)(v55 + 272) = &block_descriptor_204;
  objc_msgSend(v18, sel_coordinateReadingWithSaveToTempDir_completionHandler_, 1);
  return __swift_continuation_await_point();
}

uint64_t sub_21DB8EEF0()
{
  uint64_t v4 = *v0;
  uint64_t v5 = *v0;
  *(void *)(v5 + 376) = *v0;
  uint64_t v1 = *(void *)(v4 + 48);
  *(void *)(v5 + 632) = v1;
  if (v1)
  {
    id v2 = sub_21DB90684;
  }
  else
  {
    id v2 = sub_21DB8F0BC;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB8F0BC()
{
  uint64_t v65 = v0;
  v64[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 624);
  *(void *)(v0 + 376) = v0;
  *(void *)(v0 + 392) = *(void *)(v0 + 400);

  uint64_t v57 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v0 + 576);
  uint64_t v58 = *(void **)(v0 + 552);
  uint64_t v56 = *(void *)(v0 + 512);
  sub_21DB9F900(*(const void **)(v0 + 568), v58);
  if (v57(v58, 1, v56) == 1)
  {
    sub_21DB9F1A8(*(void *)(v55 + 552));
  }
  else
  {
    uint64_t v52 = *(void *)(v55 + 536);
    uint64_t v51 = *(void *)(v55 + 512);
    uint64_t v50 = *(void *)(v55 + 520);
    (*(void (**)(void, void))(v50 + 32))(*(void *)(v55 + 528), *(void *)(v55 + 552));
    sub_21DBAC7C8();
    char v54 = sub_21DBAC818();
    id v53 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
    v53(v52, v51);
    if ((v54 & 1) == 0
      || ((uint64_t v49 = *(void *)(v55 + 392),
           swift_unknownObjectRetain(),
           *(void *)(v55 + 416) = v49,
           __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAE0),
           (swift_dynamicCast() & 1) == 0)
        ? (uint64_t v47 = 0, v48 = 0xF000000000000000)
        : (uint64_t v47 = *(void *)(v55 + 344), v48 = *(void *)(v55 + 352)),
          (v48 & 0xF000000000000000) == 0xF000000000000000))
    {
      v53(*(void *)(v55 + 528), *(void *)(v55 + 512));
    }
    else
    {
      *(void *)(v55 + 360) = v47;
      *(void *)(v55 + 368) = v48;
      id v62 = 0;
      id v42 = self;
      sub_21DB9F7DC(v47, v48);
      id v45 = (id)sub_21DBAC718();
      sub_21DB9F750(v47, v48);
      swift_bridgeObjectRetain();
      id v44 = (id)sub_21DBACCC8();
      swift_bridgeObjectRelease();
      *(void *)(v55 + 424) = 0;
      id v46 = objc_msgSend(v42, sel_objectWithItemProviderData_typeIdentifier_error_, v45, v44, v55 + 424);
      uint64_t v43 = *(void **)(v55 + 424);
      id v2 = v43;
      id v3 = v62;
      id v62 = v43;

      if (v46)
      {
        uint64_t v41 = v46;
      }
      else
      {
        id v14 = (id)sub_21DBAC608();

        swift_willThrow();
        uint64_t v41 = 0;
      }
      if (v41)
      {
        *(void *)(v55 + 448) = v41;
        id v4 = v41;
        *(void *)(v55 + 392) = v41;
        swift_unknownObjectRelease();
      }
      else
      {
        sub_21DBA0D60();
        sub_21DBA0DC8();
        uint64_t v40 = (void *)sub_21DBACFB8();
        if (v40)
        {
          *(void *)(v55 + 440) = v40;
          id v5 = v40;
          *(void *)(v55 + 392) = v40;
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v6 = *(void *)(v55 + 504);
          uint64_t v29 = *(void *)(v55 + 488);
          id v30 = *(id *)(v55 + 480);
          uint64_t v28 = *(void *)(v55 + 496);
          uint64_t v7 = sub_21DB7AC74();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v6, v7, v29);
          id v8 = v30;
          uint64_t v32 = swift_allocObject();
          *(void *)(v32 + 16) = v30;
          oslog = sub_21DBAC888();
          os_log_type_t v39 = sub_21DBACF98();
          *(void *)(v55 + 432) = 12;
          sub_21DB6A04C();
          sub_21DB6A0C8();
          sub_21DB6A144();
          sub_21DBACDD8();
          uint32_t size = *(_DWORD *)(v55 + 688);
          uint64_t v34 = swift_allocObject();
          *(unsigned char *)(v34 + 16) = 64;
          uint64_t v35 = swift_allocObject();
          *(unsigned char *)(v35 + 16) = 8;
          uint64_t v33 = swift_allocObject();
          *(void *)(v33 + 16) = sub_21DB9FA68;
          *(void *)(v33 + 24) = v32;
          uint64_t v36 = swift_allocObject();
          *(void *)(v36 + 16) = sub_21DB74A80;
          *(void *)(v36 + 24) = v33;
          __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
          sub_21DBAD308();
          uint64_t v37 = v9;
          swift_retain();
          *uint64_t v37 = sub_21DB6B84C;
          v37[1] = v34;
          swift_retain();
          v37[2] = sub_21DB6B84C;
          v37[3] = v35;
          swift_retain();
          v37[4] = sub_21DB74C10;
          v37[5] = v36;
          sub_21DB6120C();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(oslog, v39))
          {
            buf = (uint8_t *)sub_21DBAD038();
            __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
            uint64_t v26 = sub_21DB6A1C0(1);
            uint64_t v27 = sub_21DB6A1C0(0);
            uint64_t v59 = buf;
            uint64_t v63 = v26;
            v64[0] = v27;
            sub_21DB6A21C(2, &v59);
            sub_21DB6A21C(1, &v59);
            uint64_t v60 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
            uint64_t v61 = v34;
            sub_21DB6A230(&v60, (uint64_t)&v59, (uint64_t)&v63, (uint64_t)v64);
            uint64_t v60 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
            uint64_t v61 = v35;
            sub_21DB6A230(&v60, (uint64_t)&v59, (uint64_t)&v63, (uint64_t)v64);
            uint64_t v60 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
            uint64_t v61 = v36;
            sub_21DB6A230(&v60, (uint64_t)&v59, (uint64_t)&v63, (uint64_t)v64);
            _os_log_impl(&dword_21DB23000, oslog, v39, "Unable to coerce URL-typed item to an NSURL for item provider: %@", buf, size);
            sub_21DB6A27C(v26);
            sub_21DB6A27C(v27);
            sub_21DBAD018();
            swift_release();
            swift_release();
            swift_release();
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }
          uint64_t v23 = *(void *)(v55 + 504);
          uint64_t v24 = *(void *)(v55 + 488);
          uint64_t v22 = *(void *)(v55 + 496);

          (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
        }
      }
      uint64_t v20 = *(void *)(v55 + 528);
      uint64_t v21 = *(void *)(v55 + 512);
      sub_21DB9F750(v47, v48);
      v53(v20, v21);
    }
  }
  swift_unknownObjectRetain();
  self;
  uint64_t v19 = swift_dynamicCastObjCClass();
  if (v19)
  {
    uint64_t v18 = (void *)v19;
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v18 = 0;
  }
  *(void *)(v55 + 640) = v18;
  if (!v18) {
    goto LABEL_30;
  }
  *(void *)(v55 + 408) = v18;
  if ((objc_msgSend(v18, sel_isFileURL) & 1) == 0)
  {

LABEL_30:
    uint64_t v16 = *(void *)(v55 + 568);
    uint64_t v15 = *(void *)(v55 + 392);
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    sub_21DB9F1A8(v16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(uint64_t))(*(void *)(v55 + 376) + 8);
    return v13(v15);
  }
  uint64_t v10 = sub_21DBAC708();
  *(void *)(v55 + 648) = v10;
  uint64_t v17 = *(void *)(v10 - 8);
  *(void *)(v55 + 656) = v17;
  *(void *)(v55 + 664) = *(void *)(v17 + 64);
  uint64_t v11 = swift_task_alloc();
  *(void *)(v55 + 672) = v11;
  *(void *)(v55 + 80) = *(void *)(v55 + 376);
  *(void *)(v55 + 120) = v11;
  *(void *)(v55 + 88) = sub_21DB900DC;
  *(void *)(v55 + 280) = swift_continuation_init();
  *(void *)(v55 + 248) = MEMORY[0x263EF8330];
  *(_DWORD *)(v55 + 256) = 0x40000000;
  *(_DWORD *)(v55 + 260) = 0;
  *(void *)(v55 + 264) = sub_21DB9D5EC;
  *(void *)(v55 + 272) = &block_descriptor_204;
  objc_msgSend(v18, sel_coordinateReadingWithSaveToTempDir_completionHandler_, 1);
  return __swift_continuation_await_point();
}

uint64_t sub_21DB900DC()
{
  uint64_t v4 = *v0;
  uint64_t v5 = *v0;
  *(void *)(v5 + 376) = *v0;
  uint64_t v1 = *(void *)(v4 + 112);
  *(void *)(v5 + 680) = v1;
  if (v1)
  {
    id v2 = sub_21DB9080C;
  }
  else
  {
    id v2 = sub_21DB902A8;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB902A8()
{
  uint64_t v6 = v0[84];
  uint64_t v3 = v0[82];
  uint64_t v4 = v0[81];
  id v7 = (id)v0[80];
  v0[47] = v0;
  uint64_t v5 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v5, v6, v4);
  v0[49] = sub_21DBAC688();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v4);
  swift_task_dealloc();
  swift_task_dealloc();

  uint64_t v9 = v0[71];
  uint64_t v8 = v0[49];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  sub_21DB9F1A8(v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0[47] + 8);
  return v1(v8);
}

uint64_t sub_21DB904C8()
{
  id v3 = (id)v0[76];
  uint64_t v6 = (void (*)(uint64_t, uint64_t))v0[74];
  uint64_t v7 = v0[71];
  uint64_t v4 = v0[68];
  uint64_t v5 = v0[64];
  v0[47] = v0;
  swift_willThrow();

  v6(v4, v5);
  sub_21DB9F1A8(v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(v0[47] + 8);
  return v1();
}

uint64_t sub_21DB90684()
{
  id v3 = (id)v0[78];
  uint64_t v4 = v0[71];
  v0[47] = v0;
  swift_willThrow();

  sub_21DB9F1A8(v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(v0[47] + 8);
  return v1();
}

uint64_t sub_21DB9080C()
{
  id v3 = (id)v0[80];
  uint64_t v4 = v0[71];
  v0[47] = v0;
  swift_willThrow();
  swift_task_dealloc();

  swift_unknownObjectRelease();
  sub_21DB9F1A8(v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(v0[47] + 8);
  return v1();
}

uint64_t sub_21DB909B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[12] = a4;
  v5[11] = a3;
  v5[10] = a2;
  v5[9] = a1;
  v5[6] = v5;
  v5[7] = 0;
  void v5[2] = 0;
  float v5[3] = 0;
  v5[8] = 0;
  v5[4] = 0;
  v5[5] = 0;
  uint64_t v6 = sub_21DBACB08();
  v5[13] = v6;
  v5[14] = *(void *)(v6 - 8);
  v5[15] = swift_task_alloc();
  v5[16] = swift_task_alloc();
  v5[7] = a2;
  void v5[2] = a3;
  float v5[3] = a4;
  v5[8] = v4;
  return MEMORY[0x270FA2498](sub_21DB90B14, 0);
}

uint64_t sub_21DB90B14()
{
  uint64_t v22 = *(void *)(v0 + 80);
  *(void *)(v0 + 48) = v0;
  uint64_t v23 = sub_21DBAC708();
  uint64_t v21 = *(void *)(v23 - 8);
  uint64_t v24 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v24, v22, v23);
  sub_21DB644A0();
  sub_21DBACB18();
  uint64_t v19 = v20[12];
  swift_task_dealloc();
  swift_bridgeObjectRetain();
  if (!v19)
  {
LABEL_8:
    uint64_t v9 = v20[16];
    uint64_t v8 = v20[13];
    uint64_t v7 = v20[14];
    (*(void (**)(void))(v7 + 16))(v20[9]);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v20[6] + 8);
    return v5();
  }
  uint64_t v18 = v20[12];
  v20[4] = v20[11];
  v20[5] = v18;
  if (sub_21DBACD58())
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  uint64_t v12 = v20[16];
  uint64_t v15 = v20[15];
  uint64_t v13 = v20[13];
  uint64_t v16 = v20[11];
  uint64_t v10 = v20[14];
  uint64_t v11 = sub_21DBAD308();
  id v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v14(v1, v12, v13);
  sub_21DB6120C();
  v20[17] = v11;
  v14(v15, v12, v13);
  swift_bridgeObjectRetain();
  uint64_t v17 = (void *)swift_task_alloc();
  v20[18] = v17;
  v17[2] = v15;
  v17[3] = v16;
  void v17[4] = v18;
  id v2 = (void *)swift_task_alloc();
  v20[19] = v2;
  *id v2 = v20[6];
  v2[1] = sub_21DB90FEC;
  uint64_t v3 = v20[13];
  uint64_t v4 = v20[9];
  return MEMORY[0x270F63498](v4, v11, &unk_267D1EB80, v17, v3);
}

uint64_t sub_21DB90FEC()
{
  uint64_t v8 = (void *)*v1;
  v8[6] = *v1;
  v8[20] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_21DB912D4;
  }
  else
  {
    uint64_t v6 = v8[15];
    uint64_t v5 = v8[14];
    uint64_t v7 = v8[13];
    swift_task_dealloc();
    id v2 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v8[21] = v2;
    v8[22] = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v2(v6, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_21DB911D0;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_21DB911D0()
{
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v0[21];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13];
  v0[6] = v0;
  swift_bridgeObjectRelease();
  v5(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0[6] + 8);
  return v1();
}

uint64_t sub_21DB912D4()
{
  uint64_t v5 = v0[16];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[14];
  uint64_t v6 = v0[13];
  v0[6] = v0;
  swift_task_dealloc();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v7(v4, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0[6] + 8);
  return v1();
}

uint64_t sub_21DB91430@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v15 = a3;
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t v22 = 0;
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v19 = sub_21DBAC708();
  uint64_t v12 = *(void *)(v19 - 8);
  uint64_t v13 = v19 - 8;
  unint64_t v7 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v19);
  uint64_t v18 = (char *)&v7 - v7;
  unint64_t v8 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v7 - v7);
  id v14 = (char *)&v7 - v8;
  uint64_t v10 = NSTemporaryDirectory();
  sub_21DBACCD8();
  uint64_t v9 = v4;
  sub_21DBAC658();
  swift_bridgeObjectRelease();

  sub_21DBACD38();
  uint64_t v11 = v5;
  sub_21DBAC698();
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v20 = v12 + 8;
  v21(v14, v19);
  sub_21DBAC698();
  return ((uint64_t (*)(char *, uint64_t))v21)(v18, v19);
}

uint64_t sub_21DB915D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, char *a4@<X8>)
{
  uint64_t v22 = a4;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  int v27 = a3;
  uint64_t v47 = 0;
  id v46 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  char v43 = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0);
  unint64_t v23 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v24 = (char *)&v14 - v23;
  unint64_t v25 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v14 - v23);
  uint64_t v26 = (uint64_t)&v14 - v25;
  uint64_t v28 = 0;
  uint64_t v29 = sub_21DBAC858();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = v29 - 8;
  uint64_t v35 = *(void *)(v30 + 64);
  unint64_t v32 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v14 - v32;
  unint64_t v34 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v36 = (char *)&v14 - v34;
  uint64_t v47 = (char *)&v14 - v34;
  unint64_t v37 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7);
  uint64_t v38 = (char *)&v14 - v37;
  id v46 = (char *)&v14 - v37;
  uint64_t v44 = v8;
  uint64_t v45 = v9;
  int v41 = 1;
  char v43 = v10 & 1;
  sub_21DBA1090();
  swift_bridgeObjectRetain();
  id v42 = sub_21DB9B128(v39, v40, v41 & 1);
  if (!v42) {
    goto LABEL_6;
  }
  id v21 = v42;
  id v20 = v42;
  id v11 = v42;
  sub_21DBA10F8();
  sub_21DBAD348();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v24, 1, v29) == 1)
  {
LABEL_6:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v26, 1, 1, v29);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v26, v24, v29);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v30 + 56))(v26, 0, 1, v29);
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v26, 1, v29) == 1)
  {
    sub_21DB9F1A8(v26);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v22, 1, 1, v29);
  }
  else
  {
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 32);
    uint64_t v14 = v30 + 32;
    v15(v36, v26, v29);
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
    uint64_t v16 = v30 + 16;
    v17(v33, v36, v29);
    v15(v38, (uint64_t)v33, v29);
    uint64_t v19 = *(void (**)(char *, uint64_t))(v30 + 8);
    uint64_t v18 = v30 + 8;
    v19(v36, v29);
    v17(v22, v38, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v22, 0, 1, v29);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v19)(v38, v29);
  }
}

uint64_t sub_21DB91B64()
{
  return (sub_21DBACD48() ^ 1) & 1;
}

uint64_t static SFAirDropUtilities.loadFile(from:dataTypesToTry:customDataType:acceptOtherFileRepresentations:ignoreStrings:generatePreviewImage:renameURLs:suggestedThumbnailSize:filename:sessionID:fileIndex:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8, double a9, double a10)
{
  *(void *)(v11 + 216) = v10;
  *(void *)(v11 + 208) = v19;
  *(void *)(v11 + 200) = v18;
  *(void *)(v11 + 192) = v17;
  *(void *)(v11 + 184) = v16;
  *(void *)(v11 + 176) = v15;
  *(double *)(v11 + 168) = a10;
  *(double *)(v11 + 160) = a9;
  *(unsigned char *)(v11 + 252) = v14 & 1;
  *(unsigned char *)(v11 + 251) = a8 & 1;
  *(unsigned char *)(v11 + 250) = a7 & 1;
  *(unsigned char *)(v11 + 249) = a6 & 1;
  *(void *)(v11 + 152) = a5;
  *(void *)(v11 + 144) = a4;
  *(void *)(v11 + 136) = a3;
  *(void *)(v11 + 128) = a2;
  *(void *)(v11 + 120) = a1;
  *(void *)(v11 + 80) = v11;
  *(void *)(v11 + 88) = 0;
  *(void *)(v11 + 96) = 0;
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  *(unsigned char *)(v11 + 248) = 0;
  *(unsigned char *)(v11 + 256) = 0;
  *(unsigned char *)(v11 + 264) = 0;
  *(unsigned char *)(v11 + 272) = 0;
  *(void *)(v11 + 32) = 0;
  *(void *)(v11 + 40) = 0;
  *(void *)(v11 + 48) = 0;
  *(void *)(v11 + 56) = 0;
  *(void *)(v11 + 64) = 0;
  *(void *)(v11 + 72) = 0;
  *(void *)(v11 + 104) = 0;
  *(void *)(v11 + 112) = 0;
  *(void *)(v11 + 88) = a2;
  *(void *)(v11 + 96) = a3;
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  *(unsigned char *)(v11 + 248) = a6 & 1;
  *(unsigned char *)(v11 + 256) = a7 & 1;
  *(unsigned char *)(v11 + 264) = a8 & 1;
  *(unsigned char *)(v11 + 272) = v14 & 1;
  *(double *)(v11 + 32) = a9;
  *(double *)(v11 + 40) = a10;
  *(void *)(v11 + 48) = v15;
  *(void *)(v11 + 56) = v16;
  *(void *)(v11 + 64) = v17;
  *(void *)(v11 + 72) = v18;
  *(void *)(v11 + 104) = v19;
  *(void *)(v11 + 112) = v10;
  return MEMORY[0x270FA2498](sub_21DB91DA8, 0);
}

uint64_t sub_21DB91DA8()
{
  *(void *)(v0 + 80) = v0;
  *(void *)(v0 + 224) = sub_21DBAD308();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v13 + 232) = v1;
  *uint64_t v1 = *(void *)(v13 + 80);
  v1[1] = sub_21DB91F18;
  double v2 = *(double *)(v13 + 168);
  double v3 = *(double *)(v13 + 160);
  uint64_t v4 = *(void *)(v13 + 152);
  uint64_t v5 = *(void *)(v13 + 144);
  uint64_t v6 = *(void *)(v13 + 136);
  uint64_t v7 = *(void *)(v13 + 128);
  uint64_t v8 = *(void *)(v13 + 120);
  char v9 = *(unsigned char *)(v13 + 249) & 1;
  char v10 = *(unsigned char *)(v13 + 250) & 1;
  char v11 = *(unsigned char *)(v13 + 251) & 1;
  return sub_21DB80B24(v8, v7, v6, v5, v4, v9, v10, v11, v3, v2);
}

uint64_t sub_21DB91F18()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 80) = *v1;
  *(void *)(v4 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_21DB92140, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    double v2 = *(uint64_t (**)(void))(*(void *)(v4 + 80) + 8);
    return v2();
  }
}

uint64_t sub_21DB92140()
{
  *(void *)(v0 + 80) = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 80) + 8);
  return v1();
}

uint64_t sub_21DB9220C@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v5 = a1[1];
  swift_bridgeObjectRetain();
  return sub_21DB915D4(v3, v5, 1, a2);
}

uint64_t static SFAirDropUtilities.guessedDataType(for:dataTypesToTry:)(void *a1, uint64_t a2)
{
  id v38 = a1;
  uint64_t v41 = a2;
  uint64_t v61 = 0;
  uint64_t v60 = 0;
  uint64_t v59 = 0;
  id v42 = v56;
  v56[0] = 0;
  v56[1] = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v33 = sub_21DBAC858();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = v33 - 8;
  unint64_t v36 = (*(void *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v33);
  unint64_t v37 = (char *)&v8 - v36;
  unint64_t v39 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v41);
  uint64_t v40 = (uint64_t)&v8 - v39;
  uint64_t v61 = v3;
  uint64_t v60 = v4;
  uint64_t v59 = v2;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  swift_bridgeObjectRetain();
  uint64_t v55 = v41;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB20);
  sub_21DBA0CDC();
  sub_21DBACF68();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB58);
    sub_21DBAD198();
    uint64_t v31 = v53;
    uint64_t v32 = v54;
    if (!v54) {
      break;
    }
    uint64_t v29 = v31;
    uint64_t v30 = v32;
    uint64_t v26 = v32;
    uint64_t v25 = v31;
    uint64_t v44 = v31;
    uint64_t v45 = v32;
    swift_bridgeObjectRetain();
    id v27 = (id)sub_21DBACCC8();
    swift_bridgeObjectRelease();
    unsigned int v28 = objc_msgSend(v38, sel_hasItemConformingToTypeIdentifier_, v27);

    if (v28)
    {
      swift_bridgeObjectRetain();
      uint64_t v57 = v25;
      uint64_t v58 = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    }
    swift_bridgeObjectRelease();
  }
  sub_21DB6DE48();
  uint64_t v23 = v57;
  uint64_t v24 = v58;
  swift_bridgeObjectRetain();
  uint64_t v51 = v23;
  uint64_t v52 = v24;
  BOOL v22 = v24 == 0;
  BOOL v21 = v22;
  sub_21DB6C060();
  if (v21)
  {
    id v17 = objc_msgSend(v38, sel_registeredContentTypes);
    uint64_t v20 = sub_21DBACDF8();
    swift_bridgeObjectRetain();
    uint64_t v19 = &v46;
    uint64_t v46 = v20;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EA80);
    sub_21DB9ED48();
    sub_21DBACF48();
    sub_21DB6DE48();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v40, 1, v33) == 1)
    {
      uint64_t v12 = 0;

      sub_21DB9F1A8(v40);
      uint64_t v15 = v12;
      uint64_t v16 = v12;
    }
    else
    {
      uint64_t v13 = sub_21DBAC778();
      uint64_t v14 = v5;
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v40, v33);

      uint64_t v15 = v13;
      uint64_t v16 = v14;
    }
    uint64_t v57 = v15;
    uint64_t v58 = v16;
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = v57;
  uint64_t v11 = v58;
  swift_bridgeObjectRetain();
  uint64_t v47 = v10;
  uint64_t v48 = v11;
  if (v11)
  {
    uint64_t v49 = v47;
    uint64_t v50 = v48;
  }
  else
  {
    sub_21DBAC7C8();
    uint64_t v49 = sub_21DBAC778();
    uint64_t v50 = v6;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
    sub_21DB6C060();
  }
  uint64_t v9 = v49;
  uint64_t v8 = v50;
  sub_21DB6C060();
  return v9;
}

uint64_t static SFAirDropUtilities.imageData(for:)(void *a1)
{
  id v1 = a1;
  if (a1)
  {
    id v6 = objc_msgSend(a1, sel_CGImage);

    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (!v7) {
    return 0;
  }
  id v3 = (id)SFDataFromCGImage();
  uint64_t v4 = sub_21DBAC728();

  return v4;
}

uint64_t static SFAirDropUtilities.shouldIgnoreString(for:)(uint64_t a1)
{
  uint64_t v98 = a1;
  uint64_t v79 = 0;
  id v105 = sub_21DB9399C;
  uint64_t v73 = sub_21DBA12C4;
  uint64_t v74 = sub_21DBA130C;
  uint64_t v75 = sub_21DB6B8C0;
  uint64_t v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v77 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
  uint64_t v78 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
  uint64_t v124 = 0;
  uint64_t v123 = 0;
  uint64_t v122 = 0;
  char v121 = 0;
  unsigned __int8 v120 = 0;
  uint64_t v101 = 0;
  uint64_t v118 = 0;
  uint64_t v116 = 0;
  uint64_t v117 = 0;
  uint64_t v80 = sub_21DBAC8A8();
  uint64_t v81 = *(void *)(v80 - 8);
  uint64_t v82 = v80 - 8;
  unint64_t v83 = (*(void *)(v81 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v84 = (char *)&v25 - v83;
  uint64_t v85 = sub_21DBAC858();
  uint64_t v86 = *(void *)(v85 - 8);
  uint64_t v87 = v85 - 8;
  unint64_t v88 = (*(void *)(v86 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v85);
  uint64_t v89 = (char *)&v25 - v88;
  unint64_t v90 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v25 - v88);
  uint64_t v91 = (char *)&v25 - v90;
  unint64_t v92 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v25 - v90);
  os_log_type_t v93 = (char *)&v25 - v92;
  unint64_t v94 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v25 - v92);
  uint64_t v95 = (char *)&v25 - v94;
  unint64_t v96 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v25 - v94);
  uint64_t v97 = (char *)&v25 - v96;
  uint64_t v124 = (char *)&v25 - v96;
  unint64_t v99 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v98);
  uint64_t v100 = (char *)&v25 - v99;
  uint64_t v123 = v6;
  uint64_t v122 = v1;
  char v121 = 0;
  unsigned __int8 v120 = 0;
  uint64_t v119 = v6;
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBA0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EA80);
  unint64_t v104 = sub_21DBA117C();
  sub_21DBA1200();
  uint64_t v7 = sub_21DBACDA8();
  uint64_t v106 = 0;
  uint64_t v107 = v7;
  uint64_t v71 = v7;
  uint64_t v118 = v7;
  swift_bridgeObjectRetain();
  uint64_t v115 = v71;
  sub_21DB9ED48();
  sub_21DBACF68();
  for (uint64_t i = v106; ; uint64_t i = v70)
  {
    uint64_t v70 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB48);
    sub_21DBAD198();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v86 + 48))(v100, 1, v85) == 1) {
      break;
    }
    (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v97, v100, v85);
    sub_21DBAC848();
    int v69 = sub_21DBAC818();
    uint64_t v67 = *(void (**)(char *, uint64_t))(v86 + 8);
    uint64_t v68 = v86 + 8;
    v67(v95, v85);
    if (v69)
    {
      char v121 = 1;
    }
    else
    {
      sub_21DBAC7F8();
      int v66 = sub_21DBAC818();
      v67(v95, v85);
      uint64_t v64 = *(void (**)(char *, char *, uint64_t))(v86 + 16);
      uint64_t v65 = v86 + 16;
      v64(v93, v97, v85);
      if (v66)
      {
        int v63 = 1;
      }
      else
      {
        sub_21DBAC7C8();
        int v62 = sub_21DBAC818();
        v67(v95, v85);
        int v63 = v62;
      }
      int v61 = v63;
      v67(v93, v85);
      v64(v91, v97, v85);
      if (v61)
      {
        int v60 = 1;
      }
      else
      {
        sub_21DBAC7D8();
        int v59 = sub_21DBAC818();
        v67(v95, v85);
        int v60 = v59;
      }
      int v58 = v60;
      v67(v91, v85);
      v64(v89, v97, v85);
      if (v58)
      {
        sub_21DBAC7B8();
        int v56 = sub_21DBAC818();
        v67(v95, v85);
        int v57 = v56 ^ 1;
      }
      else
      {
        int v57 = 0;
      }
      int v55 = v57;
      v67(v89, v85);
      if (v55) {
        unsigned __int8 v120 = 1;
      }
    }
    v67(v97, v85);
  }
  sub_21DB6DE48();
  if (v121) {
    int v54 = v120;
  }
  else {
    int v54 = 0;
  }
  if (v54)
  {
    uint64_t v8 = v84;
    uint64_t v9 = sub_21DB7AC74();
    (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v8, v9, v80);
    swift_bridgeObjectRetain();
    uint64_t v43 = 7;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v98;
    swift_retain();
    uint64_t v42 = 32;
    uint64_t v10 = swift_allocObject();
    uint64_t v11 = v36;
    uint64_t v44 = v10;
    *(void *)(v10 + 16) = v73;
    *(void *)(v10 + 24) = v11;
    swift_release();
    uint64_t v52 = sub_21DBAC888();
    int v53 = sub_21DBACFA8();
    unint64_t v39 = &v113;
    uint64_t v113 = 12;
    unint64_t v37 = sub_21DB6A04C();
    unint64_t v38 = sub_21DB6A0C8();
    sub_21DB6A144();
    sub_21DBACDD8();
    uint32_t v40 = v114;
    uint64_t v41 = 17;
    uint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 32;
    uint64_t v47 = swift_allocObject();
    *(unsigned char *)(v47 + 16) = 8;
    uint64_t v12 = swift_allocObject();
    uint64_t v13 = v44;
    uint64_t v45 = v12;
    *(void *)(v12 + 16) = v74;
    *(void *)(v12 + 24) = v13;
    uint64_t v14 = swift_allocObject();
    uint64_t v15 = v45;
    uint64_t v49 = v14;
    *(void *)(v14 + 16) = v75;
    *(void *)(v14 + 24) = v15;
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
    uint64_t v48 = sub_21DBAD308();
    uint64_t v50 = v16;
    swift_retain();
    uint64_t v17 = v46;
    uint64_t v18 = v50;
    *uint64_t v50 = v76;
    v18[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v17;
    swift_retain();
    uint64_t v19 = v47;
    uint64_t v20 = v50;
    v50[2] = v77;
    v20[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v19;
    swift_retain();
    BOOL v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v49;
    BOOL v22 = v50;
    v50[4] = v78;
    v22[5] = v21;
    sub_21DB6120C();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v52, (os_log_type_t)v53))
    {
      uint64_t v23 = v70;
      uint64_t v29 = (uint8_t *)sub_21DBAD038();
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
      uint64_t v30 = sub_21DB6A1C0(0);
      uint64_t v31 = sub_21DB6A1C0(1);
      uint64_t v32 = &v112;
      uint64_t v112 = v29;
      uint64_t v33 = &v111;
      uint64_t v111 = v30;
      uint64_t v34 = &v110;
      uint64_t v110 = v31;
      sub_21DB6A21C(2, &v112);
      sub_21DB6A21C(1, v32);
      uint64_t v108 = v76;
      uint64_t v109 = v46;
      sub_21DB6A230(&v108, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34);
      uint64_t v35 = v23;
      if (v23)
      {
        __break(1u);
      }
      else
      {
        uint64_t v108 = v77;
        uint64_t v109 = v47;
        sub_21DB6A230(&v108, (uint64_t)&v112, (uint64_t)&v111, (uint64_t)&v110);
        uint64_t v27 = 0;
        uint64_t v108 = v78;
        uint64_t v109 = v49;
        sub_21DB6A230(&v108, (uint64_t)&v112, (uint64_t)&v111, (uint64_t)&v110);
        _os_log_impl(&dword_21DB23000, v52, (os_log_type_t)v53, "Returning shouldIgnoreString = true for item providers %s", v29, v40);
        sub_21DB6A27C(v30);
        sub_21DB6A27C(v31);
        sub_21DBAD018();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v81 + 8))(v84, v80);
  }
  if (v121) {
    int v26 = v120;
  }
  else {
    int v26 = 0;
  }
  int v25 = v26;
  swift_bridgeObjectRelease();
  return v25 & 1;
}

void sub_21DB9399C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_registeredContentTypes);
  sub_21DBAC858();
  *a2 = sub_21DBACDF8();
}

uint64_t sub_21DB93A10@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t sub_21DB93A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[19] = a5;
  v5[18] = a4;
  v5[17] = a3;
  v5[16] = a2;
  v5[15] = a1;
  v5[8] = v5;
  v5[9] = 0;
  v5[10] = 0;
  void v5[2] = 0;
  float v5[3] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v5[13] = 0;
  uint64_t v6 = sub_21DBAC8A8();
  v5[20] = v6;
  v5[21] = *(void *)(v6 - 8);
  v5[22] = swift_task_alloc();
  v5[9] = a2;
  v5[10] = a3;
  void v5[2] = a4;
  float v5[3] = a5;
  return MEMORY[0x270FA2498](sub_21DB93BE0, 0);
}

uint64_t sub_21DB93BE0()
{
  uint64_t v73 = v0;
  v72[1] = *MEMORY[0x263EF8340];
  uint64_t v63 = v0[16];
  v0[8] = v0;
  uint64_t v65 = sub_21DBAC708();
  uint64_t v64 = *(void *)(v65 - 8);
  uint64_t v62 = swift_task_alloc();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0);
  uint64_t v66 = swift_task_alloc();
  v0[11] = v63;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBC8);
  sub_21DBA14C8();
  sub_21DBACF48();
  sub_21DB6DE48();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48))(v66, 1, v65) == 1)
  {
    uint64_t v59 = *(void *)(v61 + 136);
    uint64_t v60 = *(void *)(v61 + 120);
    sub_21DB79AD0(v66);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = sub_21DBACB08();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(v60, v59);
  }
  else
  {
    uint64_t v44 = *(void *)(v61 + 152);
    uint64_t v43 = *(void *)(v61 + 144);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 32))(v62, v66, v65);
    swift_task_dealloc();
    *(void *)(v61 + 32) = sub_21DBAC638();
    *(void *)(v61 + 40) = v2;
    uint64_t v42 = swift_task_alloc();
    sub_21DBAC6B8();
    uint64_t v50 = swift_task_alloc();
    uint64_t v48 = swift_task_alloc();
    *(void *)(v61 + 48) = v43;
    *(void *)(v61 + 56) = v44;
    uint64_t v46 = sub_21DBAC628();
    uint64_t v45 = *(void *)(v46 - 8);
    uint64_t v47 = swift_task_alloc();
    sub_21DBA3A2C();
    sub_21DB94E24(v47);
    sub_21DBAC6F8();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v47, v46);
    swift_task_dealloc();
    sub_21DBAC6A8();
    uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
    v52(v48, v65);
    swift_task_dealloc();
    id v70 = 0;
    id v57 = objc_msgSend(self, sel_defaultManager);
    uint64_t v49 = swift_task_alloc();
    uint64_t v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16);
    v51(v49, v62, v65);
    id v56 = (id)sub_21DBAC688();
    v52(v49, v65);
    swift_task_dealloc();
    uint64_t v53 = swift_task_alloc();
    v51(v53, v50, v65);
    id v55 = (id)sub_21DBAC688();
    v52(v53, v65);
    swift_task_dealloc();
    *(void *)(v61 + 96) = 0;
    unsigned __int8 v58 = objc_msgSend(v57, sel_moveItemAtURL_toURL_error_, v56, v55, v61 + 96);
    int v54 = *(void **)(v61 + 96);
    id v3 = v54;
    id v4 = v70;
    id v70 = v54;

    if (v58)
    {
      uint64_t v41 = swift_task_alloc();
      v51(v41, v50, v65);
      sub_21DB644A0();
      sub_21DBACB18();
      swift_task_dealloc();
      v52(v50, v65);
      swift_task_dealloc();
      v52(v42, v65);
      swift_task_dealloc();
      swift_bridgeObjectRelease();
      v52(v62, v65);
      swift_task_dealloc();
    }
    else
    {
      uint64_t v13 = (void *)sub_21DBAC608();

      swift_willThrow();
      uint64_t v7 = *(void *)(v61 + 176);
      uint64_t v23 = *(void *)(v61 + 160);
      uint64_t v25 = *(void *)(v61 + 152);
      uint64_t v24 = *(void *)(v61 + 144);
      uint64_t v22 = *(void *)(v61 + 168);
      id v8 = v13;
      *(void *)(v61 + 104) = v13;
      uint64_t v9 = sub_21DB7AC74();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v7, v9, v23);
      swift_bridgeObjectRetain();
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = v24;
      *(void *)(v27 + 24) = v25;
      id v10 = v13;
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = v13;
      sub_21DB7422C();
      swift_bridgeObjectRelease();
      oslog = sub_21DBAC888();
      os_log_type_t v40 = sub_21DBACF98();
      *(void *)(v61 + 112) = 22;
      sub_21DB6A04C();
      sub_21DB6A0C8();
      sub_21DB6A144();
      sub_21DBACDD8();
      uint32_t size = *(_DWORD *)(v61 + 184);
      uint64_t v32 = swift_allocObject();
      *(unsigned char *)(v32 + 16) = 32;
      uint64_t v33 = swift_allocObject();
      *(unsigned char *)(v33 + 16) = 8;
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = sub_21DBA02A4;
      *(void *)(v28 + 24) = v27;
      uint64_t v34 = swift_allocObject();
      *(void *)(v34 + 16) = sub_21DB6B8C0;
      *(void *)(v34 + 24) = v28;
      uint64_t v35 = swift_allocObject();
      *(unsigned char *)(v35 + 16) = 64;
      uint64_t v36 = swift_allocObject();
      *(unsigned char *)(v36 + 16) = 8;
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = sub_21DB75008;
      *(void *)(v30 + 24) = v29;
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = sub_21DB79F00;
      *(void *)(v31 + 24) = v30;
      uint64_t v37 = swift_allocObject();
      *(void *)(v37 + 16) = sub_21DB74A80;
      *(void *)(v37 + 24) = v31;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
      sub_21DBAD308();
      unint64_t v38 = v11;
      swift_retain();
      *unint64_t v38 = sub_21DB6B84C;
      v38[1] = v32;
      swift_retain();
      v38[2] = sub_21DB6B84C;
      v38[3] = v33;
      swift_retain();
      v38[4] = sub_21DB6B90C;
      v38[5] = v34;
      swift_retain();
      v38[6] = sub_21DB6B84C;
      v38[7] = v35;
      swift_retain();
      v38[8] = sub_21DB6B84C;
      v38[9] = v36;
      swift_retain();
      v38[10] = sub_21DB74C10;
      v38[11] = v37;
      sub_21DB6120C();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(oslog, v40))
      {
        buf = (uint8_t *)sub_21DBAD038();
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
        uint64_t v20 = sub_21DB6A1C0(1);
        uint64_t v21 = sub_21DB6A1C0(1);
        uint64_t v67 = buf;
        uint64_t v71 = v20;
        v72[0] = v21;
        sub_21DB6A21C(2, &v67);
        sub_21DB6A21C(2, &v67);
        uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v69 = v32;
        sub_21DB6A230(&v68, (uint64_t)&v67, (uint64_t)&v71, (uint64_t)v72);
        uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v69 = v33;
        sub_21DB6A230(&v68, (uint64_t)&v67, (uint64_t)&v71, (uint64_t)v72);
        uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
        uint64_t v69 = v34;
        sub_21DB6A230(&v68, (uint64_t)&v67, (uint64_t)&v71, (uint64_t)v72);
        uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v69 = v35;
        sub_21DB6A230(&v68, (uint64_t)&v67, (uint64_t)&v71, (uint64_t)v72);
        uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
        uint64_t v69 = v36;
        sub_21DB6A230(&v68, (uint64_t)&v67, (uint64_t)&v71, (uint64_t)v72);
        uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
        uint64_t v69 = v37;
        sub_21DB6A230(&v68, (uint64_t)&v67, (uint64_t)&v71, (uint64_t)v72);
        _os_log_impl(&dword_21DB23000, oslog, v40, "Failed to rename file to filename %s: %@", buf, size);
        sub_21DB6A27C(v20);
        sub_21DB6A27C(v21);
        sub_21DBAD018();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      uint64_t v15 = *(void *)(v61 + 176);
      uint64_t v16 = *(void *)(v61 + 160);
      uint64_t v17 = *(void *)(v61 + 136);
      uint64_t v18 = *(void *)(v61 + 120);
      uint64_t v14 = *(void *)(v61 + 168);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
      uint64_t v12 = sub_21DBACB08();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v18, v17);

      v52(v50, v65);
      swift_task_dealloc();
      v52(v42, v65);
      swift_task_dealloc();
      swift_bridgeObjectRelease();
      v52(v62, v65);
      swift_task_dealloc();
    }
  }
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v61 + 64) + 8);
  return v5();
}

uint64_t sub_21DB94E24@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *MEMORY[0x263F06E48];
  uint64_t v1 = sub_21DBAC628();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t static SFAirDropUtilities.standardPreviewImage(for:size:)(uint64_t a1, double a2, double a3)
{
  *(void *)(v4 + 136) = v3;
  *(double *)(v4 + 128) = a3;
  *(double *)(v4 + 120) = a2;
  *(void *)(v4 + 112) = a1;
  *(void *)(v4 + 48) = v4;
  *(void *)(v4 + 56) = 0;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 64) = 0;
  *(void *)(v4 + 72) = 0;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 88) = 0;
  uint64_t v5 = sub_21DBACB08();
  *(void *)(v4 + 144) = v5;
  *(void *)(v4 + 152) = *(void *)(v5 - 8);
  *(void *)(v4 + 160) = swift_task_alloc();
  *(void *)(v4 + 168) = swift_task_alloc();
  *(void *)(v4 + 56) = a1;
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = a3;
  *(void *)(v4 + 64) = v3;
  return MEMORY[0x270FA2498](sub_21DB95008, 0);
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;

  *(void *)(v4 + 144) = v3;
  *(double *)(v4 + 136) = a3;
  *(double *)(v4 + 128) = a2;
  *(void *)(v4 + 120) = a1;
  *(void *)(v4 + 32) = v4;
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 48) = 0;
  *(void *)(v4 + 88) = 0;
  uint64_t v5 = sub_21DBACAC8();
  *(void *)(v4 + 152) = v5;
  *(void *)(v4 + 160) = *(void *)(v5 - 8);
  *(void *)(v4 + 168) = swift_task_alloc();
  uint64_t v6 = sub_21DBACBC8();
  *(void *)(v4 + 176) = v6;
  *(void *)(v4 + 184) = *(void *)(v6 - 8);
  *(void *)(v4 + 192) = swift_task_alloc();
  *(void *)(v4 + 40) = a1;
  *(double *)(v4 + 16) = a2;
  *(double *)(v4 + 24) = a3;
  *(void *)(v4 + 48) = v3;
  return MEMORY[0x270FA2498](sub_21DB98378, 0);
}

uint64_t sub_21DB95008()
{
  uint64_t v20 = v0[14];
  v0[6] = v0;
  v0[9] = sub_21DBAD308();
  swift_bridgeObjectRetain();
  v0[10] = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBC8);
  sub_21DBA14C8();
  sub_21DBACF68();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0);
  uint64_t v21 = swift_task_alloc();
  v0[22] = v21;
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBD8);
    sub_21DBAD198();
    uint64_t v17 = sub_21DBAC708();
    *(void *)(v19 + 184) = v17;
    uint64_t v18 = *(void *)(v17 - 8);
    *(void *)(v19 + 192) = v18;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 48))(v21, 1) == 1) {
      break;
    }
    uint64_t v16 = swift_task_alloc();
    *(void *)(v19 + 200) = v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v16, v21, v17);
    if ((sub_21DBAC618() & 1) == 0)
    {
      uint64_t v1 = (void *)swift_task_alloc();
      *(void *)(v19 + 208) = v1;
      *uint64_t v1 = *(void *)(v19 + 48);
      v1[1] = sub_21DB9579C;
      return static SFAirDropUtilities.generateWebPreviewImage(url:)(v16);
    }
    uint64_t v15 = static SFAirDropUtilities.previewImage(from:suggestedThumbnailSize:)(v16, *(double *)(v19 + 120), *(double *)(v19 + 128));
    if (v15)
    {
      *(void *)(v19 + 88) = v15;
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
      swift_task_dealloc();
      swift_task_dealloc();
      sub_21DB6DE48();
      sub_21DB6DE48();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v3 = *(uint64_t (**)(CGImageSource *))(*(void *)(v19 + 48) + 8);
      return v3(v15);
    }
    uint64_t v14 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v14, v16, v17);
    sub_21DB644A0();
    sub_21DBACB18();
    uint64_t v12 = *(void *)(v19 + 168);
    uint64_t v11 = *(void *)(v19 + 160);
    uint64_t v13 = *(void *)(v19 + 144);
    uint64_t v10 = *(void *)(v19 + 152);
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v11, v12, v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBF0);
    sub_21DBACE38();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v13);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    swift_task_dealloc();
  }
  swift_task_dealloc();
  sub_21DB6DE48();
  uint64_t v9 = *(void *)(v19 + 72);
  *(void *)(v19 + 224) = v9;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBE0);
  uint64_t v7 = sub_21DBAD308();
  *(void *)(v19 + 232) = v7;
  uint64_t v8 = sub_21DBAD308();
  *(void *)(v19 + 240) = v8;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v19 + 248) = v4;
  *uint64_t v4 = *(void *)(v19 + 48);
  v4[1] = sub_21DB95A64;
  double v5 = *(double *)(v19 + 128);
  double v6 = *(double *)(v19 + 120);
  return static SFAirDropUtilities.generatePreviewIcon(for:fileTypes:fileSubTypes:size:)(v9, v7, v8, v6, v5);
}

uint64_t sub_21DB9579C(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 48) = *v1;
  *(void *)(v3 + 216) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21DB958B8, 0);
}

uint64_t sub_21DB958B8()
{
  uint64_t v1 = v0[27];
  v0[6] = v0;
  v0[13] = v1;
  if (v0[13])
  {
    *(void *)(v5 + 96) = *(void *)(v5 + 104);
  }
  else
  {
    sub_21DBA154C();
    *(void *)(v5 + 96) = sub_21DB71BA8();
    sub_21DB74628((id *)(v5 + 104));
  }
  uint64_t v4 = *(void *)(v5 + 96);
  (*(void (**)(void))(*(void *)(v5 + 192) + 8))();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_21DB6DE48();
  sub_21DB6DE48();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v5 + 48) + 8);
  return v2(v4);
}

uint64_t sub_21DB95A64(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[6] = *v2;
  v5[32] = a1;
  v5[33] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = sub_21DB95CE0;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_21DB95C08;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_21DB95C08()
{
  *(void *)(v0 + 48) = v0;
  sub_21DB6DE48();
  uint64_t v3 = *(void *)(v0 + 256);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 48) + 8);
  return v1(v3);
}

uint64_t sub_21DB95CE0()
{
  *(void *)(v0 + 48) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21DB6DE48();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 48) + 8);
  return v1();
}

uint64_t static SFAirDropUtilities.generateWebPreviewImage(url:)(uint64_t a1)
{
  v2[6] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return MEMORY[0x270FA2498](sub_21DB95E20, 0);
}

uint64_t sub_21DB95E20()
{
  v0[2] = v0;
  uint64_t v9 = sub_21DBACD38();
  uint64_t v10 = v1;
  v0[7] = v1;
  uint64_t v6 = sub_21DBAC708();
  v0[8] = v6;
  uint64_t v5 = *(void *)(v6 - 8);
  v0[9] = v5;
  uint64_t v7 = swift_task_alloc();
  v0[10] = v7;
  (*(void (**)(void))(v5 + 16))();
  uint64_t v11 = swift_task_alloc();
  v0[11] = v11;
  *(void *)(v11 + 16) = v7;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v8 + 96) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EC08);
  *uint64_t v2 = *(void *)(v8 + 16);
  v2[1] = sub_21DB96014;
  return MEMORY[0x270FA2318](v8 + 40, 0, 0, v9, v10, sub_21DBA15B4, v11, v3);
}

uint64_t sub_21DB96014()
{
  uint64_t v4 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = *(void *)(*(void *)v0 + 72);
  uint64_t v3 = *(void *)(*(void *)v0 + 64);
  *(void *)(*(void *)v0 + 16) = *(void *)v0;
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v4, v3);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_21DB961D8, 0);
}

uint64_t sub_21DB961D8()
{
  *(void *)(v0 + 16) = v0;
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 8))(*(void *)(v0 + 40));
}

uint64_t static SFAirDropUtilities.generatePreviewIcon(for:fileTypes:fileSubTypes:size:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  *(double *)(v6 + 248) = a5;
  *(double *)(v6 + 240) = a4;
  *(void *)(v6 + 232) = a3;
  *(void *)(v6 + 224) = a2;
  *(void *)(v6 + 216) = a1;
  *(void *)(v6 + 128) = v6;
  *(void *)(v6 + 136) = 0;
  *(void *)(v6 + 144) = 0;
  *(void *)(v6 + 152) = 0;
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  *(void *)(v6 + 160) = 0;
  *(void *)(v6 + 48) = 0;
  *(void *)(v6 + 56) = 0;
  *(void *)(v6 + 64) = 0;
  *(void *)(v6 + 72) = 0;
  *(void *)(v6 + 176) = 0;
  *(void *)(v6 + 96) = 0;
  *(void *)(v6 + 104) = 0;
  *(void *)(v6 + 112) = 0;
  *(void *)(v6 + 120) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0);
  *(void *)(v6 + 256) = swift_task_alloc();
  *(void *)(v6 + 264) = swift_task_alloc();
  *(void *)(v6 + 272) = swift_task_alloc();
  uint64_t v7 = sub_21DBAC858();
  *(void *)(v6 + 280) = v7;
  *(void *)(v6 + 288) = *(void *)(v7 - 8);
  *(void *)(v6 + 296) = swift_task_alloc();
  *(void *)(v6 + 304) = swift_task_alloc();
  *(void *)(v6 + 312) = swift_task_alloc();
  *(void *)(v6 + 320) = swift_task_alloc();
  *(void *)(v6 + 328) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EC10);
  *(void *)(v6 + 336) = swift_task_alloc();
  uint64_t v8 = sub_21DBACB08();
  *(void *)(v6 + 344) = v8;
  *(void *)(v6 + 352) = *(void *)(v8 - 8);
  *(void *)(v6 + 360) = swift_task_alloc();
  *(void *)(v6 + 136) = a1;
  *(void *)(v6 + 144) = a2;
  *(void *)(v6 + 152) = a3;
  *(double *)(v6 + 16) = a4;
  *(double *)(v6 + 24) = a5;
  *(void *)(v6 + 160) = v5;
  return MEMORY[0x270FA2498](sub_21DB96520, 0);
}

uint64_t sub_21DB96520()
{
  uint64_t v73 = *(void *)(v0 + 216);
  *(void *)(v0 + 128) = v0;
  swift_bridgeObjectRetain();
  if (v73)
  {
    uint64_t v71 = *((void *)v72 + 27);
    swift_bridgeObjectRetain();
    *((void *)v72 + 26) = v71;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBF0);
    sub_21DBA18B8();
    sub_21DBACF48();
    sub_21DB6DE48();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*((void *)v72 + 44) + 56))(*((void *)v72 + 42), 1, 1, *((void *)v72 + 43));
  }
  if ((*(unsigned int (**)(void, uint64_t, void))(*((void *)v72 + 44) + 48))(*((void *)v72 + 42), 1, *((void *)v72 + 43)) != 1)
  {
    uint64_t v65 = *((void *)v72 + 45);
    uint64_t v66 = *((void *)v72 + 43);
    uint64_t v69 = *((void *)v72 + 31);
    uint64_t v68 = *((void *)v72 + 30);
    uint64_t v64 = *((void *)v72 + 44);
    (*(void (**)(void))(v64 + 32))();
    uint64_t v67 = sub_21DBAD308();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v1, v65, v66);
    sub_21DB6120C();
    *((void *)v72 + 46) = v67;
    uint64_t v70 = swift_task_alloc();
    *((void *)v72 + 47) = v70;
    *(void *)(v70 + 16) = v68;
    *(void *)(v70 + 24) = v69;
    uint64_t v2 = (void *)swift_task_alloc();
    *((void *)v72 + 48) = v2;
    unint64_t v3 = sub_21DBA154C();
    *uint64_t v2 = *((void *)v72 + 16);
    v2[1] = sub_21DB976EC;
    return MEMORY[0x270F63498](v72 + 25, v67, &unk_267D1EC40, v70, v3);
  }
  uint64_t v61 = *((void *)v72 + 28);
  sub_21DBA15BC(*((void *)v72 + 42));
  swift_bridgeObjectRetain();
  *((void *)v72 + 21) = v61;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EC18);
  sub_21DBA166C();
  sub_21DBACF48();
  sub_21DB6DE48();
  uint64_t v62 = *((void *)v72 + 4);
  uint64_t v63 = *((void *)v72 + 5);
  *((void *)v72 + 50) = v63;
  if (v63 == 1) {
    goto LABEL_26;
  }
  *((void *)v72 + 6) = v62;
  *((void *)v72 + 7) = v63;
  swift_bridgeObjectRetain();
  if (!v63)
  {
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  uint64_t v59 = *((void *)v72 + 35);
  unsigned __int8 v58 = (char *)*((void *)v72 + 34);
  uint64_t v57 = *((void *)v72 + 36);
  *((void *)v72 + 8) = v62;
  *((void *)v72 + 9) = v63;
  swift_bridgeObjectRetain();
  sub_21DB915D4(v62, v63, 1, v58);
  uint64_t v60 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48);
  if (v60(v58, 1, v59) == 1)
  {
    sub_21DB9F1A8(*((void *)v72 + 34));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_26:
    uint64_t v15 = sub_21DBACAD8();
    sub_21DBA16F0();
    swift_allocError();
    (*(void (**)(uint64_t, void))(*(void *)(v15 - 8) + 104))(v12, *MEMORY[0x263F6BFC0]);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)())(*((void *)v72 + 16) + 8);
    return v13();
  }
  uint64_t v52 = *((void *)v72 + 41);
  uint64_t v53 = *((void *)v72 + 40);
  uint64_t v56 = *((void *)v72 + 35);
  id v55 = (char *)*((void *)v72 + 33);
  uint64_t v51 = *((void *)v72 + 36);
  uint64_t v50 = *(void (**)(void))(v51 + 32);
  v50();
  int v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
  v54(v53, v52, v56);
  uint64_t v4 = sub_21DBACD38();
  sub_21DB915D4(v4, v5, 1, v55);
  if (v60(v55, 1, v56) == 1)
  {
    sub_21DB9F1A8(*((void *)v72 + 33));
  }
  else
  {
    v50();
    if ((sub_21DBAC818() & 1) == 0
      || (uint64_t v47 = *((void *)v72 + 29),
          swift_bridgeObjectRetain(),
          *((void *)v72 + 24) = v47,
          sub_21DBACF48(),
          sub_21DB6DE48(),
          uint64_t v48 = *((void *)v72 + 10),
          uint64_t v49 = *((void *)v72 + 11),
          v49 == 1))
    {
      (*(void (**)(void, void))(*((void *)v72 + 36) + 8))(*((void *)v72 + 39), *((void *)v72 + 35));
    }
    else
    {
      *((void *)v72 + 12) = v48;
      *((void *)v72 + 13) = v49;
      swift_bridgeObjectRetain();
      if (v49)
      {
        uint64_t v46 = *((void *)v72 + 35);
        uint64_t v45 = (char *)*((void *)v72 + 32);
        *((void *)v72 + 14) = v48;
        *((void *)v72 + 15) = v49;
        swift_bridgeObjectRetain();
        sub_21DB915D4(v48, v49, 1, v45);
        if (v60(v45, 1, v46) == 1)
        {
          uint64_t v40 = *((void *)v72 + 39);
          uint64_t v41 = *((void *)v72 + 35);
          uint64_t v39 = *((void *)v72 + 36);
          sub_21DB9F1A8(*((void *)v72 + 32));
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v41);
        }
        else
        {
          uint64_t v34 = *((void *)v72 + 40);
          uint64_t v36 = *((void *)v72 + 39);
          uint64_t v35 = *((void *)v72 + 38);
          uint64_t v33 = *((void *)v72 + 37);
          uint64_t v37 = *((void *)v72 + 35);
          uint64_t v32 = *((void *)v72 + 36);
          v50();
          v54(v33, v35, v37);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 40))(v34, v33, v37);
          unint64_t v38 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
          v38(v35, v37);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v38(v36, v37);
        }
      }
      else
      {
        uint64_t v43 = *((void *)v72 + 39);
        uint64_t v44 = *((void *)v72 + 35);
        uint64_t v42 = *((void *)v72 + 36);
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v43, v44);
      }
    }
  }
  uint64_t v28 = sub_21DBAC708();
  *((void *)v72 + 51) = v28;
  uint64_t v29 = *(void *)(v28 - 8);
  *((void *)v72 + 52) = v29;
  uint64_t v31 = swift_task_alloc();
  *((void *)v72 + 53) = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0);
  uint64_t v30 = swift_task_alloc();
  sub_21DBACD38();
  sub_21DBAC6E8();
  swift_bridgeObjectRelease();
  sub_21DBACD38();
  sub_21DBACD38();
  sub_21DBAD048();
  uint64_t v19 = *((void *)v72 + 40);
  uint64_t v22 = *((void *)v72 + 37);
  uint64_t v21 = *((void *)v72 + 35);
  double v16 = v72[31];
  double v17 = v72[30];
  uint64_t v20 = *((void *)v72 + 36);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21DB79AD0(v30);
  swift_task_dealloc();
  sub_21DBA1774();
  uint64_t v18 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v18, v31, v28);
  double v6 = SFScreenScale();
  id v24 = sub_21DB999E0(v18, v17, v16, v6);
  *((void *)v72 + 54) = v24;
  swift_task_dealloc();
  *((void *)v72 + 22) = v24;
  v54(v22, v19, v21);
  id v23 = (id)sub_21DBAC798();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  *((void *)v72 + 55) = v7;
  *((void *)v72 + 56) = (v20 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v22, v21);
  objc_msgSend(v24, sel_setContentType_, v23);

  objc_msgSend(v24, sel_setIconMode_, 1);
  objc_msgSend(v24, sel_setIconVariant_, 1);
  uint64_t v25 = sub_21DBACD38();
  uint64_t v26 = v8;
  *((void *)v72 + 57) = v8;
  id v9 = v24;
  uint64_t v27 = swift_task_alloc();
  *((void *)v72 + 58) = v27;
  *(void *)(v27 + 16) = v24;
  uint64_t v10 = (void *)swift_task_alloc();
  *((void *)v72 + 59) = v10;
  unint64_t v11 = sub_21DBA154C();
  *uint64_t v10 = *((void *)v72 + 16);
  v10[1] = sub_21DB97A00;
  return MEMORY[0x270FA2360](v72 + 23, 0, 0, v25, v26, sub_21DBA17DC, v27, v11);
}

uint64_t sub_21DB976EC()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 128) = *v1;
  *(void *)(v4 + 392) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_21DB97DC8;
  }
  else
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_21DB97878;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB97878()
{
  uint64_t v1 = v0[45];
  uint64_t v2 = v0[44];
  uint64_t v3 = v0[43];
  v0[16] = v0;
  uint64_t v6 = v0[25];
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0[16] + 8);
  return v4(v6);
}

uint64_t sub_21DB97A00()
{
  uint64_t v5 = (void *)*v1;
  v5[16] = *v1;
  v5[60] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_21DB97F78;
  }
  else
  {
    uint64_t v4 = (void *)v5[54];
    swift_task_dealloc();

    swift_bridgeObjectRelease();
    uint64_t v2 = sub_21DB97B9C;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB97B9C()
{
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[55];
  uint64_t v1 = (void *)v0[54];
  uint64_t v6 = v0[53];
  uint64_t v4 = v0[52];
  uint64_t v5 = v0[51];
  uint64_t v8 = v0[41];
  uint64_t v7 = v0[40];
  uint64_t v9 = v0[35];
  v0[16] = v0;
  uint64_t v11 = v0[23];

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  swift_task_dealloc();
  v10(v7, v9);
  v10(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0[16] + 8);
  return v2(v11);
}

uint64_t sub_21DB97DC8()
{
  uint64_t v4 = v0[45];
  uint64_t v3 = v0[44];
  uint64_t v5 = v0[43];
  v0[16] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(v0[16] + 8);
  return v1();
}

uint64_t sub_21DB97F78()
{
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[55];
  id v3 = (id)v0[54];
  uint64_t v6 = v0[53];
  uint64_t v4 = v0[52];
  uint64_t v5 = v0[51];
  uint64_t v8 = v0[41];
  uint64_t v7 = v0[40];
  uint64_t v9 = v0[35];
  v0[16] = v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  swift_task_dealloc();
  v10(v7, v9);
  v10(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(v0[16] + 8);
  return v1();
}

uint64_t sub_21DB98378()
{
  uint64_t v26 = v0[24];
  uint64_t v25 = v0[23];
  uint64_t v27 = v0[22];
  v0[4] = v0;
  sub_21DBACA78();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v25 + 88))(v26, v27) != *MEMORY[0x263F6C128])
  {
    (*(void (**)(void, void))(*(void *)(v24 + 184) + 8))(*(void *)(v24 + 192), *(void *)(v24 + 176));
    goto LABEL_8;
  }
  (*(void (**)(void, void))(*(void *)(v24 + 184) + 8))(*(void *)(v24 + 192), *(void *)(v24 + 176));
  uint64_t v22 = sub_21DBAC708();
  *(void *)(v24 + 200) = v22;
  uint64_t v21 = *(void *)(v22 - 8);
  *(void *)(v24 + 208) = v21;
  uint64_t v19 = swift_task_alloc();
  *(void *)(v24 + 216) = v19;
  uint64_t v20 = sub_21DBACAB8();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0);
  uint64_t v23 = swift_task_alloc();
  *(void *)(v24 + 96) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EC68);
  sub_21DBA19C0();
  sub_21DBACF48();
  sub_21DB6DE48();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v23, 1, v22) == 1)
  {
    sub_21DB79AD0(v23);
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
LABEL_8:
    uint64_t v18 = *(void *)(v24 + 168);
    uint64_t v17 = *(void *)(v24 + 152);
    uint64_t v16 = *(void *)(v24 + 120);
    uint64_t v15 = *(void *)(v24 + 160);
    *(void *)(v24 + 64) = sub_21DBACA58();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v18, v16, v17);
    if (*(void *)(v24 + 64))
    {
      *(void *)(v24 + 56) = *(void *)(v24 + 64);
    }
    else
    {
      *(void *)(v24 + 56) = sub_21DBACA68();
      sub_21DB74628((id *)(v24 + 64));
    }
    (*(void (**)(void, void))(*(void *)(v24 + 160) + 8))(*(void *)(v24 + 168), *(void *)(v24 + 152));
    uint64_t v14 = *(void **)(v24 + 56);
    if (v14)
    {
      *(void *)(v24 + 88) = v14;
      sub_21DBA154C();
      id v13 = sub_21DB99058(v14);
      swift_task_dealloc();
      swift_task_dealloc();
      id v3 = *(uint64_t (**)(id))(*(void *)(v24 + 32) + 8);
      return v3(v13);
    }
    else
    {
      *(void *)(v24 + 72) = sub_21DBACA88();
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EC58);
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBE0);
      unint64_t v11 = sub_21DBA193C();
      uint64_t v12 = sub_21DB7B2F4((void (*)(char *, char *))sub_21DB99098, 0, v8, v9, MEMORY[0x263F8E628], v11, MEMORY[0x263F8E658], v10);
      *(void *)(v24 + 240) = v12;
      sub_21DB6DE48();
      *(void *)(v24 + 80) = sub_21DBACA88();
      uint64_t v7 = sub_21DB7B2F4((void (*)(char *, char *))sub_21DB990E8, 0, v8, v9, MEMORY[0x263F8E628], v11, MEMORY[0x263F8E658], v10);
      *(void *)(v24 + 248) = v7;
      sub_21DB6DE48();
      uint64_t v4 = (void *)swift_task_alloc();
      *(void *)(v24 + 256) = v4;
      *uint64_t v4 = *(void *)(v24 + 32);
      v4[1] = sub_21DB98D78;
      double v5 = *(double *)(v24 + 136);
      double v6 = *(double *)(v24 + 128);
      return static SFAirDropUtilities.generatePreviewIcon(for:fileTypes:fileSubTypes:size:)(0, v12, v7, v6, v5);
    }
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v19, v23, v22);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v24 + 224) = v1;
  *uint64_t v1 = *(void *)(v24 + 32);
  v1[1] = sub_21DB98AD8;
  return static SFAirDropUtilities.generateWebPreviewImage(url:)(v19);
}

uint64_t sub_21DB98AD8(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 32) = *v1;
  *(void *)(v3 + 232) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21DB98BF4, 0);
}

uint64_t sub_21DB98BF4()
{
  uint64_t v1 = v0[29];
  v0[4] = v0;
  v0[14] = v1;
  if (v0[14])
  {
    *(void *)(v5 + 104) = *(void *)(v5 + 112);
  }
  else
  {
    sub_21DBA154C();
    *(void *)(v5 + 104) = sub_21DB71BA8();
    sub_21DB74628((id *)(v5 + 112));
  }
  uint64_t v4 = *(void *)(v5 + 104);
  (*(void (**)(void))(*(void *)(v5 + 208) + 8))();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v5 + 32) + 8);
  return v2(v4);
}

uint64_t sub_21DB98D78(uint64_t a1)
{
  uint64_t v6 = *v2;
  *(void *)(v6 + 32) = *v2;
  *(void *)(v6 + 264) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_21DB98F7C, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)(v6 + 32) + 8);
    return v3(a1);
  }
}

uint64_t sub_21DB98F7C()
{
  *(void *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 32) + 8);
  return v1();
}

id sub_21DB99058(void *a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21DB9EA6C(a1);
}

uint64_t sub_21DB99098@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21DBACAA8();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_21DB990E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21DBACA98();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_21DB99138(uint64_t a1, uint64_t a2, double a3, double a4)
{
  *(double *)(v4 + 88) = a4;
  *(double *)(v4 + 80) = a3;
  *(void *)(v4 + 72) = a2;
  *(void *)(v4 + 64) = a1;
  *(void *)(v4 + 32) = v4;
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 56) = 0;
  *(void *)(v4 + 40) = a2;
  *(double *)(v4 + 16) = a3;
  *(double *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_21DB99198, 0);
}

uint64_t sub_21DB99198()
{
  uint64_t v20 = v0[9];
  v0[4] = v0;
  uint64_t v22 = sub_21DBAC708();
  v0[12] = v22;
  uint64_t v21 = *(void *)(v22 - 8);
  v0[13] = v21;
  uint64_t v19 = swift_task_alloc();
  v0[14] = v19;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0);
  uint64_t v23 = swift_task_alloc();
  v0[6] = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBC8);
  sub_21DBA14C8();
  sub_21DBACF48();
  sub_21DB6DE48();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v23, 1, v22) == 1)
  {
    sub_21DB79AD0(v23);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = sub_21DBACAD8();
    sub_21DBA16F0();
    swift_allocError();
    (*(void (**)(uint64_t, void))(*(void *)(v17 - 8) + 104))(v1, *MEMORY[0x263F6BFC0]);
    swift_willThrow();
    uint64_t v2 = *(uint64_t (**)(void))(*((void *)v18 + 4) + 8);
    return v2();
  }
  else
  {
    double v10 = v18[11];
    double v11 = v18[10];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v19, v23, v22);
    swift_task_dealloc();
    sub_21DBA1774();
    uint64_t v12 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v12, v19, v22);
    double v4 = SFScreenScale();
    id v13 = sub_21DB999E0(v12, v11, v10, v4);
    *((void *)v18 + 15) = v13;
    swift_task_dealloc();
    *((void *)v18 + 7) = v13;
    objc_msgSend(v13, sel_setIconMode_, 1);
    objc_msgSend(v13, sel_setIconVariant_, 1);
    uint64_t v14 = sub_21DBACD38();
    uint64_t v15 = v5;
    *((void *)v18 + 16) = v5;
    id v6 = v13;
    uint64_t v16 = swift_task_alloc();
    *((void *)v18 + 17) = v16;
    *(void *)(v16 + 16) = v13;
    uint64_t v7 = (void *)swift_task_alloc();
    *((void *)v18 + 18) = v7;
    unint64_t v8 = sub_21DBA154C();
    *uint64_t v7 = *((void *)v18 + 4);
    v7[1] = sub_21DB9965C;
    uint64_t v9 = *((void *)v18 + 8);
    return MEMORY[0x270FA2360](v9, 0, 0, v14, v15, sub_21DBA3580, v16, v8);
  }
}

uint64_t sub_21DB9965C()
{
  uint64_t v5 = (void *)*v1;
  v5[4] = *v1;
  v5[19] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_21DB998D4;
  }
  else
  {
    double v4 = (void *)v5[15];
    swift_task_dealloc();

    swift_bridgeObjectRelease();
    uint64_t v2 = sub_21DB997F8;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB997F8()
{
  uint64_t v1 = (void *)v0[15];
  uint64_t v6 = v0[14];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[12];
  v0[4] = v0;

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[4] + 8);
  return v2();
}

uint64_t sub_21DB998D4()
{
  id v3 = (id)v0[15];
  uint64_t v6 = v0[14];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[12];
  v0[4] = v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0[4] + 8);
  return v1();
}

id sub_21DB999E0(uint64_t a1, double a2, double a3, double a4)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21DB9EAB4(a1, a2, a3, a4);
}

void sub_21DB99A40(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = a2;
  uint64_t v12 = sub_21DBA3658;
  uint64_t v25 = a1;
  uint64_t v24 = a2;
  id v16 = objc_msgSend(self, sel_sharedGenerator, a1);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  uint64_t v5 = v7;
  uint64_t v6 = *(void *)(v7 + 64);
  unint64_t v4 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v2 = MEMORY[0x270FA5388](v11);
  double v10 = (char *)&v3 - v4;
  (*(void (**)(double))(v7 + 16))(v2);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v9, v10, v11);
  uint64_t v22 = v12;
  uint64_t v23 = v13;
  uint64_t aBlock = MEMORY[0x263EF8330];
  int v18 = 1107296256;
  int v19 = 0;
  uint64_t v20 = sub_21DB99E48;
  uint64_t v21 = &block_descriptor_352;
  uint64_t v15 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v16, sel_generateBestRepresentationForRequest_completionHandler_, v14, v15);
  _Block_release(v15);
}

void sub_21DB99C74(void *a1, void *a2)
{
  id v2 = a1;
  if (a1)
  {
    objc_msgSend(a1, sel_UIImage);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
    sub_21DBACE78();
  }
  else
  {
    id v3 = a2;
    if (a2)
    {
      id v5 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
      sub_21DBACE68();
    }
    else
    {
      uint64_t v6 = sub_21DBACAD8();
      sub_21DBA16F0();
      swift_allocError();
      (*(void (**)(uint64_t, void))(*(void *)(v6 - 8) + 104))(v4, *MEMORY[0x263F6BFC0]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
      sub_21DBACE68();
    }
  }
}

uint64_t sub_21DB99E48(uint64_t a1, void *a2, void *a3)
{
  uint64_t v7 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v3 = a2;
  id v4 = a3;
  if (a3) {
    uint64_t v6 = a3;
  }
  else {
    uint64_t v6 = 0;
  }
  v7(a2);

  return swift_release();
}

void sub_21DB99F04(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = a2;
  uint64_t v12 = sub_21DBA3658;
  uint64_t v25 = a1;
  uint64_t v24 = a2;
  id v16 = objc_msgSend(self, sel_sharedGenerator, a1);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
  uint64_t v7 = *(void *)(v11 - 8);
  uint64_t v8 = v11 - 8;
  uint64_t v5 = v7;
  uint64_t v6 = *(void *)(v7 + 64);
  unint64_t v4 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v2 = MEMORY[0x270FA5388](v11);
  double v10 = (char *)&v3 - v4;
  (*(void (**)(double))(v7 + 16))(v2);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v9, v10, v11);
  uint64_t v22 = v12;
  uint64_t v23 = v13;
  uint64_t aBlock = MEMORY[0x263EF8330];
  int v18 = 1107296256;
  int v19 = 0;
  uint64_t v20 = sub_21DB99E48;
  uint64_t v21 = &block_descriptor_358;
  uint64_t v15 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v16, sel_generateBestRepresentationForRequest_completionHandler_, v14, v15);
  _Block_release(v15);
}

void sub_21DB9A138(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = a1;
  v4[1] = a2;
  int v19 = sub_21DBA3948;
  uint64_t v31 = a1;
  uint64_t v30 = a2;
  uint64_t v8 = sub_21DBAC708();
  uint64_t v6 = *(void *)(v8 - 8);
  uint64_t v7 = v8 - 8;
  unint64_t v5 = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v2 = MEMORY[0x270FA5388](v8);
  unint64_t v9 = (char *)v4 - v5;
  (*(void (**)(char *, double))(v6 + 16))((char *)v4 - v5, v2);
  uint64_t v22 = (void *)sub_21DBAC688();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v8);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ED08);
  uint64_t v14 = *(void *)(v18 - 8);
  uint64_t v15 = v18 - 8;
  uint64_t v12 = v14;
  uint64_t v13 = *(void *)(v14 + 64);
  unint64_t v11 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v3 = MEMORY[0x270FA5388](v18);
  uint64_t v17 = (char *)v4 - v11;
  (*(void (**)(double))(v14 + 16))(v3);
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v20 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v20 + v16, v17, v18);
  uint64_t v28 = v19;
  uint64_t v29 = v20;
  uint64_t aBlock = MEMORY[0x263EF8330];
  int v24 = 1107296256;
  int v25 = 0;
  uint64_t v26 = sub_21DB9A480;
  uint64_t v27 = &block_descriptor_364;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_release();
  SFGenerateWebPreviewImage(v22, v21);
  _Block_release(v21);
}

uint64_t sub_21DB9A414(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ED08);
  return sub_21DBACE78();
}

uint64_t sub_21DB9A480(uint64_t a1, void *a2)
{
  unint64_t v4 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v2 = a2;
  v4(a2);

  return swift_release();
}

uint64_t static SFAirDropUtilities.createItemPromises(from:sessionID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v86 = a1;
  uint64_t v79 = a2;
  uint64_t v80 = a3;
  uint64_t v82 = 0;
  uint64_t v62 = &unk_267D1EC98;
  uint64_t v119 = 0;
  uint64_t v118 = 0;
  uint64_t v116 = 0;
  uint64_t v117 = 0;
  uint64_t v115 = 0;
  uint64_t v114 = 0;
  char v113 = 0;
  uint64_t v112 = 0;
  uint64_t v89 = v111;
  memset(v111, 0, sizeof(v111));
  uint64_t v105 = 0;
  unint64_t v104 = 0;
  uint64_t v98 = 0;
  uint64_t v99 = 0;
  char v95 = 0;
  unsigned __int8 v94 = 0;
  uint64_t v92 = 0;
  uint64_t v93 = 0;
  uint64_t v91 = 0;
  id v90 = 0;
  uint64_t v81 = sub_21DBACA08();
  unint64_t v63 = (*(void *)(*(void *)(v81 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v81);
  uint64_t v64 = (char *)&v29 - v63;
  unint64_t v65 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1E420) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v82);
  uint64_t v66 = (uint64_t)&v29 - v65;
  uint64_t v67 = sub_21DBACA28();
  uint64_t v68 = *(void *)(v67 - 8);
  uint64_t v69 = v67 - 8;
  unint64_t v70 = (*(void *)(v68 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v82);
  uint64_t v71 = (char *)&v29 - v70;
  unint64_t v72 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5);
  uint64_t v73 = (char *)&v29 - v72;
  uint64_t v119 = (char *)&v29 - v72;
  uint64_t v74 = sub_21DBAC858();
  uint64_t v75 = *(void *)(v74 - 8);
  uint64_t v76 = v74 - 8;
  unint64_t v77 = (*(void *)(v75 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v74);
  uint64_t v78 = (char *)&v29 - v77;
  unint64_t v83 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v82);
  uint64_t v84 = (char *)&v29 - v83;
  uint64_t v118 = v86;
  uint64_t v116 = v6;
  uint64_t v117 = v7;
  uint64_t v115 = v3;
  uint64_t v114 = sub_21DBAD308();
  int v85 = static SFAirDropUtilities.shouldIgnoreString(for:)(v86);
  char v113 = v85 & 1;
  uint64_t v87 = *sub_21DB7BC30();
  swift_bridgeObjectRetain();
  uint64_t v112 = v87;
  uint64_t v109 = v86;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBA0);
  unint64_t v8 = sub_21DBA117C();
  MEMORY[0x223C12CF0](&v110, v88, v8);
  uint64_t v108 = v110;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EC80);
  sub_21DBAD1E8();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EC88);
    sub_21DBAD1F8();
    uint64_t v59 = v106;
    uint64_t v60 = v107;
    if (!v107) {
      break;
    }
    uint64_t v57 = v59;
    unsigned __int8 v58 = v60;
    uint64_t v56 = v60;
    uint64_t v55 = v59;
    uint64_t v105 = v59;
    unint64_t v104 = v60;
    uint64_t v100 = static SFAirDropUtilities.highestFidelityDataType(for:conformingToDataTypes:)(v60, v87);
    uint64_t v101 = v9;
    id v10 = v56;
    swift_bridgeObjectRetain();
    if (v101)
    {
      uint64_t v102 = v100;
      uint64_t v103 = v101;
    }
    else
    {
      uint64_t v102 = static SFAirDropUtilities.guessedDataType(for:dataTypesToTry:)(v56, v87);
      uint64_t v103 = v11;
      sub_21DB6C060();
    }

    swift_bridgeObjectRelease();
    uint64_t v53 = v102;
    uint64_t v54 = v103;
    uint64_t v98 = v102;
    uint64_t v99 = v103;
    swift_bridgeObjectRetain();
    sub_21DBAC868();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v84, 1, v74) == 1)
    {
      sub_21DB9F1A8((uint64_t)v84);
      int v52 = 2;
    }
    else
    {
      sub_21DBAC828();
      int v51 = sub_21DBAC818();
      uint64_t v50 = *(void (**)(char *, uint64_t))(v75 + 8);
      uint64_t v49 = v75 + 8;
      v50(v78, v74);
      v50(v84, v74);
      int v52 = v51 & 1;
    }
    char v96 = v52;
    if (v52 == 2) {
      unsigned __int8 v97 = 0;
    }
    else {
      unsigned __int8 v97 = v96 & 1;
    }
    int v46 = v97;
    int v47 = 1;
    char v95 = v97 & 1;
    sub_21DBA1090();
    swift_bridgeObjectRetain();
    id v48 = sub_21DB9B128(v53, v54, v47 & 1);
    if (v48)
    {
      id v45 = v48;
      id v44 = v48;
      id v90 = v48;
      sub_21DBAC848();
      id v42 = (id)sub_21DBAC798();
      (*(void (**)(char *, uint64_t))(v75 + 8))(v78, v74);
      unsigned int v43 = objc_msgSend(v44, sel_conformsToType_, v42);

      unsigned __int8 v94 = v43 & 1;
    }
    else
    {
      unsigned __int8 v94 = 0;
    }
    int v41 = v94;
    if (v85) {
      int v40 = v41;
    }
    else {
      int v40 = 0;
    }
    if (v40)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      static SFAirDropUtilities.suggestedAirDropThumbnailSize()();
      uint64_t v35 = v12;
      uint64_t v36 = v13;
      uint64_t v92 = v12;
      uint64_t v93 = v13;
      uint64_t v37 = 0;
      unsigned int v34 = 1;
      uint64_t v33 = sub_21DBACD38();
      uint64_t v32 = v14;
      int v31 = v94;
      sub_21DB9B1A0();
      sub_21DBACA18();
      uint64_t v15 = sub_21DBACEC8();
      (*(void (**)(uint64_t, void))(*(void *)(v15 - 8) + 56))(v66, v34);
      id v16 = v56;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v17 = swift_allocObject();
      uint64_t v18 = v87;
      char v19 = v34;
      char v20 = v85;
      uint64_t v21 = v35;
      uint64_t v22 = v36;
      uint64_t v23 = v79;
      uint64_t v24 = v80;
      uint64_t v25 = v55;
      uint64_t v26 = v61;
      uint64_t v27 = v56;
      uint64_t v38 = v17;
      *(void *)(v17 + 16) = 0;
      *(void *)(v17 + 24) = 0;
      *(void *)(v17 + 32) = v27;
      *(void *)(v17 + 40) = v18;
      *(unsigned char *)(v17 + 48) = v20 & v19;
      *(void *)(v17 + 56) = v21;
      *(void *)(v17 + 64) = v22;
      *(void *)(v17 + 72) = v23;
      *(void *)(v17 + 80) = v24;
      *(void *)(v17 + 88) = v25;
      *(void *)(v17 + 96) = v26;
      sub_21DBACA48();
      uint64_t v39 = sub_21DB64240(v66, (uint64_t)v62, v38);
      uint64_t v91 = v39;
      swift_retain();
      (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v71, v73, v67);
      sub_21DBAC9F8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECA0);
      sub_21DBACE38();
      swift_release();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v73, v67);
    }
  }
  sub_21DB6DE48();
  uint64_t v29 = &v114;
  uint64_t v30 = v114;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_21DB6DE48();
  return v30;
}

id sub_21DB9B128(uint64_t a1, uint64_t a2, char a3)
{
  id v5 = (id)sub_21DBACCC8();
  id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel__typeWithIdentifier_allowUndeclared_, v5, a3 & 1);

  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_21DB9B1A0()
{
  return 0;
}

uint64_t sub_21DB9B1A8(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10)
{
  *(void *)(v10 + 176) = v24;
  *(void *)(v10 + 168) = v23;
  *(void *)(v10 + 160) = a10;
  *(void *)(v10 + 152) = a9;
  *(double *)(v10 + 144) = a3;
  *(double *)(v10 + 136) = a2;
  *(unsigned char *)(v10 + 313) = a8 & 1;
  *(void *)(v10 + 128) = a7;
  *(void *)(v10 + 120) = a6;
  *(void *)(v10 + 112) = a1;
  *(void *)(v10 + 64) = v10;
  *(void *)(v10 + 72) = 0;
  *(void *)(v10 + 80) = 0;
  *(unsigned char *)(v10 + 312) = 0;
  *(void *)(v10 + 16) = 0;
  *(void *)(v10 + 24) = 0;
  *(void *)(v10 + 32) = 0;
  *(void *)(v10 + 40) = 0;
  *(void *)(v10 + 88) = 0;
  *(void *)(v10 + 96) = 0;
  *(void *)(v10 + 48) = 0;
  *(void *)(v10 + 56) = 0;
  uint64_t v11 = sub_21DBAC8A8();
  *(void *)(v10 + 184) = v11;
  *(void *)(v10 + 192) = *(void *)(v11 - 8);
  *(void *)(v10 + 200) = swift_task_alloc();
  uint64_t v12 = sub_21DBACB08();
  *(void *)(v10 + 208) = v12;
  *(void *)(v10 + 216) = *(void *)(v12 - 8);
  *(void *)(v10 + 224) = swift_task_alloc();
  *(void *)(v10 + 232) = swift_task_alloc();
  uint64_t v13 = sub_21DBACA28();
  *(void *)(v10 + 240) = v13;
  *(void *)(v10 + 248) = *(void *)(v13 - 8);
  *(void *)(v10 + 256) = swift_task_alloc();
  *(void *)(v10 + 264) = swift_task_alloc();
  *(void *)(v10 + 272) = type metadata accessor for SFAirDropUtilities.FileLoadResult();
  *(void *)(v10 + 280) = swift_task_alloc();
  *(void *)(v10 + 72) = a6;
  *(void *)(v10 + 80) = a7;
  *(unsigned char *)(v10 + 312) = a8 & 1;
  *(double *)(v10 + 16) = a2;
  *(double *)(v10 + 24) = a3;
  *(void *)(v10 + 32) = a9;
  *(void *)(v10 + 40) = a10;
  *(void *)(v10 + 88) = v23;
  return MEMORY[0x270FA2498](sub_21DB9B4E8, 0);
}

uint64_t sub_21DB9B4E8()
{
  *(void *)(v0 + 64) = v0;
  sub_21DBACD38();
  *(void *)(v0 + 288) = v1;
  id v2 = (void *)swift_task_alloc();
  *((void *)v10 + 37) = v2;
  *id v2 = *((void *)v10 + 8);
  v2[1] = sub_21DB9B644;
  uint64_t v3 = *((void *)v10 + 35);
  double v4 = v10[18];
  double v5 = v10[17];
  uint64_t v6 = *((void *)v10 + 16);
  uint64_t v7 = *((void *)v10 + 15);
  char v8 = *(unsigned char *)(v0 + 313) & 1;
  return static SFAirDropUtilities.loadFile(from:dataTypesToTry:customDataType:acceptOtherFileRepresentations:ignoreStrings:generatePreviewImage:renameURLs:suggestedThumbnailSize:filename:sessionID:fileIndex:)(v3, v7, v6, 0, 0, 0, v8, 1, v5, v4);
}

uint64_t sub_21DB9B644()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 64) = *v1;
  *(void *)(v4 + 304) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_21DB9BC08;
  }
  else
  {
    swift_bridgeObjectRelease();
    id v2 = sub_21DB9B7C0;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB9B7C0()
{
  uint64_t v20 = v0[35];
  uint64_t v1 = v0[34];
  uint64_t v21 = v0[33];
  uint64_t v22 = v0[32];
  uint64_t v16 = v0[31];
  uint64_t v17 = v0[30];
  uint64_t v23 = v0[29];
  uint64_t v24 = v0[28];
  uint64_t v7 = v0[27];
  uint64_t v14 = v0[26];
  v0[8] = v0;
  id v6 = *(id *)(v20 + *(int *)(v1 + 24));
  id v2 = v6;
  uint64_t v18 = static SFAirDropUtilities.imageData(for:)(v6);
  unint64_t v19 = v3;

  v0[6] = v18;
  v0[7] = v19;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v15(v23, v20, v14);
  uint64_t v10 = sub_21DBAC708();
  uint64_t v8 = *(void *)(v10 - 8);
  uint64_t v13 = swift_task_alloc();
  sub_21DBACAF8();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v9(v23, v14);
  sub_21DBAC678();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v11(v13, v10);
  swift_bridgeObjectRetain();
  v15(v24, v20, v14);
  uint64_t v12 = swift_task_alloc();
  sub_21DBACAF8();
  v9(v24, v14);
  sub_21DBAC668();
  v11(v12, v10);
  sub_21DB9F8B4(v18, v19);
  sub_21DB9B1A0();
  sub_21DBACA18();
  swift_task_dealloc();
  swift_task_dealloc();
  v15(v23, v20, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v22, v21, v17);
  sub_21DBACA38();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v21, v17);
  sub_21DB9F868(v18, v19);
  sub_21DBA0068(v20);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0[8] + 8);
  return v4();
}

uint64_t sub_21DB9BC08()
{
  uint64_t v47 = v0;
  id v21 = *(id *)(v0 + 304);
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v16 = *(void *)(v0 + 192);
  uint64_t v17 = *(void *)(v0 + 184);
  uint64_t v18 = *(void *)(v0 + 168);
  uint64_t v20 = *(void *)(v0 + 160);
  uint64_t v19 = *(void *)(v0 + 152);
  *(void *)(v0 + 64) = v0;
  swift_bridgeObjectRelease();
  id v2 = v21;
  *(void *)(v0 + 96) = v21;
  uint64_t v3 = sub_21DB7AC74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v3, v17);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v18;
  swift_bridgeObjectRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v19;
  *(void *)(v25 + 24) = v20;
  id v4 = v21;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v21;
  sub_21DB7422C();
  swift_bridgeObjectRelease();
  int v40 = sub_21DBAC888();
  os_log_type_t v41 = sub_21DBACF98();
  *(void *)(v0 + 104) = 32;
  sub_21DB6A04C();
  sub_21DB6A0C8();
  sub_21DB6A144();
  sub_21DBACDD8();
  uint32_t size = *(_DWORD *)(v0 + 316);
  uint64_t v30 = swift_allocObject();
  *(unsigned char *)(v30 + 16) = 0;
  uint64_t v31 = swift_allocObject();
  *(unsigned char *)(v31 + 16) = 8;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = sub_21DBA30C8;
  *(void *)(v24 + 24) = v23;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = sub_21DBA3224;
  *(void *)(v32 + 24) = v24;
  uint64_t v33 = swift_allocObject();
  *(unsigned char *)(v33 + 16) = 32;
  uint64_t v34 = swift_allocObject();
  *(unsigned char *)(v34 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_21DBA02A4;
  *(void *)(v26 + 24) = v25;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = sub_21DB6B8C0;
  *(void *)(v35 + 24) = v26;
  uint64_t v36 = swift_allocObject();
  *(unsigned char *)(v36 + 16) = 64;
  uint64_t v37 = swift_allocObject();
  *(unsigned char *)(v37 + 16) = 8;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_21DB75008;
  *(void *)(v28 + 24) = v27;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = sub_21DB79F00;
  *(void *)(v29 + 24) = v28;
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = sub_21DB74A80;
  *(void *)(v38 + 24) = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E458);
  sub_21DBAD308();
  uint64_t v39 = v5;
  swift_retain();
  *uint64_t v39 = sub_21DB6B84C;
  v39[1] = v30;
  swift_retain();
  v39[2] = sub_21DB6B84C;
  v39[3] = v31;
  swift_retain();
  v39[4] = sub_21DBA3270;
  v39[5] = v32;
  swift_retain();
  v39[6] = sub_21DB6B84C;
  v39[7] = v33;
  swift_retain();
  v39[8] = sub_21DB6B84C;
  v39[9] = v34;
  swift_retain();
  v39[10] = sub_21DB6B90C;
  v39[11] = v35;
  swift_retain();
  v39[12] = sub_21DB6B84C;
  v39[13] = v36;
  swift_retain();
  v39[14] = sub_21DB6B84C;
  v39[15] = v37;
  swift_retain();
  v39[16] = sub_21DB74C10;
  v39[17] = v38;
  sub_21DB6120C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v40, v41))
  {
    buf = (uint8_t *)sub_21DBAD038();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1E460);
    uint64_t v13 = sub_21DB6A1C0(1);
    uint64_t v14 = sub_21DB6A1C0(1);
    id v42 = buf;
    uint64_t v43 = v13;
    uint64_t v44 = v14;
    sub_21DB6A21C(2, &v42);
    sub_21DB6A21C(3, &v42);
    id v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v46 = v30;
    sub_21DB6A230(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    id v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v46 = v31;
    sub_21DB6A230(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    id v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DBA3270;
    uint64_t v46 = v32;
    sub_21DB6A230(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    id v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v46 = v33;
    sub_21DB6A230(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    id v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v46 = v34;
    sub_21DB6A230(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    id v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B90C;
    uint64_t v46 = v35;
    sub_21DB6A230(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    id v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v46 = v36;
    sub_21DB6A230(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    id v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB6B84C;
    uint64_t v46 = v37;
    sub_21DB6A230(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    id v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21DB74C10;
    uint64_t v46 = v38;
    sub_21DB6A230(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
    _os_log_impl(&dword_21DB23000, v40, v41, "Failed to load item %ld for session %s: %@", buf, size);
    sub_21DB6A27C(v13);
    sub_21DB6A27C(v14);
    sub_21DBAD018();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  id v10 = (id)v15[38];
  uint64_t v11 = v15[25];
  uint64_t v9 = v15[23];
  uint64_t v8 = v15[24];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v9);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v6 = *(uint64_t (**)(void))(v15[8] + 8);
  return v6();
}

uint64_t SFAirDropUtilities.deinit()
{
  return v0;
}

uint64_t SFAirDropUtilities.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_21DB9CB08()
{
  return sub_21DB9CB44();
}

uint64_t sub_21DB9CB44()
{
  return v0;
}

uint64_t SFAirDropUtilities.FileLoadError.description.getter()
{
  id v6 = *(void **)v0;
  if (*(unsigned char *)(v0 + 8))
  {
    if (*(unsigned char *)(v0 + 8) == 1)
    {
      swift_bridgeObjectRetain();
      sub_21DBAD2F8();
      sub_21DBACD38();
      sub_21DBAD2E8();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EB20);
      sub_21DBA1BE4();
      sub_21DBAD2C8();
      sub_21DBACD38();
      sub_21DBAD2E8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_21DB6C060();
      uint64_t v3 = sub_21DBACD28();
      swift_bridgeObjectRelease();
      return v3;
    }
    else
    {
      return sub_21DBACD38();
    }
  }
  else
  {
    id v1 = v6;
    sub_21DBAD2F8();
    sub_21DBACD38();
    sub_21DBAD2E8();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1E468);
    sub_21DBAD2B8();
    sub_21DBACD38();
    sub_21DBAD2E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21DB6C060();
    uint64_t v4 = sub_21DBACD28();

    return v4;
  }
}

uint64_t sub_21DB9CED0()
{
  return SFAirDropUtilities.FileLoadError.description.getter();
}

uint64_t sub_21DB9CEE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v25 = a3;
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  uint64_t v26 = "Fatal error";
  uint64_t v27 = "SharingUI/SFUISwiftUtilities.swift";
  uint64_t v50 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0);
  unint64_t v28 = (*(void *)(*(void *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v3);
  int v40 = (char *)v13 - v28;
  uint64_t v42 = sub_21DBAC858();
  uint64_t v38 = *(void *)(v42 - 8);
  uint64_t v39 = v42 - 8;
  uint64_t v32 = *(void *)(v38 + 64);
  unint64_t v29 = (v32 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v37);
  uint64_t v30 = (char *)v13 - v29;
  unint64_t v31 = (v32 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v33 = (char *)v13 - v31;
  uint64_t v50 = (char *)v13 - v31;
  unint64_t v34 = (v32 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)v13 - v34;
  uint64_t v49 = (char *)v13 - v34;
  uint64_t v47 = v7;
  uint64_t v48 = v6;
  swift_bridgeObjectRetain();
  unsigned int v41 = 1;
  sub_21DB915D4(v36, v37, 0, v40);
  if ((*(unsigned int (**)(char *, void, uint64_t))(v38 + 48))(v40, v41, v42) == 1)
  {
    sub_21DB9F1A8((uint64_t)v40);
    swift_bridgeObjectRetain();
    v13[1] = 46;
    uint64_t v9 = sub_21DBAD2F8();
    uint64_t v16 = &v45;
    uint64_t v45 = v9;
    uint64_t v46 = v10;
    int v14 = 1;
    sub_21DBACD38();
    v13[2] = v11;
    sub_21DBAD2E8();
    swift_bridgeObjectRelease();
    uint64_t v43 = v36;
    uint64_t v44 = v37;
    sub_21DBAD2D8();
    sub_21DBACD38();
    uint64_t v15 = v12;
    sub_21DBAD2E8();
    swift_bridgeObjectRelease();
    uint64_t v18 = v45;
    uint64_t v17 = v46;
    swift_bridgeObjectRetain();
    sub_21DB6C060();
    sub_21DBACD28();
    uint64_t result = sub_21DBAD1C8();
    __break(1u);
  }
  else
  {
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
    uint64_t v19 = v38 + 32;
    v20(v33, v40, v42);
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
    uint64_t v21 = v38 + 16;
    v22(v30, v33, v42);
    v20(v35, v30, v42);
    uint64_t v24 = *(void (**)(char *, uint64_t))(v38 + 8);
    uint64_t v23 = v38 + 8;
    v24(v33, v42);
    v22(v25, v35, v42);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v24)(v35, v42);
  }
  return result;
}

uint64_t sub_21DB9D394()
{
  uint64_t v3 = sub_21DBAC858();
  __swift_allocate_value_buffer(v3, qword_267D1FD70);
  uint64_t v4 = (char *)__swift_project_value_buffer(v3, (uint64_t)qword_267D1FD70);
  uint64_t v0 = sub_21DBACD38();
  return sub_21DB9CEE8(v0, v1, v4);
}

void sub_21DB9D400(uint64_t a1, id a2, void *a3)
{
  id v3 = a2;
  id v4 = a3;
  uint64_t v12 = *(void *)(a1 + 32);
  if (a3)
  {
    id v7 = a3;
    unint64_t v8 = sub_21DBA0F48();
    sub_21DB80A74(v12, (uint64_t)a3, v8);
  }
  else
  {
    id v5 = a2;
    id v13 = a2;
    unint64_t v6 = sub_21DBA0F48();
    sub_21DB80AD0(v12, (uint64_t)&v13, v6);
  }
}

uint64_t sub_21DB9D4D0(uint64_t a1, uint64_t a2, void *a3)
{
  swift_unknownObjectRetain();
  id v3 = a3;
  uint64_t v12 = *(void *)(a1 + 32);
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAE0);
    sub_21DB80A74(v12, (uint64_t)a3, v7);
  }
  else
  {
    swift_unknownObjectRetain();
    if (a2)
    {
      uint64_t v8 = a2;
    }
    else
    {
      sub_21DBAD328();
      __break(1u);
    }
    uint64_t v13 = v8;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAE0);
    sub_21DB80AD0(v12, (uint64_t)&v13, v4);
  }

  return swift_unknownObjectRelease();
}

void sub_21DB9D5EC(uint64_t a1, id a2, void *a3)
{
  uint64_t v23 = a1;
  id v21 = a2;
  id v22 = a3;
  id v3 = a2;
  id v4 = v22;
  uint64_t v24 = *(void *)(v23 + 32);
  if (v22)
  {
    id v20 = v22;
    id v9 = v22;
    id v7 = v22;
    uint64_t v8 = sub_21DBAC708();
    sub_21DB80A74(v24, (uint64_t)v22, v8);
  }
  else
  {
    uint64_t v17 = sub_21DBAC708();
    uint64_t v13 = *(void *)(v17 - 8);
    uint64_t v14 = v17 - 8;
    uint64_t v11 = *(void *)(v13 + 64);
    uint64_t v19 = &v9;
    unint64_t v10 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](v21);
    uint64_t v16 = (uint64_t)&v9 - v10;
    id v6 = v5;
    uint64_t v18 = &v9;
    unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388](v21);
    uint64_t v15 = (char *)&v9 - v12;
    sub_21DBAC6C8();
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v16, v15, v17);
    sub_21DB80AD0(v24, v16, v17);
  }
}

uint64_t SFUIPeopleSuggestionImageProvider.previewCornerIcon(for:)(uint64_t a1, uint64_t a2)
{
  v3[9] = v2;
  v3[8] = a2;
  void v3[7] = a1;
  v3[4] = v3;
  v3[2] = 0;
  v3[3] = 0;
  void v3[5] = 0;
  v3[2] = a1;
  v3[3] = a2;
  void v3[5] = v2;
  return MEMORY[0x270FA2498](sub_21DB9D804, 0);
}

uint64_t sub_21DB9D804()
{
  id v8 = (id)v0[9];
  uint64_t v7 = v0[8];
  uint64_t v6 = v0[7];
  v0[4] = v0;
  uint64_t v10 = sub_21DBACD38();
  uint64_t v11 = v1;
  v0[10] = v1;
  swift_bridgeObjectRetain();
  id v2 = v8;
  unint64_t v12 = (void *)swift_task_alloc();
  v0[11] = v12;
  v12[2] = v6;
  v12[3] = v7;
  void v12[4] = v8;
  id v3 = (void *)swift_task_alloc();
  *(void *)(v9 + 96) = v3;
  unint64_t v4 = sub_21DBA154C();
  *id v3 = *(void *)(v9 + 32);
  v3[1] = sub_21DB9D980;
  return MEMORY[0x270FA2360](v9 + 48, 0, 0, v10, v11, sub_21DBA1C68, v12, v4);
}

uint64_t sub_21DB9D980()
{
  id v5 = (void *)*v1;
  v5[4] = *v1;
  v5[13] = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_21DB9DB7C;
  }
  else
  {
    unint64_t v4 = (void *)v5[9];
    swift_task_dealloc();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    id v2 = sub_21DB9DB2C;
  }
  return MEMORY[0x270FA2498](v2, 0);
}

uint64_t sub_21DB9DB2C()
{
  *(void *)(v0 + 32) = v0;
  return (*(uint64_t (**)(void))(*(void *)(v0 + 32) + 8))(*(void *)(v0 + 48));
}

uint64_t sub_21DB9DB7C()
{
  id v3 = *(id *)(v0 + 72);
  *(void *)(v0 + 32) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 32) + 8);
  return v1();
}

void sub_21DB9DC54(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v13[1] = a1;
  uint64_t v17 = a2;
  uint64_t v18 = a3;
  id v19 = a4;
  uint64_t v29 = 0;
  uint64_t v25 = sub_21DBA2BB4;
  uint64_t v50 = a1;
  uint64_t v48 = a2;
  uint64_t v49 = a3;
  uint64_t v47 = a4;
  sub_21DBA2A58();
  id v39 = (id)sub_21DBACFC8();
  swift_bridgeObjectRetain();
  id v4 = v19;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
  uint64_t v20 = *(void *)(v24 - 8);
  uint64_t v21 = v24 - 8;
  uint64_t v15 = v20;
  uint64_t v16 = *(void *)(v20 + 64);
  unint64_t v14 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v5 = MEMORY[0x270FA5388](v24);
  uint64_t v23 = (char *)v13 - v14;
  (*(void (**)(double))(v20 + 16))(v5);
  unint64_t v22 = (*(unsigned __int8 *)(v15 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  uint64_t v7 = v18;
  id v8 = v19;
  uint64_t v9 = v20;
  unint64_t v10 = v22;
  uint64_t v11 = v23;
  uint64_t v12 = v24;
  uint64_t v26 = v6;
  v6[2] = v17;
  v6[3] = v7;
  v6[4] = v8;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))((char *)v6 + v10, v11, v12);
  uint64_t v45 = v25;
  uint64_t v46 = v26;
  uint64_t aBlock = MEMORY[0x263EF8330];
  int v41 = 1107296256;
  int v42 = 0;
  uint64_t v43 = sub_21DB709C8;
  uint64_t v44 = &block_descriptor_277;
  uint64_t v38 = _Block_copy(&aBlock);
  uint64_t v37 = sub_21DBACBF8();
  uint64_t v34 = *(void *)(v37 - 8);
  uint64_t v35 = v37 - 8;
  unint64_t v27 = (*(void *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v37);
  uint64_t v36 = (char *)v13 - v27;
  sub_21DB9E818();
  uint64_t v33 = sub_21DBACBD8();
  uint64_t v30 = *(void *)(v33 - 8);
  uint64_t v31 = v33 - 8;
  unint64_t v28 = (*(void *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v33);
  uint64_t v32 = (char *)v13 - v28;
  sub_21DB9E830();
  MEMORY[0x223C12F40](v29, v36, v32, v38);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v37);
  _Block_release(v38);
  swift_release();
}

void sub_21DB9E034(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v33 = a1;
  uint64_t v30 = a2;
  id v34 = a3;
  uint64_t v20 = a4;
  uint64_t v19 = 0;
  uint64_t v31 = sub_21DBA2EEC;
  uint64_t v47 = a1;
  uint64_t v48 = a2;
  uint64_t v46 = a3;
  uint64_t v45 = a4;
  sub_21DBA2D90();
  uint64_t v13 = "CornerIconProvidingSuggestion";
  uint64_t v14 = 29;
  v12[1] = 1;
  uint64_t v15 = sub_21DBACD38();
  uint64_t v16 = v4;
  uint64_t v17 = sub_21DBACD38();
  uint64_t v18 = v5;
  swift_bridgeObjectRetain();
  id v36 = sub_21DB9E38C(v15, v16, v17, v18, v33, v30, 0, 0, 0);
  id v44 = v36;
  id v6 = v36;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
  uint64_t v24 = *(void *)(v28 - 8);
  uint64_t v25 = v28 - 8;
  uint64_t v22 = v24;
  uint64_t v23 = *(void *)(v24 + 64);
  unint64_t v21 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v7 = MEMORY[0x270FA5388](v28);
  unint64_t v27 = (char *)v12 - v21;
  (*(void (**)(double))(v24 + 16))(v7);
  swift_bridgeObjectRetain();
  unint64_t v26 = (*(unsigned __int8 *)(v22 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v29 = (v26 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v32 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v32 + v26, v27, v28);
  uint64_t v8 = v30;
  uint64_t v9 = v31;
  uint64_t v10 = v32;
  uint64_t v11 = (void *)(v32 + v29);
  *uint64_t v11 = v33;
  v11[1] = v8;
  int v42 = v9;
  uint64_t v43 = v10;
  uint64_t aBlock = MEMORY[0x263EF8330];
  int v38 = 1107296256;
  int v39 = 0;
  int v40 = sub_21DB9E750;
  int v41 = &block_descriptor_283;
  uint64_t v35 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v34, sel_requestTransportImageForPeopleSuggestion_resultHandler_, v36, v35);
  _Block_release(v35);
  swift_unknownObjectRelease();
}

id sub_21DB9E38C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21DB9EB80(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_21DB9E418(void *a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    id v3 = a1;
    if (a1)
    {
      id v5 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
      sub_21DBACE78();
    }
    else
    {
      id v4 = a3;
      if (a3)
      {
        id v10 = a3;
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
        sub_21DBACE68();
      }
      else
      {
        uint64_t v13 = sub_21DBACB58();
        sub_21DBA3018();
        swift_allocError();
        uint64_t v14 = v6;
        sub_21DBAD2F8();
        sub_21DBACD38();
        sub_21DBAD2E8();
        swift_bridgeObjectRelease();
        sub_21DBAD2D8();
        sub_21DBACD38();
        sub_21DBAD2E8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_21DB6C060();
        uint64_t v11 = sub_21DBACD28();
        uint64_t v12 = v7;
        uint64_t v8 = sub_21DBACD38();
        uint64_t *v14 = v11;
        v14[1] = v12;
        v14[2] = v8;
        v14[3] = v9;
        v14[4] = 569;
        (*(void (**)(void))(*(void *)(v13 - 8) + 104))();
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
        sub_21DBACE68();
      }
    }
  }
}

uint64_t sub_21DB9E750(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v9 = *(void (**)(void *, void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  id v5 = a4;
  if (a4) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = 0;
  }
  v9(a2, a3 & 1);

  return swift_release();
}

uint64_t sub_21DB9E818()
{
  return sub_21DBACBE8();
}

uint64_t sub_21DB9E830()
{
  return sub_21DBAD088();
}

id sub_21DB9E8C8(uint64_t a1)
{
  uint64_t v7 = sub_21DBAC708();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 48))(a1, 1) == 1)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v3 = sub_21DBAC688();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
    id v4 = (void *)v3;
  }
  id v2 = objc_msgSend(v5, sel_initWithBundleAtURL_);

  return v2;
}

id sub_21DB9E9D0(uint64_t a1)
{
  id v4 = (id)sub_21DBAC688();
  id v6 = objc_msgSend(v1, sel_initWithAssetBundleAtURL_);

  uint64_t v2 = sub_21DBAC708();
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  return v6;
}

id sub_21DB9EA6C(void *a1)
{
  id v4 = objc_msgSend(v1, sel_initWithCGImage_);

  return v4;
}

id sub_21DB9EAB4(uint64_t a1, double a2, double a3, double a4)
{
  id v10 = (id)sub_21DBAC688();
  id v12 = objc_msgSend(v4, sel_initWithFileAtURL_size_scale_representationTypes_, a2, a3, a4);

  uint64_t v5 = sub_21DBAC708();
  (*(void (**)(uint64_t))(*(void *)(v5 - 8) + 8))(a1);
  return v12;
}

id sub_21DB9EB80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15 = (void *)sub_21DBACCC8();
  uint64_t v16 = (void *)sub_21DBACCC8();
  uint64_t v17 = (void *)sub_21DBACCC8();
  if (a9)
  {
    uint64_t v11 = sub_21DBACCC8();
    swift_bridgeObjectRelease();
    id v12 = (void *)v11;
  }
  else
  {
    id v12 = 0;
  }
  id v10 = objc_msgSend(v14, sel_initWithIdentifier_displayName_transportBundleIdentifier_contact_deviceModelIdentifier_, v15, v16, v17, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v10;
}

double sub_21DB9ECC8(uint64_t a1)
{
  return (double)a1;
}

uint64_t type metadata accessor for SFAirDropUtilities.FileLoadResult()
{
  uint64_t v1 = qword_267D1ECB8;
  if (!qword_267D1ECB8) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

unint64_t sub_21DB9ED48()
{
  uint64_t v2 = qword_267D1EA88;
  if (!qword_267D1EA88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EA80);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EA88);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DB9EDCC()
{
  uint64_t v2 = qword_267D1EA90;
  if (!qword_267D1EA90)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EA90);
    return WitnessTable;
  }
  return v2;
}

id sub_21DB9EE4C(id result, char a2)
{
  if (!a2) {
    return result;
  }
  if (a2 == 1) {
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

void sub_21DB9EEB0(void *a1, char a2)
{
  if (a2)
  {
    if (a2 == 1) {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
  }
}

void *sub_21DB9EF14(id *a1, void *a2)
{
  id v4 = *a1;
  id v2 = *a1;
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

unint64_t sub_21DB9EF4C()
{
  uint64_t v2 = qword_267D1EAC0;
  if (!qword_267D1EAC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_267D1EAB0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EAC0);
    return WitnessTable;
  }
  return v2;
}

void *sub_21DB9EFD0(const void *a1, void *a2)
{
  uint64_t v6 = sub_21DBAC5F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA8);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_21DB9F0F8(uint64_t a1)
{
  uint64_t v3 = sub_21DBAC5F8();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_21DB9F1A8(uint64_t a1)
{
  uint64_t v3 = sub_21DBAC858();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_21DB9F258()
{
  uint64_t v2 = *(void *)(sub_21DBAC708() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_21DB9F324()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9F364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_continuation_throwingResume();
}

uint64_t sub_21DB9F3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocError();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v4, a1);
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_21DB9F474(uint64_t result)
{
  uint64_t v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_21DBACBD8();
      uint64_t v1 = sub_21DBACE28();
      *(void *)(v1 + 16) = v4;
      uint64_t v3 = v1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
      swift_retain();
      uint64_t v3 = v2;
    }
    sub_21DBACBD8();
    return v3;
  }
  return result;
}

uint64_t sub_21DB9F554()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9F580()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9F5AC()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9F5EC()
{
  return swift_deallocObject();
}

unint64_t sub_21DB9F62C()
{
  uint64_t v2 = qword_267D1EAC8;
  if (!qword_267D1EAC8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EAC8);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_21DB9F694()
{
  uint64_t v2 = qword_267D1EAD8;
  if (!qword_267D1EAD8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EAD8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_21DB9F6FC(uint64_t a1)
{
  if ((*(void *)(a1 + 8) & 0xF000000000000000) != 0xF000000000000000) {
    sub_21DB9F750(*(void *)a1, *(void *)(a1 + 8));
  }
  return a1;
}

uint64_t sub_21DB9F750(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_release();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_21DB9F7DC(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_retain();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_21DB9F868(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000) {
    return sub_21DB9F750(result, a2);
  }
  return result;
}

uint64_t sub_21DB9F8B4(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000) {
    return sub_21DB9F7DC(result, a2);
  }
  return result;
}

void *sub_21DB9F900(const void *a1, void *a2)
{
  uint64_t v6 = sub_21DBAC858();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAA0);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_21DB9FA28()
{
  return swift_deallocObject();
}

void *sub_21DB9FA68()
{
  return sub_21DB7FA94(*(void **)(v0 + 16));
}

uint64_t sub_21DB9FA70()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9FAB0()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9FADC()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9FB08(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = a1;
  uint64_t v21 = a6;
  v13[1] = a7;
  uint64_t v14 = sub_21DBA3550;
  uint64_t v25 = a6;
  uint64_t v18 = *(void *)(a6 - 8);
  uint64_t v19 = a6 - 8;
  v13[0] = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v7 = MEMORY[0x270FA5388](a1);
  uint64_t v20 = (uint64_t)v13 - v13[0];
  v8(v7);
  uint64_t v16 = sub_21DBAD1A8() >> 3;
  uint64_t v23 = *v17;
  uint64_t v24 = v23 + v16;
  sub_21DB9FC98(v20, v14, (uint64_t)v22, v21, MEMORY[0x263F8E628], MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], v15);
  uint64_t v9 = v18;
  uint64_t v10 = v20;
  uint64_t v11 = v21;
  *v17 += v16;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t sub_21DB9FC70()
{
  return sub_21DBAD058();
}

uint64_t sub_21DB9FC98(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = a2;
  uint64_t v12 = a5;
  uint64_t v13 = a8;
  uint64_t v23 = a4;
  uint64_t v22 = a5;
  uint64_t v21 = a6;
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = a5 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v12 - v16;
  uint64_t v20 = v9 + *(void *)(*(void *)(v10 - 8) + 64);
  uint64_t result = v17();
  uint64_t v19 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v18, v12);
  }
  return result;
}

uint64_t sub_21DB9FDC8()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9FE08()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9FE48()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9FE74()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9FEA0()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9FEE0()
{
  return swift_deallocObject();
}

uint64_t sub_21DB9FF20()
{
  return swift_deallocObject();
}

uint64_t __swift_continuation_await_point()
{
  return MEMORY[0x270FA23F0]();
}

uint64_t sub_21DB9FF64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_21DBACB08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v10 = (int *)type metadata accessor for SFAirDropUtilities.FileLoadResult();
  uint64_t v3 = (void *)(a1 + v10[5]);
  uint64_t v6 = (void *)(a2 + v10[5]);
  *uint64_t v6 = *v3;
  uint64_t v7 = v3[1];
  swift_bridgeObjectRetain();
  v6[1] = v7;
  uint64_t v8 = v10[6];
  uint64_t v9 = *(void **)(a1 + v8);
  id v4 = v9;
  uint64_t result = a2;
  *(void *)(a2 + v8) = v9;
  *(unsigned char *)(a2 + v10[7]) = *(unsigned char *)(a1 + v10[7]);
  return result;
}

uint64_t sub_21DBA0068(uint64_t a1)
{
  uint64_t v1 = sub_21DBACB08();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  uint64_t v3 = type metadata accessor for SFAirDropUtilities.FileLoadResult();
  swift_bridgeObjectRelease();

  return a1;
}

__n128 sub_21DBA0100(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_21DBACB08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = (int *)type metadata accessor for SFAirDropUtilities.FileLoadResult();
  __n128 result = *(__n128 *)(a1 + v3[5]);
  *(__n128 *)(a2 + v3[5]) = result;
  *(void *)(a2 + v3[6]) = *(void *)(a1 + v3[6]);
  *(unsigned char *)(a2 + v3[7]) = *(unsigned char *)(a1 + v3[7]);
  return result;
}

unint64_t sub_21DBA01B4()
{
  uint64_t v2 = qword_267D1EB28;
  if (!qword_267D1EB28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EB20);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EB28);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21DBA0238(id *a1)
{
}

uint64_t sub_21DBA0264()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA02A4()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_21DB8D51C();
  return result;
}

uint64_t sub_21DBA02B0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA02F0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0330()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA035C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0388()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA03C8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0408()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0434()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0460()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA04A0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA04E0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA050C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0538()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0578()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA05B8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA05F8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0638()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0678()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA06A4()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA06D0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0710()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0750()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA077C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA07A8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA07E8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0828()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0868()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA08A8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA08D4()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0900()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0940()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0980()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA09AC()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA09D8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0A18()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0A58()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0A98()
{
  return sub_21DB91B64() & 1;
}

unint64_t sub_21DBA0AC8()
{
  uint64_t v2 = qword_267D1EB38;
  if (!qword_267D1EB38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EB20);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EB38);
    return WitnessTable;
  }
  return v2;
}

void *sub_21DBA0B4C(void *a1, void *a2)
{
  *a2 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  a2[1] = v4;
  return result;
}

uint64_t type metadata accessor for SFAirDropUtilities()
{
  return self;
}

void *sub_21DBA0BB4(const void *a1, void *a2)
{
  uint64_t v6 = sub_21DBAC708();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EAD0);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

unint64_t sub_21DBA0CDC()
{
  uint64_t v2 = qword_267D1EB50;
  if (!qword_267D1EB50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EB20);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EB50);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA0D60()
{
  uint64_t v2 = qword_267D1EB60;
  if (!qword_267D1EB60)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EB60);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_21DBA0DC8()
{
  uint64_t v2 = qword_267D1EB68;
  if (!qword_267D1EB68)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EB68);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_21DBA0E30()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0E70()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0E9C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0EC8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA0F08()
{
  return swift_deallocObject();
}

unint64_t sub_21DBA0F48()
{
  uint64_t v2 = qword_267D1EB70;
  if (!qword_267D1EB70)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EB70);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_21DBA0FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v8 = v2[2];
  uint64_t v9 = v2[3];
  uint64_t v10 = v2[4];
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_21DB6936C;
  return sub_21DB93A44(a1, a2, v8, v9, v10);
}

unint64_t sub_21DBA1090()
{
  uint64_t v2 = qword_267D1EB88;
  if (!qword_267D1EB88)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EB88);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_21DBA10F8()
{
  uint64_t v2 = qword_267D1EB90;
  if (!qword_267D1EB90)
  {
    sub_21DBAC858();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EB90);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA117C()
{
  uint64_t v2 = qword_267D1EBA8;
  if (!qword_267D1EBA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EBA0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EBA8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA1200()
{
  uint64_t v2 = qword_267D1EBB0;
  if (!qword_267D1EBB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EA80);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EBB0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DBA1284()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA12C4@<X0>(void *a1@<X8>)
{
  return sub_21DB93A10(*(void *)(v1 + 16), a1);
}

uint64_t sub_21DBA12CC()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA130C()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EBA0);
  unint64_t v1 = sub_21DBA136C();
  return sub_21DB6A2EC(v5, v3, v4, v1);
}

unint64_t sub_21DBA136C()
{
  uint64_t v2 = qword_267D1EBB8;
  if (!qword_267D1EBB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EBA0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EBB8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DBA13F0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA141C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA1448()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA1488()
{
  return swift_deallocObject();
}

unint64_t sub_21DBA14C8()
{
  uint64_t v2 = qword_267D1EBD0;
  if (!qword_267D1EBD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EBC8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EBD0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA154C()
{
  uint64_t v2 = qword_267D1EC00;
  if (!qword_267D1EC00)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EC00);
    return ObjCClassMetadata;
  }
  return v2;
}

void sub_21DBA15B4(uint64_t a1)
{
  sub_21DB9A138(a1, *(void *)(v1 + 16));
}

uint64_t sub_21DBA15BC(uint64_t a1)
{
  uint64_t v3 = sub_21DBACB08();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

unint64_t sub_21DBA166C()
{
  uint64_t v2 = qword_267D1EC20;
  if (!qword_267D1EC20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EC18);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EC20);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA16F0()
{
  uint64_t v2 = qword_267D1EC28;
  if (!qword_267D1EC28)
  {
    sub_21DBACAD8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EC28);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA1774()
{
  uint64_t v2 = qword_267D1EC30;
  if (!qword_267D1EC30)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EC30);
    return ObjCClassMetadata;
  }
  return v2;
}

void sub_21DBA17DC(uint64_t a1)
{
  sub_21DB99F04(a1, *(void *)(v1 + 16));
}

uint64_t sub_21DBA17E4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  double v8 = *(double *)(v2 + 16);
  double v9 = *(double *)(v2 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_21DB6936C;
  return sub_21DB99138(a1, a2, v8, v9);
}

unint64_t sub_21DBA18B8()
{
  uint64_t v2 = qword_267D1EC48;
  if (!qword_267D1EC48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EBF0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EC48);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA193C()
{
  uint64_t v2 = qword_267D1EC60;
  if (!qword_267D1EC60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EC58);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EC60);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA19C0()
{
  uint64_t v2 = qword_267D1EC70;
  if (!qword_267D1EC70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EC68);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EC70);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DBA1A44()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21DBA1A9C(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = *(void *)(v1 + 32);
  uint64_t v9 = *(void *)(v1 + 40);
  char v10 = *(unsigned char *)(v1 + 48);
  double v11 = *(double *)(v1 + 56);
  double v12 = *(double *)(v1 + 64);
  uint64_t v13 = *(void *)(v1 + 72);
  uint64_t v14 = *(void *)(v1 + 80);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_21DB6936C;
  return sub_21DB9B1A8(a1, v11, v12, v6, v7, v8, v9, v10 & 1, v13, v14);
}

unint64_t sub_21DBA1BE4()
{
  uint64_t v2 = qword_267D1ECA8;
  if (!qword_267D1ECA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1EB20);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1ECA8);
    return WitnessTable;
  }
  return v2;
}

void sub_21DBA1C68(uint64_t a1)
{
  sub_21DB9DC54(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t method lookup function for SFAirDropUtilities()
{
  return swift_lookUpClassMethod();
}

unint64_t initializeBufferWithCopyOfBuffer for SFAirDropUtilities.FileLoadResult(void *a1, void *a2, int *a3)
{
  int v16 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v16 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    swift_retain();
    *a1 = v11;
    return *a1 + ((v16 + 16) & ~(unint64_t)v16);
  }
  else
  {
    uint64_t v3 = sub_21DBACB08();
    (*(void (**)(void *, void *))(*(void *)(v3 - 8) + 16))(a1, a2);
    uint64_t v4 = a3[5];
    uint64_t v7 = (char *)a1 + v4;
    *(void *)((char *)a1 + v4) = *(void *)((char *)a2 + v4);
    uint64_t v8 = *(void *)((char *)a2 + v4 + 8);
    swift_bridgeObjectRetain();
    *((void *)v7 + 1) = v8;
    uint64_t v9 = a3[6];
    char v10 = *(void **)((char *)a2 + v9);
    id v5 = v10;
    *(void *)((char *)a1 + v9) = v10;
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    return (unint64_t)a1;
  }
}

void destroy for SFAirDropUtilities.FileLoadResult(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_21DBACB08();
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SFAirDropUtilities.FileLoadResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_21DBACB08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, a2);
  uint64_t v4 = (void *)(a2 + a3[5]);
  uint64_t v7 = (void *)(a1 + a3[5]);
  *uint64_t v7 = *v4;
  uint64_t v8 = v4[1];
  swift_bridgeObjectRetain();
  v7[1] = v8;
  uint64_t v9 = a3[6];
  char v10 = *(void **)(a2 + v9);
  id v5 = v10;
  uint64_t result = a1;
  *(void *)(a1 + v9) = v10;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return result;
}

uint64_t assignWithCopy for SFAirDropUtilities.FileLoadResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_21DBACB08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 24))(a1, a2);
  uint64_t v4 = (void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + a3[5]);
  *uint64_t v8 = *v4;
  uint64_t v9 = v4[1];
  swift_bridgeObjectRetain();
  v8[1] = v9;
  swift_bridgeObjectRelease();
  uint64_t v5 = a3[6];
  char v10 = (void *)(a1 + v5);
  id v12 = *(id *)(a1 + v5);
  uint64_t v11 = *(void **)(a2 + v5);
  id v6 = v11;
  *char v10 = v11;

  uint64_t result = a1;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]) & 1;
  return result;
}

__n128 initializeWithTake for SFAirDropUtilities.FileLoadResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_21DBACB08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(a1, a2);
  __n128 result = *(__n128 *)(a2 + a3[5]);
  *(__n128 *)(a1 + a3[5]) = result;
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return result;
}

uint64_t assignWithTake for SFAirDropUtilities.FileLoadResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_21DBACB08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(a1, a2);
  uint64_t v4 = (void *)(a2 + a3[5]);
  uint64_t v5 = (void *)(a1 + a3[5]);
  *uint64_t v5 = *v4;
  v5[1] = v4[1];
  swift_bridgeObjectRelease();
  id v6 = (void **)(a1 + a3[6]);
  uint64_t v7 = *v6;
  *id v6 = *(void **)(a2 + a3[6]);

  uint64_t result = a1;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]) & 1;
  return result;
}

uint64_t getEnumTagSinglePayload for SFAirDropUtilities.FileLoadResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21DBA2270(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = sub_21DBACB08();
  if (a2 == *(_DWORD *)(*(void *)(v9 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    int v4 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 20) + 8) < 0x100000000uLL) {
      int v4 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    }
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for SFAirDropUtilities.FileLoadResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21DBA23C0(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_21DBACB08();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  if (a3 == 0x7FFFFFFF) {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2 - 1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DBA24BC()
{
  uint64_t v2 = sub_21DBACB08();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t initializeBufferWithCopyOfBuffer for SFAirDropUtilities.FileLoadError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_21DB9EE4C(*(id *)a2, v4);
  uint64_t result = a1;
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

void destroy for SFAirDropUtilities.FileLoadError(uint64_t a1)
{
}

uint64_t assignWithCopy for SFAirDropUtilities.FileLoadError(uint64_t a1, uint64_t a2)
{
  id v5 = *(id *)a2;
  char v6 = *(unsigned char *)(a2 + 8);
  sub_21DB9EE4C(*(id *)a2, v6);
  uint64_t v2 = *(void **)a1;
  char v3 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v6;
  sub_21DB9EEB0(v2, v3);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t a2)
{
  *(void *)uint64_t result = *(void *)a2;
  *(unsigned char *)(result + 8) = *(unsigned char *)(a2 + 8);
  return result;
}

uint64_t assignWithTake for SFAirDropUtilities.FileLoadError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  id v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_21DB9EEB0(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SFAirDropUtilities.FileLoadError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0xFD && *(unsigned char *)(a1 + 9))
    {
      int v4 = *(void *)a1 + 253;
    }
    else
    {
      unsigned int v2 = 255 - *(unsigned __int8 *)(a1 + 8);
      if (v2 >= 0xFD) {
        unsigned int v2 = -1;
      }
      int v4 = v2;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SFAirDropUtilities.FileLoadError(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = result;
  int v4 = (unsigned char *)(result + 9);
  if (a2 > 0xFD)
  {
    uint64_t result = 0;
    *(unsigned char *)(v3 + 8) = 0;
    *(void *)uint64_t v3 = a2 - 254;
    if (a3 >= 0xFE) {
      *int v4 = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *int v4 = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_21DBA29CC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) < 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return *(void *)a1 + 2;
  }
}

uint64_t sub_21DBA29F0(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(unsigned char *)(result + 8) = a2;
  }
  else
  {
    *(void *)uint64_t result = a2 - 2;
    *(unsigned char *)(result + 8) = 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SFAirDropUtilities.FileLoadError()
{
  return &type metadata for SFAirDropUtilities.FileLoadError;
}

unint64_t sub_21DBA2A58()
{
  uint64_t v2 = qword_267D1ECC8;
  if (!qword_267D1ECC8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1ECC8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_21DBA2AC0()
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  return swift_deallocObject();
}

void sub_21DBA2BB4()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0) - 8);
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (uint64_t)v0 + ((*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  sub_21DB9E034(v2, v3, v4, v5);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_21DBA2C90()
{
  uint64_t v2 = qword_267D1ECD8;
  if (!qword_267D1ECD8)
  {
    sub_21DBACBD8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1ECD8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA2D0C()
{
  uint64_t v2 = qword_267D1ECE8;
  if (!qword_267D1ECE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D1ECE0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1ECE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA2D90()
{
  uint64_t v2 = qword_267D1ECF0;
  if (!qword_267D1ECF0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1ECF0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_21DBA2DF8()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0) - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21DBA2EEC(void *a1, char a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
  sub_21DB9E418(a1, a2 & 1, a3);
}

uint64_t block_copy_helper_281(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_282()
{
  return swift_release();
}

unint64_t sub_21DBA3018()
{
  uint64_t v2 = qword_267D1EE30;
  if (!qword_267D1EE30)
  {
    sub_21DBACB58();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EE30);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DBA309C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA30C8()
{
  return nullsub_1(*(void *)(v0 + 16));
}

uint64_t sub_21DBA30D0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3110()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3150()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA317C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA31A8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_21DBA31E4()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3224@<X0>(uint64_t *a1@<X8>)
{
  return sub_21DBA31A8(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_21DBA3230()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3270(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = sub_21DBA32E4();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  return sub_21DB9FB08(a1, a2, a3, v9, v10, v5, v4);
}

unint64_t sub_21DBA32E4()
{
  uint64_t v2 = qword_267D1ED00;
  if (!qword_267D1ED00)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1ED00);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DBA3360()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA338C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA33B8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA33F8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3438()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3464()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3490()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA34D0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3510()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3550()
{
  return sub_21DB9FC70();
}

void sub_21DBA3580(uint64_t a1)
{
  sub_21DB99A40(a1, *(void *)(v1 + 16));
}

uint64_t sub_21DBA3588()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0) - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

void sub_21DBA3658(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0);
  sub_21DB99C74(a1, a2);
}

uint64_t block_copy_helper_350(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_351()
{
  return swift_release();
}

uint64_t sub_21DBA3744()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1ECD0) - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t block_copy_helper_356(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_357()
{
  return swift_release();
}

uint64_t sub_21DBA3878()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D1ED08) - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_21DBA3948(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ED08);
  return sub_21DB9A414(a1);
}

uint64_t block_copy_helper_362(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_363()
{
  return swift_release();
}

unint64_t sub_21DBA3A2C()
{
  uint64_t v2 = qword_267D1ED10;
  if (!qword_267D1ED10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1ED10);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DBA3AA8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3AE8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3B28()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3B54()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3B80()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3BC0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3C00()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3C2C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3C58()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3C98()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA3CD8()
{
  return swift_deallocObject();
}

id sub_21DBA3D18()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_21DBA3D40()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for SFUIShareSheetRemoteSettingsHelperSwift();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

uint64_t type metadata accessor for SFUIShareSheetRemoteSettingsHelperSwift()
{
  return self;
}

uint64_t static SFUIShareSheetRemoteSettingsHelperSwift.updateHostingController(hostingController:context:hostProcessType:hostPresentationStyle:optionGroups:collaborationOptionsData:cloudShareRequest:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v32 = a1;
  id v36 = a2;
  uint64_t v37 = a3;
  uint64_t v38 = a4;
  uint64_t v39 = a5;
  id v40 = a6;
  id v41 = a7;
  uint64_t v8 = v7;
  uint64_t v9 = v32;
  uint64_t v46 = v8;
  uint64_t v33 = MEMORY[0x270FCA7D0];
  id v34 = sub_21DBA453C;
  uint64_t v60 = 0;
  uint64_t v59 = 0;
  uint64_t v58 = 0;
  uint64_t v57 = 0;
  uint64_t v56 = 0;
  uint64_t v55 = 0;
  uint64_t v54 = 0;
  uint64_t v53 = 0;
  uint64_t v52 = 0;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AA526C8);
  unint64_t v35 = (*(void *)(*(void *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint64_t v50 = (uint64_t)v30 - v35;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AA526C0);
  uint64_t v48 = *(void *)(v51 - 8);
  uint64_t v49 = v51 - 8;
  uint64_t v43 = *(void *)(v48 + 64);
  unint64_t v42 = (v43 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v51);
  id v44 = (char *)v30 - v42;
  unint64_t v45 = (v43 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v30 - v42);
  uint64_t v47 = (char *)v30 - v45;
  uint64_t v60 = (char *)v30 - v45;
  uint64_t v59 = v9;
  uint64_t v58 = v11;
  uint64_t v57 = v12;
  uint64_t v56 = v13;
  uint64_t v55 = v14;
  uint64_t v54 = v15;
  uint64_t v53 = v16;
  uint64_t v52 = v46;
  sub_21DBACFE8();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v50, 1, v51) == 1) {
    return sub_21DBA41D4(v50);
  }
  uint64_t v17 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v47, v50, v51);
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v44, v17, v51);
  id v18 = v36;
  swift_bridgeObjectRetain();
  id v19 = v40;
  id v20 = v41;
  v30[2] = v30;
  MEMORY[0x270FA5388](v30[0]);
  uint64_t v21 = v39;
  id v22 = v40;
  uint64_t v23 = &v30[-10];
  v30[1] = &v30[-10];
  v23[2] = v24;
  float v23[3] = v25;
  v23[4] = v26;
  void v23[5] = v27;
  v23[6] = v21;
  v23[7] = v22;
  v23[8] = v28;
  swift_getOpaqueTypeConformance2();
  sub_21DBAC8B8();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v48 + 8);
  v30[3] = v48 + 8;
  v31(v44, v51);

  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v31)(v47, v51);
}

uint64_t sub_21DBA41D4(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AA526C0);
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_21DBA4288(int a1, id a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v7 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AA526C0);
  swift_getOpaqueTypeConformance2();
  sub_21DBA7784();
  sub_21DBA77EC();
  sub_21DBAC8E8();
  sub_21DB69C80();
  sub_21DBA786C();
  sub_21DBAC8C8();
  sub_21DBA78EC();
  sub_21DBAC8C8();
  type metadata accessor for SHSheetOptionGroups();
  swift_bridgeObjectRetain();
  SHSheetOptionGroups.__allocating_init(groups:)(a5);
  sub_21DBA796C();
  sub_21DBAC8D8();
  type metadata accessor for SHSheetCollaborationOptions();
  id v8 = a6;
  SHSheetCollaborationOptions.__allocating_init(shareOptionsData:)(a6);
  sub_21DBA79EC();
  sub_21DBAC8E8();
  type metadata accessor for SHSheetCloudSharingRequest();
  id v9 = a7;
  SHSheetCloudSharingRequest.__allocating_init(request:)(a7);
  sub_21DBA7A6C();
  return sub_21DBAC8E8();
}

uint64_t sub_21DBA453C()
{
  return sub_21DBA4288(*(void *)(v0 + 16), *(id *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void **)(v0 + 56), *(void **)(v0 + 64));
}

id SHSheetOptionGroups.__allocating_init(groups:)(uint64_t a1)
{
  id v2 = objc_allocWithZone(v1);
  return SHSheetOptionGroups.init(groups:)(a1);
}

id SHSheetCollaborationOptions.__allocating_init(shareOptionsData:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return SHSheetCollaborationOptions.init(shareOptionsData:)(a1);
}

id SHSheetCloudSharingRequest.__allocating_init(request:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return SHSheetCloudSharingRequest.init(request:)(a1);
}

id SFUIShareSheetRemoteSettingsHelperSwift.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFUIShareSheetRemoteSettingsHelperSwift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_21DBA4790()
{
  return &unk_21DBB2E60;
}

uint64_t static SHSheetRemoteSetting.ClientContext.defaultValue.getter()
{
  return 0;
}

uint64_t sub_21DBA47A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static SHSheetRemoteSetting.ClientContext.defaultValue.getter();
  *a1 = result;
  return result;
}

void *sub_21DBA47D0()
{
  return &unk_21DBB2E68;
}

uint64_t static SHSheetRemoteSetting.HostProcessType.defaultValue.getter()
{
  return 0;
}

uint64_t sub_21DBA47E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static SHSheetRemoteSetting.HostProcessType.defaultValue.getter();
  *a1 = result;
  return result;
}

void *sub_21DBA4810()
{
  return &unk_21DBB2E70;
}

uint64_t static SHSheetRemoteSetting.HostPresentationStyle.defaultValue.getter()
{
  return 0;
}

uint64_t sub_21DBA4824@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static SHSheetRemoteSetting.HostPresentationStyle.defaultValue.getter();
  *a1 = result;
  return result;
}

id sub_21DBA4850()
{
  type metadata accessor for SHSheetOptionGroups();
  id result = SHSheetOptionGroups.__allocating_init(groups:)(0);
  qword_26AA52650 = (uint64_t)result;
  return result;
}

uint64_t *sub_21DBA4894()
{
  if (qword_26AA52660 != -1) {
    swift_once();
  }
  return &qword_26AA52650;
}

void *static SHSheetRemoteSetting.OptionGroups.defaultValue.getter()
{
  objc_super v2 = (void *)*sub_21DBA4894();
  id v0 = v2;
  return v2;
}

void *sub_21DBA4928@<X0>(void *a1@<X8>)
{
  id result = static SHSheetRemoteSetting.OptionGroups.defaultValue.getter();
  *a1 = result;
  return result;
}

void *sub_21DBA4954()
{
  return &unk_21DBB2E78;
}

uint64_t static SHSheetRemoteSetting.CollaborationOptions.defaultValue.getter()
{
  return 0;
}

uint64_t sub_21DBA4968@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static SHSheetRemoteSetting.CollaborationOptions.defaultValue.getter();
  *a1 = result;
  return result;
}

void *sub_21DBA4994()
{
  return &unk_21DBB2E80;
}

uint64_t static SHSheetRemoteSetting.CloudShareRequest.defaultValue.getter()
{
  return 0;
}

uint64_t sub_21DBA49A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static SHSheetRemoteSetting.CloudShareRequest.defaultValue.getter();
  *a1 = result;
  return result;
}

void *SHSheetCollaborationOptions.shareOptionsData.getter()
{
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC9SharingUI27SHSheetCollaborationOptions_shareOptionsData);
  id v1 = v3;
  return v3;
}

id SHSheetCollaborationOptions.init(shareOptionsData:)(void *a1)
{
  uint64_t v12 = 0;
  uint64_t v13 = a1;
  id v2 = v1;
  id v14 = v1;
  id v3 = a1;
  if (a1)
  {
    uint64_t v12 = a1;
    id v4 = a1;
    *(void *)&v9[OBJC_IVAR____TtC9SharingUI27SHSheetCollaborationOptions_shareOptionsData] = a1;

    v11.receiver = v14;
    v11.super_class = (Class)type metadata accessor for SHSheetCollaborationOptions();
    id v7 = objc_msgSendSuper2(&v11, sel_init);
    id v5 = v7;
    id v14 = v7;

    return v7;
  }
  else
  {

    type metadata accessor for SHSheetCollaborationOptions();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

void sub_21DBA4B58(void *a1)
{
  swift_getObjectType();
  char v6 = *(void **)(v1 + OBJC_IVAR____TtC9SharingUI27SHSheetCollaborationOptions_shareOptionsData);
  id v2 = v6;
  if (v6) {
    id v4 = v6;
  }
  else {
    id v4 = 0;
  }
  sub_21DBACD38();
  id v3 = (id)sub_21DBACCC8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_encodeObject_forKey_, v4, v3);
}

id SHSheetCollaborationOptions.__allocating_init(bsxpcCoder:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return SHSheetCollaborationOptions.init(bsxpcCoder:)(a1);
}

id SHSheetCollaborationOptions.init(bsxpcCoder:)(void *a1)
{
  id v20 = 0;
  uint64_t v26 = a1;
  id v2 = v1;
  id v27 = v1;
  swift_getObjectType();
  sub_21DBA5B0C();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_21DBACD38();
  id v15 = (id)sub_21DBACCC8();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(a1, sel_decodeObjectOfClass_forKey_, ObjCClassFromMetadata, v15);

  if (v16)
  {
    sub_21DBAD078();
    sub_21DBA5C1C((uint64_t)v17, (uint64_t)&v21);
    swift_unknownObjectRelease();
  }
  else
  {
    long long v21 = 0uLL;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
  }
  sub_21DBA5B74(&v21, &v24);
  if (v25)
  {
    if (swift_dynamicCast()) {
      uint64_t v10 = v18;
    }
    else {
      uint64_t v10 = 0;
    }
    objc_super v11 = v10;
  }
  else
  {
    sub_21DBA5BD8((uint64_t)&v24);
    objc_super v11 = 0;
  }
  if (v11)
  {
    id v20 = v11;
    id v3 = v11;
    *(void *)&v12[OBJC_IVAR____TtC9SharingUI27SHSheetCollaborationOptions_shareOptionsData] = v11;

    id v7 = v27;
    id v4 = (objc_class *)type metadata accessor for SHSheetCollaborationOptions();
    v19.receiver = v7;
    v19.super_class = v4;
    id v8 = objc_msgSendSuper2(&v19, sel_init);
    id v5 = v8;
    id v27 = v8;
    swift_unknownObjectRelease();

    return v8;
  }
  else
  {

    swift_unknownObjectRelease();
    type metadata accessor for SHSheetCollaborationOptions();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

uint64_t static SHSheetCollaborationOptions.supportsBSXPCSecureCoding()()
{
  return 1;
}

id SHSheetCollaborationOptions.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SHSheetCollaborationOptions.init()()
{
  if (!"SharingUI.SHSheetCollaborationOptions")
  {
    sub_21DBAD1B8();
    __break(1u);
  }
  uint64_t result = sub_21DBA65F8((uint64_t)"SharingUI.SHSheetCollaborationOptions", 37, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/SFUIShareSheetRemoteSettingsHelperSwift.swift", 55, 2, v1, 0x56uLL, 0xEuLL);
  __break(1u);
  return result;
}

id SHSheetCollaborationOptions.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SHSheetCollaborationOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t SHSheetOptionGroups.groups.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC9SharingUI19SHSheetOptionGroups_groups);
  swift_bridgeObjectRetain();
  return v2;
}

id SHSheetOptionGroups.init(groups:)(uint64_t a1)
{
  uint64_t v9 = a1;
  id v2 = v1;
  id v10 = v1;
  swift_bridgeObjectRetain();
  *(void *)&v5[OBJC_IVAR____TtC9SharingUI19SHSheetOptionGroups_groups] = a1;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for SHSheetOptionGroups();
  id v7 = objc_msgSendSuper2(&v8, sel_init);
  id v3 = v7;
  id v10 = v7;
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t sub_21DBA52FC(void *a1)
{
  swift_getObjectType();
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC9SharingUI19SHSheetOptionGroups_groups);
  swift_bridgeObjectRetain();
  if (v8)
  {
    sub_21DBA5A54();
    uint64_t v5 = sub_21DBACDE8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6) {
    uint64_t v4 = v6;
  }
  else {
    uint64_t v4 = 0;
  }
  sub_21DBACD38();
  id v3 = (id)sub_21DBACCC8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_encodeCollection_forKey_, v4, v3);

  return swift_unknownObjectRelease();
}

id SHSheetOptionGroups.__allocating_init(bsxpcCoder:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return SHSheetOptionGroups.init(bsxpcCoder:)(a1);
}

id SHSheetOptionGroups.init(bsxpcCoder:)(void *a1)
{
  uint64_t v19 = 0;
  id v20 = a1;
  id v2 = v1;
  id v21 = v1;
  swift_getObjectType();
  sub_21DBA69F8();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_21DBA5A54();
  uint64_t v14 = swift_getObjCClassFromMetadata();
  sub_21DBACD38();
  id v15 = (void *)sub_21DBACCC8();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(a1, sel_decodeCollectionOfClass_containingClass_forKey_, ObjCClassFromMetadata, v14, v15);

  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ED40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1ED48);
    char v3 = swift_dynamicCast();
    if (v3) {
      uint64_t v9 = v17;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v19 = v10;
  swift_bridgeObjectRetain();
  *(void *)&v11[OBJC_IVAR____TtC9SharingUI19SHSheetOptionGroups_groups] = v10;

  swift_bridgeObjectRelease();
  id v7 = v21;
  uint64_t v4 = (objc_class *)type metadata accessor for SHSheetOptionGroups();
  v18.receiver = v7;
  v18.super_class = v4;
  id v8 = objc_msgSendSuper2(&v18, sel_init);
  id v5 = v8;
  id v21 = v8;
  swift_unknownObjectRelease();

  return v8;
}

uint64_t static SHSheetOptionGroups.supportsBSXPCSecureCoding()()
{
  return 1;
}

id SHSheetOptionGroups.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SHSheetOptionGroups.init()()
{
  if (!"SharingUI.SHSheetOptionGroups")
  {
    sub_21DBAD1B8();
    __break(1u);
  }
  uint64_t result = sub_21DBA65F8((uint64_t)"SharingUI.SHSheetOptionGroups", 29, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/SFUIShareSheetRemoteSettingsHelperSwift.swift", 55, 2, v1, 0x72uLL, 0xEuLL);
  __break(1u);
  return result;
}

id SHSheetOptionGroups.__deallocating_deinit()
{
  char v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SHSheetOptionGroups();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *SHSheetCloudSharingRequest.request.getter()
{
  char v3 = *(void **)(v0 + OBJC_IVAR____TtC9SharingUI26SHSheetCloudSharingRequest_request);
  id v1 = v3;
  return v3;
}

id SHSheetCloudSharingRequest.init(request:)(void *a1)
{
  uint64_t v10 = a1;
  id v2 = v1;
  id v11 = v1;
  id v3 = a1;
  *(void *)&v6[OBJC_IVAR____TtC9SharingUI26SHSheetCloudSharingRequest_request] = a1;

  v9.receiver = v11;
  v9.super_class = (Class)type metadata accessor for SHSheetCloudSharingRequest();
  id v8 = objc_msgSendSuper2(&v9, sel_init);
  id v4 = v8;
  id v11 = v8;

  return v8;
}

unint64_t sub_21DBA5A54()
{
  uint64_t v2 = qword_267D1DAB8;
  if (!qword_267D1DAB8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1DAB8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for SHSheetOptionGroups()
{
  return self;
}

uint64_t type metadata accessor for SHSheetCollaborationOptions()
{
  return self;
}

unint64_t sub_21DBA5B0C()
{
  uint64_t v2 = qword_267D1DA98;
  if (!qword_267D1DA98)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1DA98);
    return ObjCClassMetadata;
  }
  return v2;
}

_OWORD *sub_21DBA5B74(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  a2[1] = a1[1];
  return a2;
}

uint64_t sub_21DBA5BD8(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

__n128 sub_21DBA5C1C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

void sub_21DBA5C38(void *a1)
{
  swift_getObjectType();
  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC9SharingUI26SHSheetCloudSharingRequest_request);
  id v2 = v6;
  if (v6) {
    id v4 = v6;
  }
  else {
    id v4 = 0;
  }
  sub_21DBACD38();
  id v3 = (id)sub_21DBACCC8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_encodeObject_forKey_, v4, v3);
}

id SHSheetCloudSharingRequest.__allocating_init(bsxpcCoder:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return SHSheetCloudSharingRequest.init(bsxpcCoder:)(a1);
}

id SHSheetCloudSharingRequest.init(bsxpcCoder:)(void *a1)
{
  id v19 = 0;
  uint64_t v25 = a1;
  id v2 = v1;
  id v26 = v1;
  swift_getObjectType();
  sub_21DBA6A88();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_21DBACD38();
  id v14 = (id)sub_21DBACCC8();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(a1, sel_decodeObjectOfClass_forKey_, ObjCClassFromMetadata, v14);

  if (v15)
  {
    sub_21DBAD078();
    sub_21DBA5C1C((uint64_t)v16, (uint64_t)&v20);
    swift_unknownObjectRelease();
  }
  else
  {
    long long v20 = 0uLL;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }
  sub_21DBA5B74(&v20, &v23);
  if (v24)
  {
    if (swift_dynamicCast()) {
      objc_super v9 = v17;
    }
    else {
      objc_super v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    sub_21DBA5BD8((uint64_t)&v23);
    id v10 = 0;
  }
  id v19 = v10;
  id v3 = v10;
  *(void *)&v11[OBJC_IVAR____TtC9SharingUI26SHSheetCloudSharingRequest_request] = v10;

  id v7 = v26;
  id v4 = (objc_class *)type metadata accessor for SHSheetCloudSharingRequest();
  v18.receiver = v7;
  v18.super_class = v4;
  id v8 = objc_msgSendSuper2(&v18, sel_init);
  id v5 = v8;
  id v26 = v8;
  swift_unknownObjectRelease();

  return v8;
}

uint64_t static SHSheetCloudSharingRequest.supportsBSXPCSecureCoding()()
{
  return 1;
}

id SHSheetCloudSharingRequest.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SHSheetCloudSharingRequest.init()()
{
  if (!"SharingUI.SHSheetCloudSharingRequest")
  {
    sub_21DBAD1B8();
    __break(1u);
  }
  uint64_t result = sub_21DBA65F8((uint64_t)"SharingUI.SHSheetCloudSharingRequest", 36, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/SFUIShareSheetRemoteSettingsHelperSwift.swift", 55, 2, v1, 0x8BuLL, 0xEuLL);
  __break(1u);
  return result;
}

id SHSheetCloudSharingRequest.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SHSheetCloudSharingRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21DBA6274(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_21DBA62AC(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF) {
      goto LABEL_12;
    }
    unsigned int v5 = (a3 + 1);
  }
  else
  {
    int v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      unsigned int v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      int v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL) {
        unsigned int v5 = (v6 | (a3 >> 12)) + 8487393;
      }
      else {
        unsigned int v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
      }
    }
  }
  uint64_t v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  uint64_t v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0) {
    return a1(&v8, v4);
  }
  sub_21DBAD208();
  __break(1u);
LABEL_12:
  uint64_t result = sub_21DBAD1B8();
  __break(1u);
  return result;
}

uint64_t sub_21DBA65F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  unint64_t v26 = a6;
  uint64_t v27 = a7;
  int v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = a11;
  uint64_t v31 = sub_21DBA71AC;
  uint64_t v32 = sub_21DBA71F0;
  uint64_t v33 = "Fatal error";
  id v34 = "Unexpectedly found nil while unwrapping an Optional value";
  unint64_t v35 = "Swift/StaticString.swift";
  id v36 = "Not enough bits to represent the passed value";
  uint64_t v37 = "Swift/Integers.swift";
  uint64_t v38 = "UnsafeBufferPointer with negative count";
  uint64_t v39 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v40 = 0;
  unint64_t v42 = a6;
  uint64_t v43 = a7;
  char v44 = a8;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  unint64_t v47 = a10;
  unint64_t v48 = a11;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        id v19 = &v18;
        id v11 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x270FA5388](v32);
        id v16 = v31;
        uint64_t v17 = &v41;
        sub_21DBA62AC(v11, (uint64_t)v14, v12);
        return (uint64_t)v19;
      }
      v14[0] = 2;
      uint64_t v15 = 148;
      LODWORD(v16) = 0;
      sub_21DBAD1B8();
      __break(1u);
    }
    v14[0] = 2;
    uint64_t v15 = 3455;
    LODWORD(v16) = 0;
    sub_21DBAD1B8();
    __break(1u);
  }
  if (v24) {
    uint64_t v49 = v24;
  }
  else {
    uint64_t v49 = 0;
  }
  uint64_t v18 = v49;
  if (!v49)
  {
    v14[0] = 2;
    uint64_t v15 = 136;
    LODWORD(v16) = 0;
    sub_21DBAD1B8();
    __break(1u);
  }
  if (v25 >= 0) {
    return sub_21DBA6DD4(v18, v25, v26, v27, v28, v22, v23, v29, v21, v30);
  }
  uint64_t result = sub_21DBAD208();
  __break(1u);
  return result;
}

unint64_t sub_21DBA69F8()
{
  uint64_t v2 = qword_267D1DAA8;
  if (!qword_267D1DAA8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1DAA8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for SHSheetCloudSharingRequest()
{
  return self;
}

unint64_t sub_21DBA6A88()
{
  uint64_t v2 = qword_267D1DAC8;
  if (!qword_267D1DAC8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1DAC8);
    return ObjCClassMetadata;
  }
  return v2;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting()
{
  return &type metadata for SHSheetRemoteSetting;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.ClientContext()
{
  return &type metadata for SHSheetRemoteSetting.ClientContext;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.HostProcessType()
{
  return &type metadata for SHSheetRemoteSetting.HostProcessType;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle()
{
  return &type metadata for SHSheetRemoteSetting.HostPresentationStyle;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.OptionGroups()
{
  return &type metadata for SHSheetRemoteSetting.OptionGroups;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.CollaborationOptions()
{
  return &type metadata for SHSheetRemoteSetting.CollaborationOptions;
}

ValueMetadata *type metadata accessor for SHSheetRemoteSetting.CloudShareRequest()
{
  return &type metadata for SHSheetRemoteSetting.CloudShareRequest;
}

uint64_t method lookup function for SHSheetCollaborationOptions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SHSheetCollaborationOptions.__allocating_init(shareOptionsData:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SHSheetCollaborationOptions.encode(withBSXPCCoder:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x60))();
}

uint64_t dispatch thunk of SHSheetCollaborationOptions.__allocating_init(bsxpcCoder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for SHSheetOptionGroups()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SHSheetOptionGroups.__allocating_init(groups:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SHSheetOptionGroups.encode(withBSXPCCoder:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x60))();
}

uint64_t dispatch thunk of SHSheetOptionGroups.__allocating_init(bsxpcCoder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for SHSheetCloudSharingRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SHSheetCloudSharingRequest.__allocating_init(request:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SHSheetCloudSharingRequest.encode(withBSXPCCoder:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x60))();
}

uint64_t dispatch thunk of SHSheetCloudSharingRequest.__allocating_init(bsxpcCoder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_21DBA6DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a6;
  uint64_t v27 = a7;
  unint64_t v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = sub_21DBA7768;
  uint64_t v31 = sub_21DBA71F0;
  uint64_t v32 = "Fatal error";
  uint64_t v33 = "Unexpectedly found nil while unwrapping an Optional value";
  id v34 = "Swift/StaticString.swift";
  unint64_t v35 = "Not enough bits to represent the passed value";
  id v36 = "Swift/Integers.swift";
  uint64_t v37 = "UnsafeBufferPointer with negative count";
  uint64_t v38 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v39 = 0;
  uint64_t v41 = a6;
  uint64_t v42 = a7;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  unint64_t v45 = a8;
  unint64_t v46 = a10;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        id v19 = &v17;
        id v10 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x270FA5388](v31);
        uint64_t v15 = v30;
        id v16 = &v40;
        sub_21DBA62AC(v10, (uint64_t)v13, v11);
        return (uint64_t)v19;
      }
      v13[0] = 2;
      uint64_t v14 = 148;
      LODWORD(v15) = 0;
      sub_21DBAD1B8();
      __break(1u);
    }
    v13[0] = 2;
    uint64_t v14 = 3455;
    LODWORD(v15) = 0;
    sub_21DBAD1B8();
    __break(1u);
  }
  if (v24) {
    uint64_t v47 = v24;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v18 = v47;
  if (!v47)
  {
    v13[0] = 2;
    uint64_t v14 = 136;
    LODWORD(v15) = 0;
    sub_21DBAD1B8();
    __break(1u);
  }
  if (v25 >= 0) {
    return sub_21DBA721C(v18, v25, v26, v27, v22, v23, v28, v29);
  }
  uint64_t result = sub_21DBAD208();
  __break(1u);
  return result;
}

uint64_t sub_21DBA71AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_21DBA6DD4(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), a3, *(void *)(v3 + 64));
}

uint64_t sub_21DBA71F0(uint64_t a1, uint64_t a2)
{
  return sub_21DBA6274(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_21DBA721C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  if (!a3)
  {
    sub_21DBAD1B8();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        sub_21DBAD1B8();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            sub_21DBAD1B8();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF) {
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                }
                sub_21DBAD1B8();
                __break(1u);
              }
              sub_21DBAD1B8();
              __break(1u);
            }
            sub_21DBAD1B8();
            __break(1u);
          }
          sub_21DBAD1B8();
          __break(1u);
        }
        sub_21DBAD1B8();
        __break(1u);
      }
      sub_21DBAD1B8();
      __break(1u);
    }
    sub_21DBAD1B8();
    __break(1u);
  }
  uint64_t result = sub_21DBAD1B8();
  __break(1u);
  return result;
}

uint64_t sub_21DBA7768(uint64_t a1, uint64_t a2)
{
  return sub_21DBA721C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

unint64_t sub_21DBA7784()
{
  uint64_t v2 = qword_26AA526D0;
  if (!qword_26AA526D0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_26AA526D0);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_21DBA77EC()
{
  uint64_t v2 = qword_26AA52678;
  if (!qword_26AA52678)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26AA52678);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA786C()
{
  uint64_t v2 = qword_26AA526B0;
  if (!qword_26AA526B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26AA526B0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA78EC()
{
  uint64_t v2 = qword_26AA52688;
  if (!qword_26AA52688)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26AA52688);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA796C()
{
  uint64_t v2 = qword_26AA52670;
  if (!qword_26AA52670)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26AA52670);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA79EC()
{
  uint64_t v2 = qword_26AA526A8;
  if (!qword_26AA526A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_26AA526A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBA7A6C()
{
  uint64_t v2 = qword_26AA52690[0];
  if (!qword_26AA52690[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_26AA52690);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_21DBA7AEC()
{
  sub_21DBA7B44();
  uint64_t result = sub_21DBAD008();
  qword_267D1EDC0 = result;
  return result;
}

unint64_t sub_21DBA7B44()
{
  uint64_t v2 = qword_267D1EDD0;
  if (!qword_267D1EDD0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EDD0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t *sub_21DBA7BAC()
{
  if (qword_267D1E3E8 != -1) {
    swift_once();
  }
  return &qword_267D1EDC0;
}

uint64_t sub_21DBA7C10()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EDD8);
  uint64_t v6 = sub_21DBAD308();
  unsigned int v5 = v0;
  objc_super v9 = (void *)*MEMORY[0x263EFDFF8];
  id v1 = (id)*MEMORY[0x263EFDFF8];
  sub_21DBACCD8();
  *unsigned int v5 = sub_21DBACCC8();
  uint64_t v8 = (void *)*MEMORY[0x263EFDFF0];
  id v2 = (id)*MEMORY[0x263EFDFF0];
  sub_21DBACCD8();
  v5[1] = sub_21DBACCC8();
  id v7 = (id)*MEMORY[0x263EFE140];
  id v3 = (id)*MEMORY[0x263EFE140];
  sub_21DBACCD8();
  void v5[2] = sub_21DBACCC8();
  sub_21DB6120C();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t result = v6;
  qword_267D1EDC8 = v6;
  return result;
}

uint64_t *sub_21DBA7D2C()
{
  if (qword_267D1E3F0 != -1) {
    swift_once();
  }
  return &qword_267D1EDC8;
}

id SFUIContactIconProvider.__allocating_init(diameter:layoutDirection:)(uint64_t a1, double a2)
{
  id v3 = objc_allocWithZone(v2);
  return SFUIContactIconProvider.init(diameter:layoutDirection:)(a1, a2);
}

id SFUIContactIconProvider.init(diameter:layoutDirection:)(uint64_t a1, double a2)
{
  double v17 = a2;
  uint64_t v16 = a1;
  id v3 = v2;
  id v4 = v2;
  id v5 = v2;
  id v6 = v2;
  uint64_t v18 = v2;
  uint64_t v10 = OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_contactStore;
  sub_21DBA7F24();
  *(void *)&v13[v10] = sub_21DB71BA8();

  id v7 = objc_msgSend(self, sel_avatarImageRender);
  *(void *)&v13[OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_avatarImageRenderer] = v7;

  *(double *)&v13[OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_diameter] = a2;
  *(void *)&v13[OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_layoutDirection] = a1;

  v15.receiver = v18;
  v15.super_class = (Class)type metadata accessor for SFUIContactIconProvider();
  id v14 = objc_msgSendSuper2(&v15, sel_init);
  id v8 = v14;
  uint64_t v18 = v14;

  return v14;
}

unint64_t sub_21DBA7F24()
{
  uint64_t v2 = qword_267D1EDE8;
  if (!qword_267D1EDE8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EDE8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for SFUIContactIconProvider()
{
  return self;
}

uint64_t sub_21DBA7FB4()
{
  v1[6] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[4] = 0;
  v1[5] = 0;
  v1[3] = v0;
  return MEMORY[0x270FA2498](sub_21DBA7FF8, 0);
}

uint64_t sub_21DBA7FF8()
{
  id v8 = *(id *)(v0 + 48);
  *(void *)(v0 + 16) = v0;
  id v1 = v8;
  id v10 = objc_msgSend(v8, sel_imageCache);

  id v9 = (id)*sub_21DBA7BAC();
  id v2 = v9;
  id v11 = objc_msgSend(v10, sel_objectForKey_, v9);

  if (v11)
  {
    v7[5] = v11;
    id v3 = *(uint64_t (**)(void))(v7[2] + 8);
    return v3();
  }
  else
  {
    sub_21DBA8510();
    id v6 = sub_21DB71BA8();
    v7[7] = v6;
    id v5 = (void *)swift_task_alloc();
    v7[8] = v5;
    *id v5 = v7[2];
    v5[1] = sub_21DBA81D0;
    return sub_21DBA95A8((uint64_t)v6);
  }
}

uint64_t sub_21DBA81D0(uint64_t a1)
{
  uint64_t v5 = *v2;
  *(void *)(v5 + 16) = *v2;
  *(void *)(v5 + 72) = a1;
  *(void *)(v5 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v3 = sub_21DBA846C;
  }
  else
  {

    id v3 = sub_21DBA8354;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_21DBA8354()
{
  uint64_t v7 = v0[9];
  id v6 = (id)v0[6];
  v0[2] = v0;
  v0[4] = v7;
  id v1 = v6;
  id v9 = objc_msgSend(v6, sel_imageCache);

  id v8 = (id)*sub_21DBA7BAC();
  id v2 = v8;
  objc_msgSend(v9, sel_setObject_forKey_, v7, v8);

  uint64_t v3 = v0[9];
  id v4 = *(uint64_t (**)(uint64_t))(v0[2] + 8);
  return v4(v3);
}

uint64_t sub_21DBA846C()
{
  id v1 = *(void **)(v0 + 56);
  *(void *)(v0 + 16) = v0;

  id v2 = *(uint64_t (**)())(*(void *)(v0 + 16) + 8);
  return v2();
}

unint64_t sub_21DBA8510()
{
  uint64_t v2 = qword_267D1EE10;
  if (!qword_267D1EE10)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EE10);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_21DBA8578(uint64_t a1, uint64_t a2)
{
  v3[24] = v2;
  v3[23] = a2;
  v3[22] = a1;
  v3[14] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[15] = 0;
  v3[16] = 0;
  v3[19] = 0;
  v3[20] = 0;
  v3[21] = 0;
  v3[8] = a1;
  v3[9] = a2;
  v3[15] = v2;
  return MEMORY[0x270FA2498](sub_21DBA866C, 0);
}

uint64_t sub_21DBA866C()
{
  uint64_t v38 = *(void **)(v0 + 192);
  *(void *)(v0 + 112) = v0;
  id v1 = v38;
  id v40 = objc_msgSend(v38, sel_imageCache);

  swift_bridgeObjectRetain();
  uint64_t v39 = (void *)sub_21DBACCC8();
  id v41 = objc_msgSend(v40, sel_objectForKey_);

  swift_bridgeObjectRelease();
  if (v41)
  {
    *(void *)(v37 + 168) = v41;
    sub_21DB6F16C(0);
    sub_21DB6F16C(0);
    uint64_t v2 = *(uint64_t (**)(id))(*(void *)(v37 + 112) + 8);
    id v3 = v41;
    return v2(v3);
  }
  uint64_t v29 = *(void *)(v37 + 192);
  uint64_t v25 = *(void *)(v37 + 184);
  uint64_t v23 = *(void *)(v37 + 176);
  sub_21DBA9F10();
  sub_21DBA7D2C();
  swift_bridgeObjectRetain();
  id v33 = sub_21DBA947C();
  *(void *)(v37 + 200) = v33;
  *(void *)(v37 + 128) = v33;
  id v26 = self;
  sub_21DBAD308();
  unint64_t v24 = v5;
  swift_bridgeObjectRetain();
  *unint64_t v24 = v23;
  v24[1] = v25;
  sub_21DB6120C();
  id v27 = (id)sub_21DBACDE8();
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v26, sel_predicateForContactsWithIdentifiers_, v27);

  objc_msgSend(v33, sel_setPredicate_, v28);
  *(void *)(v37 + 136) = 0;
  uint64_t v32 = *(void **)(v29 + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_contactStore);
  id v6 = v32;
  uint64_t v30 = swift_allocObject();
  *(void *)(v37 + 208) = v30;
  *(void *)(v30 + 16) = v37 + 136;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_21DBA9FA4;
  *(void *)(v31 + 24) = v30;
  swift_retain();
  *(void *)(v37 + 48) = sub_21DBA9FD8;
  *(void *)(v37 + 56) = v31;
  *(void *)(v37 + 16) = MEMORY[0x263EF8330];
  *(_DWORD *)(v37 + 24) = 1107296256;
  *(_DWORD *)(v37 + 28) = 0;
  *(void *)(v37 + 32) = sub_21DBA9548;
  *(void *)(v37 + 40) = &block_descriptor_1;
  id v36 = _Block_copy((const void *)(v37 + 16));
  swift_release();
  *(void *)(v37 + 144) = 0;
  unsigned __int8 v34 = objc_msgSend(v32, sel_enumerateContactsWithFetchRequest_error_usingBlock_, v33, v37 + 144, v36);
  unint64_t v35 = *(void **)(v37 + 144);
  id v7 = v35;

  _Block_release(v36);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
    return result;
  }
  sub_21DB6F16C((uint64_t)sub_21DBA9FD8);

  if ((v34 & 1) == 0)
  {
    sub_21DBAC608();

    swift_willThrow();
    sub_21DB74628((id *)(v37 + 136));

LABEL_13:
    sub_21DB6F16C((uint64_t)sub_21DBA9FA4);
    uint64_t v2 = *(uint64_t (**)(id))(*(void *)(v37 + 112) + 8);
    id v3 = v16;
    return v2(v3);
  }
  uint64_t v22 = *(void **)(v37 + 136);
  *(void *)(v37 + 216) = v22;
  id v8 = v22;
  if (!v22)
  {
    uint64_t v15 = *(void *)(v37 + 184);
    uint64_t v14 = *(void *)(v37 + 176);
    uint64_t v19 = sub_21DBACB58();
    sub_21DBA3018();
    swift_allocError();
    unsigned int v20 = v9;
    *(void *)(v37 + 80) = sub_21DBAD2F8();
    *(void *)(v37 + 88) = v10;
    sub_21DBACD38();
    sub_21DBAD2E8();
    swift_bridgeObjectRelease();
    *(void *)(v37 + 96) = v14;
    *(void *)(v37 + 104) = v15;
    sub_21DBAD2D8();
    sub_21DBACD38();
    sub_21DBAD2E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21DB6C060();
    uint64_t v17 = sub_21DBACD28();
    uint64_t v18 = v11;
    uint64_t v12 = sub_21DBACD38();
    *unsigned int v20 = v17;
    v20[1] = v18;
    void v20[2] = v12;
    v20[3] = v13;
    v20[4] = 62;
    (*(void (**)(void))(*(void *)(v19 - 8) + 104))();
    swift_willThrow();
    sub_21DB74628((id *)(v37 + 136));

    goto LABEL_13;
  }
  *(void *)(v37 + 152) = v22;
  uint64_t v21 = (void *)swift_task_alloc();
  *(void *)(v37 + 224) = v21;
  *uint64_t v21 = *(void *)(v37 + 112);
  v21[1] = sub_21DBA8F70;
  return sub_21DBA95A8((uint64_t)v22);
}

uint64_t sub_21DBA8F70(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[14] = *v2;
  v5[29] = a1;
  v5[30] = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v3 = sub_21DBA933C;
  }
  else
  {
    id v3 = sub_21DBA9144;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_21DBA9144()
{
  uint64_t v5 = *(void *)(v0 + 232);
  id v8 = *(id *)(v0 + 216);
  id v9 = *(id *)(v0 + 200);
  id v4 = *(id *)(v0 + 192);
  *(void *)(v0 + 112) = v0;
  *(void *)(v0 + 160) = v5;
  id v1 = v4;
  id v7 = objc_msgSend(v4, sel_imageCache);

  swift_bridgeObjectRetain();
  id v6 = (id)sub_21DBACCC8();
  objc_msgSend(v7, sel_setObject_forKey_, v5);

  swift_bridgeObjectRelease();
  sub_21DB74628((id *)(v0 + 136));

  uint64_t v10 = *(void *)(v0 + 232);
  sub_21DB6F16C((uint64_t)sub_21DBA9FA4);
  sub_21DB6F16C(0);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 112) + 8);
  return v2(v10);
}

uint64_t sub_21DBA933C()
{
  id v1 = *(void **)(v0 + 216);
  id v4 = *(id *)(v0 + 200);
  *(void *)(v0 + 112) = v0;

  sub_21DB74628((id *)(v0 + 136));
  sub_21DB6F16C((uint64_t)sub_21DBA9FA4);
  uint64_t v2 = *(uint64_t (**)())(*(void *)(v0 + 112) + 8);
  return v2();
}

id sub_21DBA947C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_21DBAA3B8();
}

void sub_21DBA94BC(void *a1, unsigned char *a2, void **a3)
{
  id v3 = a1;
  id v4 = *a3;
  *a3 = a1;

  *a2 = 1;
}

uint64_t sub_21DBA9520(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_21DBA9548(uint64_t a1, id a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(id, uint64_t))(a1 + 32);
  id v3 = a2;
  v5(a2, a3);
}

uint64_t sub_21DBA95A8(uint64_t a1)
{
  *(void *)(v2 + 144) = v1;
  *(void *)(v2 + 136) = a1;
  *(void *)(v2 + 48) = v2;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(unsigned char *)(v2 + 200) = 0;
  *(void *)(v2 + 112) = 0;
  *(void *)(v2 + 120) = 0;
  *(void *)(v2 + 128) = 0;
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = v1;
  return MEMORY[0x270FA2498](sub_21DBA960C, 0);
}

uint64_t sub_21DBA960C()
{
  v0[6] = v0;
  v0[19] = self;
  v0[20] = sub_21DBACEA8();
  v0[21] = sub_21DBACE98();
  uint64_t v1 = sub_21DBACE58();
  return MEMORY[0x270FA2498](sub_21DBA96C4, v1);
}

uint64_t sub_21DBA96C4()
{
  uint64_t v1 = (void *)v0[19];
  v0[6] = v0;
  v0[22] = objc_msgSend(v1, sel_mainScreen);
  swift_release();
  return MEMORY[0x270FA2498](sub_21DBA9760, 0);
}

uint64_t sub_21DBA9760()
{
  *(void *)(v0 + 48) = v0;
  *(void *)(v0 + 184) = sub_21DBACE98();
  uint64_t v1 = sub_21DBACE58();
  return MEMORY[0x270FA2498](sub_21DBA97F8, v1);
}

uint64_t sub_21DBA97F8()
{
  uint64_t v1 = (void *)v0[22];
  v0[6] = v0;
  objc_msgSend(v1, sel_scale);
  v0[24] = v2;
  swift_release();
  return MEMORY[0x270FA2498](sub_21DBA9888, 0);
}

uint64_t sub_21DBA9888()
{
  double v31 = *(double *)(v0 + 192);
  uint64_t v1 = *(void **)(v0 + 176);
  uint64_t v30 = *(void *)(v0 + 144);
  *(void *)(v0 + 48) = v0;
  *(double *)(v0 + 72) = v31;

  *(void *)(v0 + 80) = *(void *)(v30 + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_layoutDirection);
  *(void *)(v0 + 88) = 1;
  type metadata accessor for SFUIUserInterfaceLayoutDirection();
  sub_21DBAA048();
  char v32 = sub_21DBAD318();
  *(unsigned char *)(v0 + 200) = v32 & 1;
  sub_21DBAA0CC();
  *(void *)(v0 + 104) = sub_21DBAA134(v32 & 1, 1, 0, *(double *)(v30 + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_diameter), *(double *)(v30 + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_diameter), v31);
  sub_21DBACD38();
  sub_21DBACD38();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D1EE48);
  sub_21DBAD048();
  uint64_t v22 = *(void *)(v29 + 144);
  id v24 = *(id *)(v29 + 136);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21DB74628((id *)(v29 + 104));
  uint64_t v25 = *(void **)(v29 + 96);
  *(void *)(v29 + 112) = v25;
  id v27 = *(void **)(v22 + OBJC_IVAR____TtC9SharingUI23SFUIContactIconProvider_avatarImageRenderer);
  id v2 = v27;
  sub_21DBA8510();
  sub_21DBAD308();
  uint64_t v23 = v3;
  id v4 = v24;
  *uint64_t v23 = v24;
  sub_21DB6120C();
  id v26 = (void *)sub_21DBACDE8();
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v27, sel_avatarImageForContacts_scope_, v26, v25);

  *(void *)(v29 + 120) = v28;
  id v5 = v28;
  if (v28)
  {
    *(void *)(v29 + 128) = v28;

    id v6 = v28;
    id v7 = *(uint64_t (**)(id))(*(void *)(v29 + 48) + 8);
  }
  else
  {
    id v15 = *(id *)(v29 + 136);
    uint64_t v20 = sub_21DBACB58();
    sub_21DBA3018();
    swift_allocError();
    uint64_t v21 = v8;
    *(void *)(v29 + 16) = sub_21DBAD2F8();
    *(void *)(v29 + 24) = v9;
    sub_21DBACD38();
    sub_21DBAD2E8();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v15, sel_identifier);
    *(void *)(v29 + 32) = sub_21DBACCD8();
    *(void *)(v29 + 40) = v10;
    sub_21DBAD2D8();
    sub_21DB6C060();

    sub_21DBACD38();
    sub_21DBAD2E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21DB6C060();
    uint64_t v18 = sub_21DBACD28();
    uint64_t v19 = v11;
    uint64_t v12 = sub_21DBACD38();
    *uint64_t v21 = v18;
    v21[1] = v19;
    v21[2] = v12;
    v21[3] = v13;
    void v21[4] = 81;
    (*(void (**)(void))(*(void *)(v20 - 8) + 104))();
    swift_willThrow();

    id v6 = v17;
    id v7 = *(uint64_t (**)(id))(*(void *)(v29 + 48) + 8);
  }
  return v7(v6);
}

unint64_t sub_21DBA9F10()
{
  uint64_t v2 = qword_267D1EE28;
  if (!qword_267D1EE28)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EE28);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_21DBA9F78()
{
  return swift_deallocObject();
}

void sub_21DBA9FA4(void *a1, unsigned char *a2)
{
  sub_21DBA94BC(a1, a2, *(void ***)(v2 + 16));
}

uint64_t sub_21DBA9FAC()
{
  return swift_deallocObject();
}

uint64_t sub_21DBA9FD8(uint64_t a1, uint64_t a2)
{
  return sub_21DBA9520(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_21DBAA048()
{
  uint64_t v2 = qword_267D1EE38;
  if (!qword_267D1EE38)
  {
    type metadata accessor for SFUIUserInterfaceLayoutDirection();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_267D1EE38);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_21DBAA0CC()
{
  uint64_t v2 = qword_267D1EE40;
  if (!qword_267D1EE40)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EE40);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_21DBAA134(char a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_scopeWithPointSize_scale_rightToLeft_style_backgroundStyle_, a1 & 1, a2, a3, a4, a5, a6);
  return v6;
}

id SFUIContactIconProvider.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SFUIContactIconProvider.init()()
{
  if (!"SharingUI.SFUIContactIconProvider")
  {
    sub_21DBAD1B8();
    __break(1u);
  }
  uint64_t result = sub_21DBA65F8((uint64_t)"SharingUI.SFUIContactIconProvider", 33, (unint64_t)"init()", 6, 2, (unint64_t)"SharingUI/SFUIContactIconProvider.swift", 39, 2, v1, 0x16uLL, 0xEuLL);
  __break(1u);
  return result;
}

id SFUIContactIconProvider.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFUIContactIconProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_21DBAA3B8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1EDD8);
  id v2 = (id)sub_21DBACDE8();
  id v3 = objc_msgSend(v1, sel_initWithKeysToFetch_);

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t method lookup function for SFUIContactIconProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SFUIContactIconProvider.__allocating_init(diameter:layoutDirection:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SFUIContactIconProvider.contactIconFallBack()()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v4 = *(int **)((*v0 & *MEMORY[0x263F8EED0]) + 0x78);
  id v6 = (uint64_t (*)(void))((char *)v4 + *v4);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *id v2 = *(void *)(v5 + 16);
  v2[1] = sub_21DBAA5A8;
  return v6();
}

uint64_t sub_21DBAA5A8(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t dispatch thunk of SFUIContactIconProvider.icon(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v6 = *(int **)((*v2 & *MEMORY[0x263F8EED0]) + 0x80);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v4;
  *uint64_t v4 = *(void *)(v7 + 16);
  v4[1] = sub_21DBAA5A8;
  return v9(a1, a2);
}

uint64_t sub_21DBAA818()
{
  return swift_deallocClassInstance();
}

id sub_21DBAA858()
{
  sub_21DBAA984();
  type metadata accessor for ResourceBundleClass();
  id result = sub_21DBAA8A0();
  qword_267D1EE70 = (uint64_t)result;
  return result;
}

id sub_21DBAA8A0()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);
  return v0;
}

uint64_t *sub_21DBAA8F8()
{
  if (qword_267D1E3F8 != -1) {
    swift_once();
  }
  return &qword_267D1EE70;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

unint64_t sub_21DBAA984()
{
  uint64_t v2 = qword_267D1EE78;
  if (!qword_267D1EE78)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_267D1EE78);
    return ObjCClassMetadata;
  }
  return v2;
}

void __getPLPhotoLibraryClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PhotoLibraryServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFAirDropActivityViewController.m", 29, @"%s", *a1);

  __break(1u);
}

void __getPLPhotoLibraryClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPLPhotoLibraryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAirDropActivityViewController.m", 30, @"Unable to find class %s", "PLPhotoLibrary");

  __break(1u);
}

void IntentsLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *IntentsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFUIPeopleSoftLinking.m", 11, @"%s", *a1);

  __break(1u);
}

void __getINImageClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getINImageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFUIPeopleSoftLinking.m", 12, @"Unable to find class %s", "INImage");

  __break(1u);
}

void __getINImageServiceConnectionClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getINImageServiceConnectionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFUIPeopleSoftLinking.m", 13, @"Unable to find class %s", "INImageServiceConnection");

  __break(1u);
}

void getINImageDefaultScaledSize_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (INImageDefaultScaledSize) (*)(void))0)()) getINImageDefaultScaledSize(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFUIPeopleSoftLinking.m", 14, @"%s", dlerror());

  __break(1u);
}

void ContactsUILibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ContactsUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFUIPeopleSoftLinking.m", 25, @"%s", *a1);

  __break(1u);
}

void __getCNAvatarImageRendererClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNAvatarImageRendererClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFUIPeopleSoftLinking.m", 26, @"Unable to find class %s", "CNAvatarImageRenderer");

  __break(1u);
}

void __getCNAvatarImageRenderingScopeClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNAvatarImageRenderingScopeClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFUIPeopleSoftLinking.m", 27, @"Unable to find class %s", "CNAvatarImageRenderingScope");

  __break(1u);
}

void __getCNAvatarImageRendererSettingsClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNAvatarImageRendererSettingsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFUIPeopleSoftLinking.m", 30, @"Unable to find class %s", "CNAvatarImageRendererSettings");

  __break(1u);
  sub_21DBAC5C8();
}

uint64_t sub_21DBAC5C8()
{
  return MEMORY[0x270EEE3D8]();
}

uint64_t sub_21DBAC5D8()
{
  return MEMORY[0x270EEE418]();
}

uint64_t sub_21DBAC5E8()
{
  return MEMORY[0x270FA1638]();
}

uint64_t sub_21DBAC5F8()
{
  return MEMORY[0x270EEF000]();
}

uint64_t sub_21DBAC608()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_21DBAC618()
{
  return MEMORY[0x270EEFBC8]();
}

uint64_t sub_21DBAC628()
{
  return MEMORY[0x270EEFC18]();
}

uint64_t sub_21DBAC638()
{
  return MEMORY[0x270EEFC50]();
}

uint64_t sub_21DBAC648()
{
  return MEMORY[0x270EEFC80]();
}

uint64_t sub_21DBAC658()
{
  return MEMORY[0x270EEFCA8]();
}

uint64_t sub_21DBAC668()
{
  return MEMORY[0x270EEFCC8]();
}

uint64_t sub_21DBAC678()
{
  return MEMORY[0x270EEFCD8]();
}

uint64_t sub_21DBAC688()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_21DBAC698()
{
  return MEMORY[0x270EEFD80]();
}

uint64_t sub_21DBAC6A8()
{
  return MEMORY[0x270EEFD88]();
}

uint64_t sub_21DBAC6B8()
{
  return MEMORY[0x270EEFDC8]();
}

uint64_t sub_21DBAC6C8()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_21DBAC6D8()
{
  return MEMORY[0x270EEFEE8]();
}

uint64_t sub_21DBAC6E8()
{
  return MEMORY[0x270EEFF08]();
}

uint64_t sub_21DBAC6F8()
{
  return MEMORY[0x270EEFF50]();
}

uint64_t sub_21DBAC708()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_21DBAC718()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_21DBAC728()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_21DBAC738()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_21DBAC748()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_21DBAC758()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_21DBAC768()
{
  return MEMORY[0x270FA1130]();
}

uint64_t sub_21DBAC778()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_21DBAC788()
{
  return MEMORY[0x270FA16F0]();
}

uint64_t sub_21DBAC798()
{
  return MEMORY[0x270FA1778]();
}

uint64_t sub_21DBAC7A8()
{
  return MEMORY[0x270FA1790]();
}

uint64_t sub_21DBAC7B8()
{
  return MEMORY[0x270FA17C8]();
}

uint64_t sub_21DBAC7C8()
{
  return MEMORY[0x270FA17D8]();
}

uint64_t sub_21DBAC7D8()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_21DBAC7E8()
{
  return MEMORY[0x270FA1828]();
}

uint64_t sub_21DBAC7F8()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_21DBAC808()
{
  return MEMORY[0x270FA1870]();
}

uint64_t sub_21DBAC818()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_21DBAC828()
{
  return MEMORY[0x270FA1908]();
}

uint64_t sub_21DBAC838()
{
  return MEMORY[0x270FA1920]();
}

uint64_t sub_21DBAC848()
{
  return MEMORY[0x270FA1930]();
}

uint64_t sub_21DBAC858()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_21DBAC868()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_21DBAC878()
{
  return MEMORY[0x270F631A8]();
}

uint64_t sub_21DBAC888()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21DBAC898()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21DBAC8A8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21DBAC8B8()
{
  return MEMORY[0x270F82100]();
}

uint64_t sub_21DBAC8C8()
{
  return MEMORY[0x270F82108]();
}

uint64_t sub_21DBAC8D8()
{
  return MEMORY[0x270F82110]();
}

uint64_t sub_21DBAC8E8()
{
  return MEMORY[0x270F82128]();
}

uint64_t sub_21DBAC8F8()
{
  return MEMORY[0x270EE3BD0]();
}

uint64_t sub_21DBAC908()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_21DBAC918()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_21DBAC928()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_21DBAC938()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_21DBAC948()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_21DBAC958()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_21DBAC968()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_21DBAC978()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_21DBAC988()
{
  return MEMORY[0x270EE4020]();
}

uint64_t sub_21DBAC998()
{
  return MEMORY[0x270F631C0]();
}

uint64_t sub_21DBAC9A8()
{
  return MEMORY[0x270F631C8]();
}

uint64_t sub_21DBAC9B8()
{
  return MEMORY[0x270F631D0]();
}

uint64_t sub_21DBAC9C8()
{
  return MEMORY[0x270F631D8]();
}

uint64_t sub_21DBAC9D8()
{
  return MEMORY[0x270F631E0]();
}

uint64_t sub_21DBAC9E8()
{
  return MEMORY[0x270F631E8]();
}

uint64_t sub_21DBAC9F8()
{
  return MEMORY[0x270F63220]();
}

uint64_t sub_21DBACA08()
{
  return MEMORY[0x270F63228]();
}

uint64_t sub_21DBACA18()
{
  return MEMORY[0x270F63238]();
}

uint64_t sub_21DBACA28()
{
  return MEMORY[0x270F63240]();
}

uint64_t sub_21DBACA38()
{
  return MEMORY[0x270F63250]();
}

uint64_t sub_21DBACA48()
{
  return MEMORY[0x270F63268]();
}

uint64_t sub_21DBACA58()
{
  return MEMORY[0x270F633C8]();
}

uint64_t sub_21DBACA68()
{
  return MEMORY[0x270F633D0]();
}

uint64_t sub_21DBACA78()
{
  return MEMORY[0x270F633E0]();
}

uint64_t sub_21DBACA88()
{
  return MEMORY[0x270F633E8]();
}

uint64_t sub_21DBACA98()
{
  return MEMORY[0x270F633F0]();
}

uint64_t sub_21DBACAA8()
{
  return MEMORY[0x270F633F8]();
}

uint64_t sub_21DBACAB8()
{
  return MEMORY[0x270F63408]();
}

uint64_t sub_21DBACAC8()
{
  return MEMORY[0x270F63410]();
}

uint64_t sub_21DBACAD8()
{
  return MEMORY[0x270F63420]();
}

uint64_t sub_21DBACAF8()
{
  return MEMORY[0x270F634A0]();
}

uint64_t sub_21DBACB08()
{
  return MEMORY[0x270F634A8]();
}

uint64_t sub_21DBACB18()
{
  return MEMORY[0x270F634B0]();
}

uint64_t sub_21DBACB38()
{
  return MEMORY[0x270F634F0]();
}

uint64_t sub_21DBACB48()
{
  return MEMORY[0x270F634F8]();
}

uint64_t sub_21DBACB58()
{
  return MEMORY[0x270F63550]();
}

uint64_t sub_21DBACB68()
{
  return MEMORY[0x270F63560]();
}

uint64_t sub_21DBACB78()
{
  return MEMORY[0x270F63568]();
}

uint64_t sub_21DBACB88()
{
  return MEMORY[0x270F63570]();
}

uint64_t sub_21DBACB98()
{
  return MEMORY[0x270F63578]();
}

uint64_t sub_21DBACBA8()
{
  return MEMORY[0x270F63580]();
}

uint64_t sub_21DBACBB8()
{
  return MEMORY[0x270F63588]();
}

uint64_t sub_21DBACBC8()
{
  return MEMORY[0x270F635E8]();
}

uint64_t sub_21DBACBD8()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_21DBACBE8()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_21DBACBF8()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_21DBACC08()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_21DBACC18()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_21DBACC28()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_21DBACC38()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_21DBACC48()
{
  return MEMORY[0x270F9D160]();
}

uint64_t sub_21DBACC58()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_21DBACC68()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_21DBACC78()
{
  return MEMORY[0x270F9D330]();
}

uint64_t sub_21DBACC88()
{
  return MEMORY[0x270F9D428]();
}

uint64_t sub_21DBACC98()
{
  return MEMORY[0x270F9D4A0]();
}

uint64_t sub_21DBACCA8()
{
  return MEMORY[0x270F9D570]();
}

uint64_t sub_21DBACCB8()
{
  return MEMORY[0x270F9D580]();
}

uint64_t sub_21DBACCC8()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_21DBACCD8()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_21DBACCE8()
{
  return MEMORY[0x270EF1A00]();
}

uint64_t sub_21DBACCF8()
{
  return MEMORY[0x270EF1A08]();
}

uint64_t sub_21DBACD08()
{
  return MEMORY[0x270EF1AA0]();
}

uint64_t sub_21DBACD18()
{
  return MEMORY[0x270EF1AD8]();
}

uint64_t sub_21DBACD28()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_21DBACD38()
{
  return MEMORY[0x270F9D6D8]();
}

uint64_t sub_21DBACD48()
{
  return MEMORY[0x270F9D6E8]();
}

uint64_t sub_21DBACD58()
{
  return MEMORY[0x270F9D7D0]();
}

uint64_t sub_21DBACD68()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21DBACD78()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_21DBACD88()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_21DBACD98()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_21DBACDA8()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_21DBACDB8()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_21DBACDC8()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_21DBACDD8()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t sub_21DBACDE8()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_21DBACDF8()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_21DBACE08()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_21DBACE18()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_21DBACE28()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21DBACE38()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_21DBACE48()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_21DBACE58()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21DBACE68()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_21DBACE78()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_21DBACE98()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_21DBACEA8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_21DBACEB8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21DBACEC8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21DBACED8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_21DBACEE8()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_21DBACF08()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_21DBACF18()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_21DBACF28()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_21DBACF38()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_21DBACF48()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_21DBACF58()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_21DBACF68()
{
  return MEMORY[0x270F9E1C8]();
}

uint64_t sub_21DBACF78()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_21DBACF88()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21DBACF98()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21DBACFA8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21DBACFB8()
{
  return MEMORY[0x270EF1F68]();
}

uint64_t sub_21DBACFC8()
{
  return MEMORY[0x270FA0D68]();
}

uint64_t sub_21DBACFD8()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_21DBACFE8()
{
  return MEMORY[0x270F82710]();
}

uint64_t sub_21DBACFF8()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_21DBAD008()
{
  return MEMORY[0x270EF21B0]();
}

uint64_t sub_21DBAD018()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_21DBAD028()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_21DBAD038()
{
  return MEMORY[0x270F9E398]();
}

uint64_t sub_21DBAD048()
{
  return MEMORY[0x270F636B8]();
}

uint64_t sub_21DBAD058()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21DBAD068()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21DBAD078()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21DBAD088()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21DBAD098()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_21DBAD0A8()
{
  return MEMORY[0x270F9E898]();
}

uint64_t sub_21DBAD0B8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21DBAD0C8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21DBAD0D8()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_21DBAD0E8()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_21DBAD0F8()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_21DBAD108()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_21DBAD118()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_21DBAD128()
{
  return MEMORY[0x270FA2188]();
}

uint64_t sub_21DBAD138()
{
  return MEMORY[0x270FA2190]();
}

uint64_t sub_21DBAD148()
{
  return MEMORY[0x270FA2198]();
}

uint64_t sub_21DBAD158()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_21DBAD168()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_21DBAD178()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_21DBAD188()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_21DBAD198()
{
  return MEMORY[0x270F9ED88]();
}

uint64_t sub_21DBAD1A8()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t sub_21DBAD1B8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21DBAD1C8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21DBAD1D8()
{
  return MEMORY[0x270F9F008]();
}

uint64_t sub_21DBAD1E8()
{
  return MEMORY[0x270F9F038]();
}

uint64_t sub_21DBAD1F8()
{
  return MEMORY[0x270F9F040]();
}

uint64_t sub_21DBAD208()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21DBAD218()
{
  return MEMORY[0x270F9F198]();
}

uint64_t sub_21DBAD228()
{
  return MEMORY[0x270F9F1A0]();
}

uint64_t sub_21DBAD238()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_21DBAD248()
{
  return MEMORY[0x270F9F1B0]();
}

uint64_t sub_21DBAD258()
{
  return MEMORY[0x270F9F1B8]();
}

uint64_t sub_21DBAD268()
{
  return MEMORY[0x270F9F1C0]();
}

uint64_t sub_21DBAD278()
{
  return MEMORY[0x270F9F1C8]();
}

uint64_t sub_21DBAD288()
{
  return MEMORY[0x270F9F1D0]();
}

uint64_t sub_21DBAD298()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21DBAD2B8()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_21DBAD2C8()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_21DBAD2D8()
{
  return MEMORY[0x270F9F780]();
}

uint64_t sub_21DBAD2E8()
{
  return MEMORY[0x270F9F788]();
}

uint64_t sub_21DBAD2F8()
{
  return MEMORY[0x270F9F790]();
}

uint64_t sub_21DBAD308()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t sub_21DBAD318()
{
  return MEMORY[0x270F9F940]();
}

uint64_t sub_21DBAD328()
{
  return MEMORY[0x270F9FA30]();
}

uint64_t sub_21DBAD348()
{
  return MEMORY[0x270F9FAC0]();
}

uint64_t sub_21DBAD358()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_21DBAD378()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21DBAD388()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21DBAD398()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21DBAD3A8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21DBAD3B8()
{
  return MEMORY[0x270F9FC58]();
}

uint64_t sub_21DBAD3C8()
{
  return MEMORY[0x270F9FF88]();
}

uint64_t sub_21DBAD3D8()
{
  return MEMORY[0x270F9FFE0]();
}

uint64_t sub_21DBAD3E8()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_21DBAD3F8()
{
  return MEMORY[0x270F9FFF0]();
}

uint64_t sub_21DBAD408()
{
  return MEMORY[0x270FA0128]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x270F23D58]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x270F23D78]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x270F23D80]();
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x270EE49E0]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7D98](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x270EE7ED0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x270F0CD10]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x270F23F20]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x270F243B8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x270F24450]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x270F24490]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x270F244C0]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x270F244C8]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SFAddSuffixForCurrentDeviceClass()
{
  return MEMORY[0x270F636C0]();
}

uint64_t SFAirDropModelImageNameFromModelString()
{
  return MEMORY[0x270F636C8]();
}

uint64_t SFCompactStringFromCollection()
{
  return MEMORY[0x270F636D0]();
}

uint64_t SFContentTypes()
{
  return MEMORY[0x270F636D8]();
}

uint64_t SFCreateLivePhotoBundle()
{
  return MEMORY[0x270F636E0]();
}

uint64_t SFDataFromCGImage()
{
  return MEMORY[0x270F636E8]();
}

uint64_t SFDeviceSupportsAirDrop()
{
  return MEMORY[0x270F63708]();
}

uint64_t SFFakeFilesAndItemsArrayForURLs()
{
  return MEMORY[0x270F63720]();
}

uint64_t SFIsCredential()
{
  return MEMORY[0x270F63728]();
}

uint64_t SFIsFindMyFriendsLink()
{
  return MEMORY[0x270F63730]();
}

uint64_t SFIsImage()
{
  return MEMORY[0x270F63738]();
}

uint64_t SFIsLivePhotos()
{
  return MEMORY[0x270F63740]();
}

uint64_t SFIsPass()
{
  return MEMORY[0x270F63748]();
}

uint64_t SFIsPasskeyCredentialLink()
{
  return MEMORY[0x270F63750]();
}

uint64_t SFIsVideo()
{
  return MEMORY[0x270F63758]();
}

uint64_t SFLocalizedNameForBluetoothProductID()
{
  return MEMORY[0x270F63760]();
}

uint64_t SFLocalizedStringEx()
{
  return MEMORY[0x270F63768]();
}

uint64_t SFLocalizedStringForKey()
{
  return MEMORY[0x270F63770]();
}

uint64_t SFLocalizedStringForKeyInStringsFileNamed()
{
  return MEMORY[0x270F63778]();
}

uint64_t SFMainQueue()
{
  return MEMORY[0x270F63780]();
}

uint64_t SFMetricsLog()
{
  return MEMORY[0x270F63788]();
}

uint64_t SFNonBreakingStringFromDeviceName()
{
  return MEMORY[0x270F63790]();
}

uint64_t SFOperationCancel()
{
  return MEMORY[0x270F63798]();
}

uint64_t SFOperationCreate()
{
  return MEMORY[0x270F637A0]();
}

uint64_t SFOperationResume()
{
  return MEMORY[0x270F637A8]();
}

uint64_t SFOperationSetClient()
{
  return MEMORY[0x270F637B0]();
}

uint64_t SFOperationSetDispatchQueue()
{
  return MEMORY[0x270F637B8]();
}

uint64_t SFOperationSetProperty()
{
  return MEMORY[0x270F637C0]();
}

uint64_t SFSaveDataToTempFile()
{
  return MEMORY[0x270F637C8]();
}

uint64_t SFSuggestedAirDropThumbnailSize()
{
  return MEMORY[0x270F637D0]();
}

uint64_t SFUpTicksDiffFromNowToString()
{
  return MEMORY[0x270F637D8]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x270F82CC0]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F82CC8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x270F82D28]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F82DD0](image, compressionQuality);
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x270F82E60]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F82ED0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F82EF0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x270EE8548](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  return (CFStringRef)MEMORY[0x270EE8560](inUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x270EE8570](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x270EE8580](inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

uint64_t _UTTypeCreateSuggestedFilename()
{
  return MEMORY[0x270EE85C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x270FA0168]();
}

uint64_t airdrop_log()
{
  return MEMORY[0x270F637E0]();
}

uint64_t airdrop_ui_log()
{
  return MEMORY[0x270F637E8]();
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

uint64_t framework_log()
{
  return MEMORY[0x270F637F0]();
}

void free(void *a1)
{
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

uint64_t magic_head_log()
{
  return MEMORY[0x270F637F8]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t people_ui_log()
{
  return MEMORY[0x270F63800]();
}

uint64_t sf_dispatch_on_main_queue()
{
  return MEMORY[0x270F63808]();
}

uint64_t share_sheet_log()
{
  return MEMORY[0x270F63810]();
}

uint64_t sharingXPCHelperLog()
{
  return MEMORY[0x270F63818]();
}

uint64_t sharing_ui_log()
{
  return MEMORY[0x270F63820]();
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x270FA01A8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x270FA2410]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0340]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x270FA04D0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0580]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}