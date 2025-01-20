@interface VFXModelWrapDeformerParameters
+ (BOOL)supportsSecureCoding;
- (VFXModelWrapDeformerParameters)initWithCoder:(id)a3;
- (VFXModelWrapDeformerParameters)initWithDrivingNode:(__n128)a3 deformedNode:(__n128)a4 bindingMode:(__n128)a5 bindingTransform:(uint64_t)a6 drivingNodeUVChannel:(uint64_t)a7 deformedNodeUVChannel:(uint64_t)a8;
- (VFXModelWrapDeformerParameters)initWithInnerLayerNode:(__n128)a3 outerLayerNode:(__n128)a4 deformedNode:(__n128)a5 bindingMode:(uint64_t)a6 bindingTransform:(uint64_t)a7;
- (id)extraLayerMeshesWithDrivingMesh0:(__CFXMesh *)a3 drivingMesh1:(__CFXMesh *)a4;
- (unint64_t)bindingMode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initParametersIfNeededWithDrivingNodeRef:(__CFXNode *)a3 deformedNodeRef:(__CFXNode *)a4;
- (void)initParametersIfNeededWithInnerLayerNodeRef:(__CFXNode *)a3 outerLayerNodeRef:(__CFXNode *)a4 deformedNodeRef:(__CFXNode *)a5;
@end

@implementation VFXModelWrapDeformerParameters

- (VFXModelWrapDeformerParameters)initWithDrivingNode:(__n128)a3 deformedNode:(__n128)a4 bindingMode:(__n128)a5 bindingTransform:(uint64_t)a6 drivingNodeUVChannel:(uint64_t)a7 deformedNodeUVChannel:(uint64_t)a8
{
  v34.receiver = a1;
  v34.super_class = (Class)VFXModelWrapDeformerParameters;
  v16 = [(VFXModelWrapDeformerParameters *)&v34 init];
  v20 = v16;
  if (v16)
  {
    v16->_isLegacySingleLayerDeformer = 1;
    v16->_bindingMode = a9;
    *(__n128 *)v16->_anon_a0 = a2;
    *(__n128 *)&v16->_anon_a0[16] = a3;
    *(__n128 *)&v16->_anon_a0[32] = a4;
    *(__n128 *)&v16->_anon_a0[48] = a5;
    v16->_legacyDrivingNodeUVChannel = a10;
    v16->_legacyDeformedNodeUVChannel = a11;
    objc_msgSend_begin(VFXTransaction, v17, v18, v19);
    objc_msgSend_setAnimationDuration_(VFXTransaction, v21, v22, v23, 0.0);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_1B656544C;
    v33[3] = &unk_1E6144550;
    v33[4] = v20;
    v33[5] = a7;
    v33[6] = a8;
    objc_msgSend_enqueueCommandForObject_immediateTransactionBlock_(VFXTransaction, v24, a8, (uint64_t)v33);
    objc_msgSend_commit(VFXTransaction, v25, v26, v27);
  }
  return v20;
}

- (VFXModelWrapDeformerParameters)initWithInnerLayerNode:(__n128)a3 outerLayerNode:(__n128)a4 deformedNode:(__n128)a5 bindingMode:(uint64_t)a6 bindingTransform:(uint64_t)a7
{
  v32.receiver = a1;
  v32.super_class = (Class)VFXModelWrapDeformerParameters;
  v14 = [(VFXModelWrapDeformerParameters *)&v32 init];
  uint64_t v18 = v14;
  if (v14)
  {
    v14->_bindingMode = a10;
    *(__n128 *)v14->_anon_a0 = a2;
    *(__n128 *)&v14->_anon_a0[16] = a3;
    *(__n128 *)&v14->_anon_a0[32] = a4;
    *(__n128 *)&v14->_anon_a0[48] = a5;
    objc_msgSend_begin(VFXTransaction, v15, v16, v17);
    objc_msgSend_setAnimationDuration_(VFXTransaction, v19, v20, v21, 0.0);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1B65655B0;
    v31[3] = &unk_1E6144578;
    v31[4] = v18;
    v31[5] = a7;
    v31[6] = a8;
    v31[7] = a9;
    objc_msgSend_enqueueCommandForObject_immediateTransactionBlock_(VFXTransaction, v22, a9, (uint64_t)v31);
    objc_msgSend_commit(VFXTransaction, v23, v24, v25);
  }
  return v18;
}

- (void)dealloc
{
  free(self->_bindingData.pointIndices);
  free(self->_bindingData.barycentricCoords);
  free(self->_bindingData.innerLayerInfluences);
  free(self->_bindingData.innerLayerTNBs);
  free(self->_bindingData.outerLayerTNBs);
  free(self->_bindingData.innerLayerOffsets);
  free(self->_bindingData.outerLayerOffsets);
  free(self->_bindingData.legacyOffsetsOrTransforms);
  v3.receiver = self;
  v3.super_class = (Class)VFXModelWrapDeformerParameters;
  [(VFXModelWrapDeformerParameters *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)bindingMode
{
  return self->_bindingMode;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInt32_forKey_(a3, a2, self->_vertexCount, @"vertexCount");
  objc_msgSend_encodeInt32_forKey_(a3, v5, LODWORD(self->_bindingMode), @"bindingMode");
  objc_msgSend_encodeInt32_forKey_(a3, v6, LODWORD(self->_bindingData.pointIndicesStride), @"bindingPointIndicesStride");
  objc_msgSend_encodeInt32_forKey_(a3, v7, LODWORD(self->_bindingData.barycentricCoordsStride), @"bindingBarycentricCoordsStride");
  objc_msgSend_encodeInt32_forKey_(a3, v8, LODWORD(self->_bindingData.pointIndicesFormat), @"bindingPointIndicesFormat");
  objc_msgSend_encodeInt32_forKey_(a3, v9, LODWORD(self->_bindingData.barycentricCoordsFormat), @"bindingBarycentricCoordsFormat");
  objc_msgSend_encodeBytes_length_forKey_(a3, v10, (uint64_t)self->_bindingData.pointIndices, self->_bindingData.pointIndicesStride * self->_vertexCount, @"bindingPointIndices");
  objc_msgSend_encodeBytes_length_forKey_(a3, v11, (uint64_t)self->_bindingData.barycentricCoords, self->_bindingData.barycentricCoordsStride * self->_vertexCount, @"bindingBarycentricCoords");
  if (self->_isLegacySingleLayerDeformer)
  {
    objc_msgSend_encodeBool_forKey_(a3, v12, 1, @"isLegacySingleLayerDeformer");
    unint64_t legacyOffsetsOrTransformsLength = self->_bindingData.legacyOffsetsOrTransformsLength;
    p_unint64_t legacyOffsetsOrTransformsLength = (uint64_t *)&self->_bindingData.legacyOffsetsOrTransformsLength;
    objc_msgSend_encodeBytes_length_forKey_(a3, v15, *(p_legacyOffsetsOrTransformsLength - 1), legacyOffsetsOrTransformsLength, @"bindingOffsetsOrTransforms");
    uint64_t v17 = @"bindingOffsetsOrTransformsLength";
  }
  else
  {
    objc_msgSend_encodeBytes_length_forKey_(a3, v12, (uint64_t)self->_bindingData.innerLayerInfluences, self->_bindingData.innerLayerInfluencesLength, @"bindingInnerLayerInfluences");
    objc_msgSend_encodeInt32_forKey_(a3, v18, LODWORD(self->_bindingData.innerLayerInfluencesLength), @"bindingInnerLayerInfluencesLength");
    if (self->_bindingMode != 1) {
      return;
    }
    objc_msgSend_encodeBytes_length_forKey_(a3, v19, (uint64_t)self->_bindingData.innerLayerTNBs, self->_bindingData.tnbMatricesLength, @"bindingInnerTNBs");
    objc_msgSend_encodeBytes_length_forKey_(a3, v20, (uint64_t)self->_bindingData.outerLayerTNBs, self->_bindingData.tnbMatricesLength, @"bindingOuterTNBs");
    objc_msgSend_encodeInt32_forKey_(a3, v21, LODWORD(self->_bindingData.tnbMatricesLength), @"bindingSpaceVectorsLength");
    unint64_t offsetsLength = self->_bindingData.offsetsLength;
    p_unint64_t legacyOffsetsOrTransformsLength = (uint64_t *)&self->_bindingData.offsetsLength;
    objc_msgSend_encodeBytes_length_forKey_(a3, v23, *(p_legacyOffsetsOrTransformsLength - 2), offsetsLength, @"bindingInnerOffsets");
    objc_msgSend_encodeBytes_length_forKey_(a3, v24, *(p_legacyOffsetsOrTransformsLength - 1), *p_legacyOffsetsOrTransformsLength, @"bindingOuterOffsets");
    uint64_t v17 = @"bindingOffsetsLength";
  }
  uint64_t v25 = *(unsigned int *)p_legacyOffsetsOrTransformsLength;

  objc_msgSend_encodeInt32_forKey_(a3, v16, v25, (uint64_t)v17);
}

- (VFXModelWrapDeformerParameters)initWithCoder:(id)a3
{
  v54.receiver = self;
  v54.super_class = (Class)VFXModelWrapDeformerParameters;
  v6 = [(VFXModelWrapDeformerParameters *)&v54 init];
  if (v6)
  {
    v6->_uint64_t vertexCount = objc_msgSend_decodeInt32ForKey_(a3, v4, @"vertexCount", v5);
    v6->_bindingMode = (int)objc_msgSend_decodeInt32ForKey_(a3, v7, @"bindingMode", v8);
    v6->_bindingData.pointIndicesStride = (int)objc_msgSend_decodeInt32ForKey_(a3, v9, @"bindingPointIndicesStride", v10);
    v6->_bindingData.barycentricCoordsStride = (int)objc_msgSend_decodeInt32ForKey_(a3, v11, @"bindingBarycentricCoordsStride", v12);
    v6->_bindingData.pointIndicesFormat = objc_msgSend_decodeIntegerForKey_(a3, v13, @"bindingPointIndicesFormat", v14);
    v6->_bindingData.barycentricCoordsFormat = objc_msgSend_decodeIntegerForKey_(a3, v15, @"bindingBarycentricCoordsFormat", v16);
    uint64_t vertexCount = v6->_vertexCount;
    size_t v18 = v6->_bindingData.pointIndicesStride * vertexCount;
    size_t v19 = v6->_bindingData.barycentricCoordsStride * vertexCount;
    v6->_bindingData.pointIndices = malloc_type_malloc(v18, 0x72B1CC1DuLL);
    v6->_bindingData.barycentricCoords = malloc_type_malloc(v19, 0xE8A5F9FAuLL);
    size_t __n = 0;
    uint64_t v21 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v20, @"bindingPointIndices", (uint64_t)&__n);
    if (__n == v18) {
      memcpy(v6->_bindingData.pointIndices, v21, v18);
    }
    uint64_t v23 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v22, @"bindingBarycentricCoords", (uint64_t)&__n);
    if (__n == v19) {
      memcpy(v6->_bindingData.barycentricCoords, v23, v19);
    }
    int v26 = objc_msgSend_decodeBoolForKey_(a3, v24, @"isLegacySingleLayerDeformer", v25);
    v6->_isLegacySingleLayerDeformer = v26;
    if (v26)
    {
      int v29 = objc_msgSend_decodeInt32ForKey_(a3, v27, @"bindingOffsetsOrTransformsLength", v28);
      v6->_bindingData.unint64_t legacyOffsetsOrTransformsLength = v29;
      v6->_bindingData.legacyOffsetsOrTransforms = (float *)malloc_type_malloc(v29, 0x54AC07DBuLL);
      size_t __n = 0;
      uint64_t v31 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v30, @"bindingOffsetsOrTransforms", (uint64_t)&__n);
      size_t v32 = __n;
      if (__n == v6->_bindingData.legacyOffsetsOrTransformsLength)
      {
        v33 = (const void *)v31;
        legacyOffsetsOrTransforms = v6->_bindingData.legacyOffsetsOrTransforms;
LABEL_20:
        memcpy(legacyOffsetsOrTransforms, v33, v32);
      }
    }
    else
    {
      int v35 = objc_msgSend_decodeInt32ForKey_(a3, v27, @"bindingInnerLayerInfluencesLength", v28);
      v6->_bindingData.innerLayerInfluencesLength = v35;
      v6->_bindingData.innerLayerInfluences = (float *)malloc_type_malloc(v35, 0x46013DE7uLL);
      size_t __n = 0;
      v37 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v36, @"bindingInnerLayerInfluences", (uint64_t)&__n);
      if (__n == v6->_bindingData.innerLayerInfluencesLength) {
        memcpy(v6->_bindingData.innerLayerInfluences, v37, __n);
      }
      if (v6->_bindingMode == 1)
      {
        int v40 = objc_msgSend_decodeInt32ForKey_(a3, v38, @"bindingSpaceVectorsLength", v39);
        v6->_bindingData.tnbMatricesLength = v40;
        v6->_bindingData.innerLayerTNBs = (float *)malloc_type_malloc(v40, 0x43AD7ADDuLL);
        v6->_bindingData.outerLayerTNBs = (float *)malloc_type_malloc(v6->_bindingData.tnbMatricesLength, 0x9FAA6ACAuLL);
        size_t __n = 0;
        v42 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v41, @"bindingInnerTNBs", (uint64_t)&__n);
        if (__n == v6->_bindingData.tnbMatricesLength) {
          memcpy(v6->_bindingData.innerLayerTNBs, v42, __n);
        }
        v44 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v43, @"bindingOuterTNBs", (uint64_t)&__n);
        if (__n == v6->_bindingData.tnbMatricesLength) {
          memcpy(v6->_bindingData.outerLayerTNBs, v44, __n);
        }
        int v47 = objc_msgSend_decodeInt32ForKey_(a3, v45, @"bindingOffsetsLength", v46);
        v6->_bindingData.unint64_t offsetsLength = v47;
        v6->_bindingData.innerLayerOffsets = (float *)malloc_type_malloc(v47, 0x8CBC2B3DuLL);
        v6->_bindingData.outerLayerOffsets = (float *)malloc_type_malloc(v6->_bindingData.offsetsLength, 0xAD43F81CuLL);
        v49 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v48, @"bindingInnerOffsets", (uint64_t)&__n);
        if (__n == v6->_bindingData.offsetsLength) {
          memcpy(v6->_bindingData.innerLayerOffsets, v49, __n);
        }
        uint64_t v51 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v50, @"bindingOuterOffsets", (uint64_t)&__n);
        size_t v32 = __n;
        if (__n == v6->_bindingData.offsetsLength)
        {
          v33 = (const void *)v51;
          legacyOffsetsOrTransforms = v6->_bindingData.outerLayerOffsets;
          goto LABEL_20;
        }
      }
    }
  }
  return v6;
}

- (void)initParametersIfNeededWithDrivingNodeRef:(__CFXNode *)a3 deformedNodeRef:(__CFXNode *)a4
{
  if (!self->_vertexCount)
  {
    free(self->_bindingData.pointIndices);
    free(self->_bindingData.barycentricCoords);
    free(self->_bindingData.legacyOffsetsOrTransforms);
    uint64_t v14 = sub_1B649F5F4((uint64_t)a3, v7, v8, v9, v10, v11, v12, v13);
    uint64_t v22 = sub_1B63CCE68(v14, v15, v16, v17, v18, v19, v20, v21);
    uint64_t v30 = sub_1B649F5F4((uint64_t)a4, v23, v24, v25, v26, v27, v28, v29);
    uint64_t v38 = sub_1B63CCE68(v30, v31, v32, v33, v34, v35, v36, v37);
    v45 = sub_1B64ACF7C(v22, 0, v39, v40, v41, v42, v43, v44);
    v52 = sub_1B64ACF7C(v38, 0, v46, v47, v48, v49, v50, v51);
    uint64_t v115 = sub_1B64ACE9C(v22, 0, 0, v53, v54, v55, v56, v57);
    uint64_t v114 = sub_1B64ACE9C(v38, 0, 0, v58, v59, v60, v61, v62);
    unsigned int v70 = sub_1B641D8A0((uint64_t)v52, v63, v64, v65, v66, v67, v68, v69);
    self->_uint64_t vertexCount = v70;
    *(_OWORD *)&self->_bindingData.barycentricCoordsStride = xmmword_1B6E72290;
    v113 = malloc_type_malloc(4 * (v70 & 0x7FFFFFFF), 0x1000040BDFB0063uLL);
    self->_bindingData.barycentricCoords = v113;
    unsigned int v78 = sub_1B641D8A0((uint64_t)v45, v71, v72, v73, v74, v75, v76, v77) - 1;
    uint64_t v79 = 1;
    if (v78 > 0xFF) {
      uint64_t v79 = 2;
    }
    unsigned int v80 = HIWORD(v78);
    if (HIWORD(v78)) {
      uint64_t v81 = 4;
    }
    else {
      uint64_t v81 = v79;
    }
    unint64_t v82 = 3 << (v78 > 0xFF);
    if (v80) {
      unint64_t v82 = 12;
    }
    self->_bindingData.pointIndicesStride = v82;
    v83 = malloc_type_malloc(v82 * (unint64_t)self->_vertexCount, 0x62B93BFEuLL);
    self->_bindingData.pointIndices = v83;
    uint64_t v116 = (uint64_t)v52;
    uint64_t v117 = (uint64_t)v45;
    if (v81 == 1)
    {
      uint64_t v89 = 0;
      unint64_t v90 = 2;
      uint64_t v88 = (uint64_t)v83;
    }
    else
    {
      uint64_t v88 = 0;
      if (v81 == 2)
      {
        unint64_t v90 = 14;
        uint64_t v89 = (uint64_t)v83;
      }
      else
      {
        uint64_t v89 = 0;
        unint64_t v90 = 38;
      }
    }
    self->_bindingData.pointIndicesFormat = v90;
    if (v80) {
      uint64_t v91 = (uint64_t)v83;
    }
    else {
      uint64_t v91 = 0;
    }
    v98 = sub_1B64AC5F8(v22, 3, self->_legacyDrivingNodeUVChannel, 0, v84, v85, v86, v87);
    if (!v98) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v92, v93, v94, v95, v96, v97, (uint64_t)"driverTexcoordSource");
    }
    v105 = sub_1B64AC5F8(v38, 3, self->_legacyDeformedNodeUVChannel, 0, v94, v95, v96, v97);
    if (!v105) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v99, v100, v101, v102, v103, v104, (uint64_t)"deformedTexcoordSource");
    }
    uint64_t v106 = sub_1B64ACE9C(v22, 3, self->_legacyDrivingNodeUVChannel, v100, v101, v102, v103, v104);
    uint64_t v112 = sub_1B64ACE9C(v38, 3, self->_legacyDeformedNodeUVChannel, v107, v108, v109, v110, v111);
    sub_1B6541A00(self->_bindingMode, self->_vertexCount, v38, v22, v116, v117, (uint64_t)v105, (uint64_t)v98, *(float32x4_t *)self->_anon_a0, *(float32x4_t *)&self->_anon_a0[16], *(float32x4_t *)&self->_anon_a0[32], *(float32x4_t *)&self->_anon_a0[48], v114, v112, v115, v106, 0, v88, v89,
      v91,
      0,
      (uint64_t)v113,
      &self->_bindingData.legacyOffsetsOrTransforms,
      &self->_bindingData.legacyOffsetsOrTransformsLength);
  }
}

- (void)initParametersIfNeededWithInnerLayerNodeRef:(__CFXNode *)a3 outerLayerNodeRef:(__CFXNode *)a4 deformedNodeRef:(__CFXNode *)a5
{
  if (!self->_vertexCount)
  {
    free(self->_bindingData.pointIndices);
    free(self->_bindingData.barycentricCoords);
    free(self->_bindingData.innerLayerInfluences);
    free(self->_bindingData.innerLayerTNBs);
    free(self->_bindingData.outerLayerTNBs);
    free(self->_bindingData.innerLayerOffsets);
    free(self->_bindingData.outerLayerOffsets);
    uint64_t v16 = sub_1B649F5F4((uint64_t)a3, v9, v10, v11, v12, v13, v14, v15);
    uint64_t v24 = sub_1B63CCE68(v16, v17, v18, v19, v20, v21, v22, v23);
    uint64_t v32 = sub_1B649F5F4((uint64_t)a4, v25, v26, v27, v28, v29, v30, v31);
    uint64_t v40 = sub_1B63CCE68(v32, v33, v34, v35, v36, v37, v38, v39);
    uint64_t v48 = sub_1B649F5F4((uint64_t)a5, v41, v42, v43, v44, v45, v46, v47);
    uint64_t v56 = sub_1B63CCE68(v48, v49, v50, v51, v52, v53, v54, v55);
    v130 = sub_1B64ACF7C(v24, 0, v57, v58, v59, v60, v61, v62);
    v129 = sub_1B64ACF7C(v40, 0, v63, v64, v65, v66, v67, v68);
    int v131 = v56;
    uint64_t v75 = sub_1B64ACF7C(v56, 0, v69, v70, v71, v72, v73, v74);
    uint64_t v127 = sub_1B64ACE9C(v24, 0, 0, v76, v77, v78, v79, v80);
    uint64_t v126 = sub_1B64ACE9C(v40, 0, 0, v81, v82, v83, v84, v85);
    uint64_t v128 = (uint64_t)v75;
    unsigned int v93 = sub_1B641D8A0((uint64_t)v75, v86, v87, v88, v89, v90, v91, v92);
    self->_uint64_t vertexCount = v93;
    *(_OWORD *)&self->_bindingData.barycentricCoordsStride = xmmword_1B6E722A0;
    uint64_t v100 = malloc_type_malloc(8 * (v93 & 0x7FFFFFFF), 0x100004052888210uLL);
    uint64_t v101 = 0;
    self->_bindingData.barycentricCoords = v100;
    char v102 = 1;
    do
    {
      int v103 = v102 & 1;
      if (v102) {
        uint64_t v104 = v24;
      }
      else {
        uint64_t v104 = v40;
      }
      v105 = sub_1B64ACF7C(v104, 0, v94, v95, v96, v97, v98, v99);
      uint64_t v113 = sub_1B641D8A0((uint64_t)v105, v106, v107, v108, v109, v110, v111, v112);
      char v102 = 0;
      if (v101 <= v113) {
        uint64_t v101 = v113;
      }
    }
    while (v103);
    unsigned int v114 = v101 - 1;
    uint64_t v115 = 1;
    if ((v101 - 1) > 0xFF) {
      uint64_t v115 = 2;
    }
    unsigned int v116 = HIWORD(v114);
    if (HIWORD(v114)) {
      uint64_t v117 = 4;
    }
    else {
      uint64_t v117 = v115;
    }
    unint64_t v118 = 3 << ((v101 - 1) > 0xFF);
    if (v116) {
      unint64_t v118 = 12;
    }
    self->_bindingData.pointIndicesStride = v118;
    v119 = malloc_type_malloc(v118 * (unint64_t)self->_vertexCount, 0x6942BD84uLL);
    self->_bindingData.pointIndices = v119;
    if (v117 == 1)
    {
      uint64_t v121 = 0;
      unint64_t v122 = 2;
      uint64_t v120 = (uint64_t)v119;
    }
    else
    {
      uint64_t v120 = 0;
      if (v117 == 2)
      {
        unint64_t v122 = 14;
        uint64_t v121 = (uint64_t)v119;
      }
      else
      {
        uint64_t v120 = 0;
        uint64_t v121 = 0;
        unint64_t v122 = 38;
      }
    }
    self->_bindingData.pointIndicesFormat = v122;
    if (v116) {
      uint64_t v123 = (uint64_t)v119;
    }
    else {
      uint64_t v123 = 0;
    }
    unint64_t v124 = 4 * self->_vertexCount;
    self->_bindingData.innerLayerInfluencesLength = v124;
    v125 = (float *)malloc_type_malloc(v124, 0x72C4EE4DuLL);
    self->_bindingData.innerLayerInfluences = v125;
    sub_1B65426C8(self->_bindingMode, self->_vertexCount, v131, v24, v40, v128, (uint64_t)v130, (uint64_t)v129, *(__n128 *)self->_anon_a0, *(__n128 *)&self->_anon_a0[16], *(__n128 *)&self->_anon_a0[32], *(__n128 *)&self->_anon_a0[48], v127, v126, 1, v120, v121, v123, (uint64_t)v100,
      0,
      (uint64_t)v125,
      (void **)&self->_bindingData.innerLayerTNBs,
      (void **)&self->_bindingData.outerLayerTNBs,
      &self->_bindingData.tnbMatricesLength,
      (void **)&self->_bindingData.innerLayerOffsets,
      &self->_bindingData.outerLayerOffsets,
      &self->_bindingData.offsetsLength);
  }
}

- (id)extraLayerMeshesWithDrivingMesh0:(__CFXMesh *)a3 drivingMesh1:(__CFXMesh *)a4
{
  uint64_t v10 = sub_1B64ACF7C((uint64_t)a3, 0, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  uint64_t v17 = sub_1B64ACF7C((uint64_t)a4, 0, v11, v12, v13, v14, v15, v16);
  uint64_t v25 = sub_1B641D8A0((uint64_t)v10, v18, v19, v20, v21, v22, v23, v24);
  uint64_t v79 = a3;
  char v78 = sub_1B64ACE9C((uint64_t)a3, 0, 0, v26, v27, v28, v29, v30);
  uint64_t v80 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v31, 39, v32);
  CFAllocatorRef v33 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFAllocatorRef bytesDeallocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF90];
  for (unint64_t i = 1; i != 40; ++i)
  {
    uint64_t v41 = (const UInt8 *)malloc_type_malloc(12 * v25, 0x1D106E29uLL);
    if (v25 >= 1)
    {
      uint64_t v42 = 0;
      double v43 = (double)i * 0.025;
      *(float *)&double v43 = v43;
      float32x4_t v81 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v43, 0);
      unsigned int v44 = 2;
      unsigned int v45 = 1;
      do
      {
        *(double *)v46.i64 = sub_1B641E208((uint64_t)v10, v42, v35, v36, v37, v38, v39, v40);
        float32x4_t v82 = v46;
        *(double *)v53.i64 = sub_1B641E208((uint64_t)v17, v42, v47, v48, v49, v50, v51, v52);
        float32x4_t v54 = vmlaq_f32(v82, vsubq_f32(v53, v82), v81);
        *(_DWORD *)&v41[4 * v44 - 8] = v54.i32[0];
        *(_DWORD *)&v41[4 * v44 - 4] = v54.i32[1];
        *(_DWORD *)&v41[4 * v44] = v54.i32[2];
        uint64_t v42 = v45;
        v44 += 3;
      }
      while (v25 > v45++);
    }
    CFDataRef v56 = CFDataCreateWithBytesNoCopy(v33, v41, 12 * v25, bytesDeallocator);
    values = 0;
    values = (void *)sub_1B641CF98(v56, 0, v25, 3, 1, v57, v58, v59);
    CFArrayRef v60 = CFArrayCreate(v33, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    char v83 = v78;
    CFArrayRef v67 = (const __CFArray *)sub_1B64AD3C4((uint64_t)v79, 0, v61, v62, v63, v64, v65, v66);
    uint64_t v73 = (const void *)sub_1B63DC55C(v60, v67, (uint64_t)&v83, v68, v69, v70, v71, v72);
    objc_msgSend_addObject_(v80, v74, (uint64_t)v73, v75);
    CFRelease(v73);
    CFRelease(v60);
  }
  return v80;
}

@end