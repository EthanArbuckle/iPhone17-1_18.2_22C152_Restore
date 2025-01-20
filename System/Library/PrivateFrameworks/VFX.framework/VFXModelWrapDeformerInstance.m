@interface VFXModelWrapDeformerInstance
- (unint64_t)updateWithContext:(id)a3;
- (void)dealloc;
@end

@implementation VFXModelWrapDeformerInstance

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXModelWrapDeformerInstance;
  [(VFXModelWrapDeformerInstance *)&v3 dealloc];
}

- (unint64_t)updateWithContext:(id)a3
{
  unint64_t v6 = objc_msgSend__currentFrameHash(a3, a2, (uint64_t)a3, v3);
  if (self->_currentFrameHash == v6) {
    return 0;
  }
  self->_currentFrameHash = v6;
  v11 = objc_msgSend__currentRenderContext(a3, v7, v8, v9);
  v22 = (void **)objc_msgSend_resourceComputeEncoder(v11, v12, v13, v14);
  if (self->_isLegacySingleLayerDeformer)
  {
    v23 = (long long *)sub_1B64A01D4((uint64_t)self->_legacyDrivingNode, v15, v16, v17, v18, v19, v20, v21);
    long long v113 = v23[1];
    long long v115 = *v23;
    long long v117 = v23[3];
    long long v119 = v23[2];
    simd_float4x4 v129 = *(simd_float4x4 *)sub_1B64A01D4((uint64_t)self->_deformedNode, v24, v25, v26, v27, v28, v29, v30);
    simd_float4x4 v130 = __invert_f4(v129);
    uint64_t v32 = 0;
    long long v121 = v115;
    long long v122 = v113;
    long long v123 = v119;
    long long v124 = v117;
    do
    {
      *(long long *)((char *)&v125 + v32) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v130.columns[0], COERCE_FLOAT(*(long long *)((char *)&v121 + v32))), (float32x4_t)v130.columns[1], *(float32x2_t *)((char *)&v121 + v32), 1), (float32x4_t)v130.columns[2], *(float32x4_t *)((char *)&v121 + v32), 2), (float32x4_t)v130.columns[3], *(float32x4_t *)((char *)&v121 + v32), 3);
      v32 += 16;
    }
    while (v32 != 64);
    long long v33 = v126;
    int64x2_t v34 = v127;
    long long v35 = v128;
    p_vertexCount = &self->_legacyUniforms.vertexCount;
    *(_OWORD *)&self->_anon_114[12] = v125;
    *(_OWORD *)&self->_anon_114[28] = v33;
    *(int64x2_t *)&self->_anon_114[44] = v34;
    *(_OWORD *)&self->_anon_114[60] = v35;
    objc_msgSend_setBytes_length_atIndex_(*v22, v31, (uint64_t)&self->_legacyUniforms, 80, 0);
    uint64_t v40 = objc_msgSend_dependency0PositionBuffer(a3, v37, v38, v39);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v41, v40, 0, 1);
    uint64_t v45 = objc_msgSend_dstPositionBuffer(a3, v42, v43, v44);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v46, v45, 0, 11);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v47, (uint64_t)self->_pointIndicesBuffer, 0, 3);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v48, (uint64_t)self->_barycentricCoordsBuffer, 0, 4);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v49, (uint64_t)self->_legacyOffsetsOrTransformsBuffer, 0, 6);
    if (self->_bindingMode == 1)
    {
      uint64_t v53 = objc_msgSend_srcPositionBuffer(a3, v50, v51, v52);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v54, v53, 0, 10);
    }
  }
  else
  {
    v55 = (long long *)sub_1B64A01D4((uint64_t)self->_innerLayerNode, v15, v16, v17, v18, v19, v20, v21);
    long long v109 = v55[1];
    long long v110 = *v55;
    long long v111 = v55[3];
    long long v112 = v55[2];
    v63 = (long long *)sub_1B64A01D4((uint64_t)self->_outerLayerNode, v56, v57, v58, v59, v60, v61, v62);
    long long v114 = v63[1];
    long long v116 = *v63;
    long long v118 = v63[3];
    long long v120 = v63[2];
    simd_float4x4 v131 = *(simd_float4x4 *)sub_1B64A01D4((uint64_t)self->_deformedNode, v64, v65, v66, v67, v68, v69, v70);
    simd_float4x4 v132 = __invert_f4(v131);
    uint64_t v72 = 0;
    long long v121 = v110;
    long long v122 = v109;
    long long v123 = v112;
    long long v124 = v111;
    do
    {
      *(long long *)((char *)&v125 + v72) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v132.columns[0], COERCE_FLOAT(*(long long *)((char *)&v121 + v72))), (float32x4_t)v132.columns[1], *(float32x2_t *)((char *)&v121 + v72), 1), (float32x4_t)v132.columns[2], *(float32x4_t *)((char *)&v121 + v72), 2), (float32x4_t)v132.columns[3], *(float32x4_t *)((char *)&v121 + v72), 3);
      v72 += 16;
    }
    while (v72 != 64);
    uint64_t v73 = 0;
    long long v74 = v126;
    int64x2_t v75 = v127;
    long long v76 = v128;
    *(_OWORD *)&self->_anon_14[12] = v125;
    *(_OWORD *)&self->_anon_14[28] = v74;
    *(int64x2_t *)&self->_anon_14[44] = v75;
    *(_OWORD *)&self->_anon_14[60] = v76;
    long long v121 = v116;
    long long v122 = v114;
    long long v123 = v120;
    long long v124 = v118;
    do
    {
      *(long long *)((char *)&v125 + v73) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v132.columns[0], COERCE_FLOAT(*(long long *)((char *)&v121 + v73))), (float32x4_t)v132.columns[1], *(float32x2_t *)((char *)&v121 + v73), 1), (float32x4_t)v132.columns[2], *(float32x4_t *)((char *)&v121 + v73), 2), (float32x4_t)v132.columns[3], *(float32x4_t *)((char *)&v121 + v73), 3);
      v73 += 16;
    }
    while (v73 != 64);
    p_vertexCount = &self->_uniforms.vertexCount;
    long long v77 = v126;
    int64x2_t v78 = v127;
    long long v79 = v128;
    *(_OWORD *)&self->_anon_14[76] = v125;
    *(_OWORD *)&self->_anon_14[92] = v77;
    *(int64x2_t *)&self->_anon_14[108] = v78;
    *(_OWORD *)&self->_anon_14[124] = v79;
    objc_msgSend_setBytes_length_atIndex_(*v22, v71, (uint64_t)&self->_uniforms, 144, 0);
    uint64_t v83 = objc_msgSend_dependency0PositionBuffer(a3, v80, v81, v82);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v84, v83, 0, 1);
    uint64_t v88 = objc_msgSend_dependency1PositionBuffer(a3, v85, v86, v87);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v89, v88, 0, 2);
    uint64_t v93 = objc_msgSend_dstPositionBuffer(a3, v90, v91, v92);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v94, v93, 0, 11);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v95, (uint64_t)self->_pointIndicesBuffer, 0, 3);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v96, (uint64_t)self->_barycentricCoordsBuffer, 0, 4);
    objc_msgSend_setBuffer_offset_atIndex_(*v22, v97, (uint64_t)self->_innerLayerInfluencesBuffer, 0, 5);
    if (self->_bindingMode == 1)
    {
      uint64_t v99 = objc_msgSend_srcPositionBuffer(a3, v50, v98, v52);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v100, v99, 0, 10);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v101, (uint64_t)self->_innerBindingSpaceVectorsBuffer, 0, 8);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v102, (uint64_t)self->_outerBindingSpaceVectorsBuffer, 0, 9);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v103, (uint64_t)self->_innerBindingOffsetsBuffer, 0, 6);
      objc_msgSend_setBuffer_offset_atIndex_(*v22, v104, (uint64_t)self->_outerBindingOffsetsBuffer, 0, 7, v109, v110, v111, v112);
    }
  }
  uint64_t v105 = *p_vertexCount;
  v106 = *v22;
  long long v125 = 0uLL;
  *(void *)&long long v126 = 0;
  *((void *)&v126 + 1) = v105;
  int64x2_t v127 = vdupq_n_s64(1uLL);
  objc_msgSend_setStageInRegion_(v106, v50, (uint64_t)&v125, v52, v109, v110, v111, v112);
  uint64_t v107 = sub_1B653EFB8((uint64_t)self->_computePipeline);
  objc_msgSend_dispatchOnVertices_vertexCount_(*v22, v108, v107, *p_vertexCount);
  return 1;
}

@end