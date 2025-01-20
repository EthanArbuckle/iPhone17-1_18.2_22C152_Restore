@interface VFXMTLSkinDeformer
+ (unint64_t)requiredInputs;
+ (unint64_t)requiredOutputs;
+ (unint64_t)supportedOutputs;
- (id)makeReadOnlyBuffersWithBaseGeometry:(__CFXGeometry *)a3 baseMesh:(__CFXMesh *)a4 blitEncoder:(id)a5;
- (unint64_t)updateWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5 tangents:(id)a6;
- (void)dealloc;
- (void)setupWithComputeContext:(id)a3;
@end

@implementation VFXMTLSkinDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 7;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (void)dealloc
{
  skinner = self->_skinner;
  if (skinner)
  {
    CFRelease(skinner);
    self->_skinner = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)VFXMTLSkinDeformer;
  [(VFXMTLSkinDeformer *)&v4 dealloc];
}

- (void)setupWithComputeContext:(id)a3
{
  uint64_t v16 = sub_1B63CCE68((uint64_t)self->_baseGeometry, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (!v16) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v10, v11, v12, v13, v14, v15, (uint64_t)"baseMesh");
  }
  v24 = sub_1B64AC5F8(v16, 0, 0, self->_dataKind, v12, v13, v14, v15);
  if (!v24) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v18, v19, v20, v21, v22, v23, (uint64_t)"basePositionSource");
  }
  self->_baseVertexCount = sub_1B641D8A0((uint64_t)v24, v17, v18, v19, v20, v21, v22, v23);
  resourceManager = self->_resourceManager;
  skinner = self->_skinner;
  uint64_t dataKind = self->_dataKind;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = sub_1B65D71E0;
  v58[3] = &unk_1E6144F60;
  v58[4] = a3;
  v58[5] = self;
  v58[6] = v16;
  uint64_t v29 = objc_msgSend_renderResourceForSkinner_baseMesh_dataKind_provider_(resourceManager, v28, (uint64_t)skinner, v16, dataKind, v58);
  uint64_t v30 = v29;
  if (v29)
  {
    self->_vertexWeightIndicesBuffer = (MTLBuffer *)*(id *)(v29 + 24);
    self->_boneIndicesBuffer = (MTLBuffer *)*(id *)(v30 + 32);
    v31 = *(void **)(v30 + 40);
  }
  else
  {
    self->_vertexWeightIndicesBuffer = 0;
    v31 = 0;
    self->_boneIndicesBuffer = 0;
  }
  self->_boneWeightsBuffer = (MTLBuffer *)v31;
  BOOL skinNormals = self->_skinNormals;
  id v32 = objc_alloc_init(MEMORY[0x1E4F35228]);
  objc_msgSend_setConstantValue_type_withName_(v32, v33, (uint64_t)&skinNormals, 53, @"needNormal");
  BOOL skinTangents = self->_skinTangents;
  objc_msgSend_setConstantValue_type_withName_(v32, v34, (uint64_t)&skinTangents, 53, @"needTangent");
  if (v30)
  {
    int v36 = *(_DWORD *)(v30 + 8);
    int v37 = *(_DWORD *)(v30 + 16);
  }
  else
  {
    int v36 = 0;
    int v37 = 0;
  }
  int v54 = v37;
  int v55 = v36;
  objc_msgSend_setConstantValue_type_withName_(v32, v35, (uint64_t)&v55, 33, @"weight_index_size");
  objc_msgSend_setConstantValue_type_withName_(v32, v38, (uint64_t)&v54, 33, @"bone_index_size");
  uint64_t v41 = 84;
  if (!skinTangents) {
    uint64_t v41 = 45;
  }
  uint64_t v42 = 78;
  if (!skinNormals) {
    uint64_t v42 = 45;
  }
  uint64_t v43 = objc_msgSend_stringWithFormat_(NSString, v39, @"Int%d_Int%d_%c%c", v40, (8 * v55), (8 * v54), v42, v41);
  self->_useFallbackCopyKernel = v30 == 0;
  if (v30)
  {
    uint64_t v47 = v43;
    v48 = @"skin_var";
  }
  else
  {
    uint64_t v49 = 84;
    if (!skinTangents) {
      uint64_t v49 = 45;
    }
    uint64_t v50 = 78;
    if (!skinNormals) {
      uint64_t v50 = 45;
    }
    uint64_t v47 = objc_msgSend_stringWithFormat_(NSString, v44, @"%c%c", v46, v50, v49);
    v48 = @"skin_copy_as_fallback";
  }
  v51 = self->_resourceManager;
  uint64_t v52 = objc_msgSend_stageInputDescriptor(a3, v44, v45, v46);
  self->_computePipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v51, v53, (uint64_t)v48, v52, 0, v32, v47);
}

- (id)makeReadOnlyBuffersWithBaseGeometry:(__CFXGeometry *)a3 baseMesh:(__CFXMesh *)a4 blitEncoder:(id)a5
{
  uint64_t v14 = (void *)sub_1B63CD09C((uint64_t)self->_skinner);
  if (!v14) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v8, v9, v10, v11, v12, v13, (uint64_t)"skin");
  }
  uint64_t v15 = objc_alloc_init(VFXMTLSkinDeformerReadOnlyBuffers);
  v148 = 0;
  v149 = 0;
  v147 = 0;
  sub_1B65315EC(v14, &v149, &v148, &v147);
  int v146 = 0;
  uint64_t v16 = sub_1B64AD1D4((uint64_t)a4, &v146);
  int v17 = sub_1B6531674((uint64_t)v14);
  int v24 = v17;
  unsigned int v25 = v17 - 129;
  uint64_t v26 = 1;
  if ((v17 - 129) < 0xFFFFFF80) {
    uint64_t v26 = 2;
  }
  if (v17 >= 1) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = 4;
  }
  if (self->_dataKind == 1 && v16)
  {
    uint64_t baseVertexCount = self->_baseVertexCount;
    if (baseVertexCount == v146)
    {
      unint64_t v144 = v27;
      uint64_t v29 = (char *)malloc_type_malloc(4 * (baseVertexCount + 1), 0x470B5C9AuLL);
      uint64_t v30 = v29;
      *(_DWORD *)uint64_t v29 = 0;
      LODWORD(v31) = self->_baseVertexCount;
      id v143 = a5;
      if (v31)
      {
        int v32 = 0;
        unint64_t v33 = 0;
        uint64_t v34 = 0;
        v35 = v149;
        do
        {
          unsigned int v36 = v35[*(_DWORD *)(v16 + 4 * v33) + 1] - v35[*(unsigned int *)(v16 + 4 * v33)];
          v34 += v36;
          v32 += v36;
          *(_DWORD *)&v29[4 * v33 + 4] = v32;
          unint64_t v31 = self->_baseVertexCount;
          ++v33;
        }
        while (v33 < v31);
        unsigned int v37 = v34 - 1;
        if ((int)v34 - 1 >= 0)
        {
          if (v37 >> 15)
          {
            unint64_t v38 = 4;
          }
          else
          {
            BOOL v44 = v37 > 0x7F;
            unint64_t v38 = 1;
            if (v44) {
              unint64_t v38 = 2;
            }
          }
          goto LABEL_60;
        }
      }
      else
      {
        uint64_t v34 = 0;
      }
      unint64_t v38 = 8;
LABEL_60:
      if (v38 >= 4) {
        uint64_t v65 = 4;
      }
      else {
        uint64_t v65 = v38;
      }
      size_t v66 = v65 * (v31 + 1);
      unint64_t v141 = v65;
      size_t v142 = v66;
      if (v65 == 1)
      {
        v72 = (char *)malloc_type_malloc(v66, 0xE2978E3uLL);
        v68 = v72;
        unsigned int v73 = 0;
        do
        {
          v72[v73] = *(_DWORD *)&v30[4 * v73];
          ++v73;
        }
        while (v73 <= self->_baseVertexCount);
      }
      else if (v65 == 2)
      {
        v67 = (char *)malloc_type_malloc(v66, 0x1511BD51uLL);
        v68 = v67;
        uint64_t v69 = 0;
        unsigned int v70 = self->_baseVertexCount;
        if (v70 + 1 > 1) {
          uint64_t v71 = v70 + 1;
        }
        else {
          uint64_t v71 = 1;
        }
        do
        {
          *(_WORD *)&v67[2 * v69] = *(_DWORD *)&v30[4 * v69];
          ++v69;
        }
        while (v71 != v69);
      }
      else if (v38 <= 3)
      {
        v68 = 0;
      }
      else
      {
        v68 = v30;
      }
      char v74 = v25 < 0xFFFFFF80;
      if (v24 < 1) {
        char v74 = 2;
      }
      uint64_t v75 = v34 << v74;
      v76 = (char *)malloc_type_malloc(v34 << v74, 0xB8818457uLL);
      uint64_t v77 = 4 * v34;
      v78 = (const char *)malloc_type_malloc(4 * v34, 0xF3798413uLL);
      if (v144 == 1)
      {
        unint64_t v90 = self->_baseVertexCount;
        uint64_t v80 = v142;
        if (v90)
        {
          uint64_t v91 = 0;
          do
          {
            int v92 = *(_DWORD *)&v30[4 * v91];
            unint64_t v93 = v91 + 1;
            uint64_t v94 = (*(_DWORD *)&v30[4 * v91 + 4] - v92);
            if (v94)
            {
              uint64_t v95 = v149[*(unsigned int *)(v16 + 4 * v91)];
              do
              {
                v76[v92] = *(_WORD *)&v148[2 * v95];
                *(_DWORD *)&v78[4 * v92++] = *(_DWORD *)&v147[4 * v95++];
                --v94;
              }
              while (v94);
              unint64_t v90 = self->_baseVertexCount;
            }
            ++v91;
          }
          while (v93 < v90);
        }
      }
      else if (v144 == 2)
      {
        uint64_t v79 = self->_baseVertexCount;
        uint64_t v80 = v142;
        if (v79)
        {
          uint64_t v81 = 0;
          v83 = v148;
          v82 = v149;
          v84 = v147;
          int v85 = *(_DWORD *)v30;
          do
          {
            uint64_t v86 = v81 + 1;
            int v87 = *(_DWORD *)&v30[4 * v81 + 4];
            uint64_t v88 = (v87 - v85);
            if (v87 != v85)
            {
              uint64_t v89 = v82[*(unsigned int *)(v16 + 4 * v81)];
              do
              {
                *(_WORD *)&v76[2 * v85] = *(_WORD *)&v83[2 * v89];
                *(_DWORD *)&v78[4 * v85++] = *(_DWORD *)&v84[4 * v89++];
                --v88;
              }
              while (v88);
            }
            int v85 = v87;
            uint64_t v81 = v86;
          }
          while (v86 != v79);
        }
      }
      else
      {
        uint64_t v80 = v142;
        if (v24 <= 0)
        {
          unint64_t v96 = self->_baseVertexCount;
          if (v96)
          {
            uint64_t v97 = 0;
            v99 = v148;
            v98 = v149;
            v100 = v147;
            do
            {
              int v101 = *(_DWORD *)&v30[4 * v97];
              unint64_t v102 = v97 + 1;
              uint64_t v103 = (*(_DWORD *)&v30[4 * v97 + 4] - v101);
              if (v103)
              {
                uint64_t v104 = v98[*(unsigned int *)(v16 + 4 * v97)];
                do
                {
                  *(_DWORD *)&v76[4 * v101] = *(__int16 *)&v99[2 * v104];
                  *(_DWORD *)&v78[4 * v101++] = *(_DWORD *)&v100[4 * v104++];
                  --v103;
                }
                while (v103);
                unint64_t v96 = self->_baseVertexCount;
              }
              ++v97;
            }
            while (v102 < v96);
          }
        }
      }
      if (v15)
      {
        v15->_vertexWeightIndexSize = v141;
        v15->_boneIndexSize = v144;
      }
      id v105 = (id)sub_1B653D738((uint64_t)self->_resourceManager, v68, v80, v143);
      if (v15) {
        objc_setProperty_nonatomic(v15, v106, v105, 24);
      }
      id v107 = (id)sub_1B653D738((uint64_t)self->_resourceManager, v76, v75, v143);
      if (v15) {
        objc_setProperty_nonatomic(v15, v108, v107, 32);
      }
      id v109 = (id)sub_1B653D738((uint64_t)self->_resourceManager, v78, v77, v143);
      if (v15) {
        objc_setProperty_nonatomic(v15, v110, v109, 40);
      }
      if (v68 != v30) {
        free(v30);
      }
      free(v68);
      free(v76);
      v111 = (char *)v78;
      goto LABEL_114;
    }
    goto LABEL_26;
  }
  unint64_t v145 = v27;
  uint64_t v40 = sub_1B641E308((uint64_t)v14);
  uint64_t baseVertexCount = self->_baseVertexCount;
  if (v40 != baseVertexCount)
  {
LABEL_26:
    sub_1B63F2F54(16, @"Error: Skinning internal consistency error - vertex count mismatch ('%d == %d' assertion failed)", v18, v19, v20, v21, v22, v23, baseVertexCount);
LABEL_27:

    return 0;
  }
  if (v147) {
    uint64_t v40 = sub_1B6531614((uint64_t)v14, v39, v18, v19, v20, v21, v22, v23);
  }
  id v41 = a5;
  unsigned int v42 = v40 - 1;
  if ((int)v40 - 1 < 0)
  {
    unint64_t v46 = 8;
  }
  else
  {
    unsigned int v43 = v42 >> 15;
    BOOL v44 = v42 > 0x7F;
    uint64_t v45 = 1;
    if (v44) {
      uint64_t v45 = 2;
    }
    if (v43) {
      unint64_t v46 = 4;
    }
    else {
      unint64_t v46 = v45;
    }
  }
  BOOL v48 = v25 < 0xFFFFFF80;
  if (v46 >= 4) {
    uint64_t v49 = 4;
  }
  else {
    uint64_t v49 = v46;
  }
  if (v24 >= 1) {
    char v50 = v48;
  }
  else {
    char v50 = 2;
  }
  size_t v51 = v49 * (self->_baseVertexCount + 1);
  uint64_t v52 = (const char *)malloc_type_malloc(v51, 0x46BE9AA9uLL);
  v53 = (char *)v52;
  if (v49 == 2)
  {
    v57 = v149;
    unsigned int v58 = self->_baseVertexCount;
    if (v58 + 1 > 1) {
      uint64_t v59 = v58 + 1;
    }
    else {
      uint64_t v59 = 1;
    }
    if (v149)
    {
      v60 = (char *)v52;
      v56 = v41;
      do
      {
        uint64_t v61 = *v57++;
        *(_WORD *)v60 = v61;
        v60 += 2;
        --v59;
      }
      while (v59);
    }
    else
    {
      v56 = v41;
      do
      {
        *(_WORD *)&v52[2 * (void)v57] = (_WORD)v57;
        v57 = (uint64_t *)((char *)v57 + 1);
      }
      while ((uint64_t *)v59 != v57);
    }
  }
  else if (v49 == 1)
  {
    unsigned int v54 = v149;
    if (v149)
    {
      unsigned int v55 = 0;
      v56 = v41;
      do
      {
        v52[v55] = v149[v55];
        ++v55;
      }
      while (v55 <= self->_baseVertexCount);
    }
    else
    {
      v56 = v41;
      do
      {
        v52[v54] = v54;
        ++v54;
      }
      while (v54 <= self->_baseVertexCount);
    }
  }
  else
  {
    BOOL v62 = v46 >= 4;
    v56 = v41;
    if (v62)
    {
      v63 = v149;
      if (v149)
      {
        unsigned int v64 = 0;
        do
        {
          *(_DWORD *)&v52[4 * v64] = v63[v64];
          ++v64;
        }
        while (v64 <= self->_baseVertexCount);
      }
      else
      {
        do
        {
          *(_DWORD *)&v52[4 * v63] = v63;
          LODWORD(v63) = v63 + 1;
        }
        while (v63 <= self->_baseVertexCount);
      }
    }
  }
  size_t v112 = v40 << v50;
  id v113 = (id)sub_1B653D738((uint64_t)self->_resourceManager, v52, v51, v56);
  if (v15) {
    objc_setProperty_nonatomic(v15, v114, v113, 24);
  }
  free(v53);
  if (!v148 || !v147)
  {
    v125 = (char *)malloc_type_calloc(v112, 1uLL, 0x6EAA3EE7uLL);
LABEL_136:
    id v127 = (id)sub_1B653D738((uint64_t)self->_resourceManager, v125, v112, v56);
    if (v15) {
      objc_setProperty_nonatomic(v15, v128, v127, 32);
    }
    free(v125);
    goto LABEL_139;
  }
  if (v40 >= 1)
  {
    uint64_t v121 = 0;
    unsigned int v122 = 1;
    while (1)
    {
      uint64_t v123 = *(__int16 *)&v148[2 * v121];
      if ((int)v123 >= v24) {
        break;
      }
      uint64_t v121 = v122;
      BOOL v44 = v40 <= v122++;
      if (v44) {
        goto LABEL_129;
      }
    }
    sub_1B63F2F54(16, @"Error: Skinning internal consistency error - out of range bone index ('%d < %d' assertion failed)", v115, v116, v117, v118, v119, v120, v123);
    goto LABEL_27;
  }
LABEL_129:
  if (v145 != 2)
  {
    if (v145 == 1)
    {
      v124 = (char *)malloc_type_malloc(v112, 0x95876FBDuLL);
      v125 = v124;
      if (v40 >= 1)
      {
        uint64_t v126 = 0;
        do
        {
          v124[v126] = *(_WORD *)&v148[2 * v126];
          ++v126;
        }
        while (v40 > v126);
      }
    }
    else
    {
      if (v24 > 0) {
        goto LABEL_139;
      }
      v138 = (char *)malloc_type_malloc(v112, 0xF1AD175CuLL);
      v125 = v138;
      if (v40 >= 1)
      {
        uint64_t v139 = 0;
        v140 = v148;
        do
        {
          *(_DWORD *)&v138[4 * v139] = *(__int16 *)&v140[2 * v139];
          ++v139;
        }
        while (v40 > v139);
      }
    }
    goto LABEL_136;
  }
  id v136 = (id)sub_1B653D738((uint64_t)self->_resourceManager, v148, v112, v56);
  if (v15) {
    objc_setProperty_nonatomic(v15, v137, v136, 32);
  }
LABEL_139:
  if (v147)
  {
    id v129 = (id)sub_1B653D738((uint64_t)self->_resourceManager, v147, 4 * v40, v56);
    if (!v15) {
      return v15;
    }
    objc_setProperty_nonatomic(v15, v130, v129, 40);
LABEL_147:
    v15->_vertexWeightIndexSize = v49;
    v15->_boneIndexSize = v145;
    return v15;
  }
  v131 = (const char *)malloc_type_malloc(4 * v40, 0x2FD854BEuLL);
  v132 = (char *)v131;
  if (v40 >= 1)
  {
    uint64_t v133 = 0;
    do
      *(_DWORD *)&v131[4 * v133++] = 1065353216;
    while (v40 > v133);
  }
  id v134 = (id)sub_1B653D738((uint64_t)self->_resourceManager, v131, 4 * v40, v56);
  if (v15)
  {
    objc_setProperty_nonatomic(v15, v135, v134, 40);
    free(v132);
    goto LABEL_147;
  }
  v111 = v132;
LABEL_114:
  free(v111);
  return v15;
}

- (unint64_t)updateWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5 tangents:(id)a6
{
  unint64_t v11 = objc_msgSend_currentFrameHash(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (self->_currentFrameHash == v11) {
    return 0;
  }
  self->_currentFrameHash = v11;
  uint64_t v16 = (void **)objc_msgSend_currentComputeEncoder(a3, v12, v13, v14);
  objc_msgSend_resetCache(*v16, v17, v18, v19);
  if (self->_useFallbackCopyKernel)
  {
    uint64_t v23 = 1;
  }
  else
  {
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v20, (uint64_t)self->_vertexWeightIndicesBuffer, 0, 1);
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v24, (uint64_t)self->_boneIndicesBuffer, 0, 2);
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v25, (uint64_t)self->_boneWeightsBuffer, 0, 3);
    v62[0] = 0;
    uint64_t v26 = sub_1B6525800((uint64_t)self->_skinner, v62);
    objc_msgSend_setBytes_length_atIndex_(*v16, v27, v26, 16 * v62[0], 4);
    uint64_t v23 = 5;
  }
  unsigned int v61 = objc_msgSend_length(a4, v20, v21, v22) / 0xCuLL;
  if (self->_baseVertexCount != v61) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Wrong vertex count for skinned positions", v29, v30, v31, v32, v33, v34, (uint64_t)"_baseVertexCount == effectiveDstPosCount");
  }
  objc_msgSend_setBytes_length_atIndex_(*v16, v28, (uint64_t)&v61, 4, 0);
  objc_msgSend_setBuffer_offset_atIndex_(*v16, v35, (uint64_t)a4, 0, v23);
  if (self->_skinNormals)
  {
    uint64_t v39 = v61;
    if (v39 != objc_msgSend_length(a5, v36, v37, v38) / 0xCuLL) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Wrong vertex count for skinned normals", v41, v42, v43, v44, v45, v46, (uint64_t)"effectiveDstPosCount == normalBuffer.length / (3 * sizeof(float))");
    }
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v40, (uint64_t)a5, 0, v23 + 1);
  }
  if (self->_skinTangents)
  {
    unint64_t v47 = v61;
    if (v47 > (unint64_t)objc_msgSend_length(a6, v36, v37, v38) >> 4) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Wrong vertex count for skinned tangents", v49, v50, v51, v52, v53, v54, (uint64_t)"effectiveDstPosCount <= tangentBuffer.length / (4 * sizeof(float))");
    }
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v48, (uint64_t)a6, 0, v23 | 2);
  }
  objc_msgSend_setStageInputOutputBuffersToEncoder_(a3, v36, (uint64_t)v16, v38);
  unsigned int v55 = *v16;
  memset(v62, 0, 24);
  v62[3] = v61;
  unint64_t v15 = 1;
  int64x2_t v63 = vdupq_n_s64(1uLL);
  objc_msgSend_setStageInRegion_(v55, v56, (uint64_t)v62, v57);
  uint64_t v58 = sub_1B653EFB8((uint64_t)self->_computePipeline);
  objc_msgSend_dispatchOnVertices_vertexCount_(*v16, v59, v58, v61);
  return v15;
}

@end