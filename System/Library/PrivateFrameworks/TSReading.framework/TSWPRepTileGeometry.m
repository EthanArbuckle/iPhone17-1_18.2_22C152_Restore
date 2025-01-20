@interface TSWPRepTileGeometry
- (BOOL)tileGeometryDirty;
- (BOOL)updateWithLayer:(id)a3 scale:(double)a4 columns:(id)a5;
- (CGRect)tileGeometryRectWithLayer:(id)a3 atIndex:(unint64_t)a4 mask:(unsigned int *)a5;
- (CGSize)maxTileSize;
- (NSString)description;
- (id).cxx_construct;
- (unint64_t)tileGeometryCountWithLayer:(id)a3;
- (void)dealloc;
- (void)setMaxTileSize:(CGSize)a3;
- (void)setTileGeometryDirty:(BOOL)a3;
- (void)tileGeometryAddVisibileIndices:(id)a3 withLayer:(id)a4 visibleBounds:(CGRect)a5;
- (void)tileGeometryConfigureWithLayer:(id)a3 tileLayer:(id)a4 atIndex:(unint64_t)a5;
@end

@implementation TSWPRepTileGeometry

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSWPRepTileGeometry;
  [(TSWPRepTileGeometry *)&v2 dealloc];
}

- (unint64_t)tileGeometryCountWithLayer:(id)a3
{
  return 0xCCCCCCCCCCCCCCCDLL * ((self->_infos.__end_ - self->_infos.__begin_) >> 3);
}

- (void)tileGeometryAddVisibileIndices:(id)a3 withLayer:(id)a4 visibleBounds:(CGRect)a5
{
  begin = (CGRect *)self->_infos.__begin_;
  if (begin != (CGRect *)self->_infos.__end_)
  {
    CGFloat height = a5.size.height;
    CGFloat width = a5.size.width;
    CGFloat y = a5.origin.y;
    CGFloat x = a5.origin.x;
    uint64_t v12 = 0;
    do
    {
      v13.origin.CGFloat x = x;
      v13.origin.CGFloat y = y;
      v13.size.CGFloat width = width;
      v13.size.CGFloat height = height;
      if (CGRectIntersectsRect(v13, *begin)) {
        [a3 addIndex:v12];
      }
      ++v12;
      begin = (CGRect *)((char *)begin + 40);
    }
    while (begin != (CGRect *)self->_infos.__end_);
  }
}

- (CGRect)tileGeometryRectWithLayer:(id)a3 atIndex:(unint64_t)a4 mask:(unsigned int *)a5
{
  begin = self->_infos.__begin_;
  v7 = (CGFloat *)((char *)begin + 40 * a4);
  if (0xCCCCCCCCCCCCCCCDLL * ((self->_infos.__end_ - begin) >> 3) <= a4) {
    v7 = (CGFloat *)MEMORY[0x263F001A8];
  }
  CGFloat v8 = v7[2];
  CGFloat v9 = v7[3];
  CGFloat v10 = *v7;
  CGFloat v11 = v7[1];
  [a3 bounds];
  if (a5)
  {
    CGFloat v16 = v12;
    v33.origin.CGFloat x = v10;
    CGFloat v17 = v13;
    v33.origin.CGFloat y = v11;
    CGFloat v18 = v14;
    v33.size.CGFloat width = v8;
    CGFloat v19 = v15;
    v33.size.CGFloat height = v9;
    CGFloat rect = v9;
    double MinX = CGRectGetMinX(v33);
    v34.origin.CGFloat x = v16;
    v34.origin.CGFloat y = v17;
    v34.size.CGFloat width = v18;
    v34.size.CGFloat height = v19;
    unsigned int v21 = MinX == CGRectGetMinX(v34);
    v35.origin.CGFloat x = v10;
    v35.origin.CGFloat y = v11;
    v35.size.CGFloat width = v8;
    v35.size.CGFloat height = rect;
    double MaxX = CGRectGetMaxX(v35);
    v36.origin.CGFloat x = v16;
    v36.origin.CGFloat y = v17;
    v36.size.CGFloat width = v18;
    v36.size.CGFloat height = v19;
    if (MaxX == CGRectGetMaxX(v36)) {
      v21 |= 2u;
    }
    v37.origin.CGFloat x = v10;
    v37.origin.CGFloat y = v11;
    v37.size.CGFloat width = v8;
    v37.size.CGFloat height = rect;
    double MinY = CGRectGetMinY(v37);
    v38.origin.CGFloat x = v16;
    v38.origin.CGFloat y = v17;
    v38.size.CGFloat width = v18;
    v38.size.CGFloat height = v19;
    if (MinY == CGRectGetMinY(v38)) {
      v21 |= 4u;
    }
    v39.origin.CGFloat x = v10;
    v39.origin.CGFloat y = v11;
    v39.size.CGFloat width = v8;
    v39.size.CGFloat height = rect;
    double MaxY = CGRectGetMaxY(v39);
    v40.origin.CGFloat x = v16;
    v40.origin.CGFloat y = v17;
    v40.size.CGFloat width = v18;
    v40.size.CGFloat height = v19;
    CGFloat v25 = CGRectGetMaxY(v40);
    unsigned int v26 = v21 | 8;
    BOOL v27 = MaxY == v25;
    CGFloat v9 = rect;
    if (!v27) {
      unsigned int v26 = v21;
    }
    *a5 = v26;
  }
  double v28 = v10;
  double v29 = v11;
  double v30 = v8;
  double v31 = v9;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (void)tileGeometryConfigureWithLayer:(id)a3 tileLayer:(id)a4 atIndex:(unint64_t)a5
{
  begin = self->_infos.__begin_;
  if (0xCCCCCCCCCCCCCCCDLL * ((self->_infos.__end_ - begin) >> 3) > a5)
  {
    v7 = CGColorRetain(*((CGColorRef *)begin + 5 * a5 + 4));
    CGFloat v8 = v7;
    if (v7) {
      CopyWithAlpha = CGColorCreateCopyWithAlpha(v7, 1.0);
    }
    else {
      CopyWithAlpha = 0;
    }
    CGFloat v10 = (void *)MEMORY[0x263F159C8];
    if (CopyWithAlpha) {
      CGFloat v10 = (void *)MEMORY[0x263F159B0];
    }
    [a4 setContentsFormat:*v10];
    [a4 setContentsMultiplyColor:CopyWithAlpha];
    if (CopyWithAlpha) {
      CGColorRelease(CopyWithAlpha);
    }
    CGColorRelease(v8);
  }
}

- (BOOL)updateWithLayer:(id)a3 scale:(double)a4 columns:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  [a3 bounds];
  TSWPRepBoundsAnalyzer::TSWPRepBoundsAnalyzer((TSWPRepBoundsAnalyzer *)v43, v47);
  id v35 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v9 = [a5 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(a5);
        }
        double v12 = (uint64_t ***)[*(id *)(*((void *)&v39 + 1) + 8 * i) lineFragmentArray];
        double v13 = *v12;
        for (j = **v12; j != v13[1]; j += 2)
        {
          uint64_t v15 = *j;
          if ((*(_DWORD *)(*j + 24) & 0x8000020) == 0x8000000)
          {
            CGFloat v16 = (CGColor *)TSWPLineFragment::singleColor((TSWPLineFragment *)v15);
            v48.origin.CGFloat x = TSDMultiplyRectScalar(*(double *)(*j + 80), *(CGFloat *)(*j + 88), *(CGFloat *)(*j + 96), *(CGFloat *)(*j + 104), a4);
            TSWPRepBoundsAnalyzer::addSingleColorBounds((TSWPRepBoundsAnalyzer *)v43, v16, v48);
          }
          else
          {
            v49.origin.CGFloat x = TSDMultiplyRectScalar(*(double *)(v15 + 80), *(CGFloat *)(v15 + 88), *(CGFloat *)(v15 + 96), *(CGFloat *)(v15 + 104), a4);
            TSWPRepBoundsAnalyzer::addMultipleColorBounds((TSWPRepBoundsAnalyzer *)v43, v49);
          }
          double v13 = *v12;
        }
      }
      uint64_t v9 = [a5 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v9);
  }
  CGRect v36 = 0;
  CGRect v37 = 0;
  CGRect v38 = 0;
  [v35 bounds];
  TSWPRepBoundsAnalyzer::finalize((uint64_t)v43, (uint64_t)&v36, v17, v18, v19, v20, self->_maxTileSize.width, self->_maxTileSize.height);
  v22 = v36;
  unsigned int v21 = v37;
  unint64_t v23 = 0xCCCCCCCCCCCCCCCDLL * ((v37 - v36) >> 3);
  begin = self->_infos.__begin_;
  end = self->_infos.__end_;
  if (v23 != 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3))
  {
LABEL_25:
    self->_infos.__begin_ = v22;
    self->_infos.__end_ = v21;
    CGRect v36 = begin;
    CGRect v37 = end;
    value = self->_infos.__end_cap_.__value_;
    self->_infos.__end_cap_.__value_ = v38;
    CGRect v38 = value;
    BOOL v32 = 1;
    self->_tileGeometryDirtCGFloat y = 1;
    goto LABEL_26;
  }
  if (v37 != v36)
  {
    uint64_t v26 = 0;
    if (v23 <= 1) {
      unint64_t v27 = 1;
    }
    else {
      unint64_t v27 = 0xCCCCCCCCCCCCCCCDLL * ((v37 - v36) >> 3);
    }
    while (1)
    {
      double v28 = self->_infos.__begin_;
      double v29 = v36;
      if (!CGRectEqualToRect(*(CGRect *)((char *)v28 + v26), *(CGRect *)((char *)v36 + v26))) {
        break;
      }
      double v30 = *(CGColor **)((char *)v28 + v26 + 32);
      double v31 = *(CGColor **)((char *)v29 + v26 + 32);
      if (v30 != v31 && !CGColorEqualToColor(v30, v31)) {
        break;
      }
      v26 += 40;
      if (!--v27) {
        goto LABEL_23;
      }
    }
    begin = self->_infos.__begin_;
    end = self->_infos.__end_;
    v22 = v36;
    unsigned int v21 = v37;
    goto LABEL_25;
  }
LABEL_23:
  BOOL v32 = 0;
LABEL_26:
  v44 = &v36;
  std::vector<TSWPRepBoundsAnalyzer::Info>::__destroy_vector::operator()[abi:nn180100]((void ***)&v44);
  std::__list_imp<TSWPRepBoundsAnalyzer::Span>::clear(v43);
  return v32;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = (objc_class *)objc_opt_class();
  v5 = (NSString *)[v3 stringWithFormat:@"<%@ %p", NSStringFromClass(v4), self];
  begin = self->_infos.__begin_;
  if (begin != self->_infos.__end_)
  {
    uint64_t v7 = 0;
    do
    {
      [(NSString *)v5 appendFormat:@" %lu:%@ %@", v7++, NSStringFromCGRect(*(CGRect *)begin), *((void *)begin + 4)];
      begin = (Info *)((char *)begin + 40);
    }
    while (begin != self->_infos.__end_);
  }
  [(NSString *)v5 appendString:@">"];
  return v5;
}

- (BOOL)tileGeometryDirty
{
  return self->_tileGeometryDirty;
}

- (void)setTileGeometryDirty:(BOOL)a3
{
  self->_tileGeometryDirtCGFloat y = a3;
}

- (CGSize)maxTileSize
{
  double width = self->_maxTileSize.width;
  double height = self->_maxTileSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxTileSize:(CGSize)a3
{
  self->_maxTileSize = a3;
}

- (void).cxx_destruct
{
  p_infos = &self->_infos;
  std::vector<TSWPRepBoundsAnalyzer::Info>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_infos);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end