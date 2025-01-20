@interface VFXMeshSource
+ (BOOL)supportsSecureCoding;
+ (VFXMeshSource)meshSourceWithBuffer:(id)a3 vertexFormat:(unint64_t)a4 semantic:(id)a5 vertexCount:(int64_t)a6 dataOffset:(int64_t)a7 dataStride:(int64_t)a8;
+ (VFXMeshSource)meshSourceWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 floatComponents:(BOOL)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10;
+ (VFXMeshSource)meshSourceWithNormals:(id)a1 count:(SEL)a2;
+ (VFXMeshSource)meshSourceWithTextureCoordinates:(const CGPoint *)a3 count:(int64_t)a4;
+ (VFXMeshSource)meshSourceWithVertices:(id)a1 count:(SEL)a2;
+ (id)_modelSourceWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9;
+ (id)_modelSourceWithSource:(id)a3 vertexFormat:(unint64_t)a4;
+ (id)dataByConvertingDoublesToFloats:(const double *)a3 count:(int64_t)a4;
+ (id)dataWithPointArray:(const CGPoint *)a3 count:(int64_t)a4 bytesPerComponent:(int64_t *)a5;
+ (id)dataWithVector3Array:(id)a1 count:(SEL)a2 bytesPerComponent:;
+ (id)geometrySourceWithColorComponents:(const float *)a3 count:(int64_t)a4 hasAlpha:(BOOL)a5 colorSpace:(CGColorSpace *)a6;
+ (id)geometrySourceWithColorData:(id)a3 colorSpace:(CGColorSpace *)a4 vectorCount:(int64_t)a5 floatComponents:(BOOL)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10;
+ (id)geometrySourceWithMDLVertexAttribute:(id)a3 mesh:(id)a4;
+ (id)geometrySourceWithMeshSourceRef:(__CFXMeshSource *)a3;
- (BOOL)_encodeDataAsHalf;
- (BOOL)floatComponents;
- (NSData)data;
- (NSString)semantic;
- (VFXMeshSource)init;
- (VFXMeshSource)initWithBuffer:(id)a3 vertexFormat:(unint64_t)a4 semantic:(id)a5 vertexCount:(int64_t)a6 dataOffset:(int64_t)a7 dataStride:(int64_t)a8;
- (VFXMeshSource)initWithCoder:(id)a3;
- (VFXMeshSource)initWithData:(id)a3 semantic:(id)a4 colorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 floatComponents:(BOOL)a7 componentsPerVector:(int64_t)a8 bytesPerComponent:(int64_t)a9 dataOffset:(int64_t)a10 dataStride:(int64_t)a11;
- (VFXMeshSource)initWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9;
- (VFXMeshSource)initWithMeshSource:(__CFXMeshSource *)a3;
- (__CFXMeshSource)meshSource;
- (__CFXWorld)worldRef;
- (id)_uninterleaveData:(id)a3 count:(unint64_t)a4 srcOffset:(unint64_t)a5 srcStride:(unint64_t)a6 dstStride:(unint64_t)a7;
- (id)dataByConvertingColorData:(id)a3 colorSpace:(CGColorSpace *)a4 newColorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10 newDataOffset:(int64_t *)a11 newDataStride:(int64_t *)a12;
- (id)description;
- (id)mkSemantic;
- (id)mutableData;
- (id)world;
- (int64_t)bytesPerComponent;
- (int64_t)componentsPerVector;
- (int64_t)dataOffset;
- (int64_t)dataStride;
- (int64_t)vectorCount;
- (signed)_componentType;
- (void)_clearCFXCache;
- (void)_printData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMkSemantic:(id)a3;
- (void)set_encodeDataAsHalf:(BOOL)a3;
@end

@implementation VFXMeshSource

+ (id)geometrySourceWithMDLVertexAttribute:(id)a3 mesh:(id)a4
{
  v6 = objc_msgSend_vertexDescriptor(a4, a2, (uint64_t)a3, (uint64_t)a4);
  unsigned int v13 = (objc_msgSend_format(a3, v7, v8, v9) >> 16) & 0xF;
  if (v13 >= 5)
  {
    BOOL v14 = 0;
    uint64_t v15 = 2;
    if (v13 >= 9)
    {
      unsigned int v16 = v13 - 11;
      if (v16)
      {
        BOOL v14 = v16 < 0xFFFFFFFE;
        uint64_t v15 = 4;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
    uint64_t v15 = 1;
  }
  v17 = objc_msgSend_name(a3, v10, v11, v12);
  char v20 = objc_msgSend_containsString_(v17, v18, *MEMORY[0x1E4F35B90], v19);
  v24 = (uint64_t *)MEMORY[0x1E4F35B60];
  if (v20)
  {
    v25 = VFXMeshSourceSemanticPosition;
  }
  else
  {
    if ((objc_msgSend_containsString_(v17, v21, *MEMORY[0x1E4F35B80], v23) & 1) == 0)
    {
      if (objc_msgSend_containsString_(v17, v21, *MEMORY[0x1E4F35BA0], v23))
      {
        v25 = VFXMeshSourceSemanticTexcoord;
        goto LABEL_14;
      }
      if (objc_msgSend_containsString_(v17, v21, *MEMORY[0x1E4F35B98], v23))
      {
        v25 = VFXMeshSourceSemanticTangent;
        goto LABEL_14;
      }
      v162 = @"aoCoord";
      if ((objc_msgSend_isEqualToString_(v17, v21, @"aoCoord", v23) & 1) != 0
        || (v162 = @"lightmapCoord",
            (objc_msgSend_isEqualToString_(v17, v21, @"lightmapCoord", v23) & 1) != 0))
      {
        v187 = v162;
        v25 = VFXMeshSourceSemanticTexcoord;
        goto LABEL_15;
      }
      if ((objc_msgSend_containsString_(v17, v21, *v24, v23) & 1) != 0
        || (objc_msgSend_containsString_(v17, v21, *MEMORY[0x1E4F35B88], v23) & 1) != 0)
      {
        v25 = VFXMeshSourceSemanticColor;
        goto LABEL_14;
      }
      sub_1B63F2F54(16, @"Error: Unknown Model I/O semantic %@", v22, v23, v182, v183, v184, v185, (uint64_t)v17);
    }
    v25 = VFXMeshSourceSemanticNormal;
  }
LABEL_14:
  v187 = @"unknown";
LABEL_15:
  v26 = *v25;
  v27 = objc_msgSend_layouts(v6, v21, v22, v23);
  uint64_t v31 = objc_msgSend_bufferIndex(a3, v28, v29, v30);
  v34 = objc_msgSend_objectAtIndexedSubscript_(v27, v32, v31, v33);
  unint64_t v38 = objc_msgSend_stride(v34, v35, v36, v37);
  char v42 = objc_msgSend_format(a3, v39, v40, v41);
  uint64_t v46 = objc_msgSend_offset(a3, v43, v44, v45);
  v50 = objc_msgSend_name(a3, v47, v48, v49);
  if (objc_msgSend_containsString_(v50, v51, *v24, v52)
    && objc_msgSend_format(a3, v53, v54, v55) == 65540)
  {
    v56 = objc_msgSend_vertexBuffers(a4, v53, v54, v55);
    uint64_t v60 = objc_msgSend_bufferIndex(a3, v57, v58, v59);
    v63 = objc_msgSend_objectAtIndexedSubscript_(v56, v61, v60, v62);
    v67 = objc_msgSend_map(v63, v64, v65, v66);
    uint64_t v71 = objc_msgSend_bytes(v67, v68, v69, v70);
    v75 = objc_msgSend_vertexBuffers(a4, v72, v73, v74);
    uint64_t v79 = objc_msgSend_bufferIndex(a3, v76, v77, v78);
    v82 = objc_msgSend_objectAtIndexedSubscript_(v75, v80, v79, v81);
    unint64_t v86 = objc_msgSend_length(v82, v83, v84, v85);
    if (objc_msgSend_format(a3, v87, v88, v89) == 786436)
    {
      __p = 0;
      v189 = 0;
      uint64_t v190 = 0;
      if (v86 >= 0x10)
      {
        sub_1B6470B84((unint64_t *)&__p, 4 * (v86 >> 4));
        uint64_t v93 = 0;
        if (v86 >> 4 <= 1) {
          uint64_t v94 = 1;
        }
        else {
          uint64_t v94 = v86 >> 4;
        }
        uint64_t v95 = 4 * v94;
        v96 = (float *)(v71 + 8);
        do
        {
          *((unsigned char *)__p + v93) = (int)(float)(*(v96 - 2) * 255.0);
          *((unsigned char *)__p + v93 + 1) = (int)(float)(*(v96 - 1) * 255.0);
          *((unsigned char *)__p + v93 + 2) = (int)(float)(*v96 * 255.0);
          *((unsigned char *)__p + v93 + 3) = (int)(float)(v96[1] * 255.0);
          v93 += 4;
          v96 += 4;
        }
        while (v95 != v93);
      }
    }
    else
    {
      if (objc_msgSend_format(a3, v90, v91, v92) != 786435)
      {
        if (objc_msgSend_format(a3, v90, v134, v135) == 65539)
        {
          __p = 0;
          v189 = 0;
          uint64_t v190 = 0;
          sub_1B642860C((uint64_t)&__p, 4 * (v86 / 3));
          v168 = __p;
          if (v86 >= 3)
          {
            if (v86 / 3 <= 1) {
              unint64_t v169 = 1;
            }
            else {
              unint64_t v169 = v86 / 3;
            }
            v170 = (float *)((char *)__p + 8);
            v171 = (unsigned char *)(v71 + 2);
            do
            {
              LOBYTE(v167) = *(v171 - 2);
              *(float *)&unsigned int v172 = (float)LODWORD(v167) / 255.0;
              *(v170 - 2) = *(float *)&v172;
              LOBYTE(v172) = *(v171 - 1);
              *(float *)&unsigned int v173 = (float)v172 / 255.0;
              *(v170 - 1) = *(float *)&v173;
              LOBYTE(v173) = *v171;
              float v167 = (float)v173 / 255.0;
              float *v170 = v167;
              v170[1] = 1.0;
              v170 += 4;
              v171 += 3;
              --v169;
            }
            while (v169);
          }
        }
        else
        {
          if (objc_msgSend_format(a3, v163, v164, v165) != 65540) {
            return 0;
          }
          __p = 0;
          v189 = 0;
          uint64_t v190 = 0;
          sub_1B642860C((uint64_t)&__p, v86 & 0xFFFFFFFFFFFFFFFCLL);
          v168 = __p;
          if (v86 >= 4)
          {
            uint64_t v175 = v86 >> 2;
            if (v86 >> 2 <= 1) {
              uint64_t v175 = 1;
            }
            v176 = (unsigned char *)(v71 + 3);
            v177 = (float *)((char *)__p + 8);
            do
            {
              LOBYTE(v174) = *(v176 - 3);
              *(float *)&unsigned int v178 = (float)LODWORD(v174) / 255.0;
              *(v177 - 2) = *(float *)&v178;
              LOBYTE(v178) = *(v176 - 2);
              *(float *)&unsigned int v179 = (float)v178 / 255.0;
              *(v177 - 1) = *(float *)&v179;
              LOBYTE(v179) = *(v176 - 1);
              *(float *)&unsigned int v180 = (float)v179 / 255.0;
              float *v177 = *(float *)&v180;
              LOBYTE(v180) = *v176;
              float v174 = (float)v180 / 255.0;
              v177[1] = v174;
              v176 += 4;
              v177 += 4;
              --v175;
            }
            while (v175);
          }
        }
        v133 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v166, (uint64_t)v168, v189 - v168);
        if (__p)
        {
          v189 = __p;
          operator delete(__p);
        }
        uint64_t v46 = 0;
        BOOL v14 = 1;
        unint64_t v38 = 16;
        uint64_t v15 = 4;
LABEL_37:
        uint64_t v97 = 4;
        if (v133) {
          goto LABEL_38;
        }
        return 0;
      }
      __p = 0;
      v189 = 0;
      uint64_t v190 = 0;
      if (v86 >= 0xC)
      {
        sub_1B6470B84((unint64_t *)&__p, 4 * (v86 / 0xC));
        uint64_t v136 = 0;
        if (v86 / 0xC <= 1) {
          unint64_t v137 = 1;
        }
        else {
          unint64_t v137 = v86 / 0xC;
        }
        uint64_t v138 = 4 * v137;
        v139 = (float *)(v71 + 4);
        do
        {
          *((unsigned char *)__p + v136) = (int)(float)(*(v139 - 1) * 255.0);
          *((unsigned char *)__p + v136 + 1) = (int)(float)(*v139 * 255.0);
          *((unsigned char *)__p + v136 + 2) = (int)(float)(v139[1] * 255.0);
          *((unsigned char *)__p + v136 + 3) = -1;
          v136 += 4;
          v139 += 3;
        }
        while (v138 != v136);
      }
    }
    v133 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v90, (uint64_t)__p, v189 - (unsigned char *)__p);
    if (__p)
    {
      v189 = __p;
      operator delete(__p);
    }
    uint64_t v46 = 0;
    BOOL v14 = 0;
    unint64_t v38 = 4;
    uint64_t v15 = 1;
    goto LABEL_37;
  }
  uint64_t v97 = v42 & 7;
  v98 = objc_msgSend_vertexBuffers(a4, v53, v54, v55);
  uint64_t v102 = objc_msgSend_bufferIndex(a3, v99, v100, v101);
  v105 = objc_msgSend_objectAtIndexedSubscript_(v98, v103, v102, v104);
  v109 = objc_msgSend_map(v105, v106, v107, v108);
  uint64_t v113 = objc_msgSend_bytes(v109, v110, v111, v112);
  v117 = objc_msgSend_vertexBuffers(a4, v114, v115, v116);
  uint64_t v121 = objc_msgSend_bufferIndex(a3, v118, v119, v120);
  v124 = objc_msgSend_objectAtIndexedSubscript_(v117, v122, v121, v123);
  uint64_t v128 = objc_msgSend_length(v124, v125, v126, v127);
  v133 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v129, v113, v128);
  if (!v133) {
    return 0;
  }
LABEL_38:
  unint64_t v140 = objc_msgSend_length(v133, v130, v131, v132);
  if (objc_msgSend_isEqualToString_(v26, v141, @"kGeometrySourceSemanticTexcoord", v142))
  {
    uint64_t v146 = objc_msgSend_format(a3, v143, v144, v145);
    uint64_t v150 = objc_msgSend_bytes(v133, v147, v148, v149);
    if (v146 == 786434)
    {
      if (v38 <= v140)
      {
        v157 = (float *)(v150 + v46 + 4);
        unint64_t v158 = v140 / v38;
        do
        {
          float *v157 = 1.0 - *v157;
          v157 = (float *)((char *)v157 + v38);
          --v158;
        }
        while (v158);
      }
    }
    else
    {
      sub_1B63F2F54(0, @"Warning: Warning: unable to flip non-float2 texture coordinates, skipping\n", v151, v152, v153, v154, v155, v156, v186);
    }
  }
  v159 = objc_msgSend_meshSourceWithData_semantic_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(VFXMeshSource, v143, (uint64_t)v133, (uint64_t)v26, v140 / v38, v14, v97, v15, v46, v38);
  objc_msgSend_setMkSemantic_(v159, v160, (uint64_t)v187, v161);
  return v159;
}

+ (id)geometrySourceWithMeshSourceRef:(__CFXMeshSource *)a3
{
  id result = sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithMeshSource_(v6, v7, (uint64_t)a3, v8);
    return v9;
  }
  return result;
}

- (VFXMeshSource)initWithMeshSource:(__CFXMeshSource *)a3
{
  v51.receiver = self;
  v51.super_class = (Class)VFXMeshSource;
  v4 = [(VFXMeshSource *)&v51 init];
  if (a3)
  {
    v4->_meshSource = (__CFXMeshSource *)CFRetain(a3);
    v4->_data = (NSData *)(id)sub_1B641D89C(a3);
    sub_1B641D478((uint64_t)a3, v5, v6, v7, v8, v9, v10, v11);
    unint64_t v13 = v12;
    unsigned int v20 = sub_1B641D56C((uint64_t)a3, v12, v14, v15, v16, v17, v18, v19);
    if (v20 > 8) {
      v21 = 0;
    }
    else {
      v21 = off_1E6145238[v20];
    }
    v4->_semantic = (NSString *)v21;
    v4->_vectorCount = v13;
    v4->_componentType = BYTE6(v13);
    v4->_componentCount = HIBYTE(v13);
    v4->_mkSemantic = sub_1B641ECDC((uint64_t)a3, v22, v23, v24, v25, v26, v27, v28);
    sub_1B6583684((uint64_t)a3, v4, v29, v30, v31, v32, v33, v34);
    uint64_t v42 = sub_1B641E1A8((uint64_t)a3, v35, v36, v37, v38, v39, v40, v41);
    v4->_dataOffset = sub_1B6534BD0(v42, v43, v44, v45, v46, v47, v48, v49);
    v4->_dataStride = sub_1B65349B8(v42);
  }
  return v4;
}

- (VFXMeshSource)init
{
  return (VFXMeshSource *)objc_msgSend_initWithMeshSource_(self, a2, 0, v2);
}

- (void)dealloc
{
  meshSource = self->_meshSource;
  if (meshSource)
  {
    sub_1B6583684((uint64_t)meshSource, 0, v2, v3, v4, v5, v6, v7);
    uint64_t v10 = self->_meshSource;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B65FE04C;
    v14[3] = &unk_1E6140A18;
    v14[4] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, 0, 0, v14);
  }

  colorSpace = self->_colorSpace;
  if (colorSpace)
  {
    CFRelease(colorSpace);
    self->_colorSpace = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)VFXMeshSource;
  [(VFXMeshSource *)&v13 dealloc];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_semantic(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_vectorCount(self, v10, v11, v12);
  v21 = sub_1B63CA8A4(self->_componentType, v14, v15, v16, v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend_componentsPerVector(self, v22, v23, v24);
  return (id)objc_msgSend_stringWithFormat_(v3, v26, @"<%@: %p | semantic=%@ vectors=%d %@x%d>", v27, v5, self, v9, v13, v21, v25);
}

+ (id)dataByConvertingDoublesToFloats:(const double *)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  uint64_t v6 = 4 * a4;
  uint64_t v7 = (float *)malloc_type_malloc(4 * a4, 0x7868951uLL);
  uint64_t v9 = (uint64_t)v7;
  if (v4 >= 1)
  {
    uint64_t v10 = v7;
    do
    {
      double v11 = *a3++;
      float v12 = v11;
      *v10++ = v12;
      --v4;
    }
    while (v4);
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v13, v8, v9, v6, 1);
}

+ (id)dataWithVector3Array:(id)a1 count:(SEL)a2 bytesPerComponent:
{
  if (v4) {
    void *v4 = 4;
  }
  return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], a2, v2, 16 * v3);
}

+ (id)dataWithPointArray:(const CGPoint *)a3 count:(int64_t)a4 bytesPerComponent:(int64_t *)a5
{
  int64_t v5 = a4;
  if (a5) {
    *a5 = 4;
  }
  uint64_t v7 = 8 * a4;
  uint64_t v8 = (float32x2_t *)malloc_type_malloc(8 * a4, 0xB55F8631uLL);
  uint64_t v10 = (uint64_t)v8;
  if (v5 >= 1)
  {
    double v11 = v8;
    do
    {
      float64x2_t v12 = *(float64x2_t *)a3++;
      *v11++ = vcvt_f32_f64(v12);
      --v5;
    }
    while (v5);
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v13, v9, v10, v7, 1);
}

- (VFXMeshSource)initWithData:(id)a3 semantic:(id)a4 colorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 floatComponents:(BOOL)a7 componentsPerVector:(int64_t)a8 bytesPerComponent:(int64_t)a9 dataOffset:(int64_t)a10 dataStride:(int64_t)a11
{
  BOOL v12 = a7;
  int64_t v17 = a10;
  int64_t v18 = a11;
  v46.receiver = self;
  v46.super_class = (Class)VFXMeshSource;
  uint64_t v26 = [(VFXMeshSource *)&v46 init];
  if (v26)
  {
    int64_t v27 = a9;
    if (a9 == 8)
    {
      if (v17 || v18 && 8 * a8 != v18)
      {
        sub_1B63F2F54(16, @"Error: meshSourceWithData: interleaved buffers as doubles are not supported", v20, v21, v22, v23, v24, v25, v45);
        return 0;
      }
      uint64_t v28 = objc_opt_class();
      uint64_t v32 = objc_msgSend_bytes(a3, v29, v30, v31);
      a3 = (id)objc_msgSend_dataByConvertingDoublesToFloats_count_(v28, v33, v32, a8 * a6);
      int64_t v18 = 4 * a8;
      a11 = 4 * a8;
      int64_t v27 = 4;
    }
    if (a5 && objc_msgSend_isEqualToString_(a4, v19, @"kGeometrySourceSemanticColor", v21)) {
      a3 = (id)objc_msgSend_dataByConvertingColorData_colorSpace_newColorSpace_vectorCount_componentsPerVector_bytesPerComponent_dataOffset_dataStride_newDataOffset_newDataStride_(v26, v34, (uint64_t)a3, (uint64_t)a5, &v26->_colorSpace, a6, a8, v27, v17, v18, &a10, &a11);
    }
    v26->_data = (NSData *)a3;
    v26->_semantic = (NSString *)objc_msgSend_copy(a4, v35, v36, v37);
    v26->_vectorCount = a6;
    v26->_componentType = sub_1B63CADD8(v27, 1, v12, v38, v39, v40, v41, v42);
    v26->_componentCount = a8;
    int64_t v43 = a11;
    if (!a11) {
      int64_t v43 = v27 * a8;
    }
    v26->_dataOffset = a10;
    v26->_dataStride = v43;
  }
  return v26;
}

- (VFXMeshSource)initWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9
{
  unsigned __int16 v10 = a7;
  int v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)VFXMeshSource;
  uint64_t v15 = [(VFXMeshSource *)&v28 init];
  if (v15)
  {
    int64_t v16 = a9;
    v15->_data = (NSData *)a3;
    v15->_semantic = (NSString *)objc_msgSend_copy(a4, v17, v18, v19);
    v15->_vectorCount = a5;
    v15->_componentType = v11;
    v15->_componentCount = v10;
    v15->_dataOffset = a8;
    if (!a9) {
      int64_t v16 = sub_1B63CA534(v11, v20, v21, v22, v23, v24, v25, v26) * v15->_componentCount;
    }
    v15->_dataStride = v16;
  }
  return v15;
}

- (VFXMeshSource)initWithBuffer:(id)a3 vertexFormat:(unint64_t)a4 semantic:(id)a5 vertexCount:(int64_t)a6 dataOffset:(int64_t)a7 dataStride:(int64_t)a8
{
  v48.receiver = self;
  v48.super_class = (Class)VFXMeshSource;
  uint64_t v14 = [(VFXMeshSource *)&v48 init];
  if (v14)
  {
    v14->_mtlBuffer = (MTLBuffer *)a3;
    v14->_semantic = (NSString *)objc_msgSend_copy(a5, v15, v16, v17);
    v14->_vectorCount = a6;
    v14->_mtlVertexFormat = a4;
    unsigned int v25 = sub_1B64D7FD8(a4, v18, v19, v20, v21, v22, v23, v24);
    v14->_componentType = sub_1B63CA908(v25, v26, v27, v28, v29, v30, v31, v32);
    v14->_componentCount = sub_1B63CA958(v25, v33, v34, v35, v36, v37, v38, v39);
    v14->_dataOffset = a7;
    if (!a8) {
      a8 = sub_1B63CA534(v25, v40, v41, v42, v43, v44, v45, v46);
    }
    v14->_dataStride = a8;
  }
  return v14;
}

+ (VFXMeshSource)meshSourceWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 floatComponents:(BOOL)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10
{
  BOOL v12 = a6;
  id v16 = objc_alloc((Class)a1);
  uint64_t v18 = objc_msgSend_initWithData_semantic_colorSpace_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(v16, v17, (uint64_t)a3, (uint64_t)a4, 0, a5, v12, a7, a8, a9, a10);

  return (VFXMeshSource *)v18;
}

+ (id)_modelSourceWithData:(id)a3 semantic:(id)a4 vectorCount:(int64_t)a5 componentType:(signed __int16)a6 componentCount:(unint64_t)a7 dataOffset:(int64_t)a8 dataStride:(int64_t)a9
{
  uint64_t v11 = a6;
  id v15 = objc_alloc((Class)a1);
  uint64_t v17 = objc_msgSend_initWithData_semantic_vectorCount_componentType_componentCount_dataOffset_dataStride_(v15, v16, (uint64_t)a3, (uint64_t)a4, a5, v11, a7, a8, a9);

  return v17;
}

+ (VFXMeshSource)meshSourceWithVertices:(id)a1 count:(SEL)a2
{
  uint64_t v4 = v3;
  uint64_t v9 = 0;
  uint64_t v6 = objc_msgSend_dataWithVector3Array_count_bytesPerComponent_(a1, a2, v2, v3, &v9);
  return (VFXMeshSource *)objc_msgSend_meshSourceWithData_semantic_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(a1, v7, v6, @"kGeometrySourceSemanticPosition", v4, 1, 3, v9, 0, 16);
}

+ (VFXMeshSource)meshSourceWithNormals:(id)a1 count:(SEL)a2
{
  uint64_t v4 = v3;
  uint64_t v9 = 0;
  uint64_t v6 = objc_msgSend_dataWithVector3Array_count_bytesPerComponent_(a1, a2, v2, v3, &v9);
  return (VFXMeshSource *)objc_msgSend_meshSourceWithData_semantic_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(a1, v7, v6, @"kGeometrySourceSemanticNormal", v4, 1, 3, v9, 0, 16);
}

+ (VFXMeshSource)meshSourceWithTextureCoordinates:(const CGPoint *)a3 count:(int64_t)a4
{
  uint64_t v9 = 0;
  uint64_t v6 = objc_msgSend_dataWithPointArray_count_bytesPerComponent_(a1, a2, (uint64_t)a3, a4, &v9);
  return (VFXMeshSource *)objc_msgSend_meshSourceWithData_semantic_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(a1, v7, v6, @"kGeometrySourceSemanticTexcoord", a4, 1, 2, v9, 0, 0);
}

- (id)dataByConvertingColorData:(id)a3 colorSpace:(CGColorSpace *)a4 newColorSpace:(CGColorSpace *)a5 vectorCount:(int64_t)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10 newDataOffset:(int64_t *)a11 newDataStride:(int64_t *)a12
{
  uint64_t v17 = a12;
  int64_t v18 = a9;
  sub_1B63C9198();
  ColorSpace = (CGColorSpace *)CGColorTransformGetColorSpace();
  uint64_t v20 = *a5;
  if (*a5 != ColorSpace)
  {
    if (v20)
    {
      CFRelease(v20);
      *a5 = 0;
    }
    if (ColorSpace) {
      uint64_t v21 = (CGColorSpace *)CFRetain(ColorSpace);
    }
    else {
      uint64_t v21 = 0;
    }
    *a5 = v21;
  }
  if (CFEqual(a4, ColorSpace)) {
    goto LABEL_19;
  }
  int64_t v25 = a8 * a7;
  if (a10) {
    int64_t v26 = a10;
  }
  else {
    int64_t v26 = a8 * a7;
  }
  id v38 = a3;
  uint64_t v27 = objc_msgSend_bytes(a3, v22, v23, v24);
  uint64_t v37 = v25 * a6;
  uint64_t v28 = (char *)malloc_type_malloc(v25 * a6, 0x6123C480uLL);
  if (!CGColorTransformConvertData())
  {
    free(v28);
    int64_t v18 = a9;
    uint64_t v17 = a12;
    a3 = v38;
LABEL_19:
    *a11 = v18;
    int64_t *v17 = a10;
    return a3;
  }
  *a11 = 0;
  *a12 = v25;
  if (a7 == 4)
  {
    uint64_t v30 = (uint64_t)v28;
    if (a6 >= 1)
    {
      uint64_t v31 = v27;
      uint64_t v32 = &v28[3 * a8];
      uint64_t v33 = (char *)(v31 + 3 * a8 + a9);
      do
      {
        memcpy(v32, v33, a8);
        v32 += v25;
        v33 += v26;
        --a6;
      }
      while (a6);
    }
    uint64_t v34 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v35 = v30;
  }
  else
  {
    uint64_t v34 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v35 = (uint64_t)v28;
  }

  return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v34, v29, v35, v37, 1);
}

+ (id)geometrySourceWithColorComponents:(const float *)a3 count:(int64_t)a4 hasAlpha:(BOOL)a5 colorSpace:(CGColorSpace *)a6
{
  BOOL v7 = a5;
  sub_1B63C9198();
  ColorSpace = (const void *)CGColorTransformGetColorSpace();
  if (!a6) {
    a6 = (CGColorSpace *)sub_1B63C9388();
  }
  if (v7) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 3;
  }
  if (CFEqual(a6, ColorSpace))
  {
    uint64_t v14 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v13, (uint64_t)a3, 4 * v12 * a4);
  }
  else
  {
    id v29 = a1;
    id v15 = malloc_type_malloc(4 * v12 * a4, 0x795F62BuLL);
    int v28 = 4 * v12;
    int v27 = 4 * v12;
    if (CGColorTransformConvertData())
    {
      if (a4 >= 1 && v7)
      {
        uint64_t v17 = v15 + 3;
        int64_t v18 = a3 + 3;
        int64_t v19 = a4;
        do
        {
          int v20 = *(_DWORD *)v18;
          v18 += 4;
          _DWORD *v17 = v20;
          v17 += 4;
          --v19;
        }
        while (v19);
      }
      uint64_t v21 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v16, (uint64_t)v15, 4 * v12 * a4, 1, v27, v15, 96, v28);
    }
    else
    {
      free(v15);
      uint64_t v21 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v22, (uint64_t)a3, 4 * v12 * a4, v27, v15, 96, v28);
    }
    uint64_t v14 = v21;
    a1 = v29;
  }
  id v23 = objc_alloc((Class)a1);
  int64_t v25 = objc_msgSend_initWithData_semantic_colorSpace_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(v23, v24, v14, @"kGeometrySourceSemanticColor", ColorSpace, a4, 1, v12, 4, 0, 4 * v12);

  return v25;
}

+ (id)geometrySourceWithColorData:(id)a3 colorSpace:(CGColorSpace *)a4 vectorCount:(int64_t)a5 floatComponents:(BOOL)a6 componentsPerVector:(int64_t)a7 bytesPerComponent:(int64_t)a8 dataOffset:(int64_t)a9 dataStride:(int64_t)a10
{
  BOOL v12 = a6;
  id v16 = objc_alloc((Class)a1);
  int64_t v18 = objc_msgSend_initWithData_semantic_colorSpace_vectorCount_floatComponents_componentsPerVector_bytesPerComponent_dataOffset_dataStride_(v16, v17, (uint64_t)a3, @"kGeometrySourceSemanticColor", a4, a5, v12, a7, a8, a9, a10);

  return v18;
}

+ (VFXMeshSource)meshSourceWithBuffer:(id)a3 vertexFormat:(unint64_t)a4 semantic:(id)a5 vertexCount:(int64_t)a6 dataOffset:(int64_t)a7 dataStride:(int64_t)a8
{
  if (a4)
  {
    id v14 = objc_alloc((Class)a1);
    id v16 = objc_msgSend_initWithBuffer_vertexFormat_semantic_vertexCount_dataOffset_dataStride_(v14, v15, (uint64_t)a3, a4, a5, a6, a7, a8);
    return (VFXMeshSource *)v16;
  }
  else
  {
    sub_1B63F2F54(16, @"Error: meshSourceWithBuffer - invalid vertex format", (uint64_t)a3, 0, (uint64_t)a5, a6, a7, a8, v18);
    return 0;
  }
}

+ (id)_modelSourceWithSource:(id)a3 vertexFormat:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  if (!a4)
  {
    sub_1B63F2F54(16, @"Error: _modelSourceWithSource - invalid vertex format", (uint64_t)a3, 0, v4, v5, v6, v7, v27);
    return 0;
  }
  uint64_t v10 = sub_1B64D7FD8(a4, (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7);
  uint64_t v14 = objc_msgSend_meshSource(a3, v11, v12, v13);
  uint64_t v20 = sub_1B641E5D0(v14, v10, 0, v15, v16, v17, v18, v19);
  if (!v20)
  {
    NSLog(&cfstr_Modelsourcewit.isa);
    return 0;
  }
  uint64_t v21 = v20;
  id v22 = objc_alloc((Class)a1);
  int64_t v25 = objc_msgSend_initWithMeshSource_(v22, v23, v21, v24);

  return v25;
}

- (BOOL)_encodeDataAsHalf
{
  return self->_encodeDataAsHalf;
}

- (void)set_encodeDataAsHalf:(BOOL)a3
{
  self->_encodeDataAsHalf = a3;
}

- (id)mkSemantic
{
  unint64_t mkSemantic = (char)self->_mkSemantic;
  if (mkSemantic > 9) {
    uint64_t v3 = (id *)MEMORY[0x1E4F35B60];
  }
  else {
    uint64_t v3 = (id *)qword_1E6145280[mkSemantic];
  }
  return *v3;
}

- (void)setMkSemantic:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, *MEMORY[0x1E4F35B50], v3))
  {
    char v13 = 0;
  }
  else if (objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E4F35B90], v8))
  {
    char v13 = 1;
  }
  else if (objc_msgSend_isEqualToString_(a3, v14, *MEMORY[0x1E4F35BA0], v8))
  {
    char v13 = 2;
  }
  else if (objc_msgSend_isEqualToString_(a3, v15, *MEMORY[0x1E4F35B80], v8))
  {
    char v13 = 3;
  }
  else if (objc_msgSend_isEqualToString_(a3, v16, @"aoCoord", v8))
  {
    char v13 = 4;
  }
  else if (objc_msgSend_isEqualToString_(a3, v17, *MEMORY[0x1E4F35B60], v8))
  {
    char v13 = 5;
  }
  else if (objc_msgSend_isEqualToString_(a3, v18, *MEMORY[0x1E4F35B88], v8))
  {
    char v13 = 6;
  }
  else if (objc_msgSend_isEqualToString_(a3, v19, *MEMORY[0x1E4F35B98], v8))
  {
    char v13 = 7;
  }
  else if (objc_msgSend_isEqualToString_(a3, v20, *MEMORY[0x1E4F35B58], v8))
  {
    char v13 = 8;
  }
  else if (objc_msgSend_isEqualToString_(a3, v21, @"lightmapCoord", v8))
  {
    char v13 = 9;
  }
  else
  {
    char v13 = 0;
  }
  self->_unint64_t mkSemantic = v13;
  meshSource = self->_meshSource;
  if (meshSource)
  {
    sub_1B641ED28((uint64_t)meshSource, v13, v7, v8, v9, v10, v11, v12);
  }
}

- (NSData)data
{
  id result = self->_data;
  if (!result)
  {
    id result = (NSData *)self->_mtlBuffer;
    if (result)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v7 = objc_msgSend_contents(result, a2, v2, v3);
      uint64_t v12 = objc_msgSend_length(self->_mtlBuffer, v8, v9, v10);
      return (NSData *)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v6, v11, v7, v12, 0);
    }
  }
  return result;
}

- (void)_printData
{
  uint64_t v4 = objc_msgSend_meshSource(self, a2, v2, v3);
  uint64_t v12 = sub_1B641D8A0(v4, v5, v6, v7, v8, v9, v10, v11);

  sub_1B641E7F0(v4, v12, v13, v14, v15, v16, v17, v18);
}

- (NSString)semantic
{
  return self->_semantic;
}

- (int64_t)vectorCount
{
  return self->_vectorCount;
}

- (BOOL)floatComponents
{
  return sub_1B63CA9F0(self->_componentType, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int64_t)componentsPerVector
{
  return self->_componentCount;
}

- (int64_t)bytesPerComponent
{
  return sub_1B63CA9A4(self->_componentType, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int64_t)dataOffset
{
  return self->_dataOffset;
}

- (int64_t)dataStride
{
  return self->_dataStride;
}

- (signed)_componentType
{
  return self->_componentType;
}

- (void)_clearCFXCache
{
  if (self->_data)
  {
    meshSource = self->_meshSource;
    if (meshSource)
    {
      if (!sub_1B647BCA0((uint64_t)meshSource, a2, v2, v3, v4, v5, v6, v7))
      {
        uint64_t v16 = self->_meshSource;
        if (v16)
        {
          sub_1B6583684((uint64_t)v16, 0, v10, v11, v12, v13, v14, v15);
          uint64_t v17 = self->_meshSource;
          if (v17)
          {
            CFRelease(v17);
            self->_meshSource = 0;
          }
        }
      }
    }
  }
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

- (__CFXMeshSource)meshSource
{
  if (!self->_meshSource)
  {
    if (self->_componentType)
    {
      mtlBuffer = self->_mtlBuffer;
      __int16 v11 = sub_1B65FDCF8(self->_semantic, a2, v2, v3);
      if (mtlBuffer) {
        uint64_t v14 = (__CFXMeshSource *)sub_1B64D948C(v11, self->_mtlBuffer, self->_mtlVertexFormat, self->_vectorCount, self->_dataStride, self->_dataOffset, v12, v13);
      }
      else {
        uint64_t v14 = (__CFXMeshSource *)sub_1B641D00C(v11, self->_data, self->_componentType, self->_componentCount, self->_vectorCount, self->_dataStride, self->_dataOffset, v13);
      }
      self->_meshSource = v14;
      sub_1B641ED28((uint64_t)v14, self->_mkSemantic, v15, v16, v17, v18, v19, v20);
      meshSource = self->_meshSource;
      if (meshSource) {
        sub_1B6583684((uint64_t)meshSource, self, v21, v22, v23, v24, v25, v26);
      }
    }
    else
    {
      sub_1B63F2F54(16, @"Error: Could not create mesh source", v2, v3, v4, v5, v6, v7, v28);
    }
  }
  return self->_meshSource;
}

- (id)_uninterleaveData:(id)a3 count:(unint64_t)a4 srcOffset:(unint64_t)a5 srcStride:(unint64_t)a6 dstStride:(unint64_t)a7
{
  unint64_t v10 = a4;
  uint64_t v12 = a7 * a4;
  uint64_t v13 = objc_msgSend_dataWithCapacity_(MEMORY[0x1E4F1CA58], a2, a7 * a4, a4);
  objc_msgSend_setLength_(v13, v14, v12, v15);
  uint64_t v19 = (char *)objc_msgSend_mutableBytes(v13, v16, v17, v18);
  uint64_t v23 = objc_msgSend_bytes(a3, v20, v21, v22);
  if (v10)
  {
    uint64_t v24 = (char *)(v23 + a5);
    do
    {
      memcpy(v19, v24, a7);
      v24 += a6;
      v19 += a7;
      --v10;
    }
    while (v10);
  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  LOWORD(v6) = self->_componentType;
  int64_t dataOffset = self->_dataOffset;
  int64_t dataStride = self->_dataStride;
  uint64_t v9 = objc_msgSend_data(self, a2, (uint64_t)a3, v3);
  if (v9)
  {
    uint64_t v17 = (void *)v9;
    if (self->_encodeDataAsHalf)
    {
      int componentType = (unsigned __int16)self->_componentType;
      if (componentType != (unsigned __int16)sub_1B63CA908((__int16)componentType, (uint64_t)v10, v11, v12, v13, v14, v15, v16))sub_1B63F2F54(17, @"Assertion '%s' failed. VFXMeshSource should only store a base type", v19, v20, v21, v22, v23, v24, (uint64_t)"_componentType == CFXBaseTypeGetComponentType(_componentType)"); {
      if (self->_componentType == 14)
      }
      {
        id v25 = v17;
      }
      else
      {
        int componentCount = self->_componentCount;
        if ((componentCount - 2) >= 3)
        {
          sub_1B63F2F54(17, @"Assertion '%s' failed. vImageEncodeVectorHalf only supports half2/3/4", v19, v20, v21, v22, v23, v24, (uint64_t)"_componentCount >= 2 && _componentCount <= 4");
          int componentCount = self->_componentCount;
        }
        uint64_t v40 = (const void *)sub_1B641E5D0((uint64_t)self->_meshSource, *(__int16 *)&asc_1B6F7524A[2 * componentCount - 4], 0, v20, v21, v22, v23, v24);
        if (!v40) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v34, v35, v36, v37, v38, v39, (uint64_t)"halfSource");
        }
        uint64_t v41 = sub_1B641E1A8((uint64_t)v40, v33, v34, v35, v36, v37, v38, v39);
        unsigned int v42 = sub_1B6534654(v41);
        int v6 = sub_1B63CA908(v42, v43, v44, v45, v46, v47, v48, v49);
        int64_t dataStride = sub_1B65349B8(v41);
        int64_t dataOffset = sub_1B6534BD0(v41, v50, v51, v52, v53, v54, v55, v56);
        if (v6 != 14) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. Consistenty check issue during conversion for vImageEncodeVectorHalf", v58, v59, v60, v61, v62, v63, (uint64_t)"encodedComponentType == kCFXBaseTypeHalf");
        }
        sub_1B63CA534(v6, v57, v58, v59, v60, v61, v62, v63);
        id v25 = (id)sub_1B641D89C(v40);
        CFRelease(v40);
      }
      uint64_t v96 = vImageEncodeVectorOptionsCreate();
      vImageEncodeVectorOptionsSetQuantization();
      uint64_t v95 = 0;
      objc_msgSend_bytes(v25, v64, v65, v66);
      objc_msgSend_length(v25, v67, v68, v69);
      uint64_t v70 = vImageEncodeVectorHalf();

      if (!v70) {
        sub_1B63F2F54(17, @"Assertion '%s' failed. vImageEncodeVectorHalf failed to write bytes", v71, v72, v73, v74, v75, v76, (uint64_t)"compressedSize > 0");
      }
      vImageEncodeVectorOptionsFree();
      uint64_t v78 = objc_msgSend_dataWithBytesNoCopy_length_(MEMORY[0x1E4F1C9B8], v77, v95, v70);
      objc_msgSend_encodeObject_forKey_(a3, v79, v78, @"cdata");
    }
    else
    {
      uint64_t v26 = objc_msgSend_bytesPerComponent(self, v10, v11, v12);
      int64_t v31 = objc_msgSend_componentsPerVector(self, v27, v28, v29) * v26;
      if (v31 < self->_dataStride)
      {
        uint64_t v17 = objc_msgSend__uninterleaveData_count_srcOffset_srcStride_dstStride_(self, v30, (uint64_t)v17, self->_vectorCount, self->_dataOffset);
        int64_t dataOffset = 0;
        int64_t dataStride = v31;
      }
      objc_msgSend_encodeObject_forKey_(a3, v30, (uint64_t)v17, @"data");
    }
  }
  semantic = self->_semantic;
  if (semantic) {
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)semantic, @"semantic");
  }
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->_vectorCount, @"vectorCount");
  uint64_t v95 = 0;
  uint64_t v96 = 0;
  unsigned __int8 v94 = 0;
  if (sub_1B63CAD14((__int16)v6, &v96, &v95, &v94, v81, v82, v83, v84))
  {
    objc_msgSend_encodeBool_forKey_(a3, v85, v94, @"floatComponents");
    objc_msgSend_encodeInteger_forKey_(a3, v86, v96, @"bytesPerComponent");
  }
  else
  {
    objc_msgSend_encodeInteger_forKey_(a3, v85, (__int16)v6, @"componentType");
  }
  objc_msgSend_encodeInteger_forKey_(a3, v87, self->_componentCount, @"componentsPerVector");
  objc_msgSend_encodeInteger_forKey_(a3, v88, dataOffset, @"dataOffset");
  objc_msgSend_encodeInteger_forKey_(a3, v89, dataStride, @"dataStride");
  objc_msgSend_encodeInt_forKey_(a3, v90, self->_mkSemantic, @"mkSemantic");
  colorSpace = self->_colorSpace;
  if (colorSpace)
  {
    CFPropertyListRef v92 = CGColorSpaceCopyPropertyList(colorSpace);
    objc_msgSend_encodeObject_forKey_(a3, v93, (uint64_t)v92, @"colorSpace");
    CFRelease(v92);
  }
}

- (VFXMeshSource)initWithCoder:(id)a3
{
  v173.receiver = self;
  v173.super_class = (Class)VFXMeshSource;
  uint64_t v7 = [(VFXMeshSource *)&v173 init];
  if (!v7) {
    return v7;
  }
  uint64_t v8 = &off_1E6140000;
  uint64_t v9 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
  objc_msgSend_setImmediateMode_(VFXTransaction, v10, 1, v11);
  uint64_t v12 = objc_opt_class();
  uint64_t v14 = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, @"semantic");
  v7->_semantic = v14;
  if (objc_msgSend_isEqualToString_(v14, v15, @"kGeometrySourceSemanticVertex", v16))
  {

    v7->_semantic = (NSString *)@"kGeometrySourceSemanticPosition";
  }
  v7->_int64_t vectorCount = objc_msgSend_decodeIntegerForKey_(a3, v17, @"vectorCount", v18);
  v7->_uint64_t dataOffset = objc_msgSend_decodeIntegerForKey_(a3, v19, @"dataOffset", v20);
  v7->_int64_t dataStride = objc_msgSend_decodeIntegerForKey_(a3, v21, @"dataStride", v22);
  v7->_uint64_t componentCount = objc_msgSend_decodeIntegerForKey_(a3, v23, @"componentsPerVector", v24);
  signed __int16 v27 = objc_msgSend_decodeIntegerForKey_(a3, v25, @"componentType", v26);
  v7->_int componentType = v27;
  if (!v27)
  {
    uint64_t v30 = objc_msgSend_decodeBoolForKey_(a3, v28, @"floatComponents", v29);
    uint64_t v33 = objc_msgSend_decodeIntegerForKey_(a3, v31, @"bytesPerComponent", v32);
    v7->_int componentType = sub_1B63CADD8(v33, 1, v30, v34, v35, v36, v37, v38);
  }
  uint64_t v39 = objc_opt_class();
  uint64_t v41 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v40, v39, @"cdata");
  v7->_encodeDataAsHalf = v41 != 0;
  if (v41)
  {
    uint64_t v49 = (void *)v41;
    int componentType = (unsigned __int16)v7->_componentType;
    if (componentType == (unsigned __int16)sub_1B63CA908((__int16)componentType, v42, v43, v44, v45, v46, v47, v48))
    {
      if (v7->_componentType == 14)
      {
        sub_1B63CA534(14, v51, v52, v53, v54, v55, v56, v57);
        size_t v58 = v7->_dataStride * v7->_vectorCount;
        uint64_t v59 = malloc_type_malloc(v58, 0x42562927uLL);
        objc_msgSend_bytes(v49, v60, v61, v62);
        objc_msgSend_length(v49, v63, v64, v65);
        if (vImageDecodeVectorHalf() != v58) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. Decoding failed", v66, v67, v68, v69, v70, v71, (uint64_t)"decompressedSize == decompressedDataCapacity");
        }
        id v72 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v74 = (NSData *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v72, v73, (uint64_t)v59, v58, 1);
        uint64_t v9 = v9;
        uint64_t v8 = &off_1E6140000;
        goto LABEL_13;
      }
    }
    else
    {
      sub_1B63F2F54(16, @"Unreachable code: VFXMeshSource should only store a base type", v52, v53, v54, v55, v56, v57, dataOffset);
      if (v7->_componentType == 14)
      {
LABEL_23:
        objc_msgSend_setImmediateMode_(VFXTransaction, v116, v9, v53);

        return 0;
      }
    }
    sub_1B63F2F54(16, @"Unreachable code: Data is marked as compressed but does not contain half components", v52, v53, v54, v55, v56, v57, dataOffset);
    goto LABEL_23;
  }
  uint64_t v77 = objc_opt_class();
  uint64_t v74 = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v78, v77, @"data");
LABEL_13:
  v7->_uint64_t data = v74;
  v7->_unint64_t mkSemantic = objc_msgSend_decodeIntForKey_(a3, v75, @"mkSemantic", v76);
  uint64_t v81 = (const void *)objc_msgSend_decodePropertyListForKey_(a3, v79, @"colorSpace", v80);
  if (v81)
  {
    CGColorSpaceRef v82 = CGColorSpaceCreateWithPropertyList(v81);
    if (v82)
    {
      CGColorSpaceRef v90 = v82;
      uint64_t data = (uint64_t)v7->_data;
      int64_t vectorCount = v7->_vectorCount;
      uint64_t componentCount = v7->_componentCount;
      uint64_t v94 = sub_1B63CA9A4(v7->_componentType, v83, v84, v85, v86, v87, v88, v89);
      uint64_t dataOffset = v7->_dataOffset;
      v7->_uint64_t data = (NSData *)objc_msgSend_dataByConvertingColorData_colorSpace_newColorSpace_vectorCount_componentsPerVector_bytesPerComponent_dataOffset_dataStride_newDataOffset_newDataStride_(v7, v95, data, (uint64_t)v90, &v7->_colorSpace, vectorCount, componentCount, v94);
      CFRelease(v90);
    }
  }
  if ((+[VFXView _isMetalSupported]_0() & 1) == 0)
  {
    unsigned int v99 = (unsigned __int16)v7->_componentType;
    if (v99 <= 0x17 && ((1 << v99) & 0xC04000) != 0)
    {
      uint64_t v100 = objc_msgSend_meshSource(v7, v96, v97, v98);
      unsigned int v108 = sub_1B641D56C(v100, v101, v102, v103, v104, v105, v106, v107);
      if ((v7->_componentType & 0xFFFE) == 0x16)
      {
        int v115 = 4;
        v7->_uint64_t componentCount = 4;
      }
      else
      {
        int v115 = v7->_componentCount;
      }
      if (v115 == 4 && v108 <= 1)
      {
        int v115 = 3;
        v7->_uint64_t componentCount = 3;
      }
      uint64_t v117 = sub_1B63CAA3C(1, v115, v109, v110, v111, v112, v113, v114);
      uint64_t v123 = sub_1B641E5D0(v100, v117, 0, v118, v119, v120, v121, v122);
      if (v123)
      {
        uint64_t v130 = v123;
        meshSource = v7->_meshSource;
        if (meshSource) {
          CFRelease(meshSource);
        }
        v7->_meshSource = (__CFXMeshSource *)v130;

        v7->_uint64_t data = (NSData *)(id)sub_1B641D89C(v130);
        sub_1B641D478(v130, v132, v133, v134, v135, v136, v137, v138);
        v7->_int componentType = 1;
        v7->_uint64_t componentCount = HIBYTE(v139);
        sub_1B6583684(v130, v7, v140, v141, v142, v143, v144, v145);
        uint64_t v153 = sub_1B641E1A8(v130, v146, v147, v148, v149, v150, v151, v152);
        v7->_uint64_t dataOffset = sub_1B6534BD0(v153, v154, v155, v156, v157, v158, v159, v160);
        v7->_int64_t dataStride = sub_1B65349B8(v153);
      }
      else
      {
        sub_1B63F2F54(16, @"Error: _modelSourceWithSource - Conversion failed", v124, v125, v126, v127, v128, v129, dataOffset);
      }
    }
  }
  uint64_t v161 = objc_msgSend_bytesPerComponent(v7, v96, v97, v98);
  uint64_t v165 = objc_msgSend_componentsPerVector(v7, v162, v163, v164);
  if (objc_msgSend_length(v7->_data, v166, v167, v168) < (unint64_t)(v7->_dataOffset
                                                                           + v165 * v161
                                                                           + (v7->_vectorCount - 1) * v7->_dataStride))
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v169, *MEMORY[0x1E4F1C3B8], @"Geometry source has invalid bounds");
  objc_msgSend_setImmediateMode_(v8[175], v169, v9, v170);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableData
{
  return self->_data;
}

@end