@interface TUIRenderModelSection
- ($2CA2891FAFAFF7AC585D88E48F4DD71B)config;
- (BOOL)containsLiveTransforms;
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGAffineTransform)transform;
- (CGPoint)offset;
- (CGRect)frame;
- (CGSize)size;
- (NSArray)containedSubmodels;
- (NSArray)debugContainedSubmodels;
- (NSArray)errors;
- (NSArray)impressions;
- (NSArray)linkEntities;
- (NSArray)viewModels;
- (NSDictionary)hoverRegions;
- (NSDictionary)identifierToContainedSubmodelMap;
- (NSDictionary)identifierToModelMap;
- (NSString)description;
- (NSUUID)UUID;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIAnimationGroupRenderModelCollection)animationRenderModels;
- (TUIFeedEntry)entry;
- (TUIIdentifier)identifier;
- (TUIRenderModelIdentifierInterest)identifierInterest;
- (TUIRenderModelIdentifierMap)identifierMap;
- (TUIRenderModelSection)initWithEntry:(id)a3 submodels:(id)a4 config:(id *)a5 impressions:(id)a6 linkEntities:(id)a7 hoverRegions:(id)a8 identifierMap:(id)a9 layoutQueue:(id)a10;
- (_NSRange)viewRange;
- (double)alpha;
- (id).cxx_construct;
- (id)_finalRenderModelForDeletedRenderModel:(id)a3;
- (id)_initWithSection:(id)a3;
- (id)_initialRenderModelForInsertedRenderModel:(id)a3;
- (id)_layoutAttributesForImpression:(id)a3 index:(unint64_t)a4 snapshot:(id)a5;
- (id)_layoutAttributesForViewModel:(id)a3 index:(unint64_t)a4 withLiveTransformResolver:(id)a5;
- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6;
- (id)computeDeletedFrom:(id)a3;
- (id)computeInsertedFrom:(id)a3;
- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3;
- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3;
- (id)copySubmodel:(id)a3 forFinalAppearanceWithFlags:(unint64_t)a4;
- (id)copySubmodel:(id)a3 forInitialAppearanceWithFlags:(unint64_t)a4;
- (id)copyWithContainedSubmodels:(id)a3;
- (id)copyWithErrors:(id)a3;
- (id)copyWithSection:(unint64_t)a3 offset:(CGPoint)a4 size:(CGSize)a5 uuid:(id)a6;
- (id)copyWithSection:(unint64_t)a3 offset:(CGPoint)a4 uuid:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifierForViewAtIndex:(unint64_t)a3;
- (id)initForTestWithFrame:(CGRect)a3;
- (id)layoutAttributes;
- (id)layoutAttributesForImpressionAtIndexPath:(id)a3 snapshot:(id)a4;
- (id)layoutAttributesForViewAtIndexPath:(id)a3 withLiveTransformResolver:(id)a4;
- (id)layoutAttributesForViewModel:(id)a3 atIndexPath:(id)a4 withLiveTransformResolver:(id)a5;
- (id)liveTransformsForKind:(Class)a3;
- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4;
- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4;
- (id)viewAtIndexPath:(id)a3 factory:(id)a4 host:(id)a5;
- (id)viewModelForIndexPath:(id)a3;
- (id)viewModelWithIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)kind;
- (unint64_t)section;
- (void)appendImpressionLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 snapshot:(id)a5;
- (void)appendLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 withLiveTransformResolver:(id)a5;
- (void)appendLiveTransformLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 withLiveTransformResolver:(id)a5;
- (void)appendLiveTransformViewInvalidationMap:(id)a3;
- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)setAlpha:(double)a3;
- (void)setAnimationGroups:(id)a3;
- (void)setAnimationRenderModels:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)updateWithSection:(unint64_t)a3 offset:(CGPoint)a4;
@end

@implementation TUIRenderModelSection

- (id)initForTestWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)TUIRenderModelSection;
  id result = [(TUIRenderModelSection *)&v10 init];
  if (result)
  {
    *((CGFloat *)result + 1) = x;
    *((CGFloat *)result + 2) = y;
    *((CGFloat *)result + 26) = width;
    *((CGFloat *)result + 27) = height;
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)((char *)result + 248) = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v9 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)((char *)result + 264) = v8;
    *(_OWORD *)((char *)result + 280) = v9;
    *((void *)result + 13) = 0x3FF0000000000000;
  }
  return result;
}

- (id)_initWithSection:(id)a3
{
  v4 = (TUIRenderModelSection *)a3;
  v26.receiver = self;
  v26.super_class = (Class)TUIRenderModelSection;
  v5 = [(TUIRenderModelSection *)&v26 init];
  v6 = v5;
  v7 = v5;
  if (v4 && v5)
  {
    objc_storeStrong((id *)&v5->_entry, v4->_entry);
    long long v8 = (NSArray *)[(NSArray *)v4->_viewModels copy];
    viewModels = v7->_viewModels;
    v7->_viewModels = v8;

    objc_super v10 = (NSArray *)[(NSArray *)v4->_impressions copy];
    impressions = v7->_impressions;
    v7->_impressions = v10;

    v12 = (NSArray *)[(NSArray *)v4->_linkEntities copy];
    linkEntities = v7->_linkEntities;
    v7->_linkEntities = v12;

    v14 = (NSDictionary *)[(NSDictionary *)v4->_hoverRegions copy];
    hoverRegions = v7->_hoverRegions;
    v7->_hoverRegions = v14;

    v7->_offset = v4->_offset;
    v7->_containsLiveTransforms = v4->_containsLiveTransforms;
    v16 = (NSArray *)[(NSArray *)v4->_errors copy];
    errors = v7->_errors;
    v7->_errors = v16;

    v18 = (TUIIdentifier *)[(TUIIdentifier *)v4->_identifier copyWithZone:0];
    identifier = v7->_identifier;
    v7->_identifier = v18;

    v7->_size = v4->_size;
    if (v6 != v4) {
      sub_DB1DC((uint64_t **)&v6->_viewMap, (void *)v4->_viewMap.__tree_.__begin_node_, &v4->_viewMap.__tree_.__pair1_.__value_.__left_);
    }
    v7->_viewRange = v4->_viewRange;
    objc_storeStrong((id *)&v6->_identifierInterest, v4->_identifierInterest);
    objc_storeStrong((id *)&v6->_identifierMap, v4->_identifierMap);
    objc_storeStrong((id *)&v6->_identifierToModelMap, v4->_identifierToModelMap);
    objc_storeStrong((id *)&v6->_containedSubmodels, v4->_containedSubmodels);
    objc_storeStrong((id *)&v6->_layoutQueue, v4->_layoutQueue);
    long long v20 = *(_OWORD *)&v4->_config.flipHorizontal;
    v7->_config.zIndeCGFloat x = v4->_config.zIndex;
    *(_OWORD *)&v7->_config.flipHorizontal = v20;
    long long v21 = *(_OWORD *)&v4->_transform.a;
    long long v22 = *(_OWORD *)&v4->_transform.tx;
    *(_OWORD *)&v6->_transform.c = *(_OWORD *)&v4->_transform.c;
    *(_OWORD *)&v6->_transform.tCGFloat x = v22;
    *(_OWORD *)&v7->_transform.a = v21;
    v7->_alpha = v4->_alpha;
    v23 = (TUIAnimationGroupRenderModelCollection *)[(TUIAnimationGroupRenderModelCollection *)v4->_animationRenderModels copy];
    animationRenderModels = v7->_animationRenderModels;
    v7->_animationRenderModels = v23;
  }
  return v7;
}

- (TUIRenderModelSection)initWithEntry:(id)a3 submodels:(id)a4 config:(id *)a5 impressions:(id)a6 linkEntities:(id)a7 hoverRegions:(id)a8 identifierMap:(id)a9 layoutQueue:(id)a10
{
  id v66 = a3;
  id v71 = a4;
  id v67 = a6;
  id v68 = a7;
  id v69 = a8;
  id v70 = a9;
  id v17 = a10;
  v78.receiver = self;
  v78.super_class = (Class)TUIRenderModelSection;
  v18 = [(TUIRenderModelSection *)&v78 init];
  v19 = v18;
  if (v18)
  {
    id obj = a9;
    id v65 = v17;
    objc_storeStrong((id *)&v18->_entry, a3);
    v19->_offset = CGPointZero;
    v19->_section = 0;
    long long v20 = *(_OWORD *)&a5->var0;
    v19->_config.zIndeCGFloat x = a5->var2;
    v19->_size = CGSizeZero;
    *(_OWORD *)&v19->_config.flipHorizontal = v20;
    v19->_alpha = 1.0;
    long long v21 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v19->_transform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v22 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v19->_transform.c = v21;
    *(_OWORD *)&v19->_transform.tCGFloat x = v22;
    v63 = objc_opt_new();
    v23 = (NSArray *)[v71 copy];
    containedSubmodels = v19->_containedSubmodels;
    v19->_containedSubmodels = v23;

    objc_storeStrong((id *)&v19->_layoutQueue, a10);
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_D82A4;
    v76[3] = &unk_2551A8;
    id v25 = v63;
    id v77 = v25;
    [v71 enumerateObjectsUsingBlock:v76];
    objc_super v26 = objc_opt_new();
    v64 = v25;
    if ([v25 count])
    {
      uint64_t v27 = [v70 mapViewModels:v25 a9];
      viewModels = v19->_viewModels;
      v19->_viewModels = (NSArray *)v27;

      v29 = v19->_viewModels;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v30 = v29;
      id v31 = [(NSArray *)v30 countByEnumeratingWithState:&v80 objects:v86 count:16];
      if (v31)
      {
        uint64_t v32 = 0;
        uint64_t v33 = *(void *)v81;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v81 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            id v79 = 0;
            id v79 = [v35 itemIndex];
            v84 = &v79;
            sub_DB11C((uint64_t **)&v19->_viewMap, (unint64_t *)&v79, (uint64_t)&std::piecewise_construct, (uint64_t **)&v84)[5] = (uint64_t)i + v32;
          }
          id v31 = [(NSArray *)v30 countByEnumeratingWithState:&v80 objects:v86 count:16];
          v32 += (uint64_t)i;
        }
        while (v31);
      }

      p_pair1 = &v19->_viewMap.__tree_.__pair1_;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)v19->_viewMap.__tree_.__pair1_.__value_.__left_;
      NSUInteger v38 = *((void *)v19->_viewMap.__tree_.__begin_node_ + 4);
      if (left)
      {
        do
        {
          v39 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)left[1];
        }
        while (left);
      }
      else
      {
        do
        {
          v39 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)p_pair1[2].__value_.__left_;
          BOOL v40 = *v39 == p_pair1;
          p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *)v39;
        }
        while (v40);
      }
      uint64_t v41 = (uint64_t)&v39[4]->__value_.__left_ - v38 + 1;
      v19->_viewRange.location = v38;
      v19->_viewRange.length = v41;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v42 = v19->_viewModels;
      BOOL v43 = 0;
      id v44 = [(NSArray *)v42 countByEnumeratingWithState:&v72 objects:v85 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v73;
        do
        {
          for (j = 0; j != v44; j = (char *)j + 1)
          {
            if (*(void *)v73 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
            if (v43)
            {
              BOOL v43 = 1;
            }
            else
            {
              v48 = [*(id *)(*((void *)&v72 + 1) + 8 * (void)j) liveTransform];
              BOOL v43 = v48 != 0;
            }
            v49 = [v47 identifier];
            [v26 setObject:v47 forKeyedSubscript:v49];
          }
          id v44 = [(NSArray *)v42 countByEnumeratingWithState:&v72 objects:v85 count:16];
        }
        while (v44);
      }

      v19->_containsLiveTransforms = v43;
    }
    else
    {
      v19->_viewRange = (_NSRange)xmmword_243050;
      v19->_containsLiveTransforms = 0;
    }
    uint64_t v50 = [v70 collectInterestWithInvalidationQueue:v65 obj];
    identifierInterest = v19->_identifierInterest;
    v19->_identifierInterest = (TUIRenderModelIdentifierInterest *)v50;

    objc_storeStrong((id *)&v19->_identifierMap, obja);
    v52 = (NSArray *)[v67 copy];
    impressions = v19->_impressions;
    v19->_impressions = v52;

    v54 = (NSArray *)[v68 copy];
    linkEntities = v19->_linkEntities;
    v19->_linkEntities = v54;

    v56 = (NSDictionary *)[v69 copy];
    hoverRegions = v19->_hoverRegions;
    v19->_hoverRegions = v56;

    v58 = (NSDictionary *)[v26 copy];
    identifierToModelMap = v19->_identifierToModelMap;
    v19->_identifierToModelMap = v58;

    id v17 = v65;
  }

  return v19;
}

- (id)copyWithContainedSubmodels:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  entrCGFloat y = self->_entry;
  $7AF9110C763A695B008BC8833C72FFC6 config = self->_config;
  v7 = (char *)[v5 initWithEntry:entry submodels:v4 config:&config impressions:self->_impressions linkEntities:self->_linkEntities hoverRegions:self->_hoverRegions identifierMap:self->_identifierMap layoutQueue:self->_layoutQueue];
  *((_OWORD *)v7 + 13) = self->_size;
  long long v8 = *(_OWORD *)&self->_config.flipHorizontal;
  *((void *)v7 + 30) = self->_config.zIndex;
  *((_OWORD *)v7 + 14) = v8;
  *((void *)v7 + 17) = self->_section;
  *(CGPoint *)(v7 + 8) = self->_offset;
  objc_storeStrong((id *)v7 + 16, self->_UUID);
  id v9 = [(NSArray *)self->_errors copy];
  objc_super v10 = (void *)*((void *)v7 + 25);
  *((void *)v7 + 25) = v9;

  return v7;
}

- (NSArray)debugContainedSubmodels
{
  return self->_containedSubmodels;
}

- (id)copyWithErrors:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIRenderModelSection *)self copyWithContainedSubmodels:self->_containedSubmodels];
  id v6 = [v4 copy];
  v7 = (void *)v5[25];
  v5[25] = v6;

  return v5;
}

- (id)copySubmodel:(id)a3 forFinalAppearanceWithFlags:(unint64_t)a4
{
  return 0;
}

- (id)copySubmodel:(id)a3 forInitialAppearanceWithFlags:(unint64_t)a4
{
  return 0;
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  id v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = self->_viewModels;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_super v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = -[TUIRenderModelSection copySubmodel:forInitialAppearanceWithFlags:](self, "copySubmodel:forInitialAppearanceWithFlags:", v10, a3, (void)v17);
        v12 = v11;
        if (v11) {
          id v13 = v11;
        }
        else {
          id v13 = [v10 copyForInitialAppearanceWithFlags:a3];
        }
        v14 = v13;

        [v5 addObject:v14];
      }
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v15 = [(TUIRenderModelSection *)self copyWithContainedSubmodels:v5];
  return v15;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  id v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = self->_viewModels;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_super v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = -[TUIRenderModelSection copySubmodel:forFinalAppearanceWithFlags:](self, "copySubmodel:forFinalAppearanceWithFlags:", v10, a3, (void)v17);
        v12 = v11;
        if (v11) {
          id v13 = v11;
        }
        else {
          id v13 = [v10 copyForFinalAppearanceWithFlags:a3];
        }
        v14 = v13;

        [v5 addObject:v14];
      }
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v15 = [(TUIRenderModelSection *)self copyWithContainedSubmodels:v5];
  return v15;
}

- (NSDictionary)identifierToContainedSubmodelMap
{
  return self->_identifierToModelMap;
}

- (unint64_t)kind
{
  return 7;
}

- (_NSRange)viewRange
{
  NSUInteger length = self->_viewRange.length;
  NSUInteger location = self->_viewRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  [v6 visibleBounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(TUIRenderModelSection *)self frame];
  long long v15 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v53.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v53.c = v15;
  *(_OWORD *)&v53.tCGFloat x = *(_OWORD *)&a4->tx;
  CGRect v57 = CGRectApplyAffineTransform(v56, &v53);
  CGFloat x = v57.origin.x;
  CGFloat y = v57.origin.y;
  CGFloat width = v57.size.width;
  CGFloat height = v57.size.height;
  [v6 visibleBounds];
  v62.origin.CGFloat x = v20;
  v62.origin.CGFloat y = v21;
  v62.size.CGFloat width = v22;
  v62.size.CGFloat height = v23;
  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.CGFloat width = width;
  v58.size.CGFloat height = height;
  if (CGRectIntersectsRect(v58, v62))
  {
    v59.origin.CGFloat x = v8;
    v59.origin.CGFloat y = v10;
    v59.size.CGFloat width = v12;
    v59.size.CGFloat height = v14;
    if (CGRectIsInfinite(v59))
    {
      long long v51 = 0uLL;
      long long v52 = 0uLL;
      long long v49 = 0uLL;
      long long v50 = 0uLL;
      v24 = self->_viewModels;
      id v25 = [(NSArray *)v24 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v50;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v50 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            long long v29 = *(_OWORD *)&a4->c;
            v48[0] = *(_OWORD *)&a4->a;
            v48[1] = v29;
            v48[2] = *(_OWORD *)&a4->tx;
            [v28 appendResourcesToCollector:v6 transform:v48];
          }
          id v25 = [(NSArray *)v24 countByEnumeratingWithState:&v49 objects:v55 count:16];
        }
        while (v25);
      }
    }
    else
    {
      memset(&v47, 0, sizeof(v47));
      CGAffineTransformMakeTranslation(&t1, self->_offset.x, self->_offset.y);
      long long v30 = *(_OWORD *)&a4->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
      *(_OWORD *)&t2.c = v30;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a4->tx;
      CGAffineTransformConcat(&v47, &t1, &t2);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v31 = self->_viewModels;
      id v32 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v54 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v42;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v42 != v33) {
              objc_enumerationMutation(v31);
            }
            v35 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
            [v35 frame];
            v60.origin.CGFloat x = v36 + self->_offset.x;
            v60.origin.CGFloat y = v37 + self->_offset.y;
            long long v38 = *(_OWORD *)&a4->c;
            *(_OWORD *)&v40.a = *(_OWORD *)&a4->a;
            *(_OWORD *)&v40.c = v38;
            *(_OWORD *)&v40.tCGFloat x = *(_OWORD *)&a4->tx;
            CGRect v61 = CGRectApplyAffineTransform(v60, &v40);
            v63.origin.CGFloat x = v8;
            v63.origin.CGFloat y = v10;
            v63.size.CGFloat width = v12;
            v63.size.CGFloat height = v14;
            if (CGRectIntersectsRect(v61, v63))
            {
              CGAffineTransform v39 = v47;
              [v35 appendResourcesToCollector:v6 transform:&v39];
            }
          }
          id v32 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v54 count:16];
        }
        while (v32);
      }
    }
  }
}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v13 = self->_viewModels;
  id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v16);
        long long v18 = *(_OWORD *)&a4->c;
        v19[0] = *(_OWORD *)&a4->a;
        v19[1] = v18;
        v19[2] = *(_OWORD *)&a4->tx;
        [v17 appendReferencesToCollector:v10 transform:v19 query:v11 liveTransformResolver:v12];
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 1;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 1;
}

- (id)copyWithSection:(unint64_t)a3 offset:(CGPoint)a4 size:(CGSize)a5 uuid:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  double v13 = (NSUUID *)a6;
  id v14 = self;
  uint64_t v15 = v14;
  if (v14->_section != a3
    || (x == v14->_offset.x ? (BOOL v16 = y == v14->_offset.y) : (BOOL v16 = 0),
        !v16
     || (width == v14->_size.width ? (BOOL v17 = height == v14->_size.height) : (BOOL v17 = 0),
         !v17 || (UUID = v14->_UUID, UUID != v13) && ([(NSUUID *)UUID isEqual:v13] & 1) == 0)))
  {
    long long v19 = (TUIRenderModelSection *)[objc_alloc((Class)objc_opt_class()) _initWithSection:v15];

    v19->_section = a3;
    v19->_offset.double x = x;
    v19->_offset.double y = y;
    objc_storeStrong((id *)&v19->_UUID, a6);
    v19->_size.double width = width;
    v19->_size.double height = height;
    uint64_t v15 = v19;
  }

  return v15;
}

- (id)copyWithSection:(unint64_t)a3 offset:(CGPoint)a4 uuid:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v10 = (NSUUID *)a5;
  id v11 = self;
  id v12 = v11;
  if (v11->_section != a3
    || (x == v11->_offset.x ? (BOOL v13 = y == v11->_offset.y) : (BOOL v13 = 0),
        !v13 || (UUID = v11->_UUID, UUID != v10) && ([(NSUUID *)UUID isEqual:v10] & 1) == 0))
  {
    uint64_t v15 = (TUIRenderModelSection *)[objc_alloc((Class)objc_opt_class()) _initWithSection:v12];

    v15->_section = a3;
    v15->_offset.double x = x;
    v15->_offset.double y = y;
    objc_storeStrong((id *)&v15->_UUID, a5);
    id v12 = v15;
  }

  return v12;
}

- (void)updateWithSection:(unint64_t)a3 offset:(CGPoint)a4
{
  self->_section = a3;
  self->_offset = a4;
}

- (CGRect)frame
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  double width = self->_size.width;
  double height = self->_size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)_layoutAttributesForViewModel:(id)a3 index:(unint64_t)a4 withLiveTransformResolver:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [v8 outsets];
  double v46 = v10;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v8 size];
  double v18 = v17;
  [v8 size];
  double v20 = v19;
  long long v21 = +[NSIndexPath tui_indexPathForRow:a4 inSection:self->_section];
  id v22 = +[TUILayoutAttributes newLayoutAttributesWithIndexPath:v21];

  [v8 center];
  double v24 = v23;
  double v26 = v25;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  if (v8) {
    [v8 transform];
  }
  id v27 = [v8 zIndex];
  v28 = [v8 liveTransform];
  double v45 = v16;
  double v29 = v14 + v16 + v18;
  double v30 = v12 + v46 + v20;

  if (v9 && v28)
  {
    id v31 = [v9 liveLayoutAttributesForRenderModel:v8];
    [v31 size];
    double v29 = v32;
    [v31 size];
    double v30 = v33;
    if (v31)
    {
      [v31 transform];
    }
    else
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v48 = 0u;
    }
    long long v51 = v48;
    long long v52 = v49;
    long long v53 = v50;
    [v31 center];
    double v24 = v34;
    [v31 center];
    double v26 = v35;
  }
  [v8 size];
  double v37 = v36;
  [v8 size];
  double v39 = v38;
  if (self->_config.flipHorizontal) {
    double v40 = self->_config.width - (v24 + v29 * 0.5 - (v14 + v37 * 0.5));
  }
  else {
    double v40 = v24 + v29 * 0.5 - (v14 + v37 * 0.5);
  }
  [v22 setBounds:0.0, 0.0, v29, v30];
  v47[0] = v51;
  v47[1] = v52;
  v47[2] = v53;
  [v22 setTransform:v47];
  [v22 setCenter:v40, v26 + v30 * 0.5 - (v12 + v39 * 0.5)];
  [v8 alpha];
  [v22 setAlpha:];
  [v22 setZIndex:v27];
  long long v41 = [v8 submodel];
  [v22 setRenderModel:v41];

  long long v42 = [v8 refId];
  [v22 setRefId:v42];

  long long v43 = [v8 refInstance];
  [v22 setRefInstance:v43];

  [v22 setOutsets:v12, v14, v46, v45];

  return v22;
}

- (id)_layoutAttributesForImpression:(id)a3 index:(unint64_t)a4 snapshot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = +[NSIndexPath tui_indexPathForRow:a4 inSection:self->_section];
  id v11 = +[TUILayoutAttributes newLayoutAttributesWithIndexPath:v10];

  [v8 size];
  double v13 = v12;
  [v8 size];
  double v15 = v14;
  [v8 center];
  double v18 = v17;
  if (self->_config.flipHorizontal) {
    double v19 = self->_config.width - v16;
  }
  else {
    double v19 = v16;
  }
  [v11 setBounds:0.0, 0.0, v13, v15];
  if (v8)
  {
    [v8 transform];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
  }
  v24[0] = v25;
  v24[1] = v26;
  v24[2] = v27;
  [v11 setTransform:v24];
  [v11 setCenter:v19, v18];
  [v11 setZIndex:1000];
  double v20 = [v8 data];
  long long v21 = [v20 identifier];
  id v22 = [v9 impressionForIdentifier:v21];
  [v11 setGeneric:v22];

  return v11;
}

- (void)appendLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 withLiveTransformResolver:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  [(TUIRenderModelSection *)self frame];
  v32.origin.double x = x;
  v32.origin.double y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  if (CGRectIntersectsRect(v30, v32))
  {
    double v13 = self->_offset.x;
    double v14 = self->_offset.y;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v15 = self->_viewModels;
    id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      double v17 = x - v13;
      double v18 = y - v14;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v15);
          }
          long long v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v22 = [v21 liveTransform:v25];
          BOOL v23 = v22 == 0;

          if (v23)
          {
            double v24 = -[TUIRenderModelSection _layoutAttributesForViewModel:index:withLiveTransformResolver:](self, "_layoutAttributesForViewModel:index:withLiveTransformResolver:", v21, [v21 itemIndex], v12);
            [v24 frame];
            v33.origin.double x = v17;
            v33.origin.double y = v18;
            v33.size.CGFloat width = width;
            v33.size.CGFloat height = height;
            if (CGRectIntersectsRect(v31, v33)) {
              [v11 addObject:v24];
            }
          }
        }
        id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }
  }
}

- (void)appendLiveTransformLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 withLiveTransformResolver:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  double v13 = self->_offset.x;
  double v14 = self->_offset.y;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v15 = self->_viewModels;
  id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    double v17 = x - v13;
    double v18 = y - v14;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v15);
        }
        long long v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v22 = [v21 liveTransform:v25];
        BOOL v23 = v22 == 0;

        if (!v23)
        {
          double v24 = -[TUIRenderModelSection _layoutAttributesForViewModel:index:withLiveTransformResolver:](self, "_layoutAttributesForViewModel:index:withLiveTransformResolver:", v21, [v21 itemIndex], v12);
          [v24 frame];
          v31.origin.double x = v17;
          v31.origin.double y = v18;
          v31.size.CGFloat width = width;
          v31.size.CGFloat height = height;
          if (CGRectIntersectsRect(v30, v31)) {
            [v11 addObject:v24];
          }
        }
      }
      id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }
}

- (id)layoutAttributesForViewModel:(id)a3 atIndexPath:(id)a4 withLiveTransformResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[TUIRenderModelSection _layoutAttributesForViewModel:index:withLiveTransformResolver:](self, "_layoutAttributesForViewModel:index:withLiveTransformResolver:", v8, objc_msgSend(v9, "tui_row"), v10);

  return v11;
}

- (id)layoutAttributes
{
  v3 = objc_opt_new();
  [(TUIRenderModelSection *)self frame];
  -[TUIRenderModelSection appendLayoutAttributes:forElementsInRect:withLiveTransformResolver:](self, "appendLayoutAttributes:forElementsInRect:withLiveTransformResolver:", v3, 0);
  [(TUIRenderModelSection *)self frame];
  -[TUIRenderModelSection appendLiveTransformLayoutAttributes:forElementsInRect:withLiveTransformResolver:](self, "appendLiveTransformLayoutAttributes:forElementsInRect:withLiveTransformResolver:", v3, 0);
  id v4 = [v3 copy];

  return v4;
}

- (void)appendImpressionLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 snapshot:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (+[TUIImpressionController debugEnabled])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = self->_impressions;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      uint64_t v12 = 1000000000;
      do
      {
        double v13 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          double v14 = -[TUIRenderModelSection _layoutAttributesForImpression:index:snapshot:](self, "_layoutAttributesForImpression:index:snapshot:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v13), (char *)v13 + v12, v8, (void)v15);
          [v7 addObject:v14];

          double v13 = (char *)v13 + 1;
        }
        while (v10 != v13);
        id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v12 += (uint64_t)v13;
      }
      while (v10);
    }
  }
}

- (id)layoutAttributesForImpressionAtIndexPath:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[TUIImpressionController debugEnabled]
    && (unint64_t)objc_msgSend(v6, "tui_row") >= 0x3B9ACA00
    && (id v8 = (char *)objc_msgSend(v6, "tui_row"), v8 - 1000000000 < (char *)-[NSArray count](self->_impressions, "count")))
  {
    id v9 = -[NSArray objectAtIndexedSubscript:](self->_impressions, "objectAtIndexedSubscript:");
    id v10 = -[TUIRenderModelSection _layoutAttributesForImpression:index:snapshot:](self, "_layoutAttributesForImpression:index:snapshot:", v9, objc_msgSend(v6, "tui_row"), v7);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)layoutAttributesForViewAtIndexPath:(id)a3 withLiveTransformResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [v8 tui_row];
  left = (char *)self->_viewMap.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_12;
  }
  p_pair1 = (TUIRenderModelSection *)&self->_viewMap.__tree_.__pair1_;
  do
  {
    unint64_t v12 = *((void *)left + 4);
    BOOL v13 = v12 >= (unint64_t)v9;
    if (v12 >= (unint64_t)v9) {
      double v14 = (char **)left;
    }
    else {
      double v14 = (char **)(left + 8);
    }
    if (v13) {
      p_pair1 = (TUIRenderModelSection *)left;
    }
    left = *v14;
  }
  while (*v14);
  if (p_pair1 != (TUIRenderModelSection *)&self->_viewMap.__tree_.__pair1_
    && (unint64_t)v9 >= p_pair1->_viewRange.length)
  {
    unint64_t begin_node = (unint64_t)p_pair1->_viewMap.__tree_.__begin_node_;
  }
  else
  {
LABEL_12:
    unint64_t begin_node = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (begin_node >= [(NSArray *)self->_viewModels count])
  {
    long long v16 = 0;
  }
  else
  {
    long long v16 = [(NSArray *)self->_viewModels objectAtIndexedSubscript:begin_node];
    if (v16)
    {
      long long v17 = -[TUIRenderModelSection _layoutAttributesForViewModel:index:withLiveTransformResolver:](self, "_layoutAttributesForViewModel:index:withLiveTransformResolver:", v16, [v8 tui_row], v7);
      goto LABEL_18;
    }
  }
  long long v17 = 0;
LABEL_18:

  return v17;
}

- (id)viewAtIndexPath:(id)a3 factory:(id)a4 host:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)objc_msgSend(v8, "tui_row") > 0x3B9AC9FF)
  {
    double v14 = [v9 viewFactoryDequeueReusableSubviewWithReuseIdentifier:@"TUIReuseIdentifierImpressionOverlayView" indexPath:v8 host:v10];
  }
  else
  {
    uint64_t v11 = -[TUIRenderModelSection viewModelWithIndex:[v8 tui_row]];
    unint64_t v12 = [v11 submodel];
    BOOL v13 = [v12 reuseIdentifier];

    double v14 = [v9 viewFactoryDequeueReusableSubviewWithReuseIdentifier:v13 indexPath:v8 host:v10];
  }

  return v14;
}

- (id)viewModelWithIndex:(unint64_t)a3
{
  left = (char *)self->_viewMap.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_12;
  }
  p_pair1 = (TUIRenderModelSection *)&self->_viewMap.__tree_.__pair1_;
  do
  {
    unint64_t v6 = *((void *)left + 4);
    BOOL v7 = v6 >= a3;
    if (v6 >= a3) {
      id v8 = (char **)left;
    }
    else {
      id v8 = (char **)(left + 8);
    }
    if (v7) {
      p_pair1 = (TUIRenderModelSection *)left;
    }
    left = *v8;
  }
  while (*v8);
  if (p_pair1 != (TUIRenderModelSection *)&self->_viewMap.__tree_.__pair1_ && p_pair1->_viewRange.length <= a3) {
    unint64_t begin_node = (unint64_t)p_pair1->_viewMap.__tree_.__begin_node_;
  }
  else {
LABEL_12:
  }
    unint64_t begin_node = 0x7FFFFFFFFFFFFFFFLL;
  if (begin_node >= [(NSArray *)self->_viewModels count])
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [(NSArray *)self->_viewModels objectAtIndexedSubscript:begin_node];
  }

  return v10;
}

- (id)viewModelForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [-self viewModelWithIndex:[v4 tui_row]];

  return v5;
}

- (id)identifierForViewAtIndex:(unint64_t)a3
{
  id v4 = [(TUIRenderModelSection *)self viewModelWithIndex:a3];
  id v5 = [v4 identifier];
  unint64_t v6 = [(TUIRenderModelSection *)self UUID];
  BOOL v7 = [v5 tui_identifierByPrependingUUID:v6];

  return v7;
}

- (id)_initialRenderModelForInsertedRenderModel:(id)a3
{
  id v3 = [a3 copyWithAlpha:0.0];

  return v3;
}

- (id)_finalRenderModelForDeletedRenderModel:(id)a3
{
  id v3 = [a3 copyWithAlpha:0.0];

  return v3;
}

- (id)computeDeletedFrom:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewModels:v4];
  viewModels = self->_viewModels;
  id v25 = v5;
  long long v26 = viewModels;
  id v27 = v4;
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](v26, "count")];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v26;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        BOOL v13 = [v12 identifier];
        [v7 setObject:v12 forKeyedSubscript:v13];
      }
      id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v25;
  long long v15 = 0;
  id v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v29;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        double v20 = [v19 identifier];
        long long v21 = [v7 objectForKeyedSubscript:v20];

        if (!v21)
        {
          if (!v15) {
            long long v15 = objc_opt_new();
          }
          id v22 = [v27 _finalRenderModelForDeletedRenderModel:v19];
          [v15 addObject:v22];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
  }

  id v23 = [v15 copy];

  return v23;
}

- (id)computeInsertedFrom:(id)a3
{
  id v25 = a3;
  id v4 = [v25 viewModels];
  viewModels = self->_viewModels;
  id v27 = v4;
  unint64_t v6 = viewModels;
  long long v28 = self;
  long long v26 = v6;
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](v6, "count")];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v27;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        BOOL v13 = [v12 identifier];
        [v7 setObject:v12 forKeyedSubscript:v13];
      }
      id v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v26;
  long long v15 = 0;
  id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v30;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
        double v20 = [v19 identifier];
        long long v21 = [v7 objectForKeyedSubscript:v20];

        if (!v21)
        {
          if (!v15) {
            long long v15 = objc_opt_new();
          }
          id v22 = [(TUIRenderModelSection *)v28 _initialRenderModelForInsertedRenderModel:v19];
          [v15 addObject:v22];
        }
      }
      id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v16);
  }

  id v23 = [v15 copy];

  return v23;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [[TUIRenderUpdateArrayContainer alloc] initWithCurrent:v10 from:v11 to:self tracker:v12 flags:a6];

  return v13;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  return [a3 newToContainerPlusDeletedWithInterests:a4 changes:0];
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  return [a4 newCurrentContainerPlusInserted:a3];
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = TUIDynamicCast(v5, v4);
  LOBYTE(self) = TUIRenderModelArrayContainingIsEqualToRenderModelArrayContaining(self, v6);

  return (char)self;
}

- (unint64_t)hash
{
  v2 = [(TUIRenderModelSection *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" UUID=%@", self->_UUID];
  id v7 = +[NSNumber numberWithUnsignedInteger:self->_section];
  [v6 appendFormat:@" section=%@", v7];

  id v8 = NSStringFromCGPoint(self->_offset);
  [v6 appendFormat:@" offset=%@", v8];

  id v9 = NSStringFromCGSize(self->_size);
  [v6 appendFormat:@" size=%@", v9];

  [v6 appendFormat:@" viewModels=%@", self->_viewModels];
  [v6 appendFormat:@">"];
  id v10 = [v6 copy];

  return (NSString *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithSection:", self);
  *((void *)v4 + 17) = self->_section;
  objc_storeStrong((id *)v4 + 16, self->_UUID);
  return v4;
}

- (id)liveTransformsForKind:(Class)a3
{
  id v5 = objc_alloc_init((Class)NSHashTable);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_viewModels;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v10 liveTransform:v16];
        if (v11)
        {
          id v12 = [v10 liveTransform];
          BOOL v13 = [v12 kind] == a3;

          if (v13)
          {
            id v14 = [v10 liveTransform];
            [v5 addObject:v14];
          }
        }
      }
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void)appendLiveTransformViewInvalidationMap:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_viewModels;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 liveTransform];
        BOOL v11 = v10 == 0;

        if (!v11)
        {
          id v12 = +[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", [v9 itemIndex], self->_section);
          BOOL v13 = [v9 liveTransform];
          id v14 = [v4 objectForKey:v13];
          if (!v14)
          {
            id v14 = objc_opt_new();
            [v4 setObject:v14 forKey:v13];
          }
          [v14 addObject:v12];
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSArray)containedSubmodels
{
  return self->_containedSubmodels;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[5].d;
  long long v4 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = v4;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tdouble x = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (TUIAnimationGroupRenderModelCollection)animationRenderModels
{
  return self->_animationRenderModels;
}

- (void)setAnimationRenderModels:(id)a3
{
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (unint64_t)section
{
  return self->_section;
}

- (BOOL)containsLiveTransforms
{
  return self->_containsLiveTransforms;
}

- (TUIRenderModelIdentifierInterest)identifierInterest
{
  return self->_identifierInterest;
}

- (NSArray)impressions
{
  return self->_impressions;
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (NSDictionary)hoverRegions
{
  return self->_hoverRegions;
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (NSDictionary)identifierToModelMap
{
  return self->_identifierToModelMap;
}

- (TUIRenderModelIdentifierMap)identifierMap
{
  return self->_identifierMap;
}

- ($2CA2891FAFAFF7AC585D88E48F4DD71B)config
{
  *($7AF9110C763A695B008BC8833C72FFC6 *)retstr = *($7AF9110C763A695B008BC8833C72FFC6 *)((char *)self + 224);
  return self;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_identifierToModelMap, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_hoverRegions, 0);
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_impressions, 0);
  objc_storeStrong((id *)&self->_identifierInterest, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_animationRenderModels, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_containedSubmodels, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  left = self->_viewMap.__tree_.__pair1_.__value_.__left_;

  sub_9F928((uint64_t)&self->_viewMap, left);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 5) = (char *)self + 48;
  return self;
}

@end