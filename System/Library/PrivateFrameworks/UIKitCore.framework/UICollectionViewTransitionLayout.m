@interface UICollectionViewTransitionLayout
- (BOOL)_supportsAdvancedTransitionAnimations;
- (CGFloat)transitionProgress;
- (CGFloat)valueForAnimatedKey:(NSString *)key;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result;
- (CGRect)_newVisibleBounds;
- (CGRect)_oldVisibleBounds;
- (CGSize)collectionViewContentSize;
- (UICollectionViewLayout)currentLayout;
- (UICollectionViewLayout)nextLayout;
- (UICollectionViewTransitionLayout)init;
- (UICollectionViewTransitionLayout)initWithCoder:(NSCoder *)coder;
- (UICollectionViewTransitionLayout)initWithCurrentLayout:(UICollectionViewLayout *)currentLayout nextLayout:(UICollectionViewLayout *)newLayout;
- (id)interpolatedLayoutAttributesFromLayoutAttributes:(id)a3 toLayoutAttributes:(id)a4 progress:(double)a5;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)_finalizeLayoutTransition;
- (void)_prepareForTransitionFromLayout:(id)a3;
- (void)_prepareForTransitionToLayout:(id)a3;
- (void)_setCollectionView:(id)a3;
- (void)invalidateLayout;
- (void)prepareLayout;
- (void)setTransitionProgress:(CGFloat)transitionProgress;
- (void)updateValue:(CGFloat)value forAnimatedKey:(NSString *)key;
@end

@implementation UICollectionViewTransitionLayout

- (UICollectionViewTransitionLayout)initWithCurrentLayout:(UICollectionViewLayout *)currentLayout nextLayout:(UICollectionViewLayout *)newLayout
{
  v7 = currentLayout;
  v8 = newLayout;
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewTransitionLayout;
  v9 = [(UICollectionViewLayout *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fromLayout, currentLayout);
    objc_storeStrong((id *)&v10->_toLayout, newLayout);
    v10->_layoutIsValid = 0;
    v10->_accuracy = 1.0;
  }

  return v10;
}

- (UICollectionViewTransitionLayout)initWithCoder:(NSCoder *)coder
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTransitionLayout;
  return [(UICollectionViewLayout *)&v4 initWithCoder:coder];
}

- (UICollectionViewTransitionLayout)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UICollectionViewTransitionLayout.m" lineNumber:78 description:@"-[UICollectionViewTransitionLayout init] is not a valid initializer - use -initWithCurrentLayout:nextLayout: instead"];

  return 0;
}

- (void)_setCollectionView:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewTransitionLayout;
  -[UICollectionViewLayout _setCollectionView:](&v11, sel__setCollectionView_);
  if (a3)
  {
    fromLayout = self->_fromLayout;
    v6 = [(UICollectionViewLayout *)self collectionView];
    [(UICollectionViewLayout *)fromLayout _setCollectionView:v6];

    toLayout = self->_toLayout;
    v8 = [(UICollectionViewLayout *)self collectionView];
    [(UICollectionViewLayout *)toLayout _setCollectionView:v8];
  }
  v9 = +[UIScreen mainScreen];
  [v9 scale];
  self->_accuracy = v10;
}

- (void)invalidateLayout
{
  v2.receiver = self;
  v2.super_class = (Class)UICollectionViewTransitionLayout;
  [(UICollectionViewLayout *)&v2 invalidateLayout];
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 0;
}

- (void)_finalizeLayoutTransition
{
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewTransitionLayout;
  [(UICollectionViewLayout *)&v3 _finalizeLayoutTransition];
  [(UICollectionViewLayout *)self->_toLayout _finalizeLayoutTransition];
}

- (void)_prepareForTransitionFromLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTransitionLayout;
  [(UICollectionViewLayout *)&v4 _prepareForTransitionFromLayout:a3];
  [(UICollectionViewTransitionLayout *)self _prepareForTransitionToLayout:self->_toLayout];
  [(UICollectionViewLayout *)self->_toLayout _prepareForTransitionFromLayout:self];
}

- (void)_prepareForTransitionToLayout:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewTransitionLayout;
  [(UICollectionViewLayout *)&v3 _prepareForTransitionToLayout:a3];
}

- (void)prepareLayout
{
  uint64_t v230 = *MEMORY[0x1E4F143B8];
  if (self->_layoutIsValid) {
    return;
  }
  self->_layoutIsValid = 1;
  [(UICollectionViewLayout *)self->_fromLayout _prepareLayout];
  [(UICollectionViewLayout *)self->_toLayout _prepareLayout];
  if ([(UICollectionViewLayout *)self->_fromLayout _supportsAdvancedTransitionAnimations])
  {
    BOOL v184 = [(UICollectionViewLayout *)self->_toLayout _supportsAdvancedTransitionAnimations];
  }
  else
  {
    BOOL v184 = 0;
  }
  objc_super v3 = [(UICollectionViewLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  p_fromVisibleBounds = &self->_fromVisibleBounds;
  self->_fromVisibleBounds.origin.x = v5;
  self->_fromVisibleBounds.origin.y = v7;
  self->_fromVisibleBounds.size.width = v9;
  self->_fromVisibleBounds.size.height = v11;
  [(UICollectionViewLayout *)self->_fromLayout collectionViewContentSize];
  double v14 = v13;
  [(UICollectionViewLayout *)self->_toLayout collectionViewContentSize];
  if (v14 >= v15) {
    double v15 = v14;
  }
  self->_contentSize.width = v15;
  [(UICollectionViewLayout *)self->_fromLayout collectionViewContentSize];
  double v17 = v16;
  [(UICollectionViewLayout *)self->_toLayout collectionViewContentSize];
  if (v17 >= v18) {
    double v19 = v17;
  }
  else {
    double v19 = v18;
  }
  self->_contentSize.height = v19;
  v20 = -[UICollectionViewLayout layoutAttributesForElementsInRect:](self->_fromLayout, "layoutAttributesForElementsInRect:", v5, v7, v9, v11);
  unint64_t v21 = 0x1E4F1C000uLL;
  v191 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v20, "count"));
  if (!self->_transitionInformationsDict)
  {
    v22 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v20, "count"));
    transitionInformationsDict = self->_transitionInformationsDict;
    self->_transitionInformationsDict = v22;
  }
  v194 = self;
  long long v221 = 0u;
  long long v222 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  id v24 = v20;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v219 objects:v229 count:16];
  id obj = v24;
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v220;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v220 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = (void *)[*(id *)(*((void *)&v219 + 1) + 8 * i) copy];
        v30 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v29);
        [v191 addObject:v30];
        v31 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
        [v31 setObject:v29 forKey:@"fromAttribute"];
        [(NSMutableDictionary *)v194->_transitionInformationsDict setObject:v31 forKey:v30];
      }
      id v24 = obj;
      uint64_t v26 = [obj countByEnumeratingWithState:&v219 objects:v229 count:16];
    }
    while (v26);
  }

  v32 = v194;
  v33 = [(UICollectionViewLayout *)v194 collectionView];
  uint64_t v34 = [v33 _pivotForTransitionFromLayout:v32->_fromLayout toLayout:v32->_toLayout];

  double MidX = CGRectGetMidX(*p_fromVisibleBounds);
  double MidY = CGRectGetMidY(*p_fromVisibleBounds);
  v181 = (void *)v34;
  if (v34)
  {
    -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](v194->_fromLayout, "layoutAttributesForItemAtIndexPath:", v34, MidY);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    v38 = (void *)[v37 copy];
  }
  else
  {
    double v39 = MidY;
    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v37 = v24;
    v38 = (void *)[v37 countByEnumeratingWithState:&v215 objects:v228 count:16];
    if (v38)
    {
      v40 = 0;
      uint64_t v41 = *(void *)v216;
      double v42 = 3.40282347e38;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v216 != v41) {
            objc_enumerationMutation(v37);
          }
          v44 = *(id **)(*((void *)&v215 + 1) + 8 * (void)j);
          v45 = -[UIBarButtonItemGroup _items](v44);
          int v46 = [v45 isEqualToString:0x1ED1062C0];

          if (v46)
          {
            [v44 center];
            *(float *)&double v47 = (v47 - MidX) * (v47 - MidX) + (v48 - v39) * (v48 - v39);
            double v49 = sqrtf(*(float *)&v47);
            if (v42 > v49)
            {
              uint64_t v50 = [v44 copy];

              double v42 = v49;
              v40 = (void *)v50;
            }
          }
        }
        v38 = (void *)[v37 countByEnumeratingWithState:&v215 objects:v228 count:16];
      }
      while (v38);
      v32 = v194;
      uint64_t v34 = 0;
      v38 = v40;
      unint64_t v21 = 0x1E4F1C000;
    }
    else
    {
      uint64_t v34 = 0;
    }
  }

  toLayout = v32->_toLayout;
  v52 = [v38 indexPath];
  v53 = [(UICollectionViewLayout *)toLayout layoutAttributesForItemAtIndexPath:v52];

  if (v38)
  {
    if (v34)
    {
      [v53 frame];
      double v55 = v54;
      double v57 = v56;
      [v38 frame];
      double v59 = v58 - v5;
      [v38 frame];
      double v5 = v55 - v59;
      double v7 = v57 - (v60 - v7);
    }
    else
    {
      [v53 center];
      double v5 = v61 - v9 * 0.5;
      double v7 = v62 - v11 * 0.5;
    }
  }
  [(UICollectionViewLayout *)v32->_toLayout collectionViewContentSize];
  double v64 = v63;
  double v66 = v65;
  double v67 = 0.0;
  v231.origin.x = 0.0;
  v231.origin.y = 0.0;
  v231.size.width = v64;
  v231.size.height = v66;
  v234.origin.x = v5;
  v234.origin.y = v7;
  v234.size.width = v9;
  v234.size.height = v11;
  v179 = v53;
  v180 = v38;
  if (CGRectContainsRect(v231, v234))
  {
    double v67 = v5;
  }
  else
  {
    v232.origin.x = 0.0;
    v232.origin.y = 0.0;
    v232.size.width = v64;
    v232.size.height = v66;
    v235.origin.x = v5;
    v235.origin.y = v7;
    v235.size.width = v9;
    v235.size.height = v11;
    CGRect v233 = CGRectIntersection(v232, v235);
    if (v64 > v9)
    {
      if (v233.size.width >= v9)
      {
        double v67 = v5;
      }
      else
      {
        double v68 = v9 - v233.size.width;
        if (v233.origin.x <= v5) {
          double v69 = -v68;
        }
        else {
          double v69 = v68;
        }
        double v67 = v5 + v69;
      }
    }
    if (v66 <= v11)
    {
      double v7 = 0.0;
    }
    else if (v233.size.height < v11)
    {
      double v70 = v11 - v233.size.height;
      if (v233.origin.y <= v7) {
        double v70 = -(v11 - v233.size.height);
      }
      double v7 = v7 + v70;
    }
  }
  v71 = [(UICollectionViewLayout *)v32 collectionView];
  [v71 contentInset];
  double v73 = v67 - v72;
  v74 = [(UICollectionViewLayout *)v32 collectionView];
  [v74 contentInset];
  double v76 = v7 - v75;

  -[UICollectionViewLayout targetContentOffsetForProposedContentOffset:](v32->_toLayout, "targetContentOffsetForProposedContentOffset:", v73, v76);
  v32->_toVisibleBounds.origin.x = v77;
  v32->_toVisibleBounds.origin.y = v78;
  v32->_toVisibleBounds.size.width = v9;
  v32->_toVisibleBounds.size.height = v11;
  v79 = [(UICollectionViewLayout *)v32->_toLayout layoutAttributesForElementsInRect:"layoutAttributesForElementsInRect:"];
  v190 = objc_msgSend(*(id *)(v21 + 2688), "setWithCapacity:", objc_msgSend(v79, "count"));
  long long v211 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  id v189 = v79;
  uint64_t v80 = [v189 countByEnumeratingWithState:&v211 objects:v227 count:16];
  if (v80)
  {
    uint64_t v81 = v80;
    uint64_t v82 = *(void *)v212;
    do
    {
      for (uint64_t k = 0; k != v81; ++k)
      {
        if (*(void *)v212 != v82) {
          objc_enumerationMutation(v189);
        }
        v84 = (void *)[*(id *)(*((void *)&v211 + 1) + 8 * k) copy];
        v85 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v84);
        [v190 addObject:v85];
        v86 = [(NSMutableDictionary *)v32->_transitionInformationsDict objectForKey:v85];
        if (!v86)
        {
          v86 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
        }
        [v86 setObject:v84 forKey:@"toAttribute"];
        [(NSMutableDictionary *)v32->_transitionInformationsDict setObject:v86 forKey:v85];
      }
      uint64_t v81 = [v189 countByEnumeratingWithState:&v211 objects:v227 count:16];
    }
    while (v81);
  }

  v87 = [MEMORY[0x1E4F1CA80] setWithSet:v190];
  v88 = [MEMORY[0x1E4F1CA80] setWithSet:v191];
  v89 = [MEMORY[0x1E4F1CA80] setWithSet:v190];
  [v87 minusSet:v191];
  [v88 minusSet:v190];
  v178 = v89;
  [v89 intersectSet:v191];
  long long v209 = 0u;
  long long v210 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  id v188 = v88;
  uint64_t v90 = [v188 countByEnumeratingWithState:&v207 objects:v226 count:16];
  if (v90)
  {
    uint64_t v91 = v90;
    uint64_t v92 = *(void *)v208;
    do
    {
      uint64_t v93 = 0;
      do
      {
        if (*(void *)v208 != v92) {
          objc_enumerationMutation(v188);
        }
        uint64_t v94 = *(void *)(*((void *)&v207 + 1) + 8 * v93);
        v95 = [(NSMutableDictionary *)v32->_transitionInformationsDict objectForKey:v94];
        if (!v94)
        {
          v97 = 0;
          goto LABEL_70;
        }
        uint64_t v96 = *(void *)(v94 + 32);
        if (v96 != 1)
        {
          if (v96) {
            goto LABEL_75;
          }
          v97 = *(void **)(v94 + 8);
LABEL_70:
          v98 = v32->_toLayout;
          id v99 = v97;
          v100 = [(UICollectionViewLayout *)v98 layoutAttributesForItemAtIndexPath:v99];
          v101 = (void *)[v100 copy];

          if (v101) {
            goto LABEL_74;
          }
          goto LABEL_75;
        }
        v102 = v32->_toLayout;
        id v103 = *(id *)(v94 + 16);
        id v104 = *(id *)(v94 + 8);
        v105 = [(UICollectionViewLayout *)v102 layoutAttributesForSupplementaryViewOfKind:v103 atIndexPath:v104];
        v101 = (void *)[v105 copy];

        v32 = v194;
        if (v101
          || ([v95 objectForKey:@"fromAttribute"],
              v106 = objc_claimAutoreleasedReturnValue(),
              v101 = (void *)[v106 copy],
              v106,
              [v101 setAlpha:0.0],
              v101))
        {
LABEL_74:
          [v95 setObject:v101 forKey:@"toAttribute"];
        }
LABEL_75:

        ++v93;
      }
      while (v91 != v93);
      uint64_t v107 = [v188 countByEnumeratingWithState:&v207 objects:v226 count:16];
      uint64_t v91 = v107;
    }
    while (v107);
  }

  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  id v187 = v87;
  uint64_t v108 = [v187 countByEnumeratingWithState:&v203 objects:v225 count:16];
  if (!v108) {
    goto LABEL_97;
  }
  uint64_t v109 = v108;
  uint64_t v110 = *(void *)v204;
  do
  {
    uint64_t v111 = 0;
    do
    {
      if (*(void *)v204 != v110) {
        objc_enumerationMutation(v187);
      }
      uint64_t v112 = *(void *)(*((void *)&v203 + 1) + 8 * v111);
      v113 = [(NSMutableDictionary *)v194->_transitionInformationsDict objectForKey:v112];
      if (!v112)
      {
        v115 = 0;
        goto LABEL_88;
      }
      uint64_t v114 = *(void *)(v112 + 32);
      if (v114 != 1)
      {
        if (v114) {
          goto LABEL_93;
        }
        v115 = *(void **)(v112 + 8);
LABEL_88:
        fromLayout = v194->_fromLayout;
        id v117 = v115;
        v118 = [(UICollectionViewLayout *)fromLayout layoutAttributesForItemAtIndexPath:v117];
        v119 = (void *)[v118 copy];

        if (v119) {
          goto LABEL_92;
        }
        goto LABEL_93;
      }
      v120 = v194->_fromLayout;
      id v121 = *(id *)(v112 + 16);
      id v122 = *(id *)(v112 + 8);
      v123 = [(UICollectionViewLayout *)v120 layoutAttributesForSupplementaryViewOfKind:v121 atIndexPath:v122];
      v119 = (void *)[v123 copy];

      if (v119
        || ([v113 objectForKey:@"toAttribute"],
            v124 = objc_claimAutoreleasedReturnValue(),
            v119 = (void *)[v124 copy],
            v124,
            [v119 setAlpha:0.0],
            v119))
      {
LABEL_92:
        [v113 setObject:v119 forKey:@"fromAttribute"];
      }
LABEL_93:

      ++v111;
    }
    while (v109 != v111);
    uint64_t v125 = [v187 countByEnumeratingWithState:&v203 objects:v225 count:16];
    uint64_t v109 = v125;
  }
  while (v125);
LABEL_97:

  v126 = v194;
  if (!v184) {
    goto LABEL_149;
  }
  [(NSMutableDictionary *)v194->_transitionInformationsDict allKeys];
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  id v182 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v185 = [v182 countByEnumeratingWithState:&v199 objects:v224 count:16];
  if (!v185) {
    goto LABEL_148;
  }
  uint64_t v183 = *(void *)v200;
  while (2)
  {
    uint64_t v127 = 0;
    while (2)
    {
      if (*(void *)v200 != v183) {
        objc_enumerationMutation(v182);
      }
      uint64_t v128 = *(void *)(*((void *)&v199 + 1) + 8 * v127);
      v129 = [(NSMutableDictionary *)v126->_transitionInformationsDict objectForKey:v128];
      v130 = [v129 objectForKey:@"fromAttribute"];
      v131 = [v129 objectForKey:@"toAttribute"];
      if (v128)
      {
        uint64_t v132 = *(void *)(v128 + 32);
        switch(v132)
        {
          case 2:
            v150 = v126->_fromLayout;
            id v151 = *(id *)(v128 + 16);
            id v152 = *(id *)(v128 + 8);
            v153 = [(UICollectionViewLayout *)v150 finalLayoutAttributesForDisappearingDecorationElementOfKind:v151 atIndexPath:v152];
            v137 = (_WORD *)[v153 copy];

            v154 = v126->_toLayout;
            id v140 = *(id *)(v128 + 16);
            id v141 = *(id *)(v128 + 8);
            v149 = [(UICollectionViewLayout *)v154 initialLayoutAttributesForAppearingDecorationElementOfKind:v140 atIndexPath:v141];
            break;
          case 1:
            v143 = v126->_fromLayout;
            id v144 = *(id *)(v128 + 16);
            v145 = v126;
            id v146 = *(id *)(v128 + 8);
            v147 = [(UICollectionViewLayout *)v143 finalLayoutAttributesForDisappearingSupplementaryElementOfKind:v144 atIndexPath:v146];
            v137 = (_WORD *)[v147 copy];

            v148 = v145->_toLayout;
            id v140 = *(id *)(v128 + 16);
            id v141 = *(id *)(v128 + 8);
            v149 = [(UICollectionViewLayout *)v148 initialLayoutAttributesForAppearingSupplementaryElementOfKind:v140 atIndexPath:v141];
            break;
          case 0:
            v133 = *(void **)(v128 + 8);
            goto LABEL_108;
          default:
            v142 = 0;
LABEL_118:
            if (-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v142, (uint64_t)v130)) {
              v156 = v131;
            }
            else {
              v156 = (_WORD *)[v130 copy];
            }
            v137 = v156;
            if (!v142) {
              goto LABEL_122;
            }
            goto LABEL_126;
        }
        v155 = v149;
        v142 = (void *)[v149 copy];
      }
      else
      {
        v133 = 0;
LABEL_108:
        v134 = v126->_fromLayout;
        id v135 = v133;
        v136 = [(UICollectionViewLayout *)v134 finalLayoutAttributesForDisappearingItemAtIndexPath:v135];
        v137 = (_WORD *)[v136 copy];

        if (v128) {
          v138 = *(void **)(v128 + 8);
        }
        else {
          v138 = 0;
        }
        v139 = v126->_toLayout;
        id v140 = v138;
        id v141 = [(UICollectionViewLayout *)v139 initialLayoutAttributesForAppearingItemAtIndexPath:v140];
        v142 = (void *)[v141 copy];
      }

      v126 = v194;
      if (!v137) {
        goto LABEL_118;
      }
      if (!v142)
      {
LABEL_122:
        if (-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v137, (uint64_t)v131)) {
          v157 = v130;
        }
        else {
          v157 = (_WORD *)[v131 copy];
        }
        v142 = v157;
      }
LABEL_126:
      if ((!-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v137, (uint64_t)v131)
         || (-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v142, (uint64_t)v130) & 1) == 0)
        && (!-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v142, (uint64_t)v131)
         || (-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v137, (uint64_t)v130) & 1) == 0)
        && (-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v130, (uint64_t)v131) & 1) == 0)
      {
        unsigned int v158 = -[UICollectionViewLayoutAttributes _isTransitionVisibleTo:](v130, v137);
        unsigned int v159 = -[UICollectionViewLayoutAttributes _isTransitionVisibleTo:](v142, v131);
        if (v158 && v159)
        {
          [v129 setObject:v142 forKey:@"fromAttribute"];
          v160 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v129, "count"));
          v161 = -[_UICollectionViewItemKey copyAsClone:]((id *)v128, 1);
          if (v137) {
            v137[144] |= 8u;
          }
          if (v130) {
            v130[144] |= 8u;
          }
          [v160 setObject:v130 forKey:@"fromAttribute"];
          [v160 setObject:v137 forKey:@"toAttribute"];
          [(NSMutableDictionary *)v126->_transitionInformationsDict setObject:v160 forKey:v161];
        }
        else
        {
          if (v158)
          {
            v162 = v129;
            v163 = v137;
            v164 = @"toAttribute";
          }
          else
          {
            if (!v159) {
              goto LABEL_143;
            }
            v162 = v129;
            v163 = v142;
            v164 = @"fromAttribute";
          }
          [v162 setObject:v163 forKey:v164];
        }
      }
LABEL_143:

      if (v185 != ++v127) {
        continue;
      }
      break;
    }
    uint64_t v165 = [v182 countByEnumeratingWithState:&v199 objects:v224 count:16];
    uint64_t v185 = v165;
    if (v165) {
      continue;
    }
    break;
  }
LABEL_148:

LABEL_149:
  v192 = [MEMORY[0x1E4F1CA48] array];
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  id v193 = [(NSMutableDictionary *)v126->_transitionInformationsDict allKeys];
  uint64_t v166 = [v193 countByEnumeratingWithState:&v195 objects:v223 count:16];
  if (v166)
  {
    uint64_t v167 = v166;
    uint64_t v168 = *(void *)v196;
    do
    {
      for (uint64_t m = 0; m != v167; ++m)
      {
        if (*(void *)v196 != v168) {
          objc_enumerationMutation(v193);
        }
        uint64_t v170 = *(void *)(*((void *)&v195 + 1) + 8 * m);
        v171 = [(NSMutableDictionary *)v194->_transitionInformationsDict objectForKey:v170];
        v172 = [v171 objectForKey:@"fromAttribute"];
        v173 = [v171 objectForKey:@"toAttribute"];
        if ((-[UICollectionViewLayoutAttributes _isTransitionVisibleTo:](v172, v173) & 1) == 0)
        {
          [v172 alpha];
          if (v174 == 0.0) {
            int v175 = 1;
          }
          else {
            int v175 = [v172 isHidden];
          }
          [v173 alpha];
          if (v176 == 0.0) {
            int v177 = 1;
          }
          else {
            int v177 = [v173 isHidden];
          }
          if ((v175 & v177) == 1) {
            [v192 addObject:v170];
          }
          else {
            [v171 removeObjectForKey:@"toAttribute"];
          }
        }
      }
      uint64_t v167 = [v193 countByEnumeratingWithState:&v195 objects:v223 count:16];
    }
    while (v167);
  }

  [(NSMutableDictionary *)v194->_transitionInformationsDict removeObjectsForKeys:v192];
}

- (CGRect)_oldVisibleBounds
{
  double x = self->_fromVisibleBounds.origin.x;
  double y = self->_fromVisibleBounds.origin.y;
  double width = self->_fromVisibleBounds.size.width;
  double height = self->_fromVisibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_newVisibleBounds
{
  double x = self->_toVisibleBounds.origin.x;
  double y = self->_toVisibleBounds.origin.y;
  double width = self->_toVisibleBounds.size.width;
  double height = self->_toVisibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)updateValue:(CGFloat)value forAnimatedKey:(NSString *)key
{
  double v6 = key;
  id v7 = [(UICollectionViewLayout *)self collectionView];
  [v7 _trackLayoutValue:v6 forKey:value];
}

- (CGFloat)valueForAnimatedKey:(NSString *)key
{
  double v4 = key;
  double v5 = [(UICollectionViewLayout *)self collectionView];
  [v5 _trackedLayoutValueForKey:v4];
  double v7 = v6;

  return v7;
}

- (void)setTransitionProgress:(CGFloat)transitionProgress
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v5 = 0.0;
  if (transitionProgress >= 0.0) {
    double v5 = transitionProgress;
  }
  if (transitionProgress <= 1.0) {
    double v6 = v5;
  }
  else {
    double v6 = 1.0;
  }
  *(float64x2_t *)obja = vaddq_f64((float64x2_t)self->_fromVisibleBounds.origin, vmulq_n_f64(vsubq_f64((float64x2_t)self->_toVisibleBounds.origin, (float64x2_t)self->_fromVisibleBounds.origin), v6));
  double v18 = v6;
  double v7 = [(UICollectionViewLayout *)self collectionView];
  [v7 setContentOffset:*(_OWORD *)obja];

  self->_transitionProgress = transitionProgress;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(NSMutableDictionary *)self->_transitionInformationsDict allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = [(NSMutableDictionary *)self->_transitionInformationsDict objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        double v13 = [v12 objectForKey:@"fromAttribute"];
        double v14 = [v12 objectForKey:@"toAttribute"];
        double v15 = [(UICollectionViewTransitionLayout *)self interpolatedLayoutAttributesFromLayoutAttributes:v13 toLayoutAttributes:v14 progress:v18];
        [v12 setObject:v15 forKey:@"actualAttribute"];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  [(UICollectionViewTransitionLayout *)self invalidateLayout];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result
{
  if (self->_transitionProgress == 0.0 && self->_layoutIsValid) {
    return self->_fromVisibleBounds.origin;
  }
  return result;
}

- (CGSize)collectionViewContentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)interpolatedLayoutAttributesFromLayoutAttributes:(id)a3 toLayoutAttributes:(id)a4 progress:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)[v8 copy];
    [v9 setHidden:0];
    [v7 center];
    double v12 = v11;
    double v14 = v13;
    [v9 center];
    double v16 = v15;
    double v18 = v17;
    [v7 size];
    double v64 = v20;
    double v65 = v19;
    [v9 size];
    double v22 = v21;
    double v24 = v23;
    float64x2_t v25 = 0uLL;
    float64x2_t v83 = 0u;
    float64x2_t v84 = 0u;
    float64x2_t v81 = 0u;
    float64x2_t v82 = 0u;
    float64x2_t v79 = 0u;
    float64x2_t v80 = 0u;
    float64x2_t v77 = 0u;
    float64x2_t v78 = 0u;
    if (v7)
    {
      [v7 transform3D];
      float64x2_t v25 = 0uLL;
    }
    float64x2_t v75 = v25;
    float64x2_t v76 = v25;
    float64x2_t v73 = v25;
    float64x2_t v74 = v25;
    float64x2_t v71 = v25;
    float64x2_t v72 = v25;
    float64x2_t v69 = v25;
    float64x2_t v70 = v25;
    [v9 transform3D];
    [v7 alpha];
    double v27 = v26;
    [v9 alpha];
    double v28 = (v16 - v12) * a5;
    double v29 = (v18 - v14) * a5;
    double v30 = v22 - v65;
    double v31 = v24 - v64;
    *(float64x2_t *)&v68.m31 = v81;
    *(float64x2_t *)&v68.m33 = v82;
    double v33 = v27 + (v32 - v27) * a5;
    *(float64x2_t *)&v68.m41 = v83;
    *(float64x2_t *)&v68.m43 = v84;
    *(float64x2_t *)&v68.m11 = v77;
    *(float64x2_t *)&v68.m13 = v78;
    *(float64x2_t *)&v68.m21 = v79;
    *(float64x2_t *)&v68.m23 = v80;
    if (!CATransform3DIsIdentity(&v68)) {
      goto LABEL_7;
    }
    *(float64x2_t *)&v68.m31 = v73;
    *(float64x2_t *)&v68.m33 = v74;
    *(float64x2_t *)&v68.m41 = v75;
    *(float64x2_t *)&v68.m43 = v76;
    *(float64x2_t *)&v68.m11 = v69;
    *(float64x2_t *)&v68.m13 = v70;
    *(float64x2_t *)&v68.m21 = v71;
    *(float64x2_t *)&v68.m23 = v72;
    if (CATransform3DIsIdentity(&v68))
    {
      float64x2_t v60 = *(float64x2_t *)(MEMORY[0x1E4F39B10] + 96);
      float64x2_t v62 = *(float64x2_t *)(MEMORY[0x1E4F39B10] + 112);
      float64x2_t v56 = *(float64x2_t *)(MEMORY[0x1E4F39B10] + 64);
      float64x2_t v58 = *(float64x2_t *)(MEMORY[0x1E4F39B10] + 80);
      float64x2_t v52 = *(float64x2_t *)(MEMORY[0x1E4F39B10] + 32);
      float64x2_t v54 = *(float64x2_t *)(MEMORY[0x1E4F39B10] + 48);
      float64x2_t v48 = *(float64x2_t *)MEMORY[0x1E4F39B10];
      float64x2_t v50 = *(float64x2_t *)(MEMORY[0x1E4F39B10] + 16);
      double v34 = a5;
    }
    else
    {
LABEL_7:
      double v34 = a5;
      float64x2_t v60 = vaddq_f64(v83, vmulq_n_f64(vsubq_f64(v75, v83), a5));
      float64x2_t v62 = vaddq_f64(v84, vmulq_n_f64(vsubq_f64(v76, v84), a5));
      float64x2_t v56 = vaddq_f64(v81, vmulq_n_f64(vsubq_f64(v73, v81), a5));
      float64x2_t v58 = vaddq_f64(v82, vmulq_n_f64(vsubq_f64(v74, v82), a5));
      float64x2_t v52 = vaddq_f64(v79, vmulq_n_f64(vsubq_f64(v71, v79), a5));
      float64x2_t v54 = vaddq_f64(v80, vmulq_n_f64(vsubq_f64(v72, v80), a5));
      float64x2_t v48 = vaddq_f64(v77, vmulq_n_f64(vsubq_f64(v69, v77), a5));
      float64x2_t v50 = vaddq_f64(v78, vmulq_n_f64(vsubq_f64(v70, v78), a5));
    }
    double v35 = v30 * v34;
    double v36 = v31 * v34;
    double v37 = v12 + v28;
    double v38 = v14 + v29;
    objc_msgSend(v10, "setAlpha:", v33, *(_OWORD *)&v48, *(_OWORD *)&v50, *(_OWORD *)&v52, *(_OWORD *)&v54, *(_OWORD *)&v56, *(_OWORD *)&v58, *(_OWORD *)&v60, *(_OWORD *)&v62);
    v67[0] = v49;
    v67[1] = v51;
    v67[2] = v53;
    v67[3] = v55;
    v67[4] = v57;
    v67[5] = v59;
    v67[6] = v61;
    v67[7] = v63;
    [v10 setTransform3D:v67];
    double v39 = self->_accuracy + self->_accuracy;
    if (v39 == 1.0)
    {
      double v40 = round(v37);
      double v41 = round(v38);
    }
    else
    {
      double v40 = round(v37 * v39) / v39;
      double v41 = round(v38 * v39) / v39;
    }
    double v42 = v65 + v35;
    double v43 = v64 + v36;
    objc_msgSend(v10, "setCenter:", v40, v41);
    accuracdouble y = self->_accuracy;
    if (accuracy == 1.0)
    {
      double v45 = round(v42);
      double v46 = round(v43);
    }
    else
    {
      double v45 = round(v42 * accuracy) / accuracy;
      double v46 = round(v43 * accuracy) / accuracy;
    }
    objc_msgSend(v10, "setSize:", v45, v46);
  }
  else
  {
    uint64_t v10 = (void *)[v7 copy];
  }

  return v10;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v4);
  double v6 = [(NSMutableDictionary *)self->_transitionInformationsDict objectForKey:v5];
  id v7 = [v6 objectForKey:@"actualAttribute"];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    goto LABEL_26;
  }
  if (v6)
  {
    uint64_t v10 = [v6 objectForKey:@"fromAttribute"];
    double v11 = [v6 objectForKey:@"toAttribute"];
    if (v10) {
      goto LABEL_12;
    }
  }
  else
  {
    double v11 = 0;
  }
  double v12 = [(UICollectionViewLayout *)self->_fromLayout collectionView];

  if (v12)
  {
    uint64_t v13 = [(UICollectionViewLayout *)self->_fromLayout layoutAttributesForItemAtIndexPath:v4];
    if (v13) {
      goto LABEL_11;
    }
  }
  uint64_t v10 = [(UICollectionViewLayout *)self->_toLayout collectionView];

  if (v10)
  {
    uint64_t v13 = [(UICollectionViewLayout *)self->_toLayout initialLayoutAttributesForAppearingItemAtIndexPath:v4];
LABEL_11:
    uint64_t v10 = (void *)v13;
  }
LABEL_12:
  if (!v11)
  {
    double v19 = [(UICollectionViewLayout *)self->_toLayout collectionView];

    if (!v19
      || ([(UICollectionViewLayout *)self->_toLayout layoutAttributesForItemAtIndexPath:v4], (double v11 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      double v11 = [(UICollectionViewLayout *)self->_fromLayout collectionView];

      if (!v11) {
        goto LABEL_18;
      }
      double v11 = [(UICollectionViewLayout *)self->_fromLayout finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
    }
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    double transitionProgress = self->_transitionProgress;
    double v16 = 0.0;
    if (transitionProgress >= 0.0) {
      double v16 = self->_transitionProgress;
    }
    if (transitionProgress <= 1.0) {
      double v17 = v16;
    }
    else {
      double v17 = 1.0;
    }
    -[UICollectionViewTransitionLayout interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:](self, "interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:", v10, v11, v17, 1.0, v16);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_18:
  id v9 = 0;
LABEL_25:

LABEL_26:
  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UICollectionViewItemKey collectionItemKeyForSupplementaryViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, v6, v7);
  id v9 = [(NSMutableDictionary *)self->_transitionInformationsDict objectForKey:v8];
  uint64_t v10 = [v9 objectForKey:@"actualAttribute"];
  double v11 = v10;
  if (v10)
  {
    id v12 = v10;
    goto LABEL_26;
  }
  if (v9)
  {
    uint64_t v13 = [v9 objectForKey:@"fromAttribute"];
    BOOL v14 = [v9 objectForKey:@"toAttribute"];
    if (v13) {
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  double v15 = [(UICollectionViewLayout *)self->_fromLayout collectionView];

  if (v15)
  {
    uint64_t v16 = [(UICollectionViewLayout *)self->_fromLayout layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
    if (v16) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = [(UICollectionViewLayout *)self->_toLayout collectionView];

  if (v13)
  {
    uint64_t v16 = [(UICollectionViewLayout *)self->_toLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:v6 atIndexPath:v7];
LABEL_11:
    uint64_t v13 = (void *)v16;
  }
LABEL_12:
  if (!v14)
  {
    double v22 = [(UICollectionViewLayout *)self->_toLayout collectionView];

    if (!v22
      || ([(UICollectionViewLayout *)self->_toLayout layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7], (BOOL v14 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v14 = [(UICollectionViewLayout *)self->_fromLayout collectionView];

      if (!v14) {
        goto LABEL_18;
      }
      BOOL v14 = [(UICollectionViewLayout *)self->_fromLayout finalLayoutAttributesForDisappearingSupplementaryElementOfKind:v6 atIndexPath:v7];
    }
  }
  if (v13) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    double transitionProgress = self->_transitionProgress;
    double v19 = 0.0;
    if (transitionProgress >= 0.0) {
      double v19 = self->_transitionProgress;
    }
    if (transitionProgress <= 1.0) {
      double v20 = v19;
    }
    else {
      double v20 = 1.0;
    }
    -[UICollectionViewTransitionLayout interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:](self, "interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:", v13, v14, v20, 1.0, v19);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_18:
  id v12 = 0;
LABEL_25:

LABEL_26:
  return v12;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, v6, v7);
  id v9 = [(NSMutableDictionary *)self->_transitionInformationsDict objectForKey:v8];
  uint64_t v10 = [v9 objectForKey:@"actualAttribute"];
  double v11 = v10;
  if (v10)
  {
    id v12 = v10;
    goto LABEL_25;
  }
  if (v9)
  {
    uint64_t v13 = [v9 objectForKey:@"fromAttribute"];
    BOOL v14 = [v9 objectForKey:@"toAttribute"];
    if (v13) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  uint64_t v13 = [(UICollectionViewLayout *)self->_fromLayout collectionView];

  if (v13)
  {
    uint64_t v13 = [(UICollectionViewLayout *)self->_fromLayout layoutAttributesForDecorationViewOfKind:v6 atIndexPath:v7];
  }
LABEL_9:
  if (!v14)
  {
    BOOL v14 = [(UICollectionViewLayout *)self->_toLayout collectionView];

    if (!v14) {
      goto LABEL_17;
    }
    BOOL v14 = [(UICollectionViewLayout *)self->_toLayout layoutAttributesForDecorationViewOfKind:v6 atIndexPath:v7];
  }
  if (v13) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    double transitionProgress = self->_transitionProgress;
    double v17 = 0.0;
    if (transitionProgress >= 0.0) {
      double v17 = self->_transitionProgress;
    }
    if (transitionProgress <= 1.0) {
      double v18 = v17;
    }
    else {
      double v18 = 1.0;
    }
    -[UICollectionViewTransitionLayout interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:](self, "interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:", v13, v14, v18, 1.0, v17);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_17:
  id v12 = 0;
LABEL_24:

LABEL_25:
  return v12;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  double v5 = [(NSMutableDictionary *)self->_transitionInformationsDict allKeys];
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(NSMutableDictionary *)self->_transitionInformationsDict allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [(NSMutableDictionary *)self->_transitionInformationsDict objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        uint64_t v13 = [v12 objectForKey:@"actualAttribute"];
        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (UICollectionViewLayout)currentLayout
{
  return self->_fromLayout;
}

- (UICollectionViewLayout)nextLayout
{
  return self->_toLayout;
}

- (CGFloat)transitionProgress
{
  return self->_transitionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearingLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_disappearingLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_currentLayoutInfos, 0);
  objc_storeStrong((id *)&self->_transitionInformationsDict, 0);
  objc_storeStrong((id *)&self->_toLayout, 0);
  objc_storeStrong((id *)&self->_fromLayout, 0);
}

@end