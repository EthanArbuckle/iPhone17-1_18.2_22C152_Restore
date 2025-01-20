@interface VFXMTLTessellator
- ($7A7BD8EC73F1DE0C75AE87F164959927)_pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4;
- (VFXMTLTessellator)initWithGeometry:(__CFXGeometry *)a3 resourceManager:(id)a4;
- (id)newPipelineStateConfiguratorForMeshElement:(id)a3 patchType:(unsigned __int8)a4 device:(id)a5;
- (unsigned)pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4;
- (void)constrainedEdgeLengthTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6;
- (void)dealloc;
- (void)draw:(id *)a3;
- (void)screenSpaceAdaptiveTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6;
- (void)subdivisionSurfaceTessellationDraw:(id *)a3;
- (void)uniformTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6;
- (void)update:(id *)a3;
- (void)updateConstrainedEdgeLengthTessellator:(id *)a3 parameters:(id *)a4;
- (void)updateScreenSpaceAdaptiveTessellator:(id *)a3 parameters:(id *)a4;
- (void)updateSubdivisionSurfaceTessellator:(id *)a3 parameters:(id *)a4;
- (void)updateUniformTessellator:(id *)a3;
@end

@implementation VFXMTLTessellator

- (VFXMTLTessellator)initWithGeometry:(__CFXGeometry *)a3 resourceManager:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VFXMTLTessellator;
  result = [(VFXMTLTessellator *)&v7 init];
  if (result)
  {
    result->_geometry = a3;
    result->_resourceManager = (VFXMTLResourceManager *)a4;
    *(void *)&result->_cachedTessellator.tessellationPartitionMode = 0;
    result->_cachedTessellator.parameters = 0;
    *(void *)&result->_cachedTessellator.type = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLTessellator;
  [(VFXMTLTessellator *)&v3 dealloc];
}

- ($7A7BD8EC73F1DE0C75AE87F164959927)_pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4
{
  int type = self->_cachedTessellator.type;
  if ((type - 1) < 3)
  {
    unsigned int tessellationPartitionMode = self->_cachedTessellator.tessellationPartitionMode;
LABEL_5:
    $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(tessellationPartitionMode & 3);
    goto LABEL_7;
  }
  if (type == 4)
  {
    v8 = sub_1B65A2BE0((uint64_t)self->_geometry, 0, 0);
    LOBYTE(tessellationPartitionMode) = sub_1B659F754((uint64_t)v8);
    int type = self->_cachedTessellator.type;
    goto LABEL_5;
  }
  $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)1;
LABEL_7:
  if (type == 4)
  {
    sub_1B65A2BE0((uint64_t)self->_geometry, 0, 0);
    $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 & 0xFFFFFFF3 | (4 * (sub_1B62C9214() & 3)));
    int type = self->_cachedTessellator.type;
  }
  else if (type == 3)
  {
    $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 4);
    goto LABEL_12;
  }
  if ((type - 1) < 3)
  {
LABEL_12:
    uint64_t v10 = sub_1B659C6F8((uint64_t)a3);
    if (v10 == 1)
    {
      $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 0x20);
    }
    else if (v10)
    {
      uint64_t v11 = sub_1B659C6F8((uint64_t)a3);
      sub_1B63F2F54(16, @"Unreachable code: Unknown index type %d", v12, v13, v14, v15, v16, v17, v11);
    }
    else
    {
      $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 0x10);
    }
    goto LABEL_21;
  }
  if (type != 4)
  {
    if (!type) {
      return v9;
    }
    goto LABEL_22;
  }
  sub_1B65A2BE0((uint64_t)self->_geometry, 0, 0);
  $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 & 0xFFFFFFCF | (16 * (sub_1B63347E4() & 3)));
LABEL_21:
  int type = self->_cachedTessellator.type;
LABEL_22:
  if ((type - 1) < 3) {
    return ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | ((self->_cachedTessellator.tessellationFactorScale != 1.0) << 6));
  }
  return v9;
}

- (unsigned)pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4
{
  if ((a4 - 1) <= 1u && self->_cachedTessellator.type == 4) {
    return 0;
  }
  else {
    return objc_msgSend__pipelineStateHashForMeshElement_patchType_(self, a2, (uint64_t)a3, a4);
  }
}

- (id)newPipelineStateConfiguratorForMeshElement:(id)a3 patchType:(unsigned __int8)a4 device:(id)a5
{
  if ((a4 - 1) <= 1u && self->_cachedTessellator.type == 4) {
    return 0;
  }
  char v7 = objc_msgSend__pipelineStateHashForMeshElement_patchType_(self, a2, (uint64_t)a3, a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B63F574C;
  v9[3] = &unk_1E61413E0;
  char v10 = v7;
  v9[4] = a5;
  return _Block_copy(v9);
}

- (void)update:(id *)a3
{
  __n128 v32 = 0uLL;
  $BF99454ECFE41BE5C1604073DE609D0A v33 = 0;
  sub_1B63CF184((__n128 *)self->_geometry, (uint64_t)a3, v3, v4, v5, v6, v7, &v32);
  int v17 = v32.n128_u8[0];
  if (v32.n128_u8[0] != self->_cachedTessellator.type)
  {

    self->_tessellationFactorBuffer = 0;
    int v17 = v32.n128_u8[0];
  }
  switch(v17)
  {
    case 0:
      sub_1B63F2F54(16, @"Unreachable code: A tessellator object should not exist when no tessellation is required", v11, v12, v13, v14, v15, v16, *(uint64_t *)&v21[0]);
      break;
    case 1:
      __n128 v30 = v32;
      $BF99454ECFE41BE5C1604073DE609D0A v31 = v33;
      objc_msgSend_updateUniformTessellator_(self, v10, (uint64_t)&v30, v12);
      break;
    case 2:
      __n128 v28 = v32;
      $BF99454ECFE41BE5C1604073DE609D0A v29 = v33;
      long long v18 = *(_OWORD *)&a3->var2;
      v27[0] = *(_OWORD *)&a3->var0;
      v27[1] = v18;
      objc_msgSend_updateScreenSpaceAdaptiveTessellator_parameters_(self, v10, (uint64_t)&v28, (uint64_t)v27);
      break;
    case 3:
      $BF99454ECFE41BE5C1604073DE609D0A v26 = v33;
      long long v19 = *(_OWORD *)&a3->var2;
      v24[0] = *(_OWORD *)&a3->var0;
      v24[1] = v19;
      __n128 v25 = v32;
      objc_msgSend_updateConstrainedEdgeLengthTessellator_parameters_(self, v10, (uint64_t)&v25, (uint64_t)v24);
      break;
    case 4:
      $BF99454ECFE41BE5C1604073DE609D0A v23 = v33;
      long long v20 = *(_OWORD *)&a3->var2;
      v21[0] = *(_OWORD *)&a3->var0;
      v21[1] = v20;
      __n128 v22 = v32;
      objc_msgSend_updateSubdivisionSurfaceTessellator_parameters_(self, v10, (uint64_t)&v22, (uint64_t)v21);
      break;
    default:
      break;
  }
  *(__n128 *)&self->_cachedTessellator.int type = v32;
  self->_cachedTessellator.parameters = v33;
}

- (void)draw:(id *)a3
{
  __n128 v21 = 0uLL;
  uint64_t v22 = 0;
  *(void *)&double v17 = sub_1B63CF184((__n128 *)self->_geometry, (uint64_t)a3, v3, v4, v5, v6, v7, &v21).n128_u64[0];
  switch(v21.n128_u8[0])
  {
    case 0u:
      sub_1B63F2F54(16, @"Unreachable code: A tessellator object should not exist when no tessellation is required", v11, v12, v13, v14, v15, v16, *(uint64_t *)&v19[0]);
      goto LABEL_3;
    case 1u:
LABEL_3:
      objc_msgSend_uniformTessellationDrawMeshElement_forMesh_instanceCount_renderContext_(self, v10, (uint64_t)a3->var3, (uint64_t)a3->var1, a3->var4, a3->var5, v17);
      break;
    case 2u:
      objc_msgSend_screenSpaceAdaptiveTessellationDrawMeshElement_forMesh_instanceCount_renderContext_(self, v10, (uint64_t)a3->var3, (uint64_t)a3->var1, a3->var4, a3->var5, v17);
      break;
    case 3u:
      objc_msgSend_constrainedEdgeLengthTessellationDrawMeshElement_forMesh_instanceCount_renderContext_(self, v10, (uint64_t)a3->var3, (uint64_t)a3->var1, a3->var4, a3->var5, v17);
      break;
    case 4u:
      long long v18 = *(_OWORD *)&a3->var2;
      v19[0] = *(_OWORD *)&a3->var0;
      v19[1] = v18;
      v19[2] = *(_OWORD *)&a3->var4;
      uint64_t v20 = *(void *)&a3->var6;
      objc_msgSend_subdivisionSurfaceTessellationDraw_(self, v10, (uint64_t)v19, v12);
      break;
    default:
      return;
  }
}

- (void)updateUniformTessellator:(id *)a3
{
  float var0 = a3->var4.var0.var0;
  float var1 = a3->var4.var0.var1;
  int v7 = HIWORD(LODWORD(var0)) & 0x8000;
  unsigned int v8 = (LODWORD(var0) >> 23);
  unsigned int v9 = v8 - 112;
  __int16 v10 = v7 | 0x7BFF;
  if (v8 == 255) {
    __int16 v10 = v7 | ((LODWORD(var0) & 0x7FFFFF) != 0) | 0x7C00;
  }
  unsigned int v11 = v8 - 113;
  if (v8 >= 0x71) {
    LOWORD(v12) = v10;
  }
  else {
    int v12 = HIWORD(LODWORD(var0)) & 0x8000;
  }
  int v13 = HIWORD(LODWORD(var0)) & 0x8000 | (LODWORD(var0) >> 13) & 0x3FF | (v9 << 10);
  if (v11 > 0x1D) {
    LOWORD(v13) = v12;
  }
  WORD2(v24) = v13;
  WORD1(v24) = v13;
  LOWORD(v24) = v13;
  int v14 = HIWORD(LODWORD(var1)) & 0x8000;
  unsigned int v15 = (LODWORD(var1) >> 23);
  unsigned int v16 = v15 - 112;
  unsigned int v17 = v15 - 113;
  __int16 v18 = v14 | 0x7BFF;
  if (v15 == 255) {
    __int16 v18 = v14 | ((LODWORD(var1) & 0x7FFFFF) != 0) | 0x7C00;
  }
  if (v15 >= 0x71) {
    LOWORD(v19) = v18;
  }
  else {
    int v19 = HIWORD(LODWORD(var1)) & 0x8000;
  }
  int v20 = HIWORD(LODWORD(var1)) & 0x8000 | (LODWORD(var1) >> 13) & 0x3FF | (v16 << 10);
  if (v17 > 0x1D) {
    LOWORD(v20) = v19;
  }
  HIWORD(v24) = v20;
  tessellationFactorBuffer = self->_tessellationFactorBuffer;
  if (tessellationFactorBuffer)
  {
    if (*(void *)&a3->var4 != *(void *)&self->_cachedTessellator.parameters) {
      *objc_msgSend_contents(tessellationFactorBuffer, a2, (uint64_t)a3, v3) = v24;
    }
  }
  else
  {
    uint64_t v22 = (void *)sub_1B653EFB8((uint64_t)self->_resourceManager);
    self->_tessellationFactorBuffer = (MTLBuffer *)objc_msgSend_newBufferWithBytes_length_options_(v22, v23, (uint64_t)&v24, 8, 0);
  }
}

- (void)uniformTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  uint64_t v10 = objc_msgSend_renderEncoder(a6, a2, (uint64_t)a3, (uint64_t)a4);
  *(float *)&double v11 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend_setTessellationFactorScale_(*(void **)(v10 + 16), v12, v13, v14, v11);
  objc_msgSend_setTessellationFactorBuffer_offset_instanceStride_(*(void **)(v10 + 16), v15, (uint64_t)self->_tessellationFactorBuffer, 0, 0);

  objc_msgSend__drawPatchForMeshElement_instanceCount_(a6, v16, (uint64_t)a3, a5);
}

- (void)updateScreenSpaceAdaptiveTessellator:(id *)a3 parameters:(id *)a4
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id var0 = a4->var0;
  uint64_t v6 = (void **)objc_msgSend_resourceComputeEncoder(a4->var1, a2, (uint64_t)a3, (uint64_t)a4);
  EncoderAndResetCache = objc_msgSend_getEncoderAndResetCache(*v6, v7, v8, v9);
  v124 = self;
  if (!self->_tessellationFactorBuffer)
  {
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    double v11 = (void *)sub_1B659C6F8((uint64_t)var0);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v147, (uint64_t)v152, 16);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v148;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v148 != v16) {
            objc_enumerationMutation(v11);
          }
          v15 += sub_1B659CA94(*(void *)(*((void *)&v147 + 1) + 8 * i));
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v18, (uint64_t)&v147, (uint64_t)v152, 16);
      }
      while (v14);
      uint64_t v19 = 24 * v15;
    }
    else
    {
      uint64_t v19 = 0;
    }
    int v20 = (void *)sub_1B653EFB8((uint64_t)v124->_resourceManager);
    v124->_tessellationFactorBuffer = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v20, v21, v19, 32);
  }
  uint64_t v22 = (void *)sub_1B653EFC4((uint64_t)var0);
  $BF99454ECFE41BE5C1604073DE609D0A v26 = objc_msgSend_attributes(v22, v23, v24, v25);
  $BF99454ECFE41BE5C1604073DE609D0A v29 = objc_msgSend_objectAtIndexedSubscript_(v26, v27, 0, v28);
  $BF99454ECFE41BE5C1604073DE609D0A v33 = objc_msgSend_layouts(v22, v30, v31, v32);
  v116 = v29;
  uint64_t v37 = objc_msgSend_bufferIndex(v29, v34, v35, v36);
  v115 = objc_msgSend_objectAtIndexedSubscript_(v33, v38, v37, v39);
  objc_msgSend_pushDebugGroup_(EncoderAndResetCache, v40, @"Compute VFXModelScreenSpaceAdaptiveTessellator tessellation factors", v41);
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  uint64_t v117 = (uint64_t)var0;
  obuint64_t j = (id)sub_1B659C6F8((uint64_t)var0);
  uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v143, (uint64_t)v151, 16);
  if (v120)
  {
    uint64_t v46 = 0;
    uint64_t v113 = *(void *)v144;
    v114 = EncoderAndResetCache;
    int64x2_t v112 = vdupq_n_s64(1uLL);
    do
    {
      for (uint64_t j = 0; j != v120; ++j)
      {
        if (*(void *)v144 != v113) {
          objc_enumerationMutation(obj);
        }
        uint64_t v48 = *(void *)(*((void *)&v143 + 1) + 8 * j);
        uint64_t v49 = sub_1B659C6F8(v48);
        if (v49)
        {
          if (v49 == 1)
          {
            v52 = @"compute_tessellation_factors_screeenspace_adaptive_uint32";
          }
          else
          {
            unsigned __int8 v53 = sub_1B659C6F8(v48);
            sub_1B63F2F54(16, @"Unreachable code: Unknown index type %d", v54, v55, v56, v57, v58, v59, v53);
            v52 = &stru_1F0FCDBB0;
          }
        }
        else
        {
          v52 = @"compute_tessellation_factors_screeenspace_adaptive_uint16";
        }
        uint64_t v60 = objc_msgSend_computePipelineStateForKernel_(v124->_resourceManager, v50, (uint64_t)v52, v51);
        v61 = (void *)sub_1B653EFB8(v60);
        uint64_t v62 = sub_1B659CA94(v48);
        v63 = (void *)sub_1B659CBE8(v48);
        uint64_t v123 = objc_msgSend_buffer(v63, v64, v65, v66);
        v67 = (void *)sub_1B659CBE8(v48);
        uint64_t v71 = objc_msgSend_offset(v67, v68, v69, v70);
        uint64_t v122 = sub_1B653EFAC(v48) + v71;
        v72 = (void *)sub_1B659C6D8(v117);
        uint64_t v76 = objc_msgSend_bufferIndex(v116, v73, v74, v75);
        uint64_t v121 = objc_msgSend_objectAtIndexedSubscript_(v72, v77, v76 - 18, v78);
        char v82 = objc_msgSend_stride(v115, v79, v80, v81);
        unint64_t v86 = objc_msgSend_threadExecutionWidth(v61, v83, v84, v85);
        v90 = (__n128 *)objc_msgSend_engineContext(a4->var1, v87, v88, v89);
        __n128 v91 = sub_1B64479C4(v90);
        float v92 = a3->var4.var0.var0;
        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        v91.n128_f32[0] = v91.n128_f32[3] / v92;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        LODWORD(v129) = v62;
        BYTE4(v129) = v82;
        var2 = a4->var2;
        long long v94 = *(_OWORD *)var2;
        long long v95 = *((_OWORD *)var2 + 1);
        long long v96 = *((_OWORD *)var2 + 3);
        long long v132 = *((_OWORD *)var2 + 2);
        long long v133 = v96;
        long long v130 = v94;
        long long v131 = v95;
        long long v97 = *((_OWORD *)var2 + 4);
        long long v98 = *((_OWORD *)var2 + 5);
        long long v99 = *((_OWORD *)var2 + 7);
        long long v136 = *((_OWORD *)var2 + 6);
        long long v137 = v99;
        long long v134 = v97;
        long long v135 = v98;
        long long v100 = *((_OWORD *)var2 + 8);
        long long v101 = *((_OWORD *)var2 + 9);
        long long v102 = *((_OWORD *)var2 + 11);
        long long v140 = *((_OWORD *)var2 + 10);
        long long v141 = v102;
        long long v138 = v100;
        long long v139 = v101;
        LODWORD(v142) = v91.n128_u32[0];
        EncoderAndResetCache = v114;
        objc_msgSend_setComputePipelineState_(v114, v103, (uint64_t)v61, v104);
        objc_msgSend_setBuffer_offset_atIndex_(v114, v105, (uint64_t)v124->_tessellationFactorBuffer, 24 * v46, 0);
        objc_msgSend_setBuffer_offset_atIndex_(v114, v106, v123, v122, 1);
        objc_msgSend_setBuffer_offset_atIndex_(v114, v107, v121, 0, 2);
        objc_msgSend_setBytes_length_atIndex_(v114, v108, (uint64_t)&v129, 224, 3);
        unint64_t v127 = (v62 + v86 - 1) / v86;
        int64x2_t v128 = v112;
        unint64_t v125 = v86;
        int64x2_t v126 = v112;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v114, v109, (uint64_t)&v127, (uint64_t)&v125);
        v46 += v62;
      }
      uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v110, (uint64_t)&v143, (uint64_t)v151, 16);
    }
    while (v120);
  }
  objc_msgSend_popDebugGroup(EncoderAndResetCache, v43, v44, v45);
}

- (void)screenSpaceAdaptiveTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = (void *)sub_1B659C6F8((uint64_t)a4);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v29;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v29 != v18) {
        objc_enumerationMutation(v10);
      }
      id v20 = *(id *)(*((void *)&v28 + 1) + 8 * v19);
      if (v20 == a3) {
        break;
      }
      v17 += sub_1B659CA94((uint64_t)v20);
      if (v16 == ++v19)
      {
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, (uint64_t)v32, 16);
        if (v16) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v21 = objc_msgSend_renderEncoder(a6, v13, v14, v15, (void)v28);
  *(float *)&double v22 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend_setTessellationFactorScale_(*(void **)(v21 + 16), v23, v24, v25, v22);
  objc_msgSend_setTessellationFactorBuffer_offset_instanceStride_(*(void **)(v21 + 16), v26, (uint64_t)self->_tessellationFactorBuffer, 24 * v17, 0);
  objc_msgSend__drawPatchForMeshElement_instanceCount_(a6, v27, (uint64_t)a3, a5);
}

- (void)updateConstrainedEdgeLengthTessellator:(id *)a3 parameters:(id *)a4
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id var0 = a4->var0;
  if (self->_tessellationFactorBuffer)
  {
    if (a3->var4.var0.var0 == self->_cachedTessellator.parameters.uniform.edgeTessellationFactor) {
      return;
    }
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    uint64_t v8 = (void *)sub_1B659C6F8((uint64_t)var0);
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v118, (uint64_t)v123, 16);
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v119;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v119 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 += sub_1B659CA94(*(void *)(*((void *)&v118 + 1) + 8 * i));
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v118, (uint64_t)v123, 16);
      }
      while (v10);
      uint64_t v10 = 24 * v11;
    }
    uint64_t v15 = (void *)sub_1B653EFB8((uint64_t)self->_resourceManager);
    self->_tessellationFactorBuffer = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v15, v16, v10, 32);
  }
  v103 = self;
  uint64_t v104 = a3;
  uint64_t v17 = (void **)objc_msgSend_resourceComputeEncoder(a4->var1, a2, (uint64_t)a3, (uint64_t)a4);
  EncoderAndResetCache = objc_msgSend_getEncoderAndResetCache(*v17, v18, v19, v20);
  double v22 = (void *)sub_1B653EFC4((uint64_t)var0);
  $BF99454ECFE41BE5C1604073DE609D0A v26 = objc_msgSend_attributes(v22, v23, v24, v25);
  long long v29 = objc_msgSend_objectAtIndexedSubscript_(v26, v27, 0, v28);
  uint64_t v33 = objc_msgSend_layouts(v22, v30, v31, v32);
  long long v101 = v29;
  uint64_t v37 = objc_msgSend_bufferIndex(v29, v34, v35, v36);
  long long v100 = objc_msgSend_objectAtIndexedSubscript_(v33, v38, v37, v39);
  v105 = EncoderAndResetCache;
  objc_msgSend_pushDebugGroup_(EncoderAndResetCache, v40, @"Compute kCFXGeometryTessellatorTypeConstrainedEdgeLength tessellation factors", v41);
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  uint64_t v102 = (uint64_t)var0;
  obuint64_t j = (id)sub_1B659C6F8((uint64_t)var0);
  uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v114, (uint64_t)v122, 16);
  if (v106)
  {
    uint64_t v46 = 0;
    uint64_t v99 = *(void *)v115;
    int64x2_t v98 = vdupq_n_s64(1uLL);
    do
    {
      for (uint64_t j = 0; j != v106; ++j)
      {
        if (*(void *)v115 != v99) {
          objc_enumerationMutation(obj);
        }
        uint64_t v48 = *(void *)(*((void *)&v114 + 1) + 8 * j);
        uint64_t v49 = sub_1B659C6F8(v48);
        if (v49)
        {
          if (v49 == 1)
          {
            uint64_t v52 = objc_msgSend_computePipelineStateForKernel_(v103->_resourceManager, v50, @"compute_tessellation_factors_constrained_edge_uint32", v51);
          }
          else
          {
            unsigned __int8 v53 = sub_1B659C6F8(v48);
            sub_1B63F2F54(16, @"Unreachable code: Unknown index type %d", v54, v55, v56, v57, v58, v59, v53);
            uint64_t v52 = objc_msgSend_computePipelineStateForKernel_(v103->_resourceManager, v60, (uint64_t)&stru_1F0FCDBB0, v61);
          }
        }
        else
        {
          uint64_t v52 = objc_msgSend_computePipelineStateForKernel_(v103->_resourceManager, v50, @"compute_tessellation_factors_constrained_edge_uint16", v51);
        }
        uint64_t v62 = (void *)sub_1B653EFB8(v52);
        uint64_t v63 = sub_1B659CA94(v48);
        v64 = (void *)sub_1B659CBE8(v48);
        uint64_t v108 = objc_msgSend_buffer(v64, v65, v66, v67);
        v68 = (void *)sub_1B659CBE8(v48);
        uint64_t v72 = objc_msgSend_offset(v68, v69, v70, v71);
        uint64_t v107 = sub_1B653EFAC(v48) + v72;
        v73 = (void *)sub_1B659C6D8(v102);
        uint64_t v77 = objc_msgSend_bufferIndex(v101, v74, v75, v76);
        uint64_t v80 = objc_msgSend_objectAtIndexedSubscript_(v73, v78, v77 - 18, v79);
        unsigned __int8 v84 = objc_msgSend_stride(v100, v81, v82, v83);
        unint64_t v88 = objc_msgSend_threadExecutionWidth(v62, v85, v86, v87);
        v113[0] = v63;
        v113[1] = v84;
        v113[2] = LODWORD(v104->var4.var0.var0);
        objc_msgSend_setComputePipelineState_(v105, v89, (uint64_t)v62, v90);
        objc_msgSend_setBuffer_offset_atIndex_(v105, v91, (uint64_t)v103->_tessellationFactorBuffer, 24 * v46, 0);
        objc_msgSend_setBuffer_offset_atIndex_(v105, v92, v108, v107, 1);
        objc_msgSend_setBuffer_offset_atIndex_(v105, v93, v80, 0, 2);
        objc_msgSend_setBytes_length_atIndex_(v105, v94, (uint64_t)v113, 12, 3);
        unint64_t v111 = (v63 + v88 - 1) / v88;
        int64x2_t v112 = v98;
        unint64_t v109 = v88;
        int64x2_t v110 = v98;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v105, v95, (uint64_t)&v111, (uint64_t)&v109);
        v46 += v63;
      }
      uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v96, (uint64_t)&v114, (uint64_t)v122, 16);
    }
    while (v106);
  }
  objc_msgSend_popDebugGroup(v105, v43, v44, v45);
}

- (void)constrainedEdgeLengthTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = (void *)sub_1B659C6F8((uint64_t)a4);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v29;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v29 != v18) {
        objc_enumerationMutation(v10);
      }
      id v20 = *(id *)(*((void *)&v28 + 1) + 8 * v19);
      if (v20 == a3) {
        break;
      }
      v17 += sub_1B659CA94((uint64_t)v20);
      if (v16 == ++v19)
      {
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, (uint64_t)v32, 16);
        if (v16) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v21 = objc_msgSend_renderEncoder(a6, v13, v14, v15, (void)v28);
  *(float *)&double v22 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend_setTessellationFactorScale_(*(void **)(v21 + 16), v23, v24, v25, v22);
  objc_msgSend_setTessellationFactorBuffer_offset_instanceStride_(*(void **)(v21 + 16), v26, (uint64_t)self->_tessellationFactorBuffer, 24 * v17, 0);
  objc_msgSend__drawPatchForMeshElement_instanceCount_(a6, v27, (uint64_t)a3, a5);
}

- (void)updateSubdivisionSurfaceTessellator:(id *)a3 parameters:(id *)a4
{
  int v7 = sub_1B65A2BE0((uint64_t)self->_geometry, 0, 0);
  v7[1] = (int)a3->var1;
  uint64_t v10 = (MTLBuffer *)sub_1B659C670((uint64_t)a4->var0, 0, v8, v9);
  lastFramePositionBuffer = self->_lastFramePositionBuffer;
  if (lastFramePositionBuffer) {
    BOOL v16 = lastFramePositionBuffer == v10;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = !v16;
  self->_lastFramePositionBuffer = v10;
  if (!a4->var4 && v17 == 0)
  {
    if (!sub_1B65A4360((uint64_t)v7)) {
      return;
    }
  }
  else
  {
    double v19 = sub_1B65A4170((uint64_t)v7, (uint64_t)v10, a4->var1, a4->var3, v11, v12, v13, v14);
  }
  id var1 = a4->var1;
  var2 = a4->var2;
  uint64_t var3 = a4->var3;

  sub_1B65A4388((uint64_t)v7, var1, (uint64_t)var2, var3, *(float *)&v19);
}

- (void)subdivisionSurfaceTessellationDraw:(id *)a3
{
  uint64_t v10 = (void *)sub_1B64AD3C4((uint64_t)a3->var0, 0, (uint64_t)a3, v3, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_indexOfObject_(v10, v11, (uint64_t)a3->var2, v12);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    unsigned __int16 v14 = 0;
  }
  else {
    unsigned __int16 v14 = v13;
  }
  uint64_t v15 = sub_1B65A2BE0((uint64_t)self->_geometry, 0, 0);
  id var5 = a3->var5;
  int var6 = a3->var6;
  unsigned int var4 = a3->var4;

  sub_1B65A47D0((uint64_t)v15, var5, var6, v14, var4);
}

@end