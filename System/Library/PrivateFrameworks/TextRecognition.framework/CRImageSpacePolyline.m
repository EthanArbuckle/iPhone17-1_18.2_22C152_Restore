@interface CRImageSpacePolyline
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGPath)path;
- (CGRect)boundingRect;
- (CGSize)estimatedLineSizeForPairedPointPolygon;
- (CRImageSpacePolyline)init;
- (CRImageSpacePolyline)initWithCRCodableDataRepresentation:(id)a3;
- (CRImageSpacePolyline)initWithCoder:(id)a3;
- (CRImageSpacePolyline)initWithPointValues:(id)a3;
- (CRImageSpacePolyline)initWithPoints:(CGPoint *)a3 count:(unint64_t)a4;
- (CRImageSpacePolyline)initWithPolyline:(id)a3;
- (NSArray)pointValues;
- (NSString)description;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)crCodableDataRepresentation;
- (id)initWithPoints:(void *)a1;
- (id)polylineByAppendingPoint:(CGPoint)a3;
- (id)polylineByAppendingPolyline:(id)a3;
- (id)rotated180;
- (id)simplified;
- (unint64_t)pointCount;
- (void)appendPoint:(double)a3;
- (void)appendPolyline:(uint64_t)a1;
- (void)createPathWithTransformer:(void *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumeratePoints:(id)a3;
- (void)enumeratePointsWithTransformer:(void *)a3 block:;
@end

@implementation CRImageSpacePolyline

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRImageSpacePolyline)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CRPolylineData"];
  v6 = uncompressDataOfSize(v5, [v4 decodeIntegerForKey:@"CRPolylineUncompressedDataSize"]);
  v7 = [(CRImageSpacePolyline *)self initWithCRCodableDataRepresentation:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(CRImageSpacePolyline *)self crCodableDataRepresentation];
  v5 = compressData(v4);
  [v6 encodeObject:v5 forKey:@"CRPolylineData"];
  objc_msgSend(v6, "encodeInteger:forKey:", objc_msgSend(v4, "length"), @"CRPolylineUncompressedDataSize");
}

- (id)initWithPoints:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)CRImageSpacePolyline;
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
  {
    if (a2) {
      operator new();
    }
    operator new();
  }
  return v3;
}

- (CRImageSpacePolyline)initWithPolyline:(id)a3
{
  id v4 = (uint64_t *)a3;
  objc_super v5 = v4;
  if (v4) {
    uint64_t v6 = v4[1];
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = (CRImageSpacePolyline *)-[CRImageSpacePolyline initWithPoints:](self, v6);

  return v7;
}

- (CRImageSpacePolyline)init
{
  return [(CRImageSpacePolyline *)self initWithPolyline:0];
}

- (CRImageSpacePolyline)initWithPointValues:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x4812000000;
  v11 = __Block_byref_object_copy__8;
  v12 = __Block_byref_object_dispose__8;
  v13 = &unk_1DD8FDA7A;
  std::vector<CGPoint>::vector(__p, [v4 count]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CRImageSpacePolyline_initWithPointValues___block_invoke;
  v7[3] = &unk_1E6CDB690;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  objc_super v5 = (CRImageSpacePolyline *)-[CRImageSpacePolyline initWithPoints:](self, (uint64_t)(v9 + 6));
  _Block_object_dispose(&v8, 8);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v5;
}

void __44__CRImageSpacePolyline_initWithPointValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  [v8 pointValue];
  objc_super v5 = (void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) + 16 * a3);
  void *v5 = v6;
  v5[1] = v7;
}

- (CRImageSpacePolyline)initWithPoints:(CGPoint *)a3 count:(unint64_t)a4
{
  uint64_t v6 = [(CRImageSpacePolyline *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    points = (void **)v6->__points;
    v9 = (char *)*points;
    if (a4 > ((unsigned char *)points[2] - (unsigned char *)*points) >> 4)
    {
      if (a4 >> 60) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v10 = points[1];
      v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)(points + 2), a4);
      v12 = &v11[(v10 - v9) & 0xFFFFFFFFFFFFFFF0];
      v14 = &v11[16 * v13];
      v16 = (char *)*points;
      v15 = (char *)points[1];
      v17 = v12;
      if (v15 != *points)
      {
        do
        {
          *((_OWORD *)v17 - 1) = *((_OWORD *)v15 - 1);
          v17 -= 16;
          v15 -= 16;
        }
        while (v15 != v16);
        v15 = (char *)*points;
      }
      *points = v17;
      points[1] = v12;
      points[2] = v14;
      if (v15) {
        operator delete(v15);
      }
    }
    if (a4)
    {
      uint64_t v18 = 0;
      do
      {
        v19 = (void **)v7->__points;
        v20 = &a3[v18];
        v21 = (CGPoint *)v19[1];
        unint64_t v22 = (unint64_t)v19[2];
        if ((unint64_t)v21 >= v22)
        {
          uint64_t v24 = ((char *)v21 - (unsigned char *)*v19) >> 4;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v26 = v22 - (void)*v19;
          if (v26 >> 3 > v25) {
            unint64_t v25 = v26 >> 3;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27) {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)(v19 + 2), v27);
          }
          else {
            v28 = 0;
          }
          v29 = (CGPoint *)&v28[16 * v24];
          CGPoint *v29 = *v20;
          v31 = (CGPoint *)*v19;
          v30 = (CGPoint *)v19[1];
          v32 = v29;
          if (v30 != *v19)
          {
            do
            {
              v32[-1] = v30[-1];
              --v32;
              --v30;
            }
            while (v30 != v31);
            v30 = (CGPoint *)*v19;
          }
          p_x = (_OWORD *)&v29[1].x;
          *v19 = v32;
          v19[1] = &v29[1];
          v19[2] = &v28[16 * v27];
          if (v30) {
            operator delete(v30);
          }
        }
        else
        {
          CGPoint *v21 = *v20;
          p_x = (_OWORD *)&v21[1].x;
        }
        v19[1] = p_x;
        ++v18;
      }
      while (v18 != a4);
    }
  }
  return v7;
}

- (id)polylineByAppendingPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v5 = (void *)[(CRImageSpacePolyline *)self copy];
  [(CRImageSpacePolyline *)(uint64_t)v5 appendPoint:y];
  return v5;
}

- (void)appendPoint:(double)a3
{
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v7 = *(double **)(v6 + 8);
    unint64_t v8 = *(void *)(v6 + 16);
    if ((unint64_t)v7 >= v8)
    {
      uint64_t v10 = *(double **)v6;
      uint64_t v11 = ((uint64_t)v7 - *(void *)v6) >> 4;
      unint64_t v12 = v11 + 1;
      if ((unint64_t)(v11 + 1) >> 60) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v13 = v8 - (void)v10;
      if (v13 >> 3 > v12) {
        unint64_t v12 = v13 >> 3;
      }
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v12;
      }
      if (v14)
      {
        v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>(v6 + 16, v14);
        uint64_t v10 = *(double **)v6;
        uint64_t v7 = *(double **)(v6 + 8);
      }
      else
      {
        v15 = 0;
      }
      v16 = (double *)&v15[16 * v11];
      v17 = &v15[16 * v14];
      double *v16 = a2;
      v16[1] = a3;
      v9 = v16 + 2;
      if (v7 != v10)
      {
        do
        {
          *((_OWORD *)v16 - 1) = *((_OWORD *)v7 - 1);
          v16 -= 2;
          v7 -= 2;
        }
        while (v7 != v10);
        uint64_t v10 = *(double **)v6;
      }
      *(void *)uint64_t v6 = v16;
      *(void *)(v6 + 8) = v9;
      *(void *)(v6 + 16) = v17;
      if (v10) {
        operator delete(v10);
      }
    }
    else
    {
      double *v7 = a2;
      v7[1] = a3;
      v9 = v7 + 2;
    }
    *(void *)(v6 + 8) = v9;
    CFTypeRef src = 0;
    objc_copyCppObjectAtomic((void *)(a1 + 16), &src, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
    if (src) {
      CFRelease(src);
    }
  }
}

- (id)polylineByAppendingPolyline:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[(CRImageSpacePolyline *)self copy];
  -[CRImageSpacePolyline appendPolyline:]((uint64_t)v5, v4);

  return v5;
}

- (void)appendPolyline:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    objc_super v5 = v3[1];
    uint64_t v7 = *v5;
    uint64_t v6 = v5[1];
    if (v6 - v7 >= 1)
    {
      uint64_t v8 = *(void *)(a1 + 8);
      v9 = *(char **)(v8 + 8);
      uint64_t v10 = (v6 - v7) >> 4;
      uint64_t v11 = *(void *)(v8 + 16);
      if (v10 <= (v11 - (uint64_t)v9) >> 4)
      {
        if (v10 <= 0)
        {
          uint64_t v18 = *(char **)(v8 + 8);
          v19 = &v9[16 * v10];
          v20 = &v18[-16 * v10];
          v21 = v18;
          if (v20 < v9)
          {
            v21 = *(char **)(v8 + 8);
            do
            {
              long long v22 = *(_OWORD *)v20;
              v20 += 16;
              *(_OWORD *)v21 = v22;
              v21 += 16;
            }
            while (v20 < v9);
          }
          *(void *)(v8 + 8) = v21;
          if (v18 != v19) {
            memmove(&v18[-16 * ((v18 - v19) >> 4)], v9, v18 - v19);
          }
          if (&v7[16 * v10] != v7) {
            memmove(v9, v7, 16 * v10);
          }
        }
        else
        {
          int64_t v17 = v6 - v7;
          if (v6 != v7) {
            memmove(*(void **)(v8 + 8), v7, v6 - v7);
          }
          *(void *)(v8 + 8) = &v9[v17];
        }
      }
      else
      {
        uint64_t v12 = (uint64_t)&v9[-*(void *)v8] >> 4;
        if ((unint64_t)(v12 + v10) >> 60) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v13 = v11 - *(void *)v8;
        uint64_t v14 = v13 >> 3;
        if (v13 >> 3 <= (unint64_t)(v12 + v10)) {
          uint64_t v14 = v12 + v10;
        }
        if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v14;
        }
        uint64_t v32 = v8 + 16;
        if (v15) {
          v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>(v8 + 16, v15);
        }
        else {
          v16 = 0;
        }
        v23 = &v16[16 * v12];
        __p = v16;
        v29 = v23;
        v31 = &v16[16 * v15];
        uint64_t v24 = 16 * v10;
        unint64_t v25 = &v23[16 * v10];
        do
        {
          long long v26 = *(_OWORD *)v7;
          v7 += 16;
          *(_OWORD *)v23 = v26;
          v23 += 16;
          v24 -= 16;
        }
        while (v24);
        v30 = v25;
        std::vector<CGPoint>::__swap_out_circular_buffer((void **)v8, (uint64_t)&__p, v9);
        if (v30 != v29) {
          v30 += (v29 - v30 + 15) & 0xFFFFFFFFFFFFFFF0;
        }
        if (__p) {
          operator delete(__p);
        }
      }
    }
    CFTypeRef cf = 0;
    objc_copyCppObjectAtomic((void *)(a1 + 16), &cf, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
    if (cf) {
      CFRelease(cf);
    }
  }
}

- (void)dealloc
{
  if (self)
  {
    points = (void **)self->__points;
    if (points)
    {
      id v4 = *points;
      if (*points)
      {
        points[1] = v4;
        operator delete(v4);
      }
      MEMORY[0x1E01BF140](points, 0x20C40960023A9);
      self->__points = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CRImageSpacePolyline;
  [(CRImageSpacePolyline *)&v5 dealloc];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Points: [\n"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CRImageSpacePolyline_description__block_invoke;
  v7[3] = &unk_1E6CDB6B8;
  id v4 = v3;
  id v8 = v4;
  [(CRImageSpacePolyline *)self enumeratePoints:v7];
  [v4 appendString:@"]"];
  objc_super v5 = [NSString stringWithString:v4];

  return (NSString *)v5;
}

void __35__CRImageSpacePolyline_description__block_invoke(uint64_t a1, double a2, double a3)
{
  id v3 = *(void **)(a1 + 32);
  NSStringFromPoint(*(NSPoint *)&a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@"%@\n", v4];
}

- (CGPath)path
{
  if (!self) {
    return 0;
  }
  p_pathRef = &self->__pathRef;
  objc_copyCppObjectAtomic(&dest, &self->__pathRef, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  if (dest)
  {
    CFRelease(dest);
  }
  else
  {
    [(CRImageSpacePolyline *)&cf createPathWithTransformer:0];
    objc_copyCppObjectAtomic(p_pathRef, &cf, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
    if (cf) {
      CFRelease(cf);
    }
  }
  objc_copyCppObjectAtomic(&dest, p_pathRef, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  id v4 = (CGPath *)dest;
  if (dest) {
    CFRelease(dest);
  }
  return v4;
}

- (void)createPathWithTransformer:(void *)a3
{
  id v5 = a3;
  if (a2)
  {
    CGMutablePathRef Mutable = CGPathCreateMutable();
    CGMutablePathRef v10 = Mutable;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3321888768;
    v7[2] = __50__CRImageSpacePolyline_createPathWithTransformer___block_invoke;
    v7[3] = &unk_1F38ED670;
    id v8 = v5;
    if (Mutable) {
      CFRetain(Mutable);
    }
    CFTypeRef cf = Mutable;
    [a2 enumeratePoints:v7];
    *a1 = MEMORY[0x1E01BE690](Mutable);
    if (cf) {
      CFRelease(cf);
    }

    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    *a1 = 0;
  }
}

- (unint64_t)pointCount
{
  return (uint64_t)(*((void *)self->__points + 1) - *(void *)self->__points) >> 4;
}

void __50__CRImageSpacePolyline_createPathWithTransformer___block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  uint64_t v7 = *(CGPath **)(a1 + 40);
  if (a2)
  {
    CGPathAddLineToPoint(v7, 0, a3, a4);
  }
  else
  {
    CGPathMoveToPoint(v7, 0, a3, a4);
  }
}

- (NSArray)pointValues
{
  id v3 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CRImageSpacePolyline_pointValues__block_invoke;
  v7[3] = &unk_1E6CDB6B8;
  id v4 = v3;
  id v8 = v4;
  [(CRImageSpacePolyline *)self enumeratePoints:v7];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

  return (NSArray *)v5;
}

void __35__CRImageSpacePolyline_pointValues__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

- (void)enumeratePointsWithTransformer:(void *)a3 block:
{
  id v5 = a2;
  uint64_t v6 = a3;
  if (a1)
  {
    v9 = *(unint64_t ***)(a1 + 8);
    CGMutablePathRef v10 = *v9;
    if (*v9 != v9[1])
    {
      uint64_t v11 = *v9;
      do
      {
        char v12 = 0;
        v7.n128_u64[0] = *v11;
        v8.n128_u64[0] = v11[1];
        if (v5)
        {
          v5[2](v5, v7.n128_f64[0], v8.n128_f64[0]);
          v9 = *(unint64_t ***)(a1 + 8);
        }
        v6[2](v6, ((char *)v10 - (char *)*v9) >> 4, &v12, v7, v8);
        if (v12) {
          break;
        }
        v9 = *(unint64_t ***)(a1 + 8);
        v10 += 2;
        v11 += 2;
      }
      while (v11 != v9[1]);
    }
  }
}

- (void)enumeratePoints:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRImageSpacePolyline *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(CRImageSpacePolyline *)self pointCount];
      if (v6 == [(CRImageSpacePolyline *)v5 pointCount])
      {
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 1;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __32__CRImageSpacePolyline_isEqual___block_invoke;
        v9[3] = &unk_1E6CDB6E0;
        uint64_t v11 = &v13;
        uint64_t v12 = 0x3FE0000000000000;
        CGMutablePathRef v10 = v5;
        [(CRImageSpacePolyline *)self enumeratePoints:v9];
        BOOL v7 = *((unsigned char *)v14 + 24) != 0;

        _Block_object_dispose(&v13, 8);
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

uint64_t __32__CRImageSpacePolyline_isEqual___block_invoke(uint64_t result, unint64_t a2, unsigned char *a3, double a4, double a5)
{
  uint64_t v5 = **(void **)(*(void *)(result + 32) + 8);
  if (a2 >= (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 8) - v5) >> 4) {
    std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
  }
  unint64_t v6 = (double *)(v5 + 16 * a2);
  double v7 = *(double *)(result + 48);
  double v8 = vabdd_f64(a5, v6[1]);
  if (vabdd_f64(a4, *v6) > v7 || v8 > v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (id)simplified
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x4812000000;
  v9 = __Block_byref_object_copy__8;
  CGMutablePathRef v10 = __Block_byref_object_dispose__8;
  uint64_t v11 = &unk_1DD8FDA7A;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  __p = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__CRImageSpacePolyline_simplified__block_invoke;
  v5[3] = &unk_1E6CDB708;
  v5[4] = &v6;
  [(CRImageSpacePolyline *)self enumeratePoints:v5];
  id v2 = [CRImageSpacePolyline alloc];
  id v3 = -[CRImageSpacePolyline initWithPoints:](v2, (uint64_t)(v7 + 6));
  _Block_object_dispose(&v6, 8);
  if (__p)
  {
    uint64_t v13 = __p;
    operator delete(__p);
  }
  return v3;
}

void __34__CRImageSpacePolyline_simplified__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
  double v7 = (void **)(v6 + 6);
  uint64_t v8 = (double *)v6[7];
  if (!a2)
  {
    unint64_t v21 = v6[8];
    if ((unint64_t)v8 >= v21)
    {
      uint64_t v12 = (double *)*v7;
      uint64_t v23 = ((char *)v8 - (unsigned char *)*v7) >> 4;
      unint64_t v24 = v23 + 1;
      if (!((unint64_t)(v23 + 1) >> 60))
      {
        uint64_t v25 = v21 - (void)v12;
        if (v25 >> 3 > v24) {
          unint64_t v24 = v25 >> 3;
        }
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v24;
        }
        if (v26)
        {
          unint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)(v6 + 8), v26);
          uint64_t v12 = (double *)v6[6];
          uint64_t v8 = (double *)v6[7];
        }
        else
        {
          unint64_t v27 = 0;
        }
        v28 = (double *)&v27[16 * v23];
        v29 = &v27[16 * v26];
        double *v28 = a3;
        v28[1] = a4;
        long long v22 = v28 + 2;
        if (v8 == v12) {
          goto LABEL_36;
        }
        do
        {
          *((_OWORD *)v28 - 1) = *((_OWORD *)v8 - 1);
          v28 -= 2;
          v8 -= 2;
        }
        while (v8 != v12);
        goto LABEL_35;
      }
LABEL_40:
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
LABEL_18:
    *uint64_t v8 = a3;
    v8[1] = a4;
    long long v22 = v8 + 2;
LABEL_38:
    v6[7] = v22;
    return;
  }
  double v9 = *(v8 - 2);
  double v10 = *(v8 - 1);
  if (v9 != a3 || v10 != a4)
  {
    uint64_t v12 = (double *)*v7;
    uint64_t v13 = (char *)v8 - (unsigned char *)*v7;
    uint64_t v14 = v13 >> 4;
    if ((unint64_t)v13 >= 0x11)
    {
      uint64_t v15 = &v12[2 * v14];
      if ((a4 - v10) * (a3 - *(v15 - 4)) == (a3 - v9) * (a4 - *(v15 - 3)))
      {
        *(v15 - 2) = a3;
        *(v15 - 1) = a4;
        return;
      }
    }
    unint64_t v16 = v6[8];
    if ((unint64_t)v8 >= v16)
    {
      unint64_t v17 = v14 + 1;
      if (!((unint64_t)(v14 + 1) >> 60))
      {
        uint64_t v18 = v16 - (void)v12;
        if (v18 >> 3 > v17) {
          unint64_t v17 = v18 >> 3;
        }
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v17;
        }
        if (v19)
        {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)(v6 + 8), v19);
          uint64_t v12 = (double *)v6[6];
          uint64_t v8 = (double *)v6[7];
        }
        else
        {
          v20 = 0;
        }
        v28 = (double *)&v20[16 * v14];
        v29 = &v20[16 * v19];
        double *v28 = a3;
        v28[1] = a4;
        long long v22 = v28 + 2;
        if (v8 == v12) {
          goto LABEL_36;
        }
        do
        {
          *((_OWORD *)v28 - 1) = *((_OWORD *)v8 - 1);
          v28 -= 2;
          v8 -= 2;
        }
        while (v8 != v12);
LABEL_35:
        uint64_t v12 = (double *)*v7;
LABEL_36:
        v6[6] = v28;
        v6[7] = v22;
        v6[8] = v29;
        if (v12) {
          operator delete(v12);
        }
        goto LABEL_38;
      }
      goto LABEL_40;
    }
    goto LABEL_18;
  }
}

- (id)rotated180
{
  if (([(CRImageSpacePolyline *)self pointCount] & 1) == 0 && self && (points = self->__points) != 0)
  {
    __p = 0;
    v30 = 0;
    uint64_t v31 = 0;
    std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&__p, *(const void **)points, *((void *)points + 1), (uint64_t)(*((void *)points + 1) - *(void *)points) >> 4);
    id v4 = (long long *)__p;
    unint64_t v5 = [(CRImageSpacePolyline *)self pointCount];
    if (v5 >= 2)
    {
      unint64_t v6 = v5 >> 1;
      double v7 = &v4[v5 >> 1];
      uint64_t v8 = v30;
      if (v7 != v30)
      {
        if (v6 == 1)
        {
          long long v32 = *v4;
          int64_t v9 = (char *)v30 - (char *)v7;
          memmove(v4, v7, (char *)v30 - (char *)v7);
          *(long long *)((char *)v4 + v9) = v32;
        }
        else if (v7 + 1 == v30)
        {
          long long v32 = *(v30 - 1);
          if (v30 - 1 != v4) {
            memmove(v4 + 1, v4, (char *)(v30 - 1) - (char *)v4);
          }
          *id v4 = v32;
        }
        else if (v6 == v30 - v7)
        {
          unint64_t v11 = 0;
          uint64_t v12 = 16 * v6 - 16;
          uint64_t v13 = &v4[v6];
          do
          {
            long long v14 = v4[v11 / 0x10];
            v4[v11 / 0x10] = v13[v11 / 0x10];
            v13[v11 / 0x10] = v14;
            if (v12 == v11) {
              break;
            }
            uint64_t v15 = (uint64_t)&v13[v11 / 0x10 + 1];
            v11 += 16;
          }
          while ((long long *)v15 != v8);
        }
        else
        {
          uint64_t v16 = v30 - v7;
          uint64_t v17 = v5 >> 1;
          do
          {
            uint64_t v18 = v17;
            uint64_t v17 = v16;
            uint64_t v16 = v18 % v16;
          }
          while (v16);
          if (v17)
          {
            unint64_t v19 = &v4[v17];
            do
            {
              long long v20 = *--v19;
              long long v32 = v20;
              unint64_t v21 = &v19[v6];
              long long v22 = v19;
              do
              {
                uint64_t v23 = v21;
                *long long v22 = *v21;
                unint64_t v24 = &v21[v6];
                BOOL v25 = __OFSUB__(v6, v8 - v21);
                uint64_t v27 = v6 - (v8 - v21);
                char v26 = (v27 < 0) ^ v25;
                unint64_t v21 = &v4[v27];
                if (v26) {
                  unint64_t v21 = v24;
                }
                long long v22 = v23;
              }
              while (v21 != v19);
              long long *v23 = v32;
            }
            while (v19 != v4);
          }
        }
      }
    }
    id v10 = -[CRImageSpacePolyline initWithPoints:]([CRImageSpacePolyline alloc], (uint64_t)&__p);
    if (__p)
    {
      v30 = (long long *)__p;
      operator delete(__p);
    }
  }
  else
  {
    id v10 = (id)[(CRImageSpacePolyline *)self copy];
  }
  return v10;
}

- (CGSize)estimatedLineSizeForPairedPointPolygon
{
  uint64_t v42 = 0;
  v43 = (double *)&v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  v39 = (double *)&v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __62__CRImageSpacePolyline_estimatedLineSizeForPairedPointPolygon__block_invoke;
  v37[3] = &unk_1E6CDB730;
  v37[4] = self;
  v37[5] = &v42;
  v37[6] = &v38;
  [(CRImageSpacePolyline *)self enumeratePoints:v37];
  points = (double **)self->__points;
  id v4 = *points;
  if (points[1] == *points
    || (double v5 = *v4,
        double v6 = v4[1],
        unint64_t v7 = [(CRImageSpacePolyline *)self pointCount] - 1,
        v7 >= ((char *)points[1] - (char *)*points) >> 4))
  {
    std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v8 = &(*points)[2 * v7];
  double v9 = *v8;
  double v10 = v8[1];
  unint64_t v11 = (double *)MEMORY[0x1E4F1DB30];
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v14 = self->__points;
  unint64_t v15 = [(CRImageSpacePolyline *)self pointCount] >> 1;
  if (v15 >= (uint64_t)(v14[1] - *v14) >> 4
    || (uint64_t v16 = (double *)(*v14 + 16 * v15),
        double v17 = *v16,
        double v18 = v16[1],
        unint64_t v19 = self->__points,
        unint64_t v20 = ([(CRImageSpacePolyline *)self pointCount] >> 1) - 1,
        v20 >= (uint64_t)(v19[1] - *v19) >> 4))
  {
    std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
  }
  unint64_t v21 = (double *)(*v19 + 16 * v20);
  double v22 = *v21;
  double v23 = v21[1];
  double v24 = *v11;
  if (*v11 > 0.0)
  {
    double v25 = v11[1];
    BOOL v26 = v25 <= 0.0;
    double v27 = v17 * v24;
    double v28 = v18 * v25;
    double v29 = v22 * v24;
    double v30 = v23 * v25;
    if (!v26)
    {
      double v22 = v29;
      double v23 = v30;
      double v17 = v27;
      double v18 = v28;
    }
  }
  if (v12 > 0.0 && v13 > 0.0)
  {
    double v9 = v9 * v12;
    double v10 = v10 * v13;
    double v5 = v5 * v12;
    double v6 = v6 * v13;
  }
  double v31 = sqrt((v18 - v23) * (v18 - v23) + (v17 - v22) * (v17 - v22));
  double v32 = sqrt((v6 - v10) * (v6 - v10) + (v5 - v9) * (v5 - v9));
  double v33 = (v43[3] + v39[3]) * 0.5;
  double v34 = (v31 + v32) * 0.5;
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  double v35 = v33;
  double v36 = v34;
  result.height = v36;
  result.width = v35;
  return result;
}

unint64_t __62__CRImageSpacePolyline_estimatedLineSizeForPairedPointPolygon__block_invoke(unint64_t result, unint64_t a2, double a3, double a4)
{
  if (a2)
  {
    unint64_t v7 = (void *)result;
    CGSize result = [*(id *)(result + 32) pointCount];
    if (a2 != result >> 1)
    {
      uint64_t v8 = (void **)v7[4];
      uint64_t v9 = *v8[1];
      if (a2 - 1 >= (v8[1][1] - v9) >> 4) {
        std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
      }
      double v10 = (double *)(v9 + 16 * (a2 - 1));
      double v11 = *v10;
      double v12 = v10[1];
      double v13 = *MEMORY[0x1E4F1DB30];
      if (*MEMORY[0x1E4F1DB30] > 0.0)
      {
        double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        BOOL v15 = v14 <= 0.0;
        double v16 = a3 * v13;
        double v17 = a4 * v14;
        double v18 = v11 * v13;
        double v19 = v12 * v14;
        if (!v15)
        {
          double v11 = v18;
          double v12 = v19;
          a3 = v16;
          a4 = v17;
        }
      }
      double v20 = sqrt((a4 - v12) * (a4 - v12) + (a3 - v11) * (a3 - v11));
      CGSize result = [v8 pointCount];
      if (a2 >= result >> 1) {
        uint64_t v21 = v7[6];
      }
      else {
        uint64_t v21 = v7[5];
      }
      *(double *)(*(void *)(v21 + 8) + 24) = v20 + *(double *)(*(void *)(v21 + 8) + 24);
    }
  }
  return result;
}

- (CGRect)boundingRect
{
  uint64_t v23 = 0;
  double v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v19 = 0;
  double v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v15 = 0;
  double v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x10000000000000;
  uint64_t v11 = 0;
  double v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x10000000000000;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__CRImageSpacePolyline_boundingRect__block_invoke;
  v10[3] = &unk_1E6CDB758;
  v10[4] = &v23;
  v10[5] = &v19;
  v10[6] = &v15;
  v10[7] = &v11;
  [(CRImageSpacePolyline *)self enumeratePoints:v10];
  double v2 = v24[3];
  double v3 = v20[3];
  double v4 = v16[3] - v2;
  double v5 = v12[3] - v3;
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

void *__36__CRImageSpacePolyline_boundingRect__block_invoke(void *result, double a2, double a3)
{
  uint64_t v3 = *(void *)(result[4] + 8);
  if (a2 < *(double *)(v3 + 24)) {
    *(double *)(v3 + 24) = a2;
  }
  uint64_t v4 = *(void *)(result[5] + 8);
  if (a3 < *(double *)(v4 + 24)) {
    *(double *)(v4 + 24) = a3;
  }
  uint64_t v5 = *(void *)(result[6] + 8);
  if (a2 > *(double *)(v5 + 24)) {
    *(double *)(v5 + 24) = a2;
  }
  uint64_t v6 = *(void *)(result[7] + 8);
  if (a3 > *(double *)(v6 + 24)) {
    *(double *)(v6 + 24) = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CRImageSpacePolyline allocWithZone:a3];
  return [(CRImageSpacePolyline *)v4 initWithPolyline:self];
}

- (id)crCodableDataRepresentation
{
  uint64_t v3 = objc_opt_new();
  +[CRCodingUtilities appendInteger:1 toData:v3];
  +[CRCodingUtilities appendUInteger:(uint64_t)(*((void *)self->__points + 1) - *(void *)self->__points) >> 4 toData:v3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CRImageSpacePolyline_crCodableDataRepresentation__block_invoke;
  v6[3] = &unk_1E6CDB6B8;
  id v4 = v3;
  id v7 = v4;
  [(CRImageSpacePolyline *)self enumeratePoints:v6];

  return v4;
}

uint64_t __51__CRImageSpacePolyline_crCodableDataRepresentation__block_invoke(uint64_t a1)
{
  return +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", *(void *)(a1 + 32));
}

- (CRImageSpacePolyline)initWithCRCodableDataRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  if (+[CRCodingUtilities integerFromEncodingData:v4 offset:&v13] == 1)
  {
    unint64_t v5 = +[CRCodingUtilities unsignedIntegerFromEncodingData:v4 offset:&v13];
    std::vector<CGPoint>::vector(__p, v5);
    if (v5)
    {
      uint64_t v6 = 0;
      do
      {
        +[CRCodingUtilities pointFromEncodingData:v4 offset:&v13];
        id v7 = (char *)__p[0] + v6;
        void *v7 = v8;
        v7[1] = v9;
        v6 += 16;
        --v5;
      }
      while (v5);
    }
    self = (CRImageSpacePolyline *)-[CRImageSpacePolyline initWithPoints:](self, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    double v10 = self;
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  mCFObject = self->__pathRef.mCFObject;
  if (mCFObject) {
    CFRelease(mCFObject);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end