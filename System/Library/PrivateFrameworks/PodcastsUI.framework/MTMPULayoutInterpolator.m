@interface MTMPULayoutInterpolator
- (Point3D)_pointForEntry:(Entry)a3 andPrimaryReferenceMetric:(double)a4 usingFallbackSecondaryReferenceMetric:(double)a5;
- (double)_interpolatedValueForPrimaryReferenceMetric:(double)a3 secondaryReferenceMetric:(double)a4 betweenFirstEntriesContainer:(void *)a5 andSecondEntriesContainer:(void *)a6;
- (double)valueForReferenceMetric:(double)a3;
- (double)valueForReferenceMetric:(double)a3 secondaryReferenceMetric:(double)a4;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (vector<MTMPU::Point3D,)_sortedPointsFor3DInterpolationFromEntriesContainer:(MTMPULayoutInterpolator *)self usingQueriedPoint:(SEL)a3 fallbackSecondaryReferenceMetric:(void *)a4;
- (void)_sortPointsFor3DInterpolation:(double *)a3 usingQueriedPoint:(uint64_t)a4;
- (void)_sortPointsFor3DInterpolation:(void *)a3 usingQueriedPoint:(Point3D)a4;
- (void)addValue:(double)a3 forReferenceMetric:(double)a4;
- (void)addValue:(double)a3 forReferenceMetric:(double)a4 secondaryReferenceMetric:(double)a5;
@end

@implementation MTMPULayoutInterpolator

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  begin = self->_entriesContainers.__begin_;
  end = self->_entriesContainers.__end_;
  if (begin == end)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    do
    {
      v9 += MTMPU::LayoutInterpolator::EntriesContainer::entriesCount((MTMPU::LayoutInterpolator::EntriesContainer *)begin);
      begin = (EntriesContainer *)((char *)begin + 32);
    }
    while (begin != end);
  }
  objc_msgSend(v6, "appendFormat:", @"; entries (%ld) = [", v9);
  v10 = self->_entriesContainers.__begin_;
  v11 = self->_entriesContainers.__end_;
  if (v10 != v11)
  {
    char v12 = 0;
    do
    {
      double v13 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MTMPU::LayoutInterpolator::EntriesContainer *)v10);
      MTMPU::LayoutInterpolator::EntriesContainer::copyEntriesVector((MTMPU::LayoutInterpolator::EntriesContainer *)v10, &v19);
      v14 = v19;
      v15 = v20;
      if (v19 != v20)
      {
        do
        {
          double v16 = *v14;
          uint64_t v17 = *((void *)v14 + 1);
          objc_msgSend(v6, "appendFormat:", @"\n    (referenceMetric: %f"), *(void *)&v13;
          if (!MTMPUFloatEqualToFloat(v16, -1.13427449e38)) {
            [v6 appendFormat:@", secondaryReferenceMetric: %f", *(void *)&v16];
          }
          [v6 appendFormat:@", value: %f, "], v17);
          v14 += 2;
        }
        while (v14 != v15);
        char v12 = 1;
        v14 = v19;
      }
      if (v14)
      {
        v20 = v14;
        operator delete(v14);
      }
      v10 = (EntriesContainer *)((char *)v10 + 32);
    }
    while (v10 != v11);
    if (v12) {
      [v6 appendString:@"\n"];
    }
  }
  [v6 appendString:@"]"];
  [v6 appendString:@">"];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (MTMPULayoutInterpolator *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    if (v4 != self) {
      std::vector<MTMPU::LayoutInterpolator::EntriesContainer>::__assign_with_size[abi:ne180100]<MTMPU::LayoutInterpolator::EntriesContainer*,MTMPU::LayoutInterpolator::EntriesContainer*>((uint64_t)&v4->_entriesContainers, (uint64_t)self->_entriesContainers.__begin_, (uint64_t)self->_entriesContainers.__end_, (self->_entriesContainers.__end_ - self->_entriesContainers.__begin_) >> 5);
    }
    v5->_hasEntryWithSpecificSecondaryReferenceMetric = self->_hasEntryWithSpecificSecondaryReferenceMetric;
  }
  return v5;
}

- (void)addValue:(double)a3 forReferenceMetric:(double)a4
{
}

- (void)addValue:(double)a3 forReferenceMetric:(double)a4 secondaryReferenceMetric:(double)a5
{
  MTMPU::LayoutInterpolator::EntriesContainer::EntriesContainer((uint64_t)v24, a4);
  begin = self->_entriesContainers.__begin_;
  end = self->_entriesContainers.__end_;
  if (end != begin)
  {
    unint64_t v10 = (end - begin) >> 5;
    do
    {
      v11 = (MTMPU::LayoutInterpolator::EntriesContainer *)((char *)begin + 32 * (v10 >> 1));
      double v12 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric(v11);
      double v13 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MTMPU::LayoutInterpolator::EntriesContainer *)v24);
      if (v12 >= v13) {
        v10 >>= 1;
      }
      else {
        v10 += ~(v10 >> 1);
      }
      if (v12 < v13) {
        begin = (EntriesContainer *)((char *)v11 + 32);
      }
    }
    while (v10);
    end = begin;
  }
  int v21 = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  if (self->_entriesContainers.__end_ == end
    || (double v14 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MTMPU::LayoutInterpolator::EntriesContainer *)end),
        double v15 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MTMPU::LayoutInterpolator::EntriesContainer *)v24),
        !MTMPUFloatEqualToFloat(v14, v15)))
  {
    v26.var0 = a5;
    v26.var1 = a3;
    MTMPU::LayoutInterpolator::EntriesContainer::insertEntry((MTMPU::LayoutInterpolator::EntriesContainer *)v24, v26, (uint64_t)&v18);
    int v21 = v18;
    if (SHIBYTE(v23) < 0) {
      operator delete((void *)__p);
    }
    long long __p = v19;
    uint64_t v23 = v20;
    std::vector<MTMPU::LayoutInterpolator::EntriesContainer>::insert((uint64_t *)&self->_entriesContainers, (uint64_t)end, (unint64_t)v24);
  }
  else
  {
    v25.var0 = a5;
    v25.var1 = a3;
    MTMPU::LayoutInterpolator::EntriesContainer::insertEntry((MTMPU::LayoutInterpolator::EntriesContainer *)end, v25, (uint64_t)&v18);
    int v21 = v18;
    if (SHIBYTE(v23) < 0) {
      operator delete((void *)__p);
    }
    long long __p = v19;
    uint64_t v23 = v20;
  }
  if ((v21 - 2) >= 3)
  {
    if (v21 == 1)
    {
      if (v23 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = (long long *)__p;
      }
      NSLog(&cfstr_S.isa, p_p);
    }
    else if (!v21 {
           && !self->_hasEntryWithSpecificSecondaryReferenceMetric
    }
           && !MTMPUFloatEqualToFloat(a5, -1.13427449e38))
    {
      self->_hasEntryWithSpecificSecondaryReferenceMetric = 1;
    }
  }
  else
  {
    if (v23 >= 0) {
      double v16 = &__p;
    }
    else {
      double v16 = (long long *)__p;
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s", v16);
  }
  if (SHIBYTE(v23) < 0) {
    operator delete((void *)__p);
  }
  if (v24[0])
  {
    v24[1] = v24[0];
    operator delete(v24[0]);
  }
}

- (double)valueForReferenceMetric:(double)a3
{
  [(MTMPULayoutInterpolator *)self valueForReferenceMetric:a3 secondaryReferenceMetric:-1.13427449e38];
  return result;
}

- (double)valueForReferenceMetric:(double)a3 secondaryReferenceMetric:(double)a4
{
  begin = self->_entriesContainers.__begin_;
  end = self->_entriesContainers.__end_;
  int64_t v8 = end - begin;
  if (end == begin)
  {
    long long v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v20);
    int v21 = NSStringFromSelector(a2);
    v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    v24 = NSStringFromSelector(sel_addValue_forReferenceMetric_);
    [v19 raise:*MEMORY[0x1E4F1C3C8], @"Can't call -[%@ %@] before calling -[%@ %@] at least once.", v13, v21, v23, v24 format];

    goto LABEL_10;
  }
  if (self->_hasEntryWithSpecificSecondaryReferenceMetric && MTMPUFloatEqualToFloat(a4, -1.13427449e38))
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    double v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    double v14 = (objc_class *)objc_opt_class();
    double v15 = NSStringFromClass(v14);
    double v16 = NSStringFromSelector(a2);
    [v11 raise:*MEMORY[0x1E4F1C3C8], @"Can't call -[%@ valueForReferenceMetric:] without a valid secondary reference metric. Please use -[%@ %@] with a valid last argument.", v13, v15, v16 format];

LABEL_10:
    return 0.0;
  }
  if (v8 != 32)
  {
    MTMPU::LayoutInterpolator::EntriesContainer::EntriesContainer((uint64_t)__p, a3);
    Entry v26 = self->_entriesContainers.__begin_;
    uint64_t v27 = self->_entriesContainers.__end_ - v26;
    if (v27)
    {
      unint64_t v28 = v27 >> 5;
      do
      {
        v29 = (MTMPU::LayoutInterpolator::EntriesContainer *)((char *)v26 + 32 * (v28 >> 1));
        double v30 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric(v29);
        double v31 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MTMPU::LayoutInterpolator::EntriesContainer *)__p);
        if (v30 >= v31) {
          v28 >>= 1;
        }
        else {
          v28 += ~(v28 >> 1);
        }
        if (v30 < v31) {
          Entry v26 = (EntriesContainer *)((char *)v29 + 32);
        }
      }
      while (v28);
      if (v26 != self->_entriesContainers.__end_)
      {
        double v32 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MTMPU::LayoutInterpolator::EntriesContainer *)v26);
        double v33 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MTMPU::LayoutInterpolator::EntriesContainer *)__p);
        if (MTMPUFloatEqualToFloat(v32, v33))
        {
          double v34 = MTMPU::LayoutInterpolator::EntriesContainer::valueForSecondaryReferenceMetric((double **)v26, a4);
        }
        else if (v26 == self->_entriesContainers.__begin_)
        {
          [(MTMPULayoutInterpolator *)self _interpolatedValueForPrimaryReferenceMetric:v26 secondaryReferenceMetric:(char *)v26 + 32 betweenFirstEntriesContainer:a3 andSecondEntriesContainer:a4];
        }
        else
        {
          [(MTMPULayoutInterpolator *)self _interpolatedValueForPrimaryReferenceMetric:(char *)v26 - 32 secondaryReferenceMetric:v26 betweenFirstEntriesContainer:a3 andSecondEntriesContainer:a4];
        }
LABEL_25:
        double v25 = v34;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        return v25;
      }
      Entry v26 = self->_entriesContainers.__end_;
    }
    [(MTMPULayoutInterpolator *)self _interpolatedValueForPrimaryReferenceMetric:(char *)v26 - 64 secondaryReferenceMetric:(char *)v26 - 32 betweenFirstEntriesContainer:a3 andSecondEntriesContainer:a4];
    goto LABEL_25;
  }
  uint64_t v17 = (double **)self->_entriesContainers.__begin_;

  return MTMPU::LayoutInterpolator::EntriesContainer::valueForSecondaryReferenceMetric(v17, a4);
}

- (double)_interpolatedValueForPrimaryReferenceMetric:(double)a3 secondaryReferenceMetric:(double)a4 betweenFirstEntriesContainer:(void *)a5 andSecondEntriesContainer:(void *)a6
{
  uint64_t v11 = MTMPU::LayoutInterpolator::EntriesContainer::entriesCount((MTMPU::LayoutInterpolator::EntriesContainer *)a5);
  uint64_t v12 = MTMPU::LayoutInterpolator::EntriesContainer::entriesCount((MTMPU::LayoutInterpolator::EntriesContainer *)a6);
  if (v11 == 1 && v12 == 1)
  {
    MTMPU::LayoutInterpolator::EntriesContainer::copyEntriesVector((MTMPU::LayoutInterpolator::EntriesContainer *)a5, &v62);
    double v13 = *(double *)(v62 + 8);
    double v14 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MTMPU::LayoutInterpolator::EntriesContainer *)a5);
    MTMPU::LayoutInterpolator::EntriesContainer::copyEntriesVector((MTMPU::LayoutInterpolator::EntriesContainer *)a6, &__p);
    double v15 = *((double *)__p + 1);
    double v16 = MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MTMPU::LayoutInterpolator::EntriesContainer *)a6);
    double v17 = MTMPULayoutLinearRelationMake(v14, v13, v16, v15);
    double v19 = MTMPULayoutLinearRelationEvaluate(v17, v18, a3);
    if (*(double *)&__p != 0.0)
    {
      v60 = __p;
      operator delete(__p);
    }
    uint64_t v20 = (void *)v62;
    if ((void)v62)
    {
      *((void *)&v62 + 1) = v62;
LABEL_46:
      operator delete(v20);
    }
  }
  else
  {
    double v19 = 0.0;
    MTMPU::Point3D::Point3D((double *)&__p, a3, a4, 0.0);
    -[MTMPULayoutInterpolator _sortedPointsFor3DInterpolationFromEntriesContainer:usingQueriedPoint:fallbackSecondaryReferenceMetric:](self, "_sortedPointsFor3DInterpolationFromEntriesContainer:usingQueriedPoint:fallbackSecondaryReferenceMetric:", a5, *(double *)&__p, *(double *)&v60, v61, a4);
    -[MTMPULayoutInterpolator _sortedPointsFor3DInterpolationFromEntriesContainer:usingQueriedPoint:fallbackSecondaryReferenceMetric:](self, "_sortedPointsFor3DInterpolationFromEntriesContainer:usingQueriedPoint:fallbackSecondaryReferenceMetric:", a6, *(double *)&__p, *(double *)&v60, v61, a4);
    __src = 0;
    v53 = 0;
    uint64_t v54 = 0;
    v29 = (char *)v57;
    double v30 = (char *)v55;
    do
    {
      v49 = 0;
      v50 = 0;
      uint64_t v51 = 0;
      if (v58 != v29)
      {
        uint64_t v31 = 0;
        do
        {
          long long v32 = *(_OWORD *)&v29[v31];
          uint64_t v63 = *(void *)&v29[v31 + 16];
          long long v62 = v32;
          std::vector<MTMPU::Point3D>::insert((uint64_t)&__src, (char *)__src, (unint64_t)&v62);
          std::vector<MTMPU::Point3D>::insert((uint64_t)&v49, (char *)v49, (unint64_t)&v62);
          v31 += 24;
        }
        while (v31 != 48 && &v29[v31] != v58);
      }
      v46 = 0;
      v47 = 0;
      uint64_t v48 = 0;
      if (v56 != v30)
      {
        uint64_t v33 = 0;
        do
        {
          long long v34 = *(_OWORD *)&v30[v33];
          uint64_t v63 = *(void *)&v30[v33 + 16];
          long long v62 = v34;
          std::vector<MTMPU::Point3D>::insert((uint64_t)&__src, (char *)__src, (unint64_t)&v62);
          std::vector<MTMPU::Point3D>::insert((uint64_t)&v46, (char *)v46, (unint64_t)&v62);
          v33 += 24;
        }
        while (v33 != 48 && &v30[v33] != v56);
      }
      v35 = (char *)__src;
      if (0xAAAAAAAAAAAAAAABLL * ((v53 - (unsigned char *)__src) >> 3) >= 3)
      {
        if (v53 - (unsigned char *)__src != 72) {
          -[MTMPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:](self, "_sortPointsFor3DInterpolation:usingQueriedPoint:", &__src, *(double *)&__p, *(double *)&v60, v61);
        }
        double v44 = 0.0;
        double v45 = 0.0;
        double v43 = 0.0;
        BOOL v37 = MTMPU::Point3D::resolveEquationOfPlaneDefinedByFirstThreePointsInVector((double **)&__src, &v45, &v44, &v43, *(double *)&v21, v22, *(double *)&v23, v24, v25, v26, v27, v28);
        char v36 = v37;
        if (v37)
        {
          uint64_t v23 = __p;
          double v24 = *(double *)&v60;
          *(double *)&long long v21 = v44 * *(double *)&v60 + v45 * *(double *)&__p;
          double v22 = v43;
          double v19 = v43 + *(double *)&v21;
          v35 = (char *)__src;
        }
        else
        {
          uint64_t v38 = 0;
          v35 = (char *)__src;
          v39 = v50;
          v40 = (char *)__src;
          do
          {
            long long v21 = *(_OWORD *)v40;
            uint64_t v63 = *((void *)v40 + 2);
            long long v62 = v21;
            v41 = (double *)v49;
            if (v49 == v39)
            {
              v41 = v39;
            }
            else
            {
              while (!MTMPU::Point3D::operator==(v41, (double *)&v62))
              {
                v41 += 3;
                if (v41 == v39)
                {
                  v41 = v39;
                  break;
                }
              }
              v39 = v50;
              v35 = (char *)__src;
            }
            if (v41 != v39) {
              ++v38;
            }
            v40 += 24;
          }
          while (v40 != v35 + 72);
          if (v38 == 2) {
            v29 += 24;
          }
          else {
            v30 += 24;
          }
        }
      }
      else
      {
        char v36 = 1;
      }
      v53 = v35;
      if (v46)
      {
        v47 = v46;
        operator delete(v46);
      }
      if (v49)
      {
        v50 = (double *)v49;
        operator delete(v49);
      }
    }
    while ((v36 & 1) == 0);
    if (__src)
    {
      v53 = __src;
      operator delete(__src);
    }
    if (v55)
    {
      v56 = (char *)v55;
      operator delete(v55);
    }
    uint64_t v20 = v57;
    if (v57)
    {
      v58 = (char *)v57;
      goto LABEL_46;
    }
  }
  return v19;
}

- (Point3D)_pointForEntry:(Entry)a3 andPrimaryReferenceMetric:(double)a4 usingFallbackSecondaryReferenceMetric:(double)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (MTMPUFloatEqualToFloat(a3.var0, -1.13427449e38)) {
    double v9 = a5;
  }
  else {
    double v9 = var0;
  }
  MTMPU::Point3D::Point3D(v13, a4, v9, var1);
  double v10 = v13[0];
  double v11 = v13[1];
  double v12 = v13[2];
  result.var2 = v12;
  result.double var1 = v11;
  result.double var0 = v10;
  return result;
}

- (vector<MTMPU::Point3D,)_sortedPointsFor3DInterpolationFromEntriesContainer:(MTMPULayoutInterpolator *)self usingQueriedPoint:(SEL)a3 fallbackSecondaryReferenceMetric:(void *)a4
{
  double var2 = a5.var2;
  double var1 = a5.var1;
  double var0 = a5.var0;
  retstr->double var0 = 0;
  retstr->double var1 = 0;
  retstr->var2.double var0 = 0;
  MTMPU::LayoutInterpolator::EntriesContainer::copyEntriesVector((MTMPU::LayoutInterpolator::EntriesContainer *)a4, &__p);
  double v13 = (double *)__p;
  double v14 = v21;
  while (v13 != v14)
  {
    -[MTMPULayoutInterpolator _pointForEntry:andPrimaryReferenceMetric:usingFallbackSecondaryReferenceMetric:](self, "_pointForEntry:andPrimaryReferenceMetric:usingFallbackSecondaryReferenceMetric:", *v13, v13[1], MTMPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MTMPU::LayoutInterpolator::EntriesContainer *)a4), a6);
    v19[0] = v15;
    v19[1] = v16;
    v19[2] = v17;
    std::vector<MTMPU::Point3D>::insert((uint64_t)retstr, (char *)retstr->var0, (unint64_t)v19);
    v13 += 2;
  }
  -[MTMPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:](self, "_sortPointsFor3DInterpolation:usingQueriedPoint:", retstr, var0, var1, var2);
  Point3D result = (vector<MTMPU::Point3D, std::allocator<MTMPU::Point3D>> *)__p;
  if (__p)
  {
    long long v21 = (double *)__p;
    operator delete(__p);
  }
  return result;
}

- (void)_sortPointsFor3DInterpolation:(void *)a3 usingQueriedPoint:(Point3D)a4
{
  unint64_t v4 = *(void *)a3;
  unint64_t v5 = *((void *)a3 + 1);
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *(void *)a3) >> 3);
  if (v6 >= 2)
  {
    Point3D v9 = a4;
    unint64_t v7 = 126 - 2 * __clz(v6);
    if (v5 == v4) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v7;
    }
    std::__introsort<std::_ClassicAlgPolicy,-[MTMPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_2 &,MTMPU::Point3D *,false>(v4, v5, &v9.var0, v8, 1);
  }
}

- (void).cxx_destruct
{
  p_entriesContainers = &self->_entriesContainers;
  std::vector<MTMPU::LayoutInterpolator::EntriesContainer>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_entriesContainers);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void)_sortPointsFor3DInterpolation:(double *)a3 usingQueriedPoint:(uint64_t)a4
{
  while (2)
  {
    unint64_t v12 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v12;
          uint64_t v13 = a2 - v12;
          unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - v12) >> 3);
          if (v6 || !v5)
          {
            switch(v14)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                double v63 = *(double *)(a2 - 24);
                double v64 = *(double *)(a2 - 16);
                unint64_t v62 = a2 - 24;
                double v65 = a3[1];
                if ((v65 - v64) * (v65 - v64) + (*a3 - v63) * (*a3 - v63) < (v65 - *(double *)(v12 + 8))
                                                                           * (v65 - *(double *)(v12 + 8))
                                                                           + (*a3 - *(double *)v12)
                                                                           * (*a3 - *(double *)v12))
                {
                  uint64_t v131 = *(void *)(v12 + 16);
                  long long v126 = *(_OWORD *)v12;
                  long long v66 = *(_OWORD *)v62;
                  *(void *)(v12 + 16) = *(void *)(v62 + 16);
                  *(_OWORD *)unint64_t v12 = v66;
                  *(void *)(v62 + 16) = v131;
                  *(_OWORD *)unint64_t v62 = v126;
                }
                break;
              case 3uLL:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MTMPULayoutInterpolator *)(long long *)v12 _sortPointsFor3DInterpolation:(double *)(a2 - 24) usingQueriedPoint:a3];
                break;
              case 4uLL:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MTMPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_2 &,MTMPU::Point3D *>(v12, v12 + 24, v12 + 48, a2 - 24, a3);
                break;
              case 5uLL:
                std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[MTMPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_2 &,MTMPU::Point3D *,0>((__n128 *)v12, (__n128 *)(v12 + 24), (__n128 *)(v12 + 48), (__n128 *)(v12 + 72), (__n128 *)(a2 - 24), a3);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v13 <= 575)
          {
            if (a5)
            {
              if (v12 != a2)
              {
                unint64_t v67 = v12 + 24;
                if (v12 + 24 != a2)
                {
                  uint64_t v68 = 0;
                  double v69 = *a3;
                  unint64_t v70 = v12;
                  do
                  {
                    unint64_t v71 = v67;
                    double v72 = *(double *)(v70 + 24);
                    double v73 = *(double *)(v70 + 32);
                    if ((a3[1] - v73) * (a3[1] - v73) + (v69 - v72) * (v69 - v72) < (a3[1] - *(double *)(v70 + 8))
                                                                                   * (a3[1] - *(double *)(v70 + 8))
                                                                                   + (v69 - *(double *)v70)
                                                                                   * (v69 - *(double *)v70))
                    {
                      uint64_t v74 = *(void *)(v70 + 40);
                      uint64_t v75 = v68;
                      while (1)
                      {
                        uint64_t v76 = v12 + v75;
                        *(_OWORD *)(v76 + 24) = *(_OWORD *)(v12 + v75);
                        *(void *)(v76 + 40) = *(void *)(v12 + v75 + 16);
                        if (!v75) {
                          break;
                        }
                        double v77 = a3[1];
                        v75 -= 24;
                        if ((v77 - v73) * (v77 - v73) + (*a3 - v72) * (*a3 - v72) >= (v77 - *(double *)(v76 - 16))
                                                                                    * (v77 - *(double *)(v76 - 16))
                                                                                    + (*a3 - *(double *)(v76 - 24))
                                                                                    * (*a3 - *(double *)(v76 - 24)))
                        {
                          uint64_t v78 = v12 + v75 + 24;
                          goto LABEL_74;
                        }
                      }
                      uint64_t v78 = v12;
LABEL_74:
                      *(double *)uint64_t v78 = v72;
                      *(double *)(v78 + 8) = v73;
                      *(void *)(v78 + 16) = v74;
                      double v69 = *a3;
                    }
                    unint64_t v67 = v71 + 24;
                    v68 += 24;
                    unint64_t v70 = v71;
                  }
                  while (v71 + 24 != a2);
                }
              }
            }
            else if (v12 != a2)
            {
              unint64_t v115 = v12 + 24;
              if (v12 + 24 != a2)
              {
                double v116 = *a3;
                do
                {
                  unint64_t v117 = v115;
                  double v118 = *(double *)(a1 + 24);
                  double v119 = *(double *)(a1 + 32);
                  if ((a3[1] - v119) * (a3[1] - v119) + (v116 - v118) * (v116 - v118) < (a3[1] - *(double *)(a1 + 8))
                                                                                       * (a3[1] - *(double *)(a1 + 8))
                                                                                       + (v116 - *(double *)a1)
                                                                                       * (v116 - *(double *)a1))
                  {
                    uint64_t v120 = *(void *)(a1 + 40);
                    do
                    {
                      *(_OWORD *)unint64_t v115 = *(_OWORD *)(v115 - 24);
                      *(void *)(v115 + 16) = *(void *)(v115 - 8);
                      double v121 = *(double *)(v115 - 48);
                      double v122 = *(double *)(v115 - 40);
                      v115 -= 24;
                    }
                    while ((a3[1] - v119) * (a3[1] - v119) + (*a3 - v118) * (*a3 - v118) < (a3[1] - v122)
                                                                                          * (a3[1] - v122)
                                                                                          + (*a3 - v121) * (*a3 - v121));
                    *(double *)unint64_t v115 = v118;
                    *(double *)(v115 + 8) = v119;
                    *(void *)(v115 + 16) = v120;
                    double v116 = *a3;
                  }
                  unint64_t v115 = v117 + 24;
                  a1 = v117;
                }
                while (v117 + 24 != a2);
              }
            }
            return;
          }
          if (!a4)
          {
            if (v12 != a2)
            {
              int64_t v79 = (v14 - 2) >> 1;
              int64_t v80 = v79;
              do
              {
                int64_t v81 = v80;
                if (v79 >= v80)
                {
                  uint64_t v82 = (2 * v80) | 1;
                  unint64_t v83 = v12 + 24 * v82;
                  double v84 = *a3;
                  if (2 * v81 + 2 < (uint64_t)v14)
                  {
                    double v85 = a3[1];
                    if ((v85 - *(double *)(v83 + 8)) * (v85 - *(double *)(v83 + 8))
                       + (v84 - *(double *)v83) * (v84 - *(double *)v83) < (v85 - *(double *)(v83 + 32))
                                                                         * (v85 - *(double *)(v83 + 32))
                                                                         + (v84 - *(double *)(v83 + 24))
                                                                         * (v84 - *(double *)(v83 + 24)))
                    {
                      v83 += 24;
                      uint64_t v82 = 2 * v81 + 2;
                    }
                  }
                  else
                  {
                    double v85 = a3[1];
                  }
                  unint64_t v86 = v12 + 24 * v81;
                  double v87 = *(double *)v86;
                  long long v88 = *(_OWORD *)(v86 + 8);
                  if ((v85 - *(double *)(v83 + 8)) * (v85 - *(double *)(v83 + 8))
                     + (v84 - *(double *)v83) * (v84 - *(double *)v83) >= (v85 - *(double *)&v88)
                                                                        * (v85 - *(double *)&v88)
                                                                        + (v84 - *(double *)v86)
                                                                        * (v84 - *(double *)v86))
                  {
                    do
                    {
                      unint64_t v89 = v83;
                      long long v90 = *(_OWORD *)v83;
                      *(void *)(v86 + 16) = *(void *)(v83 + 16);
                      *(_OWORD *)unint64_t v86 = v90;
                      if (v79 < v82) {
                        break;
                      }
                      uint64_t v91 = 2 * v82;
                      uint64_t v82 = (2 * v82) | 1;
                      unint64_t v83 = v12 + 24 * v82;
                      uint64_t v92 = v91 + 2;
                      double v93 = *a3;
                      double v94 = a3[1];
                      if (v92 < (uint64_t)v14
                        && (v94 - *(double *)(v83 + 8)) * (v94 - *(double *)(v83 + 8))
                         + (v93 - *(double *)v83) * (v93 - *(double *)v83) < (v94 - *(double *)(v83 + 32))
                                                                           * (v94 - *(double *)(v83 + 32))
                                                                           + (v93 - *(double *)(v83 + 24))
                                                                           * (v93 - *(double *)(v83 + 24)))
                      {
                        v83 += 24;
                        uint64_t v82 = v92;
                      }
                      unint64_t v86 = v89;
                    }
                    while ((v94 - *(double *)(v83 + 8)) * (v94 - *(double *)(v83 + 8))
                          + (v93 - *(double *)v83) * (v93 - *(double *)v83) >= (v94 - *(double *)&v88)
                                                                             * (v94 - *(double *)&v88)
                                                                             + (v93 - v87) * (v93 - v87));
                    *(double *)unint64_t v89 = v87;
                    *(_OWORD *)(v89 + 8) = v88;
                  }
                }
                int64_t v80 = v81 - 1;
              }
              while (v81);
              int64_t v95 = v13 / 0x18uLL;
              do
              {
                uint64_t v96 = 0;
                uint64_t v132 = *(void *)(v12 + 16);
                long long v127 = *(_OWORD *)v12;
                unint64_t v97 = v12;
                do
                {
                  unint64_t v98 = v97;
                  v97 += 24 * v96 + 24;
                  uint64_t v99 = 2 * v96;
                  uint64_t v96 = (2 * v96) | 1;
                  int64_t v100 = v99 + 2;
                  if (v100 < v95)
                  {
                    double v101 = a3[1];
                    if ((v101 - *(double *)(v97 + 8)) * (v101 - *(double *)(v97 + 8))
                       + (*a3 - *(double *)v97) * (*a3 - *(double *)v97) < (v101 - *(double *)(v97 + 32))
                                                                         * (v101 - *(double *)(v97 + 32))
                                                                         + (*a3 - *(double *)(v97 + 24))
                                                                         * (*a3 - *(double *)(v97 + 24)))
                    {
                      v97 += 24;
                      uint64_t v96 = v100;
                    }
                  }
                  long long v102 = *(_OWORD *)v97;
                  *(void *)(v98 + 16) = *(void *)(v97 + 16);
                  *(_OWORD *)unint64_t v98 = v102;
                }
                while (v96 <= (uint64_t)((unint64_t)(v95 - 2) >> 1));
                a2 -= 24;
                if (v97 == a2)
                {
                  *(void *)(v97 + 16) = v132;
                  *(_OWORD *)unint64_t v97 = v127;
                }
                else
                {
                  long long v103 = *(_OWORD *)a2;
                  *(void *)(v97 + 16) = *(void *)(a2 + 16);
                  *(_OWORD *)unint64_t v97 = v103;
                  *(void *)(a2 + 16) = v132;
                  *(_OWORD *)a2 = v127;
                  uint64_t v104 = v97 - v12 + 24;
                  if (v104 >= 25)
                  {
                    unint64_t v105 = (v104 / 0x18uLL - 2) >> 1;
                    unint64_t v106 = v12 + 24 * v105;
                    double v107 = *(double *)v97;
                    double v108 = *(double *)(v97 + 8);
                    double v109 = a3[1];
                    if ((v109 - *(double *)(v106 + 8)) * (v109 - *(double *)(v106 + 8))
                       + (*a3 - *(double *)v106) * (*a3 - *(double *)v106) < (v109 - v108) * (v109 - v108)
                                                                           + (*a3 - *(double *)v97)
                                                                           * (*a3 - *(double *)v97))
                    {
                      uint64_t v110 = *(void *)(v97 + 16);
                      do
                      {
                        unint64_t v111 = v106;
                        long long v112 = *(_OWORD *)v106;
                        *(void *)(v97 + 16) = *(void *)(v106 + 16);
                        *(_OWORD *)unint64_t v97 = v112;
                        if (!v105) {
                          break;
                        }
                        unint64_t v105 = (v105 - 1) >> 1;
                        unint64_t v106 = v12 + 24 * v105;
                        double v113 = a3[1];
                        unint64_t v97 = v111;
                      }
                      while ((v113 - *(double *)(v106 + 8)) * (v113 - *(double *)(v106 + 8))
                            + (*a3 - *(double *)v106) * (*a3 - *(double *)v106) < (v113 - v108) * (v113 - v108)
                                                                                + (*a3 - v107) * (*a3 - v107));
                      *(double *)unint64_t v111 = v107;
                      *(double *)(v111 + 8) = v108;
                      *(void *)(v111 + 16) = v110;
                    }
                  }
                }
              }
              while (v95-- > 2);
            }
            return;
          }
          unint64_t v15 = v14 >> 1;
          unint64_t v16 = v12 + 24 * (v14 >> 1);
          if ((unint64_t)v13 >= 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MTMPULayoutInterpolator *)(long long *)a1 _sortPointsFor3DInterpolation:(double *)(a2 - 24) usingQueriedPoint:a3];
            uint64_t v17 = 3 * v15;
            double v18 = (double *)(a1 + 24 * v15 - 24);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MTMPULayoutInterpolator *)(long long *)(a1 + 24) _sortPointsFor3DInterpolation:(double *)(a2 - 48) usingQueriedPoint:a3];
            double v19 = (double *)(a1 + 24 + 8 * v17);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MTMPULayoutInterpolator *)(long long *)(a1 + 48) _sortPointsFor3DInterpolation:(double *)(a2 - 72) usingQueriedPoint:a3];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MTMPULayoutInterpolator *)(long long *)v18 _sortPointsFor3DInterpolation:v19 usingQueriedPoint:a3];
            uint64_t v128 = *(void *)(a1 + 16);
            long long v123 = *(_OWORD *)a1;
            uint64_t v20 = *(void *)(v16 + 16);
            *(_OWORD *)a1 = *(_OWORD *)v16;
            *(void *)(a1 + 16) = v20;
            *(void *)(v16 + 16) = v128;
            *(_OWORD *)unint64_t v16 = v123;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MTMPULayoutInterpolator *)(long long *)(a1 + 24 * (v14 >> 1)) _sortPointsFor3DInterpolation:(double *)(a2 - 24) usingQueriedPoint:a3];
          }
          --a4;
          double v21 = *(double *)a1;
          if (a5) {
            break;
          }
          double v23 = *(double *)(a1 + 8);
          uint64_t v22 = *(void *)(a1 + 16);
          double v24 = *a3;
          double v25 = a3[1];
          double v26 = (v25 - v23) * (v25 - v23) + (*a3 - v21) * (*a3 - v21);
          if ((v25 - *(double *)(a1 - 16)) * (v25 - *(double *)(a1 - 16))
             + (*a3 - *(double *)(a1 - 24)) * (*a3 - *(double *)(a1 - 24)) < v26)
            goto LABEL_12;
          if (v26 >= (v25 - *(double *)(a2 - 16)) * (v25 - *(double *)(a2 - 16))
                    + (v24 - *(double *)(a2 - 24)) * (v24 - *(double *)(a2 - 24)))
          {
            uint64_t v48 = (double *)(a1 + 24);
            do
            {
              unint64_t v12 = (unint64_t)v48;
              if ((unint64_t)v48 >= a2) {
                break;
              }
              double v49 = (v25 - v48[1]) * (v25 - v48[1]) + (v24 - *v48) * (v24 - *v48);
              v48 += 3;
            }
            while (v26 >= v49);
          }
          else
          {
            unint64_t v12 = a1;
            do
            {
              double v46 = *(double *)(v12 + 24);
              double v47 = *(double *)(v12 + 32);
              v12 += 24;
            }
            while (v26 >= (v25 - v47) * (v25 - v47) + (v24 - v46) * (v24 - v46));
          }
          unint64_t v50 = a2;
          if (v12 < a2)
          {
            unint64_t v50 = a2;
            do
            {
              double v51 = *(double *)(v50 - 24);
              double v52 = *(double *)(v50 - 16);
              v50 -= 24;
            }
            while (v26 < (v25 - v52) * (v25 - v52) + (v24 - v51) * (v24 - v51));
          }
          while (v12 < v50)
          {
            uint64_t v130 = *(void *)(v12 + 16);
            long long v125 = *(_OWORD *)v12;
            long long v53 = *(_OWORD *)v50;
            *(void *)(v12 + 16) = *(void *)(v50 + 16);
            *(_OWORD *)unint64_t v12 = v53;
            *(void *)(v50 + 16) = v130;
            *(_OWORD *)unint64_t v50 = v125;
            double v54 = *a3;
            double v55 = a3[1];
            double v56 = (v55 - v23) * (v55 - v23) + (*a3 - v21) * (*a3 - v21);
            do
            {
              double v57 = *(double *)(v12 + 24);
              double v58 = *(double *)(v12 + 32);
              v12 += 24;
            }
            while (v56 >= (v55 - v58) * (v55 - v58) + (v54 - v57) * (v54 - v57));
            do
            {
              double v59 = *(double *)(v50 - 24);
              double v60 = *(double *)(v50 - 16);
              v50 -= 24;
            }
            while (v56 < (v55 - v60) * (v55 - v60) + (v54 - v59) * (v54 - v59));
          }
          BOOL v5 = v12 - 24 >= a1;
          BOOL v6 = v12 - 24 == a1;
          if (v12 - 24 != a1)
          {
            long long v61 = *(_OWORD *)(v12 - 24);
            *(void *)(a1 + 16) = *(void *)(v12 - 8);
            *(_OWORD *)a1 = v61;
          }
          a5 = 0;
          *(double *)(v12 - 24) = v21;
          *(double *)(v12 - 16) = v23;
          *(void *)(v12 - 8) = v22;
        }
        double v23 = *(double *)(a1 + 8);
        uint64_t v22 = *(void *)(a1 + 16);
        double v24 = *a3;
        double v25 = a3[1];
        double v26 = (v25 - v23) * (v25 - v23) + (*a3 - v21) * (*a3 - v21);
LABEL_12:
        uint64_t v27 = 0;
        do
        {
          double v28 = (v25 - *(double *)(a1 + v27 + 32)) * (v25 - *(double *)(a1 + v27 + 32))
              + (v24 - *(double *)(a1 + v27 + 24)) * (v24 - *(double *)(a1 + v27 + 24));
          v27 += 24;
        }
        while (v28 < v26);
        unint64_t v29 = a1 + v27;
        unint64_t v30 = a2;
        if (v27 == 24)
        {
          unint64_t v30 = a2;
          do
          {
            if (v29 >= v30) {
              break;
            }
            double v33 = *(double *)(v30 - 24);
            double v34 = *(double *)(v30 - 16);
            v30 -= 24;
          }
          while ((v25 - v34) * (v25 - v34) + (v24 - v33) * (v24 - v33) >= v26);
        }
        else
        {
          do
          {
            double v31 = *(double *)(v30 - 24);
            double v32 = *(double *)(v30 - 16);
            v30 -= 24;
          }
          while ((v25 - v32) * (v25 - v32) + (v24 - v31) * (v24 - v31) >= v26);
        }
        unint64_t v12 = a1 + v27;
        if (v29 < v30)
        {
          unint64_t v35 = v30;
          do
          {
            uint64_t v129 = *(void *)(v12 + 16);
            long long v124 = *(_OWORD *)v12;
            long long v36 = *(_OWORD *)v35;
            *(void *)(v12 + 16) = *(void *)(v35 + 16);
            *(_OWORD *)unint64_t v12 = v36;
            *(void *)(v35 + 16) = v129;
            *(_OWORD *)unint64_t v35 = v124;
            double v37 = *a3;
            double v38 = a3[1];
            double v39 = (v38 - v23) * (v38 - v23) + (*a3 - v21) * (*a3 - v21);
            do
            {
              double v40 = *(double *)(v12 + 24);
              double v41 = *(double *)(v12 + 32);
              v12 += 24;
            }
            while ((v38 - v41) * (v38 - v41) + (v37 - v40) * (v37 - v40) < v39);
            do
            {
              double v42 = *(double *)(v35 - 24);
              double v43 = *(double *)(v35 - 16);
              v35 -= 24;
            }
            while ((v38 - v43) * (v38 - v43) + (v37 - v42) * (v37 - v42) >= v39);
          }
          while (v12 < v35);
        }
        if (v12 - 24 != a1)
        {
          long long v44 = *(_OWORD *)(v12 - 24);
          *(void *)(a1 + 16) = *(void *)(v12 - 8);
          *(_OWORD *)a1 = v44;
        }
        *(double *)(v12 - 24) = v21;
        *(double *)(v12 - 16) = v23;
        *(void *)(v12 - 8) = v22;
        if (v29 >= v30) {
          break;
        }
LABEL_31:
        std::__introsort<std::_ClassicAlgPolicy,-[MTMPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_2 &,MTMPU::Point3D *,false>(a1, v12 - 24, a3, a4, a5 & 1);
        a5 = 0;
      }
      BOOL v45 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MTMPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_2 &,MTMPU::Point3D *>(a1, v12 - 24, a3);
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MTMPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_2 &,MTMPU::Point3D *>(v12, a2, a3))
      {
        break;
      }
      if (!v45) {
        goto LABEL_31;
      }
    }
    a2 = v12 - 24;
    if (!v45) {
      continue;
    }
    break;
  }
}

@end