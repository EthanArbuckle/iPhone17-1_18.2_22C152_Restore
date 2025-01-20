@interface FigDisparityMetadata
- (CGPoint)teleLensDistortionOpticalCenter;
- (CGPoint)wideLensDistortionOpticalCenter;
- (CGSize)teleIntrinsicMatrixReferenceDimensions;
- (CGSize)wideIntrinsicMatrixReferenceDimensions;
- (NSArray)teleInverseLensDistortionCoefficients;
- (NSArray)teleLensDistortionCoefficients;
- (NSArray)wideInverseLensDistortionCoefficients;
- (NSArray)wideLensDistortionCoefficients;
- (__n128)setTeleExtrinsicMatrix:(__n128)a3;
- (__n128)setTeleIntrinsicMatrix:(__n128)a3;
- (__n128)setWideExtrinsicMatrix:(__n128)a3;
- (__n128)setWideIntrinsicMatrix:(__n128)a3;
- (__n128)teleExtrinsicMatrix;
- (__n128)teleIntrinsicMatrix;
- (__n128)wideExtrinsicMatrix;
- (__n128)wideIntrinsicMatrix;
- (float)baseline;
- (float)telePixelSizeInMillimeters;
- (float)widePixelSizeInMillimeters;
- (id)description;
- (unsigned)version;
- (void)setBaseline:(float)a3;
- (void)setTeleIntrinsicMatrixReferenceDimensions:(CGSize)a3;
- (void)setTeleInverseLensDistortionCoefficients:(id)a3;
- (void)setTeleLensDistortionCoefficients:(id)a3;
- (void)setTeleLensDistortionOpticalCenter:(CGPoint)a3;
- (void)setTelePixelSizeInMillimeters:(float)a3;
- (void)setVersion:(unsigned __int16)a3;
- (void)setWideIntrinsicMatrixReferenceDimensions:(CGSize)a3;
- (void)setWideInverseLensDistortionCoefficients:(id)a3;
- (void)setWideLensDistortionCoefficients:(id)a3;
- (void)setWideLensDistortionOpticalCenter:(CGPoint)a3;
- (void)setWidePixelSizeInMillimeters:(float)a3;
@end

@implementation FigDisparityMetadata

- (id)description
{
  uint64_t v248 = *MEMORY[0x263EF8340];
  v227 = objc_msgSend_stringWithFormat_(NSString, a2, @"baseline: %.3f", v2, v3, v4, v5, v6, COERCE_FLOAT(COERCE_UNSIGNED_INT64(self->_baseline)), self->_baseline);
  v226 = objc_msgSend_stringWithFormat_(NSString, v8, @", pixel size: [reference]: %.5f mm (%.2f um) [auxiliary]: %.5f mm (%.2f um)", v9, v10, v11, v12, v13, COERCE_FLOAT(COERCE_UNSIGNED_INT64((float)(self->_telePixelSizeInMillimeters * 1000.0))), self->_telePixelSizeInMillimeters, (float)(self->_telePixelSizeInMillimeters * 1000.0), self->_widePixelSizeInMillimeters, (float)(self->_widePixelSizeInMillimeters * 1000.0));
  objc_msgSend_stringWithFormat_(NSString, v14, @",\n intrinsics: \n --> [reference]:\n [ %.3f , %.3f , %.3f ] \n [ %.3f , %.3f , %.3f ] \n [ %.3f , %.3f , %.3f ], \n --> [auxiliary]:\n [ %.3f , %.3f , %.3f ] \n [ %.3f , %.3f , %.3f ] \n [ %.3f , %.3f , %.3f ]", v15, v16, v17, v18, v19, COERCE_FLOAT(COERCE_UNSIGNED_INT64(*(float *)self->_anon_80)), *(float *)self->_anon_80, *(float *)&self->_anon_80[16], *(float *)&self->_anon_80[32], *(float *)&self->_anon_80[4], *(float *)&self->_anon_80[20], *(float *)&self->_anon_80[36], *(float *)&self->_anon_80[8], *(float *)&self->_anon_80[24], *(float *)&self->_anon_80[40], *(float *)self->_anon_b0,
    *(float *)&self->_anon_b0[16],
    *(float *)&self->_anon_b0[32],
    *(float *)&self->_anon_b0[4],
    *(float *)&self->_anon_b0[20],
    *(float *)&self->_anon_b0[36],
    *(float *)&self->_anon_b0[8],
    *(float *)&self->_anon_b0[24],
  v225 = *(float *)&self->_anon_b0[40]);
  objc_msgSend_stringWithFormat_(NSString, v20, @",\n extrinsics:\n --> [tele]:\n [ %.3f , %.3f , %.3f ][ %.3f ] \n [ %.3f , %.3f , %.3f ][ %.3f ] \n [ %.3f , %.3f , %.3f ][ %.3f ], \n --> [auxiliary]:\n [ %.3f , %.3f , %.3f ][ %.3f ] \n [ %.3f , %.3f , %.3f ][ %.3f ] \n [ %.3f , %.3f , %.3f ][ %.3f ]", v21, v22, v23, v24, v25, COERCE_FLOAT(COERCE_UNSIGNED_INT64(*(float *)self->_anon_e0)), *(float *)self->_anon_e0, *(float *)&self->_anon_e0[16], *(float *)&self->_anon_e0[32], *(float *)&self->_anon_e0[48], *(float *)&self->_anon_e0[4], *(float *)&self->_anon_e0[20], *(float *)&self->_anon_e0[36], *(float *)&self->_anon_e0[52], *(float *)&self->_anon_e0[8], *(float *)&self->_anon_e0[24],
    *(float *)&self->_anon_e0[40],
    *(float *)&self->_anon_e0[56],
    *(float *)&self[1].super.isa,
    self[1]._telePixelSizeInMillimeters,
    *(float *)&self[1]._wideLensDistortionCoefficients,
    *(float *)&self[1]._wideInverseLensDistortionCoefficients,
    *((float *)&self[1].super.isa + 1),
    self[1]._widePixelSizeInMillimeters,
    *((float *)&self[1]._wideLensDistortionCoefficients + 1),
    *((float *)&self[1]._wideInverseLensDistortionCoefficients + 1),
    *(float *)&self[1]._version,
    *(float *)&self[1]._teleLensDistortionCoefficients,
    *(float *)&self[1]._teleInverseLensDistortionCoefficients,
  v224 = *(float *)&self[1]._teleIntrinsicMatrixReferenceDimensions.width);
  v33 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v26, @",\n lens distortion coeffs: [tele]: [", v27, v28, v29, v30, v31, v32);
  long long v240 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  long long v243 = 0u;
  v34 = self->_teleLensDistortionCoefficients;
  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v240, (uint64_t)v247, 16, v36, v37, v38, v39);
  if (v40)
  {
    uint64_t v49 = v40;
    uint64_t v50 = *(void *)v241;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v241 != v50) {
          objc_enumerationMutation(v34);
        }
        v52 = NSString;
        objc_msgSend_floatValue(*(void **)(*((void *)&v240 + 1) + 8 * i), v41, v42, v43, v44, v45, v46, v47, v48);
        v60 = objc_msgSend_stringWithFormat_(v52, v54, @" %.3f,", v55, v56, v57, v58, v59, COERCE_FLOAT(COERCE_UNSIGNED_INT64(v53)), v53);
        objc_msgSend_appendString_(v33, v61, (uint64_t)v60, v62, v63, v64, v65, v66, v67);
      }
      uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v41, (uint64_t)&v240, (uint64_t)v247, 16, v45, v46, v47, v48);
    }
    while (v49);
  }

  objc_msgSend_appendString_(v33, v68, @" ], [auxiliary]: [", v69, v70, v71, v72, v73, v74);
  long long v238 = 0u;
  long long v239 = 0u;
  long long v236 = 0u;
  long long v237 = 0u;
  v75 = self->_wideLensDistortionCoefficients;
  uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v236, (uint64_t)v246, 16, v77, v78, v79, v80);
  if (v81)
  {
    uint64_t v90 = v81;
    uint64_t v91 = *(void *)v237;
    do
    {
      for (uint64_t j = 0; j != v90; ++j)
      {
        if (*(void *)v237 != v91) {
          objc_enumerationMutation(v75);
        }
        v93 = NSString;
        objc_msgSend_floatValue(*(void **)(*((void *)&v236 + 1) + 8 * j), v82, v83, v84, v85, v86, v87, v88, v89);
        v101 = objc_msgSend_stringWithFormat_(v93, v95, @" %.3f,", v96, v97, v98, v99, v100, COERCE_FLOAT(COERCE_UNSIGNED_INT64(v94)), v94);
        objc_msgSend_appendString_(v33, v102, (uint64_t)v101, v103, v104, v105, v106, v107, v108);
      }
      uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v82, (uint64_t)&v236, (uint64_t)v246, 16, v86, v87, v88, v89);
    }
    while (v90);
  }

  objc_msgSend_appendString_(v33, v109, @" ]", v110, v111, v112, v113, v114, v115);
  v123 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v116, @",\n inverse lens distortion coeffs: [reference]: [", v117, v118, v119, v120, v121, v122);
  long long v232 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  v124 = self->_teleInverseLensDistortionCoefficients;
  uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v232, (uint64_t)v245, 16, v126, v127, v128, v129);
  if (v130)
  {
    uint64_t v139 = v130;
    uint64_t v140 = *(void *)v233;
    do
    {
      for (uint64_t k = 0; k != v139; ++k)
      {
        if (*(void *)v233 != v140) {
          objc_enumerationMutation(v124);
        }
        v142 = NSString;
        objc_msgSend_floatValue(*(void **)(*((void *)&v232 + 1) + 8 * k), v131, v132, v133, v134, v135, v136, v137, v138);
        v150 = objc_msgSend_stringWithFormat_(v142, v144, @" %.3f,", v145, v146, v147, v148, v149, COERCE_FLOAT(COERCE_UNSIGNED_INT64(v143)), v143);
        objc_msgSend_appendString_(v123, v151, (uint64_t)v150, v152, v153, v154, v155, v156, v157);
      }
      uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v131, (uint64_t)&v232, (uint64_t)v245, 16, v135, v136, v137, v138);
    }
    while (v139);
  }

  objc_msgSend_appendString_(v123, v158, @" ], [auxiliary]: [", v159, v160, v161, v162, v163, v164);
  long long v230 = 0u;
  long long v231 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  v165 = self->_wideInverseLensDistortionCoefficients;
  uint64_t v171 = objc_msgSend_countByEnumeratingWithState_objects_count_(v165, v166, (uint64_t)&v228, (uint64_t)v244, 16, v167, v168, v169, v170);
  if (v171)
  {
    uint64_t v180 = v171;
    uint64_t v181 = *(void *)v229;
    do
    {
      for (uint64_t m = 0; m != v180; ++m)
      {
        if (*(void *)v229 != v181) {
          objc_enumerationMutation(v165);
        }
        v183 = NSString;
        objc_msgSend_floatValue(*(void **)(*((void *)&v228 + 1) + 8 * m), v172, v173, v174, v175, v176, v177, v178, v179);
        v191 = objc_msgSend_stringWithFormat_(v183, v185, @" %.3f,", v186, v187, v188, v189, v190, COERCE_FLOAT(COERCE_UNSIGNED_INT64(v184)), v184);
        objc_msgSend_appendString_(v123, v192, (uint64_t)v191, v193, v194, v195, v196, v197, v198);
      }
      uint64_t v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(v165, v172, (uint64_t)&v228, (uint64_t)v244, 16, v176, v177, v178, v179);
    }
    while (v180);
  }

  objc_msgSend_appendString_(v123, v199, @" ]", v200, v201, v202, v203, v204, v205);
  v212 = objc_msgSend_stringWithFormat_(NSString, v206, @",\n distortion optical center: [reference]: (%.3f, %.3f), [auxiliary]: (%.3f, %.3f)", v207, v208, v209, v210, v211, COERCE_FLOAT(*(_OWORD *)&self->_teleLensDistortionOpticalCenter), *(void *)&self->_teleLensDistortionOpticalCenter.x, *(void *)&self->_teleLensDistortionOpticalCenter.y, *(void *)&self->_wideLensDistortionOpticalCenter.x, *(void *)&self->_wideLensDistortionOpticalCenter.y);
  v213 = NSString;
  uint64_t v214 = objc_opt_class();
  v222 = objc_msgSend_stringWithFormat_(v213, v215, @"<%@: %p>: %@%@%@%@%@%@%@", v216, v217, v218, v219, v220, v221, v214, self, v227, v226, v225, v224, v33, v123, v212);

  return v222;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (float)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(float)a3
{
  self->_baseline = a3;
}

- (float)telePixelSizeInMillimeters
{
  return self->_telePixelSizeInMillimeters;
}

- (void)setTelePixelSizeInMillimeters:(float)a3
{
  self->_telePixelSizeInMillimeters = a3;
}

- (float)widePixelSizeInMillimeters
{
  return self->_widePixelSizeInMillimeters;
}

- (void)setWidePixelSizeInMillimeters:(float)a3
{
  self->_widePixelSizeInMillimeters = a3;
}

- (__n128)teleIntrinsicMatrix
{
  return a1[8];
}

- (__n128)setTeleIntrinsicMatrix:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  return result;
}

- (__n128)wideIntrinsicMatrix
{
  return a1[11];
}

- (__n128)setWideIntrinsicMatrix:(__n128)a3
{
  result[11] = a2;
  result[12] = a3;
  result[13] = a4;
  return result;
}

- (CGSize)teleIntrinsicMatrixReferenceDimensions
{
  double width = self->_teleIntrinsicMatrixReferenceDimensions.width;
  double height = self->_teleIntrinsicMatrixReferenceDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTeleIntrinsicMatrixReferenceDimensions:(CGSize)a3
{
  self->_teleIntrinsicMatrixReferenceDimensions = a3;
}

- (CGSize)wideIntrinsicMatrixReferenceDimensions
{
  double width = self->_wideIntrinsicMatrixReferenceDimensions.width;
  double height = self->_wideIntrinsicMatrixReferenceDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWideIntrinsicMatrixReferenceDimensions:(CGSize)a3
{
  self->_wideIntrinsicMatrixReferenceDimensions = a3;
}

- (__n128)teleExtrinsicMatrix
{
  return a1[14];
}

- (__n128)setTeleExtrinsicMatrix:(__n128)a3
{
  result[14] = a2;
  result[15] = a3;
  result[16] = a4;
  result[17] = a5;
  return result;
}

- (__n128)wideExtrinsicMatrix
{
  return a1[18];
}

- (__n128)setWideExtrinsicMatrix:(__n128)a3
{
  result[18] = a2;
  result[19] = a3;
  result[20] = a4;
  result[21] = a5;
  return result;
}

- (NSArray)teleLensDistortionCoefficients
{
  return self->_teleLensDistortionCoefficients;
}

- (void)setTeleLensDistortionCoefficients:(id)a3
{
}

- (NSArray)wideLensDistortionCoefficients
{
  return self->_wideLensDistortionCoefficients;
}

- (void)setWideLensDistortionCoefficients:(id)a3
{
}

- (NSArray)teleInverseLensDistortionCoefficients
{
  return self->_teleInverseLensDistortionCoefficients;
}

- (void)setTeleInverseLensDistortionCoefficients:(id)a3
{
}

- (NSArray)wideInverseLensDistortionCoefficients
{
  return self->_wideInverseLensDistortionCoefficients;
}

- (void)setWideInverseLensDistortionCoefficients:(id)a3
{
}

- (CGPoint)teleLensDistortionOpticalCenter
{
  double x = self->_teleLensDistortionOpticalCenter.x;
  double y = self->_teleLensDistortionOpticalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTeleLensDistortionOpticalCenter:(CGPoint)a3
{
  self->_teleLensDistortionOpticalCenter = a3;
}

- (CGPoint)wideLensDistortionOpticalCenter
{
  double x = self->_wideLensDistortionOpticalCenter.x;
  double y = self->_wideLensDistortionOpticalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setWideLensDistortionOpticalCenter:(CGPoint)a3
{
  self->_wideLensDistortionOpticalCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wideInverseLensDistortionCoefficients, 0);
  objc_storeStrong((id *)&self->_teleInverseLensDistortionCoefficients, 0);
  objc_storeStrong((id *)&self->_wideLensDistortionCoefficients, 0);

  objc_storeStrong((id *)&self->_teleLensDistortionCoefficients, 0);
}

@end