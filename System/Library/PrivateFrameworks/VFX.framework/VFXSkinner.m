@interface VFXSkinner
+ (BOOL)supportsSecureCoding;
+ (VFXSkinner)skinnerWithBaseMesh:(id)a3 bones:(id)a4 boneInverseBindTransforms:(id)a5 boneWeights:(id)a6 boneIndices:(id)a7;
+ (VFXSkinner)skinnerWithSkinnerRef:(__CFXSkinner *)a3;
+ (__CFXSkinner)_createSkinnerWithCompressedData:(id)a3 bonesCount:(unint64_t)a4 vertexCount:(unint64_t)a5;
+ (__CFXSkinner)_createSkinnerWithVertexCount:(int64_t)a3 bones:(id)a4 boneWeights:(id)a5 boneIndices:(id)a6 baseMesh:(id)a7;
+ (__CFXSkinner)createSkinnerWithBaseMesh:(id)a3 bones:(id)a4 boneWeights:(id)a5 boneIndices:(id)a6;
- (BOOL)_bonesAndIndicesCompression;
- (BOOL)_setSkeleton:(id)a3;
- (NSArray)boneInverseBindTransforms;
- (NSArray)bones;
- (VFXMesh)baseMesh;
- (VFXMeshSource)boneIndices;
- (VFXMeshSource)boneWeights;
- (VFXNode)skeleton;
- (VFXSkinner)initWithCoder:(id)a3;
- (VFXSkinner)initWithSkinnerRef:(__CFXSkinner *)a3;
- (__CFXSkinner)skinnerRef;
- (__CFXWorld)worldRef;
- (__n128)baseMeshBindTransform;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)world;
- (uint64_t)setBaseMeshBindTransform:(uint64_t)a3;
- (void)__CFObject;
- (void)_setBaseMesh:(id)a3;
- (void)_syncObjCModel;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBoneInverseBindTransforms:(id)a3;
- (void)setBones:(id)a3;
- (void)setSkeleton:(id)a3;
- (void)set_bonesAndIndicesCompression:(BOOL)a3;
@end

@implementation VFXSkinner

- (VFXSkinner)initWithSkinnerRef:(__CFXSkinner *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VFXSkinner;
  v4 = [(VFXSkinner *)&v14 init];
  if (v4)
  {
    v5 = (__CFXSkinner *)CFRetain(a3);
    v4->_skinner = v5;
    if (v5) {
      sub_1B6583684((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    }
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
  }
  return v4;
}

+ (VFXSkinner)skinnerWithSkinnerRef:(__CFXSkinner *)a3
{
  result = (VFXSkinner *)sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithSkinnerRef_(v6, v7, (uint64_t)a3, v8);
    return (VFXSkinner *)v9;
  }
  return result;
}

- (void)dealloc
{
  skinner = self->_skinner;
  if (skinner)
  {
    sub_1B6583684((uint64_t)skinner, 0, v2, v3, v4, v5, v6, v7);
    uint64_t v10 = self->_skinner;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B6526D10;
    v13[3] = &unk_1E6140A18;
    v13[4] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, 0, 0, v13);
  }
  objc_storeWeak((id *)&self->_skeleton, 0);

  v12.receiver = self;
  v12.super_class = (Class)VFXSkinner;
  [(VFXSkinner *)&v12 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = sub_1B65247EC((uint64_t)self->_skinner);
  uint64_t v5 = [VFXSkinner alloc];
  uint64_t v8 = objc_msgSend_initWithSkinnerRef_(v5, v6, (uint64_t)v4, v7);
  CFRelease(v4);
  uint64_t v12 = objc_msgSend_skeleton(self, v9, v10, v11);
  objc_msgSend__setSkeleton_(v8, v13, v12, v14);
  objc_msgSend__setBaseMesh_(v8, v15, (uint64_t)self->_baseMesh, v16);
  objc_msgSend_set_bonesAndIndicesCompression_(v8, v17, self->_bonesAndIndicesCompression, v18);
  return v8;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (__CFXSkinner)skinnerRef
{
  return self->_skinner;
}

- (VFXNode)skeleton
{
  return (VFXNode *)objc_loadWeak((id *)&self->_skeleton);
}

- (BOOL)_setSkeleton:(id)a3
{
  p_skeleton = &self->_skeleton;
  id Weak = objc_loadWeak((id *)&self->_skeleton);
  if (Weak != a3) {
    objc_storeWeak((id *)p_skeleton, a3);
  }
  return Weak != a3;
}

- (void)_syncObjCModel
{
  uint64_t v3 = sub_1B641E308((uint64_t)self->_skinner);
  if (v3)
  {
    uint64_t v7 = objc_msgSend_nodeWithNodeRef_(VFXNode, v4, v3, v6);
  }
  else
  {
    uint64_t v10 = objc_msgSend_bones(self, v4, v5, v6);
    uint64_t v7 = (uint64_t)sub_1B6526EC0(v10, v11);
    if (!v7) {
      return;
    }
  }

  objc_msgSend__setSkeleton_(self, v8, v7, v9);
}

- (void)setSkeleton:(id)a3
{
  uint64_t v6 = objc_msgSend_skeleton(self, a2, (uint64_t)a3, v3);
  if (objc_msgSend__setSkeleton_(self, v7, (uint64_t)a3, v8))
  {
    if (self->_skinner)
    {
      uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_1B65270B4;
      v14[3] = &unk_1E61411B8;
      v14[4] = self;
      v14[5] = a3;
      v14[6] = v6;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
    }
  }
}

- (BOOL)_bonesAndIndicesCompression
{
  return self->_bonesAndIndicesCompression;
}

- (void)set_bonesAndIndicesCompression:(BOOL)a3
{
  self->_bonesAndIndicesCompression = a3;
}

- (VFXMesh)baseMesh
{
  return self->_baseMesh;
}

- (void)_setBaseMesh:(id)a3
{
  if (a3)
  {
    baseMesh = self->_baseMesh;
    if (baseMesh != a3)
    {

      self->_baseMesh = (VFXMesh *)a3;
    }
  }
}

+ (__CFXSkinner)createSkinnerWithBaseMesh:(id)a3 bones:(id)a4 boneWeights:(id)a5 boneIndices:(id)a6
{
  uint64_t v11 = objc_msgSend_meshRef(a3, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v18 = sub_1B64ACF7C(v11, 0, v12, v13, v14, v15, v16, v17);
  uint64_t v27 = sub_1B641D8A0((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

  return (__CFXSkinner *)objc_msgSend__createSkinnerWithVertexCount_bones_boneWeights_boneIndices_baseMesh_(a1, v26, v27, (uint64_t)a4, a5, a6, a3);
}

+ (__CFXSkinner)_createSkinnerWithVertexCount:(int64_t)a3 bones:(id)a4 boneWeights:(id)a5 boneIndices:(id)a6 baseMesh:(id)a7
{
  uint64_t v11 = objc_msgSend_count(a4, a2, a3, (uint64_t)a4);
  __int16 v15 = v11;
  if (v11 < 2)
  {
    uint64_t v56 = objc_msgSend_meshRef(a7, v12, v13, v14);
    v57 = (size_t *)sub_1B6530DE4(a3, v15, 0, v56);
    sub_1B6531BCC((uint64_t)v57, 1);
  }
  else
  {
    uint64_t v16 = objc_msgSend_data(a5, v12, v13, v14);
    unint64_t v20 = objc_msgSend_length(v16, v17, v18, v19);
    unint64_t v24 = objc_msgSend_bytesPerComponent(a5, v21, v22, v23);
    v28 = objc_msgSend_data(a6, v25, v26, v27);
    unint64_t v32 = objc_msgSend_length(v28, v29, v30, v31);
    unint64_t v36 = objc_msgSend_bytesPerComponent(a6, v33, v34, v35);
    uint64_t v40 = objc_msgSend_vectorCount(a6, v37, v38, v39);
    if (v40 != objc_msgSend_vectorCount(a5, v41, v42, v43) || (unint64_t v51 = v20 / a3 / v24, v32 / a3 / v36 != v51))
    {
      v55 = @"Error: VFXSkinner: there must be the same number of bone weights and bone indices";
      goto LABEL_12;
    }
    if (!objc_msgSend_floatComponents(a5, v44, v45, v46)
      || objc_msgSend_bytesPerComponent(a5, v52, v45, v46) != 4)
    {
      goto LABEL_12;
    }
    if (objc_msgSend_bytesPerComponent(a6, v53, v45, v46) >= 3)
    {
      v55 = @"Error: VFXSkinner: bone indices must be uint8 or uint16 (maximum of 2 bytes)";
LABEL_12:
      sub_1B63F2F54(16, (uint64_t)v55, v45, v46, v47, v48, v49, v50, v120);
      return 0;
    }
    uint64_t v60 = objc_msgSend_dataStride(a6, v54, v45, v46);
    uint64_t v64 = objc_msgSend_componentsPerVector(a6, v61, v62, v63);
    if (v60 != objc_msgSend_bytesPerComponent(a6, v65, v66, v67) * v64)
    {
      v55 = @"Error: VFXSkinner: bone indices stride must be equal to componentsPerVector * bytesPerComponent";
      goto LABEL_12;
    }
    uint64_t v69 = objc_msgSend_dataStride(a5, v68, v45, v46);
    uint64_t v73 = objc_msgSend_componentsPerVector(a5, v70, v71, v72);
    if (v69 != objc_msgSend_bytesPerComponent(a5, v74, v75, v76) * v73)
    {
      v55 = @"Error: VFXSkinner: bone weights stride must be equal to componentsPerVector * bytesPerComponent";
      goto LABEL_12;
    }
    int64_t v78 = v51 * a3;
    uint64_t v79 = objc_msgSend_meshRef(a7, v77, v45, v46);
    v57 = (size_t *)sub_1B6530DE4(a3, v15, v51 * a3, v79);
    sub_1B6531BCC((uint64_t)v57, v51);
    uint64_t v122 = 0;
    v123 = 0;
    uint64_t v121 = 0;
    sub_1B65315EC(v57, &v123, &v122, &v121);
    v83 = v123;
    if (v123 && (a3 & 0x8000000000000000) == 0)
    {
      uint64_t v84 = 0;
      int64_t v85 = a3 + 1;
      do
      {
        *v83++ = v84 * v51;
        ++v84;
        --v85;
      }
      while (v85);
    }
    v86 = objc_msgSend_data(a6, v80, v81, v82);
    uint64_t v90 = objc_msgSend_bytes(v86, v87, v88, v89);
    v94 = objc_msgSend_data(a6, v91, v92, v93);
    uint64_t v98 = objc_msgSend_bytes(v94, v95, v96, v97);
    v102 = objc_msgSend_data(a5, v99, v100, v101);
    uint64_t v106 = objc_msgSend_bytes(v102, v103, v104, v105);
    uint64_t v110 = objc_msgSend_bytesPerComponent(a6, v107, v108, v109);
    if (v78 >= 1)
    {
      uint64_t v117 = v110;
      for (uint64_t i = 0; i != v78; ++i)
      {
        if (v117 == 1) {
          __int16 v119 = *(unsigned __int8 *)(v90 + i);
        }
        else {
          __int16 v119 = *(_WORD *)(v98 + 2 * i);
        }
        *(_WORD *)(v122 + 2 * i) = v119;
        if (v121) {
          *(_DWORD *)(v121 + 4 * i) = *(_DWORD *)(v106 + 4 * i);
        }
        if (v119 < 0)
        {
          sub_1B63F2F54(16, @"Error: skinner: invalid index (%d)", v111, v112, v113, v114, v115, v116, v119);
          *(_WORD *)(v122 + 2 * i) = -1;
        }
      }
    }
    sub_1B6531338(v57);
  }
  v58 = (__CFXSkinner *)sub_1B6524738(v57);
  CFRelease(v57);
  return v58;
}

+ (__CFXSkinner)_createSkinnerWithCompressedData:(id)a3 bonesCount:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  if (objc_msgSend_count(a3, a2, (uint64_t)a3, a4) != 3)
  {
    if (objc_msgSend_count(a3, v8, v9, v10) != 1) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. skinner: invalid compressed data", v40, v41, v42, v43, v44, v45, (uint64_t)"skinCompressedData.count == 1");
    }
    uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(a3, v39, 0, v41);
    uint64_t v33 = objc_msgSend_length(v26, v46, v47, v48);
    uint64_t v11 = 0;
    uint64_t v23 = 0;
    int v22 = 1;
    goto LABEL_13;
  }
  uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(a3, v8, 0, v10);
  if (objc_msgSend_length(v11, v12, v13, v14) == a5)
  {
    int v22 = 1;
    uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(a3, v15, 1, v17);
    uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(a3, v24, 2, v25);
    uint64_t v33 = objc_msgSend_length(v26, v27, v28, v29);
    if (v11)
    {
      uint64_t v34 = (unsigned __int8 *)objc_msgSend_bytes(v11, v30, v31, v32);
      if (a5)
      {
        unint64_t v35 = 1;
        unint64_t v36 = a5;
        do
        {
          unsigned int v38 = *v34++;
          unint64_t v37 = v38;
          if (v35 <= v38) {
            unint64_t v35 = v37;
          }
          --v36;
        }
        while (v36);
        int v22 = 0;
LABEL_14:
        uint64_t v49 = (void *)sub_1B6530DE4(a5, (__int16)a4, v33, 0);
        sub_1B6531BCC((uint64_t)v49, v35);
        if (a4 < 2)
        {
LABEL_50:
          v57 = (__CFXSkinner *)sub_1B6524738(v49);
          CFRelease(v49);
          return v57;
        }
        uint64_t v93 = 0;
        v94 = 0;
        uint64_t v92 = 0;
        sub_1B65315EC(v49, &v94, &v93, &v92);
        if (v22)
        {
          if (a5)
          {
            uint64_t v53 = 0;
            v54 = v94;
            unint64_t v55 = a5;
            do
            {
              if (v53 >= v33) {
                uint64_t v56 = v33 - 1;
              }
              else {
                uint64_t v56 = v53;
              }
              if (v53 < v33) {
                ++v53;
              }
              *v54++ = v56;
              --v55;
            }
            while (v55);
            goto LABEL_31;
          }
        }
        else
        {
          v58 = (unsigned __int8 *)objc_msgSend_bytes(v11, v50, v51, v52);
          if (a5)
          {
            uint64_t v53 = 0;
            v59 = v94;
            unint64_t v60 = a5;
            do
            {
              *v59++ = v53;
              unsigned int v61 = *v58++;
              v53 += v61;
              --v60;
            }
            while (v60);
            goto LABEL_31;
          }
        }
        uint64_t v53 = 0;
LABEL_31:
        v94[a5] = v53;
        v65 = (unsigned __int8 *)objc_msgSend_bytes(v26, v50, v51, v52);
        if (v23)
        {
          unint64_t v73 = objc_msgSend_length(v23, v62, v63, v64) / (unint64_t)v33;
          if (v73 == 2)
          {
            uint64_t v82 = (unsigned __int16 *)objc_msgSend_bytes(v23, v66, v67, v68);
            if (v33 >= 1)
            {
              uint64_t v84 = v92;
              v83 = v93;
              do
              {
                __int16 v85 = *v65++;
                *v83++ = v85;
                unsigned int v86 = *v82++;
                *v84++ = (float)v86 / 65535.0;
                --v33;
              }
              while (v33);
            }
          }
          else if (v73 == 1)
          {
            v74 = (unsigned __int8 *)objc_msgSend_bytes(v23, v66, v67, v68);
            if (v33 >= 1)
            {
              uint64_t v76 = v92;
              uint64_t v75 = v93;
              do
              {
                __int16 v77 = *v65++;
                *v75++ = v77;
                unsigned int v78 = *v74++;
                *v76++ = (float)v78 / 255.0;
                --v33;
              }
              while (v33);
            }
          }
          else
          {
            sub_1B63F2F54(16, @"Unreachable code: Unsupported bytes per weight", v67, v68, v69, v70, v71, v72, v91);
            if (v33 >= 1)
            {
              uint64_t v88 = v92;
              v87 = v93;
              do
              {
                __int16 v89 = *v65++;
                *v87++ = v89;
                *v88++ = 1.0;
                --v33;
              }
              while (v33);
            }
          }
        }
        else if (v33 >= 1)
        {
          v80 = v92;
          uint64_t v79 = v93;
          do
          {
            __int16 v81 = *v65++;
            *v79++ = v81;
            *v80++ = 1.0;
            --v33;
          }
          while (v33);
        }
        sub_1B6531338(v49);
        goto LABEL_50;
      }
      int v22 = 0;
    }
LABEL_13:
    LOWORD(v35) = 1;
    goto LABEL_14;
  }
  sub_1B63F2F54(16, @"Error: mismatch between the vertex count and the number of bones per vertex", v16, v17, v18, v19, v20, v21, v91);
  return 0;
}

+ (VFXSkinner)skinnerWithBaseMesh:(id)a3 bones:(id)a4 boneInverseBindTransforms:(id)a5 boneWeights:(id)a6 boneIndices:(id)a7
{
  if (!a4 || !objc_msgSend_count(a4, a2, (uint64_t)a3, (uint64_t)a4))
  {
    unint64_t v37 = @"Error: can't create a skinner with no bones";
LABEL_10:
    sub_1B63F2F54(16, (uint64_t)v37, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, v7, v38);
    return 0;
  }
  if (!a3)
  {
    unint64_t v37 = @"Error: can't create a skinner with no base mesh";
    goto LABEL_10;
  }
  uint64_t v15 = objc_msgSend_count(a4, v14, (uint64_t)a3, (uint64_t)a4);
  if (v15 != objc_msgSend_count(a5, v16, v17, v18))
  {
    unint64_t v37 = @"Error: bones count and bind transform count don't match";
    goto LABEL_10;
  }
  uint64_t SkinnerWithBaseMesh_bones_boneWeights_boneIndices = objc_msgSend_createSkinnerWithBaseMesh_bones_boneWeights_boneIndices_(a1, v19, (uint64_t)a3, (uint64_t)a4, a6, a7);
  if (!SkinnerWithBaseMesh_bones_boneWeights_boneIndices) {
    return 0;
  }
  uint64_t v21 = (const void *)SkinnerWithBaseMesh_bones_boneWeights_boneIndices;
  id v22 = objc_alloc((Class)a1);
  uint64_t v25 = objc_msgSend_initWithSkinnerRef_(v22, v23, (uint64_t)v21, v24);
  CFRelease(v21);
  objc_msgSend_setBones_(v25, v26, (uint64_t)a4, v27);
  objc_msgSend_setBoneInverseBindTransforms_(v25, v28, (uint64_t)a5, v29);
  objc_msgSend__setBaseMesh_(v25, v30, (uint64_t)a3, v31);
  uint64_t v33 = sub_1B6526EC0(a4, v32);
  objc_msgSend__setSkeleton_(v25, v34, (uint64_t)v33, v35);

  return (VFXSkinner *)v25;
}

- (__n128)baseMeshBindTransform
{
  uint64_t v5 = objc_msgSend_worldRef(a1, a2, a3, a4);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = sub_1B63CD09C(a1[1]);
  if (v14)
  {
    __n128 result = *(__n128 *)sub_1B653166C(v14);
    if (!v13) {
      return result;
    }
  }
  else
  {
    __n128 result = (__n128)VFXMatrix4Identity;
    if (!v13) {
      return result;
    }
  }
  __n128 v23 = result;
  sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v23;
}

- (uint64_t)setBaseMeshBindTransform:(uint64_t)a3
{
  uint64_t v9 = objc_msgSend_worldRef(a1, a2, a3, a4);
  uint64_t v17 = v9;
  if (v9) {
    sub_1B64B0C28(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  uint64_t result = sub_1B63CD09C(a1[1]);
  if (result) {
    uint64_t result = sub_1B6531660(result, a5, a6, a7, a8);
  }
  if (v17)
  {
    return sub_1B64B0CB4(v17, v19, v20, v21, v22, v23, v24, v25);
  }
  return result;
}

- (VFXMeshSource)boneWeights
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_1B6524E80((uint64_t)self->_skinner))
  {
    uint64_t v21 = 0;
    if (!v13) {
      return v21;
    }
    goto LABEL_27;
  }
  uint64_t v45 = v13;
  uint64_t v22 = (void *)sub_1B63CD09C((uint64_t)self->_skinner);
  uint64_t v23 = sub_1B641E308((uint64_t)v22);
  uint64_t v24 = (int)sub_1B6531BC4((uint64_t)v22);
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  sub_1B65315EC(v22, &v47, 0, &v48);
  uint64_t v26 = (float *)malloc_type_malloc(4 * v23 * v24, 0x9B7D2798uLL);
  if (v23 >= 1)
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = v47;
    uint64_t v46 = v48;
    uint64_t v31 = *v47;
    do
    {
      uint64_t v32 = v31;
      uint64_t v31 = v30[++v29];
      uint64_t v33 = v31 - v32;
      if (v31 - v32 >= v24) {
        uint64_t v34 = v24;
      }
      else {
        uint64_t v34 = v31 - v32;
      }
      if (v34 < 1)
      {
        uint64_t v34 = 0;
        float v36 = 0.0;
      }
      else
      {
        uint64_t v35 = (float *)(v46 + 4 * v27);
        float v36 = 0.0;
        uint64_t v37 = v34;
        do
        {
          float v38 = *v35++;
          float v36 = v36 + v38;
          v26[v28++] = v38;
          --v37;
        }
        while (v37);
        v27 += v34;
      }
      if (v24 > v34)
      {
        bzero(&v26[v28], 4 * (v24 - v34));
        uint64_t v28 = v28 + v24 - v34;
      }
      if (v33 > v24 && v36 > 0.0 && (int)v24 >= 1)
      {
        uint64_t v40 = &v26[v28 - v24];
        uint64_t v41 = v24;
        do
        {
          *uint64_t v40 = *v40 / v36;
          ++v40;
          --v41;
        }
        while (v41);
      }
    }
    while (v29 != v23);
  }
  uint64_t v42 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v25, (uint64_t)v26, 4 * v23 * v24, 1);
  uint64_t v21 = (VFXMeshSource *)objc_msgSend_meshSourceWithData_semantic_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(VFXMeshSource, v43, v42, @"kGeometrySourceSemanticBoneWeights", v23, 1, v24, 4, 0, 0);
  uint64_t v13 = v45;
  if (v45) {
LABEL_27:
  }
    sub_1B64B0CB4(v13, v14, v15, v16, v17, v18, v19, v20);
  return v21;
}

- (VFXMeshSource)boneIndices
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_1B6524E80((uint64_t)self->_skinner))
  {
    uint64_t v21 = 0;
    if (!v13) {
      return v21;
    }
    goto LABEL_26;
  }
  uint64_t v56 = v13;
  uint64_t v22 = (void *)sub_1B63CD09C((uint64_t)self->_skinner);
  uint64_t v23 = (int)sub_1B6531BC4((uint64_t)v22);
  uint64_t v24 = sub_1B641E308((uint64_t)v22);
  v57 = 0;
  uint64_t v58 = 0;
  uint64_t v55 = (uint64_t)v22;
  sub_1B65315EC(v22, &v57, &v58, 0);
  uint64_t v32 = malloc_type_malloc(2 * v23 * v24, 0xBC423831uLL);
  if (v24 < 1)
  {
    uint64_t v34 = 0;
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    float v36 = v57;
    uint64_t v37 = v58;
    uint64_t v38 = *v57;
    do
    {
      uint64_t v39 = v38;
      uint64_t v38 = v36[++v35];
      uint64_t v40 = v38 - v39;
      if (v40 >= v23) {
        uint64_t v41 = v23;
      }
      else {
        uint64_t v41 = v40;
      }
      if (v41 < 1)
      {
        uint64_t v41 = 0;
      }
      else
      {
        uint64_t v42 = (__int16 *)(v37 + 2 * v33);
        uint64_t v43 = v41;
        do
        {
          __int16 v44 = *v42++;
          v32[v34++] = v44;
          --v43;
        }
        while (v43);
        v33 += v41;
      }
      if (v23 > v41)
      {
        bzero(&v32[v34], 2 * (v23 - v41));
        uint64_t v34 = v34 + v23 - v41;
      }
    }
    while (v35 != v24);
  }
  if (v33 > sub_1B6531614(v55, v25, v26, v27, v28, v29, v30, v31)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. boneIndices - failed to deindex", v46, v47, v48, v49, v50, v51, (uint64_t)"r <= CFXSkinGetWeightsCount(skin)");
  }
  if (v34 != v24 * v23) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. boneIndices - failed to deindex (2)", v46, v47, v48, v49, v50, v51, (uint64_t)"w == numberOfInfluence * vertexCount");
  }
  uint64_t v52 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v45, (uint64_t)v32, 2 * v24 * v23, 1);
  uint64_t v21 = (VFXMeshSource *)objc_msgSend__modelSourceWithData_semantic_vectorCount_componentType_componentCount_dataOffset_dataStride_(VFXMeshSource, v53, v52, @"kGeometrySourceSemanticBoneIndices", v24, 13, v23, 0, 0);
  uint64_t v13 = v56;
  if (v56) {
LABEL_26:
  }
    sub_1B64B0CB4(v13, v14, v15, v16, v17, v18, v19, v20);
  return v21;
}

- (NSArray)boneInverseBindTransforms
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = sub_1B63CD09C((uint64_t)self->_skinner);
  uint64_t v22 = (NSArray *)v14;
  if (v14)
  {
    LODWORD(v23) = sub_1B6531674(v14);
    uint64_t v24 = sub_1B6451F14((uint64_t)v22);
    uint64_t v22 = (NSArray *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v25, (int)v23, v26);
    if ((int)v23 >= 1)
    {
      uint64_t v23 = (unsigned __int16)v23;
      uint64_t v27 = (double *)(v24 + 32);
      do
      {
        uint64_t v28 = objc_msgSend_valueWithVFXMatrix4_(MEMORY[0x1E4F29238], v15, v16, v17, *(v27 - 4), *(v27 - 2), *v27, v27[2]);
        objc_msgSend_addObject_(v22, v29, v28, v30);
        v27 += 8;
        --v23;
      }
      while (v23);
    }
  }
  if (v13) {
    sub_1B64B0CB4(v13, (uint64_t)v15, v16, v17, v18, v19, v20, v21);
  }
  return v22;
}

- (void)setBoneInverseBindTransforms:(id)a3
{
  uint64_t v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  uint64_t v14 = v6;
  if (v6)
  {
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    uint64_t v22 = sub_1B63CD09C((uint64_t)self->_skinner);
    if (!v22)
    {
LABEL_10:
      sub_1B64B0CB4(v14, v15, v16, v17, v18, v19, v20, v21);
      return;
    }
  }
  else
  {
    uint64_t v22 = sub_1B63CD09C((uint64_t)self->_skinner);
    if (!v22) {
      return;
    }
  }
  uint64_t v23 = (int)sub_1B6531674(v22);
  if (objc_msgSend_count(a3, v24, v25, v26) != v23)
  {
    objc_msgSend_count(a3, v27, v28, v29);
    sub_1B63F2F54(16, @"Error: number of transforms (%d) doesn't match the number of joints (%d)", v43, v44, v45, v46, v47, v48, v23);
    return;
  }
  uint64_t v30 = sub_1B6451F14(v22);
  if (v23)
  {
    uint64_t v33 = 0;
    uint64_t v34 = (_OWORD *)(v30 + 32);
    do
    {
      uint64_t v35 = objc_msgSend_objectAtIndex_(a3, v31, v33, v32);
      objc_msgSend_VFXMatrix4Value(v35, v36, v37, v38);
      *(v34 - 2) = v39;
      *(v34 - 1) = v40;
      *uint64_t v34 = v41;
      v34[1] = v42;
      v34 += 4;
      ++v33;
    }
    while (v23 != v33);
  }
  sub_1B6531210(v22);
  if (v14) {
    goto LABEL_10;
  }
}

- (NSArray)bones
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = (void *)sub_1B6451F14((uint64_t)self->_skinner);
  uint64_t v18 = objc_msgSend_copy(v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_count(v18, v19, v20, v21);
  uint64_t v27 = (NSArray *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v23, v22, v24);
  if (v22)
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      uint64_t v29 = objc_msgSend_objectAtIndex_(v18, v25, i, v26);
      uint64_t v32 = objc_msgSend_nodeWithNodeRef_(VFXNode, v30, v29, v31);
      objc_msgSend_addObject_(v27, v33, v32, v34);
    }
  }

  if (v13) {
    sub_1B64B0CB4(v13, v35, v36, v37, v38, v39, v40, v41);
  }
  return v27;
}

- (void)setBones:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v7 = objc_msgSend_count(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_arrayWithCapacity_(v6, v8, v7, v9);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v11, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(a3);
        }
        uint64_t v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_nodeRef(v19, v13, v14, v15);
        objc_msgSend_addObject_(v10, v21, v20, v22);
        objc_msgSend_setIsJoint_(v19, v23, 1, v24);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v13, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v16);
  }
  uint64_t v25 = objc_msgSend_worldRef(self, v13, v14, v15);
  if (v25)
  {
    uint64_t v33 = v25;
    sub_1B64B0C28(v25, v26, v27, v28, v29, v30, v31, v32);
    sub_1B65248F4((uint64_t)self->_skinner, v10);
    sub_1B64B0CB4(v33, v34, v35, v36, v37, v38, v39, v40);
  }
  else
  {
    sub_1B65248F4((uint64_t)self->_skinner, v10);
  }
}

- (void)__CFObject
{
  return self->_skinner;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = objc_msgSend_skeleton(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, @"skeleton");
  uint64_t v11 = objc_msgSend_baseMesh(self, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(a3, v12, v11, @"baseMesh");
  objc_msgSend_baseMeshBindTransform(self, v13, v14, v15);
  sub_1B64FA3B8(a3, (const char *)@"baseMeshBindTransform", v16, v17, v18, v19);
  uint64_t v23 = objc_msgSend_bones(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(a3, v24, (uint64_t)v23, @"bones");
  if ((unint64_t)objc_msgSend_count(v23, v25, v26, v27) >= 2)
  {
    if (self->_bonesAndIndicesCompression)
    {
      uint64_t v31 = (void *)sub_1B63CD09C((uint64_t)self->_skinner);
      uint64_t v32 = sub_1B641E308((uint64_t)v31);
      uint64_t v40 = sub_1B6531614((uint64_t)v31, v33, v34, v35, v36, v37, v38, v39);
      int v41 = sub_1B6531BC4((uint64_t)v31);
      uint64_t v107 = 0;
      uint64_t v108 = 0;
      uint64_t v106 = 0;
      sub_1B65315EC(v31, &v107, &v106, &v108);
      long long v44 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v42, v40, v43);
      uint64_t v48 = objc_msgSend_bytes(v44, v45, v46, v47);
      if (v40 >= 1)
      {
        uint64_t v56 = v48;
        for (uint64_t i = 0; i != v40; ++i)
        {
          unsigned int v58 = *(__int16 *)(v106 + 2 * i);
          if (v58 >= 0x100)
          {
            sub_1B63F2F54(16, @"Error: Bones index too large for compressed representation : %d", v50, v51, v52, v53, v54, v55, *(__int16 *)(v106 + 2 * i));
            LOWORD(v58) = *(_WORD *)(v106 + 2 * i);
          }
          *(unsigned char *)(v56 + i) = v58;
        }
      }
      if (v41 <= 1)
      {
        uint64_t v77 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v49, (uint64_t)v44, v51);
      }
      else
      {
        v59 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v49, v32, v51);
        uint64_t v63 = objc_msgSend_bytes(v59, v60, v61, v62);
        if (v32 >= 1)
        {
          for (uint64_t j = 0; j != v32; ++j)
            *(unsigned char *)(v63 + j) = *(_DWORD *)(v107 + 8 * j + 8) - *(void *)(v107 + 8 * j);
        }
        uint64_t v67 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v64, 2 * v40, v65);
        uint64_t v71 = (_WORD *)objc_msgSend_bytes(v67, v68, v69, v70);
        if (v40 >= 1)
        {
          v74 = v108;
          do
          {
            float v75 = *v74++;
            int v76 = (int)rintf(v75 * 65535.0);
            if (v76 >= 0xFFFF) {
              int v76 = 0xFFFF;
            }
            *v71++ = v76 & ~(unsigned __int16)(v76 >> 31);
            --v40;
          }
          while (v40);
        }
        uint64_t v77 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v72, (uint64_t)v59, v73, v67, v44, 0);
      }
      objc_msgSend_encodeObject_forKey_(a3, v78, v77, @"compressedSkinData");
    }
    else
    {
      uint64_t v79 = objc_msgSend_boneWeights(self, v28, v29, v30);
      objc_msgSend_encodeObject_forKey_(a3, v80, v79, @"boneWeights");
      uint64_t v84 = objc_msgSend_boneIndices(self, v81, v82, v83);
      objc_msgSend_encodeObject_forKey_(a3, v85, v84, @"boneIndices");
    }
  }
  unsigned int v86 = objc_msgSend_boneInverseBindTransforms(self, v28, v29, v30);
  uint64_t v90 = objc_msgSend_count(v86, v87, v88, v89);
  if (v90)
  {
    uint64_t v93 = v90;
    for (uint64_t k = 0; k != v93; ++k)
    {
      v95 = (const char *)objc_msgSend_stringWithFormat_(NSString, v91, @"baseMeshBindTransform-%d", v92, k);
      uint64_t v98 = objc_msgSend_objectAtIndex_(v86, v96, k, v97);
      objc_msgSend_VFXMatrix4Value(v98, v99, v100, v101);
      sub_1B64FA3B8(a3, v95, v102, v103, v104, v105);
    }
  }
}

- (VFXSkinner)initWithCoder:(id)a3
{
  v93.receiver = self;
  v93.super_class = (Class)VFXSkinner;
  uint64_t v7 = [(VFXSkinner *)&v93 init];
  if (v7)
  {
    unsigned int v92 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
    uint64_t v10 = objc_opt_class();
    uint64_t v91 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, @"skeleton");
    uint64_t v12 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, @"baseMesh");
    __n128 v17 = (void *)v16;
    if (!v16)
    {
      uint64_t v18 = objc_opt_class();
      uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, @"baseModel");
      __n128 v17 = objc_msgSend_mesh(v20, v21, v22, v23);
    }
    uint64_t v24 = objc_msgSend_meshSourcesForSemantic_(v17, v14, @"kGeometrySourceSemanticPosition", v15);
    Object = objc_msgSend_firstObject(v24, v25, v26, v27);
    uint64_t v32 = objc_msgSend_vectorCount(Object, v29, v30, v31);
    uint64_t v33 = objc_opt_class();
    uint64_t v35 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v34, v33, @"bones");
    uint64_t v36 = objc_opt_class();
    uint64_t v38 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v37, v36, @"compressedSkinData");
    if (v38)
    {
      uint64_t v39 = v38;
      v7->_bonesAndIndicesCompression = 1;
      uint64_t v40 = objc_opt_class();
      uint64_t v44 = objc_msgSend_count(v35, v41, v42, v43);
      uint64_t SkinnerWithCompressedData_bonesCount_vertexCount = objc_msgSend__createSkinnerWithCompressedData_bonesCount_vertexCount_(v40, v45, v39, v44, v32);
    }
    else
    {
      uint64_t v50 = objc_opt_class();
      uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v51, v50, @"boneWeights");
      uint64_t v53 = objc_opt_class();
      uint64_t v55 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v54, v53, @"boneIndices");
      uint64_t v56 = objc_opt_class();
      uint64_t SkinnerWithCompressedData_bonesCount_vertexCount = objc_msgSend__createSkinnerWithVertexCount_bones_boneWeights_boneIndices_baseMesh_(v56, v57, v32, (uint64_t)v35, v52, v55, v17);
    }
    v7->_skinner = (__CFXSkinner *)SkinnerWithCompressedData_bonesCount_vertexCount;
    if (SkinnerWithCompressedData_bonesCount_vertexCount)
    {
      uint64_t v90 = (uint64_t)v17;
      unsigned int v58 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v47, v48, v49);
      uint64_t v62 = objc_msgSend_count(v35, v59, v60, v61);
      if (v62)
      {
        uint64_t v65 = v62;
        uint64_t v66 = 0;
        if (v16)
        {
          uint64_t v67 = @"baseMeshBindTransform-%d";
          goto LABEL_12;
        }
        uint64_t v67 = @"baseModelBindTransform-%d";
        for (uint64_t i = (const char *)objc_msgSend_stringWithFormat_(NSString, v63, @"baseModelBindTransform-%d", v64, 0);
              ;
              uint64_t i = (const char *)objc_msgSend_stringWithFormat_(NSString, v63, (uint64_t)v67, v64, v66))
        {
          *(void *)&double v69 = sub_1B64FA4B4(a3, i).n128_u64[0];
          uint64_t v73 = objc_msgSend_valueWithVFXMatrix4_(MEMORY[0x1E4F29238], v70, v71, v72, v69);
          objc_msgSend_addObject_(v58, v74, v73, v75);
          if (v65 == ++v66) {
            break;
          }
LABEL_12:
          ;
        }
      }
      objc_msgSend__setBaseMesh_(v7, v63, v90, v64);
      objc_msgSend_setBones_(v7, v76, (uint64_t)v35, v77);
      if (v16) {
        unsigned int v78 = @"baseMeshBindTransform";
      }
      else {
        unsigned int v78 = @"baseModelBindTransform";
      }
      *(void *)&double v79 = sub_1B64FA4B4(a3, (const char *)v78).n128_u64[0];
      objc_msgSend_setBaseMeshBindTransform_(v7, v80, v81, v82, v79);
      objc_msgSend_setBoneInverseBindTransforms_(v7, v83, (uint64_t)v58, v84);
      objc_msgSend_setSkeleton_(v7, v85, v91, v86);
      objc_msgSend_setImmediateMode_(VFXTransaction, v87, v92, v88);
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__CFXWorld)worldRef
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);

  return (__CFXWorld *)sub_1B63F4F54(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)world
{
  id result = (id)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
  {
    return sub_1B6583674((id *)result);
  }
  return result;
}

@end