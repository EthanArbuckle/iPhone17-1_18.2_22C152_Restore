@interface _UICollectionLayoutSectionGeometryTranslator
- (char)initWithPrimaryContentSize:(int)a3 sectionAuxiliarySolutionSize:(double)a4 layoutAxis:(double)a5 layoutRTL:(double)a6 sectionInsets:(double)a7 contentFrameSupplementaryOffset:(double)a8;
- (double)auxillaryHostContentSize;
- (double)contentRectForSectionRect:(CGFloat)a3;
- (id)description;
@end

@implementation _UICollectionLayoutSectionGeometryTranslator

- (char)initWithPrimaryContentSize:(int)a3 sectionAuxiliarySolutionSize:(double)a4 layoutAxis:(double)a5 layoutRTL:(double)a6 sectionInsets:(double)a7 contentFrameSupplementaryOffset:(double)a8
{
  if (!a1) {
    return 0;
  }
  v45.receiver = a1;
  v45.super_class = (Class)_UICollectionLayoutSectionGeometryTranslator;
  v28 = (char *)objc_msgSendSuper2(&v45, sel_init);
  v29 = v28;
  if (v28)
  {
    *((void *)v28 + 1) = a2;
    v28[16] = a3;
    if (a3) {
      double v30 = a11;
    }
    else {
      double v30 = a9;
    }
    if (a3) {
      double v31 = a9;
    }
    else {
      double v31 = a11;
    }
    *((double *)v28 + 5) = a8;
    *((double *)v28 + 6) = v30;
    *((double *)v28 + 7) = a10;
    *((double *)v28 + 8) = v31;
    *((double *)v28 + 3) = a12;
    *((double *)v28 + 4) = a13;
    if (a2)
    {
      v32 = (_OWORD *)MEMORY[0x1E4F1DAD8];
      double v33 = *MEMORY[0x1E4F1DAD8];
      double v34 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v35 = v30 + *MEMORY[0x1E4F1DAD8];
      double v36 = _UIPointValueForAxis(a2, a12, a13);
      double v37 = v35 + _UISetPointValueForAxis(*((void *)v29 + 1), v33, v34, v36);
      double v39 = a8 + v34 + v38;
      double v40 = _UITotalEdgeDimensionsForLayoutAxis(a2, *((double *)v29 + 5), *((double *)v29 + 6), *((double *)v29 + 7), *((double *)v29 + 8));
      double v41 = _UISetSizeValueForAxis(a2, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v40);
      *((double *)v29 + 9) = v37;
      *((double *)v29 + 10) = v39;
      *((double *)v29 + 11) = a4;
      *((double *)v29 + 12) = a5;
      *(_OWORD *)(v29 + 104) = *v32;
      *((double *)v29 + 15) = fmax(a4 + v41, a6);
      *((double *)v29 + 16) = fmax(a5 + v42, a7);
    }
    else
    {
      long long v43 = *MEMORY[0x1E4F1DAD8];
      *(_OWORD *)(v28 + 72) = *MEMORY[0x1E4F1DAD8];
      *((double *)v28 + 11) = a4;
      *((double *)v28 + 12) = a5;
      *(_OWORD *)(v28 + 104) = v43;
      *(_OWORD *)(v28 + 120) = *(_OWORD *)(v28 + 88);
    }
  }
  return v29;
}

- (double)contentRectForSectionRect:(CGFloat)a3
{
  if (!a1) {
    return 0.0;
  }
  double v9 = a2 - *(double *)(a1 + 72);
  CGRectGetWidth(*(CGRect *)&a2);
  v11.origin.x = a2;
  v11.origin.y = a3;
  v11.size.width = a4;
  v11.size.height = a5;
  CGRectGetHeight(v11);
  return v9;
}

- (double)auxillaryHostContentSize
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return *(double *)(a1 + 88);
  }
  double v3 = _UITotalEdgeDimensionsForLayoutAxis(v2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v4 = *(double *)(a1 + 88);
  return v4
       + _UISetSizeValueForAxis(*(void *)(a1 + 8), *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v3);
}

- (id)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromCGRect(self->_contentFrameIncludingAuxiliaries);
  v7 = NSStringFromCGRect(self->_primaryContentFrame);
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p _contentFrameIncludingAuxiliaries=%@; primaryContentFrame=%@>",
    v5,
    self,
    v6,
  v8 = v7);

  return v8;
}

@end