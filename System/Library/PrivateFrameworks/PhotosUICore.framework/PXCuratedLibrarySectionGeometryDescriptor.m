@interface PXCuratedLibrarySectionGeometryDescriptor
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadiusForRect:(CGRect)a3;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)headerCornerRadius;
- (BOOL)isEqual:(id)a3;
- (CGRect)headerRect;
- (CGRect)keyAssetRect;
- (CGRect)resizeRect:(CGRect)a3 fromGeometryDesciptor:(id)a4 inContainer:(int64_t)a5 resizing:(unint64_t)a6;
- (CGRect)sectionRect;
- (PXCuratedLibrarySectionGeometryDescriptor)init;
- (PXCuratedLibrarySectionGeometryDescriptor)sectionGeometryDescriptorWithHeaderRect:(CGRect)a3;
- (PXCuratedLibrarySectionGeometryDescriptor)sectionGeometryDescriptorWithMaximumHeightBelowHeader:(double)a3;
- (PXCuratedLibrarySectionGeometryDescriptor)sectionGeometryDescriptorWithVisualPosition:(int64_t)a3;
- (PXDisplayAsset)headerAsset;
- (id)description;
- (id)initWithSectionRect:(double)a3 headerRect:(double)a4 keyAssetRect:(double)a5 headerCornerRadius:(double)a6 headerAsset:(double)a7 visualPosition:(double)a8;
- (id)sectionGeometryDescriptorOffsetBy:(CGPoint)a3;
- (id)sectionGeometryDescriptorTransformedBy:(CGAffineTransform *)a3;
- (int64_t)visualPosition;
- (uint64_t)initWithSectionRect:(uint64_t)a3 headerRect:keyAssetRect:headerCornerRadius:headerAsset:;
- (unint64_t)hash;
@end

@implementation PXCuratedLibrarySectionGeometryDescriptor

- (void).cxx_destruct
{
}

- (int64_t)visualPosition
{
  return self->_visualPosition;
}

- (PXDisplayAsset)headerAsset
{
  return self->_headerAsset;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)headerCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (CGRect)headerRect
{
  double x = self->_headerRect.origin.x;
  double y = self->_headerRect.origin.y;
  double width = self->_headerRect.size.width;
  double height = self->_headerRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)keyAssetRect
{
  double x = self->_keyAssetRect.origin.x;
  double y = self->_keyAssetRect.origin.y;
  double width = self->_keyAssetRect.size.width;
  double height = self->_keyAssetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)sectionRect
{
  double x = self->_sectionRect.origin.x;
  double y = self->_sectionRect.origin.y;
  double width = self->_sectionRect.size.width;
  double height = self->_sectionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadiusForRect:(CGRect)a3
{
}

float __65__PXCuratedLibrarySectionGeometryDescriptor_cornerRadiusForRect___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v4 + a3))
  {
    if (*(unsigned char *)(v4 + a4))
    {
      float result = *(float *)(a1 + 4 * a2 + 48);
      *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 4 * a2 + 32) = result;
    }
  }
  return result;
}

- (CGRect)resizeRect:(CGRect)a3 fromGeometryDesciptor:(id)a4 inContainer:(int64_t)a5 resizing:(unint64_t)a6
{
  id v10 = a4;
  v11 = v10;
  if (a6)
  {
    switch(a5)
    {
      case 0:
        v44 = [MEMORY[0x1E4F28B00] currentHandler];
        [v44 handleFailureInMethod:a2 object:self file:@"PXCuratedLibrarySectionGeometryDescriptor.m" lineNumber:141 description:@"Code which should be unreachable has been reached"];

        abort();
      case 1:
        [v10 sectionRect];
        uint64_t v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        [(PXCuratedLibrarySectionGeometryDescriptor *)self sectionRect];
        goto LABEL_7;
      case 2:
        [v10 headerRect];
        uint64_t v13 = v32;
        double v15 = v33;
        double v17 = v34;
        double v19 = v35;
        [(PXCuratedLibrarySectionGeometryDescriptor *)self headerRect];
        goto LABEL_7;
      case 3:
        [v10 keyAssetRect];
        uint64_t v13 = v36;
        double v15 = v37;
        double v17 = v38;
        double v19 = v39;
        [(PXCuratedLibrarySectionGeometryDescriptor *)self keyAssetRect];
LABEL_7:
        CGFloat v31 = v20;
        uint64_t v24 = v13;
        CGFloat v25 = v21;
        CGFloat v30 = v15;
        CGFloat v26 = v22;
        CGFloat v29 = v17;
        CGFloat v27 = v23;
        CGFloat v28 = v19;
        break;
      default:
        uint64_t v24 = *MEMORY[0x1E4F1DB20];
        CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        CGFloat v28 = v27;
        CGFloat v29 = v26;
        CGFloat v30 = v25;
        CGFloat v31 = *MEMORY[0x1E4F1DB20];
        break;
    }
    if (!CGRectIsNull(*(CGRect *)&v24))
    {
      v46.origin.double x = v31;
      v46.origin.double y = v25;
      v46.size.double width = v26;
      v46.size.double height = v27;
      if (!CGRectIsNull(v46)) {
        PXGResizeRect();
      }
    }
  }

  double x = a3.origin.x;
  double y = a3.origin.y;
  double width = a3.size.width;
  double height = a3.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXCuratedLibrarySectionGeometryDescriptor)sectionGeometryDescriptorWithHeaderRect:(CGRect)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(PXCuratedLibrarySectionGeometryDescriptor *)self sectionRect];
  double v30 = v6;
  double v31 = v5;
  double v28 = v8;
  double v29 = v7;
  [(PXCuratedLibrarySectionGeometryDescriptor *)self keyAssetRect];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  [(PXCuratedLibrarySectionGeometryDescriptor *)self headerCornerRadius];
  unsigned int v18 = v17;
  unsigned int v20 = v19;
  unsigned int v22 = v21;
  unsigned int v24 = v23;
  CGFloat v25 = [(PXCuratedLibrarySectionGeometryDescriptor *)self headerAsset];
  CGFloat v26 = objc_msgSend(v4, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v25, -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](self, "visualPosition"), v31, v30, v29, v28, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v10, v12, v14, v16, __PAIR64__(v20, v18), __PAIR64__(v24, v22));

  return (PXCuratedLibrarySectionGeometryDescriptor *)v26;
}

- (PXCuratedLibrarySectionGeometryDescriptor)sectionGeometryDescriptorWithMaximumHeightBelowHeader:(double)a3
{
  v3 = self;
  [(PXCuratedLibrarySectionGeometryDescriptor *)v3 sectionRect];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  [(PXCuratedLibrarySectionGeometryDescriptor *)v3 keyAssetRect];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double rect = v5;
  v59.origin.double x = v5;
  double rect_8 = v7;
  v59.origin.double y = v7;
  double v20 = v9;
  v59.size.double width = v9;
  v59.size.double height = v11;
  double MaxY = CGRectGetMaxY(v59);
  v60.origin.double x = v13;
  CGFloat v52 = v19;
  CGFloat v53 = v15;
  v60.origin.double y = v15;
  v60.size.double width = v17;
  v60.size.double height = v19;
  double v22 = MaxY - CGRectGetMaxY(v60);
  if (v22 > a3)
  {
    double v23 = v11 + a3 - v22;
    [(PXCuratedLibrarySectionGeometryDescriptor *)v3 headerRect];
    double v26 = v25;
    CGFloat v27 = v24;
    double v48 = v28;
    double v30 = v29;
    CGFloat v55 = v13;
    if (v24 >= 0.0) {
      double v31 = v24;
    }
    else {
      double v31 = 0.0;
    }
    v61.origin.double x = rect;
    v61.origin.double y = rect_8;
    v61.size.double width = v9;
    v61.size.double height = v23;
    double v51 = v23;
    double v32 = CGRectGetMaxY(v61);
    v62.origin.double x = v26;
    v62.origin.double y = v27;
    v62.size.double width = v48;
    v62.size.double height = v30;
    double v33 = v32 - CGRectGetHeight(v62);
    if (v31 >= v33) {
      double v31 = v33;
    }
    double v50 = v31;
    v63.origin.double x = rect;
    v63.origin.double y = rect_8;
    v63.size.double width = v20;
    v63.size.double height = v23;
    double v34 = CGRectGetMaxY(v63);
    v64.origin.double x = v26;
    v64.origin.double y = v31;
    v64.size.double width = v48;
    v64.size.double height = v30;
    double v35 = v34 - CGRectGetMinY(v64);
    if (v30 < v35) {
      double v35 = v30;
    }
    double v49 = v35;
    id v36 = objc_alloc((Class)objc_opt_class());
    [(PXCuratedLibrarySectionGeometryDescriptor *)v3 headerCornerRadius];
    unsigned int v38 = v37;
    unsigned int v40 = v39;
    unsigned int v42 = v41;
    unsigned int v44 = v43;
    v45 = [(PXCuratedLibrarySectionGeometryDescriptor *)v3 headerAsset];
    uint64_t v46 = objc_msgSend(v36, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v45, -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](v3, "visualPosition"), rect, rect_8, v20, v51, v26, v50, v48, v49, *(void *)&v55, *(void *)&v53, *(void *)&v17, *(void *)&v52, __PAIR64__(v40, v38), __PAIR64__(v44, v42));

    v3 = (PXCuratedLibrarySectionGeometryDescriptor *)v46;
  }
  return v3;
}

- (id)sectionGeometryDescriptorTransformedBy:(CGAffineTransform *)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PXCuratedLibrarySectionGeometryDescriptor_sectionGeometryDescriptorTransformedBy___block_invoke;
  aBlock[3] = &__block_descriptor_80_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  long long v4 = *(_OWORD *)&a3->c;
  long long v42 = *(_OWORD *)&a3->a;
  long long v43 = v4;
  long long v44 = *(_OWORD *)&a3->tx;
  CGFloat v5 = (double (**)(void))_Block_copy(aBlock);
  id v6 = objc_alloc((Class)objc_opt_class());
  [(PXCuratedLibrarySectionGeometryDescriptor *)self sectionRect];
  double v7 = v5[2](v5);
  double v39 = v8;
  double v40 = v7;
  double v37 = v10;
  double v38 = v9;
  [(PXCuratedLibrarySectionGeometryDescriptor *)self headerRect];
  double v11 = v5[2](v5);
  double v35 = v12;
  double v36 = v11;
  double v33 = v14;
  double v34 = v13;
  [(PXCuratedLibrarySectionGeometryDescriptor *)self keyAssetRect];
  double v15 = v5[2](v5);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  [(PXCuratedLibrarySectionGeometryDescriptor *)self headerCornerRadius];
  unsigned int v23 = v22;
  unsigned int v25 = v24;
  unsigned int v27 = v26;
  unsigned int v29 = v28;
  double v30 = [(PXCuratedLibrarySectionGeometryDescriptor *)self headerAsset];
  double v31 = objc_msgSend(v6, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v30, -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](self, "visualPosition"), v40, v39, v38, v37, v36, v35, v34, v33, *(void *)&v15, v17, v19, v21, __PAIR64__(v25, v23), __PAIR64__(v29, v27));

  return v31;
}

double __84__PXCuratedLibrarySectionGeometryDescriptor_sectionGeometryDescriptorTransformedBy___block_invoke(_OWORD *a1, double a2, double a3, double a4, double a5)
{
  double v8 = a2;
  if (!CGRectIsNull(*(CGRect *)&a2))
  {
    long long v10 = a1[3];
    *(_OWORD *)&v15.a = a1[2];
    *(_OWORD *)&v15.c = v10;
    *(_OWORD *)&v15.tdouble x = a1[4];
    double v11 = v8;
    *(double *)&long long v10 = a3;
    double v12 = a4;
    double v13 = a5;
    *(void *)&double v8 = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)((char *)&v10 - 8), &v15);
  }
  return v8;
}

- (id)sectionGeometryDescriptorOffsetBy:(CGPoint)a3
{
  CGAffineTransformMakeTranslation(&v6, a3.x, a3.y);
  long long v4 = [(PXCuratedLibrarySectionGeometryDescriptor *)self sectionGeometryDescriptorTransformedBy:&v6];
  return v4;
}

- (PXCuratedLibrarySectionGeometryDescriptor)sectionGeometryDescriptorWithVisualPosition:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  [(PXCuratedLibrarySectionGeometryDescriptor *)self sectionRect];
  double v39 = v7;
  double v40 = v6;
  double v37 = v9;
  double v38 = v8;
  [(PXCuratedLibrarySectionGeometryDescriptor *)self headerRect];
  double v35 = v11;
  double v36 = v10;
  double v33 = v13;
  double v34 = v12;
  [(PXCuratedLibrarySectionGeometryDescriptor *)self keyAssetRect];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  [(PXCuratedLibrarySectionGeometryDescriptor *)self headerCornerRadius];
  unsigned int v23 = v22;
  unsigned int v25 = v24;
  unsigned int v27 = v26;
  unsigned int v29 = v28;
  double v30 = [(PXCuratedLibrarySectionGeometryDescriptor *)self headerAsset];
  double v31 = objc_msgSend(v5, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v30, a3, v40, v39, v38, v37, v36, v35, v34, v33, v15, v17, v19, v21, __PAIR64__(v25, v23), __PAIR64__(v29, v27));

  return (PXCuratedLibrarySectionGeometryDescriptor *)v31;
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  [(PXCuratedLibrarySectionGeometryDescriptor *)self sectionRect];
  NSStringFromCGRect(v6);
  objc_claimAutoreleasedReturnValue();
  [(PXCuratedLibrarySectionGeometryDescriptor *)self headerRect];
  NSStringFromCGRect(v7);
  objc_claimAutoreleasedReturnValue();
  [(PXCuratedLibrarySectionGeometryDescriptor *)self keyAssetRect];
  NSStringFromCGRect(v8);
  objc_claimAutoreleasedReturnValue();
  [(PXCuratedLibrarySectionGeometryDescriptor *)self headerCornerRadius];
  PXGCornerRadiusDescription();
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (PXCuratedLibrarySectionGeometryDescriptor *)a3;
  if (v4 == self)
  {
    char v54 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t v6 = [(PXCuratedLibrarySectionGeometryDescriptor *)self visualPosition];
      if (v6 != [(PXCuratedLibrarySectionGeometryDescriptor *)v5 visualPosition]) {
        goto LABEL_15;
      }
      [(PXCuratedLibrarySectionGeometryDescriptor *)self sectionRect];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [(PXCuratedLibrarySectionGeometryDescriptor *)v5 sectionRect];
      v62.origin.double x = v15;
      v62.origin.double y = v16;
      v62.size.double width = v17;
      v62.size.double height = v18;
      v59.origin.double x = v8;
      v59.origin.double y = v10;
      v59.size.double width = v12;
      v59.size.double height = v14;
      if (!CGRectEqualToRect(v59, v62)) {
        goto LABEL_15;
      }
      [(PXCuratedLibrarySectionGeometryDescriptor *)self headerRect];
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      [(PXCuratedLibrarySectionGeometryDescriptor *)v5 headerRect];
      v63.origin.double x = v27;
      v63.origin.double y = v28;
      v63.size.double width = v29;
      v63.size.double height = v30;
      v60.origin.double x = v20;
      v60.origin.double y = v22;
      v60.size.double width = v24;
      v60.size.double height = v26;
      if (!CGRectEqualToRect(v60, v63)) {
        goto LABEL_15;
      }
      [(PXCuratedLibrarySectionGeometryDescriptor *)self keyAssetRect];
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      [(PXCuratedLibrarySectionGeometryDescriptor *)v5 keyAssetRect];
      v64.origin.double x = v39;
      v64.origin.double y = v40;
      v64.size.double width = v41;
      v64.size.double height = v42;
      v61.origin.double x = v32;
      v61.origin.double y = v34;
      v61.size.double width = v36;
      v61.size.double height = v38;
      if (CGRectEqualToRect(v61, v64))
      {
        [(PXCuratedLibrarySectionGeometryDescriptor *)self headerCornerRadius];
        float v44 = v43;
        float v46 = v45;
        float v48 = v47;
        float v50 = v49;
        [(PXCuratedLibrarySectionGeometryDescriptor *)v5 headerCornerRadius];
        char v54 = 0;
        if (v44 == v55 && v46 == v51 && v48 == v52 && v50 == v53)
        {
          v56 = [(PXCuratedLibrarySectionGeometryDescriptor *)self headerAsset];
          v57 = [(PXCuratedLibrarySectionGeometryDescriptor *)v5 headerAsset];
          if (v56 == v57) {
            char v54 = 1;
          }
          else {
            char v54 = [v56 isEqual:v57];
          }
        }
      }
      else
      {
LABEL_15:
        char v54 = 0;
      }
    }
    else
    {
      char v54 = 0;
    }
  }

  return v54;
}

- (unint64_t)hash
{
  [(PXCuratedLibrarySectionGeometryDescriptor *)self sectionRect];
  int64_t v7 = [(PXCuratedLibrarySectionGeometryDescriptor *)self visualPosition] ^ (uint64_t)v3 ^ (2 * (uint64_t)v4) ^ (4 * (uint64_t)v5) ^ (8 * (uint64_t)v6);
  [(PXCuratedLibrarySectionGeometryDescriptor *)self headerRect];
  return v7 ^ (16 * (uint64_t)v8);
}

- (id)initWithSectionRect:(double)a3 headerRect:(double)a4 keyAssetRect:(double)a5 headerCornerRadius:(double)a6 headerAsset:(double)a7 visualPosition:(double)a8
{
  id v35 = a11;
  v39.receiver = a1;
  v39.super_class = (Class)PXCuratedLibrarySectionGeometryDescriptor;
  CGFloat v36 = (id *)objc_msgSendSuper2(&v39, sel_init);
  double v37 = v36;
  if (v36)
  {
    *((double *)v36 + 5) = a2;
    *((double *)v36 + 6) = a3;
    *((double *)v36 + 7) = a4;
    *((double *)v36 + 8) = a5;
    *((double *)v36 + 13) = a6;
    *((double *)v36 + 14) = a7;
    *((double *)v36 + 15) = a8;
    *((double *)v36 + 16) = a9;
    v36[9] = a17;
    v36[10] = a18;
    v36[11] = a19;
    v36[12] = a20;
    *((_DWORD *)v36 + 6) = a21;
    *((_DWORD *)v36 + 7) = a22;
    *((_DWORD *)v36 + 8) = a23;
    *((_DWORD *)v36 + 9) = a24;
    objc_storeStrong(v36 + 1, a11);
    v37[2] = a12;
  }

  return v37;
}

- (uint64_t)initWithSectionRect:(uint64_t)a3 headerRect:keyAssetRect:headerCornerRadius:headerAsset:
{
  return objc_msgSend(a1, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (PXCuratedLibrarySectionGeometryDescriptor)init
{
  HIDWORD(v3) = *((_DWORD *)off_1E5DAAF50 + 3);
  *(void *)((char *)&v3 + 4) = *(void *)((char *)off_1E5DAAF50 + 4);
  LODWORD(v3) = *(_DWORD *)off_1E5DAAF50;
  return -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:](self, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:", 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24), v3);
}

@end