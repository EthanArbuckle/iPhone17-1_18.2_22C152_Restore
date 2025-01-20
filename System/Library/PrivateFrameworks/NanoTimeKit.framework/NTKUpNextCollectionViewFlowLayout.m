@interface NTKUpNextCollectionViewFlowLayout
+ (Class)layoutAttributesClass;
- (BOOL)_hasHeaderForSection:(int64_t)a3;
- (BOOL)isShowingAllAttributes;
- (BOOL)isSnappingEnabled;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)useFixedLowTransitionLayout;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (NSIndexPath)bottomElementIndexPath;
- (NSIndexPath)indexPathToSnapTo;
- (NSIndexPath)topElementIndexPath;
- (NSSet)dwellIndexPathes;
- (NTKUpNextCollectionViewFlowLayout)init;
- (double)headerAlpha;
- (double)highTransitionBottomOffset;
- (double)highTransitionScale;
- (double)highTransitionShift;
- (double)lowTransitionScale;
- (double)lowTransitionShift;
- (double)maximumDarkeningAmount;
- (double)snappingOffset;
- (double)statusBarDecorationHeight;
- (double)topItemsAlpha;
- (double)topItemsShift;
- (double)topOffsetForScrolling;
- (double)topOffsetForSnapping;
- (id)flowLayoutAttributesForItemAtIndexPath:(id)a3;
- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)_updateContentInsetsIfNeeded;
- (void)_updateSectionHeaderListIfNeeded;
- (void)_updateVisibilityForLayoutAttributes:(id)a3 inBounds:(CGRect)a4;
- (void)finalizeCollectionViewUpdates;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setBottomElementIndexPath:(id)a3;
- (void)setHeaderAlpha:(double)a3;
- (void)setHighTransitionBottomOffset:(double)a3;
- (void)setHighTransitionScale:(double)a3;
- (void)setHighTransitionShift:(double)a3;
- (void)setIndexPathToSnapTo:(id)a3;
- (void)setLowTransitionScale:(double)a3;
- (void)setLowTransitionShift:(double)a3;
- (void)setMaximumDarkeningAmount:(double)a3;
- (void)setShowingAllAttributes:(BOOL)a3;
- (void)setSnappingEnabled:(BOOL)a3;
- (void)setSnappingOffset:(double)a3;
- (void)setStatusBarDecorationHeight:(double)a3;
- (void)setTopElementIndexPath:(id)a3;
- (void)setTopItemsAlpha:(double)a3;
- (void)setTopItemsShift:(double)a3;
- (void)setTopOffsetForScrolling:(double)a3;
- (void)setTopOffsetForSnapping:(double)a3;
- (void)setUseFixedLowTransitionLayout:(BOOL)a3;
@end

@implementation NTKUpNextCollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (NTKUpNextCollectionViewFlowLayout)init
{
  v13.receiver = self;
  v13.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  v2 = [(UICollectionViewFlowLayout *)&v13 init];
  if (v2)
  {
    v3 = +[CLKRenderingContext sharedRenderingContext];
    uint64_t v4 = [v3 device];
    device = v2->_device;
    v2->_device = (CLKDevice *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    topElementIndexPath = v2->_topElementIndexPath;
    v2->_topElementIndexPath = (NSIndexPath *)v6;

    v2->_needsInsetsUpdate = 1;
    uint64_t v8 = objc_opt_new();
    previousSectionsWithHeaders = v2->_previousSectionsWithHeaders;
    v2->_previousSectionsWithHeaders = (NSSet *)v8;

    uint64_t v10 = objc_opt_new();
    sectionsWithHeaders = v2->_sectionsWithHeaders;
    v2->_sectionsWithHeaders = (NSSet *)v10;

    v2->_maximumDarkeningAmount = 0.5;
  }
  return v2;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (void)setTopItemsAlpha:(double)a3
{
  if (vabdd_f64(self->_topItemsAlpha, a3) > 2.22044605e-16)
  {
    self->_topItemsAlpha = a3;
    uint64_t v4 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    uint64_t v5 = [v4 numberOfSections];

    id v14 = (id)objc_opt_new();
    uint64_t v6 = objc_opt_new();
    if (v5 >= 1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v8 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
        uint64_t v9 = [v8 numberOfItemsInSection:i];

        if ([(NTKUpNextCollectionViewFlowLayout *)self _hasHeaderForSection:i])
        {
          uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:i];
          [v6 addObject:v10];
        }
        if (v9 >= 1)
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            v12 = [MEMORY[0x1E4F28D58] indexPathForItem:j inSection:i];
            if ([v12 compare:self->_topElementIndexPath] == -1
              || [v12 compare:self->_bottomElementIndexPath] == 1)
            {
              [v14 addObject:v12];
            }
          }
        }
      }
    }
    objc_super v13 = objc_opt_new();
    [v13 invalidateItemsAtIndexPaths:v14];
    [v13 invalidateSupplementaryElementsOfKind:*MEMORY[0x1E4FB2770] atIndexPaths:v6];
    [v13 setInvalidateFlowLayoutAttributes:0];
    [v13 setInvalidateFlowLayoutDelegateMetrics:0];
    [(NTKUpNextCollectionViewFlowLayout *)self invalidateLayoutWithContext:v13];
  }
}

- (void)setHeaderAlpha:(double)a3
{
  if (vabdd_f64(self->_headerAlpha, a3) > 2.22044605e-16)
  {
    self->_headerAlpha = a3;
    uint64_t v4 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    uint64_t v5 = [v4 numberOfSections];

    id v9 = (id)objc_opt_new();
    if (v5 >= 1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if ([(NTKUpNextCollectionViewFlowLayout *)self _hasHeaderForSection:i])
        {
          v7 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:i];
          [v9 addObject:v7];
        }
      }
    }
    uint64_t v8 = objc_opt_new();
    [v8 invalidateSupplementaryElementsOfKind:*MEMORY[0x1E4FB2770] atIndexPaths:v9];
    [v8 setInvalidateFlowLayoutAttributes:0];
    [v8 setInvalidateFlowLayoutDelegateMetrics:0];
    [(NTKUpNextCollectionViewFlowLayout *)self invalidateLayoutWithContext:v8];
  }
}

- (void)setTopOffsetForSnapping:(double)a3
{
  if (vabdd_f64(self->_topOffsetForSnapping, a3) > 2.22044605e-16)
  {
    self->_topOffsetForSnapping = a3;
    self->_needsInsetsUpdate = 1;
  }
}

- (void)setTopOffsetForScrolling:(double)a3
{
  if (vabdd_f64(self->_topOffsetForScrolling, a3) > 2.22044605e-16)
  {
    self->_topOffsetForScrolling = a3;
    uint64_t v4 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    uint64_t v5 = [v4 numberOfSections];

    id v13 = (id)objc_opt_new();
    uint64_t v6 = objc_opt_new();
    if (v5 >= 1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v8 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
        uint64_t v9 = [v8 numberOfItemsInSection:i];

        if (v9 >= 1)
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            v11 = [MEMORY[0x1E4F28D58] indexPathForItem:j inSection:i];
            if (!j && [(NTKUpNextCollectionViewFlowLayout *)self _hasHeaderForSection:i]) {
              [v6 addObject:v11];
            }
            [v13 addObject:v11];
          }
        }
      }
    }
    v12 = objc_opt_new();
    [v12 invalidateItemsAtIndexPaths:v13];
    [v12 invalidateSupplementaryElementsOfKind:*MEMORY[0x1E4FB2770] atIndexPaths:v6];
    [v12 setInvalidateFlowLayoutAttributes:0];
    [v12 setInvalidateFlowLayoutDelegateMetrics:0];
    [(NTKUpNextCollectionViewFlowLayout *)self invalidateLayoutWithContext:v12];
  }
}

- (void)setMaximumDarkeningAmount:(double)a3
{
  if (vabdd_f64(self->_maximumDarkeningAmount, a3) > 2.22044605e-16)
  {
    self->_maximumDarkeningAmount = a3;
    id v4 = (id)objc_opt_new();
    [v4 setInvalidateFlowLayoutAttributes:1];
    [v4 setInvalidateFlowLayoutDelegateMetrics:0];
    [(NTKUpNextCollectionViewFlowLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  [(UICollectionViewFlowLayout *)&v5 invalidateLayoutWithContext:v4];
  if (([v4 invalidateEverything] & 1) != 0
    || [v4 invalidateDataSourceCounts])
  {
    self->_needsInsetsUpdate = 1;
    self->_needsHeaderUpdate = 1;
  }
}

- (void)prepareLayout
{
  v201.receiver = self;
  v201.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  [(UICollectionViewFlowLayout *)&v201 prepareLayout];
  [(NTKUpNextCollectionViewFlowLayout *)self _updateContentInsetsIfNeeded];
  [(NTKUpNextCollectionViewFlowLayout *)self _updateSectionHeaderListIfNeeded];
  v3 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  CGFloat v168 = v9;
  CGFloat v169 = v8;

  if (self->_indexPathToSnapTo)
  {
    uint64_t v10 = [(NTKUpNextCollectionViewFlowLayout *)self flowLayoutAttributesForItemAtIndexPath:"flowLayoutAttributesForItemAtIndexPath:"];
    [v10 frame];
    -[NTKUpNextCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:");
    double v5 = v11;
    double v7 = v12 + self->_snappingOffset;
  }
  v161 = objc_opt_new();
  obuint64_t j = (id)objc_opt_new();
  v174 = [MEMORY[0x1E4F1CA80] set];
  id v13 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
  uint64_t v14 = [v13 numberOfSections];

  double v15 = 0.0;
  CGFloat v166 = v7;
  CGFloat v167 = v5;
  UIRectInset();
  CGFloat v182 = v17;
  CGFloat v183 = v16;
  CGFloat v179 = v19;
  CGFloat rect = v18;
  uint64_t v158 = v14;
  if (v14 >= 1)
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    NSInteger v22 = 0;
    CGFloat v24 = *MEMORY[0x1E4F1DB28];
    CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v156 = *MEMORY[0x1E4FB2770];
    double v175 = *MEMORY[0x1E4F1DAD8];
    double x = *MEMORY[0x1E4F1DB28];
    double y = v23;
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat rect1 = v25;
    CGFloat v172 = v23;
    CGFloat v173 = *MEMORY[0x1E4F1DB28];
    CGFloat v170 = v25;
    CGFloat v171 = width;
    CGFloat tz = width;
    do
    {
      v29 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
      uint64_t v30 = [v29 numberOfItemsInSection:v22];

      v160.size.double width = v171;
      v160.size.double height = v170;
      v160.origin.double x = v173;
      v160.origin.double y = v172;
      if ([(NTKUpNextCollectionViewFlowLayout *)self _hasHeaderForSection:v22])
      {
        v31 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v22];
        v200.receiver = self;
        v200.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
        v32 = [(UICollectionViewFlowLayout *)&v200 layoutAttributesForSupplementaryViewOfKind:v156 atIndexPath:v31];
        v33 = (void *)[v32 copy];

        [v33 frame];
        v160.origin.double x = v34;
        v160.origin.double y = v35;
        v160.size.double width = v36;
        v160.size.double height = v37;
      }
      if (v30 >= 1)
      {
        double v159 = v15;
        uint64_t v38 = 0;
        uint64_t v39 = -v20;
        do
        {
          CGFloat v162 = width;
          CGFloat v163 = y;
          CGFloat v40 = v25;
          CGFloat v41 = tz;
          v42 = [MEMORY[0x1E4F28D58] indexPathForItem:v38 inSection:v22];
          v199.receiver = self;
          v199.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
          v43 = [(UICollectionViewFlowLayout *)&v199 layoutAttributesForItemAtIndexPath:v42];
          v44 = (void *)[v43 copy];

          if ([v42 compare:self->_topElementIndexPath] == -1
            || (double topItemsAlpha = 1.0, [v42 compare:self->_bottomElementIndexPath] == 1))
          {
            double topItemsAlpha = self->_topItemsAlpha;
          }
          [v44 frame];
          double v47 = v46;
          CGFloat v186 = v48;
          CGFloat tz = v49;
          double v25 = v50;
          v202.origin.double x = v24;
          v202.origin.double y = v23;
          v202.size.double width = v41;
          v202.size.double height = v40;
          v245.origin.double y = v172;
          v245.origin.double x = v173;
          v245.size.double height = v170;
          v245.size.double width = v171;
          BOOL v51 = CGRectEqualToRect(v202, v245);
          double v185 = v47;
          double v178 = topItemsAlpha;
          CGFloat v164 = x;
          if (v38 || !v51)
          {
            v203.origin.double x = v47;
            double v52 = v186;
            CGFloat v53 = tz;
            v203.origin.double y = v186;
            v203.size.double width = tz;
            v203.size.double height = v25;
            CGRectGetMinY(v203);
            v204.origin.double x = v24;
            v204.origin.double y = v23;
            v204.size.double width = v41;
            v204.size.double height = v40;
            CGRectGetMaxY(v204);
            [(UICollectionViewFlowLayout *)self minimumLineSpacing];
          }
          else
          {
            CGRectGetHeight(v160);
            double v52 = v186;
            CGFloat v53 = tz;
          }
          UIRectInset();
          CGFloat v176 = v54;
          CGFloat v177 = v55;
          CGFloat v57 = v56;
          CGFloat v59 = v58;
          v205.origin.double y = v182;
          v205.origin.double x = v183;
          v205.size.double height = v179;
          v205.size.double width = rect;
          double MinY = CGRectGetMinY(v205);
          v206.origin.double x = v47;
          v206.origin.double y = v52;
          v206.size.double width = v53;
          v206.size.double height = v25;
          double MaxY = CGRectGetMaxY(v206);
          [(UICollectionViewFlowLayout *)self minimumLineSpacing];
          double v63 = MaxY + v62;
          double v64 = 1.0;
          if (MinY >= v63)
          {
LABEL_31:
            double v66 = tz;
          }
          else
          {
            switch(v21)
            {
              case 0:
                v207.origin.double x = v47;
                v207.origin.double y = v186;
                v207.size.double width = tz;
                v207.size.double height = v25;
                double v65 = CGRectGetMinY(v207);
                v208.origin.double y = v182;
                v208.origin.double x = v183;
                v208.size.double height = v179;
                v208.size.double width = rect;
                if (v65 <= CGRectGetMinY(v208))
                {
                  [v44 setLayoutMode:0];
                  double v52 = v186;
                  uint64_t v21 = 1;
                  goto LABEL_31;
                }
                v209.origin.double y = v163;
                v209.origin.double x = v164;
                v209.size.double width = v162;
                v209.size.double height = rect1;
                v246.origin.double y = v172;
                v246.origin.double x = v173;
                v246.size.double height = v170;
                v246.size.double width = v171;
                if (CGRectEqualToRect(v209, v246))
                {
                  v210.origin.double x = v176;
                  v210.origin.double y = v177;
                  v210.size.double width = v57;
                  v210.size.double height = v59;
                  [(UICollectionViewFlowLayout *)self minimumLineSpacing];
                }
LABEL_21:
                [v44 setLayoutMode:1];
                v211.origin.double y = v182;
                v211.origin.double x = v183;
                v211.size.double height = v179;
                v211.size.double width = rect;
                CGRectGetMinY(v211);
                v212.origin.double x = v176;
                v212.origin.double y = v177;
                v212.size.double width = v57;
                v212.size.double height = v59;
                CGRectGetHeight(v212);
                [(UICollectionViewFlowLayout *)self minimumLineSpacing];
                v213.origin.double x = v47;
                double v52 = v186;
                double v66 = tz;
                v213.origin.double y = v186;
                v213.size.double width = tz;
                v213.size.double height = v25;
                CGRectGetMinY(v213);
                CLKReverseInterpolateFromFloats();
                double v68 = v67;
                v214.origin.double x = v176;
                v214.origin.double y = v177;
                v214.size.double width = v57;
                v214.size.double height = v59;
                CGRectGetHeight(v214);
                if (v68 < 1.0)
                {
                  CLKInterpolateBetweenFloatsClipped();
                  double v52 = v69;
                }
                CLKInterpolateBetweenFloatsClipped();
                objc_msgSend(v44, "setDarkeningAlphaUniform:");
                double v159 = v68;
                CLKInterpolateBetweenFloatsClipped();
                double v64 = v70;
                uint64_t v21 = 2;
                break;
              case 1:
                goto LABEL_21;
              case 2:
                [v44 setLayoutMode:2];
                if (self->_useFixedLowTransitionLayout)
                {
                  v215.origin.double y = v182;
                  v215.origin.double x = v183;
                  v215.size.double height = v179;
                  v215.size.double width = rect;
                  double v71 = CGRectGetMaxY(v215);
                  v216.origin.double x = v47;
                  v216.origin.double y = v186;
                  double v66 = tz;
                  v216.size.double width = tz;
                  v216.size.double height = v25;
                  double v52 = v71 - CGRectGetHeight(v216) - self->_highTransitionBottomOffset;
                }
                else
                {
                  v224.origin.double x = v183;
                  v224.origin.double y = v182;
                  v224.size.double width = rect;
                  v224.size.double height = v179;
                  CGRectGetMinY(v224);
                  v225.origin.double x = v176;
                  v225.origin.double y = v177;
                  v225.size.double width = v57;
                  v225.size.double height = v59;
                  CGRectGetHeight(v225);
                  v226.origin.double x = v183;
                  v226.origin.double y = v182;
                  v226.size.double width = rect;
                  v226.size.double height = v179;
                  CGRectGetMaxY(v226);
                  v227.origin.double x = v47;
                  v227.origin.double y = v186;
                  double v66 = tz;
                  v227.size.double width = tz;
                  v227.size.double height = v25;
                  CGRectGetHeight(v227);
                  CLKInterpolateBetweenFloatsClipped();
                  double v52 = v79;
                }
                CLKInterpolateBetweenFloatsClipped();
                double v64 = v80;
                CLKInterpolateBetweenFloatsClipped();
                objc_msgSend(v44, "setDarkeningAlphaUniform:");
                uint64_t v21 = 3;
                break;
              case 3:
                [v44 setLayoutMode:3];
                [v44 setDarkeningAlphaUniform:self->_maximumDarkeningAmount];
                CLKInterpolateBetweenFloatsClipped();
                v217.size.double height = v179;
                double v178 = v178 * v72;
                v217.origin.double y = v182;
                v217.origin.double x = v183;
                v217.size.double width = rect;
                CGRectGetMaxY(v217);
                v218.origin.double x = v47;
                v218.origin.double y = v186;
                double v66 = tz;
                v218.size.double width = tz;
                v218.size.double height = v25;
                CGRectGetHeight(v218);
                CLKInterpolateBetweenFloatsClipped();
                double v52 = v73;
                CLKInterpolateBetweenFloatsClipped();
                double v64 = v74;
                goto LABEL_29;
              case 4:
                [v44 setLayoutMode:4];
                v219.origin.double y = v182;
                v219.origin.double x = v183;
                v219.size.double height = v179;
                v219.size.double width = rect;
                double v75 = CGRectGetMaxY(v219);
                v220.origin.double x = v47;
                v220.origin.double y = v186;
                double v66 = tz;
                v220.size.double width = tz;
                v220.size.double height = v25;
                double v52 = v75 - CGRectGetHeight(v220) - self->_lowTransitionShift;
                double v178 = 0.0;
                double v64 = 0.4;
LABEL_29:
                uint64_t v21 = 4;
                break;
              default:
                double v52 = v186;
                goto LABEL_31;
            }
          }
          if (v22 < [(NSIndexPath *)self->_topElementIndexPath section]) {
            double v52 = v52 - self->_topItemsShift;
          }
          MEMORY[0x1C1874A70](v47, v52, v66, v25);
          long long v76 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          long long v196 = *MEMORY[0x1E4F1DAB8];
          long long v197 = v76;
          long long v198 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          if (fabs(v64 + -1.0) >= 0.00000011920929)
          {
            NTKUpNextMakeScaleTransformWithBoundsAndScale((uint64_t)&v196, v175, v64);
            [v44 setScale:v64];
          }
          [v44 setAlpha:v178];
          objc_msgSend(v44, "setFrame:", v47, v52, v66, v25);
          memset(&v195, 0, sizeof(v195));
          *(_OWORD *)&m.m11 = v196;
          *(_OWORD *)&m.m13 = v197;
          *(_OWORD *)&m.m21 = v198;
          CATransform3DMakeAffineTransform(&v195, (CGAffineTransform *)&m);
          CATransform3D v193 = v195;
          CATransform3DTranslate(&m, &v193, 0.0, 0.0, (double)v39);
          CATransform3D v195 = m;
          [v44 setTransform3D:&m];
          *(_OWORD *)&m.m11 = v196;
          *(_OWORD *)&m.m13 = v197;
          *(_OWORD *)&m.m21 = v198;
          CLKFrameFromCenterBoundsAndTransform();
          double x = v221.origin.x;
          double y = v221.origin.y;
          double width = v221.size.width;
          double height = v221.size.height;
          v247.origin.double y = v182;
          v247.origin.double x = v183;
          v247.size.double height = v179;
          v247.size.double width = rect;
          CGRect v222 = CGRectIntersection(v221, v247);
          CGRectGetHeight(v222);
          v223.origin.double x = x;
          v223.origin.double y = y;
          v223.size.double width = width;
          v223.size.double height = height;
          CGRectGetHeight(v223);
          CLKInterpolateBetweenFloatsClipped();
          objc_msgSend(v44, "setShadowAlpha:");
          objc_msgSend(v44, "setComputedFrame:", x, y, width, height);
          CGFloat rect1 = height;
          objc_msgSend(v44, "setUnitFrameOnScreen:", NTKUpNextUnitRectForFrameInBounds(x, y, width, height, v167, v166, v169, v168));
          -[NTKUpNextCollectionViewFlowLayout _updateVisibilityForLayoutAttributes:inBounds:](self, "_updateVisibilityForLayoutAttributes:inBounds:", v44, v167, v166, v169, v168);
          [v161 setObject:v44 forKeyedSubscript:v42];
          unint64_t v78 = [v174 count];
          if (v78 < NTKUpNextMaximumNumberOfDwellItems && [v44 fullyVisibleToUser]) {
            [v174 addObject:v42];
          }

          ++v38;
          --v39;
          CGFloat v24 = v185;
          CGFloat v23 = v186;
        }
        while (v30 != v38);
        uint64_t v20 = -v39;
        double v15 = v159;
      }
      ++v22;
    }
    while (v22 != v158);
  }
  v81 = (NSDictionary *)[v161 copy];
  layoutInfo = self->_layoutInfo;
  self->_layoutInfo = v81;

  v83 = (NSSet *)[v174 copy];
  dwellIndexPathes = self->_dwellIndexPathes;
  self->_dwellIndexPathes = v83;

  if (v158 < 1)
  {
    v149 = obj;
    objc_storeStrong((id *)&self->_headerLayoutInfo, obj);
    goto LABEL_67;
  }
  uint64_t v85 = 0;
  uint64_t v86 = *MEMORY[0x1E4FB2770];
  double v187 = *MEMORY[0x1E4F1DAD8];
  CGFloat v87 = v167;
  do
  {
    if (![(NTKUpNextCollectionViewFlowLayout *)self _hasHeaderForSection:v85]) {
      goto LABEL_62;
    }
    v88 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    uint64_t v89 = [v88 numberOfItemsInSection:v85];

    v90 = [MEMORY[0x1E4F28D58] indexPathForItem:v89 - 1 inSection:v85];
    v91 = [(NTKUpNextCollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v90];

    v92 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v85];
    v192.receiver = self;
    v192.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
    v93 = [(UICollectionViewFlowLayout *)&v192 layoutAttributesForSupplementaryViewOfKind:v86 atIndexPath:v92];
    v94 = (void *)[v93 copy];

    [v94 frame];
    double MinX = v95;
    double v98 = v97;
    double v100 = v99;
    double v102 = v101;
    v228.origin.double x = v87;
    v228.origin.double y = v166;
    v228.size.double height = v168;
    v228.size.double width = v169;
    double v103 = CGRectGetMinY(v228);
    v229.origin.double x = MinX;
    v229.origin.double y = v98;
    v229.size.double width = v100;
    v229.size.double height = v102;
    double v104 = v103 + CGRectGetHeight(v229);
    v105 = [(NTKUpNextCollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v92];
    [v105 computedFrame];
    CGFloat v107 = v106;
    CGFloat tza = v108;
    double v110 = v109;
    CGFloat v112 = v111;
    long long v113 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v196 = *MEMORY[0x1E4F1DAB8];
    long long v197 = v113;
    long long v198 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v114 = MinX;
    *(double *)&long long v113 = v98;
    double v115 = v100;
    double v116 = v102;
    if (CGRectGetMaxY(*(CGRect *)((char *)&v113 - 8)) >= v104)
    {
      CGFloat recta = v110;
      [v105 scale];
      CGFloat v119 = v118;
      [v105 alpha];
      [v94 setAlpha:v120 * self->_headerAlpha];
      objc_msgSend(v94, "setHidden:", objc_msgSend(v105, "isHidden"));
      if (fabs(v119 + -1.0) >= 0.00000011920929)
      {
        double v121 = tza;
        if ([v105 layoutMode])
        {
          v241.size.double height = v112;
          v241.origin.double x = v107;
          v241.origin.double y = tza;
          v241.size.double width = recta;
          double v148 = CGRectGetMinY(v241);
          v242.origin.double x = MinX;
          v242.origin.double y = v98;
          v242.size.double width = v100;
          v242.size.double height = v102;
          double v98 = v148 - CGRectGetHeight(v242);
          NTKUpNextMakeScaleTransformWithBoundsAndScale((uint64_t)&v196, v187, v119);
        }
        goto LABEL_53;
      }
    }
    else
    {
      [v91 computedFrame];
      double v117 = CGRectGetMaxY(v230);
      if (v117 < v104) {
        double v104 = v117;
      }
      v231.origin.double x = MinX;
      v231.origin.double y = v98;
      v231.size.double width = v100;
      v231.size.double height = v102;
      double v98 = v104 - CGRectGetHeight(v231);
      [v94 setAlpha:self->_headerAlpha];
    }
    double v121 = tza;
LABEL_53:
    v232.origin.double x = MinX;
    v232.origin.double y = v98;
    v232.size.double width = v100;
    v232.size.double height = v102;
    double v122 = CGRectGetMinY(v232);
    v233.origin.double y = v166;
    v233.origin.double x = v167;
    v233.size.double height = v168;
    v233.size.double width = v169;
    if (v122 >= CGRectGetMinY(v233) + self->_statusBarDecorationHeight) {
      double v123 = -v121;
    }
    else {
      double v123 = 11.0;
    }
    CGFloat tzb = v123;
    if ([(CLKDevice *)self->_device deviceCategory] != 1)
    {
      v234.origin.double x = MinX;
      v234.origin.double y = v98;
      v234.size.double width = v100;
      v234.size.double height = v102;
      double v124 = CGRectGetHeight(v234);
      v125 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
      objc_msgSend(v125, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 2, 1, MinX, v98, v124, v102);
      CGFloat v127 = v126;
      CGFloat v129 = v128;
      CGFloat v131 = v130;
      CGFloat v133 = v132;

      v235.origin.double x = v127;
      v235.origin.double y = v129;
      v235.size.double width = v131;
      v235.size.double height = v133;
      if (!CGRectIsNull(v235)) {
        goto LABEL_60;
      }
      v134 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
      [v134 bounds];
      CGFloat v136 = v135;
      CGFloat v184 = v137;
      CGFloat v139 = v138;
      CGFloat v141 = v140;

      v236.origin.double x = MinX;
      v236.origin.double y = v98;
      v236.size.double width = v100;
      v236.size.double height = v102;
      double v142 = CGRectGetMinY(v236);
      v237.origin.double x = v136;
      v237.origin.double y = v184;
      v237.size.double width = v139;
      v237.size.double height = v141;
      if (v142 < CGRectGetMinY(v237))
      {
        v143 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
        v238.origin.double x = v136;
        v238.origin.double y = v184;
        v238.size.double width = v139;
        v238.size.double height = v141;
        objc_msgSend(v143, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 2, 1, 0.0, CGRectGetMinY(v238), 50.0, 50.0);
        CGFloat v127 = v144;
        CGFloat v129 = v145;
        CGFloat v131 = v146;
        CGFloat v133 = v147;

        v239.origin.double x = v127;
        v239.origin.double y = v129;
        v239.size.double width = v131;
        v239.size.double height = v133;
        if (!CGRectIsNull(v239))
        {
LABEL_60:
          v240.origin.double x = v127;
          v240.origin.double y = v129;
          v240.size.double width = v131;
          v240.size.double height = v133;
          double MinX = CGRectGetMinX(v240);
        }
      }
    }
    MEMORY[0x1C1874A70](MinX, v98, v100, v102);
    objc_msgSend(v94, "setFrame:", MinX, v98, v100, v102);
    memset(&v195, 0, sizeof(v195));
    *(_OWORD *)&m.m11 = v196;
    *(_OWORD *)&m.m13 = v197;
    *(_OWORD *)&m.m21 = v198;
    CATransform3DMakeAffineTransform(&v195, (CGAffineTransform *)&m);
    CATransform3D v193 = v195;
    CATransform3DTranslate(&m, &v193, 0.0, 0.0, tzb);
    CATransform3D v195 = m;
    [v94 setTransform3D:&m];
    *(_OWORD *)&m.m11 = v196;
    *(_OWORD *)&m.m13 = v197;
    *(_OWORD *)&m.m21 = v198;
    CLKFrameFromCenterBoundsAndTransform();
    objc_msgSend(v94, "setComputedFrame:");
    [obj setObject:v94 forKeyedSubscript:v92];

    CGFloat v87 = v167;
LABEL_62:
    ++v85;
  }
  while (v158 != v85);
  v149 = obj;
  objc_storeStrong((id *)&self->_headerLayoutInfo, obj);
  v150 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  v151 = +[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"NTKUpNextCollectionViewFlowLayoutStatusBarDecorationKind" withIndexPath:v150];
  decorationLayoutInfo = self->_decorationLayoutInfo;
  self->_decorationLayoutInfo = v151;

  v153 = self->_decorationLayoutInfo;
  v243.origin.double x = v87;
  v243.origin.double y = v166;
  v243.size.double width = v169;
  v243.size.double height = v168;
  double v154 = CGRectGetMinY(v243);
  v244.origin.double x = v87;
  v244.origin.double y = v166;
  v244.size.double width = v169;
  v244.size.double height = v168;
  -[UICollectionViewLayoutAttributes setFrame:](v153, "setFrame:", 0.0, v154, CGRectGetWidth(v244), self->_statusBarDecorationHeight);
  [(UICollectionViewLayoutAttributes *)self->_decorationLayoutInfo setAlpha:self->_topItemsAlpha];
  v155 = self->_decorationLayoutInfo;
  CATransform3DMakeTranslation(&v191, 0.0, 0.0, 10.0);
  [(UICollectionViewLayoutAttributes *)v155 setTransform3D:&v191];
LABEL_67:
}

- (void)finalizeCollectionViewUpdates
{
  v14.receiver = self;
  v14.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  [(NTKUpNextCollectionViewFlowLayout *)&v14 finalizeCollectionViewUpdates];
  if (self->_indexPathToSnapTo)
  {
    v3 = [(NTKUpNextCollectionViewFlowLayout *)self flowLayoutAttributesForItemAtIndexPath:"flowLayoutAttributesForItemAtIndexPath:"];
    [v3 frame];
    -[NTKUpNextCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:");
    double v5 = v4;
    double v7 = v6 + self->_snappingOffset;
    double v8 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;

    id v13 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    objc_msgSend(v13, "setBounds:", v5, v7, v10, v12);
  }
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  v3 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v5, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v3 setInvalidateFlowLayoutAttributes:0];
  [v3 setInvalidateFlowLayoutDelegateMetrics:0];
  return v3;
}

- (id)flowLayoutAttributesForItemAtIndexPath:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  v3 = [(UICollectionViewFlowLayout *)&v5 layoutAttributesForItemAtIndexPath:a3];
  return v3;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return [(NSDictionary *)self->_layoutInfo objectForKeyedSubscript:a3];
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return [(NSDictionary *)self->_headerLayoutInfo objectForKeyedSubscript:a4];
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return self->_decorationLayoutInfo;
}

- (void)_updateVisibilityForLayoutAttributes:(id)a3 inBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v16 = a3;
  [v16 computedFrame];
  double MaxY = CGRectGetMaxY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v9 = CGRectGetMinY(v19) + self->_statusBarDecorationHeight;
  [(UICollectionViewFlowLayout *)self minimumLineSpacing];
  BOOL v11 = MaxY < v9 + v10 + 0.5;
  [v16 computedFrame];
  double MinY = CGRectGetMinY(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  LODWORD(self) = MinY >= CGRectGetMinY(v21) + self->_statusBarDecorationHeight + -0.5;
  uint64_t v14 = [v16 layoutMode];
  uint64_t v15 = v14 == 4 || v11;
  if (v14 == 4) {
    self = 0;
  }
  else {
    self = (NTKUpNextCollectionViewFlowLayout *)self;
  }
  [v16 setNotVisibleToUser:v15];
  [v16 setFullyVisibleToUser:self];
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  double v8 = objc_opt_new();
  BOOL showingAllAttributes = self->_showingAllAttributes;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  double v10 = [(NSDictionary *)self->_layoutInfo allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (showingAllAttributes) {
          goto LABEL_7;
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * i) computedFrame];
        v46.origin.CGFloat x = v16;
        v46.origin.CGFloat y = v17;
        v46.size.CGFloat width = v18;
        v46.size.CGFloat height = v19;
        v44.origin.CGFloat x = x;
        v44.origin.CGFloat y = y;
        v44.size.CGFloat width = width;
        v44.size.CGFloat height = height;
        if (CGRectIntersectsRect(v44, v46))
        {
          [v15 alpha];
          if (fabs(v20) >= 0.00000011920929) {
LABEL_7:
          }
            [v8 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v12);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  CGRect v21 = [(NSDictionary *)self->_headerLayoutInfo allValues];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        if (showingAllAttributes) {
          goto LABEL_19;
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * j) computedFrame];
        v47.origin.CGFloat x = v27;
        v47.origin.CGFloat y = v28;
        v47.size.CGFloat width = v29;
        v47.size.CGFloat height = v30;
        v45.origin.CGFloat x = x;
        v45.origin.CGFloat y = y;
        v45.size.CGFloat width = width;
        v45.size.CGFloat height = height;
        if (CGRectIntersectsRect(v45, v47)) {
LABEL_19:
        }
          [v8 addObject:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v23);
  }

  if (self->_decorationLayoutInfo) {
    objc_msgSend(v8, "addObject:");
  }
  return v8;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  -[NTKUpNextCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", a3.x, a3.y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a3.y;
  CGFloat x = a3.x;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (self->_snappingEnabled)
  {
    double v7 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    uint64_t v8 = [v7 numberOfSections];

    if (v8 < 1)
    {
      double v10 = 0;
    }
    else
    {
      double v10 = 0;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v12 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
        uint64_t v13 = [v12 numberOfItemsInSection:i];

        uint64_t v9 = v13 - 1;
        if (v13 >= 1)
        {
          uint64_t v14 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:i];

          double v10 = (void *)v14;
        }
      }
    }
    uint64_t v15 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    UIRectInsetEdges();
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    v73.receiver = self;
    v73.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
    CGFloat v30 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v73, sel_layoutAttributesForElementsInRect_, v17, y, v19, v21);
    v31 = objc_opt_new();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v32 = v30;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v69 objects:v75 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v70 != v35) {
            objc_enumerationMutation(v32);
          }
          long long v37 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          [v37 frame];
          v81.origin.CGFloat x = v23;
          v81.origin.double y = v25;
          v81.size.CGFloat width = v27;
          v81.size.double height = v29;
          if (CGRectIntersectsRect(v78, v81) && ![v37 representedElementCategory]) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v69 objects:v75 count:16];
      }
      while (v34);
    }
    double v63 = y;

    double v38 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v64 = *MEMORY[0x1E4F1DAD8];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v39 = v31;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v66;
      double v43 = 0.0;
      while (2)
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v66 != v42) {
            objc_enumerationMutation(v39);
          }
          CGRect v45 = *(void **)(*((void *)&v65 + 1) + 8 * k);
          [v45 frame];
          v82.origin.CGFloat x = v46;
          v82.origin.double y = v47;
          v82.size.CGFloat width = v48;
          v82.size.double height = v49;
          v79.origin.CGFloat x = v23;
          v79.origin.double y = v25;
          v79.size.CGFloat width = v27;
          v79.size.double height = v29;
          CGRect v80 = CGRectIntersection(v79, v82);
          double height = v80.size.height;
          objc_msgSend(v45, "frame", v80.origin.x, v80.origin.y, v80.size.width);
          double v52 = height / v51;
          if (v52 > 0.449999988
            || ([v45 indexPath],
                CGFloat v53 = objc_claimAutoreleasedReturnValue(),
                char v54 = [v53 isEqual:v10],
                v53,
                (v54 & 1) != 0))
          {
            [v45 frame];
            CGFloat x = v57;
            double y = v58 - self->_topOffsetForSnapping;

            goto LABEL_35;
          }
          if (v52 > v43)
          {
            [v45 frame];
            double v64 = v55;
            double v38 = v56;
            double v43 = v52;
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v65 objects:v74 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }
    else
    {
      double v43 = 0.0;
    }

    double v59 = fabs(v43);
    CGFloat x = v62;
    double y = v63;
    if (v59 >= 0.00000011920929)
    {
      double y = v38 - self->_topOffsetForSnapping;
      CGFloat x = v64;
    }
LABEL_35:
  }
  double v60 = x;
  double v61 = y;
  result.double y = v61;
  result.CGFloat x = v60;
  return result;
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    objc_super v5 = (void *)[(NSSet *)self->_previousSectionsWithHeaders mutableCopy];
    [v5 minusSet:self->_sectionsWithHeaders];
    v20.receiver = self;
    v20.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
    double v6 = [(NTKUpNextCollectionViewFlowLayout *)&v20 indexPathsToDeleteForSupplementaryViewOfKind:v4];
    double v7 = (void *)[v6 mutableCopy];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "integerValue"));
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
    double v7 = [(NTKUpNextCollectionViewFlowLayout *)&v15 indexPathsToDeleteForSupplementaryViewOfKind:v4];
  }

  return v7;
}

- (void)_updateSectionHeaderListIfNeeded
{
  if (self->_needsHeaderUpdate)
  {
    self->_needsHeaderUpdate = 0;
    objc_storeStrong((id *)&self->_previousSectionsWithHeaders, self->_sectionsWithHeaders);
    id v9 = (id)objc_opt_new();
    double v3 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    uint64_t v4 = [v3 numberOfSections];

    if (v4 >= 1)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if ([(NTKUpNextCollectionViewFlowLayout *)self _hasHeaderForSection:i])
        {
          double v6 = [NSNumber numberWithInteger:i];
          [v9 addObject:v6];
        }
      }
    }
    double v7 = (NSSet *)[v9 copy];
    sectionsWithHeaders = self->_sectionsWithHeaders;
    self->_sectionsWithHeaders = v7;
  }
}

- (void)_updateContentInsetsIfNeeded
{
  if (self->_needsInsetsUpdate)
  {
    self->_needsInsetsUpdate = 0;
    double v3 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    uint64_t v4 = [v3 numberOfSections];

    NSInteger v5 = [(NSIndexPath *)self->_topElementIndexPath section];
    if (v5 >= v4)
    {
      id v12 = 0;
      double v7 = 0;
    }
    else
    {
      NSInteger v6 = v5;
      double v7 = 0;
      id v8 = 0;
      do
      {
        id v9 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
        uint64_t v10 = [v9 numberOfItemsInSection:v6];

        if (v10 < 1)
        {
          id v12 = v8;
        }
        else
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            id v12 = v7;

            double v7 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:v6];

            id v8 = v12;
          }
        }
        ++v6;
        id v8 = v12;
      }
      while (v6 != v4);
    }
    uint64_t v13 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    [v13 contentInset];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    if (v12) {
      objc_super v20 = v12;
    }
    else {
      objc_super v20 = v7;
    }
    id v21 = v20;
    if (v21)
    {
      v41.receiver = self;
      v41.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
      uint64_t v22 = [(UICollectionViewFlowLayout *)&v41 layoutAttributesForItemAtIndexPath:v21];
      [v22 frame];
      CGFloat v23 = CGRectGetMinY(v42) - self->_topOffsetForSnapping;
      [(UICollectionViewFlowLayout *)self collectionViewContentSize];
      double v25 = v24 - v23;
      double v26 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
      [v26 bounds];
      double v27 = CGRectGetHeight(v43) - v25;
    }
    else
    {
      double v27 = 0.0;
    }
    double v28 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    [v28 contentInset];
    if (v17 == v32 && v15 == v29 && v19 == v31)
    {
      double v33 = v30;

      if (v27 == v33)
      {
LABEL_25:

        return;
      }
    }
    else
    {
    }
    uint64_t v34 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    [v34 contentOffset];
    double v36 = v35;
    double v38 = v37;

    id v39 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    objc_msgSend(v39, "setContentInset:", v15, v17, v27, v19);

    uint64_t v40 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
    objc_msgSend(v40, "setContentOffset:animated:", 0, v36, v38);

    goto LABEL_25;
  }
}

- (BOOL)_hasHeaderForSection:(int64_t)a3
{
  NSInteger v5 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
  NSInteger v6 = [v5 delegate];
  double v7 = [(NTKUpNextCollectionViewFlowLayout *)self collectionView];
  [v6 collectionView:v7 layout:self referenceSizeForHeaderInSection:a3];
  double v9 = v8;
  double v11 = v10;

  return v11 != *(double *)(MEMORY[0x1E4F1DB30] + 8) || v9 != *MEMORY[0x1E4F1DB30];
}

- (double)topItemsAlpha
{
  return self->_topItemsAlpha;
}

- (double)headerAlpha
{
  return self->_headerAlpha;
}

- (double)topItemsShift
{
  return self->_topItemsShift;
}

- (void)setTopItemsShift:(double)a3
{
  self->_topItemsShift = a3;
}

- (double)statusBarDecorationHeight
{
  return self->_statusBarDecorationHeight;
}

- (void)setStatusBarDecorationHeight:(double)a3
{
  self->_statusBarDecorationHeight = a3;
}

- (NSIndexPath)topElementIndexPath
{
  return self->_topElementIndexPath;
}

- (void)setTopElementIndexPath:(id)a3
{
}

- (NSIndexPath)bottomElementIndexPath
{
  return self->_bottomElementIndexPath;
}

- (void)setBottomElementIndexPath:(id)a3
{
}

- (double)topOffsetForSnapping
{
  return self->_topOffsetForSnapping;
}

- (double)topOffsetForScrolling
{
  return self->_topOffsetForScrolling;
}

- (double)lowTransitionScale
{
  return self->_lowTransitionScale;
}

- (void)setLowTransitionScale:(double)a3
{
  self->_lowTransitionScale = a3;
}

- (double)lowTransitionShift
{
  return self->_lowTransitionShift;
}

- (void)setLowTransitionShift:(double)a3
{
  self->_lowTransitionShift = a3;
}

- (double)highTransitionScale
{
  return self->_highTransitionScale;
}

- (void)setHighTransitionScale:(double)a3
{
  self->_highTransitionScale = a3;
}

- (double)highTransitionShift
{
  return self->_highTransitionShift;
}

- (void)setHighTransitionShift:(double)a3
{
  self->_highTransitionShift = a3;
}

- (BOOL)useFixedLowTransitionLayout
{
  return self->_useFixedLowTransitionLayout;
}

- (void)setUseFixedLowTransitionLayout:(BOOL)a3
{
  self->_useFixedLowTransitionLayout = a3;
}

- (double)maximumDarkeningAmount
{
  return self->_maximumDarkeningAmount;
}

- (double)highTransitionBottomOffset
{
  return self->_highTransitionBottomOffset;
}

- (void)setHighTransitionBottomOffset:(double)a3
{
  self->_highTransitionBottomOffset = a3;
}

- (BOOL)isSnappingEnabled
{
  return self->_snappingEnabled;
}

- (void)setSnappingEnabled:(BOOL)a3
{
  self->_snappingEnabled = a3;
}

- (BOOL)isShowingAllAttributes
{
  return self->_showingAllAttributes;
}

- (void)setShowingAllAttributes:(BOOL)a3
{
  self->_BOOL showingAllAttributes = a3;
}

- (NSIndexPath)indexPathToSnapTo
{
  return self->_indexPathToSnapTo;
}

- (void)setIndexPathToSnapTo:(id)a3
{
}

- (double)snappingOffset
{
  return self->_snappingOffset;
}

- (void)setSnappingOffset:(double)a3
{
  self->_snappingOffset = a3;
}

- (NSSet)dwellIndexPathes
{
  return self->_dwellIndexPathes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dwellIndexPathes, 0);
  objc_storeStrong((id *)&self->_indexPathToSnapTo, 0);
  objc_storeStrong((id *)&self->_bottomElementIndexPath, 0);
  objc_storeStrong((id *)&self->_topElementIndexPath, 0);
  objc_storeStrong((id *)&self->_sectionsWithHeaders, 0);
  objc_storeStrong((id *)&self->_previousSectionsWithHeaders, 0);
  objc_storeStrong((id *)&self->_decorationLayoutInfo, 0);
  objc_storeStrong((id *)&self->_headerLayoutInfo, 0);
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end