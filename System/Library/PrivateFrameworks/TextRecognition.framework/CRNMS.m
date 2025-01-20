@interface CRNMS
- (BOOL)addTextDetectorQuadFeatures:(const void *)a3 withInputSize:(CGSize)a4 andScoreMap:(vImage_Buffer *)a5 options:(id)a6;
- (BOOL)addTextDetectorQuadFeatures:(const void *)a3 withInputSize:(CGSize)a4 scoreMap:(vImage_Buffer *)a5 andScoreMapScaleFactor:(double)a6 options:(id)a7;
- (BOOL)addTextDetectorQuadFeatures:(const void *)a3 withInputSize:(CGSize)a4 scoreMap:(vImage_Buffer *)a5 scoreMapScaleFactor:(double)a6 andTileRects:(id)a7 options:(id)a8;
- (BOOL)buildRectForest:(void *)a3 fromTextDetectorQuadFeatures:(const void *)a4 forestFeatureType:(unint64_t)a5 withInputSize:(CGSize)a6 scoreMap:(vImage_Buffer *)a7 andScoreMapScaleFactor:(double)a8 options:(id)a9;
- (BOOL)buildRectForest:(void *)a3 fromTextDetectorQuadFeatures:(const void *)a4 forestFeatureType:(unint64_t)a5 withInputSize:(CGSize)a6 scoreMap:(vImage_Buffer *)a7 scoreMapScaleFactor:(double)a8 andTileRects:(id)a9 options:(id)a10;
- (BOOL)preprocessScoreMaps;
- (CRNMS)initWithNMSMethodType:(unint64_t)a3 NMSScoreType:(unint64_t)a4;
- (id).cxx_construct;
- (id)buildTextFeaturesFromRectForest:(const void *)a3 byEdge:(unint64_t)a4 options:(id)a5;
- (id)generateConsolidatedTextFeatures:(id)a3;
- (id)generateConsolidatedTextFeatures:(id)a3 withScaleIds:(void *)a4;
- (id)getTextFeatureFromQuadAngleDatum:(const void *)a3;
- (id)initForRevision:(unint64_t)a3;
- (unint64_t)convertSubTextFeatures:(id)a3 toRects:(void *)a4;
- (void)fillRectForestDatum:(void *)a3 asDimType:(unint64_t)a4 withCGRect:(const CGRect *)a5;
- (void)fillRectForestDatum:(void *)a3 asDimType:(unint64_t)a4 withCRTextDetectorQuad:(const void *)a5 andInputSize:(CGSize)a6;
- (void)fillRectForestDatum:(void *)a3 asDimType:(unint64_t)a4 withQuad:(const void *)a5 andDimType:(unint64_t)a6;
- (void)fillTextFeature:(id)a3 withRectDatum:(const void *)a4;
@end

@implementation CRNMS

- (id)initForRevision:(unint64_t)a3
{
  if (a3 == 3)
  {
    v9.receiver = self;
    v9.super_class = (Class)CRNMS;
    v3 = [(CRNMS *)&v9 init];
    if (v3)
    {
      nms::PyramidNMS<unsigned short,double,unsigned char>::PyramidNMS(&v6);
      p_preNMSForests = &v3->_preNMSForests;
      nms::PyramidNMS<unsigned short,double,unsigned char>::operator=((uint64_t)&v3->_pyrNMS, (uint64_t)&v6);
      nms::PyramidNMS<unsigned short,double,unsigned char>::~PyramidNMS(&v6);
      nms::PyramidNMSConfig::PyramidNMSConfig((uint64_t)&v6, 1, 1uLL);
      v6 = &unk_1F38ED5A0;
      v7[6] = xmmword_1DD8CEB30;
      *((void *)&v7[18] + 1) = 0x3FC999999999999ALL;
      BYTE10(v7[1]) = 1;
      *((void *)&v7[5] + 1) = 20;
      *(void *)&v7[2] = 0x4004000000000000;
      *((void *)&v7[8] + 1) = 0x3FA1EB851EB851ECLL;
      *((void *)&v7[9] + 1) = 0x3FE6666666666666;
      *(void *)&v7[13] = 0x3FE6666666666666;
      *(void *)&v7[11] = 0x3FE0000000000000;
      memcpy(&v3->_pyrNMS.config.methodType, v7, 0x148uLL);
      v3->_outputTextFeatureLevel = 6;
    }
    self = v3;
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CRNMS)initWithNMSMethodType:(unint64_t)a3 NMSScoreType:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CRNMS;
  v6 = [(CRNMS *)&v10 init];
  if (v6)
  {
    nms::PyramidNMS<unsigned short,double,unsigned char>::PyramidNMS(&v8);
    v9[120] = &v6->_preNMSForests;
    nms::PyramidNMS<unsigned short,double,unsigned char>::operator=((uint64_t)&v6->_pyrNMS, (uint64_t)&v8);
    nms::PyramidNMS<unsigned short,double,unsigned char>::~PyramidNMS(&v8);
    nms::PyramidNMSConfig::PyramidNMSConfig((uint64_t)&v8, a3, a4);
    if (a3 == 1) {
      v9[11] = 20;
    }
    memcpy(&v6->_pyrNMS.config.methodType, v9, 0x148uLL);
    v6->_outputTextFeatureLevel = 6;
  }
  return v6;
}

- (BOOL)addTextDetectorQuadFeatures:(const void *)a3 withInputSize:(CGSize)a4 andScoreMap:(vImage_Buffer *)a5 options:(id)a6
{
  return -[CRNMS addTextDetectorQuadFeatures:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:](self, "addTextDetectorQuadFeatures:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:", a3, a5, 0, a6, a4.width, a4.height, -1.0);
}

- (BOOL)addTextDetectorQuadFeatures:(const void *)a3 withInputSize:(CGSize)a4 scoreMap:(vImage_Buffer *)a5 andScoreMapScaleFactor:(double)a6 options:(id)a7
{
  return -[CRNMS addTextDetectorQuadFeatures:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:](self, "addTextDetectorQuadFeatures:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:", a3, a5, 0, a7, a4.width, a4.height, a6);
}

- (BOOL)addTextDetectorQuadFeatures:(const void *)a3 withInputSize:(CGSize)a4 scoreMap:(vImage_Buffer *)a5 scoreMapScaleFactor:(double)a6 andTileRects:(id)a7 options:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v15 = a7;
  id v16 = a8;
  nms::RectForest<unsigned short,double>::RectForest((uint64_t)v19, 0);
  std::deque<nms::RectForest<unsigned short,double>>::push_back(&self->_preNMSForests.__map_.__first_, (uint64_t)v19);
  nms::RectForest<unsigned short,double>::~RectForest((uint64_t)v19);
  unint64_t v17 = self->_preNMSForests.__size_.__value_ + self->_preNMSForests.__start_ - 1;
  LOBYTE(a5) = -[CRNMS buildRectForest:fromTextDetectorQuadFeatures:forestFeatureType:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:](self, "buildRectForest:fromTextDetectorQuadFeatures:forestFeatureType:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:", (char *)self->_preNMSForests.__map_.__begin_[v17 / 0x14] + 200 * (v17 % 0x14), a3, 0, a5, v15, v16, width, height, a6);

  return (char)a5;
}

- (BOOL)preprocessScoreMaps
{
  if (self->_forestFeatureType) {
    return 1;
  }
  unint64_t value = self->_preNMSForests.__size_.__value_;
  if (!value) {
    return 1;
  }
  unint64_t start = self->_preNMSForests.__start_;
  float64x2_t v6 = 0uLL;
  do
  {
    v7 = self->_preNMSForests.__map_.__begin_[start / 0x14];
    if (!v7[25 * (start % 0x14) + 2]) {
      goto LABEL_30;
    }
    float64x2_t v8 = vcvtq_f64_u64(*(uint64x2_t *)&v7[25 * (start % 0x14) + 3]);
    float64x2_t v6 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v6), (int8x16_t)v8, (int8x16_t)v6);
    ++start;
    --value;
  }
  while (value);
  if (v6.f64[0] <= 0.0 || v6.f64[1] <= 0.0) {
    goto LABEL_30;
  }
  unint64_t v9 = 0;
  size_t v10 = (unint64_t)(v6.f64[0] * v6.f64[1]);
  vImagePixelCount v11 = (unint64_t)v6.f64[0];
  unint64_t v45 = (unint64_t)v6.f64[0];
  vImagePixelCount v46 = (unint64_t)v6.f64[1];
  while (1)
  {
    unint64_t v12 = self->_preNMSForests.__start_ + v9;
    v13 = (char *)self->_preNMSForests.__map_.__begin_[v12 / 0x14];
    unint64_t v14 = v12 % 0x14;
    id v15 = (const vImage_Buffer *)&v13[200 * (v12 % 0x14) + 16];
    memset(&dest, 0, sizeof(dest));
    dest.data = malloc_type_calloc(v10, 1uLL, 0x100004077774924uLL);
    dest.vImagePixelCount height = v11;
    dest.vImagePixelCount width = v46;
    dest.rowBytes = v46;
    if (vImageScale_Planar8(v15, &dest, 0, 0)) {
      break;
    }
    if (dest.data)
    {
      vImagePixelCount height = dest.height;
      unint64_t v17 = &v13[200 * v14];
      *((void *)v17 + 6) = dest.height;
      vImagePixelCount width = dest.width;
      *((void *)v17 + 7) = dest.width;
      v19 = (void **)(v17 + 64);
      std::valarray<unsigned char>::resize((uint64_t)(v17 + 64), width * height);
      vImagePixelCount v20 = dest.width * dest.height;
      if (dest.width * dest.height)
      {
        size_t v21 = v10;
        data = dest.data;
        v23 = operator new(dest.width * dest.height);
        v24 = v23;
        uint64_t v25 = 0;
        do
        {
          v23[v25] = data[v25];
          ++v25;
        }
        while (v20 != v25);
        vImagePixelCount v20 = (vImagePixelCount)&v23[v25];
        size_t v10 = v21;
        vImagePixelCount v11 = v45;
      }
      else
      {
        v24 = 0;
      }
      v26 = &v13[200 * v14];
      v29 = (void *)*((void *)v26 + 9);
      v28 = (vImagePixelCount *)(v26 + 72);
      v27 = v29;
      v30 = *v19;
      if (*v19)
      {
        if (v27 != v30) {
          vImagePixelCount *v28 = (vImagePixelCount)v30;
        }
        operator delete(v30);
      }
      *v19 = v24;
      vImagePixelCount *v28 = v20;
      if (dest.data) {
        free(dest.data);
      }
    }
    if (v15->data)
    {
      free(v15->data);
      v15->data = 0;
    }
    ++v9;
    BOOL result = 1;
    if (v9 >= self->_preNMSForests.__size_.__value_) {
      return result;
    }
  }
  if (dest.data) {
    free(dest.data);
  }
  if (self->_preNMSForests.__size_.__value_)
  {
LABEL_30:
    unint64_t v31 = 0;
    do
    {
      unint64_t v32 = v31 + self->_preNMSForests.__start_;
      v33 = (char *)self->_preNMSForests.__map_.__begin_[v32 / 0x14];
      unint64_t v34 = v32 % 0x14;
      v35 = &v33[200 * (v32 % 0x14)];
      v38 = (void *)*((void *)v35 + 2);
      v37 = v35 + 16;
      v36 = v38;
      if (v38)
      {
        free(v36);
        void *v37 = 0;
      }
      v39 = &v33[200 * v34];
      v42 = (void *)*((void *)v39 + 9);
      v40 = v39 + 72;
      v41 = v42;
      v44 = v40 - 1;
      v43 = (void *)*(v40 - 1);
      *(v40 - 3) = 0;
      *(v40 - 2) = 0;
      if (v43)
      {
        if (v41 != v43) {
          void *v40 = v43;
        }
        operator delete(v43);
        void *v44 = 0;
        v44[1] = 0;
      }
      ++v31;
    }
    while (v31 < self->_preNMSForests.__size_.__value_);
  }
  return 0;
}

- (id)generateConsolidatedTextFeatures:(id)a3
{
  memset(v5, 0, sizeof(v5));
  v3 = [(CRNMS *)self generateConsolidatedTextFeatures:a3 withScaleIds:v5];
  std::deque<unsigned char>::~deque[abi:ne180100](v5);
  return v3;
}

- (id)generateConsolidatedTextFeatures:(id)a3 withScaleIds:(void *)a4
{
  id v6 = a3;
  self->_unint64_t forestFeatureType = *((void *)self->_preNMSForests.__map_.__begin_[self->_preNMSForests.__start_ / 0x14]
                             + 25 * (self->_preNMSForests.__start_ % 0x14)
                             + 1);
  id v391 = v6;
  [(CRNMS *)self preprocessScoreMaps];
  unint64_t forestFeatureType = self->_forestFeatureType;
  nms::RectForest<unsigned short,double>::RectForest((uint64_t)v396, forestFeatureType);
  pForests = self->_pyrNMS.pForests;
  if (!pForests) {
    goto LABEL_416;
  }
  uint64_t v9 = pForests[5];
  if (!v9) {
    goto LABEL_416;
  }
  uint64_t v387 = forestFeatureType;
  uint64_t v10 = pForests[1];
  v395 = self;
  if (pForests[2] == v10) {
    goto LABEL_140;
  }
  unint64_t v11 = pForests[4];
  unint64_t v12 = *(void **)(v10 + 8 * (v11 / 0x14));
  v13 = &v12[25 * (v11 % 0x14)];
  unint64_t v14 = *(void *)(v10 + 8 * ((v11 + v9) / 0x14)) + 200 * ((v11 + v9) % 0x14);
  if (v13 == (void *)v14) {
    goto LABEL_140;
  }
  v392 = (void *)(v10 + 8 * (v11 / 0x14));
  unint64_t v389 = *(void *)(v10 + 8 * ((v11 + v9) / 0x14)) + 200 * ((v11 + v9) % 0x14);
  do
  {
    char v15 = 0;
    unint64_t v16 = 0;
    unint64_t v17 = v13 + 23;
    do
    {
      if (v13[21] > v16)
      {
        uint64_t v18 = *(void *)(*(void *)(v13[17] + 8 * ((v13[20] + v16) / 0x55)) + 48 * ((v13[20] + v16) % 0x55) + 40);
        if (v18)
        {
          if (v16 > 5) {
            goto LABEL_42;
          }
          unint64_t v19 = qword_1DD8CEBA0[v16];
          unint64_t v20 = qword_1DD8CEBD0[v16];
          unint64_t v21 = v13[15];
          if (v21 <= v19)
          {
            unint64_t v31 = 0;
          }
          else
          {
            v22 = (void *)v13[23];
            if (!v22) {
              goto LABEL_42;
            }
            unint64_t v23 = v13[14] + v19;
            unint64_t v24 = (uint64_t)(*(void *)(*(void *)(v13[11] + ((v23 >> 5) & 0x7FFFFFFFFFFFFF8))
                                      + 16 * v23
                                      + 8)
                          - *(void *)(*(void *)(v13[11] + ((v23 >> 5) & 0x7FFFFFFFFFFFFF8))
                                      + 16 * v23)) >> 3;
            uint64_t v25 = v13 + 23;
            do
            {
              unint64_t v26 = v22[4];
              BOOL v27 = v26 >= v19;
              if (v26 >= v19) {
                v28 = v22;
              }
              else {
                v28 = v22 + 1;
              }
              if (v27) {
                uint64_t v25 = v22;
              }
              v22 = (void *)*v28;
            }
            while (*v28);
            if (v25 == v17 || v25[4] > v19 || (unint64_t v29 = v25[5], v29 > 8)) {
              double v30 = 0.0;
            }
            else {
              double v30 = dbl_1DD8CEC20[v29];
            }
            unint64_t v31 = v24 / *(void *)&v30;
          }
          if (v21 <= v20 || v31 != v18) {
            goto LABEL_42;
          }
          unint64_t v32 = (void *)v13[23];
          if (v32)
          {
            unint64_t v33 = v13[14] + v20;
            unint64_t v34 = (uint64_t)(*(void *)(*(void *)(v13[11] + ((v33 >> 5) & 0x7FFFFFFFFFFFFF8))
                                      + 16 * v33
                                      + 8)
                          - *(void *)(*(void *)(v13[11] + ((v33 >> 5) & 0x7FFFFFFFFFFFFF8))
                                      + 16 * v33)) >> 3;
            v35 = v13 + 23;
            do
            {
              unint64_t v36 = v32[4];
              BOOL v37 = v36 >= v20;
              if (v36 >= v20) {
                v38 = v32;
              }
              else {
                v38 = v32 + 1;
              }
              if (v37) {
                v35 = v32;
              }
              unint64_t v32 = (void *)*v38;
            }
            while (*v38);
            if (v35 != v17 && v35[4] <= v20)
            {
              unint64_t v39 = v35[5];
              if (v39 <= 8 && *(void *)&dbl_1DD8CEC20[v39] > v34)
              {
LABEL_42:
                char v15 = 0;
                goto LABEL_43;
              }
            }
          }
          char v15 = 1;
        }
      }
LABEL_43:
      ++v16;
    }
    while (v16 != 6);
    end = self->_pyrNMS.fullySpecifiedForests.__map_.__end_;
    begin = self->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
    uint64_t v42 = (char *)end - (char *)begin;
    if (end == begin) {
      uint64_t v43 = 0;
    }
    else {
      uint64_t v43 = (((char *)end - (char *)begin) << 9) - 1;
    }
    unint64_t start = self->_pyrNMS.fullySpecifiedForests.__start_;
    unint64_t value = self->_pyrNMS.fullySpecifiedForests.__size_.__value_;
    unint64_t v46 = value + start;
    if (v43 == value + start)
    {
      if (start < 0x1000)
      {
        v60 = self->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_;
        first = self->_pyrNMS.fullySpecifiedForests.__map_.__first_;
        if (v42 >> 3 >= (unint64_t)(v60 - first))
        {
          uint64_t v388 = v42 >> 3;
          if (v60 == first) {
            unint64_t v64 = 1;
          }
          else {
            unint64_t v64 = ((char *)v60 - (char *)first) >> 2;
          }
          v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v64);
          uint64_t v67 = v66;
          v68 = operator new(0x1000uLL);
          v69 = &v65[8 * v388];
          v70 = &v65[8 * v67];
          if (v388 == v67)
          {
            uint64_t v71 = 8 * v388;
            if (v42 < 1)
            {
              v86 = v68;
              uint64_t v87 = v71 >> 2;
              if (end == begin) {
                unint64_t v88 = 1;
              }
              else {
                unint64_t v88 = v87;
              }
              v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v88);
              v69 = &v89[8 * (v88 >> 2)];
              v70 = &v89[8 * v90];
              if (v65) {
                operator delete(v65);
              }
              v65 = v89;
              v68 = v86;
            }
            else
            {
              uint64_t v72 = v71 >> 3;
              if (v72 >= -1) {
                unint64_t v73 = v72 + 1;
              }
              else {
                unint64_t v73 = v72 + 2;
              }
              v69 -= 8 * (v73 >> 1);
            }
          }
          *(void *)v69 = v68;
          v91 = v69 + 8;
          v92 = v395;
          v93 = v395->_pyrNMS.fullySpecifiedForests.__map_.__end_;
          while (v93 != v92->_pyrNMS.fullySpecifiedForests.__map_.__begin_)
          {
            if (v69 == v65)
            {
              if (v91 >= v70)
              {
                if (v70 == v65) {
                  unint64_t v98 = 1;
                }
                else {
                  unint64_t v98 = (v70 - v65) >> 2;
                }
                v99 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v98);
                v101 = v99;
                v69 = &v99[(2 * v98 + 6) & 0xFFFFFFFFFFFFFFF8];
                uint64_t v102 = v91 - v65;
                BOOL v308 = v91 == v65;
                v91 = v69;
                if (!v308)
                {
                  v91 = &v69[v102 & 0xFFFFFFFFFFFFFFF8];
                  uint64_t v103 = 8 * (v102 >> 3);
                  v104 = v69;
                  v105 = (uint64_t *)v65;
                  do
                  {
                    uint64_t v106 = *v105++;
                    *(void *)v104 = v106;
                    v104 += 8;
                    v103 -= 8;
                  }
                  while (v103);
                }
                v70 = &v99[8 * v100];
                if (v65) {
                  operator delete(v65);
                }
                v65 = v101;
              }
              else
              {
                uint64_t v94 = (v70 - v91) >> 3;
                if (v94 >= -1) {
                  uint64_t v95 = v94 + 1;
                }
                else {
                  uint64_t v95 = v94 + 2;
                }
                uint64_t v96 = v95 >> 1;
                v69 = &v65[8 * (v95 >> 1)];
                v97 = v65;
                if (v91 != v65)
                {
                  memmove(v69, v65, v91 - v65);
                  v97 = v91;
                }
                v91 = &v97[8 * v96];
              }
            }
            uint64_t v107 = (uint64_t)*--v93;
            *((void *)v69 - 1) = v107;
            v69 -= 8;
            v92 = v395;
          }
          v108 = v395->_pyrNMS.fullySpecifiedForests.__map_.__first_;
          v395->_pyrNMS.fullySpecifiedForests.__map_.__first_ = (BOOL **)v65;
          v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = (BOOL **)v69;
          v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ = (BOOL **)v91;
          v395->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_ = (BOOL **)v70;
          self = v395;
          unint64_t v14 = v389;
          if (v108) {
            operator delete(v108);
          }
        }
        else
        {
          v62 = (BOOL *)operator new(0x1000uLL);
          v63 = v62;
          if (v60 == end)
          {
            if (begin == first)
            {
              if (end == begin) {
                unint64_t v109 = 1;
              }
              else {
                unint64_t v109 = ((char *)v60 - (char *)begin) >> 2;
              }
              v110 = (BOOL **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v109);
              begin = (BOOL **)((char *)v110 + ((2 * v109 + 6) & 0xFFFFFFFFFFFFFFF8));
              self = v395;
              v112 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
              v113 = begin;
              uint64_t v114 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ - v112;
              unint64_t v14 = v389;
              if (v114)
              {
                v113 = (BOOL **)((char *)begin + (v114 & 0xFFFFFFFFFFFFFFF8));
                uint64_t v115 = 8 * (v114 >> 3);
                v116 = begin;
                do
                {
                  v117 = *(BOOL **)v112;
                  v112 += 8;
                  *v116++ = v117;
                  v115 -= 8;
                }
                while (v115);
              }
              v118 = v395->_pyrNMS.fullySpecifiedForests.__map_.__first_;
              v395->_pyrNMS.fullySpecifiedForests.__map_.__first_ = v110;
              v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = begin;
              v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ = v113;
              v395->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_ = &v110[v111];
              if (v118)
              {
                operator delete(v118);
                begin = v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
              }
            }
            else
            {
              self = v395;
              unint64_t v14 = v389;
            }
            *(begin - 1) = v63;
            v119 = self->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
            v120 = self->_pyrNMS.fullySpecifiedForests.__map_.__end_;
            self->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v119 - 1;
            v121 = *(v119 - 1);
            self->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v119;
            if (v120 == self->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_)
            {
              v122 = self->_pyrNMS.fullySpecifiedForests.__map_.__first_;
              uint64_t v123 = (char *)v119 - (char *)v122;
              if (v119 <= v122)
              {
                uint64_t v129 = (char *)v120 - (char *)v122;
                BOOL v308 = v129 == 0;
                uint64_t v130 = v129 >> 2;
                if (v308) {
                  unint64_t v131 = 1;
                }
                else {
                  unint64_t v131 = v130;
                }
                v132 = (BOOL **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v131);
                v134 = &v132[v131 >> 2];
                self = v395;
                v135 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
                v120 = v134;
                uint64_t v136 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ - v135;
                unint64_t v14 = v389;
                if (v136)
                {
                  v120 = (BOOL **)((char *)v134 + (v136 & 0xFFFFFFFFFFFFFFF8));
                  uint64_t v137 = 8 * (v136 >> 3);
                  v138 = &v132[v131 >> 2];
                  do
                  {
                    v139 = *(BOOL **)v135;
                    v135 += 8;
                    *v138++ = v139;
                    v137 -= 8;
                  }
                  while (v137);
                }
                v140 = v395->_pyrNMS.fullySpecifiedForests.__map_.__first_;
                v395->_pyrNMS.fullySpecifiedForests.__map_.__first_ = v132;
                v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v134;
                v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ = v120;
                v395->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_ = &v132[v133];
                if (v140)
                {
                  operator delete(v140);
                  v120 = v395->_pyrNMS.fullySpecifiedForests.__map_.__end_;
                }
              }
              else
              {
                uint64_t v124 = v123 >> 3;
                BOOL v54 = v123 >> 3 < -1;
                uint64_t v125 = (v123 >> 3) + 2;
                if (v54) {
                  uint64_t v126 = v125;
                }
                else {
                  uint64_t v126 = v124 + 1;
                }
                v127 = &v119[-(v126 >> 1)];
                int64_t v128 = (char *)v120 - (char *)v119;
                if (v120 != v119)
                {
                  memmove(&v119[-(v126 >> 1)], v119, (char *)v120 - (char *)v119);
                  v119 = self->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
                }
                v120 = (BOOL **)((char *)v127 + v128);
                self->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = &v119[-(v126 >> 1)];
                self->_pyrNMS.fullySpecifiedForests.__map_.__end_ = (BOOL **)((char *)v127 + v128);
              }
            }
            *v120 = v121;
            ++self->_pyrNMS.fullySpecifiedForests.__map_.__end_;
          }
          else
          {
            *end = v62;
            self = v395;
            ++v395->_pyrNMS.fullySpecifiedForests.__map_.__end_;
            unint64_t v14 = v389;
          }
        }
      }
      else
      {
        self->_pyrNMS.fullySpecifiedForests.__start_ = start - 4096;
        v47 = self;
        v50 = *begin;
        v48 = begin + 1;
        v49 = v50;
        v47->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v48;
        if (end == v47->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_)
        {
          v51 = v47->_pyrNMS.fullySpecifiedForests.__map_.__first_;
          uint64_t v52 = (char *)v48 - (char *)v51;
          if (v48 <= v51)
          {
            uint64_t v74 = (char *)end - (char *)v51;
            BOOL v308 = v74 == 0;
            uint64_t v75 = v74 >> 2;
            if (v308) {
              unint64_t v76 = 1;
            }
            else {
              unint64_t v76 = v75;
            }
            v77 = (BOOL **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v76);
            v79 = &v77[v76 >> 2];
            v80 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
            end = v79;
            uint64_t v81 = (char *)v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ - v80;
            unint64_t v14 = v389;
            if (v81)
            {
              end = (BOOL **)((char *)v79 + (v81 & 0xFFFFFFFFFFFFFFF8));
              uint64_t v82 = 8 * (v81 >> 3);
              v83 = &v77[v76 >> 2];
              do
              {
                v84 = *(BOOL **)v80;
                v80 += 8;
                *v83++ = v84;
                v82 -= 8;
              }
              while (v82);
            }
            v47 = v395;
            v85 = v395->_pyrNMS.fullySpecifiedForests.__map_.__first_;
            v395->_pyrNMS.fullySpecifiedForests.__map_.__first_ = v77;
            v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v79;
            v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ = end;
            v395->_pyrNMS.fullySpecifiedForests.__map_.__end_cap_.__value_ = &v77[v78];
            if (v85)
            {
              operator delete(v85);
              end = v395->_pyrNMS.fullySpecifiedForests.__map_.__end_;
            }
          }
          else
          {
            uint64_t v53 = v52 >> 3;
            BOOL v54 = v52 >> 3 < -1;
            uint64_t v55 = (v52 >> 3) + 2;
            if (v54) {
              uint64_t v56 = v55;
            }
            else {
              uint64_t v56 = v53 + 1;
            }
            v57 = &v48[-(v56 >> 1)];
            int64_t v58 = (char *)end - (char *)v48;
            v47 = v395;
            if (end != v48)
            {
              memmove(&v48[-(v56 >> 1)], v48, (char *)end - (char *)v48);
              end = v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
            }
            v59 = &end[-(v56 >> 1)];
            end = (BOOL **)((char *)v57 + v58);
            v395->_pyrNMS.fullySpecifiedForests.__map_.__begin_ = v59;
            v395->_pyrNMS.fullySpecifiedForests.__map_.__end_ = (BOOL **)((char *)v57 + v58);
            unint64_t v14 = v389;
          }
        }
        *end = v49;
        ++v47->_pyrNMS.fullySpecifiedForests.__map_.__end_;
        self = v47;
      }
      begin = self->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
      unint64_t value = self->_pyrNMS.fullySpecifiedForests.__size_.__value_;
      unint64_t v46 = self->_pyrNMS.fullySpecifiedForests.__start_ + value;
      unint64_t v12 = (void *)*v392;
    }
    (*(BOOL **)((char *)begin + ((v46 >> 9) & 0x7FFFFFFFFFFFF8)))[v46 & 0xFFF] = v15 & 1;
    self->_pyrNMS.fullySpecifiedForests.__size_.__value_ = value + 1;
    v13 += 25;
    if ((char *)v13 - (char *)v12 == 4000)
    {
      unint64_t v12 = (void *)v392[1];
      ++v392;
      v13 = v12;
    }
  }
  while (v13 != (void *)v14);
LABEL_140:
  v141 = self->_pyrNMS.fullySpecifiedForests.__map_.__begin_;
  if (self->_pyrNMS.fullySpecifiedForests.__map_.__end_ == v141) {
    goto LABEL_416;
  }
  unint64_t v142 = self->_pyrNMS.fullySpecifiedForests.__start_;
  v143 = &v141[v142 >> 12];
  v144 = *v143;
  v145 = (unsigned __int8 *)&(*v143)[v142 & 0xFFF];
  unint64_t v146 = (unint64_t)&(*(BOOL **)((char *)v141
                                      + (((self->_pyrNMS.fullySpecifiedForests.__size_.__value_ + v142) >> 9) & 0x7FFFFFFFFFFFF8)))[(self->_pyrNMS.fullySpecifiedForests.__size_.__value_ + v142) & 0xFFF];
  if (v145 == (unsigned __int8 *)v146) {
    goto LABEL_416;
  }
  uint64_t v147 = 0;
  do
  {
    unsigned int v149 = *v145++;
    uint64_t v148 = v149;
    if (v145 - (unsigned __int8 *)v144 == 4096)
    {
      v150 = (unsigned __int8 *)v143[1];
      ++v143;
      v144 = (BOOL *)v150;
      v145 = v150;
    }
    v147 += v148;
  }
  while (v145 != (unsigned __int8 *)v146);
  if (!v147 || self->_pyrNMS.config.methodType != 1) {
    goto LABEL_416;
  }
  memset(v398, 0, sizeof(v398));
  nms::PyramidNMS<unsigned short,double,unsigned char>::computeRectRelationships((uint64_t)&self->_pyrNMS, v398, self->_pyrNMS.config.computeIntrascaleGeometricRelationships);
  nms::PyramidNMS<unsigned short,double,unsigned char>::performNMSAtOneLevel((uint64_t)&self->_pyrNMS);
  nms::RectForest<unsigned short,double>::RectForest((uint64_t)v397, v387);
  v151 = self->_pyrNMS.pForests;
  if (!v151) {
    goto LABEL_415;
  }
  unsigned int v393 = (unsigned __int16)v151[20];
  if (!v151[20]) {
    goto LABEL_415;
  }
  unsigned __int16 v152 = 0;
  long long v412 = 0u;
  long long v413 = 0u;
  long long v411 = 0u;
  __int16 v410 = 0;
  while (2)
  {
    nms::BOOLeanMaskToIndices<unsigned short>((uint64_t)&v399, *(uint64_t *)((char *)self->_pyrNMS.masksValid.__map_.__begin_+ (((self->_pyrNMS.masksValid.__start_ + v152) >> 5) & 0x7FFFFFFFFFFFFF8))+ 16 * (LOBYTE(self->_pyrNMS.masksValid.__start_) + v152));
    if (v401 != v400)
    {
      v153 = (void *)(v400 + 8 * (v402 >> 11));
      v154 = (__int16 *)(*v153 + 2 * (v402 & 0x7FF));
      uint64_t v155 = *(void *)(v400 + (((v403 + v402) >> 8) & 0xFFFFFFFFFFFFF8)) + 2 * ((v403 + v402) & 0x7FF);
      if (v154 != (__int16 *)v155)
      {
        while (2)
        {
          __int16 v409 = 0;
          __int16 v409 = *v154;
          std::deque<std::pair<unsigned short,unsigned short>>::emplace_back<unsigned short &,unsigned short &>(&v411, &v410, &v409);
          v156 = (char *)*((void *)a4 + 2);
          v157 = (char *)*((void *)a4 + 1);
          char v158 = v410;
          if (v156 == v157) {
            uint64_t v159 = 0;
          }
          else {
            uint64_t v159 = ((v156 - v157) << 9) - 1;
          }
          unint64_t v160 = *((void *)a4 + 4);
          unint64_t v161 = *((void *)a4 + 5) + v160;
          if (v159 == v161)
          {
            if (v160 >= 0x1000)
            {
              *((void *)a4 + 4) = v160 - 4096;
              uint64_t v164 = *(void *)v157;
              v162 = v157 + 8;
              uint64_t v163 = v164;
              *((void *)a4 + 1) = v162;
              if (v156 == *((char **)a4 + 3))
              {
                uint64_t v165 = (uint64_t)&v162[-*(void *)a4];
                if ((unint64_t)v162 > *(void *)a4)
                {
                  uint64_t v166 = v165 >> 3;
                  BOOL v54 = v165 >> 3 < -1;
                  uint64_t v167 = (v165 >> 3) + 2;
                  if (v54) {
                    uint64_t v168 = v167;
                  }
                  else {
                    uint64_t v168 = v166 + 1;
                  }
                  v169 = &v162[-8 * (v168 >> 1)];
                  int64_t v170 = v156 - v162;
                  if (v156 != v162)
                  {
                    memmove(&v162[-8 * (v168 >> 1)], v162, v156 - v162);
                    v156 = (char *)*((void *)a4 + 1);
                  }
                  v171 = &v156[-8 * (v168 >> 1)];
                  v156 = &v169[v170];
                  goto LABEL_166;
                }
                if (v156 == *(char **)a4) {
                  unint64_t v183 = 1;
                }
                else {
                  unint64_t v183 = (uint64_t)&v156[-*(void *)a4] >> 2;
                }
                v184 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a4 + 24, v183);
                v186 = &v184[8 * (v183 >> 2)];
                v187 = (uint64_t *)*((void *)a4 + 1);
                v156 = v186;
                uint64_t v188 = *((void *)a4 + 2) - (void)v187;
                if (v188)
                {
                  v156 = &v186[v188 & 0xFFFFFFFFFFFFFFF8];
                  uint64_t v189 = 8 * (v188 >> 3);
                  v190 = &v184[8 * (v183 >> 2)];
                  do
                  {
                    uint64_t v191 = *v187++;
                    *(void *)v190 = v191;
                    v190 += 8;
                    v189 -= 8;
                  }
                  while (v189);
                }
LABEL_186:
                v192 = *(void **)a4;
                *(void *)a4 = v184;
                *((void *)a4 + 1) = v186;
                *((void *)a4 + 2) = v156;
                *((void *)a4 + 3) = &v184[8 * v185];
                if (v192)
                {
                  operator delete(v192);
                  v156 = (char *)*((void *)a4 + 2);
                }
              }
              goto LABEL_189;
            }
            unint64_t v172 = (v156 - v157) >> 3;
            v173 = (char *)*((void *)a4 + 3);
            uint64_t v174 = (uint64_t)&v173[-*(void *)a4];
            if (v172 >= v174 >> 3)
            {
              if (v173 == *(char **)a4) {
                unint64_t v175 = 1;
              }
              else {
                unint64_t v175 = v174 >> 2;
              }
              v418 = (char *)a4 + 24;
              *(void *)&long long v416 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a4 + 24, v175);
              *((void *)&v416 + 1) = v416 + 8 * v172;
              *(void *)&long long v417 = *((void *)&v416 + 1);
              *((void *)&v417 + 1) = v416 + 8 * v176;
              v414 = operator new(0x1000uLL);
              std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *> &>::push_back(&v416, &v414);
              v177 = (void *)*((void *)a4 + 2);
              uint64_t v178 = -7 - (void)v177;
              while (v177 != *((void **)a4 + 1))
              {
                --v177;
                v178 += 8;
                std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *> &>::push_front((uint64_t)&v416, v177);
              }
              v179 = *(void **)a4;
              long long v180 = v416;
              long long v181 = v417;
              *(void *)&long long v416 = *(void *)a4;
              *((void *)&v416 + 1) = v177;
              long long v182 = *((_OWORD *)a4 + 1);
              *(_OWORD *)a4 = v180;
              *((_OWORD *)a4 + 1) = v181;
              long long v417 = v182;
              if (v177 != (void *)v182) {
                *(void *)&long long v417 = v182 + (-(v182 + v178) & 0xFFFFFFFFFFFFFFF8);
              }
              if (v179) {
                operator delete(v179);
              }
            }
            else if (v173 == v156)
            {
              *(void *)&long long v416 = operator new(0x1000uLL);
              std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_front((uint64_t)a4, &v416);
              v193 = (void *)*((void *)a4 + 1);
              v156 = (char *)*((void *)a4 + 2);
              uint64_t v195 = *v193;
              v194 = (char *)(v193 + 1);
              uint64_t v163 = v195;
              *((void *)a4 + 1) = v194;
              if (v156 == *((char **)a4 + 3))
              {
                uint64_t v197 = (uint64_t)&v194[-*(void *)a4];
                if ((unint64_t)v194 <= *(void *)a4)
                {
                  if (v156 == *(char **)a4) {
                    unint64_t v203 = 1;
                  }
                  else {
                    unint64_t v203 = (uint64_t)&v156[-*(void *)a4] >> 2;
                  }
                  v184 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a4 + 24, v203);
                  v186 = &v184[8 * (v203 >> 2)];
                  v204 = (uint64_t *)*((void *)a4 + 1);
                  v156 = v186;
                  uint64_t v205 = *((void *)a4 + 2) - (void)v204;
                  if (v205)
                  {
                    v156 = &v186[v205 & 0xFFFFFFFFFFFFFFF8];
                    uint64_t v206 = 8 * (v205 >> 3);
                    v207 = &v184[8 * (v203 >> 2)];
                    do
                    {
                      uint64_t v208 = *v204++;
                      *(void *)v207 = v208;
                      v207 += 8;
                      v206 -= 8;
                    }
                    while (v206);
                  }
                  goto LABEL_186;
                }
                uint64_t v198 = v197 >> 3;
                BOOL v54 = v197 >> 3 < -1;
                uint64_t v199 = (v197 >> 3) + 2;
                if (v54) {
                  uint64_t v200 = v199;
                }
                else {
                  uint64_t v200 = v198 + 1;
                }
                v201 = &v194[-8 * (v200 >> 1)];
                int64_t v202 = v156 - v194;
                if (v156 != v194)
                {
                  memmove(&v194[-8 * (v200 >> 1)], v194, v156 - v194);
                  v194 = (char *)*((void *)a4 + 1);
                }
                v156 = &v201[v202];
                v171 = &v194[-8 * (v200 >> 1)];
LABEL_166:
                *((void *)a4 + 1) = v171;
                *((void *)a4 + 2) = v156;
              }
LABEL_189:
              *(void *)v156 = v163;
              *((void *)a4 + 2) += 8;
            }
            else
            {
              *(void *)&long long v416 = operator new(0x1000uLL);
              std::__split_buffer<std::pair<int,int> *,std::allocator<std::pair<int,int> *>>::push_back(a4, &v416);
            }
            v157 = (char *)*((void *)a4 + 1);
            unint64_t v161 = *((void *)a4 + 5) + *((void *)a4 + 4);
          }
          *(unsigned char *)(*(void *)&v157[(v161 >> 9) & 0x7FFFFFFFFFFFF8] + (v161 & 0xFFF)) = v158;
          ++*((void *)a4 + 5);
          if ((__int16 *)((char *)++v154 - *v153) == (__int16 *)4096)
          {
            v196 = (__int16 *)v153[1];
            ++v153;
            v154 = v196;
          }
          if (v154 == (__int16 *)v155)
          {
            unsigned __int16 v152 = v410;
            break;
          }
          continue;
        }
      }
    }
    std::deque<unsigned short>::~deque[abi:ne180100](&v399);
    __int16 v410 = ++v152;
    self = v395;
    if (v393 > v152) {
      continue;
    }
    break;
  }
  v394 = v395->_pyrNMS.pForests;
  nms::RectForest<unsigned short,double>::RectForest((uint64_t)&v399, v387);
  if (v387) {
    goto LABEL_414;
  }
  if ((void)v412 == *((void *)&v411 + 1)
    || (v209 = (unsigned __int16 **)(*((void *)&v411 + 1) + 8 * ((unint64_t)v413 >> 10)),
        v210 = *v209,
        v211 = &(*v209)[2 * (v413 & 0x3FF)],
        uint64_t v212 = *(void *)(*((void *)&v411 + 1)
                         + ((((void)v413 + *((void *)&v413 + 1)) >> 7) & 0x1FFFFFFFFFFFFF8))
             + 4 * ((v413 + *((void *)&v413 + 1)) & 0x3FF),
        v211 == (unsigned __int16 *)v212))
  {
    unsigned __int16 v213 = 0;
  }
  else
  {
    unsigned __int16 v213 = 0;
    do
    {
      v214 = v211 + 2;
      if ((char *)(v211 + 2) - (char *)v210 == 4096)
      {
        v215 = v209[1];
        ++v209;
        v210 = v215;
        v214 = v215;
      }
      unint64_t v216 = v394[4] + *v211;
      unint64_t v217 = *(void *)(v394[1] + 8 * (v216 / 0x14)) + 200 * (v216 % 0x14);
      unint64_t v218 = *(void *)(*(void *)(v217 + 136) + 8 * (*(void *)(v217 + 160) / 0x55uLL))
           + 48 * (*(void *)(v217 + 160) % 0x55uLL);
      unint64_t v219 = *(void *)(v218 + 32) + v211[1];
      v220 = (_WORD *)(*(void *)(*(void *)(v218 + 8) + ((v219 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v219 & 0x3FF));
      unsigned __int16 v213 = v213 + v220[1] - *v220 + 1;
      v211 = v214;
    }
    while (v214 != (unsigned __int16 *)v212);
  }
  v221 = (void *)v408[0];
  if (!v408[0])
  {
    double v241 = 0.0;
    double v225 = 0.0;
    double v233 = 0.0;
LABEL_272:
    unsigned int v249 = 0;
    goto LABEL_273;
  }
  v222 = (void *)v408[0];
  do
  {
    v223 = v222;
    v222 = (void *)*v222;
  }
  while (v222);
  if (v223 == v408 || v223[4] || (unint64_t v224 = v223[5], v224 >= 9)) {
    double v225 = 0.0;
  }
  else {
    double v225 = dbl_1DD8CEC20[v224];
  }
  v226 = v408;
  v227 = (void *)v408[0];
  do
  {
    v228 = v227;
    v229 = v226;
    uint64_t v230 = v227[4];
    if (v230) {
      v226 = v227;
    }
    else {
      ++v227;
    }
    v227 = (void *)*v227;
  }
  while (v227);
  if (v226 == v408) {
    goto LABEL_241;
  }
  v231 = v230 ? v228 : v229;
  if (v231[4] > 1uLL) {
    goto LABEL_241;
  }
  if (!v230) {
    v228 = v229;
  }
  unint64_t v232 = v228[5];
  if (v232 > 8) {
LABEL_241:
  }
    double v233 = 0.0;
  else {
    double v233 = dbl_1DD8CEC20[v232];
  }
  v234 = v408;
  v235 = (void *)v408[0];
  do
  {
    v236 = v235;
    v237 = v234;
    unint64_t v238 = v235[4];
    if (v238 >= 3) {
      v234 = v235;
    }
    else {
      ++v235;
    }
    v235 = (void *)*v235;
  }
  while (v235);
  if (v234 == v408) {
    goto LABEL_256;
  }
  v239 = v238 >= 3 ? v236 : v237;
  if (v239[4] > 3uLL) {
    goto LABEL_256;
  }
  if (v238 < 3) {
    v236 = v237;
  }
  unint64_t v240 = v236[5];
  if (v240 > 8) {
LABEL_256:
  }
    double v241 = 0.0;
  else {
    double v241 = dbl_1DD8CEC20[v240];
  }
  v242 = v408;
  do
  {
    v243 = v221;
    v244 = v242;
    unint64_t v245 = v221[4];
    v246 = v221 + 1;
    if (v245 >= 4)
    {
      v246 = v243;
      v242 = v243;
    }
    v221 = (void *)*v246;
  }
  while (v221);
  if (v242 == v408) {
    goto LABEL_272;
  }
  v247 = v245 >= 4 ? v243 : v244;
  if (v247[4] > 4uLL) {
    goto LABEL_272;
  }
  if (v245 >= 4) {
    v248 = v243;
  }
  else {
    v248 = v244;
  }
  switch(v248[5])
  {
    case 0:
    case 1:
      unsigned int v249 = 4;
      break;
    case 2:
      unsigned int v249 = 8;
      break;
    case 3:
    case 4:
      unsigned int v249 = 2;
      break;
    case 5:
      unsigned int v249 = 5;
      break;
    case 6:
      unsigned int v249 = 9;
      break;
    case 7:
      unsigned int v249 = 3;
      break;
    case 8:
      unsigned int v249 = 14;
      break;
    default:
      goto LABEL_272;
  }
LABEL_273:
  unint64_t v250 = WORD4(v413);
  std::valarray<double>::resize(*(void *)(v404 + ((v405 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v405, *(void *)&v225 * WORD4(v413), 0.0);
  std::valarray<double>::resize(*(void *)(v404 + (((v405 + 1) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v405 + 1), *(void *)&v233 * v213, 0.0);
  std::valarray<double>::resize(*(void *)(v404 + (((v405 + 3) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v405 + 3), *(void *)&v241 * v250, 0.0);
  std::valarray<double>::resize(*(void *)(v404 + (((v405 + 4) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v405 + 4), v249 * (unint64_t)v213, 0.0);
  std::deque<std::pair<unsigned short,unsigned short>>::resize((void *)(*(void *)(v406 + 8 * (v407 / 0x55)) + 48 * (v407 % 0x55)), v250);
  std::deque<std::pair<unsigned short,unsigned short>>::resize((void *)(*(void *)(v406 + 8 * ((v407 + 4) / 0x55)) + 48 * ((v407 + 4) % 0x55)), v250);
  std::deque<std::pair<unsigned short,unsigned short>>::resize((void *)(*(void *)(v406 + 8 * ((v407 + 5) / 0x55)) + 48 * ((v407 + 5) % 0x55)), v213);
  if (v250)
  {
    uint64_t v251 = 0;
    unsigned __int16 v252 = 0;
    unint64_t v390 = v250;
    while (1)
    {
      v253 = (unsigned __int16 *)(*(void *)(*((void *)&v411 + 1)
                                            + (((unint64_t)(v413 + v251) >> 7) & 0x1FFFFFFFFFFFFF8))
                                + 4 * ((v413 + v251) & 0x3FF));
      unint64_t v254 = v394[4] + *v253;
      uint64_t v255 = *(void *)(v394[1] + 8 * (v254 / 0x14));
      unint64_t v256 = v254 % 0x14;
      uint64_t v257 = v255 + 200 * v256;
      v260 = *(void **)(v257 + 184);
      v259 = (void *)(v257 + 184);
      v258 = v260;
      if (!v260) {
        goto LABEL_281;
      }
      do
      {
        v261 = v258;
        v258 = (void *)*v258;
      }
      while (v258);
      if (v261 == v259 || v261[4] || (unint64_t v262 = v261[5], v262 > 8)) {
LABEL_281:
      }
        double v263 = 0.0;
      else {
        double v263 = dbl_1DD8CEC20[v262];
      }
      uint64_t v264 = v253[1];
      unint64_t v265 = *(void *)(*(void *)(v255 + 200 * v256 + 136) + 8 * (*(void *)(v255 + 200 * v256 + 160) / 0x55uLL))
           + 48 * (*(void *)(v255 + 200 * v256 + 160) % 0x55uLL);
      v266 = (unsigned __int16 *)(*(void *)(*(void *)(v265 + 8)
                                            + (((unint64_t)(*(void *)(v265 + 32) + v264) >> 7) & 0x1FFFFFFFFFFFFF8))
                                + 4 * ((*(void *)(v265 + 32) + v264) & 0x3FF));
      unsigned __int16 v267 = v266[1];
      __int16 v268 = *v266;
      uint64_t v269 = v255 + 200 * v256;
      uint64_t v271 = *(void *)(v269 + 88);
      v270 = (void *)(v269 + 88);
      v272 = v270 + 3;
      *(void *)&long long v416 = *(void *)(v271 + ((v270[3] >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v270[3];
      *((void *)&v416 + 1) = *(void *)&v263 * v264;
      *(double *)&long long v417 = v263;
      *((void *)&v417 + 1) = 1;
      std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v414, (uint64_t)&v416);
      double v273 = *(double *)v408;
      if (v408[0])
      {
        do
        {
          double v274 = v273;
          double v273 = **(double **)&v273;
        }
        while (v273 != 0.0);
        if (*(void **)&v274 == v408
          || *(void *)(*(void *)&v274 + 32)
          || (unint64_t v275 = *(void *)(*(void *)&v274 + 40), v275 > 8))
        {
          double v273 = 0.0;
        }
        else
        {
          double v273 = dbl_1DD8CEC20[v275];
        }
      }
      v276 = v414;
      v277 = v415;
      if (v415 != v414) {
        break;
      }
      if (v415) {
        goto LABEL_296;
      }
LABEL_297:
      uint64_t v282 = *(unsigned __int16 *)(*(void *)(*((void *)&v411 + 1)
                                             + (((unint64_t)(v413 + v251) >> 7) & 0x1FFFFFFFFFFFFF8))
                                 + 4 * ((v413 + v251) & 0x3FF)
                                 + 2);
      v283 = (void *)*v259;
      if (!*v259) {
        goto LABEL_310;
      }
      v284 = v259;
      do
      {
        unint64_t v285 = v283[4];
        BOOL v286 = v285 >= 3;
        if (v285 >= 3) {
          v287 = v283;
        }
        else {
          v287 = v283 + 1;
        }
        if (v286) {
          v284 = v283;
        }
        v283 = (void *)*v287;
      }
      while (*v287);
      if (v284 == v259 || v284[4] > 3uLL || (unint64_t v288 = v284[5], v288 > 8)) {
LABEL_310:
      }
        double v289 = 0.0;
      else {
        double v289 = dbl_1DD8CEC20[v288];
      }
      *(void *)&long long v416 = *(void *)(*v270 + (((unint64_t)(*v272 + 3) >> 5) & 0x7FFFFFFFFFFFFF8))
                       + 16 * (*(unsigned char *)v272 + 3);
      *((void *)&v416 + 1) = *(void *)&v289 * v282;
      *(double *)&long long v417 = v289;
      *((void *)&v417 + 1) = 1;
      std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v414, (uint64_t)&v416);
      v290 = (void *)v408[0];
      if (!v408[0]) {
        goto LABEL_326;
      }
      v291 = v408;
      do
      {
        v292 = v290;
        v293 = v291;
        unint64_t v294 = v290[4];
        if (v294 >= 3) {
          v291 = v290;
        }
        else {
          ++v290;
        }
        v290 = (void *)*v290;
      }
      while (v290);
      if (v291 == v408) {
        goto LABEL_326;
      }
      v295 = v294 >= 3 ? v292 : v293;
      if (v295[4] > 3uLL) {
        goto LABEL_326;
      }
      if (v294 < 3) {
        v292 = v293;
      }
      unint64_t v296 = v292[5];
      if (v296 > 8) {
LABEL_326:
      }
        double v297 = 0.0;
      else {
        double v297 = dbl_1DD8CEC20[v296];
      }
      v298 = v414;
      v299 = v415;
      if (v415 != v414)
      {
        v300 = (void *)(*(void *)(*(void *)(v404 + (((v405 + 3) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v405 + 3))
                        + 8 * *(void *)&v297 * v251);
        unint64_t v301 = (v415 - v414) >> 3;
        if (v301 <= 1) {
          unint64_t v301 = 1;
        }
        v302 = (uint64_t *)v414;
        do
        {
          uint64_t v303 = *v302++;
          *v300++ = v303;
          --v301;
        }
        while (v301);
        v415 = &v299[(v298 - v299 + 7) & 0xFFFFFFFFFFFFFFF8];
LABEL_334:
        operator delete(v298);
        goto LABEL_335;
      }
      if (v415) {
        goto LABEL_334;
      }
LABEL_335:
      uint64_t v304 = *v266;
      v305 = (void *)*v259;
      if (!*v259) {
        goto LABEL_347;
      }
      v306 = v259;
      do
      {
        uint64_t v307 = v305[4];
        BOOL v308 = v307 == 0;
        if (v307) {
          v309 = v305;
        }
        else {
          v309 = v305 + 1;
        }
        if (!v308) {
          v306 = v305;
        }
        v305 = (void *)*v309;
      }
      while (*v309);
      if (v306 == v259 || v306[4] > 1uLL || (unint64_t v310 = v306[5], v310 > 8)) {
LABEL_347:
      }
        double v311 = 0.0;
      else {
        double v311 = dbl_1DD8CEC20[v310];
      }
      unsigned __int16 v312 = v267 - v268 + 1;
      *(void *)&long long v416 = *(void *)(*v270 + (((unint64_t)(*v272 + 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                       + 16 * (*(unsigned char *)v272 + 1);
      *((void *)&v416 + 1) = *(void *)&v311 * v304;
      *(void *)&long long v417 = *(void *)&v311 * v312;
      *((void *)&v417 + 1) = 1;
      std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v414, (uint64_t)&v416);
      v313 = (void *)v408[0];
      if (!v408[0]) {
        goto LABEL_363;
      }
      v314 = v408;
      do
      {
        v315 = v313;
        v316 = v314;
        uint64_t v317 = v313[4];
        if (v317) {
          v314 = v313;
        }
        else {
          ++v313;
        }
        v313 = (void *)*v313;
      }
      while (v313);
      if (v314 == v408) {
        goto LABEL_363;
      }
      v318 = v317 ? v315 : v316;
      if (v318[4] > 1uLL) {
        goto LABEL_363;
      }
      if (!v317) {
        v315 = v316;
      }
      unint64_t v319 = v315[5];
      if (v319 > 8) {
LABEL_363:
      }
        double v320 = 0.0;
      else {
        double v320 = dbl_1DD8CEC20[v319];
      }
      uint64_t v321 = v252;
      v322 = v414;
      v323 = v415;
      if (v415 != v414)
      {
        v324 = (void *)(*(void *)(*(void *)(v404 + (((v405 + 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v405 + 1))
                        + 8 * *(void *)&v320 * v252);
        unint64_t v325 = (v415 - v414) >> 3;
        if (v325 <= 1) {
          unint64_t v325 = 1;
        }
        v326 = (uint64_t *)v414;
        do
        {
          uint64_t v327 = *v326++;
          *v324++ = v327;
          --v325;
        }
        while (v325);
        v415 = &v323[(v322 - v323 + 7) & 0xFFFFFFFFFFFFFFF8];
LABEL_371:
        operator delete(v322);
        goto LABEL_372;
      }
      if (v415) {
        goto LABEL_371;
      }
LABEL_372:
      v328 = (void *)*v259;
      if (!*v259) {
        goto LABEL_385;
      }
      v329 = v259;
      do
      {
        unint64_t v330 = v328[4];
        BOOL v331 = v330 >= 4;
        if (v330 >= 4) {
          v332 = v328;
        }
        else {
          v332 = v328 + 1;
        }
        if (v331) {
          v329 = v328;
        }
        v328 = (void *)*v332;
      }
      while (*v332);
      if (v329 == v259 || v329[4] > 4uLL || (unint64_t v333 = v329[5], v333 > 8)) {
LABEL_385:
      }
        double v334 = 0.0;
      else {
        double v334 = dbl_1DD8CEC20[v333];
      }
      uint64_t v335 = *(void *)&v334 * *v266;
      *(void *)&long long v416 = *(void *)(*v270 + (((unint64_t)(*v272 + 4) >> 5) & 0x7FFFFFFFFFFFFF8))
                       + 16 * (*(unsigned char *)v272 + 4);
      *((void *)&v416 + 1) = v335;
      *(void *)&long long v417 = *(void *)&v334 * v312;
      *((void *)&v417 + 1) = 1;
      std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v414, (uint64_t)&v416);
      v336 = (void *)v408[0];
      if (!v408[0]) {
        goto LABEL_401;
      }
      v337 = v408;
      do
      {
        v338 = v336;
        v339 = v337;
        unint64_t v340 = v336[4];
        if (v340 >= 4) {
          v337 = v336;
        }
        else {
          ++v336;
        }
        v336 = (void *)*v336;
      }
      while (v336);
      if (v337 == v408) {
        goto LABEL_401;
      }
      v341 = v340 >= 4 ? v338 : v339;
      if (v341[4] > 4uLL) {
        goto LABEL_401;
      }
      if (v340 < 4) {
        v338 = v339;
      }
      unint64_t v342 = v338[5];
      if (v342 > 8) {
LABEL_401:
      }
        double v343 = 0.0;
      else {
        double v343 = dbl_1DD8CEC20[v342];
      }
      v344 = v414;
      v345 = v415;
      if (v415 != v414)
      {
        v346 = (void *)(*(void *)(*(void *)(v404 + (((v405 + 4) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v405 + 4))
                        + 8 * *(void *)&v343 * v252);
        unint64_t v347 = (v415 - v414) >> 3;
        if (v347 <= 1) {
          unint64_t v347 = 1;
        }
        v348 = (uint64_t *)v414;
        do
        {
          uint64_t v349 = *v348++;
          *v346++ = v349;
          --v347;
        }
        while (v347);
        v415 = &v345[(v344 - v345 + 7) & 0xFFFFFFFFFFFFFFF8];
LABEL_409:
        operator delete(v344);
        goto LABEL_410;
      }
      if (v415) {
        goto LABEL_409;
      }
LABEL_410:
      unint64_t v350 = v312 + v252;
      unint64_t v351 = v407;
      uint64_t v352 = v406;
      unint64_t v353 = *(void *)(v406 + 8 * (v407 / 0x55)) + 48 * (v407 % 0x55);
      v354 = (unsigned __int16 *)(*(void *)(*(void *)(v353 + 8)
                                            + (((unint64_t)(*(void *)(v353 + 32) + v251) >> 7) & 0x1FFFFFFFFFFFFF8))
                                + 4 * ((*(void *)(v353 + 32) + v251) & 0x3FF));
      unsigned __int16 *v354 = v252;
      v354[1] = v312 + v252 - 1;
      unint64_t v355 = *(void *)(v352 + 8 * ((v351 + 4) / 0x55)) + 48 * ((v351 + 4) % 0x55);
      v356 = (_WORD *)(*(void *)(*(void *)(v355 + 8)
                                 + (((unint64_t)(*(void *)(v355 + 32) + v251) >> 7) & 0x1FFFFFFFFFFFFF8))
                     + 4 * ((*(void *)(v355 + 32) + v251) & 0x3FF));
      _WORD *v356 = v251;
      v356[1] = v251;
      if (v252 < v350)
      {
        unint64_t v357 = *(void *)(v352 + 8 * ((v351 + 5) / 0x55)) + 48 * ((v351 + 5) % 0x55);
        uint64_t v358 = *(void *)(v357 + 32);
        uint64_t v359 = *(void *)(v357 + 8);
        do
        {
          v360 = (_WORD *)(*(void *)(v359 + (((unint64_t)(v358 + v321) >> 7) & 0x1FFFFFFFFFFFFF8))
                         + 4 * ((v358 + v321) & 0x3FF));
          _WORD *v360 = v321;
          v360[1] = v321++;
        }
        while (v350 != v321);
      }
      v252 += v312;
      ++v251;
      self = v395;
      if (v251 == v390) {
        goto LABEL_414;
      }
    }
    v278 = (void *)(*(void *)(*(void *)(v404 + ((v405 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v405)
                    + 8 * *(void *)&v273 * v251);
    unint64_t v279 = (v415 - v414) >> 3;
    if (v279 <= 1) {
      unint64_t v279 = 1;
    }
    v280 = (uint64_t *)v414;
    do
    {
      uint64_t v281 = *v280++;
      *v278++ = v281;
      --v279;
    }
    while (v279);
    v415 = &v277[(v276 - v277 + 7) & 0xFFFFFFFFFFFFFFF8];
LABEL_296:
    operator delete(v276);
    goto LABEL_297;
  }
LABEL_414:
  nms::RectForest<unsigned short,double>::operator=((uint64_t)v397, (uint64_t)&v399);
  nms::RectForest<unsigned short,double>::~RectForest((uint64_t)&v399);
  std::deque<std::pair<unsigned short,unsigned short>>::~deque[abi:ne180100](&v411);
LABEL_415:
  nms::RectForest<unsigned short,double>::operator=((uint64_t)v396, (uint64_t)v397);
  nms::RectForest<unsigned short,double>::~RectForest((uint64_t)v397);
  std::deque<std::valarray<unsigned char>>::~deque[abi:ne180100]((uint64_t)v398);
LABEL_416:
  std::deque<nms::RectForest<unsigned short,double>>::push_back(&self->_postNMSForests.__map_.__first_, (uint64_t)v396);
  nms::RectForest<unsigned short,double>::~RectForest((uint64_t)v396);
  v361 = self->_preNMSForests.__map_.__begin_;
  v362 = self->_preNMSForests.__map_.__end_;
  if (v362 == v361)
  {
    p_size = &self->_preNMSForests.__size_;
    v362 = self->_preNMSForests.__map_.__begin_;
    v367 = v391;
  }
  else
  {
    p_size = &self->_preNMSForests.__size_;
    unint64_t v364 = self->_preNMSForests.__start_;
    v365 = &v361[v364 / 0x14];
    unint64_t v366 = (unint64_t)v361[(self->_preNMSForests.__size_.__value_ + v364) / 0x14]
         + 200 * ((self->_preNMSForests.__size_.__value_ + v364) % 0x14);
    v367 = v391;
    if ((char *)*v365 + 200 * (v364 % 0x14) != (void *)v366)
    {
      v368 = (void (***)(void))((char *)*v365 + 200 * (v364 % 0x14));
      do
      {
        v369 = *v368;
        v368 += 25;
        (*v369)();
        if ((char *)v368 - (unsigned char *)*v365 == 4000)
        {
          v370 = (void (***)(void))v365[1];
          ++v365;
          v368 = v370;
        }
      }
      while (v368 != (void (***)(void))v366);
      v361 = self->_preNMSForests.__map_.__begin_;
      v362 = self->_preNMSForests.__map_.__end_;
    }
  }
  p_size->__value_ = 0;
  unint64_t v371 = (char *)v362 - (char *)v361;
  if (v371 >= 0x11)
  {
    do
    {
      operator delete(*v361);
      v372 = self->_preNMSForests.__map_.__end_;
      v361 = self->_preNMSForests.__map_.__begin_ + 1;
      self->_preNMSForests.__map_.__begin_ = v361;
      unint64_t v371 = (char *)v372 - (char *)v361;
    }
    while (v371 > 0x10);
  }
  if (v371 >> 3 == 1)
  {
    unint64_t v373 = 10;
LABEL_430:
    self->_preNMSForests.__start_ = v373;
  }
  else if (v371 >> 3 == 2)
  {
    unint64_t v373 = 20;
    goto LABEL_430;
  }
  v374 = -[CRNMS buildTextFeaturesFromRectForest:byEdge:options:](self, "buildTextFeaturesFromRectForest:byEdge:options:", (char *)self->_postNMSForests.__map_.__begin_[self->_postNMSForests.__start_ / 0x14]+ 200 * (self->_postNMSForests.__start_ % 0x14), self->_outputTextFeatureLevel, v367, v387);
  v375 = self->_postNMSForests.__map_.__begin_;
  v376 = self->_postNMSForests.__map_.__end_;
  if (v376 == v375)
  {
    v379 = &self->_postNMSForests.__size_;
    v376 = self->_postNMSForests.__map_.__begin_;
  }
  else
  {
    unint64_t v377 = self->_postNMSForests.__start_;
    v378 = &v375[v377 / 0x14];
    v379 = &self->_postNMSForests.__size_;
    unint64_t v380 = (unint64_t)v375[(self->_postNMSForests.__size_.__value_ + v377) / 0x14]
         + 200 * ((self->_postNMSForests.__size_.__value_ + v377) % 0x14);
    if ((char *)*v378 + 200 * (v377 % 0x14) != (void *)v380)
    {
      v381 = (void (***)(void))((char *)*v378 + 200 * (v377 % 0x14));
      do
      {
        v382 = *v381;
        v381 += 25;
        (*v382)();
        if ((char *)v381 - (unsigned char *)*v378 == 4000)
        {
          v383 = (void (***)(void))v378[1];
          ++v378;
          v381 = v383;
        }
      }
      while (v381 != (void (***)(void))v380);
      v376 = self->_postNMSForests.__map_.__end_;
      v375 = self->_postNMSForests.__map_.__begin_;
      v367 = v391;
    }
  }
  v379->__value_ = 0;
  unint64_t v384 = (char *)v376 - (char *)v375;
  if (v384 >= 0x11)
  {
    do
    {
      operator delete(*v375);
      v375 = self->_postNMSForests.__map_.__begin_ + 1;
      self->_postNMSForests.__map_.__begin_ = v375;
      unint64_t v384 = (char *)self->_postNMSForests.__map_.__end_ - (char *)v375;
    }
    while (v384 > 0x10);
  }
  if (v384 >> 3 == 1)
  {
    unint64_t v385 = 10;
LABEL_445:
    self->_postNMSForests.__start_ = v385;
  }
  else if (v384 >> 3 == 2)
  {
    unint64_t v385 = 20;
    goto LABEL_445;
  }

  return v374;
}

- (unint64_t)convertSubTextFeatures:(id)a3 toRects:(void *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v5;
    unint64_t v8 = 0;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          if (*(void *)(*((void *)&v29 + 1) + 8 * i)) {
            ++v8;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v9);
    }

    std::valarray<double>::resize((uint64_t)a4, 4 * v8, 0.0);
    unint64_t v24 = v6;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          unint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          if (v17)
          {
            [*(id *)(*((void *)&v25 + 1) + 8 * j) bounds];
            *(void *)(*(void *)a4 + 32 * v14) = v18;
            [v17 bounds];
            uint64_t v19 = 32 * v14;
            *(void *)(*(void *)a4 + ((32 * v14) | 8)) = v20;
            [v17 bounds];
            *(void *)(*(void *)a4 + (v19 | 0x10)) = v21;
            [v17 bounds];
            *(void *)(*(void *)a4 + (v19 | 0x18)) = v22;
            ++v14;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v13);
    }

    id v6 = v24;
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)buildRectForest:(void *)a3 fromTextDetectorQuadFeatures:(const void *)a4 forestFeatureType:(unint64_t)a5 withInputSize:(CGSize)a6 scoreMap:(vImage_Buffer *)a7 andScoreMapScaleFactor:(double)a8 options:(id)a9
{
  return -[CRNMS buildRectForest:fromTextDetectorQuadFeatures:forestFeatureType:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:](self, "buildRectForest:fromTextDetectorQuadFeatures:forestFeatureType:withInputSize:scoreMap:scoreMapScaleFactor:andTileRects:options:", a3, a4, a5, a7, 0, a9, a6.width, a6.height, a8);
}

- (BOOL)buildRectForest:(void *)a3 fromTextDetectorQuadFeatures:(const void *)a4 forestFeatureType:(unint64_t)a5 withInputSize:(CGSize)a6 scoreMap:(vImage_Buffer *)a7 scoreMapScaleFactor:(double)a8 andTileRects:(id)a9 options:(id)a10
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v16 = a9;
  id v123 = a10;
  uint64_t v148 = v16;
  if (v16) {
    BOOL v144 = (unint64_t)[v16 count] > 1;
  }
  else {
    BOOL v144 = 0;
  }
  unint64_t v17 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
  LOBYTE(dest.data) = 0;
  std::vector<BOOL>::vector(&__p, v17, (unsigned __int8 *)&dest);
  if (!a5)
  {
    *((void *)a3 + 1) = 0;
    dest.data = 0;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)a3 + 22, 0, (uint64_t **)&dest)[5] = (uint64_t *)5;
    dest.data = (void *)1;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)a3 + 22, 1uLL, (uint64_t **)&dest)[5] = (uint64_t *)5;
    dest.data = (void *)2;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)a3 + 22, 2uLL, (uint64_t **)&dest)[5] = (uint64_t *)9;
    dest.data = (void *)3;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)a3 + 22, 3uLL, (uint64_t **)&dest)[5] = (uint64_t *)8;
    dest.data = (void *)4;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)a3 + 22, 4uLL, (uint64_t **)&dest)[5] = (uint64_t *)8;
  }
  if (a7->data)
  {
    uint64_t v20 = (void **)((char *)a3 + 16);
    uint64_t v19 = (void *)*((void *)a3 + 2);
    if (v19)
    {
      free(v19);
      *uint64_t v20 = 0;
    }
    uint64_t v21 = malloc_type_calloc(a7->height * a7->width, 1uLL, 0x100004077774924uLL);
    vImagePixelCount v22 = a7->height;
    vImagePixelCount v23 = a7->width;
    dest.data = v21;
    dest.double height = v22;
    dest.double width = v23;
    dest.rowBytes = v23;
    vImageConvert_PlanarFtoPlanar8(a7, &dest, 1.0, 0.0, 0);
    if (a8 == 1.0 || a8 <= 0.0)
    {
      long long v25 = *(_OWORD *)&dest.width;
      *(_OWORD *)uint64_t v20 = *(_OWORD *)&dest.data;
      *((_OWORD *)a3 + 2) = v25;
      if (!a5) {
        goto LABEL_17;
      }
LABEL_55:
      BOOL v59 = 0;
      goto LABEL_56;
    }
    uint64x2_t v140 = vcvtq_u64_f64(vrndpq_f64(vmulq_n_f64(vcvtq_f64_u64(*(uint64x2_t *)&a7->height), a8)));
    *((void *)a3 + 2) = malloc_type_calloc(v140.i64[0] * v140.i64[1], 1uLL, 0x100004077774924uLL);
    *(uint64x2_t *)((char *)a3 + 24) = v140;
    *((void *)a3 + 5) = v140.i64[1];
    if (vImageScale_Planar8(&dest, (const vImage_Buffer *)((char *)a3 + 16), 0, 0))
    {
      free(*v20);
      long long v24 = *(_OWORD *)&dest.width;
      *(_OWORD *)uint64_t v20 = *(_OWORD *)&dest.data;
      *((_OWORD *)a3 + 2) = v24;
    }
    free(dest.data);
  }
  if (a5) {
    goto LABEL_55;
  }
LABEL_17:
  uint64_t v26 = *(void *)a4;
  if (*((void *)a4 + 1) == *(void *)a4) {
    goto LABEL_55;
  }
  uint64_t v129 = a3;
  unint64_t v27 = 0;
  unint64_t v28 = 0;
  unint64_t v29 = 0;
  long long v30 = __p;
  do
  {
    uint64_t v31 = v26 + 168 * v29;
    uint64_t v34 = *(void *)(v31 + 144);
    long long v32 = (void *)(v31 + 144);
    uint64_t v33 = v34;
    uint64_t v35 = v32 + 1;
    uint64_t v36 = v32[1];
    unint64_t v37 = v29 >> 6;
    uint64_t v38 = 1 << v29;
    if (v34 == v36) {
      uint64_t v39 = v30[v37] & ~v38;
    }
    else {
      uint64_t v39 = v30[v37] | v38;
    }
    v30[v37] = v39;
    BOOL v40 = v144;
    if (v33 == v36) {
      BOOL v40 = 0;
    }
    if (!v40)
    {
      if ((v39 & v38) == 0) {
        goto LABEL_45;
      }
LABEL_44:
      v28 -= 0x71C71C71C71C71C7 * ((uint64_t)(*v35 - *v32) >> 4);
      ++v27;
      goto LABEL_45;
    }
    uint64_t v133 = v32 + 1;
    v135 = v32;
    unint64_t v137 = v27;
    unint64_t v141 = v28;
    do
    {
      CRDetectorUtils::convertPointToRect(v33, v18);
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      CGAffineTransformMakeScale(&v160, 1.0 / width, 1.0 / height);
      v165.origin.CGFloat x = v42;
      v165.origin.CGFloat y = v44;
      v165.size.double width = v46;
      v165.size.double height = v48;
      CGRect v166 = CGRectApplyAffineTransform(v165, &v160);
      CGFloat x = v166.origin.x;
      CGFloat y = v166.origin.y;
      CGFloat v51 = v166.size.width;
      CGFloat v52 = v166.size.height;
      long long v156 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      id v53 = v16;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v156 objects:v163 count:16];
      if (v54)
      {
        uint64_t v55 = *(void *)v157;
        while (2)
        {
          for (uint64_t i = 0; i != v54; ++i)
          {
            if (*(void *)v157 != v55) {
              objc_enumerationMutation(v53);
            }
            [*(id *)(*((void *)&v156 + 1) + 8 * i) rectValue];
            v168.origin.CGFloat x = x;
            v168.origin.CGFloat y = y;
            v168.size.double width = v51;
            v168.size.double height = v52;
            if (CGRectContainsRect(v167, v168))
            {
              *((void *)__p + v37) &= ~v38;
              goto LABEL_36;
            }
          }
          uint64_t v54 = [v53 countByEnumeratingWithState:&v156 objects:v163 count:16];
          if (v54) {
            continue;
          }
          break;
        }
      }
LABEL_36:

      long long v30 = __p;
      uint64_t v57 = *((void *)__p + v37) & v38;
      v33 += 144;
      if (v57) {
        BOOL v58 = v33 == v36;
      }
      else {
        BOOL v58 = 1;
      }
    }
    while (!v58);
    unint64_t v27 = v137;
    unint64_t v28 = v141;
    uint64_t v35 = v133;
    long long v32 = v135;
    if (v57) {
      goto LABEL_44;
    }
LABEL_45:
    ++v29;
    uint64_t v26 = *(void *)a4;
  }
  while (v29 < 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3));
  BOOL v59 = 0;
  if (!v27 || !v28) {
    goto LABEL_56;
  }
  v61 = (void **)(v129 + 23);
  v60 = (void *)v129[23];
  if (!v60)
  {
    vImagePixelCount v122 = 0;
    double v65 = 0.0;
    double v136 = 0.0;
LABEL_98:
    uint64_t v138 = 0;
    goto LABEL_99;
  }
  v62 = (void *)v129[23];
  do
  {
    v63 = v62;
    v62 = (void *)*v62;
  }
  while (v62);
  if (v63 == v61 || v63[4] || (unint64_t v64 = v63[5], v64 > 8)) {
    double v65 = 0.0;
  }
  else {
    double v65 = dbl_1DD8CEC20[v64];
  }
  uint64_t v67 = v129 + 23;
  v68 = (void *)v129[23];
  do
  {
    uint64_t v69 = v68[4];
    BOOL v70 = v69 == 0;
    if (v69) {
      uint64_t v71 = v68;
    }
    else {
      uint64_t v71 = v68 + 1;
    }
    if (!v70) {
      uint64_t v67 = v68;
    }
    v68 = (void *)*v71;
  }
  while (*v71);
  if (v67 == v61 || v67[4] > 1uLL || (unint64_t v72 = v67[5], v72 > 8)) {
    double v136 = 0.0;
  }
  else {
    double v136 = dbl_1DD8CEC20[v72];
  }
  unint64_t v73 = v129 + 23;
  uint64_t v74 = (void *)v129[23];
  do
  {
    unint64_t v75 = v74[4];
    BOOL v76 = v75 >= 3;
    if (v75 >= 3) {
      v77 = v74;
    }
    else {
      v77 = v74 + 1;
    }
    if (v76) {
      unint64_t v73 = v74;
    }
    uint64_t v74 = (void *)*v77;
  }
  while (*v77);
  if (v73 == v61 || v73[4] > 3uLL || (unint64_t v78 = v73[5], v78 > 8)) {
    vImagePixelCount v122 = 0;
  }
  else {
    vImagePixelCount v122 = *(void *)&dbl_1DD8CEC20[v78];
  }
  v79 = v129 + 23;
  do
  {
    unint64_t v80 = v60[4];
    BOOL v81 = v80 >= 4;
    if (v80 >= 4) {
      uint64_t v82 = v60;
    }
    else {
      uint64_t v82 = v60 + 1;
    }
    if (v81) {
      v79 = v60;
    }
    v60 = (void *)*v82;
  }
  while (*v82);
  if (v79 == v61 || v79[4] > 4uLL) {
    goto LABEL_98;
  }
  switch(v79[5])
  {
    case 0:
    case 1:
      uint64_t v83 = 4;
      break;
    case 2:
      uint64_t v83 = 8;
      break;
    case 3:
    case 4:
      uint64_t v83 = 2;
      break;
    case 5:
      uint64_t v83 = 5;
      break;
    case 6:
      uint64_t v83 = 9;
      break;
    case 7:
      uint64_t v83 = 3;
      break;
    case 8:
      uint64_t v83 = 14;
      break;
    default:
      goto LABEL_98;
  }
  uint64_t v138 = v83;
LABEL_99:
  v120 = (void *)(*(void *)(v129[11] + ((v129[14] >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v129[14]);
  std::valarray<double>::resize((uint64_t)v120, *(void *)&v65 * v27, 0.0);
  v132 = (void *)(*(void *)(v129[11] + (((unint64_t)(v129[14] + 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * (*((unsigned char *)v129 + 112) + 1));
  std::valarray<double>::resize((uint64_t)v132, *(void *)&v136 * v28, 0.0);
  v121 = (void *)(*(void *)(v129[11] + (((unint64_t)(v129[14] + 3) >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * (*((unsigned char *)v129 + 112) + 3));
  std::valarray<double>::resize((uint64_t)v121, v122 * v27, 0.0);
  v134 = (void *)(*(void *)(v129[11] + (((unint64_t)(v129[14] + 4) >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * (*((unsigned char *)v129 + 112) + 4));
  std::valarray<double>::resize((uint64_t)v134, v138 * v28, 0.0);
  unint64_t v84 = v129[20];
  uint64_t v85 = *(void *)(v129[17] + 8 * (v84 / 0x55));
  unint64_t v86 = v84 % 0x55;
  v118 = (void *)(v85 + 48 * (v84 % 0x55));
  std::deque<std::pair<unsigned short,unsigned short>>::resize(v118, v27);
  unint64_t v87 = v129[20] + 4;
  uint64_t v88 = *(void *)(v129[17] + 8 * (v87 / 0x55));
  unint64_t v89 = v87 % 0x55;
  v119 = (void *)(v88 + 48 * (v87 % 0x55));
  std::deque<std::pair<unsigned short,unsigned short>>::resize(v119, v27);
  unint64_t v142 = v86;
  uint64_t v145 = v85;
  double v90 = v65;
  unint64_t v91 = v129[20] + 5;
  uint64_t v92 = *(void *)(v129[17] + 8 * (v91 / 0x55));
  unint64_t v93 = v91 % 0x55;
  unint64_t v131 = (void *)(v92 + 48 * (v91 % 0x55));
  std::deque<std::pair<unsigned short,unsigned short>>::resize(v131, v28);
  unint64_t v94 = v129[20] + 2;
  uint64_t v95 = *(void *)(v129[17] + 8 * (v94 / 0x55));
  unint64_t v96 = v94 % 0x55;
  uint64_t v130 = (void *)(v95 + 48 * (v94 % 0x55));
  std::deque<std::pair<unsigned short,unsigned short>>::resize(v130, v28);
  uint64_t v98 = *(void *)a4;
  uint64_t v97 = *((void *)a4 + 1);
  if (v97 != *(void *)a4)
  {
    unint64_t v99 = 0;
    uint64_t v125 = 0;
    uint64_t v100 = 0;
    v116 = (void *)(v88 + 48 * v89 + 32);
    double v117 = v90;
    int64_t v128 = (void *)(v92 + 48 * v93 + 32);
    v127 = (void *)(v95 + 48 * v96 + 32);
    uint64_t v115 = (void *)(v145 + 48 * v142 + 32);
    uint64_t v146 = 8 * *(void *)&v136;
    uint64_t v143 = 8 * v138;
    do
    {
      if ((*(void *)((char *)__p + ((v99 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v99))
      {
        uint64_t v101 = v98 + 168 * v99;
        uint64_t v103 = *(void *)(v101 + 144);
        uint64_t v102 = *(void *)(v101 + 152);
        dest.data = (void *)(*v121 + 8 * v100 * v122);
        dest.double height = v122;
        dest.double width = 1;
        std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 3uLL);
        -[CRNMS fillRectForestDatum:asDimType:withCRTextDetectorQuad:andInputSize:](self, "fillRectForestDatum:asDimType:withCRTextDetectorQuad:andInputSize:", &dest, *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 3uLL), *(void *)a4 + 168 * v99, width, height);
        v155[0] = *v120 + 8 * v100 * *(void *)&v117;
        *(double *)&v155[1] = v117;
        v155[2] = 1;
        std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 0);
        uint64_t v104 = *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 0);
        std::valarray<double>::valarray(&v152, (uint64_t)&dest);
        -[CRNMS fillRectForestDatum:asDimType:withQuad:andDimType:](self, "fillRectForestDatum:asDimType:withQuad:andDimType:", v155, v104, &v152, *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 3uLL));
        if (v152)
        {
          if (v153 != v152) {
            v153 += ((unsigned char *)v152 - v153 + 7) & 0xFFFFFFFFFFFFFFF8;
          }
          operator delete(v152);
        }
        unint64_t v124 = (v102 - v103) / 144;
        v105 = (_WORD *)(*(void *)(v119[1] + (((unint64_t)(*v116 + v100) >> 7) & 0x1FFFFFFFFFFFFF8))
                       + 4 * ((*v116 + v100) & 0x3FF));
        _WORD *v105 = v100;
        v105[1] = v100;
        if (v102 != v103)
        {
          uint64_t v106 = 0;
          uint64_t v107 = v125;
          if (v124 <= 1) {
            uint64_t v108 = 1;
          }
          else {
            uint64_t v108 = (v102 - v103) / 144;
          }
          uint64_t v109 = v146 * v125;
          uint64_t v110 = v143 * v125;
          do
          {
            unsigned __int16 v152 = (void *)(*v134 + v110);
            v153 = (unsigned char *)v138;
            uint64_t v154 = 1;
            std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 4uLL);
            -[CRNMS fillRectForestDatum:asDimType:withCRTextDetectorQuad:andInputSize:](self, "fillRectForestDatum:asDimType:withCRTextDetectorQuad:andInputSize:", &v152, *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 4uLL), *(void *)(*(void *)a4 + 168 * v99 + 144) + v106, width, height);
            v151[0] = *v132 + v109;
            *(double *)&v151[1] = v136;
            v151[2] = 1;
            std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 1uLL);
            uint64_t v111 = *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 1uLL);
            std::valarray<double>::valarray(&v149, (uint64_t)&v152);
            -[CRNMS fillRectForestDatum:asDimType:withQuad:andDimType:](self, "fillRectForestDatum:asDimType:withQuad:andDimType:", v151, v111, &v149, *std::map<nms::ForestLevelType,nms::RepresentationDimType>::at(*v61, 4uLL));
            if (v149)
            {
              if (v150 != v149) {
                v150 += ((unsigned char *)v149 - v150 + 7) & 0xFFFFFFFFFFFFFFF8;
              }
              operator delete(v149);
            }
            v112 = (_WORD *)(*(void *)(v131[1] + (((unint64_t)(v107 + *v128) >> 7) & 0x1FFFFFFFFFFFFF8))
                           + 4 * ((v107 + *v128) & 0x3FF));
            _WORD *v112 = v107;
            v112[1] = v107;
            v113 = (_WORD *)(*(void *)(v130[1] + (((unint64_t)(v107 + *v127) >> 7) & 0x1FFFFFFFFFFFFF8))
                           + 4 * ((v107 + *v127) & 0x3FF));
            ++v107;
            _WORD *v113 = v100;
            v113[1] = v100;
            v106 += 144;
            v109 += v146;
            v110 += v143;
            --v108;
          }
          while (v108);
        }
        uint64_t v114 = (_WORD *)(*(void *)(v118[1] + (((unint64_t)(*v115 + v100) >> 7) & 0x1FFFFFFFFFFFFF8))
                       + 4 * ((*v115 + v100) & 0x3FF));
        *uint64_t v114 = v125;
        v114[1] = v124 + v125 - 1;
        ++v100;
        uint64_t v98 = *(void *)a4;
        uint64_t v97 = *((void *)a4 + 1);
        v125 += v124;
      }
      ++v99;
    }
    while (v99 < 0xCF3CF3CF3CF3CF3DLL * ((v97 - v98) >> 3));
  }
  BOOL v59 = 1;
LABEL_56:
  if (__p) {
    operator delete(__p);
  }

  return v59;
}

- (void)fillTextFeature:(id)a3 withRectDatum:(const void *)a4
{
  id v23 = a3;
  objc_msgSend(v23, "setBounds:", **(double **)a4, *(double *)(*(void *)a4 + 8), *(double *)(*(void *)a4 + 16), *(double *)(*(void *)a4 + 24));
  [v23 bounds];
  double v6 = v5;
  [v23 bounds];
  [v23 setTopLeft:v6];
  [v23 bounds];
  double v8 = v7;
  [v23 bounds];
  double v10 = v9;
  [v23 bounds];
  [v23 setTopRight:v8 + v10];
  [v23 bounds];
  double v12 = v11;
  [v23 bounds];
  double v14 = v13;
  [v23 bounds];
  double v16 = v15;
  [v23 bounds];
  objc_msgSend(v23, "setBottomRight:", v12 + v14, v16 + v17);
  [v23 bounds];
  double v19 = v18;
  [v23 bounds];
  double v21 = v20;
  [v23 bounds];
  objc_msgSend(v23, "setBottomLeft:", v19, v21 + v22);
}

- (id)getTextFeatureFromQuadAngleDatum:(const void *)a3
{
  v4 = -[CRTextFeature initWithTopLeft:topRight:bottomLeft:bottomRight:]([CRTextFeature alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", **(double **)a3, *(double *)(*(void *)a3 + 8), *(double *)(*(void *)a3 + 16), *(double *)(*(void *)a3 + 24), *(double *)(*(void *)a3 + 48), *(double *)(*(void *)a3 + 56), *(double *)(*(void *)a3 + 32), *(double *)(*(void *)a3 + 40));
  double v5 = *(double *)(*(void *)a3 + 72);
  *(float *)&double v5 = v5;
  [(CRTextFeature *)v4 setBaselineAngle:v5];
  [(CRTextFeature *)v4 setIsCurved:*(double *)(*(void *)a3 + 80) != 0.0];
  [(CRTextFeature *)v4 setFeatureID:(int)*(double *)(*(void *)a3 + 104)];
  return v4;
}

- (id)buildTextFeaturesFromRectForest:(const void *)a3 byEdge:(unint64_t)a4 options:(id)a5
{
  id v110 = a5;
  if (a4 > 5)
  {
    unint64_t v8 = 5;
    unint64_t v9 = 5;
  }
  else
  {
    unint64_t v8 = qword_1DD8CEBA0[a4];
    unint64_t v9 = qword_1DD8CEBD0[a4];
  }
  double v10 = objc_msgSend(v110, "objectForKey:", @"CRImageReaderTextDetector", v110);
  int v11 = [v10 isEqualToString:@"CRImageReaderTextDetectorCI"];

  if (v11)
  {
    if ((a4 | 2) == 3)
    {
      unint64_t v12 = *((void *)a3 + 20) + a4;
      uint64_t v13 = *(void *)(*((void *)a3 + 17) + 8 * (v12 / 0x55));
      unint64_t v14 = v12 % 0x55;
      uint64_t v15 = v13 + 48 * (v12 % 0x55);
      uint64_t v17 = *(void *)(v15 + 40);
      double v16 = (unint64_t *)(v15 + 40);
      id v114 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v17];
      if (*v16)
      {
        unint64_t v18 = 0;
        double v19 = (char *)a3 + 184;
        uint64_t v20 = v13 + 48 * v14;
        v121 = (void *)(v20 + 32);
        double v21 = (void *)(v20 + 8);
        v116 = v16;
        do
        {
          double v22 = *(void **)v19;
          if (!*(void *)v19) {
            goto LABEL_21;
          }
          id v23 = (char *)a3 + 184;
          do
          {
            unint64_t v24 = v22[4];
            BOOL v25 = v24 >= v8;
            if (v24 >= v8) {
              uint64_t v26 = v22;
            }
            else {
              uint64_t v26 = v22 + 1;
            }
            if (v25) {
              id v23 = (char *)v22;
            }
            double v22 = (void *)*v26;
          }
          while (*v26);
          if (v23 == v19 || *((void *)v23 + 4) > v8 || (unint64_t v27 = *((void *)v23 + 5), v27 > 8)) {
LABEL_21:
          }
            double v28 = 0.0;
          else {
            double v28 = dbl_1DD8CEC20[v27];
          }
          uint64_t v130 = *(void *)(*((void *)a3 + 11) + (((*((void *)a3 + 14) + v8) >> 5) & 0x7FFFFFFFFFFFFF8))
               + 16 * (*((unsigned char *)a3 + 112) + v8);
          unint64_t v131 = *(void *)&v28 * v18;
          double v132 = v28;
          uint64_t v133 = 1;
          std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v128, (uint64_t)&v130);
          v118 = objc_opt_new();
          -[CRNMS fillTextFeature:withRectDatum:](self, "fillTextFeature:withRectDatum:");
          unint64_t v29 = objc_opt_new();
          long long v30 = (unsigned __int16 *)(*(void *)(*v21 + (((*v121 + v18) >> 7) & 0x1FFFFFFFFFFFFF8))
                                   + 4 * ((*v121 + v18) & 0x3FF));
          unint64_t v31 = *v30;
          if (v31 <= v30[1])
          {
            do
            {
              long long v32 = *(void **)v19;
              if (!*(void *)v19) {
                goto LABEL_36;
              }
              uint64_t v33 = (char *)a3 + 184;
              do
              {
                unint64_t v34 = v32[4];
                BOOL v35 = v34 >= v9;
                if (v34 >= v9) {
                  uint64_t v36 = v32;
                }
                else {
                  uint64_t v36 = v32 + 1;
                }
                if (v35) {
                  uint64_t v33 = (char *)v32;
                }
                long long v32 = (void *)*v36;
              }
              while (*v36);
              if (v33 == v19 || *((void *)v33 + 4) > v9 || (unint64_t v37 = *((void *)v33 + 5), v37 > 8)) {
LABEL_36:
              }
                double v38 = 0.0;
              else {
                double v38 = dbl_1DD8CEC20[v37];
              }
              uint64_t v130 = *(void *)(*((void *)a3 + 11) + (((*((void *)a3 + 14) + v9) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (*((unsigned char *)a3 + 112) + v9);
              unint64_t v131 = *(void *)&v38 * v31;
              double v132 = v38;
              uint64_t v133 = 1;
              std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&__p, (uint64_t)&v130);
              uint64_t v39 = objc_opt_new();
              [(CRNMS *)self fillTextFeature:v39 withRectDatum:&__p];
              [v29 addObject:v39];

              if (__p)
              {
                if (v127 != __p) {
                  v127 += ((unsigned char *)__p - v127 + 7) & 0xFFFFFFFFFFFFFFF8;
                }
                operator delete(__p);
              }
              BOOL v25 = v31++ >= *(unsigned __int16 *)(*(void *)(*v21 + (((*v121 + v18) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                 + 4 * ((*v121 + v18) & 0x3FF)
                                                 + 2);
            }
            while (!v25);
          }
          [v118 setSubFeatures:v29];
          [v114 addObject:v118];

          if (v128)
          {
            if (v129 != v128) {
              v129 += ((unsigned char *)v128 - v129 + 7) & 0xFFFFFFFFFFFFFFF8;
            }
            operator delete(v128);
          }
          ++v18;
        }
        while (v18 < *v116);
      }
    }
    else
    {
      unint64_t v69 = *((void *)a3 + 20);
      uint64_t v70 = *((void *)a3 + 17);
      uint64_t v71 = *(void *)(v70 + 8 * (v69 / 0x55));
      unint64_t v72 = v69 % 0x55;
      uint64_t v73 = v69 + 1;
      unint64_t v74 = (v69 + 1) / 0x55;
      uint64_t v75 = *(void *)(v70 + 8 * v74);
      uint64_t v76 = v71 + 48 * (v69 % 0x55);
      uint64_t v78 = *(void *)(v76 + 40);
      v77 = (unint64_t *)(v76 + 40);
      id v114 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v78];
      if (*v77)
      {
        v112 = v77;
        unint64_t v123 = 0;
        v79 = (char *)a3 + 184;
        uint64_t v80 = v71 + 48 * v72;
        uint64_t v115 = (void *)(v80 + 8);
        double v117 = (void *)(v80 + 32);
        uint64_t v81 = v75 + 48 * (v73 - 85 * v74);
        uint64_t v82 = (void *)(v81 + 32);
        uint64_t v83 = (void *)(v81 + 8);
        do
        {
          unint64_t v84 = *(char **)v79;
          if (!*(void *)v79) {
            goto LABEL_100;
          }
          do
          {
            uint64_t v85 = v84;
            unint64_t v84 = *(char **)v84;
          }
          while (v84);
          if (v85 == v79 || *((void *)v85 + 4) || (unint64_t v86 = *((void *)v85 + 5), v86 > 8)) {
LABEL_100:
          }
            double v87 = 0.0;
          else {
            double v87 = dbl_1DD8CEC20[v86];
          }
          uint64_t v130 = *(void *)(*((void *)a3 + 11) + ((*((void *)a3 + 14) >> 5) & 0x7FFFFFFFFFFFFF8))
               + 16 * *((void *)a3 + 14);
          unint64_t v131 = *(void *)&v87 * v123;
          double v132 = v87;
          uint64_t v133 = 1;
          std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v128, (uint64_t)&v130);
          v113 = objc_opt_new();
          -[CRNMS fillTextFeature:withRectDatum:](self, "fillTextFeature:withRectDatum:");
          v120 = objc_opt_new();
          uint64_t v88 = (unsigned __int16 *)(*(void *)(*v115 + (((*v117 + v123) >> 7) & 0x1FFFFFFFFFFFFF8))
                                   + 4 * ((*v117 + v123) & 0x3FF));
          unint64_t v89 = *v88;
          if (v89 <= v88[1])
          {
            do
            {
              double v90 = *(char **)v79;
              if (!*(void *)v79) {
                goto LABEL_114;
              }
              unint64_t v91 = (char *)a3 + 184;
              do
              {
                uint64_t v92 = *((void *)v90 + 4);
                BOOL v93 = v92 == 0;
                if (v92) {
                  unint64_t v94 = (char **)v90;
                }
                else {
                  unint64_t v94 = (char **)(v90 + 8);
                }
                if (!v93) {
                  unint64_t v91 = v90;
                }
                double v90 = *v94;
              }
              while (*v94);
              if (v91 == v79 || *((void *)v91 + 4) > 1uLL || (unint64_t v95 = *((void *)v91 + 5), v95 > 8)) {
LABEL_114:
              }
                double v96 = 0.0;
              else {
                double v96 = dbl_1DD8CEC20[v95];
              }
              uint64_t v130 = *(void *)(*((void *)a3 + 11)
                               + (((unint64_t)(*((void *)a3 + 14) + 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (*((unsigned char *)a3 + 112) + 1);
              unint64_t v131 = *(void *)&v96 * v89;
              double v132 = v96;
              uint64_t v133 = 1;
              std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&__p, (uint64_t)&v130);
              uint64_t v97 = objc_opt_new();
              [(CRNMS *)self fillTextFeature:v97 withRectDatum:&__p];
              uint64_t v98 = objc_opt_new();
              unint64_t v99 = (unsigned __int16 *)(*(void *)(*v83 + (((*v82 + v89) >> 7) & 0x1FFFFFFFFFFFFF8))
                                       + 4 * ((*v82 + v89) & 0x3FF));
              unint64_t v100 = *v99;
              if (v100 <= v99[1])
              {
                do
                {
                  uint64_t v101 = *(char **)v79;
                  if (!*(void *)v79) {
                    goto LABEL_129;
                  }
                  uint64_t v102 = (char *)a3 + 184;
                  do
                  {
                    unint64_t v103 = *((void *)v101 + 4);
                    BOOL v104 = v103 >= 2;
                    if (v103 >= 2) {
                      v105 = (char **)v101;
                    }
                    else {
                      v105 = (char **)(v101 + 8);
                    }
                    if (v104) {
                      uint64_t v102 = v101;
                    }
                    uint64_t v101 = *v105;
                  }
                  while (*v105);
                  if (v102 == v79 || *((void *)v102 + 4) > 2uLL || (unint64_t v106 = *((void *)v102 + 5), v106 > 8)) {
LABEL_129:
                  }
                    double v107 = 0.0;
                  else {
                    double v107 = dbl_1DD8CEC20[v106];
                  }
                  uint64_t v130 = *(void *)(*((void *)a3 + 11)
                                   + (((unint64_t)(*((void *)a3 + 14) + 2) >> 5) & 0x7FFFFFFFFFFFFF8))
                       + 16 * (*((unsigned char *)a3 + 112) + 2);
                  unint64_t v131 = *(void *)&v107 * v100;
                  double v132 = v107;
                  uint64_t v133 = 1;
                  std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v124, (uint64_t)&v130);
                  uint64_t v108 = objc_opt_new();
                  [(CRNMS *)self fillTextFeature:v108 withRectDatum:&v124];
                  [v98 addObject:v108];

                  if (v124)
                  {
                    if (v125 != v124) {
                      v125 += ((unsigned char *)v124 - v125 + 7) & 0xFFFFFFFFFFFFFFF8;
                    }
                    operator delete(v124);
                  }
                  BOOL v25 = v100++ >= *(unsigned __int16 *)(*(void *)(*v83 + (((*v82 + v89) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                      + 4 * ((*v82 + v89) & 0x3FF)
                                                      + 2);
                }
                while (!v25);
              }
              [v97 setSubFeatures:v98];
              [v120 addObject:v97];

              if (__p)
              {
                if (v127 != __p) {
                  v127 += ((unsigned char *)__p - v127 + 7) & 0xFFFFFFFFFFFFFFF8;
                }
                operator delete(__p);
              }
              BOOL v25 = v89++ >= *(unsigned __int16 *)(*(void *)(*v115 + (((*v117 + v123) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                 + 4 * ((*v117 + v123) & 0x3FF)
                                                 + 2);
            }
            while (!v25);
          }
          [v113 setSubFeatures:v120];
          [v114 addObject:v113];

          if (v128)
          {
            if (v129 != v128) {
              v129 += ((unsigned char *)v128 - v129 + 7) & 0xFFFFFFFFFFFFFFF8;
            }
            operator delete(v128);
          }
          ++v123;
        }
        while (v123 < *v112);
      }
    }
  }
  else
  {
    unint64_t v40 = *((void *)a3 + 20);
    uint64_t v41 = *(void *)(*((void *)a3 + 17) + 8 * (v40 / 0x55));
    unint64_t v42 = v40 % 0x55;
    uint64_t v43 = v41 + 48 * (v40 % 0x55);
    uint64_t v45 = *(void *)(v43 + 40);
    CGFloat v44 = (unint64_t *)(v43 + 40);
    id v114 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v45];
    if (*v44)
    {
      unint64_t v46 = 0;
      double v47 = (char *)a3 + 184;
      uint64_t v48 = v41 + 48 * v42;
      v49 = (void *)(v48 + 32);
      v50 = (void *)(v48 + 8);
      v119 = v44;
      do
      {
        CGFloat v51 = *(void **)v47;
        if (!*(void *)v47) {
          goto LABEL_64;
        }
        CGFloat v52 = (char *)a3 + 184;
        do
        {
          unint64_t v53 = v51[4];
          BOOL v54 = v53 >= 3;
          if (v53 >= 3) {
            uint64_t v55 = v51;
          }
          else {
            uint64_t v55 = v51 + 1;
          }
          if (v54) {
            CGFloat v52 = (char *)v51;
          }
          CGFloat v51 = (void *)*v55;
        }
        while (*v55);
        if (v52 == v47 || *((void *)v52 + 4) > 3uLL || (unint64_t v56 = *((void *)v52 + 5), v56 > 8)) {
LABEL_64:
        }
          double v57 = 0.0;
        else {
          double v57 = dbl_1DD8CEC20[v56];
        }
        uint64_t v130 = *(void *)(*((void *)a3 + 11)
                         + (((unint64_t)(*((void *)a3 + 14) + 3) >> 5) & 0x7FFFFFFFFFFFFF8))
             + 16 * (*((unsigned char *)a3 + 112) + 3);
        unint64_t v131 = *(void *)&v57 * v46;
        double v132 = v57;
        uint64_t v133 = 1;
        std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&v128, (uint64_t)&v130);
        vImagePixelCount v122 = [(CRNMS *)self getTextFeatureFromQuadAngleDatum:&v128];
        BOOL v58 = objc_opt_new();
        BOOL v59 = (unsigned __int16 *)(*(void *)(*v50 + (((*v49 + v46) >> 7) & 0x1FFFFFFFFFFFFF8))
                                 + 4 * ((*v49 + v46) & 0x3FF));
        unint64_t v60 = *v59;
        if (v60 <= v59[1])
        {
          do
          {
            v61 = *(void **)v47;
            if (!*(void *)v47) {
              goto LABEL_79;
            }
            v62 = (char *)a3 + 184;
            do
            {
              unint64_t v63 = v61[4];
              BOOL v64 = v63 >= 4;
              if (v63 >= 4) {
                double v65 = v61;
              }
              else {
                double v65 = v61 + 1;
              }
              if (v64) {
                v62 = (char *)v61;
              }
              v61 = (void *)*v65;
            }
            while (*v65);
            if (v62 == v47 || *((void *)v62 + 4) > 4uLL || (unint64_t v66 = *((void *)v62 + 5), v66 > 8)) {
LABEL_79:
            }
              double v67 = 0.0;
            else {
              double v67 = dbl_1DD8CEC20[v66];
            }
            uint64_t v130 = *(void *)(*((void *)a3 + 11)
                             + (((unint64_t)(*((void *)a3 + 14) + 4) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (*((unsigned char *)a3 + 112) + 4);
            unint64_t v131 = *(void *)&v67 * v60;
            double v132 = v67;
            uint64_t v133 = 1;
            std::__val_expr<std::__slice_expr<std::valarray<double> const&>>::operator std::valarray<double>(&__p, (uint64_t)&v130);
            v68 = [(CRNMS *)self getTextFeatureFromQuadAngleDatum:&__p];
            [v58 addObject:v68];

            if (__p)
            {
              if (v127 != __p) {
                v127 += ((unsigned char *)__p - v127 + 7) & 0xFFFFFFFFFFFFFFF8;
              }
              operator delete(__p);
            }
            BOOL v25 = v60++ >= *(unsigned __int16 *)(*(void *)(*v50 + (((*v49 + v46) >> 7) & 0x1FFFFFFFFFFFFF8))
                                               + 4 * ((*v49 + v46) & 0x3FF)
                                               + 2);
          }
          while (!v25);
        }
        [v122 setSubFeatures:v58];
        [v114 addObject:v122];

        if (v128)
        {
          if (v129 != v128) {
            v129 += ((unsigned char *)v128 - v129 + 7) & 0xFFFFFFFFFFFFFFF8;
          }
          operator delete(v128);
        }
        ++v46;
      }
      while (v46 < *v119);
    }
  }

  return v114;
}

- (void)fillRectForestDatum:(void *)a3 asDimType:(unint64_t)a4 withCGRect:(const CGRect *)a5
{
  double v16 = 0;
  uint64_t v17 = 0;
  std::valarray<double>::resize((uint64_t)&v16, 4uLL, 0.0);
  if (a4 == 5) {
    std::valarray<double>::resize((uint64_t)&v16, 5uLL, 0.0);
  }
  unint64_t v8 = v16;
  uint64_t v9 = v17;
  *double v16 = a5->origin.x;
  v8[1] = a5->origin.y;
  v8[2] = a5->size.width;
  v8[3] = a5->size.height;
  uint64_t v10 = v9 - (void)v8;
  if (v10)
  {
    unint64_t v11 = v10 >> 3;
    unint64_t v12 = *(void **)a3;
    if (v11 <= 1) {
      unint64_t v11 = 1;
    }
    uint64_t v13 = 8 * *((void *)a3 + 2);
    unint64_t v14 = v8;
    do
    {
      uint64_t v15 = *(void *)v14++;
      *unint64_t v12 = v15;
      unint64_t v12 = (void *)((char *)v12 + v13);
      --v11;
    }
    while (v11);
  }
  operator delete(v8);
}

- (void)fillRectForestDatum:(void *)a3 asDimType:(unint64_t)a4 withQuad:(const void *)a5 andDimType:(unint64_t)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  unint64_t v27 = 0;
  if (a4)
  {
    if (a4 != 5) {
      return;
    }
    std::valarray<double>::resize((uint64_t)&v26, 5uLL, 0.0);
    if (a6 == 8 || a6 == 6) {
      v26[4] = *(void *)(*(void *)a5 + 64);
    }
  }
  else
  {
    std::valarray<double>::resize((uint64_t)&v26, 4uLL, 0.0);
  }
  float64x2_t v9 = *(float64x2_t *)*(void *)a5;
  float64x2_t v10 = *(float64x2_t *)(*(void *)a5 + 16);
  float64x2_t v11 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v9, v10), (int8x16_t)v10, (int8x16_t)v9);
  float64x2_t v12 = *(float64x2_t *)(*(void *)a5 + 32);
  float64x2_t v13 = *(float64x2_t *)(*(void *)a5 + 48);
  float64x2_t v14 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v11, v12), (int8x16_t)v12, (int8x16_t)v11);
  float64x2_t v15 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v10, v9), (int8x16_t)v10, (int8x16_t)v9);
  float64x2_t v16 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v12, v15), (int8x16_t)v12, (int8x16_t)v15);
  v28[0] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v14, v13), (int8x16_t)v13, (int8x16_t)v14);
  v28[1] = vsubq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v13, v16), (int8x16_t)v13, (int8x16_t)v16), v28[0]);
  std::valarray<double>::valarray(&__p, (uint64_t *)v28, 4uLL);
  uint64_t v17 = (char *)__p;
  unint64_t v18 = v26;
  uint64_t *v26 = *(void *)__p;
  v18[1] = *((void *)v17 + 1);
  v18[2] = *((void *)v17 + 2);
  v18[3] = *((void *)v17 + 3);
  if (v25 != v17) {
    v25 += (v17 - v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  }
  operator delete(v17);
  if (v27 != v18)
  {
    unint64_t v19 = v27 - v18;
    uint64_t v20 = *(void **)a3;
    if (v19 <= 1) {
      unint64_t v19 = 1;
    }
    uint64_t v21 = 8 * *((void *)a3 + 2);
    double v22 = v18;
    do
    {
      uint64_t v23 = *v22++;
      *uint64_t v20 = v23;
      uint64_t v20 = (void *)((char *)v20 + v21);
      --v19;
    }
    while (v19);
  }
  operator delete(v18);
}

- (void)fillRectForestDatum:(void *)a3 asDimType:(unint64_t)a4 withCRTextDetectorQuad:(const void *)a5 andInputSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  __p = 0;
  unint64_t v18 = 0;
  if (a4 == 2)
  {
    std::valarray<double>::resize((uint64_t)&__p, 8uLL, 0.0);
    float64x2_t v10 = (double *)__p;
  }
  else
  {
    if (a4 == 6)
    {
      std::valarray<double>::resize((uint64_t)&__p, 9uLL, 0.0);
      float64x2_t v10 = (double *)__p;
    }
    else
    {
      if (a4 != 8) {
        return;
      }
      std::valarray<double>::resize((uint64_t)&__p, 0xEuLL, 0.0);
      float64x2_t v10 = (double *)__p;
      *((void *)__p + 9) = *((void *)a5 + 13);
      double v11 = 1.0;
      if (!*((unsigned char *)a5 + 136)) {
        double v11 = 0.0;
      }
      v10[10] = v11;
      v10[11] = *((double *)a5 + 15);
      v10[12] = *((double *)a5 + 16);
      v10[13] = (double)*((int *)a5 + 35);
    }
    v10[8] = *((double *)a5 + 14);
  }
  *float64x2_t v10 = *(double *)a5 / width;
  v10[1] = *((double *)a5 + 1) / height;
  v10[2] = *((double *)a5 + 2) / width;
  v10[3] = *((double *)a5 + 3) / height;
  v10[4] = *((double *)a5 + 4) / width;
  v10[5] = *((double *)a5 + 5) / height;
  v10[6] = *((double *)a5 + 6) / width;
  v10[7] = *((double *)a5 + 7) / height;
  if (v18 != v10)
  {
    unint64_t v12 = v18 - v10;
    float64x2_t v13 = *(void **)a3;
    if (v12 <= 1) {
      unint64_t v12 = 1;
    }
    uint64_t v14 = 8 * *((void *)a3 + 2);
    float64x2_t v15 = v10;
    do
    {
      uint64_t v16 = *(void *)v15++;
      void *v13 = v16;
      float64x2_t v13 = (void *)((char *)v13 + v14);
      --v12;
    }
    while (v12);
  }
  operator delete(v10);
}

- (void).cxx_destruct
{
  std::deque<nms::RectForest<unsigned short,double>>::~deque[abi:ne180100]((uint64_t)&self->_postNMSForests);
  nms::PyramidNMS<unsigned short,double,unsigned char>::~PyramidNMS(&self->_pyrNMS._vptr$PyramidNMS);
  std::deque<nms::RectForest<unsigned short,double>>::~deque[abi:ne180100]((uint64_t)&self->_preNMSForests);
}

- (id).cxx_construct
{
  *(_OWORD *)&self->_preNMSForests.__start_ = 0u;
  *(_OWORD *)&self->_preNMSForests.__map_.__end_ = 0u;
  *(_OWORD *)&self->_preNMSForests.__map_.__first_ = 0u;
  nms::PyramidNMS<unsigned short,double,unsigned char>::PyramidNMS(&self->_pyrNMS._vptr$PyramidNMS);
  *(_OWORD *)&self->_postNMSForests.__map_.__end_ = 0u;
  *(_OWORD *)&self->_postNMSForests.__start_ = 0u;
  *(_OWORD *)&self->_postNMSForests.__map_.__first_ = 0u;
  return self;
}

@end