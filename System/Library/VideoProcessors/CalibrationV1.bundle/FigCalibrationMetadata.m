@interface FigCalibrationMetadata
- (CGPoint)auxiliaryLensDistortionOpticalCenter;
- (CGPoint)referenceLensDistortionOpticalCenter;
- (NSArray)auxiliaryInverseLensDistortionCoefficients;
- (NSArray)auxiliaryLensDistortionCoefficients;
- (NSArray)referenceInverseLensDistortionCoefficients;
- (NSArray)referenceLensDistortionCoefficients;
- (__n128)auxiliaryExtrinsicMatrix;
- (__n128)auxiliaryIntrinsicMatrix;
- (__n128)referenceExtrinsicMatrix;
- (__n128)referenceIntrinsicMatrix;
- (__n128)setAuxiliaryExtrinsicMatrix:(__n128)a3;
- (__n128)setAuxiliaryIntrinsicMatrix:(__n128)a3;
- (__n128)setReferenceExtrinsicMatrix:(__n128)a3;
- (__n128)setReferenceIntrinsicMatrix:(__n128)a3;
- (float)auxiliaryPixelSizeInMillimeters;
- (float)baseline;
- (float)referencePixelSizeInMillimeters;
- (id)description;
- (unsigned)version;
- (void)setAuxiliaryInverseLensDistortionCoefficients:(id)a3;
- (void)setAuxiliaryLensDistortionCoefficients:(id)a3;
- (void)setAuxiliaryLensDistortionOpticalCenter:(CGPoint)a3;
- (void)setAuxiliaryPixelSizeInMillimeters:(float)a3;
- (void)setBaseline:(float)a3;
- (void)setReferenceInverseLensDistortionCoefficients:(id)a3;
- (void)setReferenceLensDistortionCoefficients:(id)a3;
- (void)setReferenceLensDistortionOpticalCenter:(CGPoint)a3;
- (void)setReferencePixelSizeInMillimeters:(float)a3;
- (void)setVersion:(unsigned __int16)a3;
@end

@implementation FigCalibrationMetadata

- (id)description
{
  uint64_t v173 = *MEMORY[0x263EF8340];
  v152 = objc_msgSend_stringWithFormat_(NSString, a2, @"baseline: %.3f", v2, v3, v4, self->_baseline);
  v151 = objc_msgSend_stringWithFormat_(NSString, v6, @", pixel size: [reference]: %.5f mm (%.2f um) [auxiliary]: %.5f mm (%.2f um)", v7, v8, v9, self->_referencePixelSizeInMillimeters, (float)(self->_referencePixelSizeInMillimeters * 1000.0), self->_auxiliaryPixelSizeInMillimeters, (float)(self->_auxiliaryPixelSizeInMillimeters * 1000.0));
  objc_msgSend_stringWithFormat_(NSString, v10, @",\n intrinsics: \n --> [reference]:\n [ %.3f , %.3f , %.3f ] \n [ %.3f , %.3f , %.3f ] \n [ %.3f , %.3f , %.3f ], \n --> [auxiliary]:\n [ %.3f , %.3f , %.3f ] \n [ %.3f , %.3f , %.3f ] \n [ %.3f , %.3f , %.3f ]", v11, v12, v13, *(float *)self->_anon_60, *(float *)&self->_anon_60[16], *(float *)&self->_anon_60[32], *(float *)&self->_anon_60[4], *(float *)&self->_anon_60[20], *(float *)&self->_anon_60[36], *(float *)&self->_anon_60[8], *(float *)&self->_anon_60[24], *(float *)&self->_anon_60[40], *(float *)self->_anon_90, *(float *)&self->_anon_90[16], *(float *)&self->_anon_90[32], *(float *)&self->_anon_90[4],
    *(float *)&self->_anon_90[20],
    *(float *)&self->_anon_90[36],
    *(float *)&self->_anon_90[8],
    *(float *)&self->_anon_90[24],
  v150 = *(float *)&self->_anon_90[40]);
  objc_msgSend_stringWithFormat_(NSString, v14, @",\n extrinsics:\n --> [tele]:\n [ %.3f , %.3f , %.3f ][ %.3f ] \n [ %.3f , %.3f , %.3f ][ %.3f ] \n [ %.3f , %.3f , %.3f ][ %.3f ], \n --> [auxiliary]:\n [ %.3f , %.3f , %.3f ][ %.3f ] \n [ %.3f , %.3f , %.3f ][ %.3f ] \n [ %.3f , %.3f , %.3f ][ %.3f ]", v15, v16, v17, *(float *)self->_anon_c0, *(float *)&self->_anon_c0[16], *(float *)&self->_anon_c0[32], *(float *)&self->_anon_c0[48], *(float *)&self->_anon_c0[4], *(float *)&self->_anon_c0[20], *(float *)&self->_anon_c0[36], *(float *)&self->_anon_c0[52], *(float *)&self->_anon_c0[8], *(float *)&self->_anon_c0[24], *(float *)&self->_anon_c0[40], *(float *)&self->_anon_c0[56], *(float *)&self[1].super.isa,
    self[1]._referencePixelSizeInMillimeters,
    *(float *)&self[1]._auxiliaryLensDistortionCoefficients,
    *(float *)&self[1]._auxiliaryInverseLensDistortionCoefficients,
    *((float *)&self[1].super.isa + 1),
    self[1]._auxiliaryPixelSizeInMillimeters,
    *((float *)&self[1]._auxiliaryLensDistortionCoefficients + 1),
    *((float *)&self[1]._auxiliaryInverseLensDistortionCoefficients + 1),
    *(float *)&self[1]._version,
    *(float *)&self[1]._referenceLensDistortionCoefficients,
    *(float *)&self[1]._referenceInverseLensDistortionCoefficients,
  v149 = *(float *)&self[1]._referenceLensDistortionOpticalCenter.x);
  v22 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v18, @",\n lens distortion coeffs: [tele]: [", v19, v20, v21);
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  v23 = self->_referenceLensDistortionCoefficients;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v165, (uint64_t)v172, 16, v25);
  if (v26)
  {
    uint64_t v32 = v26;
    uint64_t v33 = *(void *)v166;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v166 != v33) {
          objc_enumerationMutation(v23);
        }
        v35 = NSString;
        objc_msgSend_floatValue(*(void **)(*((void *)&v165 + 1) + 8 * i), v27, v28, v29, v30, v31);
        v41 = objc_msgSend_stringWithFormat_(v35, v37, @" %.3f,", v38, v39, v40, v36);
        objc_msgSend_appendString_(v22, v42, (uint64_t)v41, v43, v44, v45);
      }
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v27, (uint64_t)&v165, (uint64_t)v172, 16, v31);
    }
    while (v32);
  }

  objc_msgSend_appendString_(v22, v46, @" ], [auxiliary]: [", v47, v48, v49);
  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  v50 = self->_auxiliaryLensDistortionCoefficients;
  uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v161, (uint64_t)v171, 16, v52);
  if (v53)
  {
    uint64_t v59 = v53;
    uint64_t v60 = *(void *)v162;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v162 != v60) {
          objc_enumerationMutation(v50);
        }
        v62 = NSString;
        objc_msgSend_floatValue(*(void **)(*((void *)&v161 + 1) + 8 * j), v54, v55, v56, v57, v58);
        v68 = objc_msgSend_stringWithFormat_(v62, v64, @" %.3f,", v65, v66, v67, v63);
        objc_msgSend_appendString_(v22, v69, (uint64_t)v68, v70, v71, v72);
      }
      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v54, (uint64_t)&v161, (uint64_t)v171, 16, v58);
    }
    while (v59);
  }

  objc_msgSend_appendString_(v22, v73, @" ]", v74, v75, v76);
  v81 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v77, @",\n inverse lens distortion coeffs: [reference]: [", v78, v79, v80);
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  v82 = self->_referenceInverseLensDistortionCoefficients;
  uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v157, (uint64_t)v170, 16, v84);
  if (v85)
  {
    uint64_t v91 = v85;
    uint64_t v92 = *(void *)v158;
    do
    {
      for (uint64_t k = 0; k != v91; ++k)
      {
        if (*(void *)v158 != v92) {
          objc_enumerationMutation(v82);
        }
        v94 = NSString;
        objc_msgSend_floatValue(*(void **)(*((void *)&v157 + 1) + 8 * k), v86, v87, v88, v89, v90);
        v100 = objc_msgSend_stringWithFormat_(v94, v96, @" %.3f,", v97, v98, v99, v95);
        objc_msgSend_appendString_(v81, v101, (uint64_t)v100, v102, v103, v104);
      }
      uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v86, (uint64_t)&v157, (uint64_t)v170, 16, v90);
    }
    while (v91);
  }

  objc_msgSend_appendString_(v81, v105, @" ], [auxiliary]: [", v106, v107, v108);
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  v109 = self->_auxiliaryInverseLensDistortionCoefficients;
  uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v110, (uint64_t)&v153, (uint64_t)v169, 16, v111);
  if (v112)
  {
    uint64_t v118 = v112;
    uint64_t v119 = *(void *)v154;
    do
    {
      for (uint64_t m = 0; m != v118; ++m)
      {
        if (*(void *)v154 != v119) {
          objc_enumerationMutation(v109);
        }
        v121 = NSString;
        objc_msgSend_floatValue(*(void **)(*((void *)&v153 + 1) + 8 * m), v113, v114, v115, v116, v117);
        v127 = objc_msgSend_stringWithFormat_(v121, v123, @" %.3f,", v124, v125, v126, v122);
        objc_msgSend_appendString_(v81, v128, (uint64_t)v127, v129, v130, v131);
      }
      uint64_t v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v113, (uint64_t)&v153, (uint64_t)v169, 16, v117);
    }
    while (v118);
  }

  objc_msgSend_appendString_(v81, v132, @" ]", v133, v134, v135);
  v140 = objc_msgSend_stringWithFormat_(NSString, v136, @",\n distortion optical center: [reference]: (%.3f, %.3f), [auxiliary]: (%.3f, %.3f)", v137, v138, v139, *(void *)&self->_referenceLensDistortionOpticalCenter.x, *(void *)&self->_referenceLensDistortionOpticalCenter.y, *(void *)&self->_auxiliaryLensDistortionOpticalCenter.x, *(void *)&self->_auxiliaryLensDistortionOpticalCenter.y);
  v141 = NSString;
  uint64_t v142 = objc_opt_class();
  v147 = objc_msgSend_stringWithFormat_(v141, v143, @"<%@: %p>: %@%@%@%@%@%@%@", v144, v145, v146, v142, self, v152, v151, v150, v149, v22, v81, v140);

  return v147;
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

- (float)referencePixelSizeInMillimeters
{
  return self->_referencePixelSizeInMillimeters;
}

- (void)setReferencePixelSizeInMillimeters:(float)a3
{
  self->_referencePixelSizeInMillimeters = a3;
}

- (float)auxiliaryPixelSizeInMillimeters
{
  return self->_auxiliaryPixelSizeInMillimeters;
}

- (void)setAuxiliaryPixelSizeInMillimeters:(float)a3
{
  self->_auxiliaryPixelSizeInMillimeters = a3;
}

- (__n128)referenceIntrinsicMatrix
{
  return a1[6];
}

- (__n128)setReferenceIntrinsicMatrix:(__n128)a3
{
  result[6] = a2;
  result[7] = a3;
  result[8] = a4;
  return result;
}

- (__n128)auxiliaryIntrinsicMatrix
{
  return a1[9];
}

- (__n128)setAuxiliaryIntrinsicMatrix:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  return result;
}

- (__n128)referenceExtrinsicMatrix
{
  return a1[12];
}

- (__n128)setReferenceExtrinsicMatrix:(__n128)a3
{
  result[12] = a2;
  result[13] = a3;
  result[14] = a4;
  result[15] = a5;
  return result;
}

- (__n128)auxiliaryExtrinsicMatrix
{
  return a1[16];
}

- (__n128)setAuxiliaryExtrinsicMatrix:(__n128)a3
{
  result[16] = a2;
  result[17] = a3;
  result[18] = a4;
  result[19] = a5;
  return result;
}

- (NSArray)referenceLensDistortionCoefficients
{
  return self->_referenceLensDistortionCoefficients;
}

- (void)setReferenceLensDistortionCoefficients:(id)a3
{
}

- (NSArray)auxiliaryLensDistortionCoefficients
{
  return self->_auxiliaryLensDistortionCoefficients;
}

- (void)setAuxiliaryLensDistortionCoefficients:(id)a3
{
}

- (NSArray)referenceInverseLensDistortionCoefficients
{
  return self->_referenceInverseLensDistortionCoefficients;
}

- (void)setReferenceInverseLensDistortionCoefficients:(id)a3
{
}

- (NSArray)auxiliaryInverseLensDistortionCoefficients
{
  return self->_auxiliaryInverseLensDistortionCoefficients;
}

- (void)setAuxiliaryInverseLensDistortionCoefficients:(id)a3
{
}

- (CGPoint)referenceLensDistortionOpticalCenter
{
  double x = self->_referenceLensDistortionOpticalCenter.x;
  double y = self->_referenceLensDistortionOpticalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setReferenceLensDistortionOpticalCenter:(CGPoint)a3
{
  self->_referenceLensDistortionOpticalCenter = a3;
}

- (CGPoint)auxiliaryLensDistortionOpticalCenter
{
  double x = self->_auxiliaryLensDistortionOpticalCenter.x;
  double y = self->_auxiliaryLensDistortionOpticalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAuxiliaryLensDistortionOpticalCenter:(CGPoint)a3
{
  self->_auxiliaryLensDistortionOpticalCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryInverseLensDistortionCoefficients, 0);
  objc_storeStrong((id *)&self->_referenceInverseLensDistortionCoefficients, 0);
  objc_storeStrong((id *)&self->_auxiliaryLensDistortionCoefficients, 0);

  objc_storeStrong((id *)&self->_referenceLensDistortionCoefficients, 0);
}

@end