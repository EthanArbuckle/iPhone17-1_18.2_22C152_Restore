@interface TUIRenderModelCollection
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGRect)boundingRectForMatchingQuery:(id)a3 viewState:(id)a4;
- (CGSize)size;
- (NSArray)debugContainedSubmodels;
- (NSArray)sections;
- (NSArray)uids;
- (NSArray)visibleBoundsObservers;
- (NSDictionary)info;
- (NSMapTable)liveTransformViewInvalidationMap;
- (NSString)description;
- (NSString)matchingSectionUID;
- (NSUUID)matchingSectionUUID;
- (TUIAnchorSet)anchorSet;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIFeedContent)content;
- (TUIIdentifier)identifier;
- (TUIRenderModelCollection)initWithContent:(id)a3 sections:(id)a4 size:(CGSize)a5 insets:(UIEdgeInsets)a6 visibleBoundsObservers:(id)a7 info:(id)a8 anchorSet:(id)a9 layoutDirection:(unint64_t)a10 matchingUUID:(id)a11 matchingUID:(id)a12;
- (TUIRenderModelCollection)initWithOther:(id)a3;
- (UIEdgeInsets)insets;
- (id)identifierForViewAtIndexPath:(id)a3;
- (id)layoutAttributes;
- (id)layoutAttributesForImpressionAtIndexPath:(id)a3 snapshot:(id)a4;
- (id)layoutAttributesForViewAtIndexPath:(id)a3 withLiveTransformResolver:(id)a4;
- (id)sectionForIndexPath:(id)a3;
- (id)viewAtIndexPath:(id)a3 factory:(id)a4 host:(id)a5;
- (id)viewModelWithIndexPath:(id)a3;
- (unint64_t)hash;
- (unint64_t)kind;
- (unint64_t)layoutDirection;
- (unint64_t)numberOfSections;
- (void)appendImpressionLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 snapshot:(id)a5;
- (void)appendLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 withLiveTransformResolver:(id)a5;
- (void)appendLiveTransformViewInvalidationMap:(id)a3;
- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)invalidateRenderOverride:(id)a3 flags:(unint64_t)a4 feedView:(id)a5 uids:(id)a6;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)updateVisibleBounds:(CGRect)a3;
@end

@implementation TUIRenderModelCollection

- (TUIRenderModelCollection)initWithContent:(id)a3 sections:(id)a4 size:(CGSize)a5 insets:(UIEdgeInsets)a6 visibleBoundsObservers:(id)a7 info:(id)a8 anchorSet:(id)a9 layoutDirection:(unint64_t)a10 matchingUUID:(id)a11 matchingUID:(id)a12
{
  CGFloat right = a6.right;
  CGFloat bottom = a6.bottom;
  CGFloat left = a6.left;
  CGFloat top = a6.top;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v25 = a3;
  id v26 = a4;
  id v27 = a7;
  id v28 = a8;
  id v29 = a9;
  id v30 = a11;
  id v31 = a12;
  v49.receiver = self;
  v49.super_class = (Class)TUIRenderModelCollection;
  v32 = [(TUIRenderModelCollection *)&v49 init];
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_content, a3);
    v34 = (NSArray *)[v26 copy];
    sections = v33->_sections;
    v33->_sections = v34;

    v33->_sectionCount = [(NSArray *)v33->_sections count];
    v33->_size.CGFloat width = width;
    v33->_size.CGFloat height = height;
    v36 = (NSArray *)[v27 copy];
    visibleBoundsObservers = v33->_visibleBoundsObservers;
    v33->_visibleBoundsObservers = v36;

    v33->_insets.CGFloat top = top;
    v33->_insets.CGFloat left = left;
    v33->_insets.CGFloat bottom = bottom;
    v33->_insets.CGFloat right = right;
    v38 = (NSDictionary *)[v28 copy];
    info = v33->_info;
    v33->_info = v38;

    v40 = (TUIAnchorSet *)[v29 copy];
    anchorSet = v33->_anchorSet;
    v33->_anchorSet = v40;

    v33->_layoutDirection = a10;
    v42 = (NSUUID *)[v30 copy];
    matchingSectionUUID = v33->_matchingSectionUUID;
    v33->_matchingSectionUUID = v42;

    v44 = (NSString *)[v31 copy];
    matchingSectionUID = v33->_matchingSectionUID;
    v33->_matchingSectionUID = v44;

    uint64_t v46 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:0];
    [(TUIRenderModelCollection *)v33 appendLiveTransformViewInvalidationMap:v46];
    liveTransformViewInvalidationMap = v33->_liveTransformViewInvalidationMap;
    v33->_liveTransformViewInvalidationMap = (NSMapTable *)v46;
  }
  return v33;
}

- (NSArray)debugContainedSubmodels
{
  return self->_sections;
}

- (TUIRenderModelCollection)initWithOther:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TUIRenderModelCollection;
  v5 = [(TUIRenderModelCollection *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 content];
    content = v5->_content;
    v5->_content = (TUIFeedContent *)v6;

    uint64_t v8 = [v4 sections];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v8;

    v5->_sectionCount = [(NSArray *)v5->_sections count];
    [v4 size];
    v5->_size.CGFloat width = v10;
    v5->_size.CGFloat height = v11;
    uint64_t v12 = [v4 visibleBoundsObservers];
    visibleBoundsObservers = v5->_visibleBoundsObservers;
    v5->_visibleBoundsObservers = (NSArray *)v12;

    [v4 insets];
    v5->_insets.CGFloat top = v14;
    v5->_insets.CGFloat left = v15;
    v5->_insets.CGFloat bottom = v16;
    v5->_insets.CGFloat right = v17;
    uint64_t v18 = [v4 info];
    info = v5->_info;
    v5->_info = (NSDictionary *)v18;

    uint64_t v20 = [v4 anchorSet];
    anchorSet = v5->_anchorSet;
    v5->_anchorSet = (TUIAnchorSet *)v20;

    uint64_t v22 = [v4 liveTransformViewInvalidationMap];
    liveTransformViewInvalidationMap = v5->_liveTransformViewInvalidationMap;
    v5->_liveTransformViewInvalidationMap = (NSMapTable *)v22;

    uint64_t v24 = [v4 matchingSectionUUID];
    matchingSectionUUID = v5->_matchingSectionUUID;
    v5->_matchingSectionUUID = (NSUUID *)v24;

    uint64_t v26 = [v4 matchingSectionUID];
    matchingSectionUID = v5->_matchingSectionUID;
    v5->_matchingSectionUID = (NSString *)v26;
  }
  return v5;
}

- (unint64_t)kind
{
  return 8;
}

- (NSArray)uids
{
  return (NSArray *)[(NSArray *)self->_sections valueForKeyPath:@"entry.uid"];
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = self->_sections;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      CGFloat v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        long long v13 = *(_OWORD *)&a4->c;
        v14[0] = *(_OWORD *)&a4->a;
        v14[1] = v13;
        v14[2] = *(_OWORD *)&a4->tx;
        [v12 appendResourcesToCollector:v6 transform:v14];
        CGFloat v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v13 = [(TUIRenderModelCollection *)self uids];
  sections = self->_sections;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  long long v15 = *(_OWORD *)&a4->c;
  long long v25 = *(_OWORD *)&a4->a;
  long long v26 = v15;
  v20[2] = sub_5CDC0;
  v20[3] = &unk_253120;
  v20[4] = self;
  id v21 = v13;
  long long v27 = *(_OWORD *)&a4->tx;
  id v22 = v11;
  id v23 = v10;
  id v24 = v12;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  id v19 = v13;
  [(NSArray *)sections enumerateObjectsUsingBlock:v20];
}

- (void)updateVisibleBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_layoutDirection == 2)
  {
    double v8 = self->_size.width;
    double x = v8 - CGRectGetMinX(a3) - a3.size.width;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = self->_visibleBoundsObservers;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) visibleBoundsUpdated:x, y, width, height, (void)v14];
      }
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)appendLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 withLiveTransformResolver:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v13 = self->_sections;
  id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v18 appendLayoutAttributes:v11 forElementsInRect:v12 withLiveTransformResolver:x, y, width, height, v19];
        [v18 appendLiveTransformLayoutAttributes:v11 forElementsInRect:v12 withLiveTransformResolver:x, y, width, height];
      }
      id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (id)layoutAttributesForViewAtIndexPath:(id)a3 withLiveTransformResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 tui_section];
  if ((unint64_t)v8 >= self->_sectionCount)
  {
    id v10 = 0;
  }
  else
  {
    id v9 = [(NSArray *)self->_sections objectAtIndexedSubscript:v8];
    id v10 = [v9 layoutAttributesForViewAtIndexPath:v6 withLiveTransformResolver:v7];
  }

  return v10;
}

- (id)layoutAttributes
{
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_sections;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) layoutAttributes:v12];
        [v3 addObjectsFromArray:v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return v10;
}

- (id)viewAtIndexPath:(id)a3 factory:(id)a4 host:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 tui_section];
  if ((unint64_t)v11 >= self->_sectionCount)
  {
    long long v13 = 0;
  }
  else
  {
    long long v12 = [(NSArray *)self->_sections objectAtIndexedSubscript:v11];
    long long v13 = [v12 viewAtIndexPath:v8 factory:v9 host:v10];
  }

  return v13;
}

- (void)appendImpressionLayoutAttributes:(id)a3 forElementsInRect:(CGRect)a4 snapshot:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_sections;
  id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      long long v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)v17) appendImpressionLayoutAttributes:v11 forElementsInRect:v12 snapshot:x, y, width, height, (void)v18];
        long long v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (id)layoutAttributesForImpressionAtIndexPath:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 tui_section];
  if ((unint64_t)v8 >= self->_sectionCount)
  {
    id v10 = 0;
  }
  else
  {
    id v9 = [(NSArray *)self->_sections objectAtIndexedSubscript:v8];
    id v10 = [v9 layoutAttributesForImpressionAtIndexPath:v6 snapshot:v7];
  }

  return v10;
}

- (unint64_t)numberOfSections
{
  return self->_sectionCount;
}

- (id)viewModelWithIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tui_section];
  if ((unint64_t)v5 >= self->_sectionCount)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_sections objectAtIndexedSubscript:v5];
    id v7 = [v6 viewModelWithIndex:[v4 tui_row]];
  }

  return v7;
}

- (id)sectionForIndexPath:(id)a3
{
  id v4 = [a3 tui_section];
  if ((unint64_t)v4 >= self->_sectionCount)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_sections objectAtIndexedSubscript:v4];
  }

  return v5;
}

- (id)identifierForViewAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tui_section];
  if ((unint64_t)v5 >= self->_sectionCount)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_sections objectAtIndexedSubscript:v5];
    id v7 = [v6 identifierForViewAtIndex:[v4 tui_row]];
  }

  return v7;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = TUIDynamicCast(v5, v4);

  if (!TUIRenderModelIsEqualToRenderModel(self, v6)) {
    goto LABEL_13;
  }
  id v7 = [(TUIRenderModelCollection *)self layoutDirection];
  if (v7 != [v6 layoutDirection]) {
    goto LABEL_13;
  }
  [(TUIRenderModelCollection *)self insets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [v6 insets];
  BOOL v20 = v11 == v19 && v9 == v16;
  BOOL v21 = v20 && v15 == v18;
  if (v21 && v13 == v17)
  {
    long long v25 = [(TUIRenderModelCollection *)self sections];
    long long v26 = [v6 sections];
    if (v25 == v26 || ([(TUIFeedContent *)v25 isEqual:v26] & 1) != 0)
    {

      content = self->_content;
      long long v25 = [v6 content];
      BOOL v23 = content == v25;
    }
    else
    {

      BOOL v23 = 0;
    }
  }
  else
  {
LABEL_13:
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 1;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 1;
}

- (void)appendLiveTransformViewInvalidationMap:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_sections;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) appendLiveTransformViewInvalidationMap:v4 v10];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)invalidateRenderOverride:(id)a3 flags:(unint64_t)a4 feedView:(id)a5 uids:(id)a6
{
  id v9 = a3;
  id v36 = a5;
  id v37 = a6;
  v35 = v9;
  uint64_t v46 = [v9 query];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v10 = self->_sections;
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (!v11)
  {
    long long v13 = (TUIFeedViewInvalidationContext *)v10;
    goto LABEL_30;
  }
  id v12 = v11;
  long long v13 = 0;
  uint64_t v14 = *(void *)v52;
  v39 = v10;
  v40 = self;
  uint64_t v38 = *(void *)v52;
  do
  {
    double v15 = 0;
    id v41 = v12;
    do
    {
      if (*(void *)v52 != v14) {
        objc_enumerationMutation(v10);
      }
      double v16 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v15);
      matchingSectionUUID = self->_matchingSectionUUID;
      if (matchingSectionUUID)
      {
        double v18 = matchingSectionUUID;
      }
      else
      {
        double v18 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)v15) UUID];
      }
      double v19 = v18;
      id v20 = [v16 section];
      matchingSectionUID = self->_matchingSectionUID;
      if (matchingSectionUID)
      {
        long long v22 = matchingSectionUID;
      }
      else
      {
        long long v22 = [v37 objectAtIndexedSubscript:v20];
      }
      BOOL v23 = v22;
      if ([v46 matchesUUID:v19 uid:v22])
      {
        v42 = v23;
        v43 = v19;
        v44 = v15;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id obj = [v16 viewModels];
        id v24 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v24)
        {
          id v25 = v24;
          id v26 = v20;
          uint64_t v27 = *(void *)v48;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v48 != v27) {
                objc_enumerationMutation(obj);
              }
              objc_super v29 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              id v30 = [v29 refId];
              id v31 = [v29 refInstance];
              v32 = [v29 identifier];
              unsigned int v33 = [v46 matchesRefId:v30 refInstance:v31 identifier:v32];

              if (v33)
              {
                if (!v13) {
                  long long v13 = objc_alloc_init(TUIFeedViewInvalidationContext);
                }
                v34 = +[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", [v29 itemIndex], v26);
                [(TUIFeedViewInvalidationContext *)v13 invalidateIndexPath:v34];
              }
            }
            id v25 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v25);
        }

        long long v10 = v39;
        self = v40;
        uint64_t v14 = v38;
        id v12 = v41;
        BOOL v23 = v42;
        double v19 = v43;
        double v15 = v44;
      }

      double v15 = (char *)v15 + 1;
    }
    while (v15 != v12);
    id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v51 objects:v56 count:16];
  }
  while (v12);

  if (v13)
  {
    [v36 invalidateWithContext:v13];
LABEL_30:
  }
}

- (CGRect)boundingRectForMatchingQuery:(id)a3 viewState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[TUIRenderReferenceCollector referenceCollectorWithViewState:v7];
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v25 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v26 = v9;
  CGPoint origin = *(CGPoint *)&CGAffineTransformIdentity.tx;
  [(TUIRenderModelCollection *)self appendReferencesToCollector:v8 transform:&v25 query:v6 liveTransformResolver:0];
  long long v10 = [v8 renderReferences];
  id v11 = [v10 count];

  if (v11)
  {
    *(void *)&long long v25 = 0;
    *((void *)&v25 + 1) = &v25;
    *(void *)&long long v26 = 0x4010000000;
    *((void *)&v26 + 1) = "";
    CGSize size = CGRectNull.size;
    CGPoint origin = CGRectNull.origin;
    CGSize v28 = size;
    long long v13 = [v8 renderReferences];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_5DF68;
    v24[3] = &unk_253170;
    v24[4] = &v25;
    [v13 enumerateKeysAndObjectsUsingBlock:v24];

    if (self->_layoutDirection == 2)
    {
      [(TUIRenderModelCollection *)self size];
      double x = v14 - CGRectGetMaxX(*(CGRect *)(*((void *)&v25 + 1) + 32));
      double v16 = (double *)*((void *)&v25 + 1);
      *(double *)(*((void *)&v25 + 1) + 32) = x;
    }
    else
    {
      double v16 = (double *)*((void *)&v25 + 1);
      double x = *(double *)(*((void *)&v25 + 1) + 32);
    }
    CGFloat y = v16[5];
    CGFloat width = v16[6];
    CGFloat height = v16[7];
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    double x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.double x = v20;
  return result;
}

- (unint64_t)hash
{
  v2 = [(TUIRenderModelCollection *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ %p", v5, self];

  id v7 = NSStringFromCGSize(self->_size);
  [v6 appendFormat:@" size=%@", v7];

  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:self->_sectionCount];
  [v6 appendFormat:@" sectionCount=%@", v8];

  [v6 appendFormat:@" sections=%@", self->_sections];
  [v6 appendFormat:@">"];
  id v9 = [v6 copy];

  return (NSString *)v9;
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
  self->_CGSize size = a3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (TUIFeedContent)content
{
  return self->_content;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSArray)sections
{
  return self->_sections;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSArray)visibleBoundsObservers
{
  return self->_visibleBoundsObservers;
}

- (NSDictionary)info
{
  return self->_info;
}

- (TUIAnchorSet)anchorSet
{
  return self->_anchorSet;
}

- (NSUUID)matchingSectionUUID
{
  return self->_matchingSectionUUID;
}

- (NSString)matchingSectionUID
{
  return self->_matchingSectionUID;
}

- (NSMapTable)liveTransformViewInvalidationMap
{
  return self->_liveTransformViewInvalidationMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveTransformViewInvalidationMap, 0);
  objc_storeStrong((id *)&self->_matchingSectionUID, 0);
  objc_storeStrong((id *)&self->_matchingSectionUUID, 0);
  objc_storeStrong((id *)&self->_anchorSet, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_visibleBoundsObservers, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end