@interface TIHandwritingStrokes
+ (BOOL)supportsSecureCoding;
- (CGPoint)pointAtIndex:(unint64_t)a3 inStrokeAtIndex:(unint64_t)a4;
- (TIHandwritingStrokes)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)numberOfPointsInStrokeAtIndex:(unint64_t)a3;
- (unint64_t)numberOfStrokes;
- (unint64_t)totalNumberOfPoints;
- (void)addPoint:(CGPoint)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endStroke;
- (void)removeAllStrokes;
- (void)removeStrokeAtIndex:(unint64_t)a3;
@end

@implementation TIHandwritingStrokes

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_strokes = &self->_strokes;
  if (self->_strokes.__begin_)
  {
    std::vector<std::vector<TIHandwritingPoint>>::__clear[abi:nn180100]((uint64_t *)&self->_strokes);
    begin = p_strokes->__begin_;
    operator delete(begin);
  }
}

- (unint64_t)totalNumberOfPoints
{
  begin = (uint64_t *)self->_strokes.__begin_;
  end = (uint64_t *)self->_strokes.__end_;
  if (begin == end) {
    return 0;
  }
  unint64_t result = 0;
  do
  {
    uint64_t v6 = *begin;
    uint64_t v5 = begin[1];
    begin += 3;
    result += (v5 - v6) >> 4;
  }
  while (begin != end);
  return result;
}

- (CGPoint)pointAtIndex:(unint64_t)a3 inStrokeAtIndex:(unint64_t)a4
{
  v4 = (double *)(*((void *)self->_strokes.__begin_ + 3 * a4) + 16 * a3);
  double v5 = *v4;
  double v6 = v4[1];
  result.y = v6;
  result.x = v5;
  return result;
}

- (unint64_t)numberOfPointsInStrokeAtIndex:(unint64_t)a3
{
  return (uint64_t)(*((void *)self->_strokes.__begin_ + 3 * a3 + 1) - *((void *)self->_strokes.__begin_ + 3 * a3)) >> 4;
}

- (unint64_t)numberOfStrokes
{
  return 0xAAAAAAAAAAAAAAABLL * (((char *)self->_strokes.__end_ - (char *)self->_strokes.__begin_) >> 3);
}

- (void)removeAllStrokes
{
}

- (void)removeStrokeAtIndex:(unint64_t)a3
{
  end = (char *)self->_strokes.__end_;
  double v5 = (char *)self->_strokes.__begin_ + 24 * a3;
  double v6 = v5 + 24;
  if (v5 + 24 != end)
  {
    do
    {
      v7 = *(void **)v5;
      if (*(void *)v5)
      {
        *((void *)v5 + 1) = v7;
        operator delete(v7);
        *((void *)v5 + 2) = 0;
      }
      v8 = v5 + 24;
      *(_OWORD *)double v5 = *(_OWORD *)(v5 + 24);
      *((void *)v5 + 2) = *((void *)v5 + 5);
      *((void *)v5 + 4) = 0;
      *((void *)v5 + 5) = 0;
      *((void *)v5 + 3) = 0;
      v9 = v5 + 48;
      v5 += 24;
    }
    while (v9 != end);
    double v6 = (char *)self->_strokes.__end_;
    double v5 = v8;
  }
  if (v6 != v5)
  {
    v10 = v6;
    do
    {
      v12 = (void *)*((void *)v10 - 3);
      v10 -= 24;
      v11 = v12;
      if (v12)
      {
        *((void *)v6 - 2) = v11;
        operator delete(v11);
      }
      double v6 = v10;
    }
    while (v10 != v5);
  }
  self->_strokes.__end_ = v5;
}

- (void)endStroke
{
  self->_continuePreviousStroke = 0;
}

- (void)addPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  begin = (char *)self->_strokes.__begin_;
  end = (char *)self->_strokes.__end_;
  p_strokes = &self->_strokes;
  if (end == begin || !self->_continuePreviousStroke)
  {
    value = (char *)self->_strokes.__end_cap_.__value_;
    if (end >= value)
    {
      unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_29;
      }
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
      uint64_t v12 = 2 * v11;
      if (2 * v11 <= v10 + 1) {
        uint64_t v12 = v10 + 1;
      }
      if (v11 >= 0x555555555555555) {
        unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v13 = v12;
      }
      v29[4] = &self->_strokes.__end_cap_;
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<TIHandwritingPoint>>>(v13);
      v15 = &v14[24 * v10];
      v29[0] = v14;
      v29[1] = v15;
      v29[3] = &v14[24 * v16];
      *((void *)v15 + 1) = 0;
      *((void *)v15 + 2) = 0;
      *(void *)v15 = 0;
      v29[2] = v15 + 24;
      std::vector<std::vector<TIHandwritingPoint>>::__swap_out_circular_buffer(p_strokes, v29);
      end = (char *)self->_strokes.__end_;
      std::__split_buffer<std::vector<TIHandwritingPoint>>::~__split_buffer((uint64_t)v29);
    }
    else
    {
      *(void *)end = 0;
      *((void *)end + 1) = 0;
      *((void *)end + 2) = 0;
      end += 24;
    }
    self->_strokes.__end_ = end;
  }
  v18 = (CGFloat *)*((void *)end - 2);
  unint64_t v17 = *((void *)end - 1);
  if ((unint64_t)v18 < v17)
  {
    CGFloat *v18 = x;
    v18[1] = y;
    v19 = v18 + 2;
    goto LABEL_28;
  }
  v20 = (CGFloat *)*((void *)end - 3);
  uint64_t v21 = ((char *)v18 - (char *)v20) >> 4;
  unint64_t v22 = v21 + 1;
  if ((unint64_t)(v21 + 1) >> 60) {
LABEL_29:
  }
    abort();
  uint64_t v23 = v17 - (void)v20;
  if (v23 >> 3 > v22) {
    unint64_t v22 = v23 >> 3;
  }
  BOOL v24 = (unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0;
  unint64_t v25 = 0xFFFFFFFFFFFFFFFLL;
  if (!v24) {
    unint64_t v25 = v22;
  }
  if (v25)
  {
    unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TIHandwritingPoint>>(v25);
    v20 = (CGFloat *)*((void *)end - 3);
    v18 = (CGFloat *)*((void *)end - 2);
  }
  else
  {
    uint64_t v26 = 0;
  }
  v27 = (CGFloat *)(v25 + 16 * v21);
  unint64_t v28 = v25 + 16 * v26;
  CGFloat *v27 = x;
  v27[1] = y;
  v19 = v27 + 2;
  if (v18 != v20)
  {
    do
    {
      *((_OWORD *)v27 - 1) = *((_OWORD *)v18 - 1);
      v27 -= 2;
      v18 -= 2;
    }
    while (v18 != v20);
    v20 = (CGFloat *)*((void *)end - 3);
  }
  *((void *)end - 3) = v27;
  *((void *)end - 2) = v19;
  *((void *)end - 1) = v28;
  if (v20) {
    operator delete(v20);
  }
LABEL_28:
  *((void *)end - 2) = v19;
  self->_continuePreviousStroke = 1;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)TIHandwritingStrokes;
  v3 = [(TIHandwritingStrokes *)&v11 description];
  v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @"\n\t%d strokes\n", 0xAAAAAAAAAAAAAAABLL * (((char *)self->_strokes.__end_ - (char *)self->_strokes.__begin_) >> 3));
  begin = self->_strokes.__begin_;
  if (self->_strokes.__end_ != begin)
  {
    unint64_t v6 = 0;
    do
    {
      objc_msgSend(v4, "appendFormat:", @"\t\tstroke %d – %d points\n", v6, (begin[3 * v6 + 1] - begin[3 * v6]) >> 4);
      begin = self->_strokes.__begin_;
      uint64_t v7 = begin[3 * v6];
      if (begin[3 * v6 + 1] != v7)
      {
        uint64_t v8 = 0;
        unint64_t v9 = 0;
        do
        {
          objc_msgSend(v4, "appendFormat:", @"\t\t\t(%f,%f)\n", *(void *)(v7 + v8), *(void *)(v7 + v8 + 8));
          ++v9;
          begin = self->_strokes.__begin_;
          uint64_t v7 = begin[3 * v6];
          v8 += 16;
        }
        while (v9 < (begin[3 * v6 + 1] - v7) >> 4);
      }
      ++v6;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((char *)self->_strokes.__end_ - (char *)begin) >> 3) > v6);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((int)(-1431655765 * (((char *)self->_strokes.__end_ - (char *)self->_strokes.__begin_) >> 3)) >= 1)
  {
    uint64_t v5 = -1431655765 * (((char *)self->_strokes.__end_ - (char *)self->_strokes.__begin_) >> 3);
    ((void (*)(void))MEMORY[0x1F4188790])();
    uint64_t v7 = 0;
    LODWORD(v8) = 0;
    unint64_t v9 = (char *)self->_strokes.__begin_ + 8;
    do
    {
      uint64_t v10 = (*v9 - *(v9 - 1)) >> 4;
      *(_DWORD *)((char *)v20 + v7 - ((v6 + 15) & 0x7FFFFFFF0)) = v10;
      uint64_t v8 = (v8 + v10);
      v7 += 4;
      v9 += 3;
    }
    while (v6 != v7);
    uint64_t v11 = objc_msgSend(v4, "encodeBytes:length:forKey:");
    MEMORY[0x1F4188790](v11);
    uint64_t v12 = 0;
    int v13 = 0;
    begin = self->_strokes.__begin_;
    do
    {
      v15 = (long long *)begin[3 * v12];
      uint64_t v16 = begin[3 * v12 + 1] - (void)v15;
      if (v16)
      {
        unint64_t v17 = v16 >> 4;
        if (v17 <= 1) {
          unint64_t v17 = 1;
        }
        v18 = &v20[2 * v13 + -2 * v8];
        v13 += v17;
        do
        {
          long long v19 = *v15++;
          *v18++ = v19;
          --v17;
        }
        while (v17);
      }
      ++v12;
    }
    while (v12 != v5);
    objc_msgSend(v4, "encodeBytes:length:forKey:");
  }
}

- (TIHandwritingStrokes)initWithCoder:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)TIHandwritingStrokes;
  uint64_t v5 = [(TIHandwritingStrokes *)&v54 init];
  if (v5)
  {
    unint64_t v53 = 0;
    id v47 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 decodeBytesForKey:@"strokePointsCount" returnedLength:&v53];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = v53;
      uint64_t v52 = [v6 decodeBytesForKey:@"points" returnedLength:&v53];
      if (v52)
      {
        if (v9 >= 4)
        {
          uint64_t v10 = 0;
          unint64_t v11 = 0;
          unint64_t v12 = v9 >> 2;
          unint64_t v13 = v53 >> 4;
          if (v12 <= 1) {
            unint64_t v12 = 1;
          }
          p_strokes = &v5->_strokes;
          unint64_t v51 = v12;
          p_end_cap = &v5->_strokes.__end_cap_;
          v49 = v5;
          do
          {
            uint64_t v14 = *(int *)(v8 + 4 * v10);
            unint64_t v15 = v11 + v14;
            if (v11 >= v11 + v14 || v11 >= v13)
            {
              end = (char *)v5->_strokes.__end_;
              value = (char *)v5->_strokes.__end_cap_.__value_;
              if (end >= value)
              {
                v20 = 0;
                long long v19 = 0;
LABEL_44:
                unint64_t v11 = v15;
                unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)p_strokes->__begin_) >> 3);
                unint64_t v37 = v36 + 1;
                if (v36 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_61:
                }
                  abort();
                unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * ((value - (char *)p_strokes->__begin_) >> 3);
                if (2 * v38 > v37) {
                  unint64_t v37 = 2 * v38;
                }
                if (v38 >= 0x555555555555555) {
                  unint64_t v39 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v39 = v37;
                }
                v55[4] = p_end_cap;
                if (v39) {
                  unint64_t v39 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<TIHandwritingPoint>>>(v39);
                }
                else {
                  uint64_t v40 = 0;
                }
                v41 = (void *)(v39 + 24 * v36);
                v55[0] = v39;
                v55[1] = v41;
                v55[3] = v39 + 24 * v40;
                void *v41 = 0;
                v41[1] = 0;
                v41[2] = 0;
                int64_t v42 = v20 - v19;
                if (v42)
                {
                  v43 = (void *)(v39 + 24 * v36);
                  std::vector<TIHandwritingPoint>::__vallocate[abi:nn180100](v43, v42 >> 4);
                  v44 = (char *)v43[1];
                  memmove(v44, v19, v42);
                  v45 = &v44[v42];
                  uint64_t v5 = v49;
                  v43[1] = v45;
                }
                v55[2] = v41 + 3;
                std::vector<std::vector<TIHandwritingPoint>>::__swap_out_circular_buffer(p_strokes, v55);
                v35 = v5->_strokes.__end_;
                std::__split_buffer<std::vector<TIHandwritingPoint>>::~__split_buffer((uint64_t)v55);
                goto LABEL_56;
              }
              long long v19 = 0;
              *(void *)end = 0;
              *((void *)end + 1) = 0;
              *((void *)end + 2) = 0;
            }
            else
            {
              long long v19 = 0;
              v20 = 0;
              unint64_t v21 = 0;
              unint64_t v22 = v11;
              do
              {
                uint64_t v23 = (_OWORD *)(v52 + 16 * v22);
                if ((unint64_t)v20 >= v21)
                {
                  uint64_t v24 = (v20 - v19) >> 4;
                  unint64_t v25 = v24 + 1;
                  if ((unint64_t)(v24 + 1) >> 60) {
                    goto LABEL_61;
                  }
                  if ((uint64_t)(v21 - (void)v19) >> 3 > v25) {
                    unint64_t v25 = (uint64_t)(v21 - (void)v19) >> 3;
                  }
                  if (v21 - (unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v26 = v25;
                  }
                  if (v26) {
                    unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TIHandwritingPoint>>(v26);
                  }
                  else {
                    uint64_t v27 = 0;
                  }
                  unint64_t v28 = (_OWORD *)(v26 + 16 * v24);
                  *unint64_t v28 = *v23;
                  if (v20 == v19)
                  {
                    v30 = (char *)(v26 + 16 * v24);
                  }
                  else
                  {
                    unint64_t v29 = v26 + 16 * v24;
                    do
                    {
                      v30 = (char *)(v29 - 16);
                      *(_OWORD *)(v29 - 16) = *((_OWORD *)v20 - 1);
                      v20 -= 16;
                      v29 -= 16;
                    }
                    while (v20 != v19);
                  }
                  unint64_t v21 = v26 + 16 * v27;
                  v20 = (char *)(v28 + 1);
                  if (v19) {
                    operator delete(v19);
                  }
                  long long v19 = v30;
                }
                else
                {
                  *(_OWORD *)v20 = *v23;
                  v20 += 16;
                }
                ++v22;
                unint64_t v15 = v11 + *(int *)(v8 + 4 * v10);
              }
              while (v22 < v15 && v22 < v13);
              uint64_t v5 = v49;
              end = (char *)v49->_strokes.__end_;
              value = (char *)v49->_strokes.__end_cap_.__value_;
              if (end >= value) {
                goto LABEL_44;
              }
              *(void *)end = 0;
              *((void *)end + 1) = 0;
              *((void *)end + 2) = 0;
              int64_t v32 = v20 - v19;
              if (v32)
              {
                std::vector<TIHandwritingPoint>::__vallocate[abi:nn180100](end, v32 >> 4);
                v33 = (char *)*((void *)end + 1);
                memmove(v33, v19, v32);
                v34 = &v33[v32];
                uint64_t v5 = v49;
                *((void *)end + 1) = v34;
              }
            }
            v35 = end + 24;
            unint64_t v11 = v15;
LABEL_56:
            v5->_strokes.__end_ = v35;
            if (v19) {
              operator delete(v19);
            }
            ++v10;
          }
          while (v10 != v51);
        }
      }
    }
    id v4 = v47;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = (void *)v4;
  if ((TIHandwritingStrokes *)v4 != self)
  {
    uint64_t v7 = (void **)(v4 + 8);
    uint64_t v6 = *(void *)(v4 + 8);
    begin = (char **)self->_strokes.__begin_;
    end = (char **)self->_strokes.__end_;
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (end - begin);
    uint64_t v11 = *(void *)(v4 + 24);
    if (0xAAAAAAAAAAAAAAABLL * ((v11 - v6) >> 3) < v10)
    {
      if (v6)
      {
        std::vector<std::vector<TIHandwritingPoint>>::__clear[abi:nn180100]((uint64_t *)(v4 + 8));
        operator delete(*v7);
        uint64_t v11 = 0;
        void *v7 = 0;
        v5[2] = 0;
        v5[3] = 0;
      }
      if (v10 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_27;
      }
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (v11 >> 3);
      uint64_t v13 = 2 * v12;
      if (2 * v12 <= v10) {
        uint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (end - begin);
      }
      unint64_t v14 = v12 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v13;
      if (v14 > 0xAAAAAAAAAAAAAAALL) {
LABEL_27:
      }
        abort();
      unint64_t v15 = std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<TIHandwritingPoint>>>(v14);
      v5[1] = v15;
      v5[2] = v15;
      v5[3] = &v15[3 * v16];
      while (begin != end)
      {
        unint64_t v17 = std::vector<TIHandwritingPoint>::vector(v15, (uint64_t)begin);
        begin += 3;
        unint64_t v15 = v17 + 3;
      }
      goto LABEL_19;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v4 + 16) - v6) >> 3) < v10)
    {
      v18 = &begin[(*(void *)(v4 + 16) - v6) >> 3];
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *>(begin, v18, v6);
      unint64_t v15 = (void *)v5[2];
      while (v18 != end)
      {
        long long v19 = std::vector<TIHandwritingPoint>::vector(v15, (uint64_t)v18);
        v18 += 3;
        unint64_t v15 = v19 + 3;
      }
LABEL_19:
      v5[2] = v15;
      return v5;
    }
    v20 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *>(begin, end, v6);
    unint64_t v21 = (char **)v5[2];
    if (v21 != v20)
    {
      unint64_t v22 = (char **)v5[2];
      do
      {
        uint64_t v24 = *(v22 - 3);
        v22 -= 3;
        uint64_t v23 = v24;
        if (v24)
        {
          *(v21 - 2) = v23;
          operator delete(v23);
        }
        unint64_t v21 = v22;
      }
      while (v22 != v20);
    }
    v5[2] = v20;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end