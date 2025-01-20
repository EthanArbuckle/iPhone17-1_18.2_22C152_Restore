@interface VisionCoreValueConfidenceCurve
+ (BOOL)supportsSecureCoding;
+ (VisionCoreValueConfidenceCurve)curveWithValues:(const float *)a3 confidences:(const float *)a4 count:(unint64_t)a5 error:(id *)a6;
+ (VisionCoreValueConfidenceCurve)curveWithValuesArray:(id)a3 confidencesArray:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (VisionCoreValueConfidenceCurve)initWithCoder:(id)a3;
- (float)_finalizeInitialization;
- (float)confidenceForValue:(float)a3;
- (float)maximumConfidence;
- (float)maximumValue;
- (float)minimumConfidence;
- (float)minimumValue;
- (float)valueForConfidence:(float)a3;
- (id).cxx_construct;
- (id)description;
- (uint64_t)_addValue:(float)a3 confidence:atIndex:error:;
- (uint64_t)_prepareForCount:(void *)a3 error:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreValueConfidenceCurve

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_increasingValuePoints.__begin_;
  if (begin)
  {
    self->_increasingValuePoints.__end_ = begin;
    operator delete(begin);
  }
}

- (VisionCoreValueConfidenceCurve)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!self) {
    goto LABEL_102;
  }
  v97.receiver = self;
  v97.super_class = (Class)VisionCoreValueConfidenceCurve;
  self = [(VisionCoreValueConfidenceCurve *)&v97 init];
  if (!self) {
    goto LABEL_102;
  }
  if (![v4 containsValueForKey:@"v.v"])
  {
    if ([v4 containsValueForKey:@"0.1"])
    {
      id v11 = v4;
      v12 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"0.1"];
      v13 = v12;
      if (v12)
      {
        unint64_t v14 = [v12 length];
        unint64_t v15 = v14 - 4;
        if (v14 <= 4)
        {
LABEL_10:
          v16 = [MEMORY[0x263F087E8] VisionCoreErrorForCorruptedResourceWithLocalizedDescription:@"missing value/confidence data"];
          [v11 failWithError:v16];
LABEL_99:

          goto LABEL_100;
        }
        unint64_t v21 = v15 / 5;
        if (-5 * (v15 / 5) == 4 - v14)
        {
          id v22 = v13;
          v90 = v13;
          v92 = v11;
          v23 = (const Bytef *)[v22 bytes];
          uLong v24 = adler32(0, 0, 0);
          int v25 = adler32(v24, v23, v15);
          p_increasingValuePoints = &self->_increasingValuePoints;
          std::vector<VisionCoreValueConfidencePoint>::reserve((void **)&self->_increasingValuePoints.__begin_, v15 / 5);
          id v94 = v22;
          int v95 = v25;
          v27 = (unsigned int *)&v23[4 * v21];
          if (v15 >= 5)
          {
            uint64_t v28 = 0;
            if (v21 <= 1) {
              unint64_t v21 = 1;
            }
            end = self->_increasingValuePoints.__end_;
            do
            {
              unsigned int v31 = *(_DWORD *)v23;
              v23 += 4;
              unsigned int v30 = v31;
              unsigned int v32 = *(unsigned __int8 *)v27;
              v27 = (unsigned int *)((char *)v27 + 1);
              unsigned int v33 = bswap32(v30);
              float v34 = (float)v32 / 10.0;
              value = self->_increasingValuePoints.__end_cap_.__value_;
              if (end >= value)
              {
                begin = p_increasingValuePoints->__begin_;
                uint64_t v37 = (end - p_increasingValuePoints->__begin_) >> 3;
                unint64_t v38 = v37 + 1;
                if ((unint64_t)(v37 + 1) >> 61) {
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v39 = value - begin;
                if (v39 >> 2 > v38) {
                  unint64_t v38 = v39 >> 2;
                }
                BOOL v40 = (unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8;
                unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
                if (!v40) {
                  unint64_t v41 = v38;
                }
                if (v41)
                {
                  unint64_t v41 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v41);
                  begin = self->_increasingValuePoints.__begin_;
                  end = self->_increasingValuePoints.__end_;
                }
                else
                {
                  uint64_t v42 = 0;
                }
                unint64_t v43 = v41 + 8 * v37;
                *(float *)unint64_t v43 = v34;
                *(_DWORD *)(v43 + 4) = v33;
                v44 = (VisionCoreValueConfidencePoint *)v43;
                if (end != begin)
                {
                  do
                  {
                    uint64_t v45 = *((void *)end - 1);
                    end = (VisionCoreValueConfidencePoint *)((char *)end - 8);
                    *((void *)v44 - 1) = v45;
                    v44 = (VisionCoreValueConfidencePoint *)((char *)v44 - 8);
                  }
                  while (end != begin);
                  begin = p_increasingValuePoints->__begin_;
                }
                end = (VisionCoreValueConfidencePoint *)(v43 + 8);
                self->_increasingValuePoints.__begin_ = v44;
                self->_increasingValuePoints.__end_ = (VisionCoreValueConfidencePoint *)(v43 + 8);
                self->_increasingValuePoints.__end_cap_.__value_ = (VisionCoreValueConfidencePoint *)(v41 + 8 * v42);
                if (begin) {
                  operator delete(begin);
                }
              }
              else
              {
                *(float *)end = v34;
                *((_DWORD *)end + 1) = v33;
                end = (VisionCoreValueConfidencePoint *)((char *)end + 8);
              }
              self->_increasingValuePoints.__end_ = end;
              ++v28;
            }
            while (v28 != v21);
          }
          if (bswap32(*v27) == v95)
          {
            int v46 = 2;
            goto LABEL_94;
          }
          v16 = [MEMORY[0x263F087E8] VisionCoreErrorForCorruptedResourceWithLocalizedDescription:@"corrupted value/confidence data"];
          v13 = v90;
          id v11 = v92;
          [v92 failWithError:v16];
          goto LABEL_99;
        }
LABEL_45:
        v16 = [MEMORY[0x263F087E8] VisionCoreErrorForCorruptedResourceWithLocalizedDescription:@"unbalanced value/confidence data"];
        [v11 failWithError:v16];
        goto LABEL_99;
      }
    }
    else
    {
      if (![v4 containsValueForKey:@"pts"])
      {
        id v11 = [MEMORY[0x263F087E8] VisionCoreErrorForCorruptedResourceWithLocalizedDescription:@"missing curve data"];
        [v4 failWithError:v11];
LABEL_101:

        goto LABEL_102;
      }
      id v11 = v4;
      v17 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"pts"];
      v13 = v17;
      if (v17)
      {
        unint64_t v18 = [v17 length];
        unint64_t v19 = v18 - 4;
        if (v18 <= 4) {
          goto LABEL_10;
        }
        if ((v19 & 7) == 0)
        {
          id v67 = v13;
          v68 = (const Bytef *)[v67 bytes];
          uLong v69 = adler32(0, 0, 0);
          int v70 = adler32(v69, v68, v19);
          v71 = &self->_increasingValuePoints;
          std::vector<VisionCoreValueConfidencePoint>::reserve((void **)&self->_increasingValuePoints.__begin_, v19 >> 3);
          id v94 = v67;
          if (v19 >= 8)
          {
            uint64_t v72 = 0;
            if (v19 >> 3 <= 1) {
              uint64_t v73 = 1;
            }
            else {
              uint64_t v73 = v19 >> 3;
            }
            v74 = self->_increasingValuePoints.__end_;
            do
            {
              int8x8_t v75 = *(int8x8_t *)v68;
              v68 += 8;
              int8x8_t v76 = vrev32_s8(v75);
              v77 = self->_increasingValuePoints.__end_cap_.__value_;
              if (v74 >= v77)
              {
                v79 = v71->__begin_;
                uint64_t v80 = (v74 - v71->__begin_) >> 3;
                unint64_t v81 = v80 + 1;
                if ((unint64_t)(v80 + 1) >> 61) {
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v82 = v77 - v79;
                if (v82 >> 2 > v81) {
                  unint64_t v81 = v82 >> 2;
                }
                if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v83 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v83 = v81;
                }
                if (v83)
                {
                  unint64_t v83 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v83);
                  v79 = self->_increasingValuePoints.__begin_;
                  v74 = self->_increasingValuePoints.__end_;
                }
                else
                {
                  uint64_t v84 = 0;
                }
                v85 = (VisionCoreValueConfidencePoint *)(v83 + 8 * v80);
                *(int8x8_t *)v85 = v76;
                v78 = (VisionCoreValueConfidencePoint *)((char *)v85 + 8);
                if (v74 != v79)
                {
                  do
                  {
                    uint64_t v86 = *((void *)v74 - 1);
                    v74 = (VisionCoreValueConfidencePoint *)((char *)v74 - 8);
                    *((void *)v85 - 1) = v86;
                    v85 = (VisionCoreValueConfidencePoint *)((char *)v85 - 8);
                  }
                  while (v74 != v79);
                  v79 = v71->__begin_;
                }
                self->_increasingValuePoints.__begin_ = v85;
                self->_increasingValuePoints.__end_ = v78;
                self->_increasingValuePoints.__end_cap_.__value_ = (VisionCoreValueConfidencePoint *)(v83 + 8 * v84);
                if (v79) {
                  operator delete(v79);
                }
              }
              else
              {
                *(int8x8_t *)v74 = v76;
                v78 = (VisionCoreValueConfidencePoint *)((char *)v74 + 8);
              }
              self->_increasingValuePoints.__end_ = v78;
              ++v72;
              v74 = v78;
            }
            while (v72 != v73);
          }
          if (bswap32(*(_DWORD *)v68) == v70)
          {
            int v46 = 1;
            goto LABEL_94;
          }
          v16 = [MEMORY[0x263F087E8] VisionCoreErrorForCorruptedResourceWithLocalizedDescription:@"corrupted value/confidence data"];
          [v11 failWithError:v16];
          goto LABEL_99;
        }
        goto LABEL_45;
      }
    }
LABEL_100:

    goto LABEL_101;
  }
  id v5 = v4;
  v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"v.v"];
  v7 = v6;
  if (!v6)
  {
LABEL_97:

LABEL_102:
    v87 = 0;
    goto LABEL_103;
  }
  unint64_t v8 = [v6 length];
  int v9 = v8;
  if (v8 <= 3 || (v8 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v10 = [MEMORY[0x263F087E8] VisionCoreErrorForCorruptedResourceWithLocalizedDescription:@"missing value/confidence data"];
    [v5 failWithError:v10];
LABEL_96:

    goto LABEL_97;
  }
  unint64_t v20 = v8 - 5;
  if (((v8 - 5) & 3) != 0)
  {
    v10 = [MEMORY[0x263F087E8] VisionCoreErrorForCorruptedResourceWithLocalizedDescription:@"unbalanced value/confidence data"];
    [v5 failWithError:v10];
    goto LABEL_96;
  }
  id v94 = v7;
  v89 = v5;
  v47 = (const Bytef *)[v94 bytes];
  uLong v48 = adler32(0, 0, 0);
  v91 = &v47[v20];
  int v93 = adler32(v48, v47, v9 - 4);
  uint64_t v49 = v47[v20];
  v96 = &self->_increasingValuePoints;
  std::vector<VisionCoreValueConfidencePoint>::reserve((void **)&self->_increasingValuePoints.__begin_, v20 >> 2);
  if (v20 >= 4)
  {
    uint64_t v50 = 0;
    if (v20 >> 2 <= 1) {
      uint64_t v51 = 1;
    }
    else {
      uint64_t v51 = v20 >> 2;
    }
    v52 = self->_increasingValuePoints.__end_;
    do
    {
      float v53 = (float)(unint64_t)(v50 + v49) / 10.0;
      unsigned int v54 = *(_DWORD *)v47;
      v47 += 4;
      unsigned int v55 = bswap32(v54);
      v56 = self->_increasingValuePoints.__end_cap_.__value_;
      if (v52 >= v56)
      {
        uint64_t v57 = v49;
        v58 = v96->__begin_;
        uint64_t v59 = (v52 - v96->__begin_) >> 3;
        unint64_t v60 = v59 + 1;
        if ((unint64_t)(v59 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v61 = v56 - v58;
        if (v61 >> 2 > v60) {
          unint64_t v60 = v61 >> 2;
        }
        BOOL v40 = (unint64_t)v61 >= 0x7FFFFFFFFFFFFFF8;
        unint64_t v62 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v40) {
          unint64_t v62 = v60;
        }
        if (v62)
        {
          unint64_t v62 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v62);
          v58 = self->_increasingValuePoints.__begin_;
          v52 = self->_increasingValuePoints.__end_;
        }
        else
        {
          uint64_t v63 = 0;
        }
        unint64_t v64 = v62 + 8 * v59;
        *(float *)unint64_t v64 = v53;
        *(_DWORD *)(v64 + 4) = v55;
        v65 = (VisionCoreValueConfidencePoint *)v64;
        uint64_t v49 = v57;
        if (v52 != v58)
        {
          do
          {
            uint64_t v66 = *((void *)v52 - 1);
            v52 = (VisionCoreValueConfidencePoint *)((char *)v52 - 8);
            *((void *)v65 - 1) = v66;
            v65 = (VisionCoreValueConfidencePoint *)((char *)v65 - 8);
          }
          while (v52 != v58);
          v58 = v96->__begin_;
        }
        v52 = (VisionCoreValueConfidencePoint *)(v64 + 8);
        self->_increasingValuePoints.__begin_ = v65;
        self->_increasingValuePoints.__end_ = (VisionCoreValueConfidencePoint *)(v64 + 8);
        self->_increasingValuePoints.__end_cap_.__value_ = (VisionCoreValueConfidencePoint *)(v62 + 8 * v63);
        if (v58) {
          operator delete(v58);
        }
      }
      else
      {
        *(float *)v52 = v53;
        *((_DWORD *)v52 + 1) = v55;
        v52 = (VisionCoreValueConfidencePoint *)((char *)v52 + 8);
      }
      self->_increasingValuePoints.__end_ = v52;
      ++v50;
    }
    while (v50 != v51);
  }
  if (bswap32(*(_DWORD *)(v91 + 1)) != v93)
  {
    v10 = [MEMORY[0x263F087E8] VisionCoreErrorForCorruptedResourceWithLocalizedDescription:@"corrupted value/confidence data"];
    id v5 = v89;
    [v89 failWithError:v10];
    goto LABEL_96;
  }
  int v46 = 3;
LABEL_94:
  self->_resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = v46;

  self->_confidencesAreIncreasing = *((float *)self->_increasingValuePoints.__begin_ + 1) < *((float *)self->_increasingValuePoints.__end_
                                                                                            - 1);
  self = self;
  v87 = self;
LABEL_103:

  return v87;
}

- (void)encodeWithCoder:(id)a3
{
  id v45 = a3;
  if (self)
  {
    int resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = self->_resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS;
    if (!resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS)
    {
      begin = (float *)self->_increasingValuePoints.__begin_;
      end = self->_increasingValuePoints.__end_;
      if (begin == (float *)end)
      {
LABEL_18:
        int resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = 3;
      }
      else
      {
        int v7 = 0;
        char v8 = 1;
        do
        {
          int v9 = _tenthsForValue(*begin);
          if (v9 == 0 || (v8 & 1) == 0)
          {
            if (!v9)
            {
              int resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = 1;
              goto LABEL_21;
            }
          }
          else
          {
            BOOL v10 = v7 + 1 == v9;
            if (v7 + 1 == v9) {
              int v11 = v9;
            }
            else {
              int v11 = v7;
            }
            BOOL v12 = v7 == 0;
            if ((_BYTE)v7) {
              int v7 = v11;
            }
            else {
              int v7 = v9;
            }
            char v8 = v12 || v10;
          }
          begin += 2;
        }
        while (begin != (float *)end);
        if (v8) {
          goto LABEL_18;
        }
        int resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = 2;
      }
LABEL_21:
      self->_int resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS = resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS;
    }
    if (resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS == 2)
    {
      id v23 = v45;
      int64_t v24 = self->_increasingValuePoints.__end_ - self->_increasingValuePoints.__begin_;
      uint64_t v25 = (v24 >> 1) + (v24 >> 3);
      id v15 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v25 + 4];
      uint64_t v26 = [v15 mutableBytes];
      v27 = (const Bytef *)v26;
      uint64_t v28 = (_DWORD *)(v26 + (v24 >> 1));
      unsigned int v30 = self->_increasingValuePoints.__begin_;
      v29 = self->_increasingValuePoints.__end_;
      if (v30 != v29)
      {
        unsigned int v31 = (_DWORD *)v26;
        do
        {
          *v31++ = bswap32(*((_DWORD *)v30 + 1));
          *(unsigned char *)uint64_t v28 = _tenthsForValue(*(float *)v30);
          uint64_t v28 = (_DWORD *)((char *)v28 + 1);
          unsigned int v30 = (VisionCoreValueConfidencePoint *)((char *)v30 + 8);
        }
        while (v30 != v29);
      }
      uLong v32 = adler32(0, 0, 0);
      *uint64_t v28 = bswap32(adler32(v32, v27, v25));
      [v23 VisionCoreEncodeNSData:v15 forKey:@"0.1"];
    }
    else if (resolvedPointsDistribution_DO_NOT_DIRECTLY_ACCESS == 3)
    {
      id v13 = v45;
      int64_t v14 = self->_increasingValuePoints.__end_ - self->_increasingValuePoints.__begin_;
      id v15 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:(v14 >> 1) + 5];
      uint64_t v16 = [v15 mutableBytes];
      v17 = (const Bytef *)v16;
      unint64_t v18 = self->_increasingValuePoints.__begin_;
      unint64_t v19 = self->_increasingValuePoints.__end_;
      unint64_t v20 = (_DWORD *)v16;
      if (v18 != v19)
      {
        unint64_t v20 = (_DWORD *)v16;
        do
        {
          *v20++ = bswap32(*((_DWORD *)v18 + 1));
          unint64_t v18 = (VisionCoreValueConfidencePoint *)((char *)v18 + 8);
        }
        while (v18 != v19);
      }
      [(VisionCoreValueConfidenceCurve *)self minimumValue];
      *(unsigned char *)unint64_t v20 = _tenthsForValue(v21);
      uLong v22 = adler32(0, 0, 0);
      *(_DWORD *)((char *)v20 + 1) = bswap32(adler32(v22, v17, ((unint64_t)v14 >> 1) | 1));
      [v13 VisionCoreEncodeNSData:v15 forKey:@"v.v"];
    }
    else
    {
      id v33 = v45;
      v35 = self->_increasingValuePoints.__begin_;
      float v34 = self->_increasingValuePoints.__end_;
      uint64_t v36 = v34 - v35;
      id v15 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:(v34 - v35) | 4];
      uint64_t v37 = [v15 mutableBytes];
      unint64_t v38 = (const Bytef *)v37;
      uint64_t v39 = (int8x8_t *)v37;
      if (v34 != v35)
      {
        uint64_t v40 = v36 >> 3;
        unint64_t v41 = self->_increasingValuePoints.__begin_;
        if ((unint64_t)(v36 >> 3) <= 1) {
          uint64_t v40 = 1;
        }
        uint64_t v39 = (int8x8_t *)v37;
        do
        {
          int8x8_t v42 = *(int8x8_t *)v41;
          unint64_t v41 = (VisionCoreValueConfidencePoint *)((char *)v41 + 8);
          *v39++ = vrev32_s8(v42);
          --v40;
        }
        while (v40);
      }
      uLong v43 = adler32(0, 0, 0);
      v39->i32[0] = bswap32(adler32(v43, v38, (int)v34 - (int)v35));
      [v33 VisionCoreEncodeNSData:v15 forKey:@"pts"];
    }
  }
  else
  {
    id v44 = v45;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreValueConfidenceCurve *)a3;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (self->_confidencesAreIncreasing == v5->_confidencesAreIncreasing
        && (begin = self->_increasingValuePoints.__begin_,
            end = self->_increasingValuePoints.__end_,
            char v8 = (float *)v5->_increasingValuePoints.__begin_,
            end - begin == v5->_increasingValuePoints.__end_ - (VisionCoreValueConfidencePoint *)v8))
      {
        if (begin == end)
        {
          LOBYTE(v13) = 1;
        }
        else
        {
          do
          {
            float v9 = *(float *)begin;
            float v10 = *((float *)begin + 1);
            begin = (VisionCoreValueConfidencePoint *)((char *)begin + 8);
            float v11 = *v8;
            float v12 = v8[1];
            v8 += 2;
            BOOL v13 = v10 == v12 && v9 == v11;
          }
          while (v13 && begin != end);
        }
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (id)description
{
  int64_t v3 = self->_increasingValuePoints.__end_ - self->_increasingValuePoints.__begin_;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:4 * ((v3 >> 1) + (v3 >> 3))];
  begin = self->_increasingValuePoints.__begin_;
  end = self->_increasingValuePoints.__end_;
  if (begin != end)
  {
    char v7 = 0;
    do
    {
      if (v7) {
        [v4 appendString:@" "];
      }
      [v4 appendFormat:@"(%g, %g)", *(float *)begin, *((float *)begin + 1)];
      begin = (VisionCoreValueConfidencePoint *)((char *)begin + 8);
      char v7 = 1;
    }
    while (begin != end);
  }
  return v4;
}

- (float)confidenceForValue:(float)a3
{
  begin = self->_increasingValuePoints.__begin_;
  if (*(float *)begin >= a3) {
    return *((float *)begin + 1);
  }
  uint64_t v4 = self->_increasingValuePoints.__end_ - begin;
  uint64_t v5 = v4 >> 3;
  if ((unint64_t)v4 < 9) {
    return *((float *)begin + 2 * v5 - 1);
  }
  v6 = (float *)((char *)begin + 8);
  uint64_t v7 = 1;
  while (*v6 <= a3)
  {
    if (*v6 == a3) {
      return *((float *)begin + 2 * v7 + 1);
    }
    ++v7;
    v6 += 2;
    if (v5 == v7) {
      return *((float *)begin + 2 * v5 - 1);
    }
  }
  float v9 = (float *)((char *)begin + 8 * v7);
  float v10 = *(v9 - 2);
  float v11 = *v6 - v10;
  if (v11 == 0.0) {
    float v12 = 0.5;
  }
  else {
    float v12 = (float)(a3 - v10) / v11;
  }
  if (self->_confidencesAreIncreasing)
  {
    BOOL v13 = (char *)(v9 - 2);
  }
  else
  {
    float v12 = 1.0 - v12;
    BOOL v13 = (char *)v9;
  }
  float v14 = *((float *)v13 + 1);
  if (self->_confidencesAreIncreasing) {
    id v15 = (char *)v9;
  }
  else {
    id v15 = (char *)(v9 - 2);
  }
  return v14 + (float)(v12 * (float)(*((float *)v15 + 1) - v14));
}

- (float)valueForConfidence:(float)a3
{
  begin = self->_increasingValuePoints.__begin_;
  uint64_t v4 = self->_increasingValuePoints.__end_ - begin;
  uint64_t v5 = v4 >> 3;
  float v6 = *((float *)begin + 1);
  if (!self->_confidencesAreIncreasing)
  {
    if (v6 > a3)
    {
      if ((unint64_t)v4 >= 9)
      {
        float v9 = (float *)((char *)begin + 12);
        uint64_t v8 = 1;
        while (1)
        {
          float v10 = *v9;
          if (*v9 < a3) {
            break;
          }
          if (*v9 == a3) {
            return *((float *)begin + 2 * v8);
          }
          ++v8;
          v9 += 2;
          if (v5 == v8) {
            return *((float *)begin + 2 * v5 - 2);
          }
        }
        float v12 = (float *)((char *)begin + 8 * v8);
        BOOL v13 = v12 - 2;
        float v17 = *(v12 - 1) - v10;
        if (v17 == 0.0) {
          float v18 = 0.5;
        }
        else {
          float v18 = (float)(a3 - v10) / v17;
        }
        float v16 = 1.0 - v18;
        return *v13 + (float)(v16 * (float)(*v12 - *v13));
      }
      return *((float *)begin + 2 * v5 - 2);
    }
    return *(float *)begin;
  }
  if (v6 >= a3) {
    return *(float *)begin;
  }
  if ((unint64_t)v4 < 9) {
    return *((float *)begin + 2 * v5 - 2);
  }
  uint64_t v7 = (float *)((char *)begin + 12);
  uint64_t v8 = 1;
  while (*v7 <= a3)
  {
    if (*v7 == a3) {
      return *((float *)begin + 2 * v8);
    }
    ++v8;
    v7 += 2;
    if (v5 == v8) {
      return *((float *)begin + 2 * v5 - 2);
    }
  }
  float v12 = (float *)((char *)begin + 8 * v8);
  BOOL v13 = v12 - 2;
  float v14 = *(v12 - 1);
  float v15 = *v7 - v14;
  if (v15 == 0.0) {
    float v16 = 0.5;
  }
  else {
    float v16 = (float)(a3 - v14) / v15;
  }
  return *v13 + (float)(v16 * (float)(*v12 - *v13));
}

- (float)maximumConfidence
{
  if (self && self->_confidencesAreIncreasing) {
    int64_t v2 = ((self->_increasingValuePoints.__end_ - self->_increasingValuePoints.__begin_) >> 3) - 1;
  }
  else {
    int64_t v2 = 0;
  }
  return *((float *)self->_increasingValuePoints.__begin_ + 2 * v2 + 1);
}

- (float)minimumConfidence
{
  if (self && !self->_confidencesAreIncreasing) {
    int64_t v2 = ((self->_increasingValuePoints.__end_ - self->_increasingValuePoints.__begin_) >> 3) - 1;
  }
  else {
    int64_t v2 = 0;
  }
  return *((float *)self->_increasingValuePoints.__begin_ + 2 * v2 + 1);
}

- (float)maximumValue
{
  if (self)
  {
    begin = self->_increasingValuePoints.__begin_;
    uint64_t v3 = ((self->_increasingValuePoints.__end_ - begin) >> 3) - 1;
  }
  else
  {
    uint64_t v3 = 0;
    begin = (VisionCoreValueConfidencePoint *)MEMORY[8];
  }
  return *((float *)begin + 2 * v3);
}

- (float)minimumValue
{
  return *(float *)self->_increasingValuePoints.__begin_;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (VisionCoreValueConfidenceCurve)curveWithValuesArray:(id)a3 confidencesArray:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [v8 count];
  uint64_t v11 = [v9 count];
  if (v10 == v11)
  {
    id v12 = objc_alloc((Class)a1);
    if (v12)
    {
      v23.receiver = v12;
      v23.super_class = (Class)VisionCoreValueConfidenceCurve;
      BOOL v13 = objc_msgSendSuper2(&v23, sel_init);
    }
    else
    {
      BOOL v13 = 0;
    }
    if (-[VisionCoreValueConfidenceCurve _prepareForCount:error:]((uint64_t)v13, v10, a5))
    {
      if (!v10)
      {
LABEL_9:
        -[VisionCoreValueConfidenceCurve _finalizeInitialization](v13);
        a5 = v13;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v14 = 0;
      while (1)
      {
        float v15 = [v8 objectAtIndexedSubscript:v14];
        [v15 floatValue];
        float v17 = v16;
        float v18 = [v9 objectAtIndexedSubscript:v14];
        [v18 floatValue];
        char v20 = -[VisionCoreValueConfidenceCurve _addValue:confidence:atIndex:error:]((uint64_t)v13, v17, v19);

        if ((v20 & 1) == 0) {
          break;
        }
        if (v10 == ++v14) {
          goto LABEL_9;
        }
      }
    }
    a5 = 0;
    goto LABEL_13;
  }
  if (a5)
  {
    float v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Cannot create a curve from %lu values and %lu confidences", v10, v11);
    *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v21];

    a5 = 0;
  }
LABEL_14:

  return (VisionCoreValueConfidenceCurve *)a5;
}

- (uint64_t)_prepareForCount:(void *)a3 error:
{
  if (result)
  {
    if (a2)
    {
      std::vector<VisionCoreValueConfidencePoint>::reserve((void **)(result + 8), a2);
      return 1;
    }
    else if (a3)
    {
      id v4 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidOperationWithLocalizedDescription:@"value/confidence curve must have at least one data point"];
      result = 0;
      *a3 = v4;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_addValue:(float)a3 confidence:atIndex:error:
{
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v7 = *(float **)(result + 16);
    unint64_t v6 = *(void *)(result + 24);
    if ((unint64_t)v7 >= v6)
    {
      id v9 = *(float **)(result + 8);
      uint64_t v10 = ((char *)v7 - (char *)v9) >> 3;
      unint64_t v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v6 - (void)v9;
      if (v12 >> 2 > v11) {
        unint64_t v11 = v12 >> 2;
      }
      BOOL v13 = (unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v13) {
        unint64_t v14 = v11;
      }
      if (v14)
      {
        unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v14);
        id v9 = (float *)v5[1];
        uint64_t v7 = (float *)v5[2];
      }
      else
      {
        uint64_t v15 = 0;
      }
      float v16 = (float *)(v14 + 8 * v10);
      unint64_t v17 = v14 + 8 * v15;
      float *v16 = a2;
      v16[1] = a3;
      id v8 = v16 + 2;
      if (v7 != v9)
      {
        do
        {
          uint64_t v18 = *((void *)v7 - 1);
          v7 -= 2;
          *((void *)v16 - 1) = v18;
          v16 -= 2;
        }
        while (v7 != v9);
        id v9 = (float *)v5[1];
      }
      v5[1] = v16;
      v5[2] = v8;
      v5[3] = v17;
      if (v9) {
        operator delete(v9);
      }
    }
    else
    {
      float *v7 = a2;
      v7[1] = a3;
      id v8 = v7 + 2;
    }
    v5[2] = v8;
    return 1;
  }
  return result;
}

- (float)_finalizeInitialization
{
  unint64_t v9 = (unint64_t)result;
  while (2)
  {
    uint64_t v10 = a2 - 2;
    unint64_t v11 = v9;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          unint64_t v9 = v11;
          uint64_t v12 = (uint64_t)a2 - v11;
          unint64_t v13 = (uint64_t)((uint64_t)a2 - v11) >> 3;
          if (v5 || !v4)
          {
            switch(v13)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                if (*v10 < *(float *)v11)
                {
                  uint64_t v38 = *(void *)v11;
                  *(void *)unint64_t v11 = *(void *)v10;
                  *(void *)uint64_t v10 = v38;
                }
                break;
              case 3uLL:
                result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)v11 _finalizeInitialization];
                break;
              case 4uLL:
                result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)v11 _finalizeInitialization];
                break;
              case 5uLL:
                uint64_t v39 = (float *)(v11 + 16);
                uint64_t v40 = (uint64_t *)(v11 + 24);
                result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)v11 _finalizeInitialization];
                if (*v10 < *(float *)(v11 + 24))
                {
                  uint64_t v41 = *v40;
                  *uint64_t v40 = *(void *)v10;
                  *(void *)uint64_t v10 = v41;
                  if (*(float *)v40 < *v39)
                  {
                    uint64_t v42 = *(void *)v39;
                    uint64_t v43 = *v40;
                    *(void *)uint64_t v39 = *v40;
                    *uint64_t v40 = v42;
                    if (*(float *)(v11 + 8) > *(float *)&v43)
                    {
                      uint64_t v44 = *(void *)(v11 + 8);
                      *(void *)(v11 + 8) = v43;
                      *(void *)(v11 + 16) = v44;
                      if (*(float *)v11 > *(float *)&v43)
                      {
                        uint64_t v45 = *(void *)v11;
                        *(void *)unint64_t v11 = v43;
                        *(void *)(v11 + 8) = v45;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v12 <= 191)
          {
            int v46 = (float *)(v11 + 8);
            BOOL v48 = (float *)v11 == a2 || v46 == a2;
            if (a4)
            {
              if (!v48)
              {
                uint64_t v49 = 0;
                unint64_t v50 = v11;
                do
                {
                  uint64_t v51 = v46;
                  float v52 = *(float *)(v50 + 8);
                  if (v52 < *(float *)v50)
                  {
                    int v53 = *(_DWORD *)(v50 + 12);
                    uint64_t v54 = v49;
                    while (1)
                    {
                      *(void *)(v11 + v54 + 8) = *(void *)(v11 + v54);
                      if (!v54) {
                        break;
                      }
                      float v55 = *(float *)(v11 + v54 - 8);
                      v54 -= 8;
                      if (v55 <= v52)
                      {
                        uint64_t v56 = v11 + v54 + 8;
                        goto LABEL_83;
                      }
                    }
                    uint64_t v56 = v11;
LABEL_83:
                    *(float *)uint64_t v56 = v52;
                    *(_DWORD *)(v56 + 4) = v53;
                  }
                  int v46 = v51 + 2;
                  v49 += 8;
                  unint64_t v50 = (unint64_t)v51;
                }
                while (v51 + 2 != a2);
              }
            }
            else if (!v48)
            {
              do
              {
                unint64_t v82 = (unint64_t)v46;
                float v83 = *(float *)(v9 + 8);
                if (v83 < *(float *)v9)
                {
                  int v84 = *(_DWORD *)(v9 + 12);
                  do
                  {
                    v85 = v46;
                    uint64_t v86 = *((void *)v46 - 1);
                    v46 -= 2;
                    *(void *)v85 = v86;
                  }
                  while (*(v85 - 4) > v83);
                  *int v46 = v83;
                  *((_DWORD *)v46 + 1) = v84;
                }
                int v46 = (float *)(v82 + 8);
                unint64_t v9 = v82;
              }
              while ((float *)(v82 + 8) != a2);
            }
            return result;
          }
          if (!a3)
          {
            if ((float *)v11 != a2)
            {
              int64_t v57 = (v13 - 2) >> 1;
              int64_t v58 = v57;
              do
              {
                int64_t v59 = v58;
                if (v57 >= v58)
                {
                  uint64_t v60 = (2 * v58) | 1;
                  uint64_t v61 = (float *)(v11 + 8 * v60);
                  if (2 * v59 + 2 < (uint64_t)v13 && *v61 < v61[2])
                  {
                    v61 += 2;
                    uint64_t v60 = 2 * v59 + 2;
                  }
                  unint64_t v62 = (float *)(v11 + 8 * v59);
                  float v63 = *v62;
                  if (*v61 >= *v62)
                  {
                    int v64 = *((_DWORD *)v62 + 1);
                    do
                    {
                      v65 = v62;
                      unint64_t v62 = v61;
                      *(void *)v65 = *(void *)v61;
                      if (v57 < v60) {
                        break;
                      }
                      uint64_t v66 = 2 * v60;
                      uint64_t v60 = (2 * v60) | 1;
                      uint64_t v61 = (float *)(v11 + 8 * v60);
                      uint64_t v67 = v66 + 2;
                      if (v67 < (uint64_t)v13 && *v61 < v61[2])
                      {
                        v61 += 2;
                        uint64_t v60 = v67;
                      }
                    }
                    while (*v61 >= v63);
                    *unint64_t v62 = v63;
                    *((_DWORD *)v62 + 1) = v64;
                  }
                }
                int64_t v58 = v59 - 1;
              }
              while (v59);
              uint64_t v68 = (unint64_t)v12 >> 3;
              do
              {
                uint64_t v69 = 0;
                uint64_t v70 = *(void *)v11;
                v71 = (float *)v11;
                do
                {
                  uint64_t v72 = v71;
                  v71 += 2 * v69 + 2;
                  uint64_t v73 = 2 * v69;
                  uint64_t v69 = (2 * v69) | 1;
                  uint64_t v74 = v73 + 2;
                  if (v74 < v68 && *v71 < v71[2])
                  {
                    v71 += 2;
                    uint64_t v69 = v74;
                  }
                  *(void *)uint64_t v72 = *(void *)v71;
                }
                while (v69 <= (uint64_t)((unint64_t)(v68 - 2) >> 1));
                a2 -= 2;
                if (v71 == a2)
                {
                  *(void *)v71 = v70;
                }
                else
                {
                  *(void *)v71 = *(void *)a2;
                  *(void *)a2 = v70;
                  uint64_t v75 = (uint64_t)v71 - v11 + 8;
                  if (v75 >= 9)
                  {
                    unint64_t v76 = (((unint64_t)v75 >> 3) - 2) >> 1;
                    v77 = (float *)(v11 + 8 * v76);
                    float v78 = *v71;
                    if (*v77 < *v71)
                    {
                      int v79 = *((_DWORD *)v71 + 1);
                      do
                      {
                        uint64_t v80 = v71;
                        v71 = v77;
                        *(void *)uint64_t v80 = *(void *)v77;
                        if (!v76) {
                          break;
                        }
                        unint64_t v76 = (v76 - 1) >> 1;
                        v77 = (float *)(v11 + 8 * v76);
                      }
                      while (*v77 < v78);
                      float *v71 = v78;
                      *((_DWORD *)v71 + 1) = v79;
                    }
                  }
                }
              }
              while (v68-- > 2);
            }
            return result;
          }
          unint64_t v14 = v13 >> 1;
          uint64_t v15 = (float *)(v11 + 8 * (v13 >> 1));
          if ((unint64_t)v12 >= 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)v9 _finalizeInitialization];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)(v9 + 8) _finalizeInitialization];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)(v9 + 16) _finalizeInitialization];
            result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)v15 - 2 _finalizeInitialization];
            uint64_t v16 = *(void *)v9;
            *(void *)unint64_t v9 = *(void *)v15;
            *(void *)uint64_t v15 = v16;
          }
          else
          {
            result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)(float *)(v9 + 8 * (v13 >> 1)) _finalizeInitialization];
          }
          --a3;
          if (a4) {
            break;
          }
          float v17 = *(float *)v9;
          if (*(float *)(v9 - 8) < *(float *)v9) {
            goto LABEL_13;
          }
          if (*v10 <= v17)
          {
            unint64_t v31 = v9 + 8;
            do
            {
              unint64_t v11 = v31;
              if (v31 >= (unint64_t)a2) {
                break;
              }
              v31 += 8;
            }
            while (*(float *)v11 <= v17);
          }
          else
          {
            unint64_t v11 = v9;
            do
            {
              float v30 = *(float *)(v11 + 8);
              v11 += 8;
            }
            while (v30 <= v17);
          }
          uLong v32 = a2;
          if (v11 < (unint64_t)a2)
          {
            uLong v32 = a2;
            do
            {
              float v33 = *(v32 - 2);
              v32 -= 2;
            }
            while (v33 > v17);
          }
          int v34 = *(_DWORD *)(v9 + 4);
          while (v11 < (unint64_t)v32)
          {
            uint64_t v35 = *(void *)v11;
            *(void *)unint64_t v11 = *(void *)v32;
            *(void *)uLong v32 = v35;
            do
            {
              float v36 = *(float *)(v11 + 8);
              v11 += 8;
            }
            while (v36 <= v17);
            do
            {
              float v37 = *(v32 - 2);
              v32 -= 2;
            }
            while (v37 > v17);
          }
          BOOL v4 = v11 - 8 >= v9;
          BOOL v5 = v11 - 8 == v9;
          if (v11 - 8 != v9) {
            *(void *)unint64_t v9 = *(void *)(v11 - 8);
          }
          a4 = 0;
          *(float *)(v11 - 8) = v17;
          *(_DWORD *)(v11 - 4) = v34;
        }
        float v17 = *(float *)v9;
LABEL_13:
        int v18 = *(_DWORD *)(v9 + 4);
        unint64_t v19 = v9;
        do
        {
          unint64_t v20 = v19;
          float v21 = *(float *)(v19 + 8);
          v19 += 8;
        }
        while (v21 < v17);
        uLong v22 = a2;
        if (v20 == v9)
        {
          uLong v22 = a2;
          do
          {
            if (v19 >= (unint64_t)v22) {
              break;
            }
            float v24 = *(v22 - 2);
            v22 -= 2;
          }
          while (v24 >= v17);
        }
        else
        {
          do
          {
            float v23 = *(v22 - 2);
            v22 -= 2;
          }
          while (v23 >= v17);
        }
        unint64_t v11 = v19;
        if (v19 < (unint64_t)v22)
        {
          uint64_t v25 = v22;
          do
          {
            uint64_t v26 = *(void *)v11;
            *(void *)unint64_t v11 = *(void *)v25;
            *(void *)uint64_t v25 = v26;
            do
            {
              float v27 = *(float *)(v11 + 8);
              v11 += 8;
            }
            while (v27 < v17);
            do
            {
              float v28 = *(v25 - 2);
              v25 -= 2;
            }
            while (v28 >= v17);
          }
          while (v11 < (unint64_t)v25);
        }
        if (v11 - 8 != v9) {
          *(void *)unint64_t v9 = *(void *)(v11 - 8);
        }
        *(float *)(v11 - 8) = v17;
        *(_DWORD *)(v11 - 4) = v18;
        if (v19 >= (unint64_t)v22) {
          break;
        }
LABEL_32:
        result = (float *)std::__introsort<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)v9 _finalizeInitialization];
        a4 = 0;
      }
      BOOL v29 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)v9 _finalizeInitialization];
      result = (float *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,[(VisionCoreValueConfidenceCurve *)v11 _finalizeInitialization];
      if (result) {
        break;
      }
      if (!v29) {
        goto LABEL_32;
      }
    }
    a2 = (float *)(v11 - 8);
    if (!v29) {
      continue;
    }
    return result;
  }
}

+ (VisionCoreValueConfidenceCurve)curveWithValues:(const float *)a3 confidences:(const float *)a4 count:(unint64_t)a5 error:(id *)a6
{
  id v10 = objc_alloc((Class)a1);
  if (v10)
  {
    v15.receiver = v10;
    v15.super_class = (Class)VisionCoreValueConfidenceCurve;
    unint64_t v11 = objc_msgSendSuper2(&v15, sel_init);
  }
  else
  {
    unint64_t v11 = 0;
  }
  if (-[VisionCoreValueConfidenceCurve _prepareForCount:error:]((uint64_t)v11, a5, a6))
  {
    if (!a5)
    {
LABEL_8:
      -[VisionCoreValueConfidenceCurve _finalizeInitialization](v11);
      unint64_t v13 = v11;
      goto LABEL_10;
    }
    uint64_t v12 = 0;
    while ((-[VisionCoreValueConfidenceCurve _addValue:confidence:atIndex:error:]((uint64_t)v11, a3[v12], a4[v12]) & 1) != 0)
    {
      if (a5 == ++v12) {
        goto LABEL_8;
      }
    }
  }
  unint64_t v13 = 0;
LABEL_10:

  return (VisionCoreValueConfidenceCurve *)v13;
}

@end