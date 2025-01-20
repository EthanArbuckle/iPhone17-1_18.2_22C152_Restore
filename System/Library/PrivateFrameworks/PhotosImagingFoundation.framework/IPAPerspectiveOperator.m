@interface IPAPerspectiveOperator
+ (id)operatorWithAngleX:(double)a3 Y:(double)a4 dx:(double)a5 dy:(double)a6;
+ (id)operatorWithIdentifier:(id)a3 angleX:(double)a4 Y:(double)a5 dx:(double)a6 dy:(double)a7;
- (id)description;
- (id)transformForGeometry:(id)a3;
@end

@implementation IPAPerspectiveOperator

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@.%p xAngle:%f yAngle:%f dx:%f dy:%F>", v5, self, *(void *)&self->_xAngle, *(void *)&self->_yAngle, *(void *)&self->_dx, *(void *)&self->_dy];

  return v6;
}

- (id)transformForGeometry:(id)a3
{
  uint64_t v209 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  long long v177 = 0u;
  long long v178 = 0u;
  double v176 = 1.0;
  double v179 = 1.0;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  uint64_t v182 = 0x3FF0000000000000;
  uint64_t v185 = 0x3FF0000000000000;
  if (v4)
  {
    [v4 imageQuad];
  }
  else
  {
    float64x2_t v175 = 0uLL;
    float64x2_t v174 = 0uLL;
    float64x2_t v173 = 0uLL;
    float64x2_t v172 = 0uLL;
  }
  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  memset(&v168[8], 0, 32);
  *(void *)v168 = 0x3FF0000000000000;
  *(void *)&v168[40] = 0x3FF0000000000000;
  long long v169 = 0u;
  float64x2_t v170 = 0u;
  memset(&v171[8], 0, 32);
  *(void *)v171 = 0x3FF0000000000000;
  *(void *)&v171[40] = 0x3FF0000000000000;
  long long v159 = 0u;
  long long v160 = 0u;
  double v158 = 1.0;
  double v161 = 1.0;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  uint64_t v164 = 0x3FF0000000000000;
  uint64_t v167 = 0x3FF0000000000000;
  memset(&v154[8], 0, 32);
  *(void *)v154 = 0x3FF0000000000000;
  *(void *)&v154[40] = 0x3FF0000000000000;
  long long v155 = 0u;
  float64x2_t v156 = 0u;
  memset(&v157[8], 0, 32);
  *(void *)v157 = 0x3FF0000000000000;
  *(void *)&v157[40] = 0x3FF0000000000000;
  memset(&v150[8], 0, 32);
  *(void *)v150 = 0x3FF0000000000000;
  *(void *)&v150[40] = 0x3FF0000000000000;
  long long v151 = 0u;
  long long v152 = 0u;
  memset(&v153[8], 0, 32);
  *(void *)v153 = 0x3FF0000000000000;
  *(void *)&v153[40] = 0x3FF0000000000000;
  [v5 extent];
  double v10 = v9;
  if (self->_xAngle == 0.0 && self->_yAngle == 0.0)
  {
    double v64 = v6;
    double width = v7;
    double height = v8;
    double v66 = 1.0;
    double v67 = 1.0;
    double v65 = 1.0;
    double v68 = 1.0;
    goto LABEL_43;
  }
  v149[0] = v172;
  v149[1] = v173;
  v149[2] = v174;
  v149[3] = v175;
  v211.origin.CGFloat x = PA::Quad2d::boundingRect(v149);
  CGFloat x = v211.origin.x;
  CGFloat y = v211.origin.y;
  double width = v211.size.width;
  double height = v211.size.height;
  if (CGRectIsEmpty(v211))
  {
    _PFAssertFailHandler();
    goto LABEL_50;
  }
  CGFloat v77 = y;
  CGFloat v76 = x;
  if (width >= height) {
    double v15 = width;
  }
  else {
    double v15 = height;
  }
  long long v177 = 0u;
  long long v178 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  double v176 = 1.0 / v15;
  double v179 = 1.0 / v15;
  uint64_t v182 = 0x3FF0000000000000;
  uint64_t v185 = 0x3FF0000000000000;
  PA::operator*((uint64_t)v148, &v176, (long long *)v149);
  float64x2_t v140 = v148[0];
  float64x2_t v142 = v148[1];
  uint64_t v141 = 0;
  uint64_t v143 = 0;
  float64x2_t v144 = v148[2];
  float64x2_t v146 = v148[3];
  uint64_t v145 = 0;
  uint64_t v147 = 0;
  float64_t v16 = PA::Quad2d::areaCenter(v148);
  double v18 = v17;
  memset(&v134[8], 0, 32);
  *(void *)v134 = 0x3FF0000000000000;
  *(void *)&v134[40] = 0x3FF0000000000000;
  long long v135 = 0u;
  float64x2_t v136 = 0u;
  long long v137 = xmmword_1DD424080;
  v138.f64[0] = v16;
  v138.f64[1] = v17;
  double v78 = v16;
  long long v139 = xmmword_1DD424090;
  *(void *)&long long v122 = 0;
  long long v121 = 0x3FF0000000000000uLL;
  PA::Matrix4d::rotateAxis((long long *)v134, (uint64_t)&v121, self->_xAngle);
  long long v121 = xmmword_1DD424090;
  *(void *)&long long v122 = 0;
  PA::Matrix4d::rotateAxis((long long *)v134, (uint64_t)&v121, self->_yAngle);
  float64x2_t v138 = vaddq_f64(v138, vmlaq_f64(vmlsq_lane_f64(vmulq_n_f64(*(float64x2_t *)&v134[32], -v18), *(float64x2_t *)v134, v78, 0), (float64x2_t)0, v136));
  *(double *)&long long v139 = *(double *)&v139 + -(v18 * *(double *)&v135) - *(double *)&v134[16] * v78 + *(double *)&v137 * 0.0;
  PA::operator*((uint64_t)&v129, (double *)v134, (long long *)&v140);
  double v19 = v130;
  if (v130 >= v131) {
    double v20 = v131;
  }
  else {
    double v20 = v130;
  }
  if (v130 < v131) {
    double v19 = v131;
  }
  if (v20 >= v132) {
    double v20 = v132;
  }
  if (v20 >= v133) {
    double v21 = v133;
  }
  else {
    double v21 = v20;
  }
  if (v19 < v132) {
    double v19 = v132;
  }
  if (v19 >= v133) {
    double v22 = v19;
  }
  else {
    double v22 = v133;
  }
  double v23 = v78 - v78;
  double v24 = v18 - v18;
  double v25 = sqrt(v24 * v24 + v23 * v23 + (v22 + 1.0 - v21) * (v22 + 1.0 - v21));
  *(double *)&unint64_t v26 = (v78 - v78) / v25;
  *(double *)&unint64_t v27 = (v18 - v18) / v25;
  *(double *)&unint64_t v28 = (v22 + 1.0 - v21) / v25;
  double v29 = *(double *)&v28 + *(double *)&v27 * -0.0;
  double v30 = *(double *)&v28 * -0.0 + *(double *)&v26 * 0.0;
  double v31 = -(*(double *)&v26 - *(double *)&v27 * 0.0);
  double v32 = sqrt(v30 * v30 + v29 * v29 + v31 * v31);
  double v33 = v30 / v32;
  double v34 = v31 / v32;
  *(double *)&long long v121 = v29 / v32;
  *((double *)&v121 + 1) = *(double *)&v27 * v34 - *(double *)&v28 * v33;
  long long v122 = v26;
  *(double *)&long long v123 = v33;
  *((double *)&v123 + 1) = *(double *)&v28 * (v29 / v32) - *(double *)&v26 * v34;
  long long v124 = v27;
  *(double *)&long long v125 = v34;
  *((double *)&v125 + 1) = *(double *)&v26 * v33 - *(double *)&v27 * (v29 / v32);
  long long v126 = v28;
  *(double *)&long long v127 = -(v33 * v18) - v29 / v32 * v78 - v34 * (v22 + 1.0);
  *((double *)&v127 + 1) = -((*(double *)&v28 * *(double *)&v121 - *(double *)&v26 * v34) * v18)
                         - *((double *)&v121 + 1) * v78
                         - (*(double *)&v26 * v33 - *(double *)&v27 * *(double *)&v121) * (v22 + 1.0);
  *(double *)&long long v128 = -(*(double *)&v27 * v18) - *(double *)&v26 * v78 - *(double *)&v28 * (v22 + 1.0);
  *((void *)&v128 + 1) = 0x3FF0000000000000;
  PA::operator*((uint64_t)&v113, (double *)&v121, &v129);
  long long v111 = v125;
  *(_OWORD *)v112 = v126;
  *(_OWORD *)&v112[16] = v127;
  *(_OWORD *)&v112[32] = v128;
  *(_OWORD *)v109 = v121;
  *(_OWORD *)&v109[16] = v122;
  *(_OWORD *)&v109[32] = v123;
  long long v110 = v124;
  PA::Matrix4d::operator*=((double *)v109, (double *)v134);
  long long v207 = *(_OWORD *)&v109[8];
  long long v208 = *(_OWORD *)&v109[24];
  long long v205 = v110;
  long long v206 = v111;
  long long v203 = *(_OWORD *)&v112[8];
  long long v204 = *(_OWORD *)&v112[24];
  if (v78 == 0.0 || v18 == 0.0 || (double v35 = v22 - v21 + 1.0, v35 == 1.0) || v35 <= 0.0)
  {
LABEL_49:
    _PFAssertFailHandler();
LABEL_50:
    __break(1u);
  }
  double v73 = *(double *)&v109[40];
  double v74 = *(double *)v109;
  double v75 = *(double *)v112;
  uint64_t v36 = 0;
  double v72 = *(double *)&v112[40];
  memset(&v168[8], 0, 32);
  long long v169 = 0uLL;
  *(double *)v168 = 2.0 / (v78 + v78);
  *(double *)&v168[40] = 2.0 / (v18 + v18);
  v170.f64[0] = v23 / (v78 + v78);
  v170.f64[1] = v24 / (v18 + v18);
  *(double *)v171 = -(v35 + 1.0) / (v35 + -1.0);
  *(_OWORD *)&v171[16] = 0uLL;
  *(void *)&v171[8] = 0xBFF0000000000000;
  *(double *)&v171[32] = v35 * -2.0 / (v35 + -1.0);
  *(void *)&v171[40] = 0;
  float64x2_t v195 = v113;
  *(void *)&long long v196 = v114;
  *((void *)&v196 + 1) = 0x3FF0000000000000;
  float64x2_t v197 = v115;
  *(void *)&long long v198 = v116;
  *((void *)&v198 + 1) = 0x3FF0000000000000;
  float64x2_t v199 = v117;
  *(void *)&long long v200 = v118;
  *((void *)&v200 + 1) = 0x3FF0000000000000;
  float64x2_t v201 = v119;
  *(void *)&long long v202 = v120;
  *((void *)&v202 + 1) = 0x3FF0000000000000;
  double v10 = v76;
  do
  {
    v37 = (char *)&v195 + v36 * 8;
    *(double *)v37 = PA::operator*((double *)v168, &v195.f64[v36]);
    *((void *)v37 + 1) = v38;
    if (*(double *)&v40 == 0.0) {
      goto LABEL_49;
    }
    *(float64x2_t *)v37 = vdivq_f64(*(float64x2_t *)v37, (float64x2_t)vdupq_lane_s64(v40, 0));
    *((double *)v37 + 2) = v39 / *(double *)&v40;
    *((double *)v37 + 3) = *(double *)&v40 / *(double *)&v40;
    v36 += 4;
  }
  while (v36 != 16);
  v108[0] = v195;
  v108[1] = v197;
  v108[2] = v199;
  v108[3] = v201;
  PA::Quad2d::boundingRect(v108);
  if (v41 >= v42) {
    double v43 = v42;
  }
  else {
    double v43 = v41;
  }
  double v44 = 1.0 / v43;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  double v158 = width * v44;
  double v161 = height * v44;
  uint64_t v164 = 0x3FF0000000000000;
  uint64_t v167 = 0x3FF0000000000000;
  PA::operator*((uint64_t)v107, &v158, (long long *)v108);
  double v45 = PA::Quad2d::boundingRect(v107);
  memset(&v154[8], 0, 32);
  long long v155 = 0u;
  float64x2_t v156 = 0u;
  *(void *)v154 = 0x3FF0000000000000;
  *(void *)&v154[40] = 0x3FF0000000000000;
  *(_OWORD *)v157 = xmmword_1DD424080;
  *(double *)&v157[16] = -v45;
  *(double *)&v157[24] = -v46;
  *(_OWORD *)&v157[32] = xmmword_1DD424090;
  PA::operator*((uint64_t)&v189, (double *)v154, (long long *)v107);
  v107[0] = v189;
  v107[1] = v190;
  v107[2] = v191;
  v107[3] = v192;
  v212.origin.CGFloat x = v76;
  v212.origin.CGFloat y = v77;
  v212.size.double width = width;
  v212.size.double height = height;
  double MidX = CGRectGetMidX(v212);
  v213.origin.CGFloat x = v76;
  v213.origin.CGFloat y = v77;
  v213.size.double width = width;
  v213.size.double height = height;
  double MidY = CGRectGetMidY(v213);
  double v49 = PA::Quad2d::areaCenter(v107) + MidX * 0.5 * self->_dx;
  double v51 = v50 + MidY * 0.5 * self->_dy;
  long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v188[0] = *MEMORY[0x1E4F1DB28];
  v188[1] = v52;
  v187[0] = PA::Quad2d::boundingRect(v107);
  v187[1] = v53;
  v187[2] = v54;
  v187[3] = v55;
  v186[0] = &unk_1F3899FE0;
  *(double *)&v186[1] = v49;
  *(double *)&v186[2] = v51;
  *(double *)&v186[3] = width / height;
  int v56 = 100;
  do
  {
    *(void *)&long long v193 = (*(double (**)(void *, void *, _OWORD *))(v186[0] + 16))(v186, v187, v188);
    *((double *)&v193 + 1) = v57;
    *(double *)&long long v194 = v58;
    *((double *)&v194 + 1) = v59;
    *(void *)&v189.f64[0] = v193;
    v189.f64[1] = v57;
    v190.f64[0] = *(double *)&v193 + v58;
    v190.f64[1] = v57;
    *(void *)&v191.f64[0] = v193;
    v191.f64[1] = v57 + v59;
    v192.f64[0] = *(double *)&v193 + v58;
    v192.f64[1] = v57 + v59;
    if ((*(unsigned int (**)(void *, long long *, void *, double))(v186[0] + 24))(v186, &v193, v187, 0.5)&& PA::Quad2d::simpleContains((PA::Quad2d *)v107, (const Vector2d *)&v189))
    {
      break;
    }
    v60 = PA::Quad2d::simpleContains((PA::Quad2d *)v107, (const Vector2d *)&v189) ? v188 : v187;
    long long v61 = v194;
    _OWORD *v60 = v193;
    v60[1] = v61;
    --v56;
  }
  while (v56);
  double v62 = width / *(double *)&v194 * 0.0;
  double v63 = -(v51 * (height / *((double *)&v194 + 1) * 0.0));
  *(double *)v150 = width / *(double *)&v194;
  *(double *)&v150[8] = v62;
  *(double *)&v150[16] = v62;
  *(double *)&v150[24] = v62;
  *(double *)&v150[32] = height / *((double *)&v194 + 1) * 0.0;
  *(double *)&v150[40] = height / *((double *)&v194 + 1);
  *(double *)&long long v151 = *(double *)&v150[32];
  *((double *)&v151 + 1) = *(double *)&v150[32];
  long long v152 = 0uLL;
  *(_OWORD *)v153 = xmmword_1DD424080;
  *(double *)&v153[16] = MidX + v63 - width / *(double *)&v194 * v49 + 0.0;
  *(double *)&v153[24] = MidY + -(v51 * (height / *((double *)&v194 + 1))) - v62 * v49 + 0.0;
  *(double *)&v153[32] = v63 - v62 * v49 + 0.0;
  *(void *)&v153[40] = 0x3FF0000000000000;
  PA::operator*((uint64_t)&v172, (double *)v150, (long long *)v107);
  double v64 = v77;
  double v66 = v74;
  double v65 = v75;
  double v68 = v72;
  double v67 = v73;
LABEL_43:
  float64x2_t v103 = v170;
  long long v104 = *(_OWORD *)v171;
  float64x2_t v105 = *(float64x2_t *)&v171[16];
  long long v106 = *(_OWORD *)&v171[32];
  long long v99 = *(_OWORD *)v168;
  long long v100 = *(_OWORD *)&v168[16];
  long long v101 = *(_OWORD *)&v168[32];
  long long v102 = v169;
  *(_OWORD *)&v95[24] = v208;
  *(_OWORD *)&v95[8] = v207;
  *(double *)v95 = v66;
  *(double *)&v95[40] = v67;
  long long v96 = v205;
  long long v97 = v206;
  *(_OWORD *)&v98[24] = v204;
  *(_OWORD *)&v98[8] = v203;
  *(double *)v98 = v65;
  *(double *)&v98[40] = v68;
  PA::Matrix4d::operator*=((double *)v95, &v176);
  long long v125 = v97;
  long long v126 = *(_OWORD *)v98;
  long long v127 = *(_OWORD *)&v98[16];
  long long v128 = *(_OWORD *)&v98[32];
  long long v121 = *(_OWORD *)v95;
  long long v122 = *(_OWORD *)&v95[16];
  long long v123 = *(_OWORD *)&v95[32];
  long long v124 = v96;
  PA::Matrix4d::operator*=((double *)&v99, (double *)&v121);
  float64x2_t v136 = v103;
  long long v137 = v104;
  float64x2_t v138 = v105;
  long long v139 = v106;
  *(_OWORD *)v134 = v99;
  *(_OWORD *)&v134[16] = v100;
  *(_OWORD *)&v134[32] = v101;
  long long v135 = v102;
  long long v89 = *(_OWORD *)&v150[32];
  long long v90 = v151;
  long long v87 = *(_OWORD *)v150;
  long long v88 = *(_OWORD *)&v150[16];
  long long v93 = *(_OWORD *)&v153[16];
  long long v94 = *(_OWORD *)&v153[32];
  long long v91 = v152;
  long long v92 = *(_OWORD *)v153;
  float64x2_t v81 = *(float64x2_t *)&v154[32];
  long long v82 = v155;
  float64x2_t v79 = *(float64x2_t *)v154;
  long long v80 = *(_OWORD *)&v154[16];
  float64x2_t v85 = *(float64x2_t *)&v157[16];
  long long v86 = *(_OWORD *)&v157[32];
  float64x2_t v83 = v156;
  long long v84 = *(_OWORD *)v157;
  PA::Matrix4d::operator*=(v79.f64, &v158);
  float64x2_t v199 = v83;
  long long v200 = v84;
  float64x2_t v201 = v85;
  long long v202 = v86;
  float64x2_t v195 = v79;
  long long v196 = v80;
  float64x2_t v197 = v81;
  long long v198 = v82;
  PA::Matrix4d::operator*=((double *)&v87, v195.f64);
  long long v125 = v91;
  long long v126 = v92;
  long long v127 = v93;
  long long v128 = v94;
  long long v121 = v87;
  long long v122 = v88;
  long long v123 = v89;
  long long v124 = v90;
  v69 = [[IPAImageGeometry alloc] initWithIdentifier:@"perspectived", &v172, v10, v64, width, height extent imageQuad];
  v70 = [[IPAPerspectiveTransform alloc] initWithInputGeometry:v5 intrinsicGeometry:v69 projectionTransform:v134 viewingTransform:&v121];

  return v70;
}

+ (id)operatorWithIdentifier:(id)a3 angleX:(double)a4 Y:(double)a5 dx:(double)a6 dy:(double)a7
{
  id v11 = a3;
  if (a4 < -0.785398163
    || a4 > 0.785398163
    || a5 < -0.785398163
    || a5 > 0.785398163
    || a6 < -1.0
    || a6 > 1.0
    || a7 < -1.0
    || a7 > 1.0)
  {
    id result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    v12 = [(IPAGeometryOperator *)[IPAPerspectiveOperator alloc] initWithIdentifier:v11];
    v12->_xAngle = a4;
    v12->_yAngle = a5;
    v12->_dCGFloat x = a6;
    v12->_dCGFloat y = a7;

    return v12;
  }
  return result;
}

+ (id)operatorWithAngleX:(double)a3 Y:(double)a4 dx:(double)a5 dy:(double)a6
{
  return (id)[a1 operatorWithIdentifier:@"perspective" angleX:a3 Y:a4 dx:a5 dy:a6];
}

@end