@interface PUGridRenderedStrip
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)_needsRendering;
- (BOOL)extendsToTop;
- (CGSize)interItemSpacing;
- (CGSize)itemSize;
- (NSArray)itemIndexPaths;
- (PUGridRenderedStrip)initWithFrame:(CGRect)a3;
- (PUGridRenderedStripDataSource)dataSource;
- (PUSectionedGridLayout)layout;
- (UIView)_sideExtendedContentView;
- (UIView)topContentView;
- (_NSRange)visualItemRange;
- (double)itemContentScale;
- (double)leftContentInset;
- (int)backgroundColorValue;
- (int64_t)numberOfColumns;
- (int64_t)visualSectionIndex;
- (unint64_t)contentExtenderType;
- (void)_render;
- (void)_setNeedsRendering:(BOOL)a3;
- (void)_updateExtendedContents;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundColorValue:(int)a3;
- (void)setContentExtenderType:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setExtendsToTop:(BOOL)a3;
- (void)setInterItemSpacing:(CGSize)a3;
- (void)setItemContentScale:(double)a3;
- (void)setItemIndexPaths:(id)a3;
- (void)setItemSize:(CGSize)a3;
- (void)setLayout:(id)a3;
- (void)setLeftContentInset:(double)a3;
- (void)setNeedsRendering;
- (void)setVisualSectionIndex:(int64_t)a3 andVisualItemRange:(_NSRange)a4;
@end

@implementation PUGridRenderedStrip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sideExtendedContentView, 0);
  objc_storeStrong((id *)&self->_topContentView, 0);
  objc_destroyWeak((id *)&self->_layout);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_itemIndexPaths, 0);
}

- (UIView)_sideExtendedContentView
{
  return self->__sideExtendedContentView;
}

- (BOOL)_needsRendering
{
  return self->__needsRendering;
}

- (UIView)topContentView
{
  return self->_topContentView;
}

- (BOOL)extendsToTop
{
  return self->_extendsToTop;
}

- (unint64_t)contentExtenderType
{
  return self->_contentExtenderType;
}

- (PUSectionedGridLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PUSectionedGridLayout *)WeakRetained;
}

- (PUGridRenderedStripDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PUGridRenderedStripDataSource *)WeakRetained;
}

- (_NSRange)visualItemRange
{
  p_visualItemRange = &self->_visualItemRange;
  NSUInteger location = self->_visualItemRange.location;
  NSUInteger length = p_visualItemRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int64_t)visualSectionIndex
{
  return self->_visualSectionIndex;
}

- (void)setItemIndexPaths:(id)a3
{
}

- (NSArray)itemIndexPaths
{
  return self->_itemIndexPaths;
}

- (void)setBackgroundColorValue:(int)a3
{
  self->_backgroundColorValue = a3;
}

- (int)backgroundColorValue
{
  return self->_backgroundColorValue;
}

- (double)leftContentInset
{
  return self->_leftContentInset;
}

- (CGSize)interItemSpacing
{
  double width = self->_interItemSpacing.width;
  double height = self->_interItemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)itemContentScale
{
  return self->_itemContentScale;
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUGridRenderedStrip;
  [(PUGridRenderedStrip *)&v6 applyLayoutAttributes:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 extendsTopContent])
  {
    [(PUGridRenderedStrip *)self setExtendsToTop:1];
    v5 = [(PUGridRenderedStrip *)self topContentView];
    [v5 setAlpha:0.0];
  }
}

- (void)_updateExtendedContents
{
  v3 = [(PUGridRenderedStrip *)self layer];
  uint64_t v8 = [v3 contents];

  id v4 = (void *)v8;
  if (v8)
  {
    if (self->_extendsToTop)
    {
      v5 = [(UIView *)self->_topContentView layer];
      [v5 setContents:v8];

      id v4 = (void *)v8;
    }
    sideExtendedContentView = self->__sideExtendedContentView;
    if (sideExtendedContentView)
    {
      v7 = [(UIView *)sideExtendedContentView layer];
      [v7 setContents:v8];

      id v4 = (void *)v8;
    }
  }
}

- (void)_render
{
  [(PUGridRenderedStrip *)self bounds];
  double v4 = v3;
  double v6 = v5;
  PLPhysicalScreenScale();
  double v8 = v7;
  [(PUGridRenderedStrip *)self itemContentScale];
  double v10 = v8 * v9;
  int v11 = [(PUGridRenderedStrip *)self backgroundColorValue];
  v12 = [(PUGridRenderedStrip *)self layout];
  v13 = [(PUGridRenderedStrip *)self dataSource];
  char v14 = [(PUGridRenderedStrip *)self _shouldReverseLayoutDirection];
  unint64_t v15 = llround(v4 * v10);
  int64_t v16 = llround(v6 * v10);
  [(PUGridRenderedStrip *)self itemSize];
  double v18 = v17;
  double v20 = v19;
  int64_t v21 = llround(v10 * v17);
  int64_t v22 = llround(v10 * v19);
  [(PUGridRenderedStrip *)self interItemSpacing];
  double v24 = v23;
  [(PUGridRenderedStrip *)self leftContentInset];
  uint64_t v67 = llround(v10 * v25);
  if ((uint64_t)(v15 - v67) >= v21 && v16 >= v22)
  {
    int64_t v27 = v16;
    size_t size = 2 * v16 * v15;
    v28 = (char *)mmap(0, size, 3, 4097, 1207959552, 0);
    uint64_t v94 = 0;
    v95 = &v94;
    uint64_t v96 = 0x2020000000;
    uint64_t v97 = 0;
    [(PUGridRenderedStrip *)self interItemSpacing];
    int64_t visualSectionIndex = self->_visualSectionIndex;
    if (visualSectionIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t length = self->_visualItemRange.length;
      if (length)
      {
        double v30 = v29;
        v61 = v13;
        uint64_t v31 = [(PUGridRenderedStrip *)self numberOfColumns];
        int64_t v65 = v15;
        int64_t v66 = v27;
        if (v31 < 1)
        {
          double v33 = 0.0;
        }
        else
        {
          uint64_t v32 = 0;
          double v33 = 0.0;
          do
          {
            if (v12) {
              [v12 layoutItemSizeForColumn:v32];
            }
            else {
              [(PUGridRenderedStrip *)self itemSize];
            }
            double v35 = v33 + v34;
            double v36 = -0.0;
            if (v32 < v31 - 1) {
              double v36 = v30;
            }
            double v33 = v36 + v35;
            ++v32;
          }
          while (v31 != v32);
        }
        size_t v37 = 2 * v15;
        v38 = (char *)mmap(0, 2 * v65, 3, 4097, 1207959552, 0);
        v39 = v38;
        uint64_t v60 = (uint64_t)(v10 * v33);
        if (v65 >= 1)
        {
          v40 = v38 + 1;
          int64_t v41 = v65;
          do
          {
            *(_WORD *)(v40 - 1) = v11;
            v40 += 2;
            --v41;
          }
          while (v41);
        }
        unint64_t v57 = llround(v10 * v24);
        if (v67 >= 1 && v66 >= 1)
        {
          int64_t v42 = v66;
          size_t v43 = v95[3];
          do
          {
            memcpy(&v28[v43], v39, 2 * v67);
            size_t v43 = v95[3] + v37;
            v95[3] = v43;
            --v42;
          }
          while (v42);
        }
        if (length >= v31) {
          uint64_t v44 = v31;
        }
        else {
          uint64_t v44 = length;
        }
        NSUInteger location = self->_visualItemRange.location;
        v93[0] = 0;
        v93[1] = v93;
        v93[2] = 0x2020000000;
        v93[3] = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __30__PUGridRenderedStrip__render__block_invoke;
        aBlock[3] = &unk_1E5F257D8;
        double v81 = v18;
        double v82 = v20;
        double v83 = v10;
        id v76 = v12;
        uint64_t v84 = (uint64_t)(v10 * v33);
        unint64_t v85 = v57;
        v79 = v93;
        v80 = &v94;
        uint64_t v86 = v67;
        int64_t v87 = v22;
        v88 = v28;
        v89 = v39;
        size_t v90 = v37;
        char v92 = v14 ^ 1;
        id v45 = v61;
        id v77 = v45;
        v78 = self;
        int64_t v91 = v66;
        v46 = _Block_copy(aBlock);
        uint64_t v71 = 0;
        v72 = &v71;
        uint64_t v73 = 0x2020000000;
        uint64_t v74 = 0;
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __30__PUGridRenderedStrip__render__block_invoke_2;
        v68[3] = &unk_1E5F25800;
        id v47 = v46;
        id v69 = v47;
        v70 = &v71;
        objc_msgSend(v45, "renderedStrip:enumerateAssetsForVisualSection:inVisualItemRange:usingBlock:", self, visualSectionIndex, location, v44, v68);
        if (v72[3] != v44)
        {
          v56 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUGridRenderedStrip.m", 388, @"Bad iteration over real items. Rendered %ld items but expected %ld", v72[3], v44);

          uint64_t v44 = v72[3];
        }
        for (; v44 < v31; v72[3] = v44)
        {
          (*((void (**)(id, uint64_t, void))v47 + 2))(v47, v44, 0);
          uint64_t v44 = v72[3] + 1;
        }
        uint64_t v48 = v65 - (v60 + v67);
        if (v48 >= 1)
        {
          uint64_t v49 = 2 * (v60 + v67);
          v95[3] = v49;
          if (v66 >= 1)
          {
            size_t v50 = 2 * v48;
            int64_t v51 = v66;
            do
            {
              memset(&v28[v49], v11, v50);
              uint64_t v49 = v95[3] + v37;
              v95[3] = v49;
              --v51;
            }
            while (v51);
          }
        }
        munmap(v39, v37);
        mach_vm_protect(*MEMORY[0x1E4F14960], (mach_vm_address_t)v28, size, 1, 1);
        v52 = CGDataProviderCreateWithData(0, v28, size, (CGDataProviderReleaseDataCallback)_UnmapBuffer);
        v13 = v61;
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v54 = CGImageCreate(v65, v66, 5uLL, 0x10uLL, v37, DeviceRGB, 0x1006u, v52, 0, 1, kCGRenderingIntentDefault);
        CGDataProviderRelease(v52);
        CGColorSpaceRelease(DeviceRGB);
        v55 = [(PUGridRenderedStrip *)self layer];
        [v55 setContents:v54];

        [(PUGridRenderedStrip *)self _updateExtendedContents];
        CGImageRelease(v54);

        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(v93, 8);
      }
    }
    _Block_object_dispose(&v94, 8);
  }
}

void __30__PUGridRenderedStrip__render__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  double v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 layoutItemSizeForColumn:a2];
    double v9 = v8;
  }
  else
  {
    double v7 = *(double *)(a1 + 72);
    double v9 = *(double *)(a1 + 80);
  }
  double v10 = *(double *)(a1 + 88);
  int64_t v11 = llround(v7 * v10);
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (*(void *)(a1 + 96) - v12 >= v11) {
    int64_t v13 = v11;
  }
  else {
    int64_t v13 = *(void *)(a1 + 96) - v12;
  }
  if (a2 >= 1)
  {
    uint64_t v14 = *(void *)(a1 + 104);
    if (v14)
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2 * (v12 + v14 * (a2 - 1) + *(void *)(a1 + 112));
      if (*(uint64_t *)(a1 + 120) >= 1)
      {
        uint64_t v15 = 0;
        do
        {
          memcpy((void *)(*(void *)(a1 + 128) + *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)), *(const void **)(a1 + 136), 2 * *(void *)(a1 + 104));
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += *(void *)(a1 + 144);
          ++v15;
        }
        while (v15 < *(void *)(a1 + 120));
      }
    }
  }
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + *(void *)(a1 + 104) * a2 + *(void *)(a1 + 112);
  if (!*(unsigned char *)(a1 + 160)) {
    uint64_t v16 = *(void *)(a1 + 96) - (v16 + v13);
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2 * v16;
  if (v5)
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v30 = 0;
    double v17 = [*(id *)(a1 + 40) renderedStrip:*(void *)(a1 + 48) imageDataForAsset:v5 imageWidth:(char *)&v32 + 4 imageHeight:&v32 bytesPerRow:(char *)&v31 + 4 dataWidth:&v31 dataHeight:(char *)&v30 + 4 imageDataOffset:&v30];
    if (v17)
    {
      unint64_t v18 = llround(v9 * v10);
      unint64_t v19 = SHIDWORD(v32) <= v13 ? 0 : (SHIDWORD(v32) - v13 + (SHIDWORD(v32) - v13 < 0)) & 0xFFFFFFFFFFFFFFFELL;
      BOOL v21 = __OFSUB__((int)v32, v18);
      uint64_t v22 = (int)v32 - v18;
      uint64_t v23 = ((v22 < 0) ^ v21) | (v22 == 0) ? 0 : v22 / 2;
      uint64_t v24 = *(void *)(a1 + 152);
      if (v24 >= 1)
      {
        uint64_t v25 = 0;
        uint64_t v26 = v23 * SHIDWORD(v31);
        do
        {
          uint64_t v27 = (int)v32;
          if (v24 > (int)v32 || v13 > SHIDWORD(v32))
          {
            bzero((void *)(*(void *)(a1 + 128) + *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)), 2 * v13);
            uint64_t v27 = (int)v32;
          }
          if (v23 + v25 < v27)
          {
            int64_t v29 = SHIDWORD(v32);
            if (v13 < SHIDWORD(v32)) {
              int64_t v29 = v13;
            }
            memcpy((void *)(*(void *)(a1 + 128) + *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)), (const void *)([v17 bytes] + v26 + v19), 2 * v29);
          }
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += *(void *)(a1 + 144);
          v26 += SHIDWORD(v31);
          ++v25;
          uint64_t v24 = *(void *)(a1 + 152);
        }
        while (v25 < v24);
      }
    }
  }
  else if (*(uint64_t *)(a1 + 152) >= 1)
  {
    uint64_t v20 = 0;
    do
    {
      memcpy((void *)(*(void *)(a1 + 128) + *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)), *(const void **)(a1 + 136), 2 * v13);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += *(void *)(a1 + 144);
      ++v20;
    }
    while (v20 < *(void *)(a1 + 152));
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v13;
}

uint64_t __30__PUGridRenderedStrip__render__block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (int64_t)numberOfColumns
{
  [(PUGridRenderedStrip *)self bounds];
  double Width = CGRectGetWidth(v14);
  [(PUGridRenderedStrip *)self leftContentInset];
  double v5 = Width - v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_layout);
    int64_t v8 = [v7 numberOfColumnsForWidth:v5];

    return v8;
  }
  else
  {
    [(PUGridRenderedStrip *)self interItemSpacing];
    double v11 = v10;
    double v12 = v5 + v10;
    [(PUGridRenderedStrip *)self itemSize];
    return (uint64_t)(v12 / (v11 + v13));
  }
}

- (void)setLayout:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_layout, obj);
    [(PUGridRenderedStrip *)self _setNeedsRendering:1];
    double v5 = obj;
  }
}

- (void)setVisualSectionIndex:(int64_t)a3 andVisualItemRange:(_NSRange)a4
{
  if (self->_visualSectionIndex != a3
    || (a4.location == self->_visualItemRange.location ? (BOOL v5 = a4.length == self->_visualItemRange.length) : (BOOL v5 = 0),
        !v5))
  {
    self->_int64_t visualSectionIndex = a3;
    p_visualItemRange = &self->_visualItemRange;
    self->_visualItemRange = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained && self->_visualSectionIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger length = p_visualItemRange->length;

      if (length)
      {
        [(PUGridRenderedStrip *)self _setNeedsRendering:1];
      }
    }
    else
    {
    }
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  BOOL v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_dataSource, obj);
    if (obj && self->_visualSectionIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger length = self->_visualItemRange.length;

      BOOL v5 = obj;
      if (!length) {
        goto LABEL_8;
      }
      [(PUGridRenderedStrip *)self _setNeedsRendering:1];
    }
    else
    {
    }
    BOOL v5 = obj;
  }
LABEL_8:
}

- (void)setLeftContentInset:(double)a3
{
  if (self->_leftContentInset != a3)
  {
    self->_leftContentInset = a3;
    [(PUGridRenderedStrip *)self _setNeedsRendering:1];
  }
}

- (void)setInterItemSpacing:(CGSize)a3
{
  if (a3.width != self->_interItemSpacing.width || a3.height != self->_interItemSpacing.height)
  {
    self->_interItemSpacing = a3;
    [(PUGridRenderedStrip *)self _setNeedsRendering:1];
  }
}

- (void)setItemContentScale:(double)a3
{
  if (self->_itemContentScale != a3)
  {
    self->_itemContentScale = a3;
    [(PUGridRenderedStrip *)self _setNeedsRendering:1];
  }
}

- (void)setItemSize:(CGSize)a3
{
  if (a3.width != self->_itemSize.width || a3.height != self->_itemSize.height)
  {
    self->_itemSize = a3;
    [(PUGridRenderedStrip *)self _setNeedsRendering:1];
  }
}

- (void)_setNeedsRendering:(BOOL)a3
{
  if (self->__needsRendering != a3)
  {
    self->__needsRendering = a3;
    if (a3) {
      [(PUGridRenderedStrip *)self setNeedsLayout];
    }
  }
}

- (void)setNeedsRendering
{
}

- (void)setContentExtenderType:(unint64_t)a3
{
  if (self->_contentExtenderType != a3)
  {
    self->_contentExtenderType = a3;
    sideExtendedContentView = self->__sideExtendedContentView;
    if (a3)
    {
      if (!sideExtendedContentView)
      {
        BOOL v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        id v6 = self->__sideExtendedContentView;
        self->__sideExtendedContentView = v5;

        [(PUGridRenderedStrip *)self addSubview:self->__sideExtendedContentView];
        id v7 = [(UIView *)self->__sideExtendedContentView layer];
        [v7 setContentsScaling:@"repeat"];

        int64_t v8 = self->__sideExtendedContentView;
        PLPhysicalScreenScale();
        double v10 = v9;
        [(PUGridRenderedStrip *)self itemContentScale];
        [(UIView *)v8 setContentScaleFactor:v10 * v11];
      }
      [(PUGridRenderedStrip *)self setNeedsLayout];
      [(PUGridRenderedStrip *)self _updateExtendedContents];
    }
    else
    {
      [(UIView *)sideExtendedContentView removeFromSuperview];
      double v12 = self->__sideExtendedContentView;
      self->__sideExtendedContentView = 0;
    }
  }
}

- (void)setExtendsToTop:(BOOL)a3
{
  if (self->_extendsToTop != a3)
  {
    self->_extendsToTop = a3;
    topContentView = self->_topContentView;
    if (!a3 || topContentView)
    {
      [(UIView *)topContentView removeFromSuperview];
      int64_t v8 = self->_topContentView;
      self->_topContentView = 0;
    }
    else
    {
      BOOL v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      id v6 = self->_topContentView;
      self->_topContentView = v5;

      [(UIView *)self->_topContentView setClipsToBounds:1];
      id v7 = [(UIView *)self->_topContentView layer];
      [v7 setContentsGravity:*MEMORY[0x1E4F3A3E0]];

      [(PUGridRenderedStrip *)self addSubview:self->_topContentView];
      [(PUGridRenderedStrip *)self _updateExtendedContents];
    }
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PUGridRenderedStrip;
  [(PUGridRenderedStrip *)&v16 layoutSubviews];
  [(PUGridRenderedStrip *)self bounds];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  unint64_t contentExtenderType = self->_contentExtenderType;
  if (contentExtenderType == 1)
  {
    double v13 = 3.0;
  }
  else
  {
    double v12 = v3;
    if (contentExtenderType != 2) {
      goto LABEL_6;
    }
    double v13 = 5.0;
  }
  double v12 = v3 + CGRectGetWidth(*(CGRect *)&v3) * -2.0;
  v17.origin.x = v7;
  v17.origin.y = v8;
  v17.size.double width = v9;
  v17.size.double height = v10;
  double v5 = CGRectGetWidth(v17) * v13;
LABEL_6:
  -[UIView setFrame:](self->__sideExtendedContentView, "setFrame:", v12, v8, v5, v10);
  if (self->_topContentView)
  {
    v18.origin.x = v7;
    v18.origin.y = v8;
    v18.size.double width = v9;
    v18.size.double height = v10;
    double v14 = 3.0 / CGRectGetHeight(v18);
    uint64_t v15 = [(UIView *)self->_topContentView layer];
    objc_msgSend(v15, "setContentsRect:", 0.0, 0.0, 1.0, v14);
    objc_msgSend(v15, "setAnchorPoint:", 0.5, 0.0);
    -[UIView setFrame:](self->_topContentView, "setFrame:", v7, v8, v9, 3.0);
  }
  if ([(PUGridRenderedStrip *)self _needsRendering])
  {
    [(PUGridRenderedStrip *)self _render];
    [(PUGridRenderedStrip *)self _setNeedsRendering:0];
  }
}

- (PUGridRenderedStrip)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUGridRenderedStrip;
  double v3 = -[PUGridRenderedStrip initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    double v5 = [(PUGridRenderedStrip *)v3 layer];
    [v5 setAllowsGroupOpacity:0];
  }
  return v4;
}

@end