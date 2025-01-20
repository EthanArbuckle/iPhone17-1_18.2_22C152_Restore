@interface VFXMesh
+ (BOOL)supportsSecureCoding;
+ (VFXMesh)meshWithMeshRef:(__CFXMesh *)a3;
+ (VFXMesh)meshWithSources:(id)a3 elements:(id)a4;
+ (VFXMesh)meshWithSources:(id)a3 elements:(id)a4 sourceChannels:(id)a5;
+ (id)mesh;
- (BOOL)getBoundingSphereCenter:(VFXMesh *)self radius:(SEL)a2;
- (NSArray)meshElements;
- (NSArray)meshSourceChannels;
- (NSArray)meshSources;
- (NSString)description;
- (NSString)name;
- (VFXMesh)init;
- (VFXMesh)initWithCoder:(id)a3;
- (VFXMesh)initWithMeshRef:(__CFXMesh *)a3;
- (__CFXMesh)meshRef;
- (__CFXWorld)worldRef;
- (double)boundingBox;
- (id)_meshByRemovingSkinnerSources;
- (id)_meshByUnifyingNormalsWithCreaseThreshold:(float)a3;
- (id)_meshByWeldingVerticesWithThreshold:(float)a3 normalThreshold:(float)a4;
- (id)_renderableCopy;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookData;
- (id)debugQuickLookObject;
- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3;
- (id)identifier;
- (id)interleavedCopy;
- (id)keyForNodeAttributes;
- (id)meshDescription;
- (id)meshElementAtIndex:(int64_t)a3;
- (id)meshSourcesForSemantic:(id)a3;
- (id)world;
- (int64_t)meshElementCount;
- (int64_t)primitiveType;
- (uint64_t)__createCFObject;
- (void)__CFObject;
- (void)_discardOriginalTopology;
- (void)_releaseCachedSourcesAndElements;
- (void)_setupMeshElements;
- (void)_setupMeshSources;
- (void)_syncEntityObjCModel;
- (void)addWorldReference:(id)a3;
- (void)dealloc;
- (void)decodeMeshWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)makeUniqueID;
- (void)removeWorldReference:(id)a3;
- (void)setBoundingBox:(uint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setMeshRef:(__CFXMesh *)a3;
- (void)setName:(id)a3;
- (void)setPrimitiveType:(int64_t)a3;
@end

@implementation VFXMesh

- (uint64_t)__createCFObject
{
  if (qword_1EB995560 != -1) {
    dispatch_once(&qword_1EB995560, &unk_1F0FB5928);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB995568, 0xC8uLL);
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v2 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  *(void *)(v0 + 64) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  *(void *)(v0 + 96) = CFArrayCreateMutable(v1, 0, v2);
  *(void *)(v0 + 112) = 0;
  *(void *)(v0 + 144) = 0;
  *(unsigned char *)(v0 + 200) = *(unsigned char *)(v0 + 200) & 0x87 | 0x18;
  sub_1B64AAC44(v0, v0 + 64);
  return v0;
}

- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3
{
  id v5 = (id)objc_msgSend_copy(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_modelWithMesh_(VFXModel, v6, (uint64_t)v5, v7);
  uint64_t v11 = objc_msgSend_nodeWithModel_(VFXNode, v9, v8, v10);

  return (id)MEMORY[0x1F4181798](v11, sel_debugQuickLookObjectWithAssetPathResolver_, a3, v12);
}

- (id)debugQuickLookObject
{
  id v5 = objc_msgSend_world(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_assetPathResolver(v5, v6, v7, v8);

  return (id)MEMORY[0x1F4181798](self, sel_debugQuickLookObjectWithAssetPathResolver_, v9, v10);
}

- (id)debugQuickLookData
{
  v4 = (UIImage *)objc_msgSend_debugQuickLookObject(self, a2, v2, v3);

  return UIImagePNGRepresentation(v4);
}

- (id)_meshByUnifyingNormalsWithCreaseThreshold:(float)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v7 = objc_msgSend_meshElements(self, a2, v3, v4);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v84, (uint64_t)v88, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v85;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v85 != v14) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend_primitiveType(*(void **)(*((void *)&v84 + 1) + 8 * v15), v10, v11, v12) == 4)
        {
          id v54 = (id)objc_msgSend_copy(self, v10, v11, v12);
          uint64_t v67 = objc_msgSend_meshRef(v54, v64, v65, v66);
          if (v67)
          {
            v75 = (const void *)sub_1B64AB2A8(v67, v68, v69, v70, v71, v72, v73, v74);
            sub_1B63DE908((uint64_t)v75, (uint64_t)v75, 1, 1, v76, v77, v78, v79);
            id v54 = (id)objc_msgSend_meshWithMeshRef_(VFXMesh, v80, (uint64_t)v75, v81);
            if (v75) {
              CFRelease(v75);
            }
          }
          return v54;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v84, (uint64_t)v88, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }
  v16 = objc_msgSend_meshSources(self, v10, v11, v12);
  v17 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v21 = objc_msgSend_count(v16, v18, v19, v20);
  uint64_t v24 = objc_msgSend_arrayWithCapacity_(v17, v22, v21 - 1, v23);
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = sub_1B652D5B4;
  v83[3] = &unk_1E6141E50;
  v83[4] = v24;
  objc_msgSend_enumerateObjectsUsingBlock_(v16, v25, (uint64_t)v83, v26);
  uint64_t v30 = objc_msgSend_meshElements(self, v27, v28, v29);
  uint64_t v32 = objc_msgSend_meshWithSources_elements_(VFXMesh, v31, v24, v30);
  v33 = (void *)MEMORY[0x1E4F35BE0];
  uint64_t v36 = objc_msgSend_modelWithMesh_(VFXModel, v34, v32, v35);
  v39 = objc_msgSend_meshWithVFXModel_(v33, v37, v36, v38);
  *(float *)&double v40 = a3;
  objc_msgSend_addNormalsWithAttributeNamed_creaseThreshold_(v39, v41, @"normals", v42, v40);
  objc_msgSend_begin(VFXTransaction, v43, v44, v45);
  objc_msgSend_setImmediateMode_(VFXTransaction, v46, 1, v47);
  v50 = objc_msgSend_modelWithMDLMesh_(VFXModel, v48, (uint64_t)v39, v49);
  id v54 = (id)objc_msgSend_mesh(v50, v51, v52, v53);
  uint64_t v58 = objc_msgSend_name(self, v55, v56, v57);
  objc_msgSend_setName_(v54, v59, v58, v60);
  objc_msgSend_commitImmediate(VFXTransaction, v61, v62, v63);
  return v54;
}

- (id)_meshByRemovingSkinnerSources
{
  uint64_t v5 = objc_msgSend_meshRef(self, a2, v2, v3);
  uint64_t v13 = sub_1B64AB2A8(v5, v6, v7, v8, v9, v10, v11, v12);
  sub_1B64AC980(v13, 5, v14, v15, v16, v17, v18, v19);
  sub_1B64AC980(v13, 6, v20, v21, v22, v23, v24, v25);
  uint64_t v28 = objc_msgSend_meshWithMeshRef_(VFXMesh, v26, v13, v27);
  uint64_t v32 = objc_msgSend_name(self, v29, v30, v31);
  objc_msgSend_setName_(v28, v33, v32, v34);
  return v28;
}

- (void)_discardOriginalTopology
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_meshRef(self, a2, v2, v3);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v9 = objc_msgSend_meshSources(self, v6, v7, v8);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v48, (uint64_t)v53, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v49;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v49 != v16) {
          objc_enumerationMutation(v9);
        }
        uint64_t v18 = objc_msgSend_meshSource(*(void **)(*((void *)&v48 + 1) + 8 * v17), v12, v13, v14);
        if (v18) {
          sub_1B6583684(v18, 0, v13, v14, v19, v20, v21, v22);
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v48, (uint64_t)v53, 16);
    }
    while (v15);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v23 = objc_msgSend_meshElements(self, v12, v13, v14, 0);
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v44, (uint64_t)v52, 16);
  if (v25)
  {
    uint64_t v33 = v25;
    uint64_t v34 = *(void *)v45;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v23);
        }
        uint64_t v36 = objc_msgSend_meshElement(*(void **)(*((void *)&v44 + 1) + 8 * v35), v26, v27, v28);
        if (v36) {
          sub_1B6583684(v36, 0, v27, v28, v37, v38, v39, v40);
        }
        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v44, (uint64_t)v52, 16);
    }
    while (v33);
  }
  sub_1B64F72FC(v5, 0, v27, v28, v29, v30, v31, v32);
  objc_msgSend__releaseCachedSourcesAndElements(self, v41, v42, v43);
}

- (id)_meshByWeldingVerticesWithThreshold:(float)a3 normalThreshold:(float)a4
{
  uint64_t v7 = self;
  uint64_t v271 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend_meshSourcesForSemantic_(self, a2, @"kGeometrySourceSemanticPosition", v4);
  Object = objc_msgSend_firstObject(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_meshSourcesForSemantic_(v7, v13, @"kGeometrySourceSemanticNormal", v14);
  uint64_t v19 = objc_msgSend_firstObject(v15, v16, v17, v18);
  objc_msgSend_meshSourcesForSemantic_(v7, v20, @"kGeometrySourceSemanticTexcoord", v21);
  size_t v25 = objc_msgSend_vectorCount(Object, v22, v23, v24);
  uint64_t v26 = (char *)malloc_type_malloc(8 * v25, 0x100004000313F17uLL);
  uint64_t v27 = (unint64_t *)malloc_type_malloc(8 * v25, 0x100004000313F17uLL);
  uint64_t v31 = v27;
  if (v25)
  {
    for (unint64_t i = 0; i != v25; ++i)
    {
      *(void *)&v26[8 * i] = i;
      v27[i] = i;
    }
  }
  uint64_t v33 = objc_msgSend_data(Object, v28, v29, v30);
  uint64_t v266 = objc_msgSend_bytes(v33, v34, v35, v36);
  uint64_t v267 = objc_msgSend_dataOffset(Object, v37, v38, v39);
  uint64_t v268 = objc_msgSend_dataStride(Object, v40, v41, v42);
  qsort_r(v26, v25, 8uLL, &v266, (int (__cdecl *)(void *, const void *, const void *))sub_1B652E148);
  if (v25)
  {
    v241 = v7;
    v242 = v26;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    float v49 = a4 + a4;
    v248 = v26 + 8;
    do
    {
      unint64_t v50 = *(void *)&v26[8 * v47];
      if (v31[v50] == v50)
      {
        uint64_t v51 = v266 + v267 + v268 * v50;
        v46.i64[0] = *(void *)v51;
        LODWORD(__dst) = *(void *)v51;
        v46.i32[2] = *(_DWORD *)(v51 + 8);
        float32x4_t v253 = v46;
        uint64_t v52 = objc_msgSend_data(v19, v43, v44, v45);
        uint64_t v56 = objc_msgSend_bytes(v52, v53, v54, v55);
        uint64_t v60 = objc_msgSend_dataOffset(v19, v57, v58, v59);
        uint64_t v64 = objc_msgSend_dataStride(v19, v61, v62, v63);
        v65.i64[0] = *(void *)(v56 + v64 * v50 + v60);
        v65.i32[2] = *(_DWORD *)(v56 + v60 + 8 + v64 * v50);
        float32x4_t v250 = v65;
        unint64_t v69 = objc_msgSend_vectorCount(v19, v66, v67, v68);
        uint64_t v70 = v47 + 1;
        if (v47 + 1 >= v69)
        {
          int v71 = 0;
        }
        else
        {
          int v71 = 0;
          uint64_t v72 = v266;
          unint64_t v73 = ~v47 + v69;
          uint64_t v74 = &v248[8 * v47];
          do
          {
            uint64_t v76 = *(void *)v74;
            v74 += 8;
            uint64_t v75 = v76;
            if (v31[v76] == v76)
            {
              uint64_t v77 = v267 + v268 * v75;
              v46.i32[0] = *(_DWORD *)(v72 + v77);
              if (vabds_f32(__dst, v46.f32[0]) > a3) {
                break;
              }
              uint64_t v78 = v77 + v72;
              v46.i32[1] = *(_DWORD *)(v78 + 4);
              v46.i32[2] = *(_DWORD *)(v78 + 8);
              float32x4_t v79 = vsubq_f32(v253, v46);
              float32x4_t v80 = vmulq_f32(v79, v79);
              float32x4_t v46 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v80, 2), vaddq_f32(v80, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v80.f32, 1)));
              if (sqrtf(v46.f32[0]) <= a3)
              {
                v46.i64[0] = *(void *)(v56 + v75 * v64 + v60);
                v46.i32[2] = *(_DWORD *)(v56 + v60 + 8 + v75 * v64);
                float32x4_t v81 = vmulq_f32(v250, v46);
                float32x4_t v46 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v81, 2), vaddq_f32(v81, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 1)));
                if ((float)(1.0 - v46.f32[0]) <= v49)
                {
                  v31[v75] = v50;
                  ++v71;
                }
              }
            }
            --v73;
          }
          while (v73);
        }
        uint64_t v26 = v242;
      }
      else
      {
        int v71 = 0;
        uint64_t v70 = v47 + 1;
      }
      v48 += v71;
      uint64_t v47 = v70;
    }
    while (v70 != v25);
    if (v48)
    {
      v82 = objc_msgSend_meshSources(v241, v43, v44, v45);
      long long v86 = objc_msgSend_meshElements(v241, v83, v84, v85);
      long long v87 = (void *)MEMORY[0x1E4F1CA48];
      obunint64_t j = v82;
      uint64_t v91 = objc_msgSend_count(v82, v88, v89, v90);
      v251 = objc_msgSend_arrayWithCapacity_(v87, v92, v91, v93);
      v94 = (void *)MEMORY[0x1E4F1CA48];
      id v244 = v86;
      uint64_t v98 = objc_msgSend_count(v86, v95, v96, v97);
      v249 = objc_msgSend_arrayWithCapacity_(v94, v99, v98, v100);
      for (unint64_t j = 0; j != v25; ++j)
      {
        unint64_t v103 = v31[j];
        do
        {
          unint64_t v104 = v103;
          unint64_t v103 = v31[v103];
        }
        while (v104 > v103);
        v31[j] = v104;
        if (v104 > j && v31[v104] == v104)
        {
          v31[v104] = j;
          v31[j] = j;
        }
      }
      long long v264 = 0u;
      long long v265 = 0u;
      long long v262 = 0u;
      long long v263 = 0u;
      uint64_t v246 = v48;
      uint64_t v254 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v101, (uint64_t)&v262, (uint64_t)v270, 16);
      if (v254)
      {
        uint64_t v245 = *(void *)v263;
        do
        {
          for (uint64_t k = 0; k != v254; ++k)
          {
            if (*(void *)v263 != v245) {
              objc_enumerationMutation(obj);
            }
            v113 = *(void **)(*((void *)&v262 + 1) + 8 * k);
            uint64_t v114 = objc_msgSend_bytesPerComponent(v113, v105, v106, v107);
            size_t v118 = objc_msgSend_componentsPerVector(v113, v115, v116, v117) * v114;
            uint64_t v122 = (objc_msgSend_vectorCount(v113, v119, v120, v121) - v48) * v118;
            __dsta = (char *)malloc_type_malloc(v122, 0x8D98E66BuLL);
            v126 = objc_msgSend_data(v113, v123, v124, v125);
            uint64_t v130 = objc_msgSend_bytes(v126, v127, v128, v129);
            objc_msgSend_vectorCount(v113, v131, v132, v133);
            uint64_t v137 = objc_msgSend_dataStride(v113, v134, v135, v136);
            uint64_t v141 = 0;
            v143 = (char *)(v130 + objc_msgSend_dataOffset(v113, v138, v139, v140));
            v144 = __dsta;
            do
            {
              if (v141 == v31[v141])
              {
                memcpy(v144, v143, v118);
                v144 += v118;
              }
              v143 += v137;
              ++v141;
            }
            while (v25 != v141);
            uint64_t v145 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v142, (uint64_t)__dsta, v122, 1);
            uint64_t v149 = objc_msgSend_semantic(v113, v146, v147, v148);
            uint64_t v48 = v246;
            uint64_t v153 = objc_msgSend_vectorCount(v113, v150, v151, v152) - v246;
            uint64_t v157 = objc_msgSend__componentType(v113, v154, v155, v156);
            uint64_t v161 = objc_msgSend_componentsPerVector(v113, v158, v159, v160);
            uint64_t v163 = objc_msgSend__modelSourceWithData_semantic_vectorCount_componentType_componentCount_dataOffset_dataStride_(VFXMeshSource, v162, v145, v149, v153, v157, v161, 0, 0);
            v167 = objc_msgSend_semantic(v113, v164, v165, v166);
            objc_msgSend_isEqualToString_(v167, v168, @"kGeometrySourceSemanticPosition", v169);
            objc_msgSend_addObject_(v251, v170, v163, v171);
          }
          uint64_t v254 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v105, (uint64_t)&v262, (uint64_t)v270, 16);
        }
        while (v254);
      }
      unint64_t v172 = 0;
      uint64_t v173 = 0;
      size_t v174 = v25 - v48;
      do
      {
        unint64_t v175 = v31[v172];
        if (v175 > v172)
        {
          sub_1B63F2F54(17, @"Assertion '%s' failed. bad redirection index after sort", v106, v107, v108, v109, v110, v111, (uint64_t)"indexRedirection[index] <= index");
          unint64_t v175 = v31[v172];
        }
        if (v172 != v175)
        {
          if (!v172)
          {
            sub_1B63F2F54(17, @"Assertion '%s' failed. weld - bad index", v106, v107, v108, v109, v110, v111, (uint64_t)"index>0");
            unint64_t v175 = *v31;
          }
          ++v173;
          if (v175 > v172) {
            sub_1B63F2F54(17, @"Assertion '%s' failed. weld - bad redirection", v106, v107, v108, v109, v110, v111, (uint64_t)"indexRedirection[index] <= index");
          }
        }
        *(void *)&v242[8 * v172] = v172 - v173;
        v31[v172] = *(void *)&v242[8 * v31[v172]];
        if (*(void *)&v242[8 * v172] >= v174) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. weld - redirection out of bounds", v106, v107, v108, v109, v110, v111, (uint64_t)"indexes[index] < count - weldCount");
        }
        ++v172;
      }
      while (v25 != v172);
      if (v173 != v246) {
        sub_1B63F2F54(17, @"Assertion '%s' failed. weld - bad duplicated vertex count", v106, v107, v108, v109, v110, v111, (uint64_t)"offset == weldCount");
      }
      long long v260 = 0u;
      long long v261 = 0u;
      long long v258 = 0u;
      long long v259 = 0u;
      uint64_t v252 = objc_msgSend_countByEnumeratingWithState_objects_count_(v244, v105, (uint64_t)&v258, (uint64_t)v269, 16);
      if (v252)
      {
        unint64_t v179 = v25 - v246;
        uint64_t v247 = *(void *)v259;
        do
        {
          for (uint64_t m = 0; m != v252; ++m)
          {
            if (*(void *)v259 != v247) {
              objc_enumerationMutation(v244);
            }
            v181 = *(void **)(*((void *)&v258 + 1) + 8 * m);
            uint64_t v182 = objc_msgSend_bytesPerIndex(v181, v176, v177, v178);
            v186 = objc_msgSend_data(v181, v183, v184, v185);
            uint64_t v190 = objc_msgSend_bytes(v186, v187, v188, v189);
            uint64_t v194 = objc_msgSend_indexCount(v181, v191, v192, v193);
            if (objc_msgSend_primitiveType(v181, v195, v196, v197) == 4) {
              size_t v201 = objc_msgSend_primitiveCount(v181, v198, v199, v200) * v182;
            }
            else {
              size_t v201 = 0;
            }
            __dstb = (char *)malloc_type_malloc(v201 + v194 * v182, 0xBFE5E080uLL);
            if (v194)
            {
              uint64_t v209 = 0;
              v210 = &__dstb[v201];
              while (v182 != 4)
              {
                if (v182 != 2)
                {
                  if (v182 != 1) {
                    goto LABEL_72;
                  }
                  unint64_t v211 = v31[*(unsigned __int8 *)(v190 + v209)];
                  v210[v209] = v211;
                  BOOL v212 = v179 > v211;
                  v213 = "elementDataWrt[index] < count - weldCount";
                  if (v212) {
                    goto LABEL_72;
                  }
LABEL_71:
                  sub_1B63F2F54(17, @"Assertion '%s' failed. weld: bad index", v203, v204, v205, v206, v207, v208, (uint64_t)v213);
                  goto LABEL_72;
                }
                unint64_t v214 = v31[*(unsigned __int16 *)(v190 + 2 * v209)];
                *(_WORD *)&v210[2 * v209] = v214;
                BOOL v212 = v179 > (unsigned __int16)v214;
                v213 = "((uint16_t*)elementDataWrt)[index] < count - weldCount";
                if (!v212) {
                  goto LABEL_71;
                }
LABEL_72:
                if (v194 == ++v209) {
                  goto LABEL_77;
                }
              }
              unint64_t v215 = v31[*(unsigned int *)(v190 + 4 * v209)];
              *(_DWORD *)&v210[4 * v209] = v215;
              BOOL v212 = v179 > v215;
              v213 = "((uint32_t*)elementDataWrt)[index] < count - weldCount";
              if (v212) {
                goto LABEL_72;
              }
              goto LABEL_71;
            }
LABEL_77:
            if (v201)
            {
              v216 = objc_msgSend_data(v181, v202, v203, v204);
              v220 = (const void *)objc_msgSend_bytes(v216, v217, v218, v219);
              memcpy(__dstb, v220, v201);
            }
            uint64_t v221 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v202, (uint64_t)__dstb, v201 + v194 * v182, 1);
            uint64_t v225 = objc_msgSend_primitiveType(v181, v222, v223, v224);
            uint64_t v229 = objc_msgSend_primitiveCount(v181, v226, v227, v228);
            uint64_t v231 = objc_msgSend_meshElementWithData_primitiveType_primitiveCount_bytesPerIndex_(VFXMeshElement, v230, v221, v225, v229, v182);
            objc_msgSend_addObject_(v249, v232, v231, v233);
          }
          uint64_t v252 = objc_msgSend_countByEnumeratingWithState_objects_count_(v244, v176, (uint64_t)&v258, (uint64_t)v269, 16);
        }
        while (v252);
      }
      uint64_t v7 = objc_msgSend_meshWithSources_elements_(VFXMesh, v176, (uint64_t)v251, (uint64_t)v249);
      uint64_t v237 = objc_msgSend_name(v241, v234, v235, v236);
      objc_msgSend_setName_(v7, v238, v237, v239);
      uint64_t v26 = v242;
    }
    else
    {
      uint64_t v7 = v241;
    }
  }
  free(v26);
  free(v31);
  return v7;
}

- (VFXMesh)init
{
  v15.receiver = self;
  v15.super_class = (Class)VFXMesh;
  uint64_t v2 = [(VFXMesh *)&v15 init];
  if (v2)
  {
    uint64_t v3 = -[VFXMesh __createCFObject]_0();
    v2->_mesh = (__CFXMesh *)v3;
    if (v3) {
      sub_1B6583684(v3, v2, v5, v6, v7, v8, v9, v10);
    }
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
    objc_msgSend_makeUniqueID(v2, v11, v12, v13);
  }
  return v2;
}

- (VFXMesh)initWithMeshRef:(__CFXMesh *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)VFXMesh;
  uint64_t v4 = [(VFXMesh *)&v17 init];
  if (v4)
  {
    uint64_t v5 = (__CFXMesh *)CFRetain(a3);
    v4->_mesh = v5;
    if (v5) {
      sub_1B6583684((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    }
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend_makeUniqueID(v4, v13, v14, v15);
  }
  return v4;
}

+ (VFXMesh)meshWithMeshRef:(__CFXMesh *)a3
{
  result = (VFXMesh *)sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithMeshRef_(v6, v7, (uint64_t)a3, v8);
    return (VFXMesh *)v9;
  }
  return result;
}

+ (id)mesh
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)dealloc
{
  mesh = self->_mesh;
  if (mesh)
  {
    if ((*((unsigned char *)self + 32) & 1) == 0)
    {
      sub_1B6583684((uint64_t)mesh, 0, v2, v3, v4, v5, v6, v7);
      mesh = self->_mesh;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B65F1644;
    v11[3] = &unk_1E6140A18;
    v11[4] = mesh;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v11);
  }

  v10.receiver = self;
  v10.super_class = (Class)VFXMesh;
  [(VFXMesh *)&v10 dealloc];
}

- (void)addWorldReference:(id)a3
{
  if (self->_world == a3)
  {
    ++self->_worldReferenceCounter;
  }
  else
  {
    self->_world = (VFXWorld *)a3;
    self->_worldReferenceCounter = 1;
    objc_msgSend_didAttachToWorld_(self, a2, (uint64_t)a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B65F1708;
    v8[3] = &unk_1E6142EC8;
    v8[4] = a3;
    objc_msgSend_enumerateDependencies_(self, v6, (uint64_t)v8, v7);
  }
}

- (void)removeWorldReference:(id)a3
{
  world = self->_world;
  if (!a3 || world == a3)
  {
    unsigned int worldReferenceCounter = self->_worldReferenceCounter;
    if (worldReferenceCounter)
    {
      unsigned int v12 = worldReferenceCounter - 1;
      self->_unsigned int worldReferenceCounter = v12;
      if (!v12)
      {
        objc_msgSend_didDetachFromWorld_(self, a2, (uint64_t)world, v3);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = sub_1B65F17DC;
        v15[3] = &unk_1E6142EC8;
        v15[4] = a3;
        objc_msgSend_enumerateDependencies_(self, v13, (uint64_t)v15, v14);
        self->_world = 0;
      }
    }
    else
    {
      sub_1B63F2F54(16, @"Error: Over-detach of instance %@ from world %@", (uint64_t)world, v3, v4, v5, v6, v7, (uint64_t)self);
    }
  }
}

- (id)world
{
  return self->_world;
}

- (__CFXWorld)worldRef
{
  return (__CFXWorld *)objc_msgSend___CFObject(self->_world, a2, v2, v3);
}

- (void)setName:(id)a3
{
  uint64_t name = (uint64_t)self->_name;
  if ((unint64_t)a3 | name)
  {
    if ((objc_msgSend_isEqual_(a3, a2, name, v3) & 1) == 0)
    {

      self->_uint64_t name = (NSString *)objc_msgSend_copy(a3, v7, v8, v9);
      uint64_t v13 = objc_msgSend_worldRef(self, v10, v11, v12);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_1B65F18C4;
      v15[3] = &unk_1E6141230;
      v15[4] = self;
      void v15[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
    }
  }
}

- (NSString)name
{
  if ((*((unsigned char *)self + 32) & 1) == 0) {
    return self->_name;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend___CFObject(self, v7, v8, v9);
  uint64_t v5 = (NSString *)sub_1B6583470(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14) {
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
  }
  return v5;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v5 = objc_msgSend___CFObject(self, a2, (uint64_t)a3, v3);

  sub_1B65835F8(v5, a3, v6, v7, v8, v9, v10, v11);
}

- (id)identifier
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);

  return sub_1B6583590(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)_syncEntityObjCModel
{
  uint64_t v5 = objc_msgSend___CFObject(self, a2, v2, v3);

  self->_uint64_t name = (NSString *)(id)sub_1B6583470(v5, v6, v7, v8, v9, v10, v11, v12);
}

- (void)makeUniqueID
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v5, v6, v7);
  uint64_t v12 = (const void *)objc_msgSend_UUIDString(v8, v9, v10, v11);

  sub_1B65835F8(v4, v12, v13, v14, v15, v16, v17, v18);
}

- (id)meshDescription
{
  uint64_t v5 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3);
  uint64_t v9 = objc_msgSend_name(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_length(v9, v10, v11, v12);
  uint64_t v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  uint64_t v19 = v15;
  if (v13)
  {
    uint64_t v32 = objc_msgSend_name(self, v16, v17, v18);
    objc_msgSend_appendFormat_(v5, v20, @"%@: %p '%@'", v21, v19, self, v32);
  }
  else
  {
    objc_msgSend_appendFormat_(v5, v16, @"%@: %p", v18, v15, self);
  }
  if (objc_msgSend_meshElementCount(self, v22, v23, v24) >= 2)
  {
    uint64_t v28 = objc_msgSend_meshElementCount(self, v25, v26, v27);
    objc_msgSend_appendFormat_(v5, v29, @" | %d elements", v30, v28);
  }
  return v5;
}

- (NSString)description
{
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend_meshDescription(self, a2, v2, v3);
  return (NSString *)objc_msgSend_stringWithFormat_(v4, v6, @"<%@>", v7, v5);
}

- (__CFXMesh)meshRef
{
  return self->_mesh;
}

- (void)setMeshRef:(__CFXMesh *)a3
{
  mesh = self->_mesh;
  if (mesh == a3) {
    return;
  }
  uint64_t v10 = a3;
  if (mesh)
  {
    sub_1B6583684((uint64_t)mesh, 0, (uint64_t)a3, v3, v4, v5, v6, v7);
    uint64_t v11 = self->_mesh;
    if (v11 == v10) {
      goto LABEL_11;
    }
    if (v11)
    {
      CFRelease(v11);
      self->_mesh = 0;
    }
    if (!v10) {
      goto LABEL_10;
    }
  }
  else if (!a3)
  {
    goto LABEL_11;
  }
  uint64_t v10 = (__CFXMesh *)CFRetain(v10);
LABEL_10:
  self->_mesh = v10;
LABEL_11:
  if (v10)
  {
    sub_1B6583684((uint64_t)v10, self, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
}

- (void)_releaseCachedSourcesAndElements
{
  self->_sources = 0;
  self->_elements = 0;
}

+ (VFXMesh)meshWithSources:(id)a3 elements:(id)a4
{
  return (VFXMesh *)objc_msgSend_meshWithSources_elements_sourceChannels_(a1, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

+ (VFXMesh)meshWithSources:(id)a3 elements:(id)a4 sourceChannels:(id)a5
{
  Class v55 = (Class)a1;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFIndex v9 = objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v10 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  Mutable = CFArrayCreateMutable(v8, v9, MEMORY[0x1E4F1D510]);
  CFIndex v15 = objc_msgSend_count(a4, v12, v13, v14);
  uint64_t v16 = CFArrayCreateMutable(v8, v15, v10);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v17, (uint64_t)&v60, (uint64_t)v65, 16);
  if (v18)
  {
    uint64_t v22 = v18;
    uint64_t v23 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v61 != v23) {
          objc_enumerationMutation(a3);
        }
        uint64_t v25 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        objc_msgSend__clearCFXCache(v25, v19, v20, v21);
        uint64_t v29 = (const void *)objc_msgSend_meshSource(v25, v26, v27, v28);
        CFArrayAppendValue(Mutable, v29);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v19, (uint64_t)&v60, (uint64_t)v65, 16);
    }
    while (v22);
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v19, (uint64_t)&v56, (uint64_t)v64, 16);
  if (v30)
  {
    uint64_t v34 = v30;
    uint64_t v35 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v57 != v35) {
          objc_enumerationMutation(a4);
        }
        uint64_t v37 = (const void *)objc_msgSend_meshElement(*(void **)(*((void *)&v56 + 1) + 8 * j), v31, v32, v33);
        CFArrayAppendValue(v16, v37);
      }
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v31, (uint64_t)&v56, (uint64_t)v64, 16);
    }
    while (v34);
  }
  uint64_t v38 = (const char *)objc_msgSend_count(a3, v31, v32, v33);
  uint64_t v39 = (char *)&v54 - ((unint64_t)(v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B65F1EB4(a5, v38, a4, v39);
  uint64_t v45 = (const void *)sub_1B63DC55C(Mutable, v16, (uint64_t)v39, v40, v41, v42, v43, v44);
  id v46 = [v55 alloc];
  float v49 = objc_msgSend_initWithMeshRef_(v46, v47, (uint64_t)v45, v48);
  v49[7] = objc_msgSend_copy(a5, v50, v51, v52);
  CFRelease(Mutable);
  CFRelease(v16);
  CFRelease(v45);
  return (VFXMesh *)v49;
}

- (void)_setupMeshSources
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = self->_sources;
  self->_sources = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  mesh = self->_mesh;
  if (mesh)
  {
    uint64_t v61 = -1;
    char v16 = sub_1B64ACDD4((uint64_t)mesh, &v61);
    if (v61) {
      char v23 = 0;
    }
    else {
      char v23 = v16;
    }
    if (v23) {
      id v24 = 0;
    }
    else {
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    CFArrayRef v25 = sub_1B64ACF8C((uint64_t)mesh, 0, v17, v18, v19, v20, v21, v22);
    uint64_t v29 = objc_msgSend_count(v25, v26, v27, v28);
    if (v29)
    {
      uint64_t v32 = v29;
      for (uint64_t i = 0; i != v32; ++i)
      {
        uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v25, v30, i, v31);
        uint64_t v37 = objc_msgSend_geometrySourceWithMeshSourceRef_(VFXMeshSource, v35, v34, v36);
        objc_msgSend_addObject_(self->_sources, v38, v37, v39);
        if ((v23 & 1) == 0)
        {
          uint64_t v45 = sub_1B64ACE44((uint64_t)mesh, i, v40, v31, v41, v42, v43, v44);
          uint64_t v48 = objc_msgSend_numberWithLong_(NSNumber, v46, v45, v47);
          objc_msgSend_addObject_(v24, v49, v48, v50);
        }
      }
    }
  }
  else
  {
    id v24 = 0;
  }

  self->_sourceChannels = (NSArray *)objc_msgSend_copy(v24, v51, v52, v53);
  if (v13) {
    sub_1B64B0CB4(v13, v54, v55, v56, v57, v58, v59, v60);
  }
}

- (void)_setupMeshElements
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  mesh = self->_mesh;
  if (mesh)
  {
    CFIndex v15 = self->_elements;
    self->_elements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CFArrayRef v23 = sub_1B64ABD08((uint64_t)mesh, v16, v17, v18, v19, v20, v21, v22);
    if ((uint64_t)v23 >= 1)
    {
      CFArrayRef v24 = v23;
      for (CFIndex i = 0; (const __CFArray *)i != v24; ++i)
      {
        uint64_t v26 = sub_1B64ABD78((uint64_t)mesh, i, 0, v8, v9, v10, v11, v12);
        elements = self->_elements;
        uint64_t v30 = objc_msgSend_geometryElementWithMeshElementRef_(VFXMeshElement, v28, (uint64_t)v26, v29);
        objc_msgSend_addObject_(elements, v31, v30, v32);
      }
    }
  }
  if (v13)
  {
    sub_1B64B0CB4(v13, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (NSArray)meshSources
{
  result = &self->_sources->super;
  if (!result)
  {
    objc_msgSend__setupMeshSources(self, a2, v2, v3);
    return &self->_sources->super;
  }
  return result;
}

- (NSArray)meshSourceChannels
{
  return self->_sourceChannels;
}

- (id)meshSourcesForSemantic:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_meshSources(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v6, 1, v7);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v5);
        }
        uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_semantic(v17, v11, v12, v13);
        if (objc_msgSend_isEqualToString_(v18, v19, (uint64_t)a3, v20)) {
          objc_msgSend_addObject_(v8, v11, (uint64_t)v17, v13);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v14);
  }
  if (objc_msgSend_count(v8, v11, v12, v13)) {
    return v8;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (NSArray)meshElements
{
  result = &self->_elements->super;
  if (!result)
  {
    objc_msgSend__setupMeshElements(self, a2, v2, v3);
    return &self->_elements->super;
  }
  return result;
}

- (int64_t)meshElementCount
{
  uint64_t v4 = objc_msgSend_meshElements(self, a2, v2, v3);

  return objc_msgSend_count(v4, v5, v6, v7);
}

- (id)meshElementAtIndex:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_meshElements(self, a2, a3, v3);
  if (objc_msgSend_count(v5, v6, v7, v8) <= (unint64_t)a3) {
    return 0;
  }

  return (id)objc_msgSend_objectAtIndexedSubscript_(v5, v9, a3, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend_meshRef(self, a2, (uint64_t)a3, v3);
  uint64_t v12 = (const void *)sub_1B64AB2A8(v4, v5, v6, v7, v8, v9, v10, v11);
  id v13 = objc_alloc((Class)objc_opt_class());
  uint64_t v16 = objc_msgSend_initWithMeshRef_(v13, v14, (uint64_t)v12, v15);
  if (v12) {
    CFRelease(v12);
  }
  return v16;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)interleavedCopy
{
  uint64_t v4 = objc_msgSend_meshRef(self, a2, v2, v3);
  uint64_t v12 = (const void *)sub_1B63DF358(v4, v5, v6, v7, v8, v9, v10, v11);
  id v13 = objc_alloc((Class)objc_opt_class());
  uint64_t v16 = objc_msgSend_initWithMeshRef_(v13, v14, (uint64_t)v12, v15);
  if (v12) {
    CFRelease(v12);
  }
  return v16;
}

- (id)_renderableCopy
{
  uint64_t v4 = objc_msgSend_meshRef(self, a2, v2, v3);
  uint64_t v12 = (const void *)sub_1B64AB534(v4, v5, v6, v7, v8, v9, v10, v11);
  id v13 = objc_alloc((Class)objc_opt_class());
  uint64_t v16 = objc_msgSend_initWithMeshRef_(v13, v14, (uint64_t)v12, v15);
  if (v12) {
    CFRelease(v12);
  }
  return v16;
}

- (id)keyForNodeAttributes
{
  return @"mesh";
}

- (int64_t)primitiveType
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  int64_t mesh = (int64_t)self->_mesh;
  if (mesh)
  {
    if ((uint64_t)sub_1B64ABD08(mesh, v6, v7, v8, v9, v10, v11, v12) < 1)
    {
      int64_t mesh = 0;
      if (!v13) {
        return mesh;
      }
      goto LABEL_7;
    }
    uint64_t v15 = sub_1B64ABD78(mesh, 0, 0, v8, v9, v10, v11, v12);
    int64_t mesh = (int)sub_1B63D0C08((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
  }
  if (v13) {
LABEL_7:
  }
    sub_1B64B0CB4(v13, v6, v7, v8, v9, v10, v11, v12);
  return mesh;
}

- (void)setPrimitiveType:(int64_t)a3
{
  char v4 = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  int64_t mesh = self->_mesh;
  if (mesh)
  {
    if ((uint64_t)sub_1B64ABD08((uint64_t)mesh, v7, v8, v9, v10, v11, v12, v13) >= 1)
    {
      CFArrayRef v16 = sub_1B64ABD08((uint64_t)mesh, v7, v8, v9, v10, v11, v12, v13);
      if ((uint64_t)v16 >= 1)
      {
        CFArrayRef v17 = v16;
        for (CFIndex i = 0; (const __CFArray *)i != v17; ++i)
        {
          uint64_t v19 = sub_1B64ABD78((uint64_t)mesh, i, 0, v9, v10, v11, v12, v13);
          sub_1B63D04D0((uint64_t)v19, v4, v20, v21, v22, v23, v24, v25);
        }
      }
    }
  }
  if (v14)
  {
    sub_1B64B0CB4(v14, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)__CFObject
{
  return self->_mesh;
}

- (double)boundingBox
{
  uint64_t v5 = objc_msgSend_worldRef(a1, a2, a3, a4);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v14 = objc_msgSend_meshRef(a1, v6, v7, v8, 0, 0, 0, 0);
  if (!v14)
  {
    long long v23 = VFXNullBoundingBox;
    long long v24 = unk_1B6E72500;
    if (!v13) {
      return *(double *)&v23;
    }
    goto LABEL_5;
  }
  sub_1B64AB620(v14, &v23, &v24, v17, v18, v19, v20, v21);
  if (v13) {
LABEL_5:
  }
    sub_1B64B0CB4(v13, v15, v16, v17, v18, v19, v20, v21);
  return *(double *)&v23;
}

- (void)setBoundingBox:(uint64_t)a3
{
}

- (BOOL)getBoundingSphereCenter:(VFXMesh *)self radius:(SEL)a2
{
  char v4 = (_DWORD *)v3;
  uint64_t v5 = (_OWORD *)v2;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v15 = v7;
  if (v7) {
    sub_1B64B0C28(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  }
  uint64_t v16 = (const void *)objc_msgSend_meshRef(self, v8, v9, v10);
  long long v26 = 0uLL;
  if (!v16 || !sub_1B63F49F8(v16, 1, (uint64_t)&v26, v19, v20, v21, v22, v23))
  {
    BOOL v24 = 0;
    if (!v15) {
      return v24;
    }
LABEL_12:
    sub_1B64B0CB4(v15, v17, v18, v19, v20, v21, v22, v23);
    return v24;
  }
  if (v5) {
    *uint64_t v5 = v26;
  }
  if (v4) {
    _DWORD *v4 = HIDWORD(v26);
  }
  BOOL v24 = 1;
  if (v15) {
    goto LABEL_12;
  }
  return v24;
}

- (void)decodeMeshWithCoder:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1B64AB0F8();
  if (v5 == CFGetTypeID(self->_mesh))
  {
    unint64_t v73 = self;
    uint64_t v6 = objc_opt_class();
    uint64_t v72 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v7, v6, @"elements");
    uint64_t v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
    uint64_t v12 = objc_opt_class();
    uint64_t v14 = (void *)sub_1B65FDC68(v12, v13);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v82, (uint64_t)v88, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v83;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v83 != v21) {
            objc_enumerationMutation(v14);
          }
          uint64_t v23 = *(__CFString **)(*((void *)&v82 + 1) + 8 * v22);
          uint64_t v24 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v17, v12, (uint64_t)v23);
          if (v24
            || v23 == @"kGeometrySourceSemanticPosition"
            && (uint64_t v24 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v17, v12, @"kGeometrySourceSemanticVertex")) != 0)
          {
            objc_msgSend_addObjectsFromArray_(v11, v17, v24, v25);
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v82, (uint64_t)v88, 16);
        uint64_t v20 = v26;
      }
      while (v26);
    }
    CFAllocatorRef v27 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex v28 = objc_msgSend_count(v11, v17, v18, v19);
    uint64_t v29 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
    Mutable = CFArrayCreateMutable(v27, v28, MEMORY[0x1E4F1D510]);
    uint64_t v31 = v72;
    CFIndex v35 = objc_msgSend_count(v72, v32, v33, v34);
    uint64_t v36 = CFArrayCreateMutable(v27, v35, v29);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v37, (uint64_t)&v78, (uint64_t)v87, 16);
    if (v38)
    {
      uint64_t v42 = v38;
      uint64_t v43 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v79 != v43) {
            objc_enumerationMutation(v11);
          }
          uint64_t v45 = (const void *)objc_msgSend_meshSource(*(void **)(*((void *)&v78 + 1) + 8 * i), v39, v40, v41);
          CFArrayAppendValue(Mutable, v45);
        }
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v39, (uint64_t)&v78, (uint64_t)v87, 16);
      }
      while (v42);
    }
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v39, (uint64_t)&v74, (uint64_t)v86, 16);
    if (v46)
    {
      uint64_t v50 = v46;
      uint64_t v51 = *(void *)v75;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v75 != v51) {
            objc_enumerationMutation(v72);
          }
          uint64_t v53 = (const void *)objc_msgSend_meshElement(*(void **)(*((void *)&v74 + 1) + 8 * j), v47, v48, v49);
          CFArrayAppendValue(v36, v53);
        }
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v47, (uint64_t)&v74, (uint64_t)v86, 16);
      }
      while (v50);
    }
    uint64_t v54 = objc_opt_class();
    self = v73;
    v73->_sourceChannels = (NSArray *)(id)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v55, v54, @"sourceChannels");
    uint64_t v59 = (const char *)objc_msgSend_count(v11, v56, v57, v58);
    uint64_t v60 = (char *)&v72 - ((unint64_t)(v59 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1B65F1EB4(self->_sourceChannels, v59, v31, v60);
    int64_t mesh = self->_mesh;
    if (mesh)
    {
      CFRelease(mesh);
      self->_int64_t mesh = 0;
    }
    self->_int64_t mesh = (__CFXMesh *)sub_1B63DC55C(Mutable, v36, (uint64_t)v60, v61, v62, v63, v64, v65);
    CFRelease(Mutable);
    CFRelease(v36);
  }
  uint64_t v67 = objc_opt_class();
  uint64_t v69 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v68, v67, @"name");
  objc_msgSend_setName_(self, v70, v69, v71);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1B64AB0F8();
  CFTypeID v6 = CFGetTypeID(self->_mesh);
  if (v5 == v6)
  {
    uint64_t v9 = (void *)sub_1B65FDC68(v6, v7);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v11)
    {
      uint64_t v15 = v11;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v9);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend_meshSourcesForSemantic_(self, v12, v18, v14);
          if (v19) {
            objc_msgSend_encodeObject_forKey_(a3, v12, v19, v18);
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v26, (uint64_t)v30, 16);
      }
      while (v15);
    }
    uint64_t v20 = objc_msgSend_meshElements(self, v12, v13, v14);
    if (objc_msgSend_count(v20, v21, v22, v23)) {
      objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)v20, @"elements");
    }
    sourceChannels = self->_sourceChannels;
    if (sourceChannels) {
      objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)sourceChannels, @"sourceChannels");
    }
  }
  uint64_t name = self->_name;
  if (name) {
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)name, @"name");
  }
  sub_1B64FAB54(a3, self, (uint64_t)name, v8);
}

- (VFXMesh)initWithCoder:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)VFXMesh;
  uint64_t v7 = [(VFXMesh *)&v27 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t CFObject = objc_msgSend___createCFObject(v7, v11, v12, v13);
    v7->_int64_t mesh = (__CFXMesh *)CFObject;
    if (CFObject) {
      sub_1B6583684(CFObject, v7, v16, v17, v18, v19, v20, v21);
    }
    objc_msgSend__syncObjCModel(v7, v15, v16, v17);
    objc_msgSend_decodeMeshWithCoder_(v7, v22, (uint64_t)a3, v23);
    sub_1B64FABB0(a3, v7);
    objc_msgSend_setImmediateMode_(VFXTransaction, v24, v8, v25);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end